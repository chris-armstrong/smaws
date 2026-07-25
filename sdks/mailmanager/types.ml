type nonrec accept_action = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Occurs when a user is denied access to a specific resource or action.\n"]

type nonrec action_failure_policy = CONTINUE [@ocaml.doc ""] | DROP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec header_value = string [@@ocaml.doc ""]

type nonrec header_name = string [@@ocaml.doc ""]

type nonrec add_header_action = {
  header_name : header_name;
      [@ocaml.doc
        "The name of the header to add to an email. The header must be prefixed with \"X-\". \
         Headers are added regardless of whether the header name pre-existed in the email.\n"]
  header_value : header_value; [@ocaml.doc "The value of the header to add to the email.\n"]
}
[@@ocaml.doc
  "The action to add a header to a message. When executed, this action will add the given header \
   to the message.\n"]

type nonrec addon_instance_arn = string [@@ocaml.doc ""]

type nonrec addon_name = string [@@ocaml.doc ""]

type nonrec addon_subscription_id = string [@@ocaml.doc ""]

type nonrec addon_instance_id = string [@@ocaml.doc ""]

type nonrec addon_instance = {
  addon_instance_id : addon_instance_id option;
      [@ocaml.doc "The unique ID of the Add On instance.\n"]
  addon_subscription_id : addon_subscription_id option;
      [@ocaml.doc "The subscription ID for the instance.\n"]
  addon_name : addon_name option; [@ocaml.doc "The name of the Add On for the instance.\n"]
  addon_instance_arn : addon_instance_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Add On instance.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the Add On instance was created.\n"]
}
[@@ocaml.doc "An Add On instance represents a specific configuration of an Add On.\n"]

type nonrec addon_instance_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec addon_instances = addon_instance list [@@ocaml.doc ""]

type nonrec addon_subscription_arn = string [@@ocaml.doc ""]

type nonrec addon_subscription = {
  addon_subscription_id : addon_subscription_id option;
      [@ocaml.doc "The unique ID of the Add On subscription.\n"]
  addon_name : addon_name option; [@ocaml.doc "The name of the Add On.\n"]
  addon_subscription_arn : addon_subscription_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Add On subscription.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the Add On subscription was created.\n"]
}
[@@ocaml.doc
  "A subscription for an Add On representing the acceptance of its terms of use and additional \
   pricing.\n"]

type nonrec addon_subscription_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec addon_subscriptions = addon_subscription list [@@ocaml.doc ""]

type nonrec address = string [@@ocaml.doc ""]

type nonrec address_prefix = string [@@ocaml.doc ""]

type nonrec address_filter = {
  address_prefix : address_prefix option;
      [@ocaml.doc "Filter to limit the results to addresses having the provided prefix.\n"]
}
[@@ocaml.doc "Filtering options for ListMembersOfAddressList operation.\n"]

type nonrec address_list_name = string [@@ocaml.doc ""]

type nonrec address_list_arn = string [@@ocaml.doc ""]

type nonrec address_list_id = string [@@ocaml.doc ""]

type nonrec address_list = {
  address_list_id : address_list_id; [@ocaml.doc "The identifier of the address list.\n"]
  address_list_arn : address_list_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the address list.\n"]
  address_list_name : address_list_name;
      [@ocaml.doc "The user-friendly name of the address list.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp of when the address list was created.\n"]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp of when the address list was last updated.\n"]
}
[@@ocaml.doc
  "An address list contains a list of emails and domains that are used in MailManager Ingress \
   endpoints and Rules for email management.\n"]

type nonrec address_list_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec address_lists = address_list list [@@ocaml.doc ""]

type nonrec address_page_size = int [@@ocaml.doc ""]

type nonrec result_field = string [@@ocaml.doc ""]

type nonrec analyzer_arn = string [@@ocaml.doc ""]

type nonrec analysis = {
  analyzer : analyzer_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of an Add On.\n"]
  result_field : result_field; [@ocaml.doc "The returned value from an Add On.\n"]
}
[@@ocaml.doc
  "The result of an analysis can be used in conditions to trigger actions. Analyses can inspect \
   the email content and report a certain aspect of the email.\n"]

type nonrec archive_state = ACTIVE [@ocaml.doc ""] | PENDING_DELETION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec archive_name_string = string [@@ocaml.doc ""]

type nonrec archive_id_string = string [@@ocaml.doc ""]

type nonrec archive = {
  archive_id : archive_id_string; [@ocaml.doc "The unique identifier of the archive.\n"]
  archive_name : archive_name_string option;
      [@ocaml.doc "The unique name assigned to the archive.\n"]
  archive_state : archive_state option;
      [@ocaml.doc
        "The current state of the archive:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \226\128\147 The archive is ready and available for use. \n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_DELETION] \226\128\147 The archive has been marked for deletion and \
         will be permanently deleted in 30 days. No further modifications can be made in this \
         state. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the archive was last updated.\n"]
}
[@@ocaml.doc "An archive resource for storing and retaining emails.\n"]

type nonrec name_or_arn = string [@@ocaml.doc ""]

type nonrec archive_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the specified archive has been deleted.\n"]
  target_archive : name_or_arn; [@ocaml.doc "The identifier of the archive to send the email to.\n"]
}
[@@ocaml.doc "The action to archive the email by delivering the email to an Amazon SES archive.\n"]

type nonrec archive_arn = string [@@ocaml.doc ""]

type nonrec archive_boolean_email_attribute = HAS_ATTACHMENTS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec archive_boolean_operator = IS_TRUE [@ocaml.doc ""] | IS_FALSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec archive_boolean_to_evaluate =
  | Attribute of archive_boolean_email_attribute
      [@ocaml.doc "The name of the email attribute to evaluate.\n"]
[@@ocaml.doc "The attribute to evaluate in a boolean expression.\n"]

type nonrec archive_boolean_expression = {
  evaluate : archive_boolean_to_evaluate; [@ocaml.doc "The email attribute value to evaluate.\n"]
  operator : archive_boolean_operator; [@ocaml.doc "The boolean operator to use for evaluation.\n"]
}
[@@ocaml.doc "A boolean expression to evaluate email attribute values.\n"]

type nonrec string_value = string [@@ocaml.doc ""]

type nonrec string_value_list = string_value list [@@ocaml.doc ""]

type nonrec archive_string_operator = CONTAINS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec archive_string_email_attribute =
  | TO [@ocaml.doc ""]
  | FROM [@ocaml.doc ""]
  | CC [@ocaml.doc ""]
  | SUBJECT [@ocaml.doc ""]
  | ENVELOPE_TO [@ocaml.doc ""]
  | ENVELOPE_FROM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec archive_string_to_evaluate =
  | Attribute of archive_string_email_attribute
      [@ocaml.doc "The name of the email attribute to evaluate.\n"]
[@@ocaml.doc "Specifies the email attribute to evaluate in a string expression.\n"]

type nonrec archive_string_expression = {
  evaluate : archive_string_to_evaluate; [@ocaml.doc "The attribute of the email to evaluate.\n"]
  operator : archive_string_operator;
      [@ocaml.doc "The operator to use when evaluating the string values.\n"]
  values : string_value_list;
      [@ocaml.doc "The list of string values to evaluate the email attribute against.\n"]
}
[@@ocaml.doc
  "A string expression to evaluate an email attribute value against one or more string values.\n"]

type nonrec archive_filter_condition =
  | StringExpression of archive_string_expression
      [@ocaml.doc "A string expression to evaluate against email attributes.\n"]
  | BooleanExpression of archive_boolean_expression
      [@ocaml.doc "A boolean expression to evaluate against email attributes.\n"]
[@@ocaml.doc
  "A filter condition used to include or exclude emails when exporting from or searching an archive.\n"]

type nonrec archive_filter_conditions = archive_filter_condition list [@@ocaml.doc ""]

type nonrec archive_filters = {
  include_ : archive_filter_conditions option;
      [@ocaml.doc "The filter conditions for emails to include.\n"]
  unless : archive_filter_conditions option;
      [@ocaml.doc "The filter conditions for emails to exclude.\n"]
}
[@@ocaml.doc "A set of filter conditions to include and/or exclude emails.\n"]

type nonrec archive_id = string [@@ocaml.doc ""]

type nonrec archive_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec retention_period =
  | THREE_MONTHS [@ocaml.doc ""]
  | SIX_MONTHS [@ocaml.doc ""]
  | NINE_MONTHS [@ocaml.doc ""]
  | ONE_YEAR [@ocaml.doc ""]
  | EIGHTEEN_MONTHS [@ocaml.doc ""]
  | TWO_YEARS [@ocaml.doc ""]
  | THIRTY_MONTHS [@ocaml.doc ""]
  | THREE_YEARS [@ocaml.doc ""]
  | FOUR_YEARS [@ocaml.doc ""]
  | FIVE_YEARS [@ocaml.doc ""]
  | SIX_YEARS [@ocaml.doc ""]
  | SEVEN_YEARS [@ocaml.doc ""]
  | EIGHT_YEARS [@ocaml.doc ""]
  | NINE_YEARS [@ocaml.doc ""]
  | TEN_YEARS [@ocaml.doc ""]
  | PERMANENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec archive_retention =
  | RetentionPeriod of retention_period
      [@ocaml.doc "The enum value sets the period for retaining emails in an archive.\n"]
[@@ocaml.doc
  "The retention policy for an email archive that specifies how long emails are kept before being \
   automatically deleted. \n"]

type nonrec archived_message_id = string [@@ocaml.doc ""]

type nonrec archives_list = archive list [@@ocaml.doc ""]

type nonrec bounce_message = string [@@ocaml.doc ""]

type nonrec diagnostic_message = string [@@ocaml.doc ""]

type nonrec smtp_reply_code = string [@@ocaml.doc ""]

type nonrec status_code = string [@@ocaml.doc ""]

type nonrec email_address = string [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec bounce_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the caller does not have the permissions to call the \
         SendBounce API.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to use to send the bounce message.\n"]
  sender : email_address; [@ocaml.doc "The sender email address of the bounce message.\n"]
  status_code : status_code;
      [@ocaml.doc "The enhanced status code for the bounce, in the format of x.y.z (e.g. 5.1.1).\n"]
  smtp_reply_code : smtp_reply_code;
      [@ocaml.doc "The SMTP reply code for the bounce, as defined by RFC 5321.\n"]
  diagnostic_message : diagnostic_message;
      [@ocaml.doc "The diagnostic message included in the Diagnostic-Code header of the bounce.\n"]
  message : bounce_message option;
      [@ocaml.doc "The human-readable text to include in the bounce message.\n"]
}
[@@ocaml.doc
  "The action to send a bounce response for the email. When executed, this action generates a \
   non-delivery report (bounce) back to the sender.\n"]

type nonrec ca_content = string [@@ocaml.doc ""]

type nonrec conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request configuration has conflicts. For details, see the accompanying error message.\n"]

type nonrec validation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request validation has failed. For details, see the accompanying error message.\n"]

type nonrec service_quota_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Occurs when an operation exceeds a predefined service quota or limit.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Occurs when a requested resource is not found.\n"]

type nonrec create_addon_instance_response = {
  addon_instance_id : addon_instance_id;
      [@ocaml.doc "The unique ID of the Add On instance created by this API.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the key-value tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the key-value tag.\n"]
}
[@@ocaml.doc
  "A key-value pair (the value is optional), that you can define and assign to Amazon Web Services \
   resources.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec create_addon_instance_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  addon_subscription_id : addon_subscription_id;
      [@ocaml.doc
        "The unique ID of a previously created subscription that an Add On instance is created \
         for. You can only have one instance per subscription.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Occurs when a service's request rate limit is exceeded, resulting in throttling of further \
   requests.\n"]

type nonrec create_addon_subscription_response = {
  addon_subscription_id : addon_subscription_id;
      [@ocaml.doc "The unique ID of the Add On subscription created by this API.\n"]
}
[@@ocaml.doc ""]

type nonrec create_addon_subscription_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  addon_name : addon_name;
      [@ocaml.doc
        "The name of the Add On to subscribe to. You can only have one subscription for each Add \
         On name.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_address_list_response = {
  address_list_id : address_list_id; [@ocaml.doc "The identifier of the created address list.\n"]
}
[@@ocaml.doc ""]

type nonrec create_address_list_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  address_list_name : address_list_name; [@ocaml.doc "A user-friendly name for the address list.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec pre_signed_url = string [@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec create_address_list_import_job_response = {
  job_id : job_id; [@ocaml.doc "The identifier of the created import job.\n"]
  pre_signed_url : pre_signed_url;
      [@ocaml.doc "The pre-signed URL target for uploading the input file.\n"]
}
[@@ocaml.doc ""]

type nonrec import_data_type = CSV [@ocaml.doc ""] | JSON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec import_data_format = {
  import_data_type : import_data_type;
      [@ocaml.doc
        "The type of file that would be passed as an input for the address list import job.\n"]
}
[@@ocaml.doc
  "The import data format contains the specifications of the input file that would be passed to \
   the address list import job.\n"]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec create_address_list_import_job_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list for importing addresses to.\n"]
  name : job_name; [@ocaml.doc "A user-friendly name for the import job.\n"]
  import_data_format : import_data_format;
      [@ocaml.doc "The format of the input for an import job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_archive_response = {
  archive_id : archive_id_string;
      [@ocaml.doc "The unique identifier for the newly created archive.\n"]
}
[@@ocaml.doc "The response from creating a new email archive.\n"]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec create_archive_request = {
  client_token : idempotency_token option;
      [@ocaml.doc "A unique token Amazon SES uses to recognize retries of this request.\n"]
  archive_name : archive_name_string; [@ocaml.doc "A unique name for the new archive.\n"]
  retention : archive_retention option;
      [@ocaml.doc "The period for retaining emails in the archive before automatic deletion.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key for encrypting emails in the archive.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc "The request to create a new email archive.\n"]

type nonrec ingress_point_id = string [@@ocaml.doc ""]

type nonrec create_ingress_point_response = {
  ingress_point_id : ingress_point_id;
      [@ocaml.doc "The unique identifier for a previously created ingress endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec tls_policy =
  | REQUIRED [@ocaml.doc ""]
  | OPTIONAL [@ocaml.doc ""]
  | FIPS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec vpc_endpoint_id = string [@@ocaml.doc ""]

type nonrec private_network_configuration = {
  vpc_endpoint_id : vpc_endpoint_id;
      [@ocaml.doc
        "The identifier of the VPC endpoint to associate with this private ingress point.\n"]
}
[@@ocaml.doc "Specifies the network configuration for the private ingress point.\n"]

type nonrec ip_type = IPV4 [@ocaml.doc ""] | DUAL_STACK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec public_network_configuration = {
  ip_type : ip_type;
      [@ocaml.doc
        "The IP address type for the public ingress point. Valid values are IPV4 and DUAL_STACK.\n"]
}
[@@ocaml.doc "Specifies the network configuration for the public ingress point.\n"]

type nonrec network_configuration =
  | PublicNetworkConfiguration of public_network_configuration
      [@ocaml.doc "Specifies the network configuration for the public ingress point.\n"]
  | PrivateNetworkConfiguration of private_network_configuration
      [@ocaml.doc "Specifies the network configuration for the private ingress point.\n"]
[@@ocaml.doc
  "The network type (IPv4-only, Dual-Stack, PrivateLink) of the ingress endpoint resource.\n"]

type nonrec crl_content = string [@@ocaml.doc ""]

type nonrec trust_store = {
  ca_content : ca_content;
      [@ocaml.doc
        "The PEM-encoded certificate authority (CA) certificates bundle for the trust store.\n"]
  crl_content : crl_content option;
      [@ocaml.doc
        "The PEM-encoded certificate revocation lists (CRLs) for the trust store. There can be one \
         CRL per certificate authority (CA) in the trust store.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key used to encrypt the trust store contents.\n"]
}
[@@ocaml.doc
  "The trust store used for mutual TLS authentication. It contains the certificate authority (CA) \
   certificates and optional certificate revocation list (CRL).\n"]

type nonrec tls_auth_configuration = {
  trust_store : trust_store option;
      [@ocaml.doc "The trust store configuration for mutual TLS authentication.\n"]
}
[@@ocaml.doc "The mutual TLS authentication configuration for an ingress endpoint.\n"]

type nonrec secret_arn = string [@@ocaml.doc ""]

type nonrec smtp_password = string [@@ocaml.doc ""]

type nonrec ingress_point_configuration =
  | SmtpPassword of smtp_password [@ocaml.doc "The password of the ingress endpoint resource.\n"]
  | SecretArn of secret_arn
      [@ocaml.doc "The SecretsManager::Secret ARN of the ingress endpoint resource.\n"]
  | TlsAuthConfiguration of tls_auth_configuration
      [@ocaml.doc "The mutual TLS authentication configuration of the ingress endpoint resource.\n"]
[@@ocaml.doc "The configuration of the ingress endpoint resource.\n"]

type nonrec traffic_policy_id = string [@@ocaml.doc ""]

type nonrec rule_set_id = string [@@ocaml.doc ""]

type nonrec ingress_point_type =
  | OPEN [@ocaml.doc ""]
  | AUTH [@ocaml.doc ""]
  | MTLS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_point_name = string [@@ocaml.doc ""]

type nonrec create_ingress_point_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  ingress_point_name : ingress_point_name;
      [@ocaml.doc "A user friendly name for an ingress endpoint resource.\n"]
  type_ : ingress_point_type; [@ocaml.doc "The type of the ingress endpoint to create.\n"]
  rule_set_id : rule_set_id;
      [@ocaml.doc
        "The identifier of an existing rule set that you attach to an ingress endpoint resource.\n"]
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc
        "The identifier of an existing traffic policy that you attach to an ingress endpoint \
         resource.\n"]
  ingress_point_configuration : ingress_point_configuration option;
      [@ocaml.doc
        "If you choose an Authenticated ingress endpoint, you must configure either an SMTP \
         password or a secret ARN.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "Specifies the network configuration for the ingress point. This allows you to create an \
         IPv4-only, Dual-Stack, or PrivateLink type of ingress point. If not specified, the \
         default network type is IPv4-only. \n"]
  tls_policy : tls_policy option;
      [@ocaml.doc
        "The Transport Layer Security (TLS) policy for the ingress point. The FIPS value is only \
         valid in US and Canada regions.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec relay_id = string [@@ocaml.doc ""]

type nonrec create_relay_response = {
  relay_id : relay_id; [@ocaml.doc "A unique identifier of the created relay resource.\n"]
}
[@@ocaml.doc ""]

type nonrec no_authentication = unit [@@ocaml.doc ""]

type nonrec relay_authentication =
  | SecretArn of secret_arn
      [@ocaml.doc
        "The ARN of the secret created in secrets manager where the relay server's SMTP \
         credentials are stored.\n"]
  | NoAuthentication of no_authentication
      [@ocaml.doc
        "Keep an empty structure if the relay destination server does not require SMTP credential \
         authentication.\n"]
[@@ocaml.doc
  "Authentication for the relay destination server\226\128\148specify the secretARN where the SMTP \
   credentials are stored, or specify an empty NoAuthentication structure if the relay destination \
   server does not require SMTP credential authentication.\n"]

type nonrec relay_server_port = int [@@ocaml.doc ""]

type nonrec relay_server_name = string [@@ocaml.doc ""]

type nonrec relay_name = string [@@ocaml.doc ""]

type nonrec create_relay_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  relay_name : relay_name; [@ocaml.doc "The unique name of the relay resource.\n"]
  server_name : relay_server_name; [@ocaml.doc "The destination relay server address.\n"]
  server_port : relay_server_port; [@ocaml.doc "The destination relay server port.\n"]
  authentication : relay_authentication;
      [@ocaml.doc
        "Authentication for the relay destination server\226\128\148specify the secretARN where \
         the SMTP credentials are stored.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_set_response = {
  rule_set_id : rule_set_id; [@ocaml.doc "The identifier of the created rule set.\n"]
}
[@@ocaml.doc ""]

type nonrec lambda_retry_time_minutes = int [@@ocaml.doc ""]

type nonrec lambda_invocation_type = EVENT [@ocaml.doc ""] | REQUEST_RESPONSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_arn = string [@@ocaml.doc ""]

type nonrec invoke_lambda_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the Amazon Web Services Lambda function no longer \
         exists.\n"]
  function_arn : lambda_function_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Lambda function to invoke.\n"]
  invocation_type : lambda_invocation_type;
      [@ocaml.doc
        "The invocation type of the Lambda function. Use EVENT for asynchronous invocation or \
         REQUEST_RESPONSE for synchronous invocation.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to use to invoke the Lambda function.\n"]
  retry_time_minutes : lambda_retry_time_minutes option;
      [@ocaml.doc
        "The maximum time in minutes that the email processing can be retried if the Lambda \
         invocation fails. The maximum value is 2160 minutes (36 hours).\n"]
}
[@@ocaml.doc
  "The action to invoke an Amazon Web Services Lambda function for processing the email.\n"]

type nonrec sns_notification_payload_type = HEADERS [@ocaml.doc ""] | CONTENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sns_notification_encoding = UTF_8 [@ocaml.doc ""] | BASE64 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sns_topic_arn = string [@@ocaml.doc ""]

type nonrec sns_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, specified SNS topic has been deleted or the role lacks \
         necessary permissions to call the [sns:Publish] API.\n"]
  topic_arn : sns_topic_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS Topic to which notification for the \
         email received will be published.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Role to use while writing to Amazon SNS. This \
         role must have access to the [sns:Publish] API for the given topic.\n"]
  encoding : sns_notification_encoding option;
      [@ocaml.doc
        "The encoding to use for the email within the Amazon SNS notification. The default value \
         is [UTF-8]. Use [BASE64] if you need to preserve all special characters, especially when \
         the original message uses a different encoding format.\n"]
  payload_type : sns_notification_payload_type option;
      [@ocaml.doc
        "The expected payload type within the Amazon SNS notification. [CONTENT] attempts to \
         publish the full email content with 20KB of headers content. [HEADERS] extracts up to \
         100KB of header content to include in the notification, email content will not be \
         included to the notification. The default value is [CONTENT].\n"]
}
[@@ocaml.doc
  "The action to publish the email content to an Amazon SNS topic. When executed, this action will \
   send the email as a notification to the specified SNS topic.\n"]

type nonrec q_business_index_id = string [@@ocaml.doc ""]

type nonrec q_business_application_id = string [@@ocaml.doc ""]

type nonrec deliver_to_q_business_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the specified application has been deleted or the role \
         lacks necessary permissions to call the [qbusiness:BatchPutDocument] API.\n"]
  application_id : q_business_application_id;
      [@ocaml.doc
        "The unique identifier of the Amazon Q Business application instance where the email \
         content will be delivered.\n"]
  index_id : q_business_index_id;
      [@ocaml.doc
        "The identifier of the knowledge base index within the Amazon Q Business application where \
         the email content will be stored and indexed.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Role to use while delivering to Amazon Q \
         Business. This role must have access to the [qbusiness:BatchPutDocument] API for the \
         given application and index.\n"]
}
[@@ocaml.doc
  "The action to deliver incoming emails to an Amazon Q Business application for indexing.\n"]

type nonrec deliver_to_mailbox_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the mailbox ARN is no longer valid.\n"]
  mailbox_arn : name_or_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a WorkMail organization to deliver the email to.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role to use to execute this action. The role \
         must have access to the workmail:DeliverToMailbox API.\n"]
}
[@@ocaml.doc "This action to delivers an email to a mailbox.\n"]

type nonrec recipients = email_address list [@@ocaml.doc ""]

type nonrec replace_recipient_action = {
  replace_with : recipients option;
      [@ocaml.doc "This action specifies the replacement recipient email addresses to insert.\n"]
}
[@@ocaml.doc
  "This action replaces the email envelope recipients with the given list of recipients. If the \
   condition of this action applies only to a subset of recipients, only those recipients are \
   replaced with the recipients specified in the action. The message contents and headers are \
   unaffected by this action, only the envelope recipients are updated.\n"]

type nonrec send_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the caller does not have the permissions to call the \
         sendRawEmail API.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role to use for this action. This role must have \
         access to the ses:SendRawEmail API.\n"]
}
[@@ocaml.doc "Sends the email to the internet using the ses:SendRawEmail API.\n"]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec s3_prefix = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the specified the bucket has been deleted.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Role to use while writing to S3. This role must \
         have access to the s3:PutObject, kms:Encrypt, and kms:GenerateDataKey APIs for the given \
         bucket.\n"]
  s3_bucket : s3_bucket; [@ocaml.doc "The bucket name of the S3 bucket to write to.\n"]
  s3_prefix : s3_prefix option;
      [@ocaml.doc "The S3 prefix to use for the write to the s3 bucket.\n"]
  s3_sse_kms_key_id : kms_key_id option;
      [@ocaml.doc "The KMS Key ID to use to encrypt the message in S3.\n"]
}
[@@ocaml.doc "Writes the MIME content of the email to an S3 bucket.\n"]

type nonrec mail_from = REPLACE [@ocaml.doc ""] | PRESERVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec id_or_arn = string [@@ocaml.doc ""]

type nonrec relay_action = {
  action_failure_policy : action_failure_policy option;
      [@ocaml.doc
        "A policy that states what to do in the case of failure. The action will fail if there are \
         configuration errors. For example, the specified relay has been deleted.\n"]
  relay : id_or_arn;
      [@ocaml.doc "The identifier of the relay resource to be used when relaying an email.\n"]
  mail_from : mail_from option;
      [@ocaml.doc
        "This action specifies whether to preserve or replace original mail from address while \
         relaying received emails to a destination server.\n"]
}
[@@ocaml.doc "The action relays the email via SMTP to another specific SMTP server.\n"]

type nonrec drop_action = unit [@@ocaml.doc ""]

type nonrec rule_action =
  | Drop of drop_action
      [@ocaml.doc "This action terminates the evaluation of rules in the rule set.\n"]
  | Relay of relay_action [@ocaml.doc "This action relays the email to another SMTP server.\n"]
  | Archive of archive_action
      [@ocaml.doc
        "This action archives the email. This can be used to deliver an email to an archive.\n"]
  | WriteToS3 of s3_action
      [@ocaml.doc "This action writes the MIME content of the email to an S3 bucket.\n"]
  | Send of send_action [@ocaml.doc "This action sends the email to the internet.\n"]
  | AddHeader of add_header_action
      [@ocaml.doc "This action adds a header. This can be used to add arbitrary email headers.\n"]
  | ReplaceRecipient of replace_recipient_action
      [@ocaml.doc
        "The action replaces certain or all recipients with a different set of recipients.\n"]
  | DeliverToMailbox of deliver_to_mailbox_action
      [@ocaml.doc "This action delivers an email to a WorkMail mailbox.\n"]
  | DeliverToQBusiness of deliver_to_q_business_action
      [@ocaml.doc
        "This action delivers an email to an Amazon Q Business application for ingestion into its \
         knowledge base.\n"]
  | PublishToSns of sns_action
      [@ocaml.doc "This action publishes the email content to an Amazon SNS topic.\n"]
  | Bounce of bounce_action [@ocaml.doc "This action sends a bounce response for the email.\n"]
  | InvokeLambda of invoke_lambda_action
      [@ocaml.doc
        "This action invokes an Amazon Web Services Lambda function to process the email.\n"]
[@@ocaml.doc "The action for a rule to take. Only one of the contained actions can be set.\n"]

type nonrec rule_actions = rule_action list [@@ocaml.doc ""]

type nonrec rule_dmarc_policy =
  | NONE [@ocaml.doc ""]
  | QUARANTINE [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_dmarc_value_list = rule_dmarc_policy list [@@ocaml.doc ""]

type nonrec rule_dmarc_operator = EQUALS [@ocaml.doc ""] | NOT_EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_dmarc_expression = {
  operator : rule_dmarc_operator;
      [@ocaml.doc "The operator to apply to the DMARC policy of the incoming email.\n"]
  values : rule_dmarc_value_list;
      [@ocaml.doc
        "The values to use for the given DMARC policy operator. For the operator EQUALS, if \
         multiple values are given, they are evaluated as an OR. That is, if any of the given \
         values match, the condition is deemed to match. For the operator NOT_EQUALS, if multiple \
         values are given, they are evaluated as an AND. That is, only if the email's DMARC policy \
         is not equal to any of the given values, then the condition is deemed to match.\n"]
}
[@@ocaml.doc
  "A DMARC policy expression. The condition matches if the given DMARC policy matches that of the \
   incoming email.\n"]

type nonrec rule_verdict =
  | PASS [@ocaml.doc ""]
  | FAIL [@ocaml.doc ""]
  | GRAY [@ocaml.doc ""]
  | PROCESSING_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_verdict_value_list = rule_verdict list [@@ocaml.doc ""]

type nonrec rule_verdict_operator = EQUALS [@ocaml.doc ""] | NOT_EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_verdict_attribute = SPF [@ocaml.doc ""] | DKIM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rule_verdict_to_evaluate =
  | Attribute of rule_verdict_attribute
      [@ocaml.doc "The email verdict attribute to evaluate in a string verdict expression.\n"]
  | Analysis of analysis
      [@ocaml.doc
        "The Add On ARN and its returned value to evaluate in a verdict condition expression.\n"]
[@@ocaml.doc "The verdict to evaluate in a verdict condition expression.\n"]

type nonrec rule_verdict_expression = {
  evaluate : rule_verdict_to_evaluate;
      [@ocaml.doc "The verdict to evaluate in a verdict condition expression.\n"]
  operator : rule_verdict_operator;
      [@ocaml.doc "The matching operator for a verdict condition expression.\n"]
  values : rule_verdict_value_list;
      [@ocaml.doc
        "The values to match with the email's verdict using the given operator. For the EQUALS \
         operator, if multiple values are given, the condition is deemed to match if any of the \
         given verdicts match that of the email. For the NOT_EQUALS operator, if multiple values \
         are given, the condition is deemed to match of none of the given verdicts match the \
         verdict of the email.\n"]
}
[@@ocaml.doc "A verdict expression is evaluated against verdicts of the email.\n"]

type nonrec rule_ip_string_value = string [@@ocaml.doc ""]

type nonrec rule_ip_value_list = rule_ip_string_value list [@@ocaml.doc ""]

type nonrec rule_ip_operator = CIDR_MATCHES [@ocaml.doc ""] | NOT_CIDR_MATCHES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_ip_email_attribute = SOURCE_IP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rule_ip_to_evaluate =
  | Attribute of rule_ip_email_attribute [@ocaml.doc "The attribute of the email to evaluate.\n"]
[@@ocaml.doc "The IP address to evaluate for this condition.\n"]

type nonrec rule_ip_expression = {
  evaluate : rule_ip_to_evaluate; [@ocaml.doc "The IP address to evaluate in this condition.\n"]
  operator : rule_ip_operator; [@ocaml.doc "The operator to evaluate the IP address.\n"]
  values : rule_ip_value_list;
      [@ocaml.doc
        "The IP CIDR blocks in format \"x.y.z.w/n\" (eg 10.0.0.0/8) to match with the email's IP \
         address. For the operator CIDR_MATCHES, if multiple values are given, they are evaluated \
         as an OR. That is, if the IP address is contained within any of the given CIDR ranges, \
         the condition is deemed to match. For NOT_CIDR_MATCHES, if multiple CIDR ranges are \
         given, the condition is deemed to match if the IP address is not contained in any of the \
         given CIDR ranges.\n"]
}
[@@ocaml.doc
  "An IP address expression matching certain IP addresses within a given range of IP addresses.\n"]

type nonrec rule_number_operator =
  | EQUALS [@ocaml.doc ""]
  | NOT_EQUALS [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN_OR_EQUAL [@ocaml.doc ""]
  | GREATER_THAN_OR_EQUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_number_email_attribute = MESSAGE_SIZE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rule_number_to_evaluate =
  | Attribute of rule_number_email_attribute
      [@ocaml.doc "An email attribute that is used as the number to evaluate.\n"]
[@@ocaml.doc "The number to evaluate in a numeric condition expression.\n"]

type nonrec rule_number_expression = {
  evaluate : rule_number_to_evaluate;
      [@ocaml.doc "The number to evaluate in a numeric condition expression.\n"]
  operator : rule_number_operator; [@ocaml.doc "The operator for a numeric condition expression.\n"]
  value : Smaws_Lib.Smithy_api.Types.double;
      [@ocaml.doc "The value to evaluate in a numeric condition expression.\n"]
}
[@@ocaml.doc
  "A number expression to match numeric conditions with integers from the incoming email.\n"]

type nonrec rule_string_value = string [@@ocaml.doc ""]

type nonrec rule_string_list = rule_string_value list [@@ocaml.doc ""]

type nonrec rule_string_operator =
  | EQUALS [@ocaml.doc ""]
  | NOT_EQUALS [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_client_certificate_attribute =
  | CN [@ocaml.doc ""]
  | SAN_RFC822_NAME [@ocaml.doc ""]
  | SAN_DNS_NAME [@ocaml.doc ""]
  | SAN_DIRECTORY_NAME [@ocaml.doc ""]
  | SAN_UNIFORM_RESOURCE_IDENTIFIER [@ocaml.doc ""]
  | SAN_IP_ADDRESS [@ocaml.doc ""]
  | SAN_REGISTERED_ID [@ocaml.doc ""]
  | SERIAL_NUMBER [@ocaml.doc ""]
[@@ocaml.doc
  "The client certificate attribute to evaluate in a rule condition. These attributes are \
   extracted from the client certificate presented during mutual TLS authentication.\n"]

type nonrec mime_header_attribute = string [@@ocaml.doc ""]

type nonrec rule_string_email_attribute =
  | MAIL_FROM [@ocaml.doc ""]
  | HELO [@ocaml.doc ""]
  | RECIPIENT [@ocaml.doc ""]
  | SENDER [@ocaml.doc ""]
  | FROM [@ocaml.doc ""]
  | SUBJECT [@ocaml.doc ""]
  | TO [@ocaml.doc ""]
  | CC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_string_to_evaluate =
  | Attribute of rule_string_email_attribute
      [@ocaml.doc "The email attribute to evaluate in a string condition expression.\n"]
  | MimeHeaderAttribute of mime_header_attribute
      [@ocaml.doc
        "The email MIME X-Header attribute to evaluate in a string condition expression.\n"]
  | Analysis of analysis
      [@ocaml.doc
        "The Add On ARN and its returned value to evaluate in a string condition expression.\n"]
  | ClientCertificateAttribute of rule_client_certificate_attribute
      [@ocaml.doc
        "The client certificate attribute to evaluate in a string condition expression.\n"]
[@@ocaml.doc "The string to evaluate in a string condition expression.\n"]

type nonrec rule_string_expression = {
  evaluate : rule_string_to_evaluate;
      [@ocaml.doc "The string to evaluate in a string condition expression.\n"]
  operator : rule_string_operator;
      [@ocaml.doc "The matching operator for a string condition expression.\n"]
  values : rule_string_list;
      [@ocaml.doc
        "The string(s) to be evaluated in a string condition expression. For all operators, except \
         for NOT_EQUALS, if multiple values are given, the values are processed as an OR. That is, \
         if any of the values match the email's string using the given operator, the condition is \
         deemed to match. However, for NOT_EQUALS, the condition is only deemed to match if none \
         of the given strings match the email's string.\n"]
}
[@@ocaml.doc "A string expression is evaluated against strings or substrings of the email.\n"]

type nonrec rule_boolean_operator = IS_TRUE [@ocaml.doc ""] | IS_FALSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_address_list_arn_list = address_list_arn list [@@ocaml.doc ""]

type nonrec rule_address_list_email_attribute =
  | RECIPIENT [@ocaml.doc ""]
  | MAIL_FROM [@ocaml.doc ""]
  | SENDER [@ocaml.doc ""]
  | FROM [@ocaml.doc ""]
  | TO [@ocaml.doc ""]
  | CC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_is_in_address_list = {
  attribute : rule_address_list_email_attribute;
      [@ocaml.doc "The email attribute that needs to be evaluated against the address list.\n"]
  address_lists : rule_address_list_arn_list;
      [@ocaml.doc "The address lists that will be used for evaluation.\n"]
}
[@@ocaml.doc
  "The structure type for a boolean condition that provides the address lists and address list \
   attribute to evaluate.\n"]

type nonrec rule_boolean_email_attribute =
  | READ_RECEIPT_REQUESTED [@ocaml.doc ""]
  | TLS [@ocaml.doc ""]
  | TLS_WRAPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_boolean_to_evaluate =
  | Attribute of rule_boolean_email_attribute
      [@ocaml.doc "The boolean type representing the allowed attribute types for an email.\n"]
  | Analysis of analysis
      [@ocaml.doc
        "The Add On ARN and its returned value to evaluate in a boolean condition expression.\n"]
  | IsInAddressList of rule_is_in_address_list
      [@ocaml.doc
        "The structure representing the address lists and address list attribute that will be used \
         in evaluation of boolean expression.\n"]
[@@ocaml.doc "The union type representing the allowed types of operands for a boolean condition.\n"]

type nonrec rule_boolean_expression = {
  evaluate : rule_boolean_to_evaluate;
      [@ocaml.doc "The operand on which to perform a boolean condition operation.\n"]
  operator : rule_boolean_operator;
      [@ocaml.doc "The matching operator for a boolean condition expression.\n"]
}
[@@ocaml.doc "A boolean expression to be used in a rule condition.\n"]

type nonrec rule_condition =
  | BooleanExpression of rule_boolean_expression
      [@ocaml.doc "The condition applies to a boolean expression passed in this field.\n"]
  | StringExpression of rule_string_expression
      [@ocaml.doc "The condition applies to a string expression passed in this field.\n"]
  | NumberExpression of rule_number_expression
      [@ocaml.doc "The condition applies to a number expression passed in this field.\n"]
  | IpExpression of rule_ip_expression
      [@ocaml.doc "The condition applies to an IP address expression passed in this field.\n"]
  | VerdictExpression of rule_verdict_expression
      [@ocaml.doc "The condition applies to a verdict expression passed in this field.\n"]
  | DmarcExpression of rule_dmarc_expression
      [@ocaml.doc "The condition applies to a DMARC policy expression passed in this field.\n"]
[@@ocaml.doc
  "The conditional expression used to evaluate an email for determining if a rule action should be \
   taken.\n"]

type nonrec rule_conditions = rule_condition list [@@ocaml.doc ""]

type nonrec rule_name = string [@@ocaml.doc ""]

type nonrec rule = {
  name : rule_name option; [@ocaml.doc "The user-friendly name of the rule.\n"]
  conditions : rule_conditions option;
      [@ocaml.doc
        "The conditions of this rule. All conditions must match the email for the actions to be \
         executed. An empty list of conditions means that all emails match, but are still subject \
         to any \"unless conditions\"\n"]
  unless : rule_conditions option;
      [@ocaml.doc
        "The \"unless conditions\" of this rule. None of the conditions can match the email for \
         the actions to be executed. If any of these conditions do match the email, then the \
         actions are not executed.\n"]
  actions : rule_actions;
      [@ocaml.doc
        "The list of actions to execute when the conditions match the incoming email, and none of \
         the \"unless conditions\" match.\n"]
}
[@@ocaml.doc
  "A rule contains conditions, \"unless conditions\" and actions. For each envelope recipient of \
   an email, if all conditions match and none of the \"unless conditions\" match, then all of the \
   actions are executed sequentially. If no conditions are provided, the rule always applies and \
   the actions are implicitly executed. If only \"unless conditions\" are provided, the rule \
   applies if the email does not match the evaluation of the \"unless conditions\".\n"]

type nonrec rules = rule list [@@ocaml.doc ""]

type nonrec rule_set_name = string [@@ocaml.doc ""]

type nonrec create_rule_set_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  rule_set_name : rule_set_name; [@ocaml.doc "A user-friendly name for the rule set.\n"]
  rules : rules;
      [@ocaml.doc "Conditional rules that are evaluated for determining actions on email.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_traffic_policy_response = {
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc "The identifier of the traffic policy resource.\n"]
}
[@@ocaml.doc ""]

type nonrec max_message_size_bytes = int [@@ocaml.doc ""]

type nonrec ingress_boolean_operator = IS_TRUE [@ocaml.doc ""] | IS_FALSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_address_list_arn_list = address_list_arn list [@@ocaml.doc ""]

type nonrec ingress_address_list_email_attribute = RECIPIENT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ingress_is_in_address_list = {
  attribute : ingress_address_list_email_attribute;
      [@ocaml.doc "The email attribute that needs to be evaluated against the address list.\n"]
  address_lists : ingress_address_list_arn_list;
      [@ocaml.doc "The address lists that will be used for evaluation.\n"]
}
[@@ocaml.doc
  "The address lists and the address list attribute value that is evaluated in a policy \
   statement's conditional expression to either deny or block the incoming email.\n"]

type nonrec ingress_analysis = {
  analyzer : analyzer_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of an Add On.\n"]
  result_field : result_field; [@ocaml.doc "The returned value from an Add On.\n"]
}
[@@ocaml.doc
  "The Add On ARN and its returned value that is evaluated in a policy statement's conditional \
   expression to either deny or block the incoming email.\n"]

type nonrec ingress_boolean_to_evaluate =
  | Analysis of ingress_analysis
      [@ocaml.doc
        "The structure type for a boolean condition stating the Add On ARN and its returned value.\n"]
  | IsInAddressList of ingress_is_in_address_list
      [@ocaml.doc
        "The structure type for a boolean condition that provides the address lists to evaluate \
         incoming traffic on.\n"]
[@@ocaml.doc "The union type representing the allowed types of operands for a boolean condition.\n"]

type nonrec ingress_boolean_expression = {
  evaluate : ingress_boolean_to_evaluate;
      [@ocaml.doc "The operand on which to perform a boolean condition operation.\n"]
  operator : ingress_boolean_operator;
      [@ocaml.doc "The matching operator for a boolean condition expression.\n"]
}
[@@ocaml.doc "The structure for a boolean condition matching on the incoming mail.\n"]

type nonrec ingress_tls_protocol_attribute = TLS1_2 [@ocaml.doc ""] | TLS1_3 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_tls_protocol_operator =
  | MINIMUM_TLS_VERSION [@ocaml.doc ""]
  | IS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_tls_attribute = TLS_PROTOCOL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ingress_tls_protocol_to_evaluate =
  | Attribute of ingress_tls_attribute
      [@ocaml.doc "The enum type representing the allowed attribute types for the TLS condition.\n"]
[@@ocaml.doc
  "The union type representing the allowed types for the left hand side of a TLS condition.\n"]

type nonrec ingress_tls_protocol_expression = {
  evaluate : ingress_tls_protocol_to_evaluate;
      [@ocaml.doc "The left hand side argument of a TLS condition expression.\n"]
  operator : ingress_tls_protocol_operator;
      [@ocaml.doc "The matching operator for a TLS condition expression.\n"]
  value : ingress_tls_protocol_attribute;
      [@ocaml.doc "The right hand side argument of a TLS condition expression.\n"]
}
[@@ocaml.doc "The structure for a TLS related condition matching on the incoming mail.\n"]

type nonrec ipv6_cidr = string [@@ocaml.doc ""]

type nonrec ipv6_cidrs = ipv6_cidr list [@@ocaml.doc ""]

type nonrec ingress_ip_operator = CIDR_MATCHES [@ocaml.doc ""] | NOT_CIDR_MATCHES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_ipv6_attribute = SENDER_IPV6 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ingress_ipv6_to_evaluate =
  | Attribute of ingress_ipv6_attribute
      [@ocaml.doc "An enum type representing the allowed attribute types for an IPv6 condition.\n"]
[@@ocaml.doc "The structure for an IPv6 based condition matching on the incoming mail.\n"]

type nonrec ingress_ipv6_expression = {
  evaluate : ingress_ipv6_to_evaluate;
      [@ocaml.doc "The left hand side argument of an IPv6 condition expression.\n"]
  operator : ingress_ip_operator;
      [@ocaml.doc "The matching operator for an IPv6 condition expression.\n"]
  values : ipv6_cidrs; [@ocaml.doc "The right hand side argument of an IPv6 condition expression.\n"]
}
[@@ocaml.doc
  "The union type representing the allowed types for the left hand side of an IPv6 condition.\n"]

type nonrec ipv4_cidr = string [@@ocaml.doc ""]

type nonrec ipv4_cidrs = ipv4_cidr list [@@ocaml.doc ""]

type nonrec ingress_ipv4_attribute = SENDER_IP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ingress_ip_to_evaluate =
  | Attribute of ingress_ipv4_attribute
      [@ocaml.doc "An enum type representing the allowed attribute types for an IP condition.\n"]
[@@ocaml.doc "The structure for an IP based condition matching on the incoming mail.\n"]

type nonrec ingress_ipv4_expression = {
  evaluate : ingress_ip_to_evaluate;
      [@ocaml.doc "The left hand side argument of an IP condition expression.\n"]
  operator : ingress_ip_operator;
      [@ocaml.doc "The matching operator for an IP condition expression.\n"]
  values : ipv4_cidrs; [@ocaml.doc "The right hand side argument of an IP condition expression.\n"]
}
[@@ocaml.doc
  "The union type representing the allowed types for the left hand side of an IP condition.\n"]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec ingress_string_operator =
  | EQUALS [@ocaml.doc ""]
  | NOT_EQUALS [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_string_email_attribute = RECIPIENT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ingress_string_to_evaluate =
  | Attribute of ingress_string_email_attribute
      [@ocaml.doc
        "The enum type representing the allowed attribute types for a string condition.\n"]
  | Analysis of ingress_analysis
      [@ocaml.doc
        "The structure type for a string condition stating the Add On ARN and its returned value.\n"]
[@@ocaml.doc
  "The union type representing the allowed types for the left hand side of a string condition.\n"]

type nonrec ingress_string_expression = {
  evaluate : ingress_string_to_evaluate;
      [@ocaml.doc "The left hand side argument of a string condition expression.\n"]
  operator : ingress_string_operator;
      [@ocaml.doc "The matching operator for a string condition expression.\n"]
  values : string_list;
      [@ocaml.doc "The right hand side argument of a string condition expression.\n"]
}
[@@ocaml.doc "The structure for a string based condition matching on the incoming mail.\n"]

type nonrec policy_condition =
  | StringExpression of ingress_string_expression
      [@ocaml.doc
        "This represents a string based condition matching on the incoming mail. It performs the \
         string operation configured in 'Operator' and evaluates the 'Protocol' object against the \
         'Value'.\n"]
  | IpExpression of ingress_ipv4_expression
      [@ocaml.doc
        "This represents an IP based condition matching on the incoming mail. It performs the \
         operation configured in 'Operator' and evaluates the 'Protocol' object against the \
         'Value'.\n"]
  | Ipv6Expression of ingress_ipv6_expression
      [@ocaml.doc
        "This represents an IPv6 based condition matching on the incoming mail. It performs the \
         operation configured in 'Operator' and evaluates the 'Protocol' object against the \
         'Value'.\n"]
  | TlsExpression of ingress_tls_protocol_expression
      [@ocaml.doc
        "This represents a TLS based condition matching on the incoming mail. It performs the \
         operation configured in 'Operator' and evaluates the 'Protocol' object against the \
         'Value'.\n"]
  | BooleanExpression of ingress_boolean_expression
      [@ocaml.doc
        "This represents a boolean type condition matching on the incoming mail. It performs the \
         boolean operation configured in 'Operator' and evaluates the 'Protocol' object against \
         the 'Value'.\n"]
[@@ocaml.doc
  "The email traffic filtering conditions which are contained in a traffic policy resource.\n"]

type nonrec policy_conditions = policy_condition list [@@ocaml.doc ""]

type nonrec policy_statement = {
  conditions : policy_conditions;
      [@ocaml.doc
        "The list of conditions to apply to incoming messages for filtering email traffic.\n"]
  action : accept_action;
      [@ocaml.doc
        "The action that informs a traffic policy resource to either allow or block the email if \
         it matches a condition in the policy statement.\n"]
}
[@@ocaml.doc "The structure containing traffic policy conditions and actions.\n"]

type nonrec policy_statement_list = policy_statement list [@@ocaml.doc ""]

type nonrec traffic_policy_name = string [@@ocaml.doc ""]

type nonrec create_traffic_policy_request = {
  client_token : idempotency_token option;
      [@ocaml.doc
        "A unique token that Amazon SES uses to recognize subsequent retries of the same request.\n"]
  traffic_policy_name : traffic_policy_name;
      [@ocaml.doc "A user-friendly name for the traffic policy resource.\n"]
  policy_statements : policy_statement_list;
      [@ocaml.doc "Conditional statements for filtering email traffic.\n"]
  default_action : accept_action;
      [@ocaml.doc
        "Default action instructs the tra\239\172\131c policy to either Allow or Deny (block) \
         messages that fall outside of (or not addressed by) the conditions of your policy \
         statements\n"]
  max_message_size_bytes : max_message_size_bytes option;
      [@ocaml.doc
        "The maximum message size in bytes of email which is allowed in by this traffic \
         policy\226\128\148anything larger will be blocked.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_addon_instance_response = unit [@@ocaml.doc ""]

type nonrec delete_addon_instance_request = {
  addon_instance_id : addon_instance_id; [@ocaml.doc "The Add On instance ID to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_addon_subscription_response = unit [@@ocaml.doc ""]

type nonrec delete_addon_subscription_request = {
  addon_subscription_id : addon_subscription_id;
      [@ocaml.doc "The Add On subscription ID to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_address_list_response = unit [@@ocaml.doc ""]

type nonrec delete_address_list_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The identifier of an existing address list resource to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_archive_response = unit [@@ocaml.doc ""]

type nonrec delete_archive_request = {
  archive_id : archive_id_string; [@ocaml.doc "The identifier of the archive to delete.\n"]
}
[@@ocaml.doc "The request to initiate deletion of an email archive.\n"]

type nonrec delete_ingress_point_response = unit [@@ocaml.doc ""]

type nonrec delete_ingress_point_request = {
  ingress_point_id : ingress_point_id;
      [@ocaml.doc "The identifier of the ingress endpoint resource that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_relay_response = unit [@@ocaml.doc ""]

type nonrec delete_relay_request = {
  relay_id : relay_id; [@ocaml.doc "The unique relay identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_set_response = unit [@@ocaml.doc ""]

type nonrec delete_rule_set_request = {
  rule_set_id : rule_set_id;
      [@ocaml.doc "The identifier of an existing rule set resource to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_traffic_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_traffic_policy_request = {
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc "The identifier of the traffic policy that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_member_from_address_list_response = unit [@@ocaml.doc ""]

type nonrec deregister_member_from_address_list_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list to remove the address from.\n"]
  address : address; [@ocaml.doc "The address to be removed from the address list.\n"]
}
[@@ocaml.doc ""]

type nonrec email_received_headers_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec envelope = {
  helo : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The HELO used by the host from which the email was received.\n"]
  from_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The RCPT FROM given by the host from which the email was received.\n"]
  to_ : string_list option;
      [@ocaml.doc "All SMTP TO entries given by the host from which the email was received.\n"]
}
[@@ocaml.doc "The SMTP envelope information of the email.\n"]

type nonrec s3_location = string [@@ocaml.doc ""]

type nonrec s3_export_destination_configuration = {
  s3_location : s3_location option;
      [@ocaml.doc "The S3 location to deliver the exported email data.\n"]
}
[@@ocaml.doc "The configuration for exporting email data to an Amazon S3 bucket.\n"]

type nonrec export_destination_configuration =
  | S3 of s3_export_destination_configuration
      [@ocaml.doc "Configuration for delivering to an Amazon S3 bucket.\n"]
[@@ocaml.doc "The destination configuration for delivering exported email data.\n"]

type nonrec export_id = string [@@ocaml.doc ""]

type nonrec export_max_results = int [@@ocaml.doc ""]

type nonrec export_state =
  | QUEUED [@ocaml.doc ""]
  | PREPROCESSING [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec export_status = {
  submission_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the export job was submitted.\n"]
  completion_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the export job completed (if finished).\n"]
  state : export_state option; [@ocaml.doc "The current state of the export job.\n"]
  error_message : error_message option; [@ocaml.doc "An error message if the export job failed.\n"]
}
[@@ocaml.doc "The current status of an archive export job.\n"]

type nonrec export_summary = {
  export_id : export_id option; [@ocaml.doc "The unique identifier of the export job.\n"]
  status : export_status option; [@ocaml.doc "The current status of the export job.\n"]
}
[@@ocaml.doc "Summary statuses of an archive export job.\n"]

type nonrec export_summary_list = export_summary list [@@ocaml.doc ""]

type nonrec get_addon_instance_response = {
  addon_subscription_id : addon_subscription_id option;
      [@ocaml.doc "The subscription ID associated to the instance.\n"]
  addon_name : addon_name option;
      [@ocaml.doc
        "The name of the Add On provider associated to the subscription of the instance.\n"]
  addon_instance_arn : addon_instance_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Add On instance.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the Add On instance was created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_addon_instance_request = {
  addon_instance_id : addon_instance_id;
      [@ocaml.doc "The Add On instance ID to retrieve information for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_addon_subscription_response = {
  addon_name : addon_name option; [@ocaml.doc "The name of the Add On for the subscription.\n"]
  addon_subscription_arn : addon_subscription_arn option;
      [@ocaml.doc "Amazon Resource Name (ARN) for the subscription.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the Add On subscription was created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_addon_subscription_request = {
  addon_subscription_id : addon_subscription_id;
      [@ocaml.doc "The Add On subscription ID to retrieve information for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_address_list_response = {
  address_list_id : address_list_id; [@ocaml.doc "The identifier of the address list resource.\n"]
  address_list_arn : address_list_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the address list resource.\n"]
  address_list_name : address_list_name;
      [@ocaml.doc "A user-friendly name for the address list resource.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date of when then address list was created.\n"]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date of when the address list was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec get_address_list_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The identifier of an existing address list resource to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec job_items_count = int [@@ocaml.doc ""]

type nonrec import_job_status =
  | CREATED [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_address_list_import_job_response = {
  job_id : job_id; [@ocaml.doc "The identifier of the import job.\n"]
  name : job_name; [@ocaml.doc "A user-friendly name for the import job.\n"]
  status : import_job_status; [@ocaml.doc "The status of the import job.\n"]
  pre_signed_url : pre_signed_url;
      [@ocaml.doc "The pre-signed URL target for uploading the input file.\n"]
  imported_items_count : job_items_count option;
      [@ocaml.doc "The number of input addresses successfully imported into the address list.\n"]
  failed_items_count : job_items_count option;
      [@ocaml.doc
        "The number of input addresses that failed to be imported into the address list.\n"]
  import_data_format : import_data_format;
      [@ocaml.doc "The format of the input for an import job.\n"]
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list the import job was created for.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp of when the import job was created.\n"]
  start_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the import job was started.\n"]
  completed_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the import job was completed.\n"]
  error : error_message option; [@ocaml.doc "The reason for failure of an import job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_address_list_import_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the import job that needs to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_archive_response = {
  archive_id : archive_id_string; [@ocaml.doc "The unique identifier of the archive.\n"]
  archive_name : archive_name_string; [@ocaml.doc "The unique name assigned to the archive.\n"]
  archive_arn : archive_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the archive.\n"]
  archive_state : archive_state;
      [@ocaml.doc
        "The current state of the archive:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \226\128\147 The archive is ready and available for use. \n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_DELETION] \226\128\147 The archive has been marked for deletion and \
         will be permanently deleted in 30 days. No further modifications can be made in this \
         state. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retention : archive_retention; [@ocaml.doc "The retention period for emails in this archive.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the archive was created.\n"]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the archive was modified.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS key used to encrypt the archive.\n"]
}
[@@ocaml.doc "The response containing details of the requested archive.\n"]

type nonrec get_archive_request = {
  archive_id : archive_id_string; [@ocaml.doc "The identifier of the archive to retrieve.\n"]
}
[@@ocaml.doc "The request to retrieve details of an email archive.\n"]

type nonrec get_archive_export_response = {
  archive_id : archive_id option;
      [@ocaml.doc "The identifier of the archive the email export was performed from.\n"]
  filters : archive_filters option;
      [@ocaml.doc "The criteria used to filter emails included in the export.\n"]
  from_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The start of the timestamp range the exported emails cover.\n"]
  to_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The end of the date range the exported emails cover.\n"]
  max_results : export_max_results option;
      [@ocaml.doc "The maximum number of email items included in the export.\n"]
  export_destination_configuration : export_destination_configuration option;
      [@ocaml.doc "Where the exported emails are being delivered.\n"]
  status : export_status option; [@ocaml.doc "The current status of the export job.\n"]
}
[@@ocaml.doc "The response containing details of the specified archive export job.\n"]

type nonrec get_archive_export_request = {
  export_id : export_id; [@ocaml.doc "The identifier of the export job to get details for.\n"]
}
[@@ocaml.doc "The request to retrieve details of a specific archive export job.\n"]

type nonrec sender_ip_address = string [@@ocaml.doc ""]

type nonrec metadata = {
  timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the email was received.\n"]
  ingress_point_id : ingress_point_id option;
      [@ocaml.doc "The ID of the ingress endpoint through which the email was received.\n"]
  traffic_policy_id : traffic_policy_id option;
      [@ocaml.doc "The ID of the traffic policy that was in effect when the email was received.\n"]
  rule_set_id : rule_set_id option;
      [@ocaml.doc "The ID of the rule set that processed the email.\n"]
  sender_hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the host from which the email was received.\n"]
  sender_ip_address : sender_ip_address option;
      [@ocaml.doc "The IP address of the host from which the email was received.\n"]
  tls_cipher_suite : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The TLS cipher suite used to communicate with the host from which the email was received.\n"]
  tls_protocol : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The TLS protocol used to communicate with the host from which the email was received.\n"]
  sending_method : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the API call used when sent through a configuration set with archiving enabled.\n"]
  source_identity : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The identity name used to authorize the sending action when sent through a configuration \
         set with archiving enabled.\n"]
  sending_pool : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the dedicated IP pool used when sent through a configuration set with \
         archiving enabled.\n"]
  configuration_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the configuration set used when sent through a configuration set with \
         archiving enabled.\n"]
  source_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the archived email source, identified by either a Rule Set's ARN with an \
         Archive action, or a Configuration Set's Archive ARN.\n"]
}
[@@ocaml.doc "The metadata about the email.\n"]

type nonrec s3_presigned_ur_l = string [@@ocaml.doc ""]

type nonrec get_archive_message_response = {
  message_download_link : s3_presigned_ur_l option;
      [@ocaml.doc "A pre-signed URL to temporarily download the full message content.\n"]
  metadata : metadata option; [@ocaml.doc "The metadata about the email.\n"]
  envelope : envelope option; [@ocaml.doc "The SMTP envelope information of the email.\n"]
}
[@@ocaml.doc "The response containing details about the requested archived email message.\n"]

type nonrec get_archive_message_request = {
  archived_message_id : archived_message_id;
      [@ocaml.doc "The unique identifier of the archived email message.\n"]
}
[@@ocaml.doc "The request to get details of a specific email message stored in an archive.\n"]

type nonrec message_body = {
  text : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The plain text body content of the message.\n"]
  html : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The HTML body content of the message.\n"]
  message_malformed : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "A flag indicating if the email was malformed.\n"]
}
[@@ocaml.doc "The textual body content of an email message.\n"]

type nonrec get_archive_message_content_response = {
  body : message_body option; [@ocaml.doc "The textual body content of the email message.\n"]
}
[@@ocaml.doc
  "The response containing the textual content of the requested archived email message.\n"]

type nonrec get_archive_message_content_request = {
  archived_message_id : archived_message_id;
      [@ocaml.doc "The unique identifier of the archived email message.\n"]
}
[@@ocaml.doc
  "The request to get the textual content of a specific email message stored in an archive.\n"]

type nonrec search_state =
  | QUEUED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_status = {
  submission_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the search was submitted.\n"]
  completion_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the search completed (if finished).\n"]
  state : search_state option; [@ocaml.doc "The current state of the search job.\n"]
  error_message : error_message option; [@ocaml.doc "An error message if the search failed.\n"]
}
[@@ocaml.doc "The current status of an archive search job.\n"]

type nonrec search_max_results = int [@@ocaml.doc ""]

type nonrec get_archive_search_response = {
  archive_id : archive_id option;
      [@ocaml.doc "The identifier of the archive the email search was performed in.\n"]
  filters : archive_filters option;
      [@ocaml.doc "The criteria used to filter emails included in the search.\n"]
  from_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The start timestamp of the range the searched emails cover.\n"]
  to_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The end timestamp of the range the searched emails cover.\n"]
  max_results : search_max_results option;
      [@ocaml.doc "The maximum number of search results to return.\n"]
  status : search_status option; [@ocaml.doc "The current status of the search job.\n"]
}
[@@ocaml.doc "The response containing details of the specified archive search job.\n"]

type nonrec search_id = string [@@ocaml.doc ""]

type nonrec get_archive_search_request = {
  search_id : search_id; [@ocaml.doc "The identifier of the search job to get details for.\n"]
}
[@@ocaml.doc "The request to retrieve details of a specific archive search job.\n"]

type nonrec row = {
  archived_message_id : archived_message_id option;
      [@ocaml.doc "The unique identifier of the archived message.\n"]
  received_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the email was received.\n"]
  date : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The date the email was sent.\n"]
  to_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The email addresses in the To header.\n"]
  from_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The email address of the sender.\n"]
  cc : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The email addresses in the CC header.\n"]
  subject : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The subject header value of the email.\n"]
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique message ID of the email.\n"]
  has_attachments : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "A flag indicating if the email has attachments.\n"]
  received_headers : email_received_headers_list option;
      [@ocaml.doc "The received headers from the email delivery path.\n"]
  in_reply_to : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The email message ID this is a reply to.\n"]
  x_mailer : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user agent that sent the email.\n"]
  x_original_mailer : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The original user agent that sent the email.\n"]
  x_priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The priority level of the email.\n"]
  ingress_point_id : ingress_point_id option;
      [@ocaml.doc "The ID of the ingress endpoint through which the email was received.\n"]
  sender_hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the host from which the email was received.\n"]
  sender_ip_address : sender_ip_address option;
      [@ocaml.doc
        "{ul\n\
        \      {-  Mail archived with Mail Manager: The IP address of the client that connects to \
         the ingress endpoint.\n\
        \          \n\
        \           }\n\
        \      {-  Mail sent through a configuration set with the archiving option enabled: The IP \
         address of the client that makes the SendEmail API call.\n\
        \          \n\
        \           }\n\
        \      }\n\
        \  "]
  envelope : envelope option; [@ocaml.doc "The SMTP envelope information of the email.\n"]
  source_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the archived email source, identified by either a Rule Set's ARN with an \
         Archive action, or a Configuration Set's Archive ARN.\n"]
}
[@@ocaml.doc "A result row containing metadata for an archived email message.\n"]

type nonrec rows_list = row list [@@ocaml.doc ""]

type nonrec get_archive_search_results_response = {
  rows : rows_list option;
      [@ocaml.doc "The list of email result objects matching the search criteria.\n"]
}
[@@ocaml.doc "The response containing search results from a completed archive search.\n"]

type nonrec get_archive_search_results_request = {
  search_id : search_id; [@ocaml.doc "The identifier of the completed search job.\n"]
}
[@@ocaml.doc "The request to retrieve results from a completed archive search job.\n"]

type nonrec ingress_point_password_configuration = {
  smtp_password_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The current password expiry timestamp of the ingress endpoint resource.\n"]
  previous_smtp_password_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The previous password version of the ingress endpoint resource.\n"]
  previous_smtp_password_expiry_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The previous password expiry timestamp of the ingress endpoint resource.\n"]
}
[@@ocaml.doc "The password configuration of the ingress endpoint resource.\n"]

type nonrec ingress_point_auth_configuration = {
  ingress_point_password_configuration : ingress_point_password_configuration option;
      [@ocaml.doc
        "The ingress endpoint password configuration for the ingress endpoint resource.\n"]
  secret_arn : secret_arn option;
      [@ocaml.doc
        "The ingress endpoint SecretsManager::Secret ARN configuration for the ingress endpoint \
         resource.\n"]
  tls_auth_configuration : tls_auth_configuration option;
      [@ocaml.doc
        "The mutual TLS authentication configuration for the ingress endpoint resource.\n"]
}
[@@ocaml.doc "The authentication configuration for the ingress endpoint resource.\n"]

type nonrec ingress_point_a_record = string [@@ocaml.doc ""]

type nonrec ingress_point_status =
  | PROVISIONING [@ocaml.doc ""]
  | DEPROVISIONING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CLOSED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_point_arn = string [@@ocaml.doc ""]

type nonrec get_ingress_point_response = {
  ingress_point_id : ingress_point_id;
      [@ocaml.doc "The identifier of an ingress endpoint resource.\n"]
  ingress_point_name : ingress_point_name;
      [@ocaml.doc "A user friendly name for the ingress endpoint.\n"]
  ingress_point_arn : ingress_point_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ingress endpoint resource.\n"]
  status : ingress_point_status option;
      [@ocaml.doc "The status of the ingress endpoint resource.\n"]
  type_ : ingress_point_type option; [@ocaml.doc "The type of ingress endpoint.\n"]
  a_record : ingress_point_a_record option;
      [@ocaml.doc
        " The DNS A Record that identifies your ingress endpoint. Configure your DNS Mail Exchange \
         (MX) record with this value to route emails to Mail Manager. \n"]
  rule_set_id : rule_set_id option;
      [@ocaml.doc "The identifier of a rule set resource associated with the ingress endpoint.\n"]
  traffic_policy_id : traffic_policy_id option;
      [@ocaml.doc
        "The identifier of the traffic policy resource associated with the ingress endpoint.\n"]
  ingress_point_auth_configuration : ingress_point_auth_configuration option;
      [@ocaml.doc "The authentication configuration of the ingress endpoint resource.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc "The network configuration for the ingress point.\n"]
  tls_policy : tls_policy option;
      [@ocaml.doc "The selected Transport Layer Security (TLS) policy of the ingress point.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the ingress endpoint was created.\n"]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the ingress endpoint was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec trust_store_response_option = EXCLUDE [@ocaml.doc ""] | INCLUDE [@ocaml.doc ""]
[@@ocaml.doc "Specifies whether to include trust store contents in the GetIngressPoint response.\n"]

type nonrec get_ingress_point_request = {
  ingress_point_id : ingress_point_id; [@ocaml.doc "The identifier of an ingress endpoint.\n"]
  include_trust_store_contents : trust_store_response_option option;
      [@ocaml.doc
        "Whether to include the trust store contents in the response. Use INCLUDE to retrieve \
         trust store certificate and CRL contents.\n"]
}
[@@ocaml.doc ""]

type nonrec get_member_of_address_list_response = {
  address : address; [@ocaml.doc "The address retrieved from the address list.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp of when the address was created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_member_of_address_list_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list to retrieve the address from.\n"]
  address : address; [@ocaml.doc "The address to be retrieved from the address list.\n"]
}
[@@ocaml.doc ""]

type nonrec relay_arn = string [@@ocaml.doc ""]

type nonrec get_relay_response = {
  relay_id : relay_id; [@ocaml.doc "The unique relay identifier.\n"]
  relay_arn : relay_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the relay.\n"]
  relay_name : relay_name option; [@ocaml.doc "The unique name of the relay.\n"]
  server_name : relay_server_name option; [@ocaml.doc "The destination relay server address.\n"]
  server_port : relay_server_port option; [@ocaml.doc "The destination relay server port.\n"]
  authentication : relay_authentication option;
      [@ocaml.doc
        "The authentication attribute\226\128\148contains the secret ARN where the customer relay \
         server credentials are stored. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the relay was created.\n"]
  last_modified_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when relay was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec get_relay_request = { relay_id : relay_id [@ocaml.doc "A unique relay identifier.\n"] }
[@@ocaml.doc ""]

type nonrec rule_set_arn = string [@@ocaml.doc ""]

type nonrec get_rule_set_response = {
  rule_set_id : rule_set_id; [@ocaml.doc "The identifier of the rule set resource.\n"]
  rule_set_arn : rule_set_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rule set resource.\n"]
  rule_set_name : rule_set_name; [@ocaml.doc "A user-friendly name for the rule set resource.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date of when then rule set was created.\n"]
  last_modification_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date of when the rule set was last modified.\n"]
  rules : rules; [@ocaml.doc "The rules contained in the rule set.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rule_set_request = {
  rule_set_id : rule_set_id; [@ocaml.doc "The identifier of an existing rule set to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec traffic_policy_arn = string [@@ocaml.doc ""]

type nonrec get_traffic_policy_response = {
  traffic_policy_name : traffic_policy_name;
      [@ocaml.doc "A user-friendly name for the traffic policy resource.\n"]
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc "The identifier of the traffic policy resource.\n"]
  traffic_policy_arn : traffic_policy_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the traffic policy resource.\n"]
  policy_statements : policy_statement_list option;
      [@ocaml.doc "The list of conditions which are in the traffic policy resource.\n"]
  max_message_size_bytes : max_message_size_bytes option;
      [@ocaml.doc
        "The maximum message size in bytes of email which is allowed in by this traffic \
         policy\226\128\148anything larger will be blocked.\n"]
  default_action : accept_action option; [@ocaml.doc "The default action of the traffic policy.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the traffic policy was created.\n"]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the traffic policy was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec get_traffic_policy_request = {
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc "The identifier of the traffic policy resource.\n"]
}
[@@ocaml.doc ""]

type nonrec import_job = {
  job_id : job_id; [@ocaml.doc "The identifier of the import job.\n"]
  name : job_name; [@ocaml.doc "A user-friendly name for the import job.\n"]
  status : import_job_status; [@ocaml.doc "The status of the import job.\n"]
  pre_signed_url : pre_signed_url;
      [@ocaml.doc "The pre-signed URL target for uploading the input file.\n"]
  imported_items_count : job_items_count option;
      [@ocaml.doc
        "The number of addresses in the input that were successfully imported into the address list.\n"]
  failed_items_count : job_items_count option;
      [@ocaml.doc
        "The number of addresses in the input that failed to get imported into address list.\n"]
  import_data_format : import_data_format;
      [@ocaml.doc "The format of the input for the import job.\n"]
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list the import job was created for.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp of when the import job was created.\n"]
  start_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the import job was started.\n"]
  completed_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the import job was completed.\n"]
  error : error_message option; [@ocaml.doc "The reason for failure of an import job.\n"]
}
[@@ocaml.doc "Details about an import job.\n"]

type nonrec import_jobs = import_job list [@@ocaml.doc ""]

type nonrec ingress_point = {
  ingress_point_name : ingress_point_name;
      [@ocaml.doc "A user friendly name for the ingress endpoint resource.\n"]
  ingress_point_id : ingress_point_id;
      [@ocaml.doc "The identifier of the ingress endpoint resource.\n"]
  status : ingress_point_status; [@ocaml.doc "The status of the ingress endpoint resource.\n"]
  type_ : ingress_point_type; [@ocaml.doc "The type of ingress endpoint resource.\n"]
  a_record : ingress_point_a_record option;
      [@ocaml.doc
        " The DNS A Record that identifies your ingress endpoint. Configure your DNS Mail Exchange \
         (MX) record with this value to route emails to Mail Manager. \n"]
}
[@@ocaml.doc "The structure of an ingress endpoint resource.\n"]

type nonrec ingress_point_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec ingress_point_status_to_update = ACTIVE [@ocaml.doc ""] | CLOSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ingress_points_list = ingress_point list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_addon_instances_response = {
  addon_instances : addon_instances option; [@ocaml.doc "The list of ingress endpoints.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec list_addon_instances_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of ingress endpoint resources that are returned per call. You can use \
         NextToken to obtain further ingress endpoints. \n"]
}
[@@ocaml.doc ""]

type nonrec list_addon_subscriptions_response = {
  addon_subscriptions : addon_subscriptions option; [@ocaml.doc "The list of ingress endpoints.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_addon_subscriptions_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of ingress endpoint resources that are returned per call. You can use \
         NextToken to obtain further ingress endpoints. \n"]
}
[@@ocaml.doc ""]

type nonrec list_address_list_import_jobs_response = {
  import_jobs : import_jobs; [@ocaml.doc "The list of import jobs.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_address_list_import_jobs_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list for listing import jobs.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of import jobs that are returned per call. You can use NextToken to \
         retrieve the next page of jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_address_lists_response = {
  address_lists : address_lists; [@ocaml.doc "The list of address lists.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_address_lists_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of address list resources that are returned per call. You can use \
         NextToken to retrieve the next page of address lists.\n"]
}
[@@ocaml.doc ""]

type nonrec list_archive_exports_response = {
  exports : export_summary_list option;
      [@ocaml.doc "The list of export job identifiers and statuses.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "If present, use to retrieve the next page of results.\n"]
}
[@@ocaml.doc "The response containing a list of archive export jobs and their statuses.\n"]

type nonrec list_archive_exports_request = {
  archive_id : archive_id; [@ocaml.doc "The identifier of the archive.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. \n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of archive export jobs that are returned per call. You can use \
         NextToken to obtain further pages of archives. \n"]
}
[@@ocaml.doc "The request to list archive export jobs in your account.\n"]

type nonrec search_summary = {
  search_id : search_id option; [@ocaml.doc "The unique identifier of the search job.\n"]
  status : search_status option; [@ocaml.doc "The current status of the search job.\n"]
}
[@@ocaml.doc "Summary details of an archive search job.\n"]

type nonrec search_summary_list = search_summary list [@@ocaml.doc ""]

type nonrec list_archive_searches_response = {
  searches : search_summary_list option;
      [@ocaml.doc "The list of search job identifiers and statuses.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "If present, use to retrieve the next page of results.\n"]
}
[@@ocaml.doc "The response containing a list of archive search jobs and their statuses.\n"]

type nonrec list_archive_searches_request = {
  archive_id : archive_id; [@ocaml.doc "The identifier of the archive.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. \n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of archive search jobs that are returned per call. You can use \
         NextToken to obtain further pages of archives. \n"]
}
[@@ocaml.doc "The request to list archive search jobs in your account.\n"]

type nonrec list_archives_response = {
  archives : archives_list; [@ocaml.doc "The list of archive details.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "If present, use to retrieve the next page of results.\n"]
}
[@@ocaml.doc "The response containing a list of your email archives.\n"]

type nonrec list_archives_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. \n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of archives that are returned per call. You can use NextToken to \
         obtain further pages of archives. \n"]
}
[@@ocaml.doc "The request to list email archives in your account.\n"]

type nonrec list_ingress_points_response = {
  ingress_points : ingress_points_list option; [@ocaml.doc "The list of ingress endpoints.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_ingress_points_request = {
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of ingress endpoint resources that are returned per call. You can use \
         NextToken to obtain further ingress endpoints.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec saved_address = {
  address : address; [@ocaml.doc "The email or domain that constitutes the address.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp of when the address was added to the address list.\n"]
}
[@@ocaml.doc "An address that is a member of an address list.\n"]

type nonrec saved_addresses = saved_address list [@@ocaml.doc ""]

type nonrec list_members_of_address_list_response = {
  addresses : saved_addresses; [@ocaml.doc "The list of addresses.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_members_of_address_list_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list to list the addresses from.\n"]
  filter : address_filter option; [@ocaml.doc "Filter to be used to limit the results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
  page_size : address_page_size option;
      [@ocaml.doc
        "The maximum number of address list members that are returned per call. You can use \
         NextToken to retrieve the next page of members.\n"]
}
[@@ocaml.doc ""]

type nonrec relay = {
  relay_id : relay_id option; [@ocaml.doc "The unique relay identifier.\n"]
  relay_name : relay_name option; [@ocaml.doc "The unique relay name.\n"]
  last_modified_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the relay was last modified.\n"]
}
[@@ocaml.doc
  "The relay resource that can be used as a rule to relay receiving emails to the destination \
   relay server.\n"]

type nonrec relays = relay list [@@ocaml.doc ""]

type nonrec list_relays_response = {
  relays : relays; [@ocaml.doc "The list of returned relays.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_relays_request = {
  page_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of relays to be returned in one request.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_set = {
  rule_set_id : rule_set_id option; [@ocaml.doc "The identifier of the rule set.\n"]
  rule_set_name : rule_set_name option; [@ocaml.doc "A user-friendly name for the rule set.\n"]
  last_modification_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The last modification date of the rule set.\n"]
}
[@@ocaml.doc
  "A rule set contains a list of rules that are evaluated in order. Each rule is evaluated \
   sequentially for each email.\n"]

type nonrec rule_sets = rule_set list [@@ocaml.doc ""]

type nonrec list_rule_sets_response = {
  rule_sets : rule_sets; [@ocaml.doc "The list of rule sets.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rule_sets_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of rule set resources that are returned per call. You can use \
         NextToken to obtain further rule sets.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list;
      [@ocaml.doc
        "The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]
}
[@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to retrieve tags from.\n"]
}
[@@ocaml.doc ""]

type nonrec traffic_policy = {
  traffic_policy_name : traffic_policy_name;
      [@ocaml.doc "A user-friendly name of the traffic policy resource.\n"]
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc "The identifier of the traffic policy resource.\n"]
  default_action : accept_action;
      [@ocaml.doc
        "Default action instructs the tra\239\172\131c policy to either Allow or Deny (block) \
         messages that fall outside of (or not addressed by) the conditions of your policy \
         statements\n"]
}
[@@ocaml.doc
  "The structure of a traffic policy resource which is a container for policy statements.\n"]

type nonrec traffic_policy_list = traffic_policy list [@@ocaml.doc ""]

type nonrec list_traffic_policies_response = {
  traffic_policies : traffic_policy_list option; [@ocaml.doc "The list of traffic policies.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If NextToken is returned, there are more results available. The value of NextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_traffic_policies_request = {
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of traffic policy resources that are returned per call. You can use \
         NextToken to obtain further traffic policies.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a pagination token from a previous call to this API, you can provide it \
         here to continue paginating through the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the resource that you want to untag. \n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        " The keys of the key-value pairs for the tag or tags you want to remove from the \
         specified resource. \n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the resource that you want to tag. \n"]
  tags : tag_list;
      [@ocaml.doc
        " The tags used to organize, track, or control access for the resource. For example, \\{ \
         \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}. \n"]
}
[@@ocaml.doc ""]

type nonrec stop_archive_search_response = unit [@@ocaml.doc ""]

type nonrec stop_archive_search_request = {
  search_id : search_id; [@ocaml.doc "The identifier of the search job to stop.\n"]
}
[@@ocaml.doc "The request to stop an in-progress archive search job.\n"]

type nonrec stop_archive_export_response = unit [@@ocaml.doc ""]

type nonrec stop_archive_export_request = {
  export_id : export_id; [@ocaml.doc "The identifier of the export job to stop.\n"]
}
[@@ocaml.doc "The request to stop an in-progress archive export job.\n"]

type nonrec stop_address_list_import_job_response = unit [@@ocaml.doc ""]

type nonrec stop_address_list_import_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the import job that needs to be stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec start_archive_search_response = {
  search_id : search_id option; [@ocaml.doc "The unique identifier for the initiated search job.\n"]
}
[@@ocaml.doc "The response from initiating an archive search.\n"]

type nonrec start_archive_search_request = {
  archive_id : archive_id; [@ocaml.doc "The identifier of the archive to search emails in.\n"]
  filters : archive_filters option;
      [@ocaml.doc "Criteria to filter which emails are included in the search results.\n"]
  from_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The start timestamp of the range to search emails from.\n"]
  to_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The end timestamp of the range to search emails from.\n"]
  max_results : search_max_results; [@ocaml.doc "The maximum number of search results to return.\n"]
}
[@@ocaml.doc "The request to initiate a search across emails in an archive.\n"]

type nonrec start_archive_export_response = {
  export_id : export_id option; [@ocaml.doc "The unique identifier for the initiated export job.\n"]
}
[@@ocaml.doc "The response from initiating an archive export.\n"]

type nonrec start_archive_export_request = {
  archive_id : archive_id; [@ocaml.doc "The identifier of the archive to export emails from.\n"]
  filters : archive_filters option;
      [@ocaml.doc "Criteria to filter which emails are included in the export.\n"]
  from_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The start of the timestamp range to include emails from.\n"]
  to_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The end of the timestamp range to include emails from.\n"]
  max_results : export_max_results option;
      [@ocaml.doc "The maximum number of email items to include in the export.\n"]
  export_destination_configuration : export_destination_configuration;
      [@ocaml.doc "Details on where to deliver the exported email data.\n"]
  include_metadata : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether to include message metadata as JSON files in the export.\n"]
}
[@@ocaml.doc "The request to initiate an export of emails from an archive.\n"]

type nonrec start_address_list_import_job_response = unit [@@ocaml.doc ""]

type nonrec start_address_list_import_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the import job that needs to be started.\n"]
}
[@@ocaml.doc ""]

type nonrec register_member_to_address_list_response = unit [@@ocaml.doc ""]

type nonrec register_member_to_address_list_request = {
  address_list_id : address_list_id;
      [@ocaml.doc "The unique identifier of the address list where the address should be added.\n"]
  address : address; [@ocaml.doc "The address to be added to the address list.\n"]
}
[@@ocaml.doc ""]

type nonrec relay_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec rule_set_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec traffic_policy_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec update_archive_response = unit [@@ocaml.doc ""]

type nonrec update_archive_request = {
  archive_id : archive_id_string; [@ocaml.doc "The identifier of the archive to update.\n"]
  archive_name : archive_name_string option; [@ocaml.doc "A new, unique name for the archive.\n"]
  retention : archive_retention option;
      [@ocaml.doc "A new retention period for emails in the archive.\n"]
}
[@@ocaml.doc "The request to update properties of an existing email archive.\n"]

type nonrec update_ingress_point_response = unit [@@ocaml.doc ""]

type nonrec update_ingress_point_request = {
  ingress_point_id : ingress_point_id;
      [@ocaml.doc "The identifier for the ingress endpoint you want to update.\n"]
  ingress_point_name : ingress_point_name option;
      [@ocaml.doc "A user friendly name for the ingress endpoint resource.\n"]
  status_to_update : ingress_point_status_to_update option;
      [@ocaml.doc "The update status of an ingress endpoint.\n"]
  rule_set_id : rule_set_id option;
      [@ocaml.doc
        "The identifier of an existing rule set that you attach to an ingress endpoint resource.\n"]
  traffic_policy_id : traffic_policy_id option;
      [@ocaml.doc
        "The identifier of an existing traffic policy that you attach to an ingress endpoint \
         resource.\n"]
  ingress_point_configuration : ingress_point_configuration option;
      [@ocaml.doc
        "If you choose an Authenticated ingress endpoint, you must configure either an SMTP \
         password or a secret ARN.\n"]
  tls_policy : tls_policy option;
      [@ocaml.doc
        "The Transport Layer Security (TLS) policy for the ingress point. Valid values are \
         REQUIRED, OPTIONAL. Only ingress endpoints using REQUIRED or OPTIONAL as TlsPolicy can be \
         updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_relay_response = unit [@@ocaml.doc ""]

type nonrec update_relay_request = {
  relay_id : relay_id; [@ocaml.doc "The unique relay identifier.\n"]
  relay_name : relay_name option; [@ocaml.doc "The name of the relay resource.\n"]
  server_name : relay_server_name option; [@ocaml.doc "The destination relay server address.\n"]
  server_port : relay_server_port option; [@ocaml.doc "The destination relay server port.\n"]
  authentication : relay_authentication option;
      [@ocaml.doc
        "Authentication for the relay destination server\226\128\148specify the secretARN where \
         the SMTP credentials are stored.\n"]
}
[@@ocaml.doc ""]

type nonrec update_rule_set_response = unit [@@ocaml.doc ""]

type nonrec update_rule_set_request = {
  rule_set_id : rule_set_id; [@ocaml.doc "The identifier of a rule set you want to update.\n"]
  rule_set_name : rule_set_name option;
      [@ocaml.doc "A user-friendly name for the rule set resource.\n"]
  rules : rules option;
      [@ocaml.doc
        "A new set of rules to replace the current rules of the rule set\226\128\148these rules \
         will override all the rules of the rule set.\n"]
}
[@@ocaml.doc ""]

type nonrec update_traffic_policy_response = unit [@@ocaml.doc ""]

type nonrec update_traffic_policy_request = {
  traffic_policy_id : traffic_policy_id;
      [@ocaml.doc "The identifier of the traffic policy that you want to update.\n"]
  traffic_policy_name : traffic_policy_name option;
      [@ocaml.doc "A user-friendly name for the traffic policy resource.\n"]
  policy_statements : policy_statement_list option;
      [@ocaml.doc "The list of conditions to be updated for filtering email traffic.\n"]
  default_action : accept_action option;
      [@ocaml.doc
        "Default action instructs the tra\239\172\131c policy to either Allow or Deny (block) \
         messages that fall outside of (or not addressed by) the conditions of your policy \
         statements\n"]
  max_message_size_bytes : max_message_size_bytes option;
      [@ocaml.doc
        "The maximum message size in bytes of email which is allowed in by this traffic \
         policy\226\128\148anything larger will be blocked.\n"]
}
[@@ocaml.doc ""]
