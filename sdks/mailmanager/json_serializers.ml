open Smaws_Lib.Json.SerializeHelpers
open Types

let vpc_endpoint_id_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_traffic_policy_response_to_yojson = unit_to_yojson
let traffic_policy_id_to_yojson = string_to_yojson
let traffic_policy_name_to_yojson = string_to_yojson

let ingress_string_email_attribute_to_yojson (x : ingress_string_email_attribute) =
  match x with RECIPIENT -> `String "RECIPIENT"

let analyzer_arn_to_yojson = string_to_yojson
let result_field_to_yojson = string_to_yojson

let ingress_analysis_to_yojson (x : ingress_analysis) =
  assoc_to_yojson
    [
      ("ResultField", Some (result_field_to_yojson x.result_field));
      ("Analyzer", Some (analyzer_arn_to_yojson x.analyzer));
    ]

let ingress_string_to_evaluate_to_yojson (x : ingress_string_to_evaluate) =
  match x with
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (ingress_analysis_to_yojson arg)) ]
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (ingress_string_email_attribute_to_yojson arg)) ]

let ingress_string_operator_to_yojson (x : ingress_string_operator) =
  match x with
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | EQUALS -> `String "EQUALS"

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let ingress_string_expression_to_yojson (x : ingress_string_expression) =
  assoc_to_yojson
    [
      ("Values", Some (string_list_to_yojson x.values));
      ("Operator", Some (ingress_string_operator_to_yojson x.operator));
      ("Evaluate", Some (ingress_string_to_evaluate_to_yojson x.evaluate));
    ]

let ingress_ipv4_attribute_to_yojson (x : ingress_ipv4_attribute) =
  match x with SENDER_IP -> `String "SENDER_IP"

let ingress_ip_to_evaluate_to_yojson (x : ingress_ip_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (ingress_ipv4_attribute_to_yojson arg)) ]

let ingress_ip_operator_to_yojson (x : ingress_ip_operator) =
  match x with
  | NOT_CIDR_MATCHES -> `String "NOT_CIDR_MATCHES"
  | CIDR_MATCHES -> `String "CIDR_MATCHES"

let ipv4_cidr_to_yojson = string_to_yojson
let ipv4_cidrs_to_yojson tree = list_to_yojson ipv4_cidr_to_yojson tree

let ingress_ipv4_expression_to_yojson (x : ingress_ipv4_expression) =
  assoc_to_yojson
    [
      ("Values", Some (ipv4_cidrs_to_yojson x.values));
      ("Operator", Some (ingress_ip_operator_to_yojson x.operator));
      ("Evaluate", Some (ingress_ip_to_evaluate_to_yojson x.evaluate));
    ]

let ingress_ipv6_attribute_to_yojson (x : ingress_ipv6_attribute) =
  match x with SENDER_IPV6 -> `String "SENDER_IPV6"

let ingress_ipv6_to_evaluate_to_yojson (x : ingress_ipv6_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (ingress_ipv6_attribute_to_yojson arg)) ]

let ipv6_cidr_to_yojson = string_to_yojson
let ipv6_cidrs_to_yojson tree = list_to_yojson ipv6_cidr_to_yojson tree

let ingress_ipv6_expression_to_yojson (x : ingress_ipv6_expression) =
  assoc_to_yojson
    [
      ("Values", Some (ipv6_cidrs_to_yojson x.values));
      ("Operator", Some (ingress_ip_operator_to_yojson x.operator));
      ("Evaluate", Some (ingress_ipv6_to_evaluate_to_yojson x.evaluate));
    ]

let ingress_tls_attribute_to_yojson (x : ingress_tls_attribute) =
  match x with TLS_PROTOCOL -> `String "TLS_PROTOCOL"

let ingress_tls_protocol_to_evaluate_to_yojson (x : ingress_tls_protocol_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (ingress_tls_attribute_to_yojson arg)) ]

let ingress_tls_protocol_operator_to_yojson (x : ingress_tls_protocol_operator) =
  match x with IS -> `String "IS" | MINIMUM_TLS_VERSION -> `String "MINIMUM_TLS_VERSION"

let ingress_tls_protocol_attribute_to_yojson (x : ingress_tls_protocol_attribute) =
  match x with TLS1_3 -> `String "TLS1_3" | TLS1_2 -> `String "TLS1_2"

let ingress_tls_protocol_expression_to_yojson (x : ingress_tls_protocol_expression) =
  assoc_to_yojson
    [
      ("Value", Some (ingress_tls_protocol_attribute_to_yojson x.value));
      ("Operator", Some (ingress_tls_protocol_operator_to_yojson x.operator));
      ("Evaluate", Some (ingress_tls_protocol_to_evaluate_to_yojson x.evaluate));
    ]

let ingress_address_list_email_attribute_to_yojson (x : ingress_address_list_email_attribute) =
  match x with RECIPIENT -> `String "RECIPIENT"

let address_list_arn_to_yojson = string_to_yojson
let ingress_address_list_arn_list_to_yojson tree = list_to_yojson address_list_arn_to_yojson tree

let ingress_is_in_address_list_to_yojson (x : ingress_is_in_address_list) =
  assoc_to_yojson
    [
      ("AddressLists", Some (ingress_address_list_arn_list_to_yojson x.address_lists));
      ("Attribute", Some (ingress_address_list_email_attribute_to_yojson x.attribute));
    ]

let ingress_boolean_to_evaluate_to_yojson (x : ingress_boolean_to_evaluate) =
  match x with
  | IsInAddressList arg ->
      assoc_to_yojson [ ("IsInAddressList", Some (ingress_is_in_address_list_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (ingress_analysis_to_yojson arg)) ]

let ingress_boolean_operator_to_yojson (x : ingress_boolean_operator) =
  match x with IS_FALSE -> `String "IS_FALSE" | IS_TRUE -> `String "IS_TRUE"

let ingress_boolean_expression_to_yojson (x : ingress_boolean_expression) =
  assoc_to_yojson
    [
      ("Operator", Some (ingress_boolean_operator_to_yojson x.operator));
      ("Evaluate", Some (ingress_boolean_to_evaluate_to_yojson x.evaluate));
    ]

let policy_condition_to_yojson (x : policy_condition) =
  match x with
  | BooleanExpression arg ->
      assoc_to_yojson [ ("BooleanExpression", Some (ingress_boolean_expression_to_yojson arg)) ]
  | TlsExpression arg ->
      assoc_to_yojson [ ("TlsExpression", Some (ingress_tls_protocol_expression_to_yojson arg)) ]
  | Ipv6Expression arg ->
      assoc_to_yojson [ ("Ipv6Expression", Some (ingress_ipv6_expression_to_yojson arg)) ]
  | IpExpression arg ->
      assoc_to_yojson [ ("IpExpression", Some (ingress_ipv4_expression_to_yojson arg)) ]
  | StringExpression arg ->
      assoc_to_yojson [ ("StringExpression", Some (ingress_string_expression_to_yojson arg)) ]

let policy_conditions_to_yojson tree = list_to_yojson policy_condition_to_yojson tree

let accept_action_to_yojson (x : accept_action) =
  match x with DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let policy_statement_to_yojson (x : policy_statement) =
  assoc_to_yojson
    [
      ("Action", Some (accept_action_to_yojson x.action));
      ("Conditions", Some (policy_conditions_to_yojson x.conditions));
    ]

let policy_statement_list_to_yojson tree = list_to_yojson policy_statement_to_yojson tree
let max_message_size_bytes_to_yojson = int_to_yojson

let update_traffic_policy_request_to_yojson (x : update_traffic_policy_request) =
  assoc_to_yojson
    [
      ( "MaxMessageSizeBytes",
        option_to_yojson max_message_size_bytes_to_yojson x.max_message_size_bytes );
      ("DefaultAction", option_to_yojson accept_action_to_yojson x.default_action);
      ("PolicyStatements", option_to_yojson policy_statement_list_to_yojson x.policy_statements);
      ("TrafficPolicyName", option_to_yojson traffic_policy_name_to_yojson x.traffic_policy_name);
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_rule_set_response_to_yojson = unit_to_yojson
let rule_set_id_to_yojson = string_to_yojson
let rule_set_name_to_yojson = string_to_yojson
let rule_name_to_yojson = string_to_yojson

let rule_boolean_email_attribute_to_yojson (x : rule_boolean_email_attribute) =
  match x with
  | TLS_WRAPPED -> `String "TLS_WRAPPED"
  | TLS -> `String "TLS"
  | READ_RECEIPT_REQUESTED -> `String "READ_RECEIPT_REQUESTED"

let analysis_to_yojson (x : analysis) =
  assoc_to_yojson
    [
      ("ResultField", Some (result_field_to_yojson x.result_field));
      ("Analyzer", Some (analyzer_arn_to_yojson x.analyzer));
    ]

let rule_address_list_email_attribute_to_yojson (x : rule_address_list_email_attribute) =
  match x with
  | CC -> `String "CC"
  | TO -> `String "TO"
  | FROM -> `String "FROM"
  | SENDER -> `String "SENDER"
  | MAIL_FROM -> `String "MAIL_FROM"
  | RECIPIENT -> `String "RECIPIENT"

let rule_address_list_arn_list_to_yojson tree = list_to_yojson address_list_arn_to_yojson tree

let rule_is_in_address_list_to_yojson (x : rule_is_in_address_list) =
  assoc_to_yojson
    [
      ("AddressLists", Some (rule_address_list_arn_list_to_yojson x.address_lists));
      ("Attribute", Some (rule_address_list_email_attribute_to_yojson x.attribute));
    ]

let rule_boolean_to_evaluate_to_yojson (x : rule_boolean_to_evaluate) =
  match x with
  | IsInAddressList arg ->
      assoc_to_yojson [ ("IsInAddressList", Some (rule_is_in_address_list_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (analysis_to_yojson arg)) ]
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (rule_boolean_email_attribute_to_yojson arg)) ]

let rule_boolean_operator_to_yojson (x : rule_boolean_operator) =
  match x with IS_FALSE -> `String "IS_FALSE" | IS_TRUE -> `String "IS_TRUE"

let rule_boolean_expression_to_yojson (x : rule_boolean_expression) =
  assoc_to_yojson
    [
      ("Operator", Some (rule_boolean_operator_to_yojson x.operator));
      ("Evaluate", Some (rule_boolean_to_evaluate_to_yojson x.evaluate));
    ]

let rule_string_email_attribute_to_yojson (x : rule_string_email_attribute) =
  match x with
  | CC -> `String "CC"
  | TO -> `String "TO"
  | SUBJECT -> `String "SUBJECT"
  | FROM -> `String "FROM"
  | SENDER -> `String "SENDER"
  | RECIPIENT -> `String "RECIPIENT"
  | HELO -> `String "HELO"
  | MAIL_FROM -> `String "MAIL_FROM"

let mime_header_attribute_to_yojson = string_to_yojson

let rule_client_certificate_attribute_to_yojson (x : rule_client_certificate_attribute) =
  match x with
  | SERIAL_NUMBER -> `String "SERIAL_NUMBER"
  | SAN_REGISTERED_ID -> `String "SAN_REGISTERED_ID"
  | SAN_IP_ADDRESS -> `String "SAN_IP_ADDRESS"
  | SAN_UNIFORM_RESOURCE_IDENTIFIER -> `String "SAN_UNIFORM_RESOURCE_IDENTIFIER"
  | SAN_DIRECTORY_NAME -> `String "SAN_DIRECTORY_NAME"
  | SAN_DNS_NAME -> `String "SAN_DNS_NAME"
  | SAN_RFC822_NAME -> `String "SAN_RFC822_NAME"
  | CN -> `String "CN"

let rule_string_to_evaluate_to_yojson (x : rule_string_to_evaluate) =
  match x with
  | ClientCertificateAttribute arg ->
      assoc_to_yojson
        [ ("ClientCertificateAttribute", Some (rule_client_certificate_attribute_to_yojson arg)) ]
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (analysis_to_yojson arg)) ]
  | MimeHeaderAttribute arg ->
      assoc_to_yojson [ ("MimeHeaderAttribute", Some (mime_header_attribute_to_yojson arg)) ]
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (rule_string_email_attribute_to_yojson arg)) ]

let rule_string_operator_to_yojson (x : rule_string_operator) =
  match x with
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | EQUALS -> `String "EQUALS"

let rule_string_value_to_yojson = string_to_yojson
let rule_string_list_to_yojson tree = list_to_yojson rule_string_value_to_yojson tree

let rule_string_expression_to_yojson (x : rule_string_expression) =
  assoc_to_yojson
    [
      ("Values", Some (rule_string_list_to_yojson x.values));
      ("Operator", Some (rule_string_operator_to_yojson x.operator));
      ("Evaluate", Some (rule_string_to_evaluate_to_yojson x.evaluate));
    ]

let rule_number_email_attribute_to_yojson (x : rule_number_email_attribute) =
  match x with MESSAGE_SIZE -> `String "MESSAGE_SIZE"

let rule_number_to_evaluate_to_yojson (x : rule_number_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (rule_number_email_attribute_to_yojson arg)) ]

let rule_number_operator_to_yojson (x : rule_number_operator) =
  match x with
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | LESS_THAN_OR_EQUAL -> `String "LESS_THAN_OR_EQUAL"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | EQUALS -> `String "EQUALS"

let rule_number_expression_to_yojson (x : rule_number_expression) =
  assoc_to_yojson
    [
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.value));
      ("Operator", Some (rule_number_operator_to_yojson x.operator));
      ("Evaluate", Some (rule_number_to_evaluate_to_yojson x.evaluate));
    ]

let rule_ip_email_attribute_to_yojson (x : rule_ip_email_attribute) =
  match x with SOURCE_IP -> `String "SOURCE_IP"

let rule_ip_to_evaluate_to_yojson (x : rule_ip_to_evaluate) =
  match x with
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (rule_ip_email_attribute_to_yojson arg)) ]

let rule_ip_operator_to_yojson (x : rule_ip_operator) =
  match x with
  | NOT_CIDR_MATCHES -> `String "NOT_CIDR_MATCHES"
  | CIDR_MATCHES -> `String "CIDR_MATCHES"

let rule_ip_string_value_to_yojson = string_to_yojson
let rule_ip_value_list_to_yojson tree = list_to_yojson rule_ip_string_value_to_yojson tree

let rule_ip_expression_to_yojson (x : rule_ip_expression) =
  assoc_to_yojson
    [
      ("Values", Some (rule_ip_value_list_to_yojson x.values));
      ("Operator", Some (rule_ip_operator_to_yojson x.operator));
      ("Evaluate", Some (rule_ip_to_evaluate_to_yojson x.evaluate));
    ]

let rule_verdict_attribute_to_yojson (x : rule_verdict_attribute) =
  match x with DKIM -> `String "DKIM" | SPF -> `String "SPF"

let rule_verdict_to_evaluate_to_yojson (x : rule_verdict_to_evaluate) =
  match x with
  | Analysis arg -> assoc_to_yojson [ ("Analysis", Some (analysis_to_yojson arg)) ]
  | Attribute arg -> assoc_to_yojson [ ("Attribute", Some (rule_verdict_attribute_to_yojson arg)) ]

let rule_verdict_operator_to_yojson (x : rule_verdict_operator) =
  match x with NOT_EQUALS -> `String "NOT_EQUALS" | EQUALS -> `String "EQUALS"

let rule_verdict_to_yojson (x : rule_verdict) =
  match x with
  | PROCESSING_FAILED -> `String "PROCESSING_FAILED"
  | GRAY -> `String "GRAY"
  | FAIL -> `String "FAIL"
  | PASS -> `String "PASS"

let rule_verdict_value_list_to_yojson tree = list_to_yojson rule_verdict_to_yojson tree

let rule_verdict_expression_to_yojson (x : rule_verdict_expression) =
  assoc_to_yojson
    [
      ("Values", Some (rule_verdict_value_list_to_yojson x.values));
      ("Operator", Some (rule_verdict_operator_to_yojson x.operator));
      ("Evaluate", Some (rule_verdict_to_evaluate_to_yojson x.evaluate));
    ]

let rule_dmarc_operator_to_yojson (x : rule_dmarc_operator) =
  match x with NOT_EQUALS -> `String "NOT_EQUALS" | EQUALS -> `String "EQUALS"

let rule_dmarc_policy_to_yojson (x : rule_dmarc_policy) =
  match x with
  | REJECT -> `String "REJECT"
  | QUARANTINE -> `String "QUARANTINE"
  | NONE -> `String "NONE"

let rule_dmarc_value_list_to_yojson tree = list_to_yojson rule_dmarc_policy_to_yojson tree

let rule_dmarc_expression_to_yojson (x : rule_dmarc_expression) =
  assoc_to_yojson
    [
      ("Values", Some (rule_dmarc_value_list_to_yojson x.values));
      ("Operator", Some (rule_dmarc_operator_to_yojson x.operator));
    ]

let rule_condition_to_yojson (x : rule_condition) =
  match x with
  | DmarcExpression arg ->
      assoc_to_yojson [ ("DmarcExpression", Some (rule_dmarc_expression_to_yojson arg)) ]
  | VerdictExpression arg ->
      assoc_to_yojson [ ("VerdictExpression", Some (rule_verdict_expression_to_yojson arg)) ]
  | IpExpression arg ->
      assoc_to_yojson [ ("IpExpression", Some (rule_ip_expression_to_yojson arg)) ]
  | NumberExpression arg ->
      assoc_to_yojson [ ("NumberExpression", Some (rule_number_expression_to_yojson arg)) ]
  | StringExpression arg ->
      assoc_to_yojson [ ("StringExpression", Some (rule_string_expression_to_yojson arg)) ]
  | BooleanExpression arg ->
      assoc_to_yojson [ ("BooleanExpression", Some (rule_boolean_expression_to_yojson arg)) ]

let rule_conditions_to_yojson tree = list_to_yojson rule_condition_to_yojson tree
let drop_action_to_yojson = unit_to_yojson

let action_failure_policy_to_yojson (x : action_failure_policy) =
  match x with DROP -> `String "DROP" | CONTINUE -> `String "CONTINUE"

let id_or_arn_to_yojson = string_to_yojson

let mail_from_to_yojson (x : mail_from) =
  match x with PRESERVE -> `String "PRESERVE" | REPLACE -> `String "REPLACE"

let relay_action_to_yojson (x : relay_action) =
  assoc_to_yojson
    [
      ("MailFrom", option_to_yojson mail_from_to_yojson x.mail_from);
      ("Relay", Some (id_or_arn_to_yojson x.relay));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let name_or_arn_to_yojson = string_to_yojson

let archive_action_to_yojson (x : archive_action) =
  assoc_to_yojson
    [
      ("TargetArchive", Some (name_or_arn_to_yojson x.target_archive));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let iam_role_arn_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson
let s3_prefix_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let s3_action_to_yojson (x : s3_action) =
  assoc_to_yojson
    [
      ("S3SseKmsKeyId", option_to_yojson kms_key_id_to_yojson x.s3_sse_kms_key_id);
      ("S3Prefix", option_to_yojson s3_prefix_to_yojson x.s3_prefix);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let send_action_to_yojson (x : send_action) =
  assoc_to_yojson
    [
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let header_name_to_yojson = string_to_yojson
let header_value_to_yojson = string_to_yojson

let add_header_action_to_yojson (x : add_header_action) =
  assoc_to_yojson
    [
      ("HeaderValue", Some (header_value_to_yojson x.header_value));
      ("HeaderName", Some (header_name_to_yojson x.header_name));
    ]

let email_address_to_yojson = string_to_yojson
let recipients_to_yojson tree = list_to_yojson email_address_to_yojson tree

let replace_recipient_action_to_yojson (x : replace_recipient_action) =
  assoc_to_yojson [ ("ReplaceWith", option_to_yojson recipients_to_yojson x.replace_with) ]

let deliver_to_mailbox_action_to_yojson (x : deliver_to_mailbox_action) =
  assoc_to_yojson
    [
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("MailboxArn", Some (name_or_arn_to_yojson x.mailbox_arn));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let q_business_application_id_to_yojson = string_to_yojson
let q_business_index_id_to_yojson = string_to_yojson

let deliver_to_q_business_action_to_yojson (x : deliver_to_q_business_action) =
  assoc_to_yojson
    [
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("IndexId", Some (q_business_index_id_to_yojson x.index_id));
      ("ApplicationId", Some (q_business_application_id_to_yojson x.application_id));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let sns_topic_arn_to_yojson = string_to_yojson

let sns_notification_encoding_to_yojson (x : sns_notification_encoding) =
  match x with BASE64 -> `String "BASE64" | UTF_8 -> `String "UTF-8"

let sns_notification_payload_type_to_yojson (x : sns_notification_payload_type) =
  match x with CONTENT -> `String "CONTENT" | HEADERS -> `String "HEADERS"

let sns_action_to_yojson (x : sns_action) =
  assoc_to_yojson
    [
      ("PayloadType", option_to_yojson sns_notification_payload_type_to_yojson x.payload_type);
      ("Encoding", option_to_yojson sns_notification_encoding_to_yojson x.encoding);
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("TopicArn", Some (sns_topic_arn_to_yojson x.topic_arn));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let status_code_to_yojson = string_to_yojson
let smtp_reply_code_to_yojson = string_to_yojson
let diagnostic_message_to_yojson = string_to_yojson
let bounce_message_to_yojson = string_to_yojson

let bounce_action_to_yojson (x : bounce_action) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson bounce_message_to_yojson x.message);
      ("DiagnosticMessage", Some (diagnostic_message_to_yojson x.diagnostic_message));
      ("SmtpReplyCode", Some (smtp_reply_code_to_yojson x.smtp_reply_code));
      ("StatusCode", Some (status_code_to_yojson x.status_code));
      ("Sender", Some (email_address_to_yojson x.sender));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let lambda_function_arn_to_yojson = string_to_yojson

let lambda_invocation_type_to_yojson (x : lambda_invocation_type) =
  match x with REQUEST_RESPONSE -> `String "REQUEST_RESPONSE" | EVENT -> `String "EVENT"

let lambda_retry_time_minutes_to_yojson = int_to_yojson

let invoke_lambda_action_to_yojson (x : invoke_lambda_action) =
  assoc_to_yojson
    [
      ("RetryTimeMinutes", option_to_yojson lambda_retry_time_minutes_to_yojson x.retry_time_minutes);
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("InvocationType", Some (lambda_invocation_type_to_yojson x.invocation_type));
      ("FunctionArn", Some (lambda_function_arn_to_yojson x.function_arn));
      ( "ActionFailurePolicy",
        option_to_yojson action_failure_policy_to_yojson x.action_failure_policy );
    ]

let rule_action_to_yojson (x : rule_action) =
  match x with
  | InvokeLambda arg ->
      assoc_to_yojson [ ("InvokeLambda", Some (invoke_lambda_action_to_yojson arg)) ]
  | Bounce arg -> assoc_to_yojson [ ("Bounce", Some (bounce_action_to_yojson arg)) ]
  | PublishToSns arg -> assoc_to_yojson [ ("PublishToSns", Some (sns_action_to_yojson arg)) ]
  | DeliverToQBusiness arg ->
      assoc_to_yojson [ ("DeliverToQBusiness", Some (deliver_to_q_business_action_to_yojson arg)) ]
  | DeliverToMailbox arg ->
      assoc_to_yojson [ ("DeliverToMailbox", Some (deliver_to_mailbox_action_to_yojson arg)) ]
  | ReplaceRecipient arg ->
      assoc_to_yojson [ ("ReplaceRecipient", Some (replace_recipient_action_to_yojson arg)) ]
  | AddHeader arg -> assoc_to_yojson [ ("AddHeader", Some (add_header_action_to_yojson arg)) ]
  | Send arg -> assoc_to_yojson [ ("Send", Some (send_action_to_yojson arg)) ]
  | WriteToS3 arg -> assoc_to_yojson [ ("WriteToS3", Some (s3_action_to_yojson arg)) ]
  | Archive arg -> assoc_to_yojson [ ("Archive", Some (archive_action_to_yojson arg)) ]
  | Relay arg -> assoc_to_yojson [ ("Relay", Some (relay_action_to_yojson arg)) ]
  | Drop arg -> assoc_to_yojson [ ("Drop", Some (drop_action_to_yojson arg)) ]

let rule_actions_to_yojson tree = list_to_yojson rule_action_to_yojson tree

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("Actions", Some (rule_actions_to_yojson x.actions));
      ("Unless", option_to_yojson rule_conditions_to_yojson x.unless);
      ("Conditions", option_to_yojson rule_conditions_to_yojson x.conditions);
      ("Name", option_to_yojson rule_name_to_yojson x.name);
    ]

let rules_to_yojson tree = list_to_yojson rule_to_yojson tree

let update_rule_set_request_to_yojson (x : update_rule_set_request) =
  assoc_to_yojson
    [
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("RuleSetName", option_to_yojson rule_set_name_to_yojson x.rule_set_name);
      ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id));
    ]

let update_relay_response_to_yojson = unit_to_yojson
let relay_id_to_yojson = string_to_yojson
let relay_name_to_yojson = string_to_yojson
let relay_server_name_to_yojson = string_to_yojson
let relay_server_port_to_yojson = int_to_yojson
let secret_arn_to_yojson = string_to_yojson
let no_authentication_to_yojson = unit_to_yojson

let relay_authentication_to_yojson (x : relay_authentication) =
  match x with
  | NoAuthentication arg ->
      assoc_to_yojson [ ("NoAuthentication", Some (no_authentication_to_yojson arg)) ]
  | SecretArn arg -> assoc_to_yojson [ ("SecretArn", Some (secret_arn_to_yojson arg)) ]

let update_relay_request_to_yojson (x : update_relay_request) =
  assoc_to_yojson
    [
      ("Authentication", option_to_yojson relay_authentication_to_yojson x.authentication);
      ("ServerPort", option_to_yojson relay_server_port_to_yojson x.server_port);
      ("ServerName", option_to_yojson relay_server_name_to_yojson x.server_name);
      ("RelayName", option_to_yojson relay_name_to_yojson x.relay_name);
      ("RelayId", Some (relay_id_to_yojson x.relay_id));
    ]

let update_ingress_point_response_to_yojson = unit_to_yojson
let ingress_point_id_to_yojson = string_to_yojson
let ingress_point_name_to_yojson = string_to_yojson

let ingress_point_status_to_update_to_yojson (x : ingress_point_status_to_update) =
  match x with CLOSED -> `String "CLOSED" | ACTIVE -> `String "ACTIVE"

let smtp_password_to_yojson = string_to_yojson
let ca_content_to_yojson = string_to_yojson
let crl_content_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson

let trust_store_to_yojson (x : trust_store) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("CrlContent", option_to_yojson crl_content_to_yojson x.crl_content);
      ("CAContent", Some (ca_content_to_yojson x.ca_content));
    ]

let tls_auth_configuration_to_yojson (x : tls_auth_configuration) =
  assoc_to_yojson [ ("TrustStore", option_to_yojson trust_store_to_yojson x.trust_store) ]

let ingress_point_configuration_to_yojson (x : ingress_point_configuration) =
  match x with
  | TlsAuthConfiguration arg ->
      assoc_to_yojson [ ("TlsAuthConfiguration", Some (tls_auth_configuration_to_yojson arg)) ]
  | SecretArn arg -> assoc_to_yojson [ ("SecretArn", Some (secret_arn_to_yojson arg)) ]
  | SmtpPassword arg -> assoc_to_yojson [ ("SmtpPassword", Some (smtp_password_to_yojson arg)) ]

let tls_policy_to_yojson (x : tls_policy) =
  match x with
  | FIPS -> `String "FIPS"
  | OPTIONAL -> `String "OPTIONAL"
  | REQUIRED -> `String "REQUIRED"

let update_ingress_point_request_to_yojson (x : update_ingress_point_request) =
  assoc_to_yojson
    [
      ("TlsPolicy", option_to_yojson tls_policy_to_yojson x.tls_policy);
      ( "IngressPointConfiguration",
        option_to_yojson ingress_point_configuration_to_yojson x.ingress_point_configuration );
      ("TrafficPolicyId", option_to_yojson traffic_policy_id_to_yojson x.traffic_policy_id);
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ( "StatusToUpdate",
        option_to_yojson ingress_point_status_to_update_to_yojson x.status_to_update );
      ("IngressPointName", option_to_yojson ingress_point_name_to_yojson x.ingress_point_name);
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
    ]

let update_archive_response_to_yojson = unit_to_yojson
let archive_id_string_to_yojson = string_to_yojson
let archive_name_string_to_yojson = string_to_yojson

let retention_period_to_yojson (x : retention_period) =
  match x with
  | PERMANENT -> `String "PERMANENT"
  | TEN_YEARS -> `String "TEN_YEARS"
  | NINE_YEARS -> `String "NINE_YEARS"
  | EIGHT_YEARS -> `String "EIGHT_YEARS"
  | SEVEN_YEARS -> `String "SEVEN_YEARS"
  | SIX_YEARS -> `String "SIX_YEARS"
  | FIVE_YEARS -> `String "FIVE_YEARS"
  | FOUR_YEARS -> `String "FOUR_YEARS"
  | THREE_YEARS -> `String "THREE_YEARS"
  | THIRTY_MONTHS -> `String "THIRTY_MONTHS"
  | TWO_YEARS -> `String "TWO_YEARS"
  | EIGHTEEN_MONTHS -> `String "EIGHTEEN_MONTHS"
  | ONE_YEAR -> `String "ONE_YEAR"
  | NINE_MONTHS -> `String "NINE_MONTHS"
  | SIX_MONTHS -> `String "SIX_MONTHS"
  | THREE_MONTHS -> `String "THREE_MONTHS"

let archive_retention_to_yojson (x : archive_retention) =
  match x with
  | RetentionPeriod arg ->
      assoc_to_yojson [ ("RetentionPeriod", Some (retention_period_to_yojson arg)) ]

let update_archive_request_to_yojson (x : update_archive_request) =
  assoc_to_yojson
    [
      ("Retention", option_to_yojson archive_retention_to_yojson x.retention);
      ("ArchiveName", option_to_yojson archive_name_string_to_yojson x.archive_name);
      ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let trust_store_response_option_to_yojson (x : trust_store_response_option) =
  match x with INCLUDE -> `String "INCLUDE" | EXCLUDE -> `String "EXCLUDE"

let traffic_policy_to_yojson (x : traffic_policy) =
  assoc_to_yojson
    [
      ("DefaultAction", Some (accept_action_to_yojson x.default_action));
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ("TrafficPolicyName", Some (traffic_policy_name_to_yojson x.traffic_policy_name));
    ]

let traffic_policy_list_to_yojson tree = list_to_yojson traffic_policy_to_yojson tree
let traffic_policy_arn_to_yojson = string_to_yojson
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
    ]

let string_value_to_yojson = string_to_yojson
let string_value_list_to_yojson tree = list_to_yojson string_value_to_yojson tree
let stop_archive_search_response_to_yojson = unit_to_yojson
let search_id_to_yojson = string_to_yojson

let stop_archive_search_request_to_yojson (x : stop_archive_search_request) =
  assoc_to_yojson [ ("SearchId", Some (search_id_to_yojson x.search_id)) ]

let stop_archive_export_response_to_yojson = unit_to_yojson
let export_id_to_yojson = string_to_yojson

let stop_archive_export_request_to_yojson (x : stop_archive_export_request) =
  assoc_to_yojson [ ("ExportId", Some (export_id_to_yojson x.export_id)) ]

let stop_address_list_import_job_response_to_yojson = unit_to_yojson
let job_id_to_yojson = string_to_yojson

let stop_address_list_import_job_request_to_yojson (x : stop_address_list_import_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_archive_search_response_to_yojson (x : start_archive_search_response) =
  assoc_to_yojson [ ("SearchId", option_to_yojson search_id_to_yojson x.search_id) ]

let archive_id_to_yojson = string_to_yojson

let archive_string_email_attribute_to_yojson (x : archive_string_email_attribute) =
  match x with
  | ENVELOPE_FROM -> `String "ENVELOPE_FROM"
  | ENVELOPE_TO -> `String "ENVELOPE_TO"
  | SUBJECT -> `String "SUBJECT"
  | CC -> `String "CC"
  | FROM -> `String "FROM"
  | TO -> `String "TO"

let archive_string_to_evaluate_to_yojson (x : archive_string_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (archive_string_email_attribute_to_yojson arg)) ]

let archive_string_operator_to_yojson (x : archive_string_operator) =
  match x with CONTAINS -> `String "CONTAINS"

let archive_string_expression_to_yojson (x : archive_string_expression) =
  assoc_to_yojson
    [
      ("Values", Some (string_value_list_to_yojson x.values));
      ("Operator", Some (archive_string_operator_to_yojson x.operator));
      ("Evaluate", Some (archive_string_to_evaluate_to_yojson x.evaluate));
    ]

let archive_boolean_email_attribute_to_yojson (x : archive_boolean_email_attribute) =
  match x with HAS_ATTACHMENTS -> `String "HAS_ATTACHMENTS"

let archive_boolean_to_evaluate_to_yojson (x : archive_boolean_to_evaluate) =
  match x with
  | Attribute arg ->
      assoc_to_yojson [ ("Attribute", Some (archive_boolean_email_attribute_to_yojson arg)) ]

let archive_boolean_operator_to_yojson (x : archive_boolean_operator) =
  match x with IS_FALSE -> `String "IS_FALSE" | IS_TRUE -> `String "IS_TRUE"

let archive_boolean_expression_to_yojson (x : archive_boolean_expression) =
  assoc_to_yojson
    [
      ("Operator", Some (archive_boolean_operator_to_yojson x.operator));
      ("Evaluate", Some (archive_boolean_to_evaluate_to_yojson x.evaluate));
    ]

let archive_filter_condition_to_yojson (x : archive_filter_condition) =
  match x with
  | BooleanExpression arg ->
      assoc_to_yojson [ ("BooleanExpression", Some (archive_boolean_expression_to_yojson arg)) ]
  | StringExpression arg ->
      assoc_to_yojson [ ("StringExpression", Some (archive_string_expression_to_yojson arg)) ]

let archive_filter_conditions_to_yojson tree =
  list_to_yojson archive_filter_condition_to_yojson tree

let archive_filters_to_yojson (x : archive_filters) =
  assoc_to_yojson
    [
      ("Unless", option_to_yojson archive_filter_conditions_to_yojson x.unless);
      ("Include", option_to_yojson archive_filter_conditions_to_yojson x.include_);
    ]

let search_max_results_to_yojson = int_to_yojson

let start_archive_search_request_to_yojson (x : start_archive_search_request) =
  assoc_to_yojson
    [
      ("MaxResults", Some (search_max_results_to_yojson x.max_results));
      ( "ToTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.to_timestamp)
      );
      ( "FromTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.from_timestamp)
      );
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
    ]

let start_archive_export_response_to_yojson (x : start_archive_export_response) =
  assoc_to_yojson [ ("ExportId", option_to_yojson export_id_to_yojson x.export_id) ]

let export_max_results_to_yojson = int_to_yojson
let s3_location_to_yojson = string_to_yojson

let s3_export_destination_configuration_to_yojson (x : s3_export_destination_configuration) =
  assoc_to_yojson [ ("S3Location", option_to_yojson s3_location_to_yojson x.s3_location) ]

let export_destination_configuration_to_yojson (x : export_destination_configuration) =
  match x with
  | S3 arg -> assoc_to_yojson [ ("S3", Some (s3_export_destination_configuration_to_yojson arg)) ]

let start_archive_export_request_to_yojson (x : start_archive_export_request) =
  assoc_to_yojson
    [
      ( "IncludeMetadata",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.include_metadata
      );
      ( "ExportDestinationConfiguration",
        Some (export_destination_configuration_to_yojson x.export_destination_configuration) );
      ("MaxResults", option_to_yojson export_max_results_to_yojson x.max_results);
      ( "ToTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.to_timestamp)
      );
      ( "FromTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.from_timestamp)
      );
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
    ]

let start_address_list_import_job_response_to_yojson = unit_to_yojson

let start_address_list_import_job_request_to_yojson (x : start_address_list_import_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let sender_ip_address_to_yojson = string_to_yojson

let search_state_to_yojson (x : search_state) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | RUNNING -> `String "RUNNING"
  | QUEUED -> `String "QUEUED"

let search_status_to_yojson (x : search_status) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("State", option_to_yojson search_state_to_yojson x.state);
      ( "CompletionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completion_timestamp );
      ( "SubmissionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.submission_timestamp );
    ]

let search_summary_to_yojson (x : search_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson search_status_to_yojson x.status);
      ("SearchId", option_to_yojson search_id_to_yojson x.search_id);
    ]

let search_summary_list_to_yojson tree = list_to_yojson search_summary_to_yojson tree
let address_to_yojson = string_to_yojson

let saved_address_to_yojson (x : saved_address) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Address", Some (address_to_yojson x.address));
    ]

let saved_addresses_to_yojson tree = list_to_yojson saved_address_to_yojson tree
let s3_presigned_ur_l_to_yojson = string_to_yojson

let rule_set_to_yojson (x : rule_set) =
  assoc_to_yojson
    [
      ( "LastModificationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_modification_date );
      ("RuleSetName", option_to_yojson rule_set_name_to_yojson x.rule_set_name);
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
    ]

let rule_sets_to_yojson tree = list_to_yojson rule_set_to_yojson tree
let rule_set_arn_to_yojson = string_to_yojson
let archived_message_id_to_yojson = string_to_yojson

let email_received_headers_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let envelope_to_yojson (x : envelope) =
  assoc_to_yojson
    [
      ("To", option_to_yojson string_list_to_yojson x.to_);
      ("From", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.from_);
      ("Helo", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.helo);
    ]

let row_to_yojson (x : row) =
  assoc_to_yojson
    [
      ( "SourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_arn );
      ("Envelope", option_to_yojson envelope_to_yojson x.envelope);
      ("SenderIpAddress", option_to_yojson sender_ip_address_to_yojson x.sender_ip_address);
      ( "SenderHostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_hostname
      );
      ("IngressPointId", option_to_yojson ingress_point_id_to_yojson x.ingress_point_id);
      ( "XPriority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.x_priority );
      ( "XOriginalMailer",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.x_original_mailer
      );
      ( "XMailer",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.x_mailer );
      ( "InReplyTo",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.in_reply_to );
      ("ReceivedHeaders", option_to_yojson email_received_headers_list_to_yojson x.received_headers);
      ( "HasAttachments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.has_attachments
      );
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
      ("Subject", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.subject);
      ("Cc", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cc);
      ("From", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.from_);
      ("To", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.to_);
      ("Date", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.date);
      ( "ReceivedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.received_timestamp );
      ("ArchivedMessageId", option_to_yojson archived_message_id_to_yojson x.archived_message_id);
    ]

let rows_list_to_yojson tree = list_to_yojson row_to_yojson tree

let relay_to_yojson (x : relay) =
  assoc_to_yojson
    [
      ( "LastModifiedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_modified_timestamp );
      ("RelayName", option_to_yojson relay_name_to_yojson x.relay_name);
      ("RelayId", option_to_yojson relay_id_to_yojson x.relay_id);
    ]

let relays_to_yojson tree = list_to_yojson relay_to_yojson tree
let relay_arn_to_yojson = string_to_yojson
let register_member_to_address_list_response_to_yojson = unit_to_yojson
let address_list_id_to_yojson = string_to_yojson

let register_member_to_address_list_request_to_yojson (x : register_member_to_address_list_request)
    =
  assoc_to_yojson
    [
      ("Address", Some (address_to_yojson x.address));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let ip_type_to_yojson (x : ip_type) =
  match x with DUAL_STACK -> `String "DUAL_STACK" | IPV4 -> `String "IPV4"

let public_network_configuration_to_yojson (x : public_network_configuration) =
  assoc_to_yojson [ ("IpType", Some (ip_type_to_yojson x.ip_type)) ]

let private_network_configuration_to_yojson (x : private_network_configuration) =
  assoc_to_yojson [ ("VpcEndpointId", Some (vpc_endpoint_id_to_yojson x.vpc_endpoint_id)) ]

let pre_signed_url_to_yojson = string_to_yojson
let pagination_token_to_yojson = string_to_yojson
let page_size_to_yojson = int_to_yojson

let network_configuration_to_yojson (x : network_configuration) =
  match x with
  | PrivateNetworkConfiguration arg ->
      assoc_to_yojson
        [ ("PrivateNetworkConfiguration", Some (private_network_configuration_to_yojson arg)) ]
  | PublicNetworkConfiguration arg ->
      assoc_to_yojson
        [ ("PublicNetworkConfiguration", Some (public_network_configuration_to_yojson arg)) ]

let metadata_to_yojson (x : metadata) =
  assoc_to_yojson
    [
      ( "SourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_arn );
      ( "ConfigurationSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set
      );
      ( "SendingPool",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sending_pool );
      ( "SourceIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_identity
      );
      ( "SendingMethod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sending_method );
      ( "TlsProtocol",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tls_protocol );
      ( "TlsCipherSuite",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tls_cipher_suite
      );
      ("SenderIpAddress", option_to_yojson sender_ip_address_to_yojson x.sender_ip_address);
      ( "SenderHostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_hostname
      );
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ("TrafficPolicyId", option_to_yojson traffic_policy_id_to_yojson x.traffic_policy_id);
      ("IngressPointId", option_to_yojson ingress_point_id_to_yojson x.ingress_point_id);
      ( "Timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.timestamp );
    ]

let message_body_to_yojson (x : message_body) =
  assoc_to_yojson
    [
      ( "MessageMalformed",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_malformed );
      ("Html", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.html);
      ("Text", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.text);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", Some (tag_list_to_yojson x.tags)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let list_members_of_address_list_response_to_yojson (x : list_members_of_address_list_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Addresses", Some (saved_addresses_to_yojson x.addresses));
    ]

let address_prefix_to_yojson = string_to_yojson

let address_filter_to_yojson (x : address_filter) =
  assoc_to_yojson [ ("AddressPrefix", option_to_yojson address_prefix_to_yojson x.address_prefix) ]

let address_page_size_to_yojson = int_to_yojson

let list_members_of_address_list_request_to_yojson (x : list_members_of_address_list_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson address_page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Filter", option_to_yojson address_filter_to_yojson x.filter);
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let list_archive_searches_response_to_yojson (x : list_archive_searches_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Searches", option_to_yojson search_summary_list_to_yojson x.searches);
    ]

let list_archive_searches_request_to_yojson (x : list_archive_searches_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
    ]

let export_state_to_yojson (x : export_state) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | PROCESSING -> `String "PROCESSING"
  | PREPROCESSING -> `String "PREPROCESSING"
  | QUEUED -> `String "QUEUED"

let export_status_to_yojson (x : export_status) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("State", option_to_yojson export_state_to_yojson x.state);
      ( "CompletionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completion_timestamp );
      ( "SubmissionTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.submission_timestamp );
    ]

let export_summary_to_yojson (x : export_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson export_status_to_yojson x.status);
      ("ExportId", option_to_yojson export_id_to_yojson x.export_id);
    ]

let export_summary_list_to_yojson tree = list_to_yojson export_summary_to_yojson tree

let list_archive_exports_response_to_yojson (x : list_archive_exports_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Exports", option_to_yojson export_summary_list_to_yojson x.exports);
    ]

let list_archive_exports_request_to_yojson (x : list_archive_exports_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ArchiveId", Some (archive_id_to_yojson x.archive_id));
    ]

let job_name_to_yojson = string_to_yojson

let import_job_status_to_yojson (x : import_job_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | PROCESSING -> `String "PROCESSING"
  | CREATED -> `String "CREATED"

let job_items_count_to_yojson = int_to_yojson

let import_data_type_to_yojson (x : import_data_type) =
  match x with JSON -> `String "JSON" | CSV -> `String "CSV"

let import_data_format_to_yojson (x : import_data_format) =
  assoc_to_yojson [ ("ImportDataType", Some (import_data_type_to_yojson x.import_data_type)) ]

let import_job_to_yojson (x : import_job) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_message_to_yojson x.error);
      ( "CompletedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "StartTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_timestamp );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("ImportDataFormat", Some (import_data_format_to_yojson x.import_data_format));
      ("FailedItemsCount", option_to_yojson job_items_count_to_yojson x.failed_items_count);
      ("ImportedItemsCount", option_to_yojson job_items_count_to_yojson x.imported_items_count);
      ("PreSignedUrl", Some (pre_signed_url_to_yojson x.pre_signed_url));
      ("Status", Some (import_job_status_to_yojson x.status));
      ("Name", Some (job_name_to_yojson x.name));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let import_jobs_to_yojson tree = list_to_yojson import_job_to_yojson tree

let list_address_list_import_jobs_response_to_yojson (x : list_address_list_import_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ImportJobs", Some (import_jobs_to_yojson x.import_jobs));
    ]

let list_address_list_import_jobs_request_to_yojson (x : list_address_list_import_jobs_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let get_member_of_address_list_response_to_yojson (x : get_member_of_address_list_response) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Address", Some (address_to_yojson x.address));
    ]

let get_member_of_address_list_request_to_yojson (x : get_member_of_address_list_request) =
  assoc_to_yojson
    [
      ("Address", Some (address_to_yojson x.address));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let get_archive_search_results_response_to_yojson (x : get_archive_search_results_response) =
  assoc_to_yojson [ ("Rows", option_to_yojson rows_list_to_yojson x.rows) ]

let get_archive_search_results_request_to_yojson (x : get_archive_search_results_request) =
  assoc_to_yojson [ ("SearchId", Some (search_id_to_yojson x.search_id)) ]

let get_archive_search_response_to_yojson (x : get_archive_search_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson search_status_to_yojson x.status);
      ("MaxResults", option_to_yojson search_max_results_to_yojson x.max_results);
      ( "ToTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.to_timestamp );
      ( "FromTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.from_timestamp );
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ("ArchiveId", option_to_yojson archive_id_to_yojson x.archive_id);
    ]

let get_archive_search_request_to_yojson (x : get_archive_search_request) =
  assoc_to_yojson [ ("SearchId", Some (search_id_to_yojson x.search_id)) ]

let get_archive_message_content_response_to_yojson (x : get_archive_message_content_response) =
  assoc_to_yojson [ ("Body", option_to_yojson message_body_to_yojson x.body) ]

let get_archive_message_content_request_to_yojson (x : get_archive_message_content_request) =
  assoc_to_yojson
    [ ("ArchivedMessageId", Some (archived_message_id_to_yojson x.archived_message_id)) ]

let get_archive_message_response_to_yojson (x : get_archive_message_response) =
  assoc_to_yojson
    [
      ("Envelope", option_to_yojson envelope_to_yojson x.envelope);
      ("Metadata", option_to_yojson metadata_to_yojson x.metadata);
      ("MessageDownloadLink", option_to_yojson s3_presigned_ur_l_to_yojson x.message_download_link);
    ]

let get_archive_message_request_to_yojson (x : get_archive_message_request) =
  assoc_to_yojson
    [ ("ArchivedMessageId", Some (archived_message_id_to_yojson x.archived_message_id)) ]

let get_archive_export_response_to_yojson (x : get_archive_export_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson export_status_to_yojson x.status);
      ( "ExportDestinationConfiguration",
        option_to_yojson export_destination_configuration_to_yojson
          x.export_destination_configuration );
      ("MaxResults", option_to_yojson export_max_results_to_yojson x.max_results);
      ( "ToTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.to_timestamp );
      ( "FromTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.from_timestamp );
      ("Filters", option_to_yojson archive_filters_to_yojson x.filters);
      ("ArchiveId", option_to_yojson archive_id_to_yojson x.archive_id);
    ]

let get_archive_export_request_to_yojson (x : get_archive_export_request) =
  assoc_to_yojson [ ("ExportId", Some (export_id_to_yojson x.export_id)) ]

let get_address_list_import_job_response_to_yojson (x : get_address_list_import_job_response) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_message_to_yojson x.error);
      ( "CompletedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "StartTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_timestamp );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ("ImportDataFormat", Some (import_data_format_to_yojson x.import_data_format));
      ("FailedItemsCount", option_to_yojson job_items_count_to_yojson x.failed_items_count);
      ("ImportedItemsCount", option_to_yojson job_items_count_to_yojson x.imported_items_count);
      ("PreSignedUrl", Some (pre_signed_url_to_yojson x.pre_signed_url));
      ("Status", Some (import_job_status_to_yojson x.status));
      ("Name", Some (job_name_to_yojson x.name));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let get_address_list_import_job_request_to_yojson (x : get_address_list_import_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let deregister_member_from_address_list_response_to_yojson = unit_to_yojson

let deregister_member_from_address_list_request_to_yojson
    (x : deregister_member_from_address_list_request) =
  assoc_to_yojson
    [
      ("Address", Some (address_to_yojson x.address));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let create_address_list_import_job_response_to_yojson (x : create_address_list_import_job_response)
    =
  assoc_to_yojson
    [
      ("PreSignedUrl", Some (pre_signed_url_to_yojson x.pre_signed_url));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let idempotency_token_to_yojson = string_to_yojson

let create_address_list_import_job_request_to_yojson (x : create_address_list_import_job_request) =
  assoc_to_yojson
    [
      ("ImportDataFormat", Some (import_data_format_to_yojson x.import_data_format));
      ("Name", Some (job_name_to_yojson x.name));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let list_traffic_policies_response_to_yojson (x : list_traffic_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("TrafficPolicies", option_to_yojson traffic_policy_list_to_yojson x.traffic_policies);
    ]

let list_traffic_policies_request_to_yojson (x : list_traffic_policies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let list_rule_sets_response_to_yojson (x : list_rule_sets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RuleSets", Some (rule_sets_to_yojson x.rule_sets));
    ]

let list_rule_sets_request_to_yojson (x : list_rule_sets_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_relays_response_to_yojson (x : list_relays_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Relays", Some (relays_to_yojson x.relays));
    ]

let list_relays_request_to_yojson (x : list_relays_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "PageSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.page_size );
    ]

let ingress_point_status_to_yojson (x : ingress_point_status) =
  match x with
  | ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST -> `String "ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST"
  | FAILED -> `String "FAILED"
  | CLOSED -> `String "CLOSED"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DEPROVISIONING -> `String "DEPROVISIONING"
  | PROVISIONING -> `String "PROVISIONING"

let ingress_point_type_to_yojson (x : ingress_point_type) =
  match x with MTLS -> `String "MTLS" | AUTH -> `String "AUTH" | OPEN -> `String "OPEN"

let ingress_point_a_record_to_yojson = string_to_yojson

let ingress_point_to_yojson (x : ingress_point) =
  assoc_to_yojson
    [
      ("ARecord", option_to_yojson ingress_point_a_record_to_yojson x.a_record);
      ("Type", Some (ingress_point_type_to_yojson x.type_));
      ("Status", Some (ingress_point_status_to_yojson x.status));
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
      ("IngressPointName", Some (ingress_point_name_to_yojson x.ingress_point_name));
    ]

let ingress_points_list_to_yojson tree = list_to_yojson ingress_point_to_yojson tree

let list_ingress_points_response_to_yojson (x : list_ingress_points_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("IngressPoints", option_to_yojson ingress_points_list_to_yojson x.ingress_points);
    ]

let list_ingress_points_request_to_yojson (x : list_ingress_points_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let archive_state_to_yojson (x : archive_state) =
  match x with PENDING_DELETION -> `String "PENDING_DELETION" | ACTIVE -> `String "ACTIVE"

let archive_to_yojson (x : archive) =
  assoc_to_yojson
    [
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ("ArchiveState", option_to_yojson archive_state_to_yojson x.archive_state);
      ("ArchiveName", option_to_yojson archive_name_string_to_yojson x.archive_name);
      ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id));
    ]

let archives_list_to_yojson tree = list_to_yojson archive_to_yojson tree

let list_archives_response_to_yojson (x : list_archives_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Archives", Some (archives_list_to_yojson x.archives));
    ]

let list_archives_request_to_yojson (x : list_archives_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let address_list_name_to_yojson = string_to_yojson

let address_list_to_yojson (x : address_list) =
  assoc_to_yojson
    [
      ( "LastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("AddressListName", Some (address_list_name_to_yojson x.address_list_name));
      ("AddressListArn", Some (address_list_arn_to_yojson x.address_list_arn));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let address_lists_to_yojson tree = list_to_yojson address_list_to_yojson tree

let list_address_lists_response_to_yojson (x : list_address_lists_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AddressLists", Some (address_lists_to_yojson x.address_lists));
    ]

let list_address_lists_request_to_yojson (x : list_address_lists_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let addon_subscription_id_to_yojson = string_to_yojson
let addon_name_to_yojson = string_to_yojson
let addon_subscription_arn_to_yojson = string_to_yojson

let addon_subscription_to_yojson (x : addon_subscription) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "AddonSubscriptionArn",
        option_to_yojson addon_subscription_arn_to_yojson x.addon_subscription_arn );
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ( "AddonSubscriptionId",
        option_to_yojson addon_subscription_id_to_yojson x.addon_subscription_id );
    ]

let addon_subscriptions_to_yojson tree = list_to_yojson addon_subscription_to_yojson tree

let list_addon_subscriptions_response_to_yojson (x : list_addon_subscriptions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AddonSubscriptions", option_to_yojson addon_subscriptions_to_yojson x.addon_subscriptions);
    ]

let list_addon_subscriptions_request_to_yojson (x : list_addon_subscriptions_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let addon_instance_id_to_yojson = string_to_yojson
let addon_instance_arn_to_yojson = string_to_yojson

let addon_instance_to_yojson (x : addon_instance) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("AddonInstanceArn", option_to_yojson addon_instance_arn_to_yojson x.addon_instance_arn);
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ( "AddonSubscriptionId",
        option_to_yojson addon_subscription_id_to_yojson x.addon_subscription_id );
      ("AddonInstanceId", option_to_yojson addon_instance_id_to_yojson x.addon_instance_id);
    ]

let addon_instances_to_yojson tree = list_to_yojson addon_instance_to_yojson tree

let list_addon_instances_response_to_yojson (x : list_addon_instances_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AddonInstances", option_to_yojson addon_instances_to_yojson x.addon_instances);
    ]

let list_addon_instances_request_to_yojson (x : list_addon_instances_request) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let ingress_point_password_configuration_to_yojson (x : ingress_point_password_configuration) =
  assoc_to_yojson
    [
      ( "PreviousSmtpPasswordExpiryTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.previous_smtp_password_expiry_timestamp );
      ( "PreviousSmtpPasswordVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.previous_smtp_password_version );
      ( "SmtpPasswordVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.smtp_password_version );
    ]

let ingress_point_auth_configuration_to_yojson (x : ingress_point_auth_configuration) =
  assoc_to_yojson
    [
      ( "TlsAuthConfiguration",
        option_to_yojson tls_auth_configuration_to_yojson x.tls_auth_configuration );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "IngressPointPasswordConfiguration",
        option_to_yojson ingress_point_password_configuration_to_yojson
          x.ingress_point_password_configuration );
    ]

let ingress_point_arn_to_yojson = string_to_yojson

let get_traffic_policy_response_to_yojson (x : get_traffic_policy_response) =
  assoc_to_yojson
    [
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("DefaultAction", option_to_yojson accept_action_to_yojson x.default_action);
      ( "MaxMessageSizeBytes",
        option_to_yojson max_message_size_bytes_to_yojson x.max_message_size_bytes );
      ("PolicyStatements", option_to_yojson policy_statement_list_to_yojson x.policy_statements);
      ("TrafficPolicyArn", option_to_yojson traffic_policy_arn_to_yojson x.traffic_policy_arn);
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ("TrafficPolicyName", Some (traffic_policy_name_to_yojson x.traffic_policy_name));
    ]

let get_traffic_policy_request_to_yojson (x : get_traffic_policy_request) =
  assoc_to_yojson [ ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id)) ]

let get_rule_set_response_to_yojson (x : get_rule_set_response) =
  assoc_to_yojson
    [
      ("Rules", Some (rules_to_yojson x.rules));
      ( "LastModificationDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modification_date) );
      ( "CreatedDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_date)
      );
      ("RuleSetName", Some (rule_set_name_to_yojson x.rule_set_name));
      ("RuleSetArn", Some (rule_set_arn_to_yojson x.rule_set_arn));
      ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id));
    ]

let get_rule_set_request_to_yojson (x : get_rule_set_request) =
  assoc_to_yojson [ ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id)) ]

let get_relay_response_to_yojson (x : get_relay_response) =
  assoc_to_yojson
    [
      ( "LastModifiedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_modified_timestamp );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Authentication", option_to_yojson relay_authentication_to_yojson x.authentication);
      ("ServerPort", option_to_yojson relay_server_port_to_yojson x.server_port);
      ("ServerName", option_to_yojson relay_server_name_to_yojson x.server_name);
      ("RelayName", option_to_yojson relay_name_to_yojson x.relay_name);
      ("RelayArn", option_to_yojson relay_arn_to_yojson x.relay_arn);
      ("RelayId", Some (relay_id_to_yojson x.relay_id));
    ]

let get_relay_request_to_yojson (x : get_relay_request) =
  assoc_to_yojson [ ("RelayId", Some (relay_id_to_yojson x.relay_id)) ]

let get_ingress_point_response_to_yojson (x : get_ingress_point_response) =
  assoc_to_yojson
    [
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("TlsPolicy", option_to_yojson tls_policy_to_yojson x.tls_policy);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "IngressPointAuthConfiguration",
        option_to_yojson ingress_point_auth_configuration_to_yojson
          x.ingress_point_auth_configuration );
      ("TrafficPolicyId", option_to_yojson traffic_policy_id_to_yojson x.traffic_policy_id);
      ("RuleSetId", option_to_yojson rule_set_id_to_yojson x.rule_set_id);
      ("ARecord", option_to_yojson ingress_point_a_record_to_yojson x.a_record);
      ("Type", option_to_yojson ingress_point_type_to_yojson x.type_);
      ("Status", option_to_yojson ingress_point_status_to_yojson x.status);
      ("IngressPointArn", option_to_yojson ingress_point_arn_to_yojson x.ingress_point_arn);
      ("IngressPointName", Some (ingress_point_name_to_yojson x.ingress_point_name));
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
    ]

let get_ingress_point_request_to_yojson (x : get_ingress_point_request) =
  assoc_to_yojson
    [
      ( "IncludeTrustStoreContents",
        option_to_yojson trust_store_response_option_to_yojson x.include_trust_store_contents );
      ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id));
    ]

let archive_arn_to_yojson = string_to_yojson

let get_archive_response_to_yojson (x : get_archive_response) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ( "LastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Retention", Some (archive_retention_to_yojson x.retention));
      ("ArchiveState", Some (archive_state_to_yojson x.archive_state));
      ("ArchiveArn", Some (archive_arn_to_yojson x.archive_arn));
      ("ArchiveName", Some (archive_name_string_to_yojson x.archive_name));
      ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id));
    ]

let get_archive_request_to_yojson (x : get_archive_request) =
  assoc_to_yojson [ ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id)) ]

let get_address_list_response_to_yojson (x : get_address_list_response) =
  assoc_to_yojson
    [
      ( "LastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("AddressListName", Some (address_list_name_to_yojson x.address_list_name));
      ("AddressListArn", Some (address_list_arn_to_yojson x.address_list_arn));
      ("AddressListId", Some (address_list_id_to_yojson x.address_list_id));
    ]

let get_address_list_request_to_yojson (x : get_address_list_request) =
  assoc_to_yojson [ ("AddressListId", Some (address_list_id_to_yojson x.address_list_id)) ]

let get_addon_subscription_response_to_yojson (x : get_addon_subscription_response) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "AddonSubscriptionArn",
        option_to_yojson addon_subscription_arn_to_yojson x.addon_subscription_arn );
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
    ]

let get_addon_subscription_request_to_yojson (x : get_addon_subscription_request) =
  assoc_to_yojson
    [ ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id)) ]

let get_addon_instance_response_to_yojson (x : get_addon_instance_response) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("AddonInstanceArn", option_to_yojson addon_instance_arn_to_yojson x.addon_instance_arn);
      ("AddonName", option_to_yojson addon_name_to_yojson x.addon_name);
      ( "AddonSubscriptionId",
        option_to_yojson addon_subscription_id_to_yojson x.addon_subscription_id );
    ]

let get_addon_instance_request_to_yojson (x : get_addon_instance_request) =
  assoc_to_yojson [ ("AddonInstanceId", Some (addon_instance_id_to_yojson x.addon_instance_id)) ]

let delete_traffic_policy_response_to_yojson = unit_to_yojson

let delete_traffic_policy_request_to_yojson (x : delete_traffic_policy_request) =
  assoc_to_yojson [ ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id)) ]

let delete_rule_set_response_to_yojson = unit_to_yojson

let delete_rule_set_request_to_yojson (x : delete_rule_set_request) =
  assoc_to_yojson [ ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id)) ]

let delete_relay_response_to_yojson = unit_to_yojson

let delete_relay_request_to_yojson (x : delete_relay_request) =
  assoc_to_yojson [ ("RelayId", Some (relay_id_to_yojson x.relay_id)) ]

let delete_ingress_point_response_to_yojson = unit_to_yojson

let delete_ingress_point_request_to_yojson (x : delete_ingress_point_request) =
  assoc_to_yojson [ ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id)) ]

let delete_archive_response_to_yojson = unit_to_yojson

let delete_archive_request_to_yojson (x : delete_archive_request) =
  assoc_to_yojson [ ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id)) ]

let delete_address_list_response_to_yojson = unit_to_yojson

let delete_address_list_request_to_yojson (x : delete_address_list_request) =
  assoc_to_yojson [ ("AddressListId", Some (address_list_id_to_yojson x.address_list_id)) ]

let delete_addon_subscription_response_to_yojson = unit_to_yojson

let delete_addon_subscription_request_to_yojson (x : delete_addon_subscription_request) =
  assoc_to_yojson
    [ ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id)) ]

let delete_addon_instance_response_to_yojson = unit_to_yojson

let delete_addon_instance_request_to_yojson (x : delete_addon_instance_request) =
  assoc_to_yojson [ ("AddonInstanceId", Some (addon_instance_id_to_yojson x.addon_instance_id)) ]

let create_traffic_policy_response_to_yojson (x : create_traffic_policy_response) =
  assoc_to_yojson [ ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id)) ]

let create_traffic_policy_request_to_yojson (x : create_traffic_policy_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "MaxMessageSizeBytes",
        option_to_yojson max_message_size_bytes_to_yojson x.max_message_size_bytes );
      ("DefaultAction", Some (accept_action_to_yojson x.default_action));
      ("PolicyStatements", Some (policy_statement_list_to_yojson x.policy_statements));
      ("TrafficPolicyName", Some (traffic_policy_name_to_yojson x.traffic_policy_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_rule_set_response_to_yojson (x : create_rule_set_response) =
  assoc_to_yojson [ ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id)) ]

let create_rule_set_request_to_yojson (x : create_rule_set_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Rules", Some (rules_to_yojson x.rules));
      ("RuleSetName", Some (rule_set_name_to_yojson x.rule_set_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_relay_response_to_yojson (x : create_relay_response) =
  assoc_to_yojson [ ("RelayId", Some (relay_id_to_yojson x.relay_id)) ]

let create_relay_request_to_yojson (x : create_relay_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Authentication", Some (relay_authentication_to_yojson x.authentication));
      ("ServerPort", Some (relay_server_port_to_yojson x.server_port));
      ("ServerName", Some (relay_server_name_to_yojson x.server_name));
      ("RelayName", Some (relay_name_to_yojson x.relay_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_ingress_point_response_to_yojson (x : create_ingress_point_response) =
  assoc_to_yojson [ ("IngressPointId", Some (ingress_point_id_to_yojson x.ingress_point_id)) ]

let create_ingress_point_request_to_yojson (x : create_ingress_point_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("TlsPolicy", option_to_yojson tls_policy_to_yojson x.tls_policy);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "IngressPointConfiguration",
        option_to_yojson ingress_point_configuration_to_yojson x.ingress_point_configuration );
      ("TrafficPolicyId", Some (traffic_policy_id_to_yojson x.traffic_policy_id));
      ("RuleSetId", Some (rule_set_id_to_yojson x.rule_set_id));
      ("Type", Some (ingress_point_type_to_yojson x.type_));
      ("IngressPointName", Some (ingress_point_name_to_yojson x.ingress_point_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_archive_response_to_yojson (x : create_archive_response) =
  assoc_to_yojson [ ("ArchiveId", Some (archive_id_string_to_yojson x.archive_id)) ]

let create_archive_request_to_yojson (x : create_archive_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("Retention", option_to_yojson archive_retention_to_yojson x.retention);
      ("ArchiveName", Some (archive_name_string_to_yojson x.archive_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_address_list_response_to_yojson (x : create_address_list_response) =
  assoc_to_yojson [ ("AddressListId", Some (address_list_id_to_yojson x.address_list_id)) ]

let create_address_list_request_to_yojson (x : create_address_list_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AddressListName", Some (address_list_name_to_yojson x.address_list_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_addon_subscription_response_to_yojson (x : create_addon_subscription_response) =
  assoc_to_yojson
    [ ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id)) ]

let create_addon_subscription_request_to_yojson (x : create_addon_subscription_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AddonName", Some (addon_name_to_yojson x.addon_name));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_addon_instance_response_to_yojson (x : create_addon_instance_response) =
  assoc_to_yojson [ ("AddonInstanceId", Some (addon_instance_id_to_yojson x.addon_instance_id)) ]

let create_addon_instance_request_to_yojson (x : create_addon_instance_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AddonSubscriptionId", Some (addon_subscription_id_to_yojson x.addon_subscription_id));
      ( "ClientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
