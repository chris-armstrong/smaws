open Smaws_Lib.Json.SerializeHelpers
open Types

let accept_action_to_yojson (x : accept_action) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let action_failure_policy_to_yojson (x : action_failure_policy) =
  match x with CONTINUE -> `String "CONTINUE" | DROP -> `String "DROP"

let header_value_to_yojson = string_to_yojson
let header_name_to_yojson = string_to_yojson

let add_header_action_to_yojson (x : add_header_action) =
  assoc_to_yojson
    [
      ("HeaderName", Some (header_name_to_yojson x.header_name));
      ("HeaderValue", Some (header_value_to_yojson x.header_value));
    ]

let addon_instance_arn_to_yojson = string_to_yojson
let addon_name_to_yojson = string_to_yojson
let addon_subscription_id_to_yojson = string_to_yojson
let addon_instance_id_to_yojson = string_to_yojson

let addon_instance_to_yojson (x : addon_instance) =
  assoc_to_yojson
    [
      ("AddonInstanceId", option_to_yojson addon_instance_id_to_yojson x.addon_instance_id);
      ( "AddonSubscriptionId",
        option_to_yojson addon_subscription_id_to_yojson x.addon_subscription_id );
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ("AddonInstanceArn", option_to_yojson addon_instance_arn_to_yojson x.addon_instance_arn);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let addon_instances_to_yojson tree = list_to_yojson addon_instance_to_yojson tree
let addon_subscription_arn_to_yojson = string_to_yojson

let addon_subscription_to_yojson (x : addon_subscription) =
  assoc_to_yojson
    [
      ( "AddonSubscriptionId",
        option_to_yojson addon_subscription_id_to_yojson x.addon_subscription_id );
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ( "AddonSubscriptionArn",
        option_to_yojson addon_subscription_arn_to_yojson x.addon_subscription_arn );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let addon_subscriptions_to_yojson tree = list_to_yojson addon_subscription_to_yojson tree
let address_to_yojson = string_to_yojson
let address_prefix_to_yojson = string_to_yojson

let address_filter_to_yojson (x : address_filter) =
  assoc_to_yojson [ ("AddressPrefix", option_to_yojson address_prefix_to_yojson x.address_prefix) ]

let address_list_name_to_yojson = string_to_yojson
let address_list_arn_to_yojson = string_to_yojson
let address_list_id_to_yojson = string_to_yojson

let address_list_to_yojson (x : address_list) =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("AddressListArn", Some (address_list_arn_to_yojson x.address_list_arn));
      ("AddressListName", Some (address_list_name_to_yojson x.address_list_name));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "LastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
    ]

let address_lists_to_yojson tree = list_to_yojson address_list_to_yojson tree
let address_page_size_to_yojson = int_to_yojson
let result_field_to_yojson = string_to_yojson
let analyzer_arn_to_yojson = string_to_yojson

let analysis_to_yojson (x : analysis) =
  assoc_to_yojson
    [
      ("Analyzer", Some (analyzer_arn_to_yojson x.analyzer));
      ("ResultField", Some (result_field_to_yojson x.result_field));
    ]

let archive_state_to_yojson (x : archive_state) =
  match x with ACTIVE -> `String "ACTIVE" | PENDING_DELETION -> `String "PENDING_DELETION"

let archive_name_string_to_yojson = string_to_yojson
let archive_id_string_to_yojson = string_to_yojson

let archive_to_yojson (x : archive) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id));
      ("ArchiveName", option_to_yojson archive_name_string_to_yojson x.archive_name);
      ("ArchiveState", option_to_yojson archive_state_to_yojson x.archive_state);
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let name_or_arn_to_yojson = string_to_yojson

let archive_action_to_yojson (x : archive_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("TargetArchive", Some (name_or_arn_to_yojson x.target_archive));
    ]

let archive_arn_to_yojson = string_to_yojson

let archive_boolean_email_attribute_to_yojson (x : archive_boolean_email_attribute) =
  match x with HAS_ATTACHMENTS -> `String "HAS_ATTACHMENTS"

let archive_boolean_operator_to_yojson (x : archive_boolean_operator) =
  match x with IS_TRUE -> `String "IS_TRUE" | IS_FALSE -> `String "IS_FALSE"

let archive_boolean_to_evaluate_to_yojson (x : archive_boolean_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (archive_boolean_email_attribute_to_yojson arg)) ]

let archive_boolean_expression_to_yojson (x : archive_boolean_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (archive_boolean_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (archive_boolean_operator_to_yojson x.operator));
    ]

let string_value_to_yojson = string_to_yojson
let string_value_list_to_yojson tree = list_to_yojson string_value_to_yojson tree

let archive_string_operator_to_yojson (x : archive_string_operator) =
  match x with CONTAINS -> `String "CONTAINS"

let archive_string_email_attribute_to_yojson (x : archive_string_email_attribute) =
  match x with
  | TO -> `String "TO"
  | FROM -> `String "FROM"
  | CC -> `String "CC"
  | SUBJECT -> `String "SUBJECT"
  | ENVELOPE_TO -> `String "ENVELOPE_TO"
  | ENVELOPE_FROM -> `String "ENVELOPE_FROM"

let archive_string_to_evaluate_to_yojson (x : archive_string_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (archive_string_email_attribute_to_yojson arg)) ]

let archive_string_expression_to_yojson (x : archive_string_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (archive_string_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (archive_string_operator_to_yojson x.operator));
      ("Values", Some (string_value_list_to_yojson x.values));
    ]

let archive_filter_condition_to_yojson (x : archive_filter_condition) =
  match x with
  | StringExpression arg ->
      assoc_to_yojson [ ("StringExpression", Some (archive_string_expression_to_yojson arg)) ]
  | BooleanExpression arg ->
      assoc_to_yojson [ ("BooleanExpression", Some (archive_boolean_expression_to_yojson arg)) ]

let archive_filter_conditions_to_yojson tree =
  list_to_yojson archive_filter_condition_to_yojson tree

let archive_filters_to_yojson (x : archive_filters) =
  assoc_to_yojson
    [
      ("Include", option_to_yojson archive_filter_conditions_to_yojson x.include_);
      ("Unless", option_to_yojson archive_filter_conditions_to_yojson x.unless);
    ]

let archive_id_to_yojson = string_to_yojson

let retention_period_to_yojson (x : retention_period) =
  match x with
  | THREE_MONTHS -> `String "THREE_MONTHS"
  | SIX_MONTHS -> `String "SIX_MONTHS"
  | NINE_MONTHS -> `String "NINE_MONTHS"
  | ONE_YEAR -> `String "ONE_YEAR"
  | EIGHTEEN_MONTHS -> `String "EIGHTEEN_MONTHS"
  | TWO_YEARS -> `String "TWO_YEARS"
  | THIRTY_MONTHS -> `String "THIRTY_MONTHS"
  | THREE_YEARS -> `String "THREE_YEARS"
  | FOUR_YEARS -> `String "FOUR_YEARS"
  | FIVE_YEARS -> `String "FIVE_YEARS"
  | SIX_YEARS -> `String "SIX_YEARS"
  | SEVEN_YEARS -> `String "SEVEN_YEARS"
  | EIGHT_YEARS -> `String "EIGHT_YEARS"
  | NINE_YEARS -> `String "NINE_YEARS"
  | TEN_YEARS -> `String "TEN_YEARS"
  | PERMANENT -> `String "PERMANENT"

let archive_retention_to_yojson (x : archive_retention) =
  match x with
  | RetentionPeriod arg ->
      assoc_to_yojson [ ("RetentionPeriod", Some (retention_period_to_yojson arg)) ]

let archived_message_id_to_yojson = string_to_yojson
let archives_list_to_yojson tree = list_to_yojson archive_to_yojson tree
let bounce_message_to_yojson = string_to_yojson
let diagnostic_message_to_yojson = string_to_yojson
let smtp_reply_code_to_yojson = string_to_yojson
let status_code_to_yojson = string_to_yojson
let email_address_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson

let bounce_action_to_yojson (x : bounce_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("Sender", Some (email_address_to_yojson x.sender));
      ("StatusCode", Some (status_code_to_yojson x.status_code));
      ("SmtpReplyCode", Some (smtp_reply_code_to_yojson x.smtp_reply_code));
      ("DiagnosticMessage", Some (diagnostic_message_to_yojson x.diagnostic_message));
      ("Message", option_to_yojson bounce_message_to_yojson x.message);
    ]

let ca_content_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_addon_instance_response_to_yojson (x : create_addon_instance_response) =
  assoc_to_yojson [ ("AddonInstanceId", Some (addon_instance_id_to_yojson x.addon_instance_id)) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let idempotency_token_to_yojson = string_to_yojson

let create_addon_instance_request_to_yojson (x : create_addon_instance_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_addon_subscription_response_to_yojson (x : create_addon_subscription_response) =
  assoc_to_yojson
    [ ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id)) ]

let create_addon_subscription_request_to_yojson (x : create_addon_subscription_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AddonName", Some (addon_name_to_yojson x.addon_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_address_list_response_to_yojson (x : create_address_list_response) =
  assoc_to_yojson [ ("AddressListId", Some (address_list_id_to_yojson x.address_list_id)) ]

let create_address_list_request_to_yojson (x : create_address_list_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AddressListName", Some (address_list_name_to_yojson x.address_list_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let pre_signed_url_to_yojson = string_to_yojson
let job_id_to_yojson = string_to_yojson

let create_address_list_import_job_response_to_yojson (x : create_address_list_import_job_response)
    =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("PreSignedUrl", Some (pre_signed_url_to_yojson x.pre_signed_url));
    ]

let import_data_type_to_yojson (x : import_data_type) =
  match x with CSV -> `String "CSV" | JSON -> `String "JSON"

let import_data_format_to_yojson (x : import_data_format) =
  assoc_to_yojson [ ("ImportDataType", Some (import_data_type_to_yojson x.import_data_type)) ]

let job_name_to_yojson = string_to_yojson

let create_address_list_import_job_request_to_yojson (x : create_address_list_import_job_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("Name", Some (job_name_to_yojson x.name));
      ("ImportDataFormat", Some (import_data_format_to_yojson x.import_data_format));
    ]

let create_archive_response_to_yojson (x : create_archive_response) =
  assoc_to_yojson [ ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id)) ]

let kms_key_arn_to_yojson = string_to_yojson

let create_archive_request_to_yojson (x : create_archive_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ArchiveName", Some (archive_name_string_to_yojson x.archive_name));
      ("Retention", option_to_yojson archive_retention_to_yojson x.retention);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let ingress_point_id_to_yojson = string_to_yojson

let create_ingress_point_response_to_yojson (x : create_ingress_point_response) =
  assoc_to_yojson [ ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id)) ]

let tls_policy_to_yojson (x : tls_policy) =
  match x with
  | REQUIRED -> `String "REQUIRED"
  | OPTIONAL -> `String "OPTIONAL"
  | FIPS -> `String "FIPS"

let vpc_endpoint_id_to_yojson = string_to_yojson

let private_network_configuration_to_yojson (x : private_network_configuration) =
  assoc_to_yojson [ ("VpcEndpointId", Some (vpc_endpoint_id_to_yojson x.vpc_endpoint_id)) ]

let ip_type_to_yojson (x : ip_type) =
  match x with IPV4 -> `String "IPV4" | DUAL_STACK -> `String "DUAL_STACK"

let public_network_configuration_to_yojson (x : public_network_configuration) =
  assoc_to_yojson [ ("IpType", Some (ip_type_to_yojson x.ip_type)) ]

let network_configuration_to_yojson (x : network_configuration) =
  match x with
  | PublicNetworkConfiguration arg ->
      assoc_to_yojson
        [ ("PublicNetworkConfiguration", Some (public_network_configuration_to_yojson arg)) ]
  | PrivateNetworkConfiguration arg ->
      assoc_to_yojson
        [ ("PrivateNetworkConfiguration", Some (private_network_configuration_to_yojson arg)) ]

let crl_content_to_yojson = string_to_yojson

let trust_store_to_yojson (x : trust_store) =
  assoc_to_yojson
    [
      ("CAContent", Some (ca_content_to_yojson x.ca_content));
      ("CrlContent", option_to_yojson crl_content_to_yojson x.crl_content);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let tls_auth_configuration_to_yojson (x : tls_auth_configuration) =
  assoc_to_yojson [ ("TrustStore", option_to_yojson trust_store_to_yojson x.trust_store) ]

let secret_arn_to_yojson = string_to_yojson
let smtp_password_to_yojson = string_to_yojson

let ingress_point_configuration_to_yojson (x : ingress_point_configuration) =
  match x with
  | SmtpPassword arg -> assoc_to_yojson [ ("SmtpPassword", Some (smtp_password_to_yojson arg)) ]
  | SecretArn arg -> assoc_to_yojson [ ("SecretArn", Some (secret_arn_to_yojson arg)) ]
  | TlsAuthConfiguration arg ->
      assoc_to_yojson [ ("TlsAuthConfiguration", Some (tls_auth_configuration_to_yojson arg)) ]

let traffic_policy_id_to_yojson = string_to_yojson
let rule_set_id_to_yojson = string_to_yojson

let ingress_point_type_to_yojson (x : ingress_point_type) =
  match x with OPEN -> `String "OPEN" | AUTH -> `String "AUTH" | MTLS -> `String "MTLS"

let ingress_point_name_to_yojson = string_to_yojson

let create_ingress_point_request_to_yojson (x : create_ingress_point_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("IngressPointName", Some (ingress_point_name_to_yojson x.ingress_point_name));
      ("Type", Some (ingress_point_type_to_yojson x.type_));
      ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id));
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ( "IngressPointConfiguration",
        option_to_yojson ingress_point_configuration_to_yojson x.ingress_point_configuration );
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("TlsPolicy", option_to_yojson tls_policy_to_yojson x.tls_policy);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let relay_id_to_yojson = string_to_yojson

let create_relay_response_to_yojson (x : create_relay_response) =
  assoc_to_yojson [ ("RelayId", Some (relay_id_to_yojson x.relay_id)) ]

let no_authentication_to_yojson = unit_to_yojson

let relay_authentication_to_yojson (x : relay_authentication) =
  match x with
  | SecretArn arg -> assoc_to_yojson [ ("SecretArn", Some (secret_arn_to_yojson arg)) ]
  | NoAuthentication arg ->
      assoc_to_yojson [ ("NoAuthentication", Some (no_authentication_to_yojson arg)) ]

let relay_server_port_to_yojson = int_to_yojson
let relay_server_name_to_yojson = string_to_yojson
let relay_name_to_yojson = string_to_yojson

let create_relay_request_to_yojson (x : create_relay_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("RelayName", Some (relay_name_to_yojson x.relay_name));
      ("ServerName", Some (relay_server_name_to_yojson x.server_name));
      ("ServerPort", Some (relay_server_port_to_yojson x.server_port));
      ("Authentication", Some (relay_authentication_to_yojson x.authentication));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_rule_set_response_to_yojson (x : create_rule_set_response) =
  assoc_to_yojson [ ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id)) ]

let lambda_retry_time_minutes_to_yojson = int_to_yojson

let lambda_invocation_type_to_yojson (x : lambda_invocation_type) =
  match x with EVENT -> `String "EVENT" | REQUEST_RESPONSE -> `String "REQUEST_RESPONSE"

let lambda_function_arn_to_yojson = string_to_yojson

let invoke_lambda_action_to_yojson (x : invoke_lambda_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("FunctionArn", Some (lambda_function_arn_to_yojson x.function_arn));
      ("InvocationType", Some (lambda_invocation_type_to_yojson x.invocation_type));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("RetryTimeMinutes", option_to_yojson lambda_retry_time_minutes_to_yojson x.retry_time_minutes);
    ]

let sns_notification_payload_type_to_yojson (x : sns_notification_payload_type) =
  match x with HEADERS -> `String "HEADERS" | CONTENT -> `String "CONTENT"

let sns_notification_encoding_to_yojson (x : sns_notification_encoding) =
  match x with UTF_8 -> `String "UTF-8" | BASE64 -> `String "BASE64"

let sns_topic_arn_to_yojson = string_to_yojson

let sns_action_to_yojson (x : sns_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("TopicArn", Some (sns_topic_arn_to_yojson x.topic_arn));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("Encoding", option_to_yojson sns_notification_encoding_to_yojson x.encoding);
      ("PayloadType", option_to_yojson sns_notification_payload_type_to_yojson x.payload_type);
    ]

let q_business_index_id_to_yojson = string_to_yojson
let q_business_application_id_to_yojson = string_to_yojson

let deliver_to_q_business_action_to_yojson (x : deliver_to_q_business_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("ApplicationId", Some (q_business_application_id_to_yojson x.application_id));
      ("IndexId", Some (q_business_index_id_to_yojson x.index_id));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
    ]

let deliver_to_mailbox_action_to_yojson (x : deliver_to_mailbox_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("MailboxArn", Some (name_or_arn_to_yojson x.mailbox_arn));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
    ]

let recipients_to_yojson tree = list_to_yojson email_address_to_yojson tree

let replace_recipient_action_to_yojson (x : replace_recipient_action) =
  assoc_to_yojson [ ("ReplaceWith", option_to_yojson recipients_to_yojson x.replace_with) ]

let send_action_to_yojson (x : send_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
    ]

let kms_key_id_to_yojson = string_to_yojson
let s3_prefix_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_action_to_yojson (x : s3_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3Prefix", option_to_yojson s3_prefix_to_yojson x.s3_prefix);
      ("S3SseKmsKeyId", option_to_yojson kms_key_id_to_yojson x.s3_sse_kms_key_id);
    ]

let mail_from_to_yojson (x : mail_from) =
  match x with REPLACE -> `String "REPLACE" | PRESERVE -> `String "PRESERVE"

let id_or_arn_to_yojson = string_to_yojson

let relay_action_to_yojson (x : relay_action) =
  assoc_to_yojson
    [
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
      ("Relay", Some (id_or_arn_to_yojson x.relay));
      ("MailFrom", option_to_yojson mail_from_to_yojson x.mail_from);
    ]

let drop_action_to_yojson = unit_to_yojson

let rule_action_to_yojson (x : rule_action) =
  match x with
  | Drop arg -> assoc_to_yojson [ ("Drop", Some (drop_action_to_yojson arg)) ]
  | Relay arg -> assoc_to_yojson [ ("Relay", Some (relay_action_to_yojson arg)) ]
  | Archive arg -> assoc_to_yojson [ ("Archive", Some (archive_action_to_yojson arg)) ]
  | WriteToS3 arg -> assoc_to_yojson [ ("WriteToS3", Some (s3_action_to_yojson arg)) ]
  | Send arg -> assoc_to_yojson [ ("Send", Some (send_action_to_yojson arg)) ]
  | AddHeader arg -> assoc_to_yojson [ ("AddHeader", Some (add_header_action_to_yojson arg)) ]
  | ReplaceRecipient arg ->
      assoc_to_yojson [ ("ReplaceRecipient", Some (replace_recipient_action_to_yojson arg)) ]
  | DeliverToMailbox arg ->
      assoc_to_yojson [ ("DeliverToMailbox", Some (deliver_to_mailbox_action_to_yojson arg)) ]
  | DeliverToQBusiness arg ->
      assoc_to_yojson [ ("DeliverToQBusiness", Some (deliver_to_q_business_action_to_yojson arg)) ]
  | PublishToSns arg -> assoc_to_yojson [ ("PublishToSns", Some (sns_action_to_yojson arg)) ]
  | Bounce arg -> assoc_to_yojson [ ("Bounce", Some (bounce_action_to_yojson arg)) ]
  | InvokeLambda arg ->
      assoc_to_yojson [ ("InvokeLambda", Some (invoke_lambda_action_to_yojson arg)) ]

let rule_actions_to_yojson tree = list_to_yojson rule_action_to_yojson tree

let rule_dmarc_policy_to_yojson (x : rule_dmarc_policy) =
  match x with
  | NONE -> `String "NONE"
  | QUARANTINE -> `String "QUARANTINE"
  | REJECT -> `String "REJECT"

let rule_dmarc_value_list_to_yojson tree = list_to_yojson rule_dmarc_policy_to_yojson tree

let rule_dmarc_operator_to_yojson (x : rule_dmarc_operator) =
  match x with EQUALS -> `String "EQUALS" | NOT_EQUALS -> `String "NOT_EQUALS"

let rule_dmarc_expression_to_yojson (x : rule_dmarc_expression) =
  assoc_to_yojson
    [
      ("Operator", Some (rule_dmarc_operator_to_yojson x.operator));
      ("Values", Some (rule_dmarc_value_list_to_yojson x.values));
    ]

let rule_verdict_to_yojson (x : rule_verdict) =
  match x with
  | PASS -> `String "PASS"
  | FAIL -> `String "FAIL"
  | GRAY -> `String "GRAY"
  | PROCESSING_FAILED -> `String "PROCESSING_FAILED"

let rule_verdict_value_list_to_yojson tree = list_to_yojson rule_verdict_to_yojson tree

let rule_verdict_operator_to_yojson (x : rule_verdict_operator) =
  match x with EQUALS -> `String "EQUALS" | NOT_EQUALS -> `String "NOT_EQUALS"

let rule_verdict_attribute_to_yojson (x : rule_verdict_attribute) =
  match x with SPF -> `String "SPF" | DKIM -> `String "DKIM"

let rule_verdict_to_evaluate_to_yojson (x : rule_verdict_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (rule_verdict_attribute_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (analysis_to_yojson arg)) ]

let rule_verdict_expression_to_yojson (x : rule_verdict_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (rule_verdict_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (rule_verdict_operator_to_yojson x.operator));
      ("Values", Some (rule_verdict_value_list_to_yojson x.values));
    ]

let rule_ip_string_value_to_yojson = string_to_yojson
let rule_ip_value_list_to_yojson tree = list_to_yojson rule_ip_string_value_to_yojson tree

let rule_ip_operator_to_yojson (x : rule_ip_operator) =
  match x with
  | CIDR_MATCHES -> `String "CIDR_MATCHES"
  | NOT_CIDR_MATCHES -> `String "NOT_CIDR_MATCHES"

let rule_ip_email_attribute_to_yojson (x : rule_ip_email_attribute) =
  match x with SOURCE_IP -> `String "SOURCE_IP"

let rule_ip_to_evaluate_to_yojson (x : rule_ip_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (rule_ip_email_attribute_to_yojson arg)) ]

let rule_ip_expression_to_yojson (x : rule_ip_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (rule_ip_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (rule_ip_operator_to_yojson x.operator));
      ("Values", Some (rule_ip_value_list_to_yojson x.values));
    ]

let rule_number_operator_to_yojson (x : rule_number_operator) =
  match x with
  | EQUALS -> `String "EQUALS"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN_OR_EQUAL -> `String "LESS_THAN_OR_EQUAL"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"

let rule_number_email_attribute_to_yojson (x : rule_number_email_attribute) =
  match x with MESSAGE_SIZE -> `String "MESSAGE_SIZE"

let rule_number_to_evaluate_to_yojson (x : rule_number_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (rule_number_email_attribute_to_yojson arg)) ]

let rule_number_expression_to_yojson (x : rule_number_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (rule_number_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (rule_number_operator_to_yojson x.operator));
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.value));
    ]

let rule_string_value_to_yojson = string_to_yojson
let rule_string_list_to_yojson tree = list_to_yojson rule_string_value_to_yojson tree

let rule_string_operator_to_yojson (x : rule_string_operator) =
  match x with
  | EQUALS -> `String "EQUALS"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"

let rule_client_certificate_attribute_to_yojson (x : rule_client_certificate_attribute) =
  match x with
  | CN -> `String "CN"
  | SAN_RFC822_NAME -> `String "SAN_RFC822_NAME"
  | SAN_DNS_NAME -> `String "SAN_DNS_NAME"
  | SAN_DIRECTORY_NAME -> `String "SAN_DIRECTORY_NAME"
  | SAN_UNIFORM_RESOURCE_IDENTIFIER -> `String "SAN_UNIFORM_RESOURCE_IDENTIFIER"
  | SAN_IP_ADDRESS -> `String "SAN_IP_ADDRESS"
  | SAN_REGISTERED_ID -> `String "SAN_REGISTERED_ID"
  | SERIAL_NUMBER -> `String "SERIAL_NUMBER"

let mime_header_attribute_to_yojson = string_to_yojson

let rule_string_email_attribute_to_yojson (x : rule_string_email_attribute) =
  match x with
  | MAIL_FROM -> `String "MAIL_FROM"
  | HELO -> `String "HELO"
  | RECIPIENT -> `String "RECIPIENT"
  | SENDER -> `String "SENDER"
  | FROM -> `String "FROM"
  | SUBJECT -> `String "SUBJECT"
  | TO -> `String "TO"
  | CC -> `String "CC"

let rule_string_to_evaluate_to_yojson (x : rule_string_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (rule_string_email_attribute_to_yojson arg)) ]
  | MimeHeaderAttribute arg ->
      assoc_to_yojson [ ("MimeHeaderAttribute", Some (mime_header_attribute_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (analysis_to_yojson arg)) ]
  | ClientCertificateAttribute arg ->
      assoc_to_yojson
        [ ("ClientCertificateAttribute", Some (rule_client_certificate_attribute_to_yojson arg)) ]

let rule_string_expression_to_yojson (x : rule_string_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (rule_string_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (rule_string_operator_to_yojson x.operator));
      ("Values", Some (rule_string_list_to_yojson x.values));
    ]

let rule_boolean_operator_to_yojson (x : rule_boolean_operator) =
  match x with IS_TRUE -> `String "IS_TRUE" | IS_FALSE -> `String "IS_FALSE"

let rule_address_list_arn_list_to_yojson tree = list_to_yojson address_list_arn_to_yojson tree

let rule_address_list_email_attribute_to_yojson (x : rule_address_list_email_attribute) =
  match x with
  | RECIPIENT -> `String "RECIPIENT"
  | MAIL_FROM -> `String "MAIL_FROM"
  | SENDER -> `String "SENDER"
  | FROM -> `String "FROM"
  | TO -> `String "TO"
  | CC -> `String "CC"

let rule_is_in_address_list_to_yojson (x : rule_is_in_address_list) =
  assoc_to_yojson
    [
      ("Attribute", Some (rule_address_list_email_attribute_to_yojson x.attribute));
      ("AddressLists", Some (rule_address_list_arn_list_to_yojson x.address_lists));
    ]

let rule_boolean_email_attribute_to_yojson (x : rule_boolean_email_attribute) =
  match x with
  | READ_RECEIPT_REQUESTED -> `String "READ_RECEIPT_REQUESTED"
  | TLS -> `String "TLS"
  | TLS_WRAPPED -> `String "TLS_WRAPPED"

let rule_boolean_to_evaluate_to_yojson (x : rule_boolean_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (rule_boolean_email_attribute_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (analysis_to_yojson arg)) ]
  | IsInAddressList arg ->
      assoc_to_yojson [ ("IsInAddressList", Some (rule_is_in_address_list_to_yojson arg)) ]

let rule_boolean_expression_to_yojson (x : rule_boolean_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (rule_boolean_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (rule_boolean_operator_to_yojson x.operator));
    ]

let rule_condition_to_yojson (x : rule_condition) =
  match x with
  | BooleanExpression arg ->
      assoc_to_yojson [ ("BooleanExpression", Some (rule_boolean_expression_to_yojson arg)) ]
  | StringExpression arg ->
      assoc_to_yojson [ ("StringExpression", Some (rule_string_expression_to_yojson arg)) ]
  | NumberExpression arg ->
      assoc_to_yojson [ ("NumberExpression", Some (rule_number_expression_to_yojson arg)) ]
  | IpExpression arg ->
      assoc_to_yojson [ ("IpExpression", Some (rule_ip_expression_to_yojson arg)) ]
  | VerdictExpression arg ->
      assoc_to_yojson [ ("VerdictExpression", Some (rule_verdict_expression_to_yojson arg)) ]
  | DmarcExpression arg ->
      assoc_to_yojson [ ("DmarcExpression", Some (rule_dmarc_expression_to_yojson arg)) ]

let rule_conditions_to_yojson tree = list_to_yojson rule_condition_to_yojson tree
let rule_name_to_yojson = string_to_yojson

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson rule_name_to_yojson x.name);
      ("Conditions", option_to_yojson rule_conditions_to_yojson x.conditions);
      ("Unless", option_to_yojson rule_conditions_to_yojson x.unless);
      ("Actions", Some (rule_actions_to_yojson x.actions));
    ]

let rules_to_yojson tree = list_to_yojson rule_to_yojson tree
let rule_set_name_to_yojson = string_to_yojson

let create_rule_set_request_to_yojson (x : create_rule_set_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("RuleSetName", Some (rule_set_name_to_yojson x.rule_set_name));
      ("Rules", Some (rules_to_yojson x.rules));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_traffic_policy_response_to_yojson (x : create_traffic_policy_response) =
  assoc_to_yojson [ ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id)) ]

let max_message_size_bytes_to_yojson = int_to_yojson

let ingress_boolean_operator_to_yojson (x : ingress_boolean_operator) =
  match x with IS_TRUE -> `String "IS_TRUE" | IS_FALSE -> `String "IS_FALSE"

let ingress_address_list_arn_list_to_yojson tree = list_to_yojson address_list_arn_to_yojson tree

let ingress_address_list_email_attribute_to_yojson (x : ingress_address_list_email_attribute) =
  match x with RECIPIENT -> `String "RECIPIENT"

let ingress_is_in_address_list_to_yojson (x : ingress_is_in_address_list) =
  assoc_to_yojson
    [
      ("Attribute", Some (ingress_address_list_email_attribute_to_yojson x.attribute));
      ("AddressLists", Some (ingress_address_list_arn_list_to_yojson x.address_lists));
    ]

let ingress_analysis_to_yojson (x : ingress_analysis) =
  assoc_to_yojson
    [
      ("Analyzer", Some (analyzer_arn_to_yojson x.analyzer));
      ("ResultField", Some (result_field_to_yojson x.result_field));
    ]

let ingress_boolean_to_evaluate_to_yojson (x : ingress_boolean_to_evaluate) =
  match x with
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (ingress_analysis_to_yojson arg)) ]
  | IsInAddressList arg ->
      assoc_to_yojson [ ("IsInAddressList", Some (ingress_is_in_address_list_to_yojson arg)) ]

let ingress_boolean_expression_to_yojson (x : ingress_boolean_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (ingress_boolean_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (ingress_boolean_operator_to_yojson x.operator));
    ]

let ingress_tls_protocol_attribute_to_yojson (x : ingress_tls_protocol_attribute) =
  match x with TLS1_2 -> `String "TLS1_2" | TLS1_3 -> `String "TLS1_3"

let ingress_tls_protocol_operator_to_yojson (x : ingress_tls_protocol_operator) =
  match x with MINIMUM_TLS_VERSION -> `String "MINIMUM_TLS_VERSION" | IS -> `String "IS"

let ingress_tls_attribute_to_yojson (x : ingress_tls_attribute) =
  match x with TLS_PROTOCOL -> `String "TLS_PROTOCOL"

let ingress_tls_protocol_to_evaluate_to_yojson (x : ingress_tls_protocol_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (ingress_tls_attribute_to_yojson arg)) ]

let ingress_tls_protocol_expression_to_yojson (x : ingress_tls_protocol_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (ingress_tls_protocol_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (ingress_tls_protocol_operator_to_yojson x.operator));
      ("Value", Some (ingress_tls_protocol_attribute_to_yojson x.value));
    ]

let ipv6_cidr_to_yojson = string_to_yojson
let ipv6_cidrs_to_yojson tree = list_to_yojson ipv6_cidr_to_yojson tree

let ingress_ip_operator_to_yojson (x : ingress_ip_operator) =
  match x with
  | CIDR_MATCHES -> `String "CIDR_MATCHES"
  | NOT_CIDR_MATCHES -> `String "NOT_CIDR_MATCHES"

let ingress_ipv6_attribute_to_yojson (x : ingress_ipv6_attribute) =
  match x with SENDER_IPV6 -> `String "SENDER_IPV6"

let ingress_ipv6_to_evaluate_to_yojson (x : ingress_ipv6_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (ingress_ipv6_attribute_to_yojson arg)) ]

let ingress_ipv6_expression_to_yojson (x : ingress_ipv6_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (ingress_ipv6_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (ingress_ip_operator_to_yojson x.operator));
      ("Values", Some (ipv6_cidrs_to_yojson x.values));
    ]

let ipv4_cidr_to_yojson = string_to_yojson
let ipv4_cidrs_to_yojson tree = list_to_yojson ipv4_cidr_to_yojson tree

let ingress_ipv4_attribute_to_yojson (x : ingress_ipv4_attribute) =
  match x with SENDER_IP -> `String "SENDER_IP"

let ingress_ip_to_evaluate_to_yojson (x : ingress_ip_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (ingress_ipv4_attribute_to_yojson arg)) ]

let ingress_ipv4_expression_to_yojson (x : ingress_ipv4_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (ingress_ip_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (ingress_ip_operator_to_yojson x.operator));
      ("Values", Some (ipv4_cidrs_to_yojson x.values));
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let ingress_string_operator_to_yojson (x : ingress_string_operator) =
  match x with
  | EQUALS -> `String "EQUALS"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"

let ingress_string_email_attribute_to_yojson (x : ingress_string_email_attribute) =
  match x with RECIPIENT -> `String "RECIPIENT"

let ingress_string_to_evaluate_to_yojson (x : ingress_string_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (ingress_string_email_attribute_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (ingress_analysis_to_yojson arg)) ]

let ingress_string_expression_to_yojson (x : ingress_string_expression) =
  assoc_to_yojson
    [
      ("Evaluate", Some (ingress_string_to_evaluate_to_yojson x.evaluate));
      ("Operator", Some (ingress_string_operator_to_yojson x.operator));
      ("Values", Some (string_list_to_yojson x.values));
    ]

let policy_condition_to_yojson (x : policy_condition) =
  match x with
  | StringExpression arg ->
      assoc_to_yojson [ ("StringExpression", Some (ingress_string_expression_to_yojson arg)) ]
  | IpExpression arg ->
      assoc_to_yojson [ ("IpExpression", Some (ingress_ipv4_expression_to_yojson arg)) ]
  | Ipv6Expression arg ->
      assoc_to_yojson [ ("Ipv6Expression", Some (ingress_ipv6_expression_to_yojson arg)) ]
  | TlsExpression arg ->
      assoc_to_yojson [ ("TlsExpression", Some (ingress_tls_protocol_expression_to_yojson arg)) ]
  | BooleanExpression arg ->
      assoc_to_yojson [ ("BooleanExpression", Some (ingress_boolean_expression_to_yojson arg)) ]

let policy_conditions_to_yojson tree = list_to_yojson policy_condition_to_yojson tree

let policy_statement_to_yojson (x : policy_statement) =
  assoc_to_yojson
    [
      ("Conditions", Some (policy_conditions_to_yojson x.conditions));
      ("Action", Some (accept_action_to_yojson x.action));
    ]

let policy_statement_list_to_yojson tree = list_to_yojson policy_statement_to_yojson tree
let traffic_policy_name_to_yojson = string_to_yojson

let create_traffic_policy_request_to_yojson (x : create_traffic_policy_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("TrafficPolicyName", Some (traffic_policy_name_to_yojson x.traffic_policy_name));
      ("PolicyStatements", Some (policy_statement_list_to_yojson x.policy_statements));
      ("DefaultAction", Some (accept_action_to_yojson x.default_action));
      ( "MaxMessageSizeBytes",
        option_to_yojson max_message_size_bytes_to_yojson x.max_message_size_bytes );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let delete_addon_instance_response_to_yojson = unit_to_yojson

let delete_addon_instance_request_to_yojson (x : delete_addon_instance_request) =
  assoc_to_yojson [ ("AddonInstanceId", Some (addon_instance_id_to_yojson x.addon_instance_id)) ]

let delete_addon_subscription_response_to_yojson = unit_to_yojson

let delete_addon_subscription_request_to_yojson (x : delete_addon_subscription_request) =
  assoc_to_yojson
    [ ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id)) ]

let delete_address_list_response_to_yojson = unit_to_yojson

let delete_address_list_request_to_yojson (x : delete_address_list_request) =
  assoc_to_yojson [ ("AddressListId", Some (address_list_id_to_yojson x.address_list_id)) ]

let delete_archive_response_to_yojson = unit_to_yojson

let delete_archive_request_to_yojson (x : delete_archive_request) =
  assoc_to_yojson [ ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id)) ]

let delete_ingress_point_response_to_yojson = unit_to_yojson

let delete_ingress_point_request_to_yojson (x : delete_ingress_point_request) =
  assoc_to_yojson [ ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id)) ]

let delete_relay_response_to_yojson = unit_to_yojson

let delete_relay_request_to_yojson (x : delete_relay_request) =
  assoc_to_yojson [ ("RelayId", Some (relay_id_to_yojson x.relay_id)) ]

let delete_rule_set_response_to_yojson = unit_to_yojson

let delete_rule_set_request_to_yojson (x : delete_rule_set_request) =
  assoc_to_yojson [ ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id)) ]

let delete_traffic_policy_response_to_yojson = unit_to_yojson

let delete_traffic_policy_request_to_yojson (x : delete_traffic_policy_request) =
  assoc_to_yojson [ ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id)) ]

let deregister_member_from_address_list_response_to_yojson = unit_to_yojson

let deregister_member_from_address_list_request_to_yojson
    (x : deregister_member_from_address_list_request) =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("Address", Some (address_to_yojson x.address));
    ]

let email_received_headers_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let envelope_to_yojson (x : envelope) =
  assoc_to_yojson
    [
      ("Helo", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.helo);
      ("From", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.from_);
      ("To", option_to_yojson string_list_to_yojson x.to_);
    ]

let s3_location_to_yojson = string_to_yojson

let s3_export_destination_configuration_to_yojson (x : s3_export_destination_configuration) =
  assoc_to_yojson [ ("S3Location", option_to_yojson s3_location_to_yojson x.s3_location) ]

let export_destination_configuration_to_yojson (x : export_destination_configuration) =
  match x with
  | S3 arg -> assoc_to_yojson [ ("S3", Some (s3_export_destination_configuration_to_yojson arg)) ]

let export_id_to_yojson = string_to_yojson
let export_max_results_to_yojson = int_to_yojson

let export_state_to_yojson (x : export_state) =
  match x with
  | QUEUED -> `String "QUEUED"
  | PREPROCESSING -> `String "PREPROCESSING"
  | PROCESSING -> `String "PROCESSING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"

let export_status_to_yojson (x : export_status) =
  assoc_to_yojson
    [
      ( "SubmissionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.submission_timestamp );
      ( "CompletionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completion_timestamp );
      ("State", option_to_yojson export_state_to_yojson x.state);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let export_summary_to_yojson (x : export_summary) =
  assoc_to_yojson
    [
      ("ExportId", option_to_yojson export_id_to_yojson x.export_id);
      ("Status", option_to_yojson export_status_to_yojson x.status);
    ]

let export_summary_list_to_yojson tree = list_to_yojson export_summary_to_yojson tree

let get_addon_instance_response_to_yojson (x : get_addon_instance_response) =
  assoc_to_yojson
    [
      ( "AddonSubscriptionId",
        option_to_yojson addon_subscription_id_to_yojson x.addon_subscription_id );
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ("AddonInstanceArn", option_to_yojson addon_instance_arn_to_yojson x.addon_instance_arn);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let get_addon_instance_request_to_yojson (x : get_addon_instance_request) =
  assoc_to_yojson [ ("AddonInstanceId", Some (addon_instance_id_to_yojson x.addon_instance_id)) ]

let get_addon_subscription_response_to_yojson (x : get_addon_subscription_response) =
  assoc_to_yojson
    [
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ( "AddonSubscriptionArn",
        option_to_yojson addon_subscription_arn_to_yojson x.addon_subscription_arn );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let get_addon_subscription_request_to_yojson (x : get_addon_subscription_request) =
  assoc_to_yojson
    [ ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id)) ]

let get_address_list_response_to_yojson (x : get_address_list_response) =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("AddressListArn", Some (address_list_arn_to_yojson x.address_list_arn));
      ("AddressListName", Some (address_list_name_to_yojson x.address_list_name));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "LastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
    ]

let get_address_list_request_to_yojson (x : get_address_list_request) =
  assoc_to_yojson [ ("AddressListId", Some (address_list_id_to_yojson x.address_list_id)) ]

let job_items_count_to_yojson = int_to_yojson

let import_job_status_to_yojson (x : import_job_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PROCESSING -> `String "PROCESSING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"

let get_address_list_import_job_response_to_yojson (x : get_address_list_import_job_response) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("Name", Some (job_name_to_yojson x.name));
      ("Status", Some (import_job_status_to_yojson x.status));
      ("PreSignedUrl", Some (pre_signed_url_to_yojson x.pre_signed_url));
      ("ImportedItemsCount", option_to_yojson job_items_count_to_yojson x.imported_items_count);
      ("FailedItemsCount", option_to_yojson job_items_count_to_yojson x.failed_items_count);
      ("ImportDataFormat", Some (import_data_format_to_yojson x.import_data_format));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "StartTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_timestamp );
      ( "CompletedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ("Error", option_to_yojson error_message_to_yojson x.error);
    ]

let get_address_list_import_job_request_to_yojson (x : get_address_list_import_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let get_archive_response_to_yojson (x : get_archive_response) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id));
      ("ArchiveName", Some (archive_name_string_to_yojson x.archive_name));
      ("ArchiveArn", Some (archive_arn_to_yojson x.archive_arn));
      ("ArchiveState", Some (archive_state_to_yojson x.archive_state));
      ("Retention", Some (archive_retention_to_yojson x.retention));
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let get_archive_request_to_yojson (x : get_archive_request) =
  assoc_to_yojson [ ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id)) ]

let get_archive_export_response_to_yojson (x : get_archive_export_response) =
  assoc_to_yojson
    [
      ("ArchiveId", option_to_yojson archive_id_to_yojson x.archive_id);
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ( "FromTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.from_timestamp );
      ( "ToTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.to_timestamp );
      ("MaxResults", option_to_yojson export_max_results_to_yojson x.max_results);
      ( "ExportDestinationConfiguration",
        option_to_yojson export_destination_configuration_to_yojson
          x.export_destination_configuration );
      ("Status", option_to_yojson export_status_to_yojson x.status);
    ]

let get_archive_export_request_to_yojson (x : get_archive_export_request) =
  assoc_to_yojson [ ("ExportId", Some (export_id_to_yojson x.export_id)) ]

let sender_ip_address_to_yojson = string_to_yojson

let metadata_to_yojson (x : metadata) =
  assoc_to_yojson
    [
      ( "Timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.timestamp );
      ("IngressPointId", option_to_yojson ingress_point_id_to_yojson x.ingress_point_id);
      ("TrafficPolicyId", option_to_yojson traffic_policy_id_to_yojson x.traffic_policy_id);
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ( "SenderHostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_hostname
      );
      ("SenderIpAddress", option_to_yojson sender_ip_address_to_yojson x.sender_ip_address);
      ( "TlsCipherSuite",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tls_cipher_suite
      );
      ( "TlsProtocol",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tls_protocol );
      ( "SendingMethod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sending_method );
      ( "SourceIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_identity
      );
      ( "SendingPool",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sending_pool );
      ( "ConfigurationSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set
      );
      ( "SourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_arn );
    ]

let s3_presigned_ur_l_to_yojson = string_to_yojson

let get_archive_message_response_to_yojson (x : get_archive_message_response) =
  assoc_to_yojson
    [
      ("MessageDownloadLink", option_to_yojson s3_presigned_ur_l_to_yojson x.message_download_link);
      ("Metadata", option_to_yojson metadata_to_yojson x.metadata);
      ("Envelope", option_to_yojson envelope_to_yojson x.envelope);
    ]

let get_archive_message_request_to_yojson (x : get_archive_message_request) =
  assoc_to_yojson
    [ ("ArchivedMessageId", Some (archived_message_id_to_yojson x.archived_message_id)) ]

let message_body_to_yojson (x : message_body) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.text);
      ("Html", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.html);
      ( "MessageMalformed",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_malformed );
    ]

let get_archive_message_content_response_to_yojson (x : get_archive_message_content_response) =
  assoc_to_yojson [ ("Body", option_to_yojson message_body_to_yojson x.body) ]

let get_archive_message_content_request_to_yojson (x : get_archive_message_content_request) =
  assoc_to_yojson
    [ ("ArchivedMessageId", Some (archived_message_id_to_yojson x.archived_message_id)) ]

let search_state_to_yojson (x : search_state) =
  match x with
  | QUEUED -> `String "QUEUED"
  | RUNNING -> `String "RUNNING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"

let search_status_to_yojson (x : search_status) =
  assoc_to_yojson
    [
      ( "SubmissionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.submission_timestamp );
      ( "CompletionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completion_timestamp );
      ("State", option_to_yojson search_state_to_yojson x.state);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let search_max_results_to_yojson = int_to_yojson

let get_archive_search_response_to_yojson (x : get_archive_search_response) =
  assoc_to_yojson
    [
      ("ArchiveId", option_to_yojson archive_id_to_yojson x.archive_id);
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ( "FromTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.from_timestamp );
      ( "ToTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.to_timestamp );
      ("MaxResults", option_to_yojson search_max_results_to_yojson x.max_results);
      ("Status", option_to_yojson search_status_to_yojson x.status);
    ]

let search_id_to_yojson = string_to_yojson

let get_archive_search_request_to_yojson (x : get_archive_search_request) =
  assoc_to_yojson [ ("SearchId", Some (search_id_to_yojson x.search_id)) ]

let row_to_yojson (x : row) =
  assoc_to_yojson
    [
      ("ArchivedMessageId", option_to_yojson archived_message_id_to_yojson x.archived_message_id);
      ( "ReceivedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.received_timestamp );
      ("Date", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.date);
      ("To", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.to_);
      ("From", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.from_);
      ("Cc", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cc);
      ("Subject", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.subject);
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
      ( "HasAttachments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.has_attachments
      );
      ("ReceivedHeaders", option_to_yojson email_received_headers_list_to_yojson x.received_headers);
      ( "InReplyTo",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.in_reply_to );
      ( "XMailer",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.x_mailer );
      ( "XOriginalMailer",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.x_original_mailer
      );
      ( "XPriority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.x_priority );
      ("IngressPointId", option_to_yojson ingress_point_id_to_yojson x.ingress_point_id);
      ( "SenderHostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_hostname
      );
      ("SenderIpAddress", option_to_yojson sender_ip_address_to_yojson x.sender_ip_address);
      ("Envelope", option_to_yojson envelope_to_yojson x.envelope);
      ( "SourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_arn );
    ]

let rows_list_to_yojson tree = list_to_yojson row_to_yojson tree

let get_archive_search_results_response_to_yojson (x : get_archive_search_results_response) =
  assoc_to_yojson [ ("Rows", option_to_yojson rows_list_to_yojson x.rows) ]

let get_archive_search_results_request_to_yojson (x : get_archive_search_results_request) =
  assoc_to_yojson [ ("SearchId", Some (search_id_to_yojson x.search_id)) ]

let ingress_point_password_configuration_to_yojson (x : ingress_point_password_configuration) =
  assoc_to_yojson
    [
      ( "SmtpPasswordVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.smtp_password_version );
      ( "PreviousSmtpPasswordVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.previous_smtp_password_version );
      ( "PreviousSmtpPasswordExpiryTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.previous_smtp_password_expiry_timestamp );
    ]

let ingress_point_auth_configuration_to_yojson (x : ingress_point_auth_configuration) =
  assoc_to_yojson
    [
      ( "IngressPointPasswordConfiguration",
        option_to_yojson ingress_point_password_configuration_to_yojson
          x.ingress_point_password_configuration );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "TlsAuthConfiguration",
        option_to_yojson tls_auth_configuration_to_yojson x.tls_auth_configuration );
    ]

let ingress_point_a_record_to_yojson = string_to_yojson

let ingress_point_status_to_yojson (x : ingress_point_status) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | DEPROVISIONING -> `String "DEPROVISIONING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CLOSED -> `String "CLOSED"
  | FAILED -> `String "FAILED"
  | ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST -> `String "ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST"

let ingress_point_arn_to_yojson = string_to_yojson

let get_ingress_point_response_to_yojson (x : get_ingress_point_response) =
  assoc_to_yojson
    [
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
      ("IngressPointName", Some (ingress_point_name_to_yojson x.ingress_point_name));
      ("IngressPointArn", option_to_yojson ingress_point_arn_to_yojson x.ingress_point_arn);
      ("Status", option_to_yojson ingress_point_status_to_yojson x.status);
      ("Type", option_to_yojson ingress_point_type_to_yojson x.type_);
      ("ARecord", option_to_yojson ingress_point_a_record_to_yojson x.a_record);
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ("TrafficPolicyId", option_to_yojson traffic_policy_id_to_yojson x.traffic_policy_id);
      ( "IngressPointAuthConfiguration",
        option_to_yojson ingress_point_auth_configuration_to_yojson
          x.ingress_point_auth_configuration );
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("TlsPolicy", option_to_yojson tls_policy_to_yojson x.tls_policy);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let trust_store_response_option_to_yojson (x : trust_store_response_option) =
  match x with EXCLUDE -> `String "EXCLUDE" | INCLUDE -> `String "INCLUDE"

let get_ingress_point_request_to_yojson (x : get_ingress_point_request) =
  assoc_to_yojson
    [
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
      ( "IncludeTrustStoreContents",
        option_to_yojson trust_store_response_option_to_yojson x.include_trust_store_contents );
    ]

let get_member_of_address_list_response_to_yojson (x : get_member_of_address_list_response) =
  assoc_to_yojson
    [
      ("Address", Some (address_to_yojson x.address));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let get_member_of_address_list_request_to_yojson (x : get_member_of_address_list_request) =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("Address", Some (address_to_yojson x.address));
    ]

let relay_arn_to_yojson = string_to_yojson

let get_relay_response_to_yojson (x : get_relay_response) =
  assoc_to_yojson
    [
      ("RelayId", Some (relay_id_to_yojson x.relay_id));
      ("RelayArn", option_to_yojson relay_arn_to_yojson x.relay_arn);
      ("RelayName", option_to_yojson relay_name_to_yojson x.relay_name);
      ("ServerName", option_to_yojson relay_server_name_to_yojson x.server_name);
      ("ServerPort", option_to_yojson relay_server_port_to_yojson x.server_port);
      ("Authentication", option_to_yojson relay_authentication_to_yojson x.authentication);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "LastModifiedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_modified_timestamp );
    ]

let get_relay_request_to_yojson (x : get_relay_request) =
  assoc_to_yojson [ ("RelayId", Some (relay_id_to_yojson x.relay_id)) ]

let rule_set_arn_to_yojson = string_to_yojson

let get_rule_set_response_to_yojson (x : get_rule_set_response) =
  assoc_to_yojson
    [
      ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id));
      ("RuleSetArn", Some (rule_set_arn_to_yojson x.rule_set_arn));
      ("RuleSetName", Some (rule_set_name_to_yojson x.rule_set_name));
      ( "CreatedDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_date)
      );
      ( "LastModificationDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modification_date) );
      ("Rules", Some (rules_to_yojson x.rules));
    ]

let get_rule_set_request_to_yojson (x : get_rule_set_request) =
  assoc_to_yojson [ ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id)) ]

let traffic_policy_arn_to_yojson = string_to_yojson

let get_traffic_policy_response_to_yojson (x : get_traffic_policy_response) =
  assoc_to_yojson
    [
      ("TrafficPolicyName", Some (traffic_policy_name_to_yojson x.traffic_policy_name));
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ("TrafficPolicyArn", option_to_yojson traffic_policy_arn_to_yojson x.traffic_policy_arn);
      ("PolicyStatements", option_to_yojson policy_statement_list_to_yojson x.policy_statements);
      ( "MaxMessageSizeBytes",
        option_to_yojson max_message_size_bytes_to_yojson x.max_message_size_bytes );
      ("DefaultAction", option_to_yojson accept_action_to_yojson x.default_action);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let get_traffic_policy_request_to_yojson (x : get_traffic_policy_request) =
  assoc_to_yojson [ ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id)) ]

let import_job_to_yojson (x : import_job) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("Name", Some (job_name_to_yojson x.name));
      ("Status", Some (import_job_status_to_yojson x.status));
      ("PreSignedUrl", Some (pre_signed_url_to_yojson x.pre_signed_url));
      ("ImportedItemsCount", option_to_yojson job_items_count_to_yojson x.imported_items_count);
      ("FailedItemsCount", option_to_yojson job_items_count_to_yojson x.failed_items_count);
      ("ImportDataFormat", Some (import_data_format_to_yojson x.import_data_format));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "StartTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_timestamp );
      ( "CompletedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ("Error", option_to_yojson error_message_to_yojson x.error);
    ]

let import_jobs_to_yojson tree = list_to_yojson import_job_to_yojson tree

let ingress_point_to_yojson (x : ingress_point) =
  assoc_to_yojson
    [
      ("IngressPointName", Some (ingress_point_name_to_yojson x.ingress_point_name));
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
      ("Status", Some (ingress_point_status_to_yojson x.status));
      ("Type", Some (ingress_point_type_to_yojson x.type_));
      ("ARecord", option_to_yojson ingress_point_a_record_to_yojson x.a_record);
    ]

let ingress_point_status_to_update_to_yojson (x : ingress_point_status_to_update) =
  match x with ACTIVE -> `String "ACTIVE" | CLOSED -> `String "CLOSED"

let ingress_points_list_to_yojson tree = list_to_yojson ingress_point_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let list_addon_instances_response_to_yojson (x : list_addon_instances_response) =
  assoc_to_yojson
    [
      ("AddonInstances", option_to_yojson addon_instances_to_yojson x.addon_instances);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let page_size_to_yojson = int_to_yojson

let list_addon_instances_request_to_yojson (x : list_addon_instances_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_addon_subscriptions_response_to_yojson (x : list_addon_subscriptions_response) =
  assoc_to_yojson
    [
      ("AddonSubscriptions", option_to_yojson addon_subscriptions_to_yojson x.addon_subscriptions);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_addon_subscriptions_request_to_yojson (x : list_addon_subscriptions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_address_list_import_jobs_response_to_yojson (x : list_address_list_import_jobs_response) =
  assoc_to_yojson
    [
      ("ImportJobs", Some (import_jobs_to_yojson x.import_jobs));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_address_list_import_jobs_request_to_yojson (x : list_address_list_import_jobs_request) =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_address_lists_response_to_yojson (x : list_address_lists_response) =
  assoc_to_yojson
    [
      ("AddressLists", Some (address_lists_to_yojson x.address_lists));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_address_lists_request_to_yojson (x : list_address_lists_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_archive_exports_response_to_yojson (x : list_archive_exports_response) =
  assoc_to_yojson
    [
      ("Exports", option_to_yojson export_summary_list_to_yojson x.exports);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_archive_exports_request_to_yojson (x : list_archive_exports_request) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let search_summary_to_yojson (x : search_summary) =
  assoc_to_yojson
    [
      ("SearchId", option_to_yojson search_id_to_yojson x.search_id);
      ("Status", option_to_yojson search_status_to_yojson x.status);
    ]

let search_summary_list_to_yojson tree = list_to_yojson search_summary_to_yojson tree

let list_archive_searches_response_to_yojson (x : list_archive_searches_response) =
  assoc_to_yojson
    [
      ("Searches", option_to_yojson search_summary_list_to_yojson x.searches);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_archive_searches_request_to_yojson (x : list_archive_searches_request) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_archives_response_to_yojson (x : list_archives_response) =
  assoc_to_yojson
    [
      ("Archives", Some (archives_list_to_yojson x.archives));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_archives_request_to_yojson (x : list_archives_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_ingress_points_response_to_yojson (x : list_ingress_points_response) =
  assoc_to_yojson
    [
      ("IngressPoints", option_to_yojson ingress_points_list_to_yojson x.ingress_points);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_ingress_points_request_to_yojson (x : list_ingress_points_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let saved_address_to_yojson (x : saved_address) =
  assoc_to_yojson
    [
      ("Address", Some (address_to_yojson x.address));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let saved_addresses_to_yojson tree = list_to_yojson saved_address_to_yojson tree

let list_members_of_address_list_response_to_yojson (x : list_members_of_address_list_response) =
  assoc_to_yojson
    [
      ("Addresses", Some (saved_addresses_to_yojson x.addresses));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_members_of_address_list_request_to_yojson (x : list_members_of_address_list_request) =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("Filter", option_to_yojson address_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson address_page_size_to_yojson x.page_size);
    ]

let relay_to_yojson (x : relay) =
  assoc_to_yojson
    [
      ("RelayId", option_to_yojson relay_id_to_yojson x.relay_id);
      ("RelayName", option_to_yojson relay_name_to_yojson x.relay_name);
      ( "LastModifiedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_modified_timestamp );
    ]

let relays_to_yojson tree = list_to_yojson relay_to_yojson tree

let list_relays_response_to_yojson (x : list_relays_response) =
  assoc_to_yojson
    [
      ("Relays", Some (relays_to_yojson x.relays));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_relays_request_to_yojson (x : list_relays_request) =
  assoc_to_yojson
    [
      ( "PageSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.page_size );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let rule_set_to_yojson (x : rule_set) =
  assoc_to_yojson
    [
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ("RuleSetName", option_to_yojson rule_set_name_to_yojson x.rule_set_name);
      ( "LastModificationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_modification_date );
    ]

let rule_sets_to_yojson tree = list_to_yojson rule_set_to_yojson tree

let list_rule_sets_response_to_yojson (x : list_rule_sets_response) =
  assoc_to_yojson
    [
      ("RuleSets", Some (rule_sets_to_yojson x.rule_sets));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rule_sets_request_to_yojson (x : list_rule_sets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", Some (tag_list_to_yojson x.tags)) ]

let taggable_resource_arn_to_yojson = string_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let traffic_policy_to_yojson (x : traffic_policy) =
  assoc_to_yojson
    [
      ("TrafficPolicyName", Some (traffic_policy_name_to_yojson x.traffic_policy_name));
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ("DefaultAction", Some (accept_action_to_yojson x.default_action));
    ]

let traffic_policy_list_to_yojson tree = list_to_yojson traffic_policy_to_yojson tree

let list_traffic_policies_response_to_yojson (x : list_traffic_policies_response) =
  assoc_to_yojson
    [
      ("TrafficPolicies", option_to_yojson traffic_policy_list_to_yojson x.traffic_policies);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_traffic_policies_request_to_yojson (x : list_traffic_policies_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let stop_archive_search_response_to_yojson = unit_to_yojson

let stop_archive_search_request_to_yojson (x : stop_archive_search_request) =
  assoc_to_yojson [ ("SearchId", Some (search_id_to_yojson x.search_id)) ]

let stop_archive_export_response_to_yojson = unit_to_yojson

let stop_archive_export_request_to_yojson (x : stop_archive_export_request) =
  assoc_to_yojson [ ("ExportId", Some (export_id_to_yojson x.export_id)) ]

let stop_address_list_import_job_response_to_yojson = unit_to_yojson

let stop_address_list_import_job_request_to_yojson (x : stop_address_list_import_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_archive_search_response_to_yojson (x : start_archive_search_response) =
  assoc_to_yojson [ ("SearchId", option_to_yojson search_id_to_yojson x.search_id) ]

let start_archive_search_request_to_yojson (x : start_archive_search_request) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ( "FromTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.from_timestamp)
      );
      ( "ToTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.to_timestamp)
      );
      ("MaxResults", Some (search_max_results_to_yojson x.max_results));
    ]

let start_archive_export_response_to_yojson (x : start_archive_export_response) =
  assoc_to_yojson [ ("ExportId", option_to_yojson export_id_to_yojson x.export_id) ]

let start_archive_export_request_to_yojson (x : start_archive_export_request) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ( "FromTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.from_timestamp)
      );
      ( "ToTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.to_timestamp)
      );
      ("MaxResults", option_to_yojson export_max_results_to_yojson x.max_results);
      ( "ExportDestinationConfiguration",
        Some (export_destination_configuration_to_yojson x.export_destination_configuration) );
      ( "IncludeMetadata",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.include_metadata
      );
    ]

let start_address_list_import_job_response_to_yojson = unit_to_yojson

let start_address_list_import_job_request_to_yojson (x : start_address_list_import_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let register_member_to_address_list_response_to_yojson = unit_to_yojson

let register_member_to_address_list_request_to_yojson (x : register_member_to_address_list_request)
    =
  assoc_to_yojson
    [
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("Address", Some (address_to_yojson x.address));
    ]

let update_archive_response_to_yojson = unit_to_yojson

let update_archive_request_to_yojson (x : update_archive_request) =
  assoc_to_yojson
    [
      ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id));
      ("ArchiveName", option_to_yojson archive_name_string_to_yojson x.archive_name);
      ("Retention", option_to_yojson archive_retention_to_yojson x.retention);
    ]

let update_ingress_point_response_to_yojson = unit_to_yojson

let update_ingress_point_request_to_yojson (x : update_ingress_point_request) =
  assoc_to_yojson
    [
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
      ("IngressPointName", option_to_yojson ingress_point_name_to_yojson x.ingress_point_name);
      ( "StatusToUpdate",
        option_to_yojson ingress_point_status_to_update_to_yojson x.status_to_update );
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ("TrafficPolicyId", option_to_yojson traffic_policy_id_to_yojson x.traffic_policy_id);
      ( "IngressPointConfiguration",
        option_to_yojson ingress_point_configuration_to_yojson x.ingress_point_configuration );
      ("TlsPolicy", option_to_yojson tls_policy_to_yojson x.tls_policy);
    ]

let update_relay_response_to_yojson = unit_to_yojson

let update_relay_request_to_yojson (x : update_relay_request) =
  assoc_to_yojson
    [
      ("RelayId", Some (relay_id_to_yojson x.relay_id));
      ("RelayName", option_to_yojson relay_name_to_yojson x.relay_name);
      ("ServerName", option_to_yojson relay_server_name_to_yojson x.server_name);
      ("ServerPort", option_to_yojson relay_server_port_to_yojson x.server_port);
      ("Authentication", option_to_yojson relay_authentication_to_yojson x.authentication);
    ]

let update_rule_set_response_to_yojson = unit_to_yojson

let update_rule_set_request_to_yojson (x : update_rule_set_request) =
  assoc_to_yojson
    [
      ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id));
      ("RuleSetName", option_to_yojson rule_set_name_to_yojson x.rule_set_name);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
    ]

let update_traffic_policy_response_to_yojson = unit_to_yojson

let update_traffic_policy_request_to_yojson (x : update_traffic_policy_request) =
  assoc_to_yojson
    [
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ("TrafficPolicyName", option_to_yojson traffic_policy_name_to_yojson x.traffic_policy_name);
      ("PolicyStatements", option_to_yojson policy_statement_list_to_yojson x.policy_statements);
      ("DefaultAction", option_to_yojson accept_action_to_yojson x.default_action);
      ( "MaxMessageSizeBytes",
        option_to_yojson max_message_size_bytes_to_yojson x.max_message_size_bytes );
    ]
