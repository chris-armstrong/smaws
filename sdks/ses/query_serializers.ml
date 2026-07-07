open Types

let amazon_resource_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let workmail_action_to_query path (x : workmail_action) =
  List.concat
    [
      amazon_resource_name_to_query (List.append path [ "OrganizationArn" ]) x.organization_arn;
      (match x.topic_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TopicArn" ]) v);
    ]

let verify_email_identity_response_to_query path _x = []
let address_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verify_email_identity_request_to_query path (x : verify_email_identity_request) =
  List.concat [ address_to_query (List.append path [ "EmailAddress" ]) x.email_address ]

let verify_email_address_request_to_query path (x : verify_email_address_request) =
  List.concat [ address_to_query (List.append path [ "EmailAddress" ]) x.email_address ]

let verification_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verify_domain_identity_response_to_query path (x : verify_domain_identity_response) =
  List.concat
    [ verification_token_to_query (List.append path [ "VerificationToken" ]) x.verification_token ]

let domain_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verify_domain_identity_request_to_query path (x : verify_domain_identity_request) =
  List.concat [ domain_to_query (List.append path [ "Domain" ]) x.domain ]

let verification_token_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" verification_token_to_query path xs

let verify_domain_dkim_response_to_query path (x : verify_domain_dkim_response) =
  List.concat [ verification_token_list_to_query (List.append path [ "DkimTokens" ]) x.dkim_tokens ]

let verify_domain_dkim_request_to_query path (x : verify_domain_dkim_request) =
  List.concat [ domain_to_query (List.append path [ "Domain" ]) x.domain ]

let verification_status_to_query path (x : verification_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NotStarted -> "NotStarted"
    | TemporaryFailure -> "TemporaryFailure"
    | Failed -> "Failed"
    | Success -> "Success"
    | Pending -> "Pending")

let identity_verification_attributes_to_query path (x : identity_verification_attributes) =
  List.concat
    [
      (match x.verification_token with
      | None -> []
      | Some v -> verification_token_to_query (List.append path [ "VerificationToken" ]) v);
      verification_status_to_query (List.append path [ "VerificationStatus" ]) x.verification_status;
    ]

let identity_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verification_attributes_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" identity_to_query
    identity_verification_attributes_to_query path pairs

let update_template_response_to_query path _x = []
let template_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subject_part_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let text_part_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let html_part_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let template_to_query path (x : template) =
  List.concat
    [
      (match x.html_part with
      | None -> []
      | Some v -> html_part_to_query (List.append path [ "HtmlPart" ]) v);
      (match x.text_part with
      | None -> []
      | Some v -> text_part_to_query (List.append path [ "TextPart" ]) v);
      (match x.subject_part with
      | None -> []
      | Some v -> subject_part_to_query (List.append path [ "SubjectPart" ]) v);
      template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
    ]

let update_template_request_to_query path (x : update_template_request) =
  List.concat [ template_to_query (List.append path [ "Template" ]) x.template ]

let error_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let template_does_not_exist_exception_to_query path (x : template_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let invalid_template_exception_to_query path (x : invalid_template_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let update_receipt_rule_response_to_query path _x = []

let receipt_rule_set_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let receipt_rule_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let tls_policy_to_query path (x : tls_policy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Optional -> "Optional" | Require -> "Require")

let recipient_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let recipients_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" recipient_to_query path xs

let s3_bucket_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let s3_key_prefix_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let iam_role_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let s3_action_to_query path (x : s3_action) =
  List.concat
    [
      (match x.iam_role_arn with
      | None -> []
      | Some v -> iam_role_ar_n_to_query (List.append path [ "IamRoleArn" ]) v);
      (match x.kms_key_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "KmsKeyArn" ]) v);
      (match x.object_key_prefix with
      | None -> []
      | Some v -> s3_key_prefix_to_query (List.append path [ "ObjectKeyPrefix" ]) v);
      s3_bucket_name_to_query (List.append path [ "BucketName" ]) x.bucket_name;
      (match x.topic_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TopicArn" ]) v);
    ]

let bounce_smtp_reply_code_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let bounce_status_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let bounce_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let bounce_action_to_query path (x : bounce_action) =
  List.concat
    [
      address_to_query (List.append path [ "Sender" ]) x.sender;
      bounce_message_to_query (List.append path [ "Message" ]) x.message;
      (match x.status_code with
      | None -> []
      | Some v -> bounce_status_code_to_query (List.append path [ "StatusCode" ]) v);
      bounce_smtp_reply_code_to_query (List.append path [ "SmtpReplyCode" ]) x.smtp_reply_code;
      (match x.topic_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TopicArn" ]) v);
    ]

let invocation_type_to_query path (x : invocation_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with RequestResponse -> "RequestResponse" | Event -> "Event")

let lambda_action_to_query path (x : lambda_action) =
  List.concat
    [
      (match x.invocation_type with
      | None -> []
      | Some v -> invocation_type_to_query (List.append path [ "InvocationType" ]) v);
      amazon_resource_name_to_query (List.append path [ "FunctionArn" ]) x.function_arn;
      (match x.topic_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TopicArn" ]) v);
    ]

let stop_scope_to_query path (x : stop_scope) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with RULE_SET -> "RuleSet")

let stop_action_to_query path (x : stop_action) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TopicArn" ]) v);
      stop_scope_to_query (List.append path [ "Scope" ]) x.scope;
    ]

let header_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let header_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let add_header_action_to_query path (x : add_header_action) =
  List.concat
    [
      header_value_to_query (List.append path [ "HeaderValue" ]) x.header_value;
      header_name_to_query (List.append path [ "HeaderName" ]) x.header_name;
    ]

let sns_action_encoding_to_query path (x : sns_action_encoding) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Base64 -> "Base64" | UTF8 -> "UTF-8")

let sns_action_to_query path (x : sns_action) =
  List.concat
    [
      (match x.encoding with
      | None -> []
      | Some v -> sns_action_encoding_to_query (List.append path [ "Encoding" ]) v);
      amazon_resource_name_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let connect_instance_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let connect_action_to_query path (x : connect_action) =
  List.concat
    [
      iam_role_ar_n_to_query (List.append path [ "IAMRoleARN" ]) x.iam_role_ar_n;
      connect_instance_arn_to_query (List.append path [ "InstanceARN" ]) x.instance_ar_n;
    ]

let receipt_action_to_query path (x : receipt_action) =
  List.concat
    [
      (match x.connect_action with
      | None -> []
      | Some v -> connect_action_to_query (List.append path [ "ConnectAction" ]) v);
      (match x.sns_action with
      | None -> []
      | Some v -> sns_action_to_query (List.append path [ "SNSAction" ]) v);
      (match x.add_header_action with
      | None -> []
      | Some v -> add_header_action_to_query (List.append path [ "AddHeaderAction" ]) v);
      (match x.stop_action with
      | None -> []
      | Some v -> stop_action_to_query (List.append path [ "StopAction" ]) v);
      (match x.lambda_action with
      | None -> []
      | Some v -> lambda_action_to_query (List.append path [ "LambdaAction" ]) v);
      (match x.workmail_action with
      | None -> []
      | Some v -> workmail_action_to_query (List.append path [ "WorkmailAction" ]) v);
      (match x.bounce_action with
      | None -> []
      | Some v -> bounce_action_to_query (List.append path [ "BounceAction" ]) v);
      (match x.s3_action with
      | None -> []
      | Some v -> s3_action_to_query (List.append path [ "S3Action" ]) v);
    ]

let receipt_actions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" receipt_action_to_query path xs

let receipt_rule_to_query path (x : receipt_rule) =
  List.concat
    [
      (match x.scan_enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "ScanEnabled" ]) v);
      (match x.actions with
      | None -> []
      | Some v -> receipt_actions_list_to_query (List.append path [ "Actions" ]) v);
      (match x.recipients with
      | None -> []
      | Some v -> recipients_list_to_query (List.append path [ "Recipients" ]) v);
      (match x.tls_policy with
      | None -> []
      | Some v -> tls_policy_to_query (List.append path [ "TlsPolicy" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "Enabled" ]) v);
      receipt_rule_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let update_receipt_rule_request_to_query path (x : update_receipt_rule_request) =
  List.concat
    [
      receipt_rule_to_query (List.append path [ "Rule" ]) x.rule;
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]

let rule_or_rule_set_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let rule_set_does_not_exist_exception_to_query path (x : rule_set_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.name with
      | None -> []
      | Some v -> rule_or_rule_set_name_to_query (List.append path [ "Name" ]) v);
    ]

let rule_does_not_exist_exception_to_query path (x : rule_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.name with
      | None -> []
      | Some v -> rule_or_rule_set_name_to_query (List.append path [ "Name" ]) v);
    ]

let limit_exceeded_exception_to_query path (x : limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_sns_topic_exception_to_query path (x : invalid_sns_topic_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.topic with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "Topic" ]) v);
    ]

let invalid_s3_configuration_exception_to_query path (x : invalid_s3_configuration_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.bucket with
      | None -> []
      | Some v -> s3_bucket_name_to_query (List.append path [ "Bucket" ]) v);
    ]

let invalid_lambda_function_exception_to_query path (x : invalid_lambda_function_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.function_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "FunctionArn" ]) v);
    ]

let from_address_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subject_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let template_content_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let success_redirection_ur_l_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let failure_redirection_ur_l_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_custom_verification_email_template_request_to_query path
    (x : update_custom_verification_email_template_request) =
  List.concat
    [
      (match x.failure_redirection_ur_l with
      | None -> []
      | Some v -> failure_redirection_ur_l_to_query (List.append path [ "FailureRedirectionURL" ]) v);
      (match x.success_redirection_ur_l with
      | None -> []
      | Some v -> success_redirection_ur_l_to_query (List.append path [ "SuccessRedirectionURL" ]) v);
      (match x.template_content with
      | None -> []
      | Some v -> template_content_to_query (List.append path [ "TemplateContent" ]) v);
      (match x.template_subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "TemplateSubject" ]) v);
      (match x.from_email_address with
      | None -> []
      | Some v -> from_address_to_query (List.append path [ "FromEmailAddress" ]) v);
      template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
    ]

let from_email_address_not_verified_exception_to_query path
    (x : from_email_address_not_verified_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.from_email_address with
      | None -> []
      | Some v -> from_address_to_query (List.append path [ "FromEmailAddress" ]) v);
    ]

let custom_verification_email_template_does_not_exist_exception_to_query path
    (x : custom_verification_email_template_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.custom_verification_email_template_name with
      | None -> []
      | Some v ->
          template_name_to_query (List.append path [ "CustomVerificationEmailTemplateName" ]) v);
    ]

let custom_verification_email_invalid_content_exception_to_query path
    (x : custom_verification_email_invalid_content_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let update_configuration_set_tracking_options_response_to_query path _x = []

let configuration_set_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let custom_redirect_domain_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tracking_options_to_query path (x : tracking_options) =
  List.concat
    [
      (match x.custom_redirect_domain with
      | None -> []
      | Some v -> custom_redirect_domain_to_query (List.append path [ "CustomRedirectDomain" ]) v);
    ]

let update_configuration_set_tracking_options_request_to_query path
    (x : update_configuration_set_tracking_options_request) =
  List.concat
    [
      tracking_options_to_query (List.append path [ "TrackingOptions" ]) x.tracking_options;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let tracking_options_does_not_exist_exception_to_query path
    (x : tracking_options_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let invalid_tracking_options_exception_to_query path (x : invalid_tracking_options_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let configuration_set_does_not_exist_exception_to_query path
    (x : configuration_set_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let update_configuration_set_sending_enabled_request_to_query path
    (x : update_configuration_set_sending_enabled_request) =
  List.concat
    [
      enabled_to_query (List.append path [ "Enabled" ]) x.enabled;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let update_configuration_set_reputation_metrics_enabled_request_to_query path
    (x : update_configuration_set_reputation_metrics_enabled_request) =
  List.concat
    [
      enabled_to_query (List.append path [ "Enabled" ]) x.enabled;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let update_configuration_set_event_destination_response_to_query path _x = []

let event_destination_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let event_type_to_query path (x : event_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RENDERING_FAILURE -> "renderingFailure"
    | CLICK -> "click"
    | OPEN -> "open"
    | DELIVERY -> "delivery"
    | COMPLAINT -> "complaint"
    | BOUNCE -> "bounce"
    | REJECT -> "reject"
    | SEND -> "send")

let event_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" event_type_to_query path xs

let kinesis_firehose_destination_to_query path (x : kinesis_firehose_destination) =
  List.concat
    [
      amazon_resource_name_to_query
        (List.append path [ "DeliveryStreamARN" ])
        x.delivery_stream_ar_n;
      amazon_resource_name_to_query (List.append path [ "IAMRoleARN" ]) x.iam_role_ar_n;
    ]

let dimension_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let dimension_value_source_to_query path (x : dimension_value_source) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | LINK_TAG -> "linkTag"
    | EMAIL_HEADER -> "emailHeader"
    | MESSAGE_TAG -> "messageTag")

let default_dimension_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let cloud_watch_dimension_configuration_to_query path (x : cloud_watch_dimension_configuration) =
  List.concat
    [
      default_dimension_value_to_query
        (List.append path [ "DefaultDimensionValue" ])
        x.default_dimension_value;
      dimension_value_source_to_query
        (List.append path [ "DimensionValueSource" ])
        x.dimension_value_source;
      dimension_name_to_query (List.append path [ "DimensionName" ]) x.dimension_name;
    ]

let cloud_watch_dimension_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    cloud_watch_dimension_configuration_to_query path xs

let cloud_watch_destination_to_query path (x : cloud_watch_destination) =
  List.concat
    [
      cloud_watch_dimension_configurations_to_query
        (List.append path [ "DimensionConfigurations" ])
        x.dimension_configurations;
    ]

let sns_destination_to_query path (x : sns_destination) =
  List.concat [ amazon_resource_name_to_query (List.append path [ "TopicARN" ]) x.topic_ar_n ]

let event_destination_to_query path (x : event_destination) =
  List.concat
    [
      (match x.sns_destination with
      | None -> []
      | Some v -> sns_destination_to_query (List.append path [ "SNSDestination" ]) v);
      (match x.cloud_watch_destination with
      | None -> []
      | Some v -> cloud_watch_destination_to_query (List.append path [ "CloudWatchDestination" ]) v);
      (match x.kinesis_firehose_destination with
      | None -> []
      | Some v ->
          kinesis_firehose_destination_to_query
            (List.append path [ "KinesisFirehoseDestination" ])
            v);
      event_types_to_query (List.append path [ "MatchingEventTypes" ]) x.matching_event_types;
      (match x.enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "Enabled" ]) v);
      event_destination_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let update_configuration_set_event_destination_request_to_query path
    (x : update_configuration_set_event_destination_request) =
  List.concat
    [
      event_destination_to_query (List.append path [ "EventDestination" ]) x.event_destination;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let invalid_sns_destination_exception_to_query path (x : invalid_sns_destination_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.event_destination_name with
      | None -> []
      | Some v -> event_destination_name_to_query (List.append path [ "EventDestinationName" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let invalid_firehose_destination_exception_to_query path
    (x : invalid_firehose_destination_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.event_destination_name with
      | None -> []
      | Some v -> event_destination_name_to_query (List.append path [ "EventDestinationName" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let invalid_cloud_watch_destination_exception_to_query path
    (x : invalid_cloud_watch_destination_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.event_destination_name with
      | None -> []
      | Some v -> event_destination_name_to_query (List.append path [ "EventDestinationName" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let event_destination_does_not_exist_exception_to_query path
    (x : event_destination_does_not_exist_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.event_destination_name with
      | None -> []
      | Some v -> event_destination_name_to_query (List.append path [ "EventDestinationName" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let update_account_sending_enabled_request_to_query path
    (x : update_account_sending_enabled_request) =
  List.concat
    [
      (match x.enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "Enabled" ]) v);
    ]

let tracking_options_already_exists_exception_to_query path
    (x : tracking_options_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let timestamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let rendered_template_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let test_render_template_response_to_query path (x : test_render_template_response) =
  List.concat
    [
      (match x.rendered_template with
      | None -> []
      | Some v -> rendered_template_to_query (List.append path [ "RenderedTemplate" ]) v);
    ]

let template_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let test_render_template_request_to_query path (x : test_render_template_request) =
  List.concat
    [
      template_data_to_query (List.append path [ "TemplateData" ]) x.template_data;
      template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
    ]

let missing_rendering_attribute_exception_to_query path (x : missing_rendering_attribute_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let invalid_rendering_parameter_exception_to_query path (x : invalid_rendering_parameter_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let template_metadata_to_query path (x : template_metadata) =
  List.concat
    [
      (match x.created_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreatedTimestamp" ]) v);
      (match x.name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "Name" ]) v);
    ]

let template_metadata_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" template_metadata_to_query path xs

let set_receipt_rule_position_response_to_query path _x = []

let set_receipt_rule_position_request_to_query path (x : set_receipt_rule_position_request) =
  List.concat
    [
      (match x.after with
      | None -> []
      | Some v -> receipt_rule_name_to_query (List.append path [ "After" ]) v);
      receipt_rule_name_to_query (List.append path [ "RuleName" ]) x.rule_name;
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]

let set_identity_notification_topic_response_to_query path _x = []

let notification_type_to_query path (x : notification_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Delivery -> "Delivery" | Complaint -> "Complaint" | Bounce -> "Bounce")

let notification_topic_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let set_identity_notification_topic_request_to_query path
    (x : set_identity_notification_topic_request) =
  List.concat
    [
      (match x.sns_topic with
      | None -> []
      | Some v -> notification_topic_to_query (List.append path [ "SnsTopic" ]) v);
      notification_type_to_query (List.append path [ "NotificationType" ]) x.notification_type;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let set_identity_mail_from_domain_response_to_query path _x = []

let mail_from_domain_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let behavior_on_mx_failure_to_query path (x : behavior_on_mx_failure) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with RejectMessage -> "RejectMessage" | UseDefaultValue -> "UseDefaultValue")

let set_identity_mail_from_domain_request_to_query path (x : set_identity_mail_from_domain_request)
    =
  List.concat
    [
      (match x.behavior_on_mx_failure with
      | None -> []
      | Some v -> behavior_on_mx_failure_to_query (List.append path [ "BehaviorOnMXFailure" ]) v);
      (match x.mail_from_domain with
      | None -> []
      | Some v -> mail_from_domain_name_to_query (List.append path [ "MailFromDomain" ]) v);
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let set_identity_headers_in_notifications_enabled_response_to_query path _x = []

let set_identity_headers_in_notifications_enabled_request_to_query path
    (x : set_identity_headers_in_notifications_enabled_request) =
  List.concat
    [
      enabled_to_query (List.append path [ "Enabled" ]) x.enabled;
      notification_type_to_query (List.append path [ "NotificationType" ]) x.notification_type;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let set_identity_feedback_forwarding_enabled_response_to_query path _x = []

let set_identity_feedback_forwarding_enabled_request_to_query path
    (x : set_identity_feedback_forwarding_enabled_request) =
  List.concat
    [
      enabled_to_query (List.append path [ "ForwardingEnabled" ]) x.forwarding_enabled;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let set_identity_dkim_enabled_response_to_query path _x = []

let set_identity_dkim_enabled_request_to_query path (x : set_identity_dkim_enabled_request) =
  List.concat
    [
      enabled_to_query (List.append path [ "DkimEnabled" ]) x.dkim_enabled;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let set_active_receipt_rule_set_response_to_query path _x = []

let set_active_receipt_rule_set_request_to_query path (x : set_active_receipt_rule_set_request) =
  List.concat
    [
      (match x.rule_set_name with
      | None -> []
      | Some v -> receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) v);
    ]

let message_rejected_to_query path (x : message_rejected) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let mail_from_domain_not_verified_exception_to_query path
    (x : mail_from_domain_not_verified_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let configuration_set_sending_paused_exception_to_query path
    (x : configuration_set_sending_paused_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let account_sending_paused_exception_to_query path (x : account_sending_paused_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let message_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let send_templated_email_response_to_query path (x : send_templated_email_response) =
  List.concat [ message_id_to_query (List.append path [ "MessageId" ]) x.message_id ]

let address_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" address_to_query path xs

let destination_to_query path (x : destination) =
  List.concat
    [
      (match x.bcc_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "BccAddresses" ]) v);
      (match x.cc_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "CcAddresses" ]) v);
      (match x.to_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "ToAddresses" ]) v);
    ]

let message_tag_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let message_tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let message_tag_to_query path (x : message_tag) =
  List.concat
    [
      message_tag_value_to_query (List.append path [ "Value" ]) x.value;
      message_tag_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let message_tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" message_tag_to_query path xs

let send_templated_email_request_to_query path (x : send_templated_email_request) =
  List.concat
    [
      template_data_to_query (List.append path [ "TemplateData" ]) x.template_data;
      (match x.template_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TemplateArn" ]) v);
      template_name_to_query (List.append path [ "Template" ]) x.template;
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> message_tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.return_path_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "ReturnPathArn" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "SourceArn" ]) v);
      (match x.return_path with
      | None -> []
      | Some v -> address_to_query (List.append path [ "ReturnPath" ]) v);
      (match x.reply_to_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "ReplyToAddresses" ]) v);
      destination_to_query (List.append path [ "Destination" ]) x.destination;
      address_to_query (List.append path [ "Source" ]) x.source;
    ]

let send_raw_email_response_to_query path (x : send_raw_email_response) =
  List.concat [ message_id_to_query (List.append path [ "MessageId" ]) x.message_id ]

let raw_message_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v

let raw_message_to_query path (x : raw_message) =
  List.concat [ raw_message_data_to_query (List.append path [ "Data" ]) x.data ]

let send_raw_email_request_to_query path (x : send_raw_email_request) =
  List.concat
    [
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> message_tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.return_path_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "ReturnPathArn" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "SourceArn" ]) v);
      (match x.from_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "FromArn" ]) v);
      raw_message_to_query (List.append path [ "RawMessage" ]) x.raw_message;
      (match x.destinations with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "Destinations" ]) v);
      (match x.source with
      | None -> []
      | Some v -> address_to_query (List.append path [ "Source" ]) v);
    ]

let send_email_response_to_query path (x : send_email_response) =
  List.concat [ message_id_to_query (List.append path [ "MessageId" ]) x.message_id ]

let message_data_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let charset_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let content_to_query path (x : content) =
  List.concat
    [
      (match x.charset with
      | None -> []
      | Some v -> charset_to_query (List.append path [ "Charset" ]) v);
      message_data_to_query (List.append path [ "Data" ]) x.data;
    ]

let body_to_query path (x : body) =
  List.concat
    [
      (match x.html with None -> [] | Some v -> content_to_query (List.append path [ "Html" ]) v);
      (match x.text with None -> [] | Some v -> content_to_query (List.append path [ "Text" ]) v);
    ]

let message_to_query path (x : message) =
  List.concat
    [
      body_to_query (List.append path [ "Body" ]) x.body;
      content_to_query (List.append path [ "Subject" ]) x.subject;
    ]

let send_email_request_to_query path (x : send_email_request) =
  List.concat
    [
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> message_tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.return_path_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "ReturnPathArn" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "SourceArn" ]) v);
      (match x.return_path with
      | None -> []
      | Some v -> address_to_query (List.append path [ "ReturnPath" ]) v);
      (match x.reply_to_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "ReplyToAddresses" ]) v);
      message_to_query (List.append path [ "Message" ]) x.message;
      destination_to_query (List.append path [ "Destination" ]) x.destination;
      address_to_query (List.append path [ "Source" ]) x.source;
    ]

let production_access_not_granted_exception_to_query path
    (x : production_access_not_granted_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let send_custom_verification_email_response_to_query path
    (x : send_custom_verification_email_response) =
  List.concat
    [
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
    ]

let send_custom_verification_email_request_to_query path
    (x : send_custom_verification_email_request) =
  List.concat
    [
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
      template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
      address_to_query (List.append path [ "EmailAddress" ]) x.email_address;
    ]

let bulk_email_status_to_query path (x : bulk_email_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Failed -> "Failed"
    | TransientFailure -> "TransientFailure"
    | InvalidParameterValue -> "InvalidParameterValue"
    | ConfigurationSetSendingPaused -> "ConfigurationSetSendingPaused"
    | AccountSendingPaused -> "AccountSendingPaused"
    | InvalidSendingPoolName -> "InvalidSendingPoolName"
    | AccountDailyQuotaExceeded -> "AccountDailyQuotaExceeded"
    | AccountThrottled -> "AccountThrottled"
    | AccountSuspended -> "AccountSuspended"
    | TemplateDoesNotExist -> "TemplateDoesNotExist"
    | ConfigurationSetDoesNotExist -> "ConfigurationSetDoesNotExist"
    | MailFromDomainNotVerified -> "MailFromDomainNotVerified"
    | MessageRejected -> "MessageRejected"
    | Success -> "Success")

let error_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let bulk_email_destination_status_to_query path (x : bulk_email_destination_status) =
  List.concat
    [
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
      (match x.error with None -> [] | Some v -> error_to_query (List.append path [ "Error" ]) v);
      (match x.status with
      | None -> []
      | Some v -> bulk_email_status_to_query (List.append path [ "Status" ]) v);
    ]

let bulk_email_destination_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    bulk_email_destination_status_to_query path xs

let send_bulk_templated_email_response_to_query path (x : send_bulk_templated_email_response) =
  List.concat
    [ bulk_email_destination_status_list_to_query (List.append path [ "Status" ]) x.status ]

let bulk_email_destination_to_query path (x : bulk_email_destination) =
  List.concat
    [
      (match x.replacement_template_data with
      | None -> []
      | Some v -> template_data_to_query (List.append path [ "ReplacementTemplateData" ]) v);
      (match x.replacement_tags with
      | None -> []
      | Some v -> message_tag_list_to_query (List.append path [ "ReplacementTags" ]) v);
      destination_to_query (List.append path [ "Destination" ]) x.destination;
    ]

let bulk_email_destination_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" bulk_email_destination_to_query path
    xs

let send_bulk_templated_email_request_to_query path (x : send_bulk_templated_email_request) =
  List.concat
    [
      bulk_email_destination_list_to_query (List.append path [ "Destinations" ]) x.destinations;
      template_data_to_query (List.append path [ "DefaultTemplateData" ]) x.default_template_data;
      (match x.template_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "TemplateArn" ]) v);
      template_name_to_query (List.append path [ "Template" ]) x.template;
      (match x.default_tags with
      | None -> []
      | Some v -> message_tag_list_to_query (List.append path [ "DefaultTags" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
      (match x.return_path_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "ReturnPathArn" ]) v);
      (match x.return_path with
      | None -> []
      | Some v -> address_to_query (List.append path [ "ReturnPath" ]) v);
      (match x.reply_to_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "ReplyToAddresses" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "SourceArn" ]) v);
      address_to_query (List.append path [ "Source" ]) x.source;
    ]

let send_bounce_response_to_query path (x : send_bounce_response) =
  List.concat
    [
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
    ]

let explanation_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let reporting_mta_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let arrival_date_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let extension_field_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let extension_field_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let extension_field_to_query path (x : extension_field) =
  List.concat
    [
      extension_field_value_to_query (List.append path [ "Value" ]) x.value;
      extension_field_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let extension_field_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" extension_field_to_query path xs

let message_dsn_to_query path (x : message_dsn) =
  List.concat
    [
      (match x.extension_fields with
      | None -> []
      | Some v -> extension_field_list_to_query (List.append path [ "ExtensionFields" ]) v);
      (match x.arrival_date with
      | None -> []
      | Some v -> arrival_date_to_query (List.append path [ "ArrivalDate" ]) v);
      reporting_mta_to_query (List.append path [ "ReportingMta" ]) x.reporting_mta;
    ]

let bounce_type_to_query path (x : bounce_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | TemporaryFailure -> "TemporaryFailure"
    | Undefined -> "Undefined"
    | ContentRejected -> "ContentRejected"
    | ExceededQuota -> "ExceededQuota"
    | MessageTooLarge -> "MessageTooLarge"
    | DoesNotExist -> "DoesNotExist")

let dsn_action_to_query path (x : dsn_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | EXPANDED -> "expanded"
    | RELAYED -> "relayed"
    | DELIVERED -> "delivered"
    | DELAYED -> "delayed"
    | FAILED -> "failed")

let remote_mta_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let dsn_status_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let diagnostic_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let last_attempt_date_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let recipient_dsn_fields_to_query path (x : recipient_dsn_fields) =
  List.concat
    [
      (match x.extension_fields with
      | None -> []
      | Some v -> extension_field_list_to_query (List.append path [ "ExtensionFields" ]) v);
      (match x.last_attempt_date with
      | None -> []
      | Some v -> last_attempt_date_to_query (List.append path [ "LastAttemptDate" ]) v);
      (match x.diagnostic_code with
      | None -> []
      | Some v -> diagnostic_code_to_query (List.append path [ "DiagnosticCode" ]) v);
      dsn_status_to_query (List.append path [ "Status" ]) x.status;
      (match x.remote_mta with
      | None -> []
      | Some v -> remote_mta_to_query (List.append path [ "RemoteMta" ]) v);
      dsn_action_to_query (List.append path [ "Action" ]) x.action;
      (match x.final_recipient with
      | None -> []
      | Some v -> address_to_query (List.append path [ "FinalRecipient" ]) v);
    ]

let bounced_recipient_info_to_query path (x : bounced_recipient_info) =
  List.concat
    [
      (match x.recipient_dsn_fields with
      | None -> []
      | Some v -> recipient_dsn_fields_to_query (List.append path [ "RecipientDsnFields" ]) v);
      (match x.bounce_type with
      | None -> []
      | Some v -> bounce_type_to_query (List.append path [ "BounceType" ]) v);
      (match x.recipient_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "RecipientArn" ]) v);
      address_to_query (List.append path [ "Recipient" ]) x.recipient;
    ]

let bounced_recipient_info_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" bounced_recipient_info_to_query path
    xs

let send_bounce_request_to_query path (x : send_bounce_request) =
  List.concat
    [
      (match x.bounce_sender_arn with
      | None -> []
      | Some v -> amazon_resource_name_to_query (List.append path [ "BounceSenderArn" ]) v);
      bounced_recipient_info_list_to_query
        (List.append path [ "BouncedRecipientInfoList" ])
        x.bounced_recipient_info_list;
      (match x.message_dsn with
      | None -> []
      | Some v -> message_dsn_to_query (List.append path [ "MessageDsn" ]) v);
      (match x.explanation with
      | None -> []
      | Some v -> explanation_to_query (List.append path [ "Explanation" ]) v);
      address_to_query (List.append path [ "BounceSender" ]) x.bounce_sender;
      message_id_to_query (List.append path [ "OriginalMessageId" ]) x.original_message_id;
    ]

let reorder_receipt_rule_set_response_to_query path _x = []

let receipt_rule_names_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" receipt_rule_name_to_query path xs

let reorder_receipt_rule_set_request_to_query path (x : reorder_receipt_rule_set_request) =
  List.concat
    [
      receipt_rule_names_list_to_query (List.append path [ "RuleNames" ]) x.rule_names;
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]

let invalid_policy_exception_to_query path (x : invalid_policy_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let put_identity_policy_response_to_query path _x = []
let policy_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let policy_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let put_identity_policy_request_to_query path (x : put_identity_policy_request) =
  List.concat
    [
      policy_to_query (List.append path [ "Policy" ]) x.policy;
      policy_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let invalid_delivery_options_exception_to_query path (x : invalid_delivery_options_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let put_configuration_set_delivery_options_response_to_query path _x = []

let delivery_options_to_query path (x : delivery_options) =
  List.concat
    [
      (match x.tls_policy with
      | None -> []
      | Some v -> tls_policy_to_query (List.append path [ "TlsPolicy" ]) v);
    ]

let put_configuration_set_delivery_options_request_to_query path
    (x : put_configuration_set_delivery_options_request) =
  List.concat
    [
      (match x.delivery_options with
      | None -> []
      | Some v -> delivery_options_to_query (List.append path [ "DeliveryOptions" ]) v);
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let list_verified_email_addresses_response_to_query path
    (x : list_verified_email_addresses_response) =
  List.concat
    [
      (match x.verified_email_addresses with
      | None -> []
      | Some v -> address_list_to_query (List.append path [ "VerifiedEmailAddresses" ]) v);
    ]

let next_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let list_templates_response_to_query path (x : list_templates_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.templates_metadata with
      | None -> []
      | Some v -> template_metadata_list_to_query (List.append path [ "TemplatesMetadata" ]) v);
    ]

let max_items_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_templates_request_to_query path (x : list_templates_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_to_query (List.append path [ "MaxItems" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let receipt_rule_set_metadata_to_query path (x : receipt_rule_set_metadata) =
  List.concat
    [
      (match x.created_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreatedTimestamp" ]) v);
      (match x.name with
      | None -> []
      | Some v -> receipt_rule_set_name_to_query (List.append path [ "Name" ]) v);
    ]

let receipt_rule_sets_lists_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" receipt_rule_set_metadata_to_query
    path xs

let list_receipt_rule_sets_response_to_query path (x : list_receipt_rule_sets_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.rule_sets with
      | None -> []
      | Some v -> receipt_rule_sets_lists_to_query (List.append path [ "RuleSets" ]) v);
    ]

let list_receipt_rule_sets_request_to_query path (x : list_receipt_rule_sets_request) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let receipt_filter_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let receipt_filter_policy_to_query path (x : receipt_filter_policy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Allow -> "Allow" | Block -> "Block")

let cidr_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let receipt_ip_filter_to_query path (x : receipt_ip_filter) =
  List.concat
    [
      cidr_to_query (List.append path [ "Cidr" ]) x.cidr;
      receipt_filter_policy_to_query (List.append path [ "Policy" ]) x.policy;
    ]

let receipt_filter_to_query path (x : receipt_filter) =
  List.concat
    [
      receipt_ip_filter_to_query (List.append path [ "IpFilter" ]) x.ip_filter;
      receipt_filter_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let receipt_filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" receipt_filter_to_query path xs

let list_receipt_filters_response_to_query path (x : list_receipt_filters_response) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> receipt_filter_list_to_query (List.append path [ "Filters" ]) v);
    ]

let list_receipt_filters_request_to_query path _x = []

let policy_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_name_to_query path xs

let list_identity_policies_response_to_query path (x : list_identity_policies_response) =
  List.concat [ policy_name_list_to_query (List.append path [ "PolicyNames" ]) x.policy_names ]

let list_identity_policies_request_to_query path (x : list_identity_policies_request) =
  List.concat [ identity_to_query (List.append path [ "Identity" ]) x.identity ]

let identity_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" identity_to_query path xs

let list_identities_response_to_query path (x : list_identities_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      identity_list_to_query (List.append path [ "Identities" ]) x.identities;
    ]

let identity_type_to_query path (x : identity_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Domain -> "Domain" | EmailAddress -> "EmailAddress")

let list_identities_request_to_query path (x : list_identities_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_to_query (List.append path [ "MaxItems" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.identity_type with
      | None -> []
      | Some v -> identity_type_to_query (List.append path [ "IdentityType" ]) v);
    ]

let custom_verification_email_template_to_query path (x : custom_verification_email_template) =
  List.concat
    [
      (match x.failure_redirection_ur_l with
      | None -> []
      | Some v -> failure_redirection_ur_l_to_query (List.append path [ "FailureRedirectionURL" ]) v);
      (match x.success_redirection_ur_l with
      | None -> []
      | Some v -> success_redirection_ur_l_to_query (List.append path [ "SuccessRedirectionURL" ]) v);
      (match x.template_subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "TemplateSubject" ]) v);
      (match x.from_email_address with
      | None -> []
      | Some v -> from_address_to_query (List.append path [ "FromEmailAddress" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let custom_verification_email_templates_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    custom_verification_email_template_to_query path xs

let list_custom_verification_email_templates_response_to_query path
    (x : list_custom_verification_email_templates_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.custom_verification_email_templates with
      | None -> []
      | Some v ->
          custom_verification_email_templates_to_query
            (List.append path [ "CustomVerificationEmailTemplates" ])
            v);
    ]

let max_results_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_custom_verification_email_templates_request_to_query path
    (x : list_custom_verification_email_templates_request) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let configuration_set_to_query path (x : configuration_set) =
  List.concat [ configuration_set_name_to_query (List.append path [ "Name" ]) x.name ]

let configuration_sets_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" configuration_set_to_query path xs

let list_configuration_sets_response_to_query path (x : list_configuration_sets_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.configuration_sets with
      | None -> []
      | Some v -> configuration_sets_to_query (List.append path [ "ConfigurationSets" ]) v);
    ]

let list_configuration_sets_request_to_query path (x : list_configuration_sets_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_to_query (List.append path [ "MaxItems" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let get_template_response_to_query path (x : get_template_response) =
  List.concat
    [
      (match x.template with
      | None -> []
      | Some v -> template_to_query (List.append path [ "Template" ]) v);
    ]

let get_template_request_to_query path (x : get_template_request) =
  List.concat [ template_name_to_query (List.append path [ "TemplateName" ]) x.template_name ]

let counter_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let send_data_point_to_query path (x : send_data_point) =
  List.concat
    [
      (match x.rejects with
      | None -> []
      | Some v -> counter_to_query (List.append path [ "Rejects" ]) v);
      (match x.complaints with
      | None -> []
      | Some v -> counter_to_query (List.append path [ "Complaints" ]) v);
      (match x.bounces with
      | None -> []
      | Some v -> counter_to_query (List.append path [ "Bounces" ]) v);
      (match x.delivery_attempts with
      | None -> []
      | Some v -> counter_to_query (List.append path [ "DeliveryAttempts" ]) v);
      (match x.timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "Timestamp" ]) v);
    ]

let send_data_point_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" send_data_point_to_query path xs

let get_send_statistics_response_to_query path (x : get_send_statistics_response) =
  List.concat
    [
      (match x.send_data_points with
      | None -> []
      | Some v -> send_data_point_list_to_query (List.append path [ "SendDataPoints" ]) v);
    ]

let max24_hour_send_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v
let max_send_rate_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v
let sent_last24_hours_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let get_send_quota_response_to_query path (x : get_send_quota_response) =
  List.concat
    [
      (match x.sent_last24_hours with
      | None -> []
      | Some v -> sent_last24_hours_to_query (List.append path [ "SentLast24Hours" ]) v);
      (match x.max_send_rate with
      | None -> []
      | Some v -> max_send_rate_to_query (List.append path [ "MaxSendRate" ]) v);
      (match x.max24_hour_send with
      | None -> []
      | Some v -> max24_hour_send_to_query (List.append path [ "Max24HourSend" ]) v);
    ]

let get_identity_verification_attributes_response_to_query path
    (x : get_identity_verification_attributes_response) =
  List.concat
    [
      verification_attributes_to_query
        (List.append path [ "VerificationAttributes" ])
        x.verification_attributes;
    ]

let get_identity_verification_attributes_request_to_query path
    (x : get_identity_verification_attributes_request) =
  List.concat [ identity_list_to_query (List.append path [ "Identities" ]) x.identities ]

let policy_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" policy_name_to_query
    policy_to_query path pairs

let get_identity_policies_response_to_query path (x : get_identity_policies_response) =
  List.concat [ policy_map_to_query (List.append path [ "Policies" ]) x.policies ]

let get_identity_policies_request_to_query path (x : get_identity_policies_request) =
  List.concat
    [
      policy_name_list_to_query (List.append path [ "PolicyNames" ]) x.policy_names;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let identity_notification_attributes_to_query path (x : identity_notification_attributes) =
  List.concat
    [
      (match x.headers_in_delivery_notifications_enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "HeadersInDeliveryNotificationsEnabled" ]) v);
      (match x.headers_in_complaint_notifications_enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "HeadersInComplaintNotificationsEnabled" ]) v);
      (match x.headers_in_bounce_notifications_enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "HeadersInBounceNotificationsEnabled" ]) v);
      enabled_to_query (List.append path [ "ForwardingEnabled" ]) x.forwarding_enabled;
      notification_topic_to_query (List.append path [ "DeliveryTopic" ]) x.delivery_topic;
      notification_topic_to_query (List.append path [ "ComplaintTopic" ]) x.complaint_topic;
      notification_topic_to_query (List.append path [ "BounceTopic" ]) x.bounce_topic;
    ]

let notification_attributes_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" identity_to_query
    identity_notification_attributes_to_query path pairs

let get_identity_notification_attributes_response_to_query path
    (x : get_identity_notification_attributes_response) =
  List.concat
    [
      notification_attributes_to_query
        (List.append path [ "NotificationAttributes" ])
        x.notification_attributes;
    ]

let get_identity_notification_attributes_request_to_query path
    (x : get_identity_notification_attributes_request) =
  List.concat [ identity_list_to_query (List.append path [ "Identities" ]) x.identities ]

let custom_mail_from_status_to_query path (x : custom_mail_from_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | TemporaryFailure -> "TemporaryFailure"
    | Failed -> "Failed"
    | Success -> "Success"
    | Pending -> "Pending")

let identity_mail_from_domain_attributes_to_query path (x : identity_mail_from_domain_attributes) =
  List.concat
    [
      behavior_on_mx_failure_to_query
        (List.append path [ "BehaviorOnMXFailure" ])
        x.behavior_on_mx_failure;
      custom_mail_from_status_to_query
        (List.append path [ "MailFromDomainStatus" ])
        x.mail_from_domain_status;
      mail_from_domain_name_to_query (List.append path [ "MailFromDomain" ]) x.mail_from_domain;
    ]

let mail_from_domain_attributes_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" identity_to_query
    identity_mail_from_domain_attributes_to_query path pairs

let get_identity_mail_from_domain_attributes_response_to_query path
    (x : get_identity_mail_from_domain_attributes_response) =
  List.concat
    [
      mail_from_domain_attributes_to_query
        (List.append path [ "MailFromDomainAttributes" ])
        x.mail_from_domain_attributes;
    ]

let get_identity_mail_from_domain_attributes_request_to_query path
    (x : get_identity_mail_from_domain_attributes_request) =
  List.concat [ identity_list_to_query (List.append path [ "Identities" ]) x.identities ]

let identity_dkim_attributes_to_query path (x : identity_dkim_attributes) =
  List.concat
    [
      (match x.dkim_tokens with
      | None -> []
      | Some v -> verification_token_list_to_query (List.append path [ "DkimTokens" ]) v);
      verification_status_to_query
        (List.append path [ "DkimVerificationStatus" ])
        x.dkim_verification_status;
      enabled_to_query (List.append path [ "DkimEnabled" ]) x.dkim_enabled;
    ]

let dkim_attributes_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" identity_to_query
    identity_dkim_attributes_to_query path pairs

let get_identity_dkim_attributes_response_to_query path (x : get_identity_dkim_attributes_response)
    =
  List.concat [ dkim_attributes_to_query (List.append path [ "DkimAttributes" ]) x.dkim_attributes ]

let get_identity_dkim_attributes_request_to_query path (x : get_identity_dkim_attributes_request) =
  List.concat [ identity_list_to_query (List.append path [ "Identities" ]) x.identities ]

let get_custom_verification_email_template_response_to_query path
    (x : get_custom_verification_email_template_response) =
  List.concat
    [
      (match x.failure_redirection_ur_l with
      | None -> []
      | Some v -> failure_redirection_ur_l_to_query (List.append path [ "FailureRedirectionURL" ]) v);
      (match x.success_redirection_ur_l with
      | None -> []
      | Some v -> success_redirection_ur_l_to_query (List.append path [ "SuccessRedirectionURL" ]) v);
      (match x.template_content with
      | None -> []
      | Some v -> template_content_to_query (List.append path [ "TemplateContent" ]) v);
      (match x.template_subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "TemplateSubject" ]) v);
      (match x.from_email_address with
      | None -> []
      | Some v -> from_address_to_query (List.append path [ "FromEmailAddress" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let get_custom_verification_email_template_request_to_query path
    (x : get_custom_verification_email_template_request) =
  List.concat [ template_name_to_query (List.append path [ "TemplateName" ]) x.template_name ]

let get_account_sending_enabled_response_to_query path (x : get_account_sending_enabled_response) =
  List.concat
    [
      (match x.enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "Enabled" ]) v);
    ]

let receipt_rules_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" receipt_rule_to_query path xs

let describe_receipt_rule_set_response_to_query path (x : describe_receipt_rule_set_response) =
  List.concat
    [
      (match x.rules with
      | None -> []
      | Some v -> receipt_rules_list_to_query (List.append path [ "Rules" ]) v);
      (match x.metadata with
      | None -> []
      | Some v -> receipt_rule_set_metadata_to_query (List.append path [ "Metadata" ]) v);
    ]

let describe_receipt_rule_set_request_to_query path (x : describe_receipt_rule_set_request) =
  List.concat
    [ receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name ]

let describe_receipt_rule_response_to_query path (x : describe_receipt_rule_response) =
  List.concat
    [
      (match x.rule with
      | None -> []
      | Some v -> receipt_rule_to_query (List.append path [ "Rule" ]) v);
    ]

let describe_receipt_rule_request_to_query path (x : describe_receipt_rule_request) =
  List.concat
    [
      receipt_rule_name_to_query (List.append path [ "RuleName" ]) x.rule_name;
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]

let event_destinations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" event_destination_to_query path xs

let last_fresh_start_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let reputation_options_to_query path (x : reputation_options) =
  List.concat
    [
      (match x.last_fresh_start with
      | None -> []
      | Some v -> last_fresh_start_to_query (List.append path [ "LastFreshStart" ]) v);
      (match x.reputation_metrics_enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "ReputationMetricsEnabled" ]) v);
      (match x.sending_enabled with
      | None -> []
      | Some v -> enabled_to_query (List.append path [ "SendingEnabled" ]) v);
    ]

let describe_configuration_set_response_to_query path (x : describe_configuration_set_response) =
  List.concat
    [
      (match x.reputation_options with
      | None -> []
      | Some v -> reputation_options_to_query (List.append path [ "ReputationOptions" ]) v);
      (match x.delivery_options with
      | None -> []
      | Some v -> delivery_options_to_query (List.append path [ "DeliveryOptions" ]) v);
      (match x.tracking_options with
      | None -> []
      | Some v -> tracking_options_to_query (List.append path [ "TrackingOptions" ]) v);
      (match x.event_destinations with
      | None -> []
      | Some v -> event_destinations_to_query (List.append path [ "EventDestinations" ]) v);
      (match x.configuration_set with
      | None -> []
      | Some v -> configuration_set_to_query (List.append path [ "ConfigurationSet" ]) v);
    ]

let configuration_set_attribute_to_query path (x : configuration_set_attribute) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | REPUTATION_OPTIONS -> "reputationOptions"
    | DELIVERY_OPTIONS -> "deliveryOptions"
    | TRACKING_OPTIONS -> "trackingOptions"
    | EVENT_DESTINATIONS -> "eventDestinations")

let configuration_set_attribute_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" configuration_set_attribute_to_query
    path xs

let describe_configuration_set_request_to_query path (x : describe_configuration_set_request) =
  List.concat
    [
      (match x.configuration_set_attribute_names with
      | None -> []
      | Some v ->
          configuration_set_attribute_list_to_query
            (List.append path [ "ConfigurationSetAttributeNames" ])
            v);
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let describe_active_receipt_rule_set_response_to_query path
    (x : describe_active_receipt_rule_set_response) =
  List.concat
    [
      (match x.rules with
      | None -> []
      | Some v -> receipt_rules_list_to_query (List.append path [ "Rules" ]) v);
      (match x.metadata with
      | None -> []
      | Some v -> receipt_rule_set_metadata_to_query (List.append path [ "Metadata" ]) v);
    ]

let describe_active_receipt_rule_set_request_to_query path _x = []

let delete_verified_email_address_request_to_query path (x : delete_verified_email_address_request)
    =
  List.concat [ address_to_query (List.append path [ "EmailAddress" ]) x.email_address ]

let delete_template_response_to_query path _x = []

let delete_template_request_to_query path (x : delete_template_request) =
  List.concat [ template_name_to_query (List.append path [ "TemplateName" ]) x.template_name ]

let cannot_delete_exception_to_query path (x : cannot_delete_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.name with
      | None -> []
      | Some v -> rule_or_rule_set_name_to_query (List.append path [ "Name" ]) v);
    ]

let delete_receipt_rule_set_response_to_query path _x = []

let delete_receipt_rule_set_request_to_query path (x : delete_receipt_rule_set_request) =
  List.concat
    [ receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name ]

let delete_receipt_rule_response_to_query path _x = []

let delete_receipt_rule_request_to_query path (x : delete_receipt_rule_request) =
  List.concat
    [
      receipt_rule_name_to_query (List.append path [ "RuleName" ]) x.rule_name;
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]

let delete_receipt_filter_response_to_query path _x = []

let delete_receipt_filter_request_to_query path (x : delete_receipt_filter_request) =
  List.concat [ receipt_filter_name_to_query (List.append path [ "FilterName" ]) x.filter_name ]

let delete_identity_policy_response_to_query path _x = []

let delete_identity_policy_request_to_query path (x : delete_identity_policy_request) =
  List.concat
    [
      policy_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      identity_to_query (List.append path [ "Identity" ]) x.identity;
    ]

let delete_identity_response_to_query path _x = []

let delete_identity_request_to_query path (x : delete_identity_request) =
  List.concat [ identity_to_query (List.append path [ "Identity" ]) x.identity ]

let delete_custom_verification_email_template_request_to_query path
    (x : delete_custom_verification_email_template_request) =
  List.concat [ template_name_to_query (List.append path [ "TemplateName" ]) x.template_name ]

let delete_configuration_set_tracking_options_response_to_query path _x = []

let delete_configuration_set_tracking_options_request_to_query path
    (x : delete_configuration_set_tracking_options_request) =
  List.concat
    [
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let delete_configuration_set_event_destination_response_to_query path _x = []

let delete_configuration_set_event_destination_request_to_query path
    (x : delete_configuration_set_event_destination_request) =
  List.concat
    [
      event_destination_name_to_query
        (List.append path [ "EventDestinationName" ])
        x.event_destination_name;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let delete_configuration_set_response_to_query path _x = []

let delete_configuration_set_request_to_query path (x : delete_configuration_set_request) =
  List.concat
    [
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let already_exists_exception_to_query path (x : already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.name with
      | None -> []
      | Some v -> rule_or_rule_set_name_to_query (List.append path [ "Name" ]) v);
    ]

let create_template_response_to_query path _x = []

let create_template_request_to_query path (x : create_template_request) =
  List.concat [ template_to_query (List.append path [ "Template" ]) x.template ]

let create_receipt_rule_set_response_to_query path _x = []

let create_receipt_rule_set_request_to_query path (x : create_receipt_rule_set_request) =
  List.concat
    [ receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name ]

let create_receipt_rule_response_to_query path _x = []

let create_receipt_rule_request_to_query path (x : create_receipt_rule_request) =
  List.concat
    [
      receipt_rule_to_query (List.append path [ "Rule" ]) x.rule;
      (match x.after with
      | None -> []
      | Some v -> receipt_rule_name_to_query (List.append path [ "After" ]) v);
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]

let create_receipt_filter_response_to_query path _x = []

let create_receipt_filter_request_to_query path (x : create_receipt_filter_request) =
  List.concat [ receipt_filter_to_query (List.append path [ "Filter" ]) x.filter ]

let custom_verification_email_template_already_exists_exception_to_query path
    (x : custom_verification_email_template_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.custom_verification_email_template_name with
      | None -> []
      | Some v ->
          template_name_to_query (List.append path [ "CustomVerificationEmailTemplateName" ]) v);
    ]

let create_custom_verification_email_template_request_to_query path
    (x : create_custom_verification_email_template_request) =
  List.concat
    [
      failure_redirection_ur_l_to_query
        (List.append path [ "FailureRedirectionURL" ])
        x.failure_redirection_ur_l;
      success_redirection_ur_l_to_query
        (List.append path [ "SuccessRedirectionURL" ])
        x.success_redirection_ur_l;
      template_content_to_query (List.append path [ "TemplateContent" ]) x.template_content;
      subject_to_query (List.append path [ "TemplateSubject" ]) x.template_subject;
      from_address_to_query (List.append path [ "FromEmailAddress" ]) x.from_email_address;
      template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
    ]

let create_configuration_set_tracking_options_response_to_query path _x = []

let create_configuration_set_tracking_options_request_to_query path
    (x : create_configuration_set_tracking_options_request) =
  List.concat
    [
      tracking_options_to_query (List.append path [ "TrackingOptions" ]) x.tracking_options;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let event_destination_already_exists_exception_to_query path
    (x : event_destination_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.event_destination_name with
      | None -> []
      | Some v -> event_destination_name_to_query (List.append path [ "EventDestinationName" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let create_configuration_set_event_destination_response_to_query path _x = []

let create_configuration_set_event_destination_request_to_query path
    (x : create_configuration_set_event_destination_request) =
  List.concat
    [
      event_destination_to_query (List.append path [ "EventDestination" ]) x.event_destination;
      configuration_set_name_to_query
        (List.append path [ "ConfigurationSetName" ])
        x.configuration_set_name;
    ]

let invalid_configuration_set_exception_to_query path (x : invalid_configuration_set_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
    ]

let configuration_set_already_exists_exception_to_query path
    (x : configuration_set_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "message" ]) v);
      (match x.configuration_set_name with
      | None -> []
      | Some v -> configuration_set_name_to_query (List.append path [ "ConfigurationSetName" ]) v);
    ]

let create_configuration_set_response_to_query path _x = []

let create_configuration_set_request_to_query path (x : create_configuration_set_request) =
  List.concat
    [ configuration_set_to_query (List.append path [ "ConfigurationSet" ]) x.configuration_set ]

let clone_receipt_rule_set_response_to_query path _x = []

let clone_receipt_rule_set_request_to_query path (x : clone_receipt_rule_set_request) =
  List.concat
    [
      receipt_rule_set_name_to_query
        (List.append path [ "OriginalRuleSetName" ])
        x.original_rule_set_name;
      receipt_rule_set_name_to_query (List.append path [ "RuleSetName" ]) x.rule_set_name;
    ]
