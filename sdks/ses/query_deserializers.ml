open Types

let unit_of_xml _ = ()
let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_sending_paused_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : account_sending_paused_exception)

let header_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let header_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let add_header_action_of_xml i =
  let r_header_name = ref None in
  let r_header_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HeaderName"; "HeaderValue" ] (fun tag _ ->
      match tag with
      | "HeaderName" ->
          r_header_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeaderName"
                 (fun i _ -> header_name_of_xml i)
                 ())
      | "HeaderValue" ->
          r_header_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeaderValue"
                 (fun i _ -> header_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     header_name = Smaws_Lib.Xml.Parse.required "HeaderName" (( ! ) r_header_name) i;
     header_value = Smaws_Lib.Xml.Parse.required "HeaderValue" (( ! ) r_header_value) i;
   }
    : add_header_action)

let address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let address_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ()

let rule_or_rule_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let already_exists_exception_of_xml i =
  let r_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "message" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; message = ( ! ) r_message } : already_exists_exception)

let amazon_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let arrival_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let behavior_on_mx_failure_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UseDefaultValue" -> UseDefaultValue
   | "RejectMessage" -> RejectMessage
   | _ -> failwith "unknown enum value"
    : behavior_on_mx_failure)

let charset_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let content_of_xml i =
  let r_data = ref None in
  let r_charset = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Data"; "Charset" ] (fun tag _ ->
      match tag with
      | "Data" ->
          r_data :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Data" (fun i _ -> message_data_of_xml i) ())
      | "Charset" ->
          r_charset :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Charset" (fun i _ -> charset_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = Smaws_Lib.Xml.Parse.required "Data" (( ! ) r_data) i; charset = ( ! ) r_charset }
    : content)

let body_of_xml i =
  let r_text = ref None in
  let r_html = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Text"; "Html" ] (fun tag _ ->
      match tag with
      | "Text" ->
          r_text :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Text" (fun i _ -> content_of_xml i) ())
      | "Html" ->
          r_html :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Html" (fun i _ -> content_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ text = ( ! ) r_text; html = ( ! ) r_html } : body)

let bounce_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let bounce_status_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let bounce_smtp_reply_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let bounce_action_of_xml i =
  let r_topic_arn = ref None in
  let r_smtp_reply_code = ref None in
  let r_status_code = ref None in
  let r_message = ref None in
  let r_sender = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TopicArn"; "SmtpReplyCode"; "StatusCode"; "Message"; "Sender" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "SmtpReplyCode" ->
          r_smtp_reply_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SmtpReplyCode"
                 (fun i _ -> bounce_smtp_reply_code_of_xml i)
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> bounce_status_code_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> bounce_message_of_xml i)
                 ())
      | "Sender" ->
          r_sender :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Sender" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_arn = ( ! ) r_topic_arn;
     smtp_reply_code = Smaws_Lib.Xml.Parse.required "SmtpReplyCode" (( ! ) r_smtp_reply_code) i;
     status_code = ( ! ) r_status_code;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     sender = Smaws_Lib.Xml.Parse.required "Sender" (( ! ) r_sender) i;
   }
    : bounce_action)

let bounce_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DoesNotExist" -> DoesNotExist
   | "MessageTooLarge" -> MessageTooLarge
   | "ExceededQuota" -> ExceededQuota
   | "ContentRejected" -> ContentRejected
   | "Undefined" -> Undefined
   | "TemporaryFailure" -> TemporaryFailure
   | _ -> failwith "unknown enum value"
    : bounce_type)

let extension_field_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let extension_field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let extension_field_of_xml i =
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> extension_field_name_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> extension_field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : extension_field)

let extension_field_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> extension_field_of_xml i) ()

let last_attempt_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let diagnostic_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dsn_status_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let remote_mta_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dsn_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "failed" -> FAILED
   | "delayed" -> DELAYED
   | "delivered" -> DELIVERED
   | "relayed" -> RELAYED
   | "expanded" -> EXPANDED
   | _ -> failwith "unknown enum value"
    : dsn_action)

let recipient_dsn_fields_of_xml i =
  let r_final_recipient = ref None in
  let r_action = ref None in
  let r_remote_mta = ref None in
  let r_status = ref None in
  let r_diagnostic_code = ref None in
  let r_last_attempt_date = ref None in
  let r_extension_fields = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FinalRecipient";
      "Action";
      "RemoteMta";
      "Status";
      "DiagnosticCode";
      "LastAttemptDate";
      "ExtensionFields";
    ] (fun tag _ ->
      match tag with
      | "FinalRecipient" ->
          r_final_recipient :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalRecipient"
                 (fun i _ -> address_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Action" (fun i _ -> dsn_action_of_xml i) ())
      | "RemoteMta" ->
          r_remote_mta :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoteMta" (fun i _ -> remote_mta_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> dsn_status_of_xml i) ())
      | "DiagnosticCode" ->
          r_diagnostic_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DiagnosticCode"
                 (fun i _ -> diagnostic_code_of_xml i)
                 ())
      | "LastAttemptDate" ->
          r_last_attempt_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAttemptDate"
                 (fun i _ -> last_attempt_date_of_xml i)
                 ())
      | "ExtensionFields" ->
          r_extension_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtensionFields"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> extension_field_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     final_recipient = ( ! ) r_final_recipient;
     action = Smaws_Lib.Xml.Parse.required "Action" (( ! ) r_action) i;
     remote_mta = ( ! ) r_remote_mta;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     diagnostic_code = ( ! ) r_diagnostic_code;
     last_attempt_date = ( ! ) r_last_attempt_date;
     extension_fields = ( ! ) r_extension_fields;
   }
    : recipient_dsn_fields)

let bounced_recipient_info_of_xml i =
  let r_recipient = ref None in
  let r_recipient_arn = ref None in
  let r_bounce_type = ref None in
  let r_recipient_dsn_fields = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Recipient"; "RecipientArn"; "BounceType"; "RecipientDsnFields" ] (fun tag _ ->
      match tag with
      | "Recipient" ->
          r_recipient :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Recipient" (fun i _ -> address_of_xml i) ())
      | "RecipientArn" ->
          r_recipient_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecipientArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "BounceType" ->
          r_bounce_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceType"
                 (fun i _ -> bounce_type_of_xml i)
                 ())
      | "RecipientDsnFields" ->
          r_recipient_dsn_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecipientDsnFields"
                 (fun i _ -> recipient_dsn_fields_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     recipient = Smaws_Lib.Xml.Parse.required "Recipient" (( ! ) r_recipient) i;
     recipient_arn = ( ! ) r_recipient_arn;
     bounce_type = ( ! ) r_bounce_type;
     recipient_dsn_fields = ( ! ) r_recipient_dsn_fields;
   }
    : bounced_recipient_info)

let bounced_recipient_info_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> bounced_recipient_info_of_xml i) ()

let template_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_tag_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let message_tag_of_xml i =
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> message_tag_name_of_xml i) ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> message_tag_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : message_tag)

let message_tag_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> message_tag_of_xml i) ()

let destination_of_xml i =
  let r_to_addresses = ref None in
  let r_cc_addresses = ref None in
  let r_bcc_addresses = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ToAddresses"; "CcAddresses"; "BccAddresses" ]
    (fun tag _ ->
      match tag with
      | "ToAddresses" ->
          r_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "CcAddresses" ->
          r_cc_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CcAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "BccAddresses" ->
          r_bcc_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BccAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     to_addresses = ( ! ) r_to_addresses;
     cc_addresses = ( ! ) r_cc_addresses;
     bcc_addresses = ( ! ) r_bcc_addresses;
   }
    : destination)

let bulk_email_destination_of_xml i =
  let r_destination = ref None in
  let r_replacement_tags = ref None in
  let r_replacement_template_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Destination"; "ReplacementTags"; "ReplacementTemplateData" ] (fun tag _ ->
      match tag with
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> destination_of_xml i)
                 ())
      | "ReplacementTags" ->
          r_replacement_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplacementTags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_tag_of_xml i)
                     ())
                 ())
      | "ReplacementTemplateData" ->
          r_replacement_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplacementTemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
     replacement_tags = ( ! ) r_replacement_tags;
     replacement_template_data = ( ! ) r_replacement_template_data;
   }
    : bulk_email_destination)

let bulk_email_destination_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> bulk_email_destination_of_xml i) ()

let message_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let error_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let bulk_email_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Success" -> Success
   | "MessageRejected" -> MessageRejected
   | "MailFromDomainNotVerified" -> MailFromDomainNotVerified
   | "ConfigurationSetDoesNotExist" -> ConfigurationSetDoesNotExist
   | "TemplateDoesNotExist" -> TemplateDoesNotExist
   | "AccountSuspended" -> AccountSuspended
   | "AccountThrottled" -> AccountThrottled
   | "AccountDailyQuotaExceeded" -> AccountDailyQuotaExceeded
   | "InvalidSendingPoolName" -> InvalidSendingPoolName
   | "AccountSendingPaused" -> AccountSendingPaused
   | "ConfigurationSetSendingPaused" -> ConfigurationSetSendingPaused
   | "InvalidParameterValue" -> InvalidParameterValue
   | "TransientFailure" -> TransientFailure
   | "Failed" -> Failed
   | _ -> failwith "unknown enum value"
    : bulk_email_status)

let bulk_email_destination_status_of_xml i =
  let r_status = ref None in
  let r_error = ref None in
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Error"; "MessageId" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> bulk_email_status_of_xml i)
                 ())
      | "Error" ->
          r_error :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Error" (fun i _ -> error_of_xml i) ())
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; error = ( ! ) r_error; message_id = ( ! ) r_message_id }
    : bulk_email_destination_status)

let bulk_email_destination_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> bulk_email_destination_status_of_xml i)
    ()

let cannot_delete_exception_of_xml i =
  let r_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "message" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; message = ( ! ) r_message } : cannot_delete_exception)

let cidr_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rule_set_does_not_exist_exception_of_xml i =
  let r_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "message" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; message = ( ! ) r_message } : rule_set_does_not_exist_exception)

let limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_exception)

let clone_receipt_rule_set_response_of_xml i = ()
let receipt_rule_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let clone_receipt_rule_set_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_original_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "OriginalRuleSetName" ]
    (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "OriginalRuleSetName" ->
          r_original_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalRuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     original_rule_set_name =
       Smaws_Lib.Xml.Parse.required "OriginalRuleSetName" (( ! ) r_original_rule_set_name) i;
   }
    : clone_receipt_rule_set_request)

let default_dimension_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dimension_value_source_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "messageTag" -> MESSAGE_TAG
   | "emailHeader" -> EMAIL_HEADER
   | "linkTag" -> LINK_TAG
   | _ -> failwith "unknown enum value"
    : dimension_value_source)

let dimension_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cloud_watch_dimension_configuration_of_xml i =
  let r_dimension_name = ref None in
  let r_dimension_value_source = ref None in
  let r_default_dimension_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DimensionName"; "DimensionValueSource"; "DefaultDimensionValue" ] (fun tag _ ->
      match tag with
      | "DimensionName" ->
          r_dimension_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DimensionName"
                 (fun i _ -> dimension_name_of_xml i)
                 ())
      | "DimensionValueSource" ->
          r_dimension_value_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DimensionValueSource"
                 (fun i _ -> dimension_value_source_of_xml i)
                 ())
      | "DefaultDimensionValue" ->
          r_default_dimension_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultDimensionValue"
                 (fun i _ -> default_dimension_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dimension_name = Smaws_Lib.Xml.Parse.required "DimensionName" (( ! ) r_dimension_name) i;
     dimension_value_source =
       Smaws_Lib.Xml.Parse.required "DimensionValueSource" (( ! ) r_dimension_value_source) i;
     default_dimension_value =
       Smaws_Lib.Xml.Parse.required "DefaultDimensionValue" (( ! ) r_default_dimension_value) i;
   }
    : cloud_watch_dimension_configuration)

let cloud_watch_dimension_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> cloud_watch_dimension_configuration_of_xml i)
    ()

let cloud_watch_destination_of_xml i =
  let r_dimension_configurations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DimensionConfigurations" ] (fun tag _ ->
      match tag with
      | "DimensionConfigurations" ->
          r_dimension_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DimensionConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cloud_watch_dimension_configuration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dimension_configurations =
       Smaws_Lib.Xml.Parse.required "DimensionConfigurations" (( ! ) r_dimension_configurations) i;
   }
    : cloud_watch_destination)

let configuration_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_set_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i } : configuration_set)

let configuration_set_already_exists_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_set_name = ( ! ) r_configuration_set_name; message = ( ! ) r_message }
    : configuration_set_already_exists_exception)

let configuration_set_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "eventDestinations" -> EVENT_DESTINATIONS
   | "trackingOptions" -> TRACKING_OPTIONS
   | "deliveryOptions" -> DELIVERY_OPTIONS
   | "reputationOptions" -> REPUTATION_OPTIONS
   | _ -> failwith "unknown enum value"
    : configuration_set_attribute)

let configuration_set_attribute_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> configuration_set_attribute_of_xml i) ()

let configuration_set_does_not_exist_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_set_name = ( ! ) r_configuration_set_name; message = ( ! ) r_message }
    : configuration_set_does_not_exist_exception)

let configuration_set_sending_paused_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_set_name = ( ! ) r_configuration_set_name; message = ( ! ) r_message }
    : configuration_set_sending_paused_exception)

let configuration_sets_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> configuration_set_of_xml i) ()

let iam_role_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let connect_instance_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let connect_action_of_xml i =
  let r_instance_ar_n = ref None in
  let r_iam_role_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceARN"; "IAMRoleARN" ] (fun tag _ ->
      match tag with
      | "InstanceARN" ->
          r_instance_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceARN"
                 (fun i _ -> connect_instance_arn_of_xml i)
                 ())
      | "IAMRoleARN" ->
          r_iam_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMRoleARN"
                 (fun i _ -> iam_role_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_ar_n = Smaws_Lib.Xml.Parse.required "InstanceARN" (( ! ) r_instance_ar_n) i;
     iam_role_ar_n = Smaws_Lib.Xml.Parse.required "IAMRoleARN" (( ! ) r_iam_role_ar_n) i;
   }
    : connect_action)

let counter_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let invalid_configuration_set_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_configuration_set_exception)

let create_configuration_set_response_of_xml i = ()

let create_configuration_set_request_of_xml i =
  let r_configuration_set = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSet" ] (fun tag _ ->
      match tag with
      | "ConfigurationSet" ->
          r_configuration_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSet"
                 (fun i _ -> configuration_set_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set =
       Smaws_Lib.Xml.Parse.required "ConfigurationSet" (( ! ) r_configuration_set) i;
   }
    : create_configuration_set_request)

let event_destination_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_sns_destination_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "EventDestinationName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     event_destination_name = ( ! ) r_event_destination_name;
     message = ( ! ) r_message;
   }
    : invalid_sns_destination_exception)

let invalid_firehose_destination_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "EventDestinationName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     event_destination_name = ( ! ) r_event_destination_name;
     message = ( ! ) r_message;
   }
    : invalid_firehose_destination_exception)

let invalid_cloud_watch_destination_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "EventDestinationName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     event_destination_name = ( ! ) r_event_destination_name;
     message = ( ! ) r_message;
   }
    : invalid_cloud_watch_destination_exception)

let event_destination_already_exists_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "EventDestinationName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     event_destination_name = ( ! ) r_event_destination_name;
     message = ( ! ) r_message;
   }
    : event_destination_already_exists_exception)

let create_configuration_set_event_destination_response_of_xml i = ()

let sns_destination_of_xml i =
  let r_topic_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicARN" ] (fun tag _ ->
      match tag with
      | "TopicARN" ->
          r_topic_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_ar_n = Smaws_Lib.Xml.Parse.required "TopicARN" (( ! ) r_topic_ar_n) i }
    : sns_destination)

let kinesis_firehose_destination_of_xml i =
  let r_iam_role_ar_n = ref None in
  let r_delivery_stream_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IAMRoleARN"; "DeliveryStreamARN" ] (fun tag _ ->
      match tag with
      | "IAMRoleARN" ->
          r_iam_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMRoleARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "DeliveryStreamARN" ->
          r_delivery_stream_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryStreamARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     iam_role_ar_n = Smaws_Lib.Xml.Parse.required "IAMRoleARN" (( ! ) r_iam_role_ar_n) i;
     delivery_stream_ar_n =
       Smaws_Lib.Xml.Parse.required "DeliveryStreamARN" (( ! ) r_delivery_stream_ar_n) i;
   }
    : kinesis_firehose_destination)

let event_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "send" -> SEND
   | "reject" -> REJECT
   | "bounce" -> BOUNCE
   | "complaint" -> COMPLAINT
   | "delivery" -> DELIVERY
   | "open" -> OPEN
   | "click" -> CLICK
   | "renderingFailure" -> RENDERING_FAILURE
   | _ -> failwith "unknown enum value"
    : event_type)

let event_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_type_of_xml i) ()

let enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let event_destination_of_xml i =
  let r_name = ref None in
  let r_enabled = ref None in
  let r_matching_event_types = ref None in
  let r_kinesis_firehose_destination = ref None in
  let r_cloud_watch_destination = ref None in
  let r_sns_destination = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Name";
      "Enabled";
      "MatchingEventTypes";
      "KinesisFirehoseDestination";
      "CloudWatchDestination";
      "SNSDestination";
    ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "MatchingEventTypes" ->
          r_matching_event_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MatchingEventTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_type_of_xml i) ())
                 ())
      | "KinesisFirehoseDestination" ->
          r_kinesis_firehose_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KinesisFirehoseDestination"
                 (fun i _ -> kinesis_firehose_destination_of_xml i)
                 ())
      | "CloudWatchDestination" ->
          r_cloud_watch_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloudWatchDestination"
                 (fun i _ -> cloud_watch_destination_of_xml i)
                 ())
      | "SNSDestination" ->
          r_sns_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SNSDestination"
                 (fun i _ -> sns_destination_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     enabled = ( ! ) r_enabled;
     matching_event_types =
       Smaws_Lib.Xml.Parse.required "MatchingEventTypes" (( ! ) r_matching_event_types) i;
     kinesis_firehose_destination = ( ! ) r_kinesis_firehose_destination;
     cloud_watch_destination = ( ! ) r_cloud_watch_destination;
     sns_destination = ( ! ) r_sns_destination;
   }
    : event_destination)

let create_configuration_set_event_destination_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "EventDestination" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestination" ->
          r_event_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestination"
                 (fun i _ -> event_destination_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     event_destination =
       Smaws_Lib.Xml.Parse.required "EventDestination" (( ! ) r_event_destination) i;
   }
    : create_configuration_set_event_destination_request)

let tracking_options_already_exists_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_set_name = ( ! ) r_configuration_set_name; message = ( ! ) r_message }
    : tracking_options_already_exists_exception)

let invalid_tracking_options_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_tracking_options_exception)

let create_configuration_set_tracking_options_response_of_xml i = ()
let custom_redirect_domain_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tracking_options_of_xml i =
  let r_custom_redirect_domain = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CustomRedirectDomain" ] (fun tag _ ->
      match tag with
      | "CustomRedirectDomain" ->
          r_custom_redirect_domain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomRedirectDomain"
                 (fun i _ -> custom_redirect_domain_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ custom_redirect_domain = ( ! ) r_custom_redirect_domain } : tracking_options)

let create_configuration_set_tracking_options_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_tracking_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "TrackingOptions" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "TrackingOptions" ->
          r_tracking_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackingOptions"
                 (fun i _ -> tracking_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     tracking_options = Smaws_Lib.Xml.Parse.required "TrackingOptions" (( ! ) r_tracking_options) i;
   }
    : create_configuration_set_tracking_options_request)

let from_address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let from_email_address_not_verified_exception_of_xml i =
  let r_from_email_address = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FromEmailAddress"; "message" ] (fun tag _ ->
      match tag with
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ from_email_address = ( ! ) r_from_email_address; message = ( ! ) r_message }
    : from_email_address_not_verified_exception)

let template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let custom_verification_email_template_already_exists_exception_of_xml i =
  let r_custom_verification_email_template_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CustomVerificationEmailTemplateName"; "message" ]
    (fun tag _ ->
      match tag with
      | "CustomVerificationEmailTemplateName" ->
          r_custom_verification_email_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomVerificationEmailTemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_verification_email_template_name = ( ! ) r_custom_verification_email_template_name;
     message = ( ! ) r_message;
   }
    : custom_verification_email_template_already_exists_exception)

let custom_verification_email_invalid_content_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : custom_verification_email_invalid_content_exception)

let failure_redirection_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let success_redirection_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let template_content_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_custom_verification_email_template_request_of_xml i =
  let r_template_name = ref None in
  let r_from_email_address = ref None in
  let r_template_subject = ref None in
  let r_template_content = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_failure_redirection_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateName";
      "FromEmailAddress";
      "TemplateSubject";
      "TemplateContent";
      "SuccessRedirectionURL";
      "FailureRedirectionURL";
    ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "TemplateContent" ->
          r_template_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateContent"
                 (fun i _ -> template_content_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     from_email_address =
       Smaws_Lib.Xml.Parse.required "FromEmailAddress" (( ! ) r_from_email_address) i;
     template_subject = Smaws_Lib.Xml.Parse.required "TemplateSubject" (( ! ) r_template_subject) i;
     template_content = Smaws_Lib.Xml.Parse.required "TemplateContent" (( ! ) r_template_content) i;
     success_redirection_ur_l =
       Smaws_Lib.Xml.Parse.required "SuccessRedirectionURL" (( ! ) r_success_redirection_ur_l) i;
     failure_redirection_ur_l =
       Smaws_Lib.Xml.Parse.required "FailureRedirectionURL" (( ! ) r_failure_redirection_ur_l) i;
   }
    : create_custom_verification_email_template_request)

let create_receipt_filter_response_of_xml i = ()

let receipt_filter_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Block" -> Block | "Allow" -> Allow | _ -> failwith "unknown enum value"
    : receipt_filter_policy)

let receipt_ip_filter_of_xml i =
  let r_policy = ref None in
  let r_cidr = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy"; "Cidr" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                 (fun i _ -> receipt_filter_policy_of_xml i)
                 ())
      | "Cidr" ->
          r_cidr := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cidr" (fun i _ -> cidr_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy = Smaws_Lib.Xml.Parse.required "Policy" (( ! ) r_policy) i;
     cidr = Smaws_Lib.Xml.Parse.required "Cidr" (( ! ) r_cidr) i;
   }
    : receipt_ip_filter)

let receipt_filter_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let receipt_filter_of_xml i =
  let r_name = ref None in
  let r_ip_filter = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "IpFilter" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> receipt_filter_name_of_xml i)
                 ())
      | "IpFilter" ->
          r_ip_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpFilter"
                 (fun i _ -> receipt_ip_filter_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     ip_filter = Smaws_Lib.Xml.Parse.required "IpFilter" (( ! ) r_ip_filter) i;
   }
    : receipt_filter)

let create_receipt_filter_request_of_xml i =
  let r_filter = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filter" ] (fun tag _ ->
      match tag with
      | "Filter" ->
          r_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filter" (fun i _ -> receipt_filter_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filter = Smaws_Lib.Xml.Parse.required "Filter" (( ! ) r_filter) i }
    : create_receipt_filter_request)

let rule_does_not_exist_exception_of_xml i =
  let r_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "message" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; message = ( ! ) r_message } : rule_does_not_exist_exception)

let invalid_sns_topic_exception_of_xml i =
  let r_topic = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Topic"; "message" ] (fun tag _ ->
      match tag with
      | "Topic" ->
          r_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Topic"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic = ( ! ) r_topic; message = ( ! ) r_message } : invalid_sns_topic_exception)

let s3_bucket_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_s3_configuration_exception_of_xml i =
  let r_bucket = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Bucket"; "message" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Bucket" (fun i _ -> s3_bucket_name_of_xml i) ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ bucket = ( ! ) r_bucket; message = ( ! ) r_message } : invalid_s3_configuration_exception)

let invalid_lambda_function_exception_of_xml i =
  let r_function_arn = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FunctionArn"; "message" ] (fun tag _ ->
      match tag with
      | "FunctionArn" ->
          r_function_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FunctionArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ function_arn = ( ! ) r_function_arn; message = ( ! ) r_message }
    : invalid_lambda_function_exception)

let create_receipt_rule_response_of_xml i = ()

let sns_action_encoding_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "UTF-8" -> UTF8 | "Base64" -> Base64 | _ -> failwith "unknown enum value"
    : sns_action_encoding)

let sns_action_of_xml i =
  let r_topic_arn = ref None in
  let r_encoding = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn"; "Encoding" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Encoding" ->
          r_encoding :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encoding"
                 (fun i _ -> sns_action_encoding_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
     encoding = ( ! ) r_encoding;
   }
    : sns_action)

let stop_scope_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RuleSet" -> RULE_SET | _ -> failwith "unknown enum value" : stop_scope)

let stop_action_of_xml i =
  let r_scope = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Scope"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "Scope" ->
          r_scope :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Scope" (fun i _ -> stop_scope_of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ scope = Smaws_Lib.Xml.Parse.required "Scope" (( ! ) r_scope) i; topic_arn = ( ! ) r_topic_arn }
    : stop_action)

let invocation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Event" -> Event
   | "RequestResponse" -> RequestResponse
   | _ -> failwith "unknown enum value"
    : invocation_type)

let lambda_action_of_xml i =
  let r_topic_arn = ref None in
  let r_function_arn = ref None in
  let r_invocation_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn"; "FunctionArn"; "InvocationType" ]
    (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "FunctionArn" ->
          r_function_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FunctionArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "InvocationType" ->
          r_invocation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationType"
                 (fun i _ -> invocation_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_arn = ( ! ) r_topic_arn;
     function_arn = Smaws_Lib.Xml.Parse.required "FunctionArn" (( ! ) r_function_arn) i;
     invocation_type = ( ! ) r_invocation_type;
   }
    : lambda_action)

let workmail_action_of_xml i =
  let r_topic_arn = ref None in
  let r_organization_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn"; "OrganizationArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "OrganizationArn" ->
          r_organization_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_arn = ( ! ) r_topic_arn;
     organization_arn = Smaws_Lib.Xml.Parse.required "OrganizationArn" (( ! ) r_organization_arn) i;
   }
    : workmail_action)

let s3_key_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let s3_action_of_xml i =
  let r_topic_arn = ref None in
  let r_bucket_name = ref None in
  let r_object_key_prefix = ref None in
  let r_kms_key_arn = ref None in
  let r_iam_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TopicArn"; "BucketName"; "ObjectKeyPrefix"; "KmsKeyArn"; "IamRoleArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "BucketName" ->
          r_bucket_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BucketName"
                 (fun i _ -> s3_bucket_name_of_xml i)
                 ())
      | "ObjectKeyPrefix" ->
          r_object_key_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ObjectKeyPrefix"
                 (fun i _ -> s3_key_prefix_of_xml i)
                 ())
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn"
                 (fun i _ -> iam_role_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_arn = ( ! ) r_topic_arn;
     bucket_name = Smaws_Lib.Xml.Parse.required "BucketName" (( ! ) r_bucket_name) i;
     object_key_prefix = ( ! ) r_object_key_prefix;
     kms_key_arn = ( ! ) r_kms_key_arn;
     iam_role_arn = ( ! ) r_iam_role_arn;
   }
    : s3_action)

let receipt_action_of_xml i =
  let r_s3_action = ref None in
  let r_bounce_action = ref None in
  let r_workmail_action = ref None in
  let r_lambda_action = ref None in
  let r_stop_action = ref None in
  let r_add_header_action = ref None in
  let r_sns_action = ref None in
  let r_connect_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "S3Action";
      "BounceAction";
      "WorkmailAction";
      "LambdaAction";
      "StopAction";
      "AddHeaderAction";
      "SNSAction";
      "ConnectAction";
    ] (fun tag _ ->
      match tag with
      | "S3Action" ->
          r_s3_action :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Action" (fun i _ -> s3_action_of_xml i) ())
      | "BounceAction" ->
          r_bounce_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceAction"
                 (fun i _ -> bounce_action_of_xml i)
                 ())
      | "WorkmailAction" ->
          r_workmail_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WorkmailAction"
                 (fun i _ -> workmail_action_of_xml i)
                 ())
      | "LambdaAction" ->
          r_lambda_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LambdaAction"
                 (fun i _ -> lambda_action_of_xml i)
                 ())
      | "StopAction" ->
          r_stop_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StopAction"
                 (fun i _ -> stop_action_of_xml i)
                 ())
      | "AddHeaderAction" ->
          r_add_header_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddHeaderAction"
                 (fun i _ -> add_header_action_of_xml i)
                 ())
      | "SNSAction" ->
          r_sns_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SNSAction" (fun i _ -> sns_action_of_xml i) ())
      | "ConnectAction" ->
          r_connect_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConnectAction"
                 (fun i _ -> connect_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     s3_action = ( ! ) r_s3_action;
     bounce_action = ( ! ) r_bounce_action;
     workmail_action = ( ! ) r_workmail_action;
     lambda_action = ( ! ) r_lambda_action;
     stop_action = ( ! ) r_stop_action;
     add_header_action = ( ! ) r_add_header_action;
     sns_action = ( ! ) r_sns_action;
     connect_action = ( ! ) r_connect_action;
   }
    : receipt_action)

let receipt_actions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_action_of_xml i) ()

let recipient_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let recipients_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> recipient_of_xml i) ()

let tls_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Require" -> Require | "Optional" -> Optional | _ -> failwith "unknown enum value"
    : tls_policy)

let receipt_rule_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let receipt_rule_of_xml i =
  let r_name = ref None in
  let r_enabled = ref None in
  let r_tls_policy = ref None in
  let r_recipients = ref None in
  let r_actions = ref None in
  let r_scan_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Name"; "Enabled"; "TlsPolicy"; "Recipients"; "Actions"; "ScanEnabled" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "TlsPolicy" ->
          r_tls_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TlsPolicy" (fun i _ -> tls_policy_of_xml i) ())
      | "Recipients" ->
          r_recipients :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recipients"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> recipient_of_xml i) ())
                 ())
      | "Actions" ->
          r_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Actions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_action_of_xml i)
                     ())
                 ())
      | "ScanEnabled" ->
          r_scan_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanEnabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     enabled = ( ! ) r_enabled;
     tls_policy = ( ! ) r_tls_policy;
     recipients = ( ! ) r_recipients;
     actions = ( ! ) r_actions;
     scan_enabled = ( ! ) r_scan_enabled;
   }
    : receipt_rule)

let create_receipt_rule_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_after = ref None in
  let r_rule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "After"; "Rule" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "After" ->
          r_after :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "After"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "Rule" ->
          r_rule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> receipt_rule_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     after = ( ! ) r_after;
     rule = Smaws_Lib.Xml.Parse.required "Rule" (( ! ) r_rule) i;
   }
    : create_receipt_rule_request)

let create_receipt_rule_set_response_of_xml i = ()

let create_receipt_rule_set_request_of_xml i =
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i }
    : create_receipt_rule_set_request)

let invalid_template_exception_of_xml i =
  let r_template_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "message" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = ( ! ) r_template_name; message = ( ! ) r_message }
    : invalid_template_exception)

let create_template_response_of_xml i = ()
let html_part_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let text_part_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_part_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let template_of_xml i =
  let r_template_name = ref None in
  let r_subject_part = ref None in
  let r_text_part = ref None in
  let r_html_part = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TemplateName"; "SubjectPart"; "TextPart"; "HtmlPart" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "SubjectPart" ->
          r_subject_part :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubjectPart"
                 (fun i _ -> subject_part_of_xml i)
                 ())
      | "TextPart" ->
          r_text_part :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TextPart" (fun i _ -> text_part_of_xml i) ())
      | "HtmlPart" ->
          r_html_part :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HtmlPart" (fun i _ -> html_part_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     subject_part = ( ! ) r_subject_part;
     text_part = ( ! ) r_text_part;
     html_part = ( ! ) r_html_part;
   }
    : template)

let create_template_request_of_xml i =
  let r_template = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Template" ] (fun tag _ ->
      match tag with
      | "Template" ->
          r_template :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Template" (fun i _ -> template_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template = Smaws_Lib.Xml.Parse.required "Template" (( ! ) r_template) i }
    : create_template_request)

let custom_mail_from_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Pending" -> Pending
   | "Success" -> Success
   | "Failed" -> Failed
   | "TemporaryFailure" -> TemporaryFailure
   | _ -> failwith "unknown enum value"
    : custom_mail_from_status)

let custom_verification_email_template_of_xml i =
  let r_template_name = ref None in
  let r_from_email_address = ref None in
  let r_template_subject = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_failure_redirection_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateName";
      "FromEmailAddress";
      "TemplateSubject";
      "SuccessRedirectionURL";
      "FailureRedirectionURL";
    ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = ( ! ) r_template_name;
     from_email_address = ( ! ) r_from_email_address;
     template_subject = ( ! ) r_template_subject;
     success_redirection_ur_l = ( ! ) r_success_redirection_ur_l;
     failure_redirection_ur_l = ( ! ) r_failure_redirection_ur_l;
   }
    : custom_verification_email_template)

let custom_verification_email_template_does_not_exist_exception_of_xml i =
  let r_custom_verification_email_template_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CustomVerificationEmailTemplateName"; "message" ]
    (fun tag _ ->
      match tag with
      | "CustomVerificationEmailTemplateName" ->
          r_custom_verification_email_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomVerificationEmailTemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_verification_email_template_name = ( ! ) r_custom_verification_email_template_name;
     message = ( ! ) r_message;
   }
    : custom_verification_email_template_does_not_exist_exception)

let custom_verification_email_templates_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> custom_verification_email_template_of_xml i)
    ()

let delete_configuration_set_response_of_xml i = ()

let delete_configuration_set_request_of_xml i =
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : delete_configuration_set_request)

let event_destination_does_not_exist_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "EventDestinationName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     event_destination_name = ( ! ) r_event_destination_name;
     message = ( ! ) r_message;
   }
    : event_destination_does_not_exist_exception)

let delete_configuration_set_event_destination_response_of_xml i = ()

let delete_configuration_set_event_destination_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "EventDestinationName" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     event_destination_name =
       Smaws_Lib.Xml.Parse.required "EventDestinationName" (( ! ) r_event_destination_name) i;
   }
    : delete_configuration_set_event_destination_request)

let tracking_options_does_not_exist_exception_of_xml i =
  let r_configuration_set_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "message" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_set_name = ( ! ) r_configuration_set_name; message = ( ! ) r_message }
    : tracking_options_does_not_exist_exception)

let delete_configuration_set_tracking_options_response_of_xml i = ()

let delete_configuration_set_tracking_options_request_of_xml i =
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : delete_configuration_set_tracking_options_request)

let delete_custom_verification_email_template_request_of_xml i =
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i }
    : delete_custom_verification_email_template_request)

let delete_identity_response_of_xml i = ()
let identity_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let delete_identity_request_of_xml i =
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i }
    : delete_identity_request)

let delete_identity_policy_response_of_xml i = ()
let policy_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let delete_identity_policy_request_of_xml i =
  let r_identity = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : delete_identity_policy_request)

let delete_receipt_filter_response_of_xml i = ()

let delete_receipt_filter_request_of_xml i =
  let r_filter_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FilterName" ] (fun tag _ ->
      match tag with
      | "FilterName" ->
          r_filter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FilterName"
                 (fun i _ -> receipt_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filter_name = Smaws_Lib.Xml.Parse.required "FilterName" (( ! ) r_filter_name) i }
    : delete_receipt_filter_request)

let delete_receipt_rule_response_of_xml i = ()

let delete_receipt_rule_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "RuleName" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
   }
    : delete_receipt_rule_request)

let delete_receipt_rule_set_response_of_xml i = ()

let delete_receipt_rule_set_request_of_xml i =
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i }
    : delete_receipt_rule_set_request)

let delete_template_response_of_xml i = ()

let delete_template_request_of_xml i =
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i }
    : delete_template_request)

let delete_verified_email_address_request_of_xml i =
  let r_email_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EmailAddress" ] (fun tag _ ->
      match tag with
      | "EmailAddress" ->
          r_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EmailAddress" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ email_address = Smaws_Lib.Xml.Parse.required "EmailAddress" (( ! ) r_email_address) i }
    : delete_verified_email_address_request)

let delivery_options_of_xml i =
  let r_tls_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TlsPolicy" ] (fun tag _ ->
      match tag with
      | "TlsPolicy" ->
          r_tls_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TlsPolicy" (fun i _ -> tls_policy_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tls_policy = ( ! ) r_tls_policy } : delivery_options)

let receipt_rules_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_rule_of_xml i) ()

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let receipt_rule_set_metadata_of_xml i =
  let r_name = ref None in
  let r_created_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "CreatedTimestamp" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "CreatedTimestamp" ->
          r_created_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; created_timestamp = ( ! ) r_created_timestamp }
    : receipt_rule_set_metadata)

let describe_active_receipt_rule_set_response_of_xml i =
  let r_metadata = ref None in
  let r_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metadata"; "Rules" ] (fun tag _ ->
      match tag with
      | "Metadata" ->
          r_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata"
                 (fun i _ -> receipt_rule_set_metadata_of_xml i)
                 ())
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metadata = ( ! ) r_metadata; rules = ( ! ) r_rules }
    : describe_active_receipt_rule_set_response)

let describe_active_receipt_rule_set_request_of_xml i = ()

let last_fresh_start_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let reputation_options_of_xml i =
  let r_sending_enabled = ref None in
  let r_reputation_metrics_enabled = ref None in
  let r_last_fresh_start = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SendingEnabled"; "ReputationMetricsEnabled"; "LastFreshStart" ] (fun tag _ ->
      match tag with
      | "SendingEnabled" ->
          r_sending_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SendingEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "ReputationMetricsEnabled" ->
          r_reputation_metrics_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReputationMetricsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "LastFreshStart" ->
          r_last_fresh_start :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastFreshStart"
                 (fun i _ -> last_fresh_start_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sending_enabled = ( ! ) r_sending_enabled;
     reputation_metrics_enabled = ( ! ) r_reputation_metrics_enabled;
     last_fresh_start = ( ! ) r_last_fresh_start;
   }
    : reputation_options)

let event_destinations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_destination_of_xml i) ()

let describe_configuration_set_response_of_xml i =
  let r_configuration_set = ref None in
  let r_event_destinations = ref None in
  let r_tracking_options = ref None in
  let r_delivery_options = ref None in
  let r_reputation_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConfigurationSet";
      "EventDestinations";
      "TrackingOptions";
      "DeliveryOptions";
      "ReputationOptions";
    ] (fun tag _ ->
      match tag with
      | "ConfigurationSet" ->
          r_configuration_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSet"
                 (fun i _ -> configuration_set_of_xml i)
                 ())
      | "EventDestinations" ->
          r_event_destinations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> event_destination_of_xml i)
                     ())
                 ())
      | "TrackingOptions" ->
          r_tracking_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackingOptions"
                 (fun i _ -> tracking_options_of_xml i)
                 ())
      | "DeliveryOptions" ->
          r_delivery_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryOptions"
                 (fun i _ -> delivery_options_of_xml i)
                 ())
      | "ReputationOptions" ->
          r_reputation_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReputationOptions"
                 (fun i _ -> reputation_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set = ( ! ) r_configuration_set;
     event_destinations = ( ! ) r_event_destinations;
     tracking_options = ( ! ) r_tracking_options;
     delivery_options = ( ! ) r_delivery_options;
     reputation_options = ( ! ) r_reputation_options;
   }
    : describe_configuration_set_response)

let describe_configuration_set_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_configuration_set_attribute_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "ConfigurationSetAttributeNames" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "ConfigurationSetAttributeNames" ->
          r_configuration_set_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetAttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_set_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     configuration_set_attribute_names = ( ! ) r_configuration_set_attribute_names;
   }
    : describe_configuration_set_request)

let describe_receipt_rule_response_of_xml i =
  let r_rule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rule" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> receipt_rule_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule = ( ! ) r_rule } : describe_receipt_rule_response)

let describe_receipt_rule_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_rule_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "RuleName" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
   }
    : describe_receipt_rule_request)

let describe_receipt_rule_set_response_of_xml i =
  let r_metadata = ref None in
  let r_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Metadata"; "Rules" ] (fun tag _ ->
      match tag with
      | "Metadata" ->
          r_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata"
                 (fun i _ -> receipt_rule_set_metadata_of_xml i)
                 ())
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ metadata = ( ! ) r_metadata; rules = ( ! ) r_rules } : describe_receipt_rule_set_response)

let describe_receipt_rule_set_request_of_xml i =
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i }
    : describe_receipt_rule_set_request)

let verification_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let verification_token_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> verification_token_of_xml i) ()

let verification_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Pending" -> Pending
   | "Success" -> Success
   | "Failed" -> Failed
   | "TemporaryFailure" -> TemporaryFailure
   | "NotStarted" -> NotStarted
   | _ -> failwith "unknown enum value"
    : verification_status)

let identity_dkim_attributes_of_xml i =
  let r_dkim_enabled = ref None in
  let r_dkim_verification_status = ref None in
  let r_dkim_tokens = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DkimEnabled"; "DkimVerificationStatus"; "DkimTokens" ] (fun tag _ ->
      match tag with
      | "DkimEnabled" ->
          r_dkim_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimEnabled" (fun i _ -> enabled_of_xml i) ())
      | "DkimVerificationStatus" ->
          r_dkim_verification_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimVerificationStatus"
                 (fun i _ -> verification_status_of_xml i)
                 ())
      | "DkimTokens" ->
          r_dkim_tokens :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimTokens"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> verification_token_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dkim_enabled = Smaws_Lib.Xml.Parse.required "DkimEnabled" (( ! ) r_dkim_enabled) i;
     dkim_verification_status =
       Smaws_Lib.Xml.Parse.required "DkimVerificationStatus" (( ! ) r_dkim_verification_status) i;
     dkim_tokens = ( ! ) r_dkim_tokens;
   }
    : identity_dkim_attributes)

let dkim_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> identity_dkim_attributes_of_xml i)
          ()
      in
      (k, v))
    ()

let domain_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let explanation_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_account_sending_enabled_response_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : get_account_sending_enabled_response)

let get_custom_verification_email_template_response_of_xml i =
  let r_template_name = ref None in
  let r_from_email_address = ref None in
  let r_template_subject = ref None in
  let r_template_content = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_failure_redirection_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateName";
      "FromEmailAddress";
      "TemplateSubject";
      "TemplateContent";
      "SuccessRedirectionURL";
      "FailureRedirectionURL";
    ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "TemplateContent" ->
          r_template_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateContent"
                 (fun i _ -> template_content_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = ( ! ) r_template_name;
     from_email_address = ( ! ) r_from_email_address;
     template_subject = ( ! ) r_template_subject;
     template_content = ( ! ) r_template_content;
     success_redirection_ur_l = ( ! ) r_success_redirection_ur_l;
     failure_redirection_ur_l = ( ! ) r_failure_redirection_ur_l;
   }
    : get_custom_verification_email_template_response)

let get_custom_verification_email_template_request_of_xml i =
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i }
    : get_custom_verification_email_template_request)

let get_identity_dkim_attributes_response_of_xml i =
  let r_dkim_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DkimAttributes" ] (fun tag _ ->
      match tag with
      | "DkimAttributes" ->
          r_dkim_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> identity_dkim_attributes_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dkim_attributes = Smaws_Lib.Xml.Parse.required "DkimAttributes" (( ! ) r_dkim_attributes) i }
    : get_identity_dkim_attributes_response)

let identity_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ()

let get_identity_dkim_attributes_request_of_xml i =
  let r_identities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identities" ] (fun tag _ ->
      match tag with
      | "Identities" ->
          r_identities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identities = Smaws_Lib.Xml.Parse.required "Identities" (( ! ) r_identities) i }
    : get_identity_dkim_attributes_request)

let mail_from_domain_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let identity_mail_from_domain_attributes_of_xml i =
  let r_mail_from_domain = ref None in
  let r_mail_from_domain_status = ref None in
  let r_behavior_on_mx_failure = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MailFromDomain"; "MailFromDomainStatus"; "BehaviorOnMXFailure" ] (fun tag _ ->
      match tag with
      | "MailFromDomain" ->
          r_mail_from_domain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomain"
                 (fun i _ -> mail_from_domain_name_of_xml i)
                 ())
      | "MailFromDomainStatus" ->
          r_mail_from_domain_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomainStatus"
                 (fun i _ -> custom_mail_from_status_of_xml i)
                 ())
      | "BehaviorOnMXFailure" ->
          r_behavior_on_mx_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BehaviorOnMXFailure"
                 (fun i _ -> behavior_on_mx_failure_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mail_from_domain = Smaws_Lib.Xml.Parse.required "MailFromDomain" (( ! ) r_mail_from_domain) i;
     mail_from_domain_status =
       Smaws_Lib.Xml.Parse.required "MailFromDomainStatus" (( ! ) r_mail_from_domain_status) i;
     behavior_on_mx_failure =
       Smaws_Lib.Xml.Parse.required "BehaviorOnMXFailure" (( ! ) r_behavior_on_mx_failure) i;
   }
    : identity_mail_from_domain_attributes)

let mail_from_domain_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> identity_mail_from_domain_attributes_of_xml i)
          ()
      in
      (k, v))
    ()

let get_identity_mail_from_domain_attributes_response_of_xml i =
  let r_mail_from_domain_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MailFromDomainAttributes" ] (fun tag _ ->
      match tag with
      | "MailFromDomainAttributes" ->
          r_mail_from_domain_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomainAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> identity_mail_from_domain_attributes_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mail_from_domain_attributes =
       Smaws_Lib.Xml.Parse.required "MailFromDomainAttributes"
         (( ! ) r_mail_from_domain_attributes)
         i;
   }
    : get_identity_mail_from_domain_attributes_response)

let get_identity_mail_from_domain_attributes_request_of_xml i =
  let r_identities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identities" ] (fun tag _ ->
      match tag with
      | "Identities" ->
          r_identities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identities = Smaws_Lib.Xml.Parse.required "Identities" (( ! ) r_identities) i }
    : get_identity_mail_from_domain_attributes_request)

let notification_topic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let identity_notification_attributes_of_xml i =
  let r_bounce_topic = ref None in
  let r_complaint_topic = ref None in
  let r_delivery_topic = ref None in
  let r_forwarding_enabled = ref None in
  let r_headers_in_bounce_notifications_enabled = ref None in
  let r_headers_in_complaint_notifications_enabled = ref None in
  let r_headers_in_delivery_notifications_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "BounceTopic";
      "ComplaintTopic";
      "DeliveryTopic";
      "ForwardingEnabled";
      "HeadersInBounceNotificationsEnabled";
      "HeadersInComplaintNotificationsEnabled";
      "HeadersInDeliveryNotificationsEnabled";
    ] (fun tag _ ->
      match tag with
      | "BounceTopic" ->
          r_bounce_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | "ComplaintTopic" ->
          r_complaint_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComplaintTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | "DeliveryTopic" ->
          r_delivery_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | "ForwardingEnabled" ->
          r_forwarding_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForwardingEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "HeadersInBounceNotificationsEnabled" ->
          r_headers_in_bounce_notifications_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeadersInBounceNotificationsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "HeadersInComplaintNotificationsEnabled" ->
          r_headers_in_complaint_notifications_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeadersInComplaintNotificationsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "HeadersInDeliveryNotificationsEnabled" ->
          r_headers_in_delivery_notifications_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeadersInDeliveryNotificationsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     bounce_topic = Smaws_Lib.Xml.Parse.required "BounceTopic" (( ! ) r_bounce_topic) i;
     complaint_topic = Smaws_Lib.Xml.Parse.required "ComplaintTopic" (( ! ) r_complaint_topic) i;
     delivery_topic = Smaws_Lib.Xml.Parse.required "DeliveryTopic" (( ! ) r_delivery_topic) i;
     forwarding_enabled =
       Smaws_Lib.Xml.Parse.required "ForwardingEnabled" (( ! ) r_forwarding_enabled) i;
     headers_in_bounce_notifications_enabled = ( ! ) r_headers_in_bounce_notifications_enabled;
     headers_in_complaint_notifications_enabled = ( ! ) r_headers_in_complaint_notifications_enabled;
     headers_in_delivery_notifications_enabled = ( ! ) r_headers_in_delivery_notifications_enabled;
   }
    : identity_notification_attributes)

let notification_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> identity_notification_attributes_of_xml i)
          ()
      in
      (k, v))
    ()

let get_identity_notification_attributes_response_of_xml i =
  let r_notification_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NotificationAttributes" ] (fun tag _ ->
      match tag with
      | "NotificationAttributes" ->
          r_notification_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> identity_notification_attributes_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     notification_attributes =
       Smaws_Lib.Xml.Parse.required "NotificationAttributes" (( ! ) r_notification_attributes) i;
   }
    : get_identity_notification_attributes_response)

let get_identity_notification_attributes_request_of_xml i =
  let r_identities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identities" ] (fun tag _ ->
      match tag with
      | "Identities" ->
          r_identities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identities = Smaws_Lib.Xml.Parse.required "Identities" (( ! ) r_identities) i }
    : get_identity_notification_attributes_request)

let policy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> policy_name_of_xml i) () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> policy_of_xml i) () in
      (k, v))
    ()

let get_identity_policies_response_of_xml i =
  let r_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policies" ] (fun tag _ ->
      match tag with
      | "Policies" ->
          r_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> policy_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> policy_of_xml i) ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policies = Smaws_Lib.Xml.Parse.required "Policies" (( ! ) r_policies) i }
    : get_identity_policies_response)

let policy_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_name_of_xml i) ()

let get_identity_policies_request_of_xml i =
  let r_identity = ref None in
  let r_policy_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "PolicyNames" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
   }
    : get_identity_policies_request)

let identity_verification_attributes_of_xml i =
  let r_verification_status = ref None in
  let r_verification_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VerificationStatus"; "VerificationToken" ]
    (fun tag _ ->
      match tag with
      | "VerificationStatus" ->
          r_verification_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerificationStatus"
                 (fun i _ -> verification_status_of_xml i)
                 ())
      | "VerificationToken" ->
          r_verification_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerificationToken"
                 (fun i _ -> verification_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     verification_status =
       Smaws_Lib.Xml.Parse.required "VerificationStatus" (( ! ) r_verification_status) i;
     verification_token = ( ! ) r_verification_token;
   }
    : identity_verification_attributes)

let verification_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> identity_verification_attributes_of_xml i)
          ()
      in
      (k, v))
    ()

let get_identity_verification_attributes_response_of_xml i =
  let r_verification_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VerificationAttributes" ] (fun tag _ ->
      match tag with
      | "VerificationAttributes" ->
          r_verification_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerificationAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> identity_of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> identity_verification_attributes_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     verification_attributes =
       Smaws_Lib.Xml.Parse.required "VerificationAttributes" (( ! ) r_verification_attributes) i;
   }
    : get_identity_verification_attributes_response)

let get_identity_verification_attributes_request_of_xml i =
  let r_identities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identities" ] (fun tag _ ->
      match tag with
      | "Identities" ->
          r_identities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identities = Smaws_Lib.Xml.Parse.required "Identities" (( ! ) r_identities) i }
    : get_identity_verification_attributes_request)

let sent_last24_hours_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_send_rate_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max24_hour_send_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_send_quota_response_of_xml i =
  let r_max24_hour_send = ref None in
  let r_max_send_rate = ref None in
  let r_sent_last24_hours = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max24HourSend"; "MaxSendRate"; "SentLast24Hours" ]
    (fun tag _ ->
      match tag with
      | "Max24HourSend" ->
          r_max24_hour_send :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max24HourSend"
                 (fun i _ -> max24_hour_send_of_xml i)
                 ())
      | "MaxSendRate" ->
          r_max_send_rate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSendRate"
                 (fun i _ -> max_send_rate_of_xml i)
                 ())
      | "SentLast24Hours" ->
          r_sent_last24_hours :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SentLast24Hours"
                 (fun i _ -> sent_last24_hours_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max24_hour_send = ( ! ) r_max24_hour_send;
     max_send_rate = ( ! ) r_max_send_rate;
     sent_last24_hours = ( ! ) r_sent_last24_hours;
   }
    : get_send_quota_response)

let send_data_point_of_xml i =
  let r_timestamp = ref None in
  let r_delivery_attempts = ref None in
  let r_bounces = ref None in
  let r_complaints = ref None in
  let r_rejects = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Timestamp"; "DeliveryAttempts"; "Bounces"; "Complaints"; "Rejects" ] (fun tag _ ->
      match tag with
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "DeliveryAttempts" ->
          r_delivery_attempts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryAttempts"
                 (fun i _ -> counter_of_xml i)
                 ())
      | "Bounces" ->
          r_bounces :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Bounces" (fun i _ -> counter_of_xml i) ())
      | "Complaints" ->
          r_complaints :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Complaints" (fun i _ -> counter_of_xml i) ())
      | "Rejects" ->
          r_rejects :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rejects" (fun i _ -> counter_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = ( ! ) r_timestamp;
     delivery_attempts = ( ! ) r_delivery_attempts;
     bounces = ( ! ) r_bounces;
     complaints = ( ! ) r_complaints;
     rejects = ( ! ) r_rejects;
   }
    : send_data_point)

let send_data_point_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> send_data_point_of_xml i) ()

let get_send_statistics_response_of_xml i =
  let r_send_data_points = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SendDataPoints" ] (fun tag _ ->
      match tag with
      | "SendDataPoints" ->
          r_send_data_points :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SendDataPoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> send_data_point_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ send_data_points = ( ! ) r_send_data_points } : get_send_statistics_response)

let template_does_not_exist_exception_of_xml i =
  let r_template_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "message" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = ( ! ) r_template_name; message = ( ! ) r_message }
    : template_does_not_exist_exception)

let get_template_response_of_xml i =
  let r_template = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Template" ] (fun tag _ ->
      match tag with
      | "Template" ->
          r_template :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Template" (fun i _ -> template_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template = ( ! ) r_template } : get_template_response)

let get_template_request_of_xml i =
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i }
    : get_template_request)

let identity_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "EmailAddress" -> EmailAddress
   | "Domain" -> Domain
   | _ -> failwith "unknown enum value"
    : identity_type)

let invalid_delivery_options_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_delivery_options_exception)

let invalid_policy_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_policy_exception)

let invalid_rendering_parameter_exception_of_xml i =
  let r_template_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "message" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = ( ! ) r_template_name; message = ( ! ) r_message }
    : invalid_rendering_parameter_exception)

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_configuration_sets_response_of_xml i =
  let r_configuration_sets = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSets"; "NextToken" ] (fun tag _ ->
      match tag with
      | "ConfigurationSets" ->
          r_configuration_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_set_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_sets = ( ! ) r_configuration_sets; next_token = ( ! ) r_next_token }
    : list_configuration_sets_response)

let max_items_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_configuration_sets_request_of_xml i =
  let r_next_token = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems" (fun i _ -> max_items_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_items = ( ! ) r_max_items }
    : list_configuration_sets_request)

let list_custom_verification_email_templates_response_of_xml i =
  let r_custom_verification_email_templates = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CustomVerificationEmailTemplates"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "CustomVerificationEmailTemplates" ->
          r_custom_verification_email_templates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomVerificationEmailTemplates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> custom_verification_email_template_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_verification_email_templates = ( ! ) r_custom_verification_email_templates;
     next_token = ( ! ) r_next_token;
   }
    : list_custom_verification_email_templates_response)

let max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_custom_verification_email_templates_request_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_results = ( ! ) r_max_results }
    : list_custom_verification_email_templates_request)

let list_identities_response_of_xml i =
  let r_identities = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identities"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Identities" ->
          r_identities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identities = Smaws_Lib.Xml.Parse.required "Identities" (( ! ) r_identities) i;
     next_token = ( ! ) r_next_token;
   }
    : list_identities_response)

let list_identities_request_of_xml i =
  let r_identity_type = ref None in
  let r_next_token = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IdentityType"; "NextToken"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "IdentityType" ->
          r_identity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityType"
                 (fun i _ -> identity_type_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems" (fun i _ -> max_items_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity_type = ( ! ) r_identity_type;
     next_token = ( ! ) r_next_token;
     max_items = ( ! ) r_max_items;
   }
    : list_identities_request)

let list_identity_policies_response_of_xml i =
  let r_policy_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames" ] (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i }
    : list_identity_policies_response)

let list_identity_policies_request_of_xml i =
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i }
    : list_identity_policies_request)

let receipt_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_filter_of_xml i) ()

let list_receipt_filters_response_of_xml i =
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filters" ] (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filters = ( ! ) r_filters } : list_receipt_filters_response)

let list_receipt_filters_request_of_xml i = ()

let receipt_rule_sets_lists_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_rule_set_metadata_of_xml i) ()

let list_receipt_rule_sets_response_of_xml i =
  let r_rule_sets = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSets"; "NextToken" ] (fun tag _ ->
      match tag with
      | "RuleSets" ->
          r_rule_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_set_metadata_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_sets = ( ! ) r_rule_sets; next_token = ( ! ) r_next_token }
    : list_receipt_rule_sets_response)

let list_receipt_rule_sets_request_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : list_receipt_rule_sets_request)

let template_metadata_of_xml i =
  let r_name = ref None in
  let r_created_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "CreatedTimestamp" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> template_name_of_xml i) ())
      | "CreatedTimestamp" ->
          r_created_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; created_timestamp = ( ! ) r_created_timestamp } : template_metadata)

let template_metadata_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_metadata_of_xml i) ()

let list_templates_response_of_xml i =
  let r_templates_metadata = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplatesMetadata"; "NextToken" ] (fun tag _ ->
      match tag with
      | "TemplatesMetadata" ->
          r_templates_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplatesMetadata"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_metadata_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ templates_metadata = ( ! ) r_templates_metadata; next_token = ( ! ) r_next_token }
    : list_templates_response)

let list_templates_request_of_xml i =
  let r_next_token = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems" (fun i _ -> max_items_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_items = ( ! ) r_max_items } : list_templates_request)

let list_verified_email_addresses_response_of_xml i =
  let r_verified_email_addresses = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VerifiedEmailAddresses" ] (fun tag _ ->
      match tag with
      | "VerifiedEmailAddresses" ->
          r_verified_email_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerifiedEmailAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ verified_email_addresses = ( ! ) r_verified_email_addresses }
    : list_verified_email_addresses_response)

let mail_from_domain_not_verified_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : mail_from_domain_not_verified_exception)

let message_of_xml i =
  let r_subject = ref None in
  let r_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Subject"; "Body" ] (fun tag _ ->
      match tag with
      | "Subject" ->
          r_subject :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Subject" (fun i _ -> content_of_xml i) ())
      | "Body" ->
          r_body := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Body" (fun i _ -> body_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subject = Smaws_Lib.Xml.Parse.required "Subject" (( ! ) r_subject) i;
     body = Smaws_Lib.Xml.Parse.required "Body" (( ! ) r_body) i;
   }
    : message)

let reporting_mta_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let message_dsn_of_xml i =
  let r_reporting_mta = ref None in
  let r_arrival_date = ref None in
  let r_extension_fields = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReportingMta"; "ArrivalDate"; "ExtensionFields" ]
    (fun tag _ ->
      match tag with
      | "ReportingMta" ->
          r_reporting_mta :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReportingMta"
                 (fun i _ -> reporting_mta_of_xml i)
                 ())
      | "ArrivalDate" ->
          r_arrival_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ArrivalDate"
                 (fun i _ -> arrival_date_of_xml i)
                 ())
      | "ExtensionFields" ->
          r_extension_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtensionFields"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> extension_field_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reporting_mta = Smaws_Lib.Xml.Parse.required "ReportingMta" (( ! ) r_reporting_mta) i;
     arrival_date = ( ! ) r_arrival_date;
     extension_fields = ( ! ) r_extension_fields;
   }
    : message_dsn)

let message_rejected_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : message_rejected)

let missing_rendering_attribute_exception_of_xml i =
  let r_template_name = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "message" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = ( ! ) r_template_name; message = ( ! ) r_message }
    : missing_rendering_attribute_exception)

let notification_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Bounce" -> Bounce
   | "Complaint" -> Complaint
   | "Delivery" -> Delivery
   | _ -> failwith "unknown enum value"
    : notification_type)

let production_access_not_granted_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : production_access_not_granted_exception)

let put_configuration_set_delivery_options_response_of_xml i = ()

let put_configuration_set_delivery_options_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_delivery_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "DeliveryOptions" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "DeliveryOptions" ->
          r_delivery_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryOptions"
                 (fun i _ -> delivery_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     delivery_options = ( ! ) r_delivery_options;
   }
    : put_configuration_set_delivery_options_request)

let put_identity_policy_response_of_xml i = ()

let put_identity_policy_request_of_xml i =
  let r_identity = ref None in
  let r_policy_name = ref None in
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "PolicyName"; "Policy" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> policy_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy = Smaws_Lib.Xml.Parse.required "Policy" (( ! ) r_policy) i;
   }
    : put_identity_policy_request)

let raw_message_data_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let raw_message_of_xml i =
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Data" ] (fun tag _ ->
      match tag with
      | "Data" ->
          r_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Data" (fun i _ -> raw_message_data_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = Smaws_Lib.Xml.Parse.required "Data" (( ! ) r_data) i } : raw_message)

let receipt_rule_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_rule_name_of_xml i) ()

let rendered_template_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let reorder_receipt_rule_set_response_of_xml i = ()

let reorder_receipt_rule_set_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_rule_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "RuleNames" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "RuleNames" ->
          r_rule_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     rule_names = Smaws_Lib.Xml.Parse.required "RuleNames" (( ! ) r_rule_names) i;
   }
    : reorder_receipt_rule_set_request)

let send_bounce_response_of_xml i =
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MessageId" ] (fun tag _ ->
      match tag with
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message_id = ( ! ) r_message_id } : send_bounce_response)

let send_bounce_request_of_xml i =
  let r_original_message_id = ref None in
  let r_bounce_sender = ref None in
  let r_explanation = ref None in
  let r_message_dsn = ref None in
  let r_bounced_recipient_info_list = ref None in
  let r_bounce_sender_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OriginalMessageId";
      "BounceSender";
      "Explanation";
      "MessageDsn";
      "BouncedRecipientInfoList";
      "BounceSenderArn";
    ] (fun tag _ ->
      match tag with
      | "OriginalMessageId" ->
          r_original_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalMessageId"
                 (fun i _ -> message_id_of_xml i)
                 ())
      | "BounceSender" ->
          r_bounce_sender :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceSender" (fun i _ -> address_of_xml i) ())
      | "Explanation" ->
          r_explanation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Explanation"
                 (fun i _ -> explanation_of_xml i)
                 ())
      | "MessageDsn" ->
          r_message_dsn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageDsn"
                 (fun i _ -> message_dsn_of_xml i)
                 ())
      | "BouncedRecipientInfoList" ->
          r_bounced_recipient_info_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BouncedRecipientInfoList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> bounced_recipient_info_of_xml i)
                     ())
                 ())
      | "BounceSenderArn" ->
          r_bounce_sender_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceSenderArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     original_message_id =
       Smaws_Lib.Xml.Parse.required "OriginalMessageId" (( ! ) r_original_message_id) i;
     bounce_sender = Smaws_Lib.Xml.Parse.required "BounceSender" (( ! ) r_bounce_sender) i;
     explanation = ( ! ) r_explanation;
     message_dsn = ( ! ) r_message_dsn;
     bounced_recipient_info_list =
       Smaws_Lib.Xml.Parse.required "BouncedRecipientInfoList"
         (( ! ) r_bounced_recipient_info_list)
         i;
     bounce_sender_arn = ( ! ) r_bounce_sender_arn;
   }
    : send_bounce_request)

let send_bulk_templated_email_response_of_xml i =
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> bulk_email_destination_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i }
    : send_bulk_templated_email_response)

let send_bulk_templated_email_request_of_xml i =
  let r_source = ref None in
  let r_source_arn = ref None in
  let r_reply_to_addresses = ref None in
  let r_return_path = ref None in
  let r_return_path_arn = ref None in
  let r_configuration_set_name = ref None in
  let r_default_tags = ref None in
  let r_template = ref None in
  let r_template_arn = ref None in
  let r_default_template_data = ref None in
  let r_destinations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Source";
      "SourceArn";
      "ReplyToAddresses";
      "ReturnPath";
      "ReturnPathArn";
      "ConfigurationSetName";
      "DefaultTags";
      "Template";
      "TemplateArn";
      "DefaultTemplateData";
      "Destinations";
    ] (fun tag _ ->
      match tag with
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReplyToAddresses" ->
          r_reply_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplyToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "ReturnPath" ->
          r_return_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPath" (fun i _ -> address_of_xml i) ())
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "DefaultTags" ->
          r_default_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultTags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_tag_of_xml i)
                     ())
                 ())
      | "Template" ->
          r_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Template"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "TemplateArn" ->
          r_template_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "DefaultTemplateData" ->
          r_default_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultTemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | "Destinations" ->
          r_destinations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destinations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> bulk_email_destination_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
     source_arn = ( ! ) r_source_arn;
     reply_to_addresses = ( ! ) r_reply_to_addresses;
     return_path = ( ! ) r_return_path;
     return_path_arn = ( ! ) r_return_path_arn;
     configuration_set_name = ( ! ) r_configuration_set_name;
     default_tags = ( ! ) r_default_tags;
     template = Smaws_Lib.Xml.Parse.required "Template" (( ! ) r_template) i;
     template_arn = ( ! ) r_template_arn;
     default_template_data =
       Smaws_Lib.Xml.Parse.required "DefaultTemplateData" (( ! ) r_default_template_data) i;
     destinations = Smaws_Lib.Xml.Parse.required "Destinations" (( ! ) r_destinations) i;
   }
    : send_bulk_templated_email_request)

let send_custom_verification_email_response_of_xml i =
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MessageId" ] (fun tag _ ->
      match tag with
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message_id = ( ! ) r_message_id } : send_custom_verification_email_response)

let send_custom_verification_email_request_of_xml i =
  let r_email_address = ref None in
  let r_template_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EmailAddress"; "TemplateName"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "EmailAddress" ->
          r_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EmailAddress" (fun i _ -> address_of_xml i) ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     email_address = Smaws_Lib.Xml.Parse.required "EmailAddress" (( ! ) r_email_address) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : send_custom_verification_email_request)

let send_email_response_of_xml i =
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MessageId" ] (fun tag _ ->
      match tag with
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message_id = Smaws_Lib.Xml.Parse.required "MessageId" (( ! ) r_message_id) i }
    : send_email_response)

let send_email_request_of_xml i =
  let r_source = ref None in
  let r_destination = ref None in
  let r_message = ref None in
  let r_reply_to_addresses = ref None in
  let r_return_path = ref None in
  let r_source_arn = ref None in
  let r_return_path_arn = ref None in
  let r_tags = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Source";
      "Destination";
      "Message";
      "ReplyToAddresses";
      "ReturnPath";
      "SourceArn";
      "ReturnPathArn";
      "Tags";
      "ConfigurationSetName";
    ] (fun tag _ ->
      match tag with
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> destination_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | "ReplyToAddresses" ->
          r_reply_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplyToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "ReturnPath" ->
          r_return_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPath" (fun i _ -> address_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_tag_of_xml i)
                     ())
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     reply_to_addresses = ( ! ) r_reply_to_addresses;
     return_path = ( ! ) r_return_path;
     source_arn = ( ! ) r_source_arn;
     return_path_arn = ( ! ) r_return_path_arn;
     tags = ( ! ) r_tags;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : send_email_request)

let send_raw_email_response_of_xml i =
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MessageId" ] (fun tag _ ->
      match tag with
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message_id = Smaws_Lib.Xml.Parse.required "MessageId" (( ! ) r_message_id) i }
    : send_raw_email_response)

let send_raw_email_request_of_xml i =
  let r_source = ref None in
  let r_destinations = ref None in
  let r_raw_message = ref None in
  let r_from_arn = ref None in
  let r_source_arn = ref None in
  let r_return_path_arn = ref None in
  let r_tags = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Source";
      "Destinations";
      "RawMessage";
      "FromArn";
      "SourceArn";
      "ReturnPathArn";
      "Tags";
      "ConfigurationSetName";
    ] (fun tag _ ->
      match tag with
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | "Destinations" ->
          r_destinations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destinations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "RawMessage" ->
          r_raw_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RawMessage"
                 (fun i _ -> raw_message_of_xml i)
                 ())
      | "FromArn" ->
          r_from_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_tag_of_xml i)
                     ())
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source = ( ! ) r_source;
     destinations = ( ! ) r_destinations;
     raw_message = Smaws_Lib.Xml.Parse.required "RawMessage" (( ! ) r_raw_message) i;
     from_arn = ( ! ) r_from_arn;
     source_arn = ( ! ) r_source_arn;
     return_path_arn = ( ! ) r_return_path_arn;
     tags = ( ! ) r_tags;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : send_raw_email_request)

let send_templated_email_response_of_xml i =
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MessageId" ] (fun tag _ ->
      match tag with
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message_id = Smaws_Lib.Xml.Parse.required "MessageId" (( ! ) r_message_id) i }
    : send_templated_email_response)

let send_templated_email_request_of_xml i =
  let r_source = ref None in
  let r_destination = ref None in
  let r_reply_to_addresses = ref None in
  let r_return_path = ref None in
  let r_source_arn = ref None in
  let r_return_path_arn = ref None in
  let r_tags = ref None in
  let r_configuration_set_name = ref None in
  let r_template = ref None in
  let r_template_arn = ref None in
  let r_template_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Source";
      "Destination";
      "ReplyToAddresses";
      "ReturnPath";
      "SourceArn";
      "ReturnPathArn";
      "Tags";
      "ConfigurationSetName";
      "Template";
      "TemplateArn";
      "TemplateData";
    ] (fun tag _ ->
      match tag with
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> destination_of_xml i)
                 ())
      | "ReplyToAddresses" ->
          r_reply_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplyToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "ReturnPath" ->
          r_return_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPath" (fun i _ -> address_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> message_tag_of_xml i)
                     ())
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "Template" ->
          r_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Template"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "TemplateArn" ->
          r_template_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "TemplateData" ->
          r_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
     reply_to_addresses = ( ! ) r_reply_to_addresses;
     return_path = ( ! ) r_return_path;
     source_arn = ( ! ) r_source_arn;
     return_path_arn = ( ! ) r_return_path_arn;
     tags = ( ! ) r_tags;
     configuration_set_name = ( ! ) r_configuration_set_name;
     template = Smaws_Lib.Xml.Parse.required "Template" (( ! ) r_template) i;
     template_arn = ( ! ) r_template_arn;
     template_data = Smaws_Lib.Xml.Parse.required "TemplateData" (( ! ) r_template_data) i;
   }
    : send_templated_email_request)

let set_active_receipt_rule_set_response_of_xml i = ()

let set_active_receipt_rule_set_request_of_xml i =
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_set_name = ( ! ) r_rule_set_name } : set_active_receipt_rule_set_request)

let set_identity_dkim_enabled_response_of_xml i = ()

let set_identity_dkim_enabled_request_of_xml i =
  let r_identity = ref None in
  let r_dkim_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "DkimEnabled" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "DkimEnabled" ->
          r_dkim_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimEnabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     dkim_enabled = Smaws_Lib.Xml.Parse.required "DkimEnabled" (( ! ) r_dkim_enabled) i;
   }
    : set_identity_dkim_enabled_request)

let set_identity_feedback_forwarding_enabled_response_of_xml i = ()

let set_identity_feedback_forwarding_enabled_request_of_xml i =
  let r_identity = ref None in
  let r_forwarding_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "ForwardingEnabled" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "ForwardingEnabled" ->
          r_forwarding_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForwardingEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     forwarding_enabled =
       Smaws_Lib.Xml.Parse.required "ForwardingEnabled" (( ! ) r_forwarding_enabled) i;
   }
    : set_identity_feedback_forwarding_enabled_request)

let set_identity_headers_in_notifications_enabled_response_of_xml i = ()

let set_identity_headers_in_notifications_enabled_request_of_xml i =
  let r_identity = ref None in
  let r_notification_type = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "NotificationType"; "Enabled" ]
    (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "NotificationType" ->
          r_notification_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationType"
                 (fun i _ -> notification_type_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     notification_type =
       Smaws_Lib.Xml.Parse.required "NotificationType" (( ! ) r_notification_type) i;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : set_identity_headers_in_notifications_enabled_request)

let set_identity_mail_from_domain_response_of_xml i = ()

let set_identity_mail_from_domain_request_of_xml i =
  let r_identity = ref None in
  let r_mail_from_domain = ref None in
  let r_behavior_on_mx_failure = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Identity"; "MailFromDomain"; "BehaviorOnMXFailure" ] (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "MailFromDomain" ->
          r_mail_from_domain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomain"
                 (fun i _ -> mail_from_domain_name_of_xml i)
                 ())
      | "BehaviorOnMXFailure" ->
          r_behavior_on_mx_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BehaviorOnMXFailure"
                 (fun i _ -> behavior_on_mx_failure_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     mail_from_domain = ( ! ) r_mail_from_domain;
     behavior_on_mx_failure = ( ! ) r_behavior_on_mx_failure;
   }
    : set_identity_mail_from_domain_request)

let set_identity_notification_topic_response_of_xml i = ()

let set_identity_notification_topic_request_of_xml i =
  let r_identity = ref None in
  let r_notification_type = ref None in
  let r_sns_topic = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identity"; "NotificationType"; "SnsTopic" ]
    (fun tag _ ->
      match tag with
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | "NotificationType" ->
          r_notification_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationType"
                 (fun i _ -> notification_type_of_xml i)
                 ())
      | "SnsTopic" ->
          r_sns_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
     notification_type =
       Smaws_Lib.Xml.Parse.required "NotificationType" (( ! ) r_notification_type) i;
     sns_topic = ( ! ) r_sns_topic;
   }
    : set_identity_notification_topic_request)

let set_receipt_rule_position_response_of_xml i = ()

let set_receipt_rule_position_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_rule_name = ref None in
  let r_after = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "RuleName"; "After" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "After" ->
          r_after :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "After"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     after = ( ! ) r_after;
   }
    : set_receipt_rule_position_request)

let verify_email_identity_response_of_xml i = ()

let verify_email_identity_request_of_xml i =
  let r_email_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EmailAddress" ] (fun tag _ ->
      match tag with
      | "EmailAddress" ->
          r_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EmailAddress" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ email_address = Smaws_Lib.Xml.Parse.required "EmailAddress" (( ! ) r_email_address) i }
    : verify_email_identity_request)

let verify_email_address_request_of_xml i =
  let r_email_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EmailAddress" ] (fun tag _ ->
      match tag with
      | "EmailAddress" ->
          r_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EmailAddress" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ email_address = Smaws_Lib.Xml.Parse.required "EmailAddress" (( ! ) r_email_address) i }
    : verify_email_address_request)

let verify_domain_identity_response_of_xml i =
  let r_verification_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VerificationToken" ] (fun tag _ ->
      match tag with
      | "VerificationToken" ->
          r_verification_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerificationToken"
                 (fun i _ -> verification_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     verification_token =
       Smaws_Lib.Xml.Parse.required "VerificationToken" (( ! ) r_verification_token) i;
   }
    : verify_domain_identity_response)

let verify_domain_identity_request_of_xml i =
  let r_domain = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Domain" ] (fun tag _ ->
      match tag with
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> domain_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain = Smaws_Lib.Xml.Parse.required "Domain" (( ! ) r_domain) i }
    : verify_domain_identity_request)

let verify_domain_dkim_response_of_xml i =
  let r_dkim_tokens = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DkimTokens" ] (fun tag _ ->
      match tag with
      | "DkimTokens" ->
          r_dkim_tokens :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimTokens"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> verification_token_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dkim_tokens = Smaws_Lib.Xml.Parse.required "DkimTokens" (( ! ) r_dkim_tokens) i }
    : verify_domain_dkim_response)

let verify_domain_dkim_request_of_xml i =
  let r_domain = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Domain" ] (fun tag _ ->
      match tag with
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> domain_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain = Smaws_Lib.Xml.Parse.required "Domain" (( ! ) r_domain) i }
    : verify_domain_dkim_request)

let update_template_response_of_xml i = ()

let update_template_request_of_xml i =
  let r_template = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Template" ] (fun tag _ ->
      match tag with
      | "Template" ->
          r_template :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Template" (fun i _ -> template_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template = Smaws_Lib.Xml.Parse.required "Template" (( ! ) r_template) i }
    : update_template_request)

let update_receipt_rule_response_of_xml i = ()

let update_receipt_rule_request_of_xml i =
  let r_rule_set_name = ref None in
  let r_rule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleSetName"; "Rule" ] (fun tag _ ->
      match tag with
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "Rule" ->
          r_rule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> receipt_rule_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
     rule = Smaws_Lib.Xml.Parse.required "Rule" (( ! ) r_rule) i;
   }
    : update_receipt_rule_request)

let update_custom_verification_email_template_request_of_xml i =
  let r_template_name = ref None in
  let r_from_email_address = ref None in
  let r_template_subject = ref None in
  let r_template_content = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_failure_redirection_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateName";
      "FromEmailAddress";
      "TemplateSubject";
      "TemplateContent";
      "SuccessRedirectionURL";
      "FailureRedirectionURL";
    ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "TemplateContent" ->
          r_template_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateContent"
                 (fun i _ -> template_content_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     from_email_address = ( ! ) r_from_email_address;
     template_subject = ( ! ) r_template_subject;
     template_content = ( ! ) r_template_content;
     success_redirection_ur_l = ( ! ) r_success_redirection_ur_l;
     failure_redirection_ur_l = ( ! ) r_failure_redirection_ur_l;
   }
    : update_custom_verification_email_template_request)

let update_configuration_set_tracking_options_response_of_xml i = ()

let update_configuration_set_tracking_options_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_tracking_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "TrackingOptions" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "TrackingOptions" ->
          r_tracking_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackingOptions"
                 (fun i _ -> tracking_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     tracking_options = Smaws_Lib.Xml.Parse.required "TrackingOptions" (( ! ) r_tracking_options) i;
   }
    : update_configuration_set_tracking_options_request)

let update_configuration_set_sending_enabled_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "Enabled" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : update_configuration_set_sending_enabled_request)

let update_configuration_set_reputation_metrics_enabled_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "Enabled" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : update_configuration_set_reputation_metrics_enabled_request)

let update_configuration_set_event_destination_response_of_xml i = ()

let update_configuration_set_event_destination_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_event_destination = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSetName"; "EventDestination" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "EventDestination" ->
          r_event_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestination"
                 (fun i _ -> event_destination_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
     event_destination =
       Smaws_Lib.Xml.Parse.required "EventDestination" (( ! ) r_event_destination) i;
   }
    : update_configuration_set_event_destination_request)

let update_account_sending_enabled_request_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : update_account_sending_enabled_request)

let test_render_template_response_of_xml i =
  let r_rendered_template = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RenderedTemplate" ] (fun tag _ ->
      match tag with
      | "RenderedTemplate" ->
          r_rendered_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RenderedTemplate"
                 (fun i _ -> rendered_template_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rendered_template = ( ! ) r_rendered_template } : test_render_template_response)

let test_render_template_request_of_xml i =
  let r_template_name = ref None in
  let r_template_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "TemplateData" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "TemplateData" ->
          r_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     template_data = Smaws_Lib.Xml.Parse.required "TemplateData" (( ! ) r_template_data) i;
   }
    : test_render_template_request)
