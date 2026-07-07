open Types

let unit_of_xml _ = ()
let amazon_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let workmail_action_of_xml i =
  let r_organization_arn = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationArn"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "OrganizationArn" ->
          r_organization_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     organization_arn = Smaws_Lib.Xml.Parse.required "OrganizationArn" (( ! ) r_organization_arn) i;
     topic_arn = ( ! ) r_topic_arn;
   }
    : workmail_action)

let verify_email_identity_response_of_xml i = ()
let address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let verification_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let domain_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let verification_token_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> verification_token_of_xml i) ()

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

let verification_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NotStarted" -> NotStarted
   | "TemporaryFailure" -> TemporaryFailure
   | "Failed" -> Failed
   | "Success" -> Success
   | "Pending" -> Pending
   | _ -> failwith "unknown enum value"
    : verification_status)

let identity_verification_attributes_of_xml i =
  let r_verification_token = ref None in
  let r_verification_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VerificationToken"; "VerificationStatus" ]
    (fun tag _ ->
      match tag with
      | "VerificationToken" ->
          r_verification_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerificationToken"
                 (fun i _ -> verification_token_of_xml i)
                 ())
      | "VerificationStatus" ->
          r_verification_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VerificationStatus"
                 (fun i _ -> verification_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     verification_token = ( ! ) r_verification_token;
     verification_status =
       Smaws_Lib.Xml.Parse.required "VerificationStatus" (( ! ) r_verification_status) i;
   }
    : identity_verification_attributes)

let identity_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let update_template_response_of_xml i = ()
let template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_part_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let text_part_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let html_part_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let template_of_xml i =
  let r_html_part = ref None in
  let r_text_part = ref None in
  let r_subject_part = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HtmlPart"; "TextPart"; "SubjectPart"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "HtmlPart" ->
          r_html_part :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HtmlPart" (fun i _ -> html_part_of_xml i) ())
      | "TextPart" ->
          r_text_part :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TextPart" (fun i _ -> text_part_of_xml i) ())
      | "SubjectPart" ->
          r_subject_part :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubjectPart"
                 (fun i _ -> subject_part_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     html_part = ( ! ) r_html_part;
     text_part = ( ! ) r_text_part;
     subject_part = ( ! ) r_subject_part;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
   }
    : template)

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

let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let template_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; template_name = ( ! ) r_template_name }
    : template_does_not_exist_exception)

let invalid_template_exception_of_xml i =
  let r_message = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; template_name = ( ! ) r_template_name }
    : invalid_template_exception)

let update_receipt_rule_response_of_xml i = ()
let receipt_rule_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let receipt_rule_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let tls_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Optional" -> Optional | "Require" -> Require | _ -> failwith "unknown enum value"
    : tls_policy)

let recipient_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let recipients_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> recipient_of_xml i) ()

let s3_bucket_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let s3_key_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let iam_role_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let s3_action_of_xml i =
  let r_iam_role_arn = ref None in
  let r_kms_key_arn = ref None in
  let r_object_key_prefix = ref None in
  let r_bucket_name = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IamRoleArn"; "KmsKeyArn"; "ObjectKeyPrefix"; "BucketName"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn"
                 (fun i _ -> iam_role_ar_n_of_xml i)
                 ())
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ObjectKeyPrefix" ->
          r_object_key_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ObjectKeyPrefix"
                 (fun i _ -> s3_key_prefix_of_xml i)
                 ())
      | "BucketName" ->
          r_bucket_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BucketName"
                 (fun i _ -> s3_bucket_name_of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     iam_role_arn = ( ! ) r_iam_role_arn;
     kms_key_arn = ( ! ) r_kms_key_arn;
     object_key_prefix = ( ! ) r_object_key_prefix;
     bucket_name = Smaws_Lib.Xml.Parse.required "BucketName" (( ! ) r_bucket_name) i;
     topic_arn = ( ! ) r_topic_arn;
   }
    : s3_action)

let bounce_smtp_reply_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let bounce_status_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let bounce_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let bounce_action_of_xml i =
  let r_sender = ref None in
  let r_message = ref None in
  let r_status_code = ref None in
  let r_smtp_reply_code = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Sender"; "Message"; "StatusCode"; "SmtpReplyCode"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "Sender" ->
          r_sender :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Sender" (fun i _ -> address_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> bounce_message_of_xml i)
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> bounce_status_code_of_xml i)
                 ())
      | "SmtpReplyCode" ->
          r_smtp_reply_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SmtpReplyCode"
                 (fun i _ -> bounce_smtp_reply_code_of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sender = Smaws_Lib.Xml.Parse.required "Sender" (( ! ) r_sender) i;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     status_code = ( ! ) r_status_code;
     smtp_reply_code = Smaws_Lib.Xml.Parse.required "SmtpReplyCode" (( ! ) r_smtp_reply_code) i;
     topic_arn = ( ! ) r_topic_arn;
   }
    : bounce_action)

let invocation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RequestResponse" -> RequestResponse
   | "Event" -> Event
   | _ -> failwith "unknown enum value"
    : invocation_type)

let lambda_action_of_xml i =
  let r_invocation_type = ref None in
  let r_function_arn = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InvocationType"; "FunctionArn"; "TopicArn" ]
    (fun tag _ ->
      match tag with
      | "InvocationType" ->
          r_invocation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationType"
                 (fun i _ -> invocation_type_of_xml i)
                 ())
      | "FunctionArn" ->
          r_function_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FunctionArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     invocation_type = ( ! ) r_invocation_type;
     function_arn = Smaws_Lib.Xml.Parse.required "FunctionArn" (( ! ) r_function_arn) i;
     topic_arn = ( ! ) r_topic_arn;
   }
    : lambda_action)

let stop_scope_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RuleSet" -> RULE_SET | _ -> failwith "unknown enum value" : stop_scope)

let stop_action_of_xml i =
  let r_topic_arn = ref None in
  let r_scope = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn"; "Scope" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Scope" ->
          r_scope :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Scope" (fun i _ -> stop_scope_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_arn = ( ! ) r_topic_arn; scope = Smaws_Lib.Xml.Parse.required "Scope" (( ! ) r_scope) i }
    : stop_action)

let header_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let header_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let add_header_action_of_xml i =
  let r_header_value = ref None in
  let r_header_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HeaderValue"; "HeaderName" ] (fun tag _ ->
      match tag with
      | "HeaderValue" ->
          r_header_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeaderValue"
                 (fun i _ -> header_value_of_xml i)
                 ())
      | "HeaderName" ->
          r_header_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeaderName"
                 (fun i _ -> header_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     header_value = Smaws_Lib.Xml.Parse.required "HeaderValue" (( ! ) r_header_value) i;
     header_name = Smaws_Lib.Xml.Parse.required "HeaderName" (( ! ) r_header_name) i;
   }
    : add_header_action)

let sns_action_encoding_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Base64" -> Base64 | "UTF-8" -> UTF8 | _ -> failwith "unknown enum value"
    : sns_action_encoding)

let sns_action_of_xml i =
  let r_encoding = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Encoding"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "Encoding" ->
          r_encoding :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encoding"
                 (fun i _ -> sns_action_encoding_of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     encoding = ( ! ) r_encoding;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : sns_action)

let connect_instance_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let connect_action_of_xml i =
  let r_iam_role_ar_n = ref None in
  let r_instance_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IAMRoleARN"; "InstanceARN" ] (fun tag _ ->
      match tag with
      | "IAMRoleARN" ->
          r_iam_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMRoleARN"
                 (fun i _ -> iam_role_ar_n_of_xml i)
                 ())
      | "InstanceARN" ->
          r_instance_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceARN"
                 (fun i _ -> connect_instance_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     iam_role_ar_n = Smaws_Lib.Xml.Parse.required "IAMRoleARN" (( ! ) r_iam_role_ar_n) i;
     instance_ar_n = Smaws_Lib.Xml.Parse.required "InstanceARN" (( ! ) r_instance_ar_n) i;
   }
    : connect_action)

let receipt_action_of_xml i =
  let r_connect_action = ref None in
  let r_sns_action = ref None in
  let r_add_header_action = ref None in
  let r_stop_action = ref None in
  let r_lambda_action = ref None in
  let r_workmail_action = ref None in
  let r_bounce_action = ref None in
  let r_s3_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConnectAction";
      "SNSAction";
      "AddHeaderAction";
      "StopAction";
      "LambdaAction";
      "WorkmailAction";
      "BounceAction";
      "S3Action";
    ] (fun tag _ ->
      match tag with
      | "ConnectAction" ->
          r_connect_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConnectAction"
                 (fun i _ -> connect_action_of_xml i)
                 ())
      | "SNSAction" ->
          r_sns_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SNSAction" (fun i _ -> sns_action_of_xml i) ())
      | "AddHeaderAction" ->
          r_add_header_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddHeaderAction"
                 (fun i _ -> add_header_action_of_xml i)
                 ())
      | "StopAction" ->
          r_stop_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StopAction"
                 (fun i _ -> stop_action_of_xml i)
                 ())
      | "LambdaAction" ->
          r_lambda_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LambdaAction"
                 (fun i _ -> lambda_action_of_xml i)
                 ())
      | "WorkmailAction" ->
          r_workmail_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WorkmailAction"
                 (fun i _ -> workmail_action_of_xml i)
                 ())
      | "BounceAction" ->
          r_bounce_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceAction"
                 (fun i _ -> bounce_action_of_xml i)
                 ())
      | "S3Action" ->
          r_s3_action :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Action" (fun i _ -> s3_action_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     connect_action = ( ! ) r_connect_action;
     sns_action = ( ! ) r_sns_action;
     add_header_action = ( ! ) r_add_header_action;
     stop_action = ( ! ) r_stop_action;
     lambda_action = ( ! ) r_lambda_action;
     workmail_action = ( ! ) r_workmail_action;
     bounce_action = ( ! ) r_bounce_action;
     s3_action = ( ! ) r_s3_action;
   }
    : receipt_action)

let receipt_actions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_action_of_xml i) ()

let receipt_rule_of_xml i =
  let r_scan_enabled = ref None in
  let r_actions = ref None in
  let r_recipients = ref None in
  let r_tls_policy = ref None in
  let r_enabled = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ScanEnabled"; "Actions"; "Recipients"; "TlsPolicy"; "Enabled"; "Name" ] (fun tag _ ->
      match tag with
      | "ScanEnabled" ->
          r_scan_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanEnabled" (fun i _ -> enabled_of_xml i) ())
      | "Actions" ->
          r_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Actions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_action_of_xml i)
                     ())
                 ())
      | "Recipients" ->
          r_recipients :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recipients"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> recipient_of_xml i) ())
                 ())
      | "TlsPolicy" ->
          r_tls_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TlsPolicy" (fun i _ -> tls_policy_of_xml i) ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scan_enabled = ( ! ) r_scan_enabled;
     actions = ( ! ) r_actions;
     recipients = ( ! ) r_recipients;
     tls_policy = ( ! ) r_tls_policy;
     enabled = ( ! ) r_enabled;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : receipt_rule)

let update_receipt_rule_request_of_xml i =
  let r_rule = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rule"; "RuleSetName" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> receipt_rule_of_xml i) ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule = Smaws_Lib.Xml.Parse.required "Rule" (( ! ) r_rule) i;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : update_receipt_rule_request)

let rule_or_rule_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rule_set_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "Name" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; name = ( ! ) r_name } : rule_set_does_not_exist_exception)

let rule_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "Name" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; name = ( ! ) r_name } : rule_does_not_exist_exception)

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

let invalid_sns_topic_exception_of_xml i =
  let r_message = ref None in
  let r_topic = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "Topic" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "Topic" ->
          r_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Topic"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; topic = ( ! ) r_topic } : invalid_sns_topic_exception)

let invalid_s3_configuration_exception_of_xml i =
  let r_message = ref None in
  let r_bucket = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "Bucket" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "Bucket" ->
          r_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Bucket" (fun i _ -> s3_bucket_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; bucket = ( ! ) r_bucket } : invalid_s3_configuration_exception)

let invalid_lambda_function_exception_of_xml i =
  let r_message = ref None in
  let r_function_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "FunctionArn" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "FunctionArn" ->
          r_function_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FunctionArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; function_arn = ( ! ) r_function_arn }
    : invalid_lambda_function_exception)

let from_address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let template_content_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let success_redirection_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let failure_redirection_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_custom_verification_email_template_request_of_xml i =
  let r_failure_redirection_ur_l = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_template_content = ref None in
  let r_template_subject = ref None in
  let r_from_email_address = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FailureRedirectionURL";
      "SuccessRedirectionURL";
      "TemplateContent";
      "TemplateSubject";
      "FromEmailAddress";
      "TemplateName";
    ] (fun tag _ ->
      match tag with
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "TemplateContent" ->
          r_template_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateContent"
                 (fun i _ -> template_content_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_redirection_ur_l = ( ! ) r_failure_redirection_ur_l;
     success_redirection_ur_l = ( ! ) r_success_redirection_ur_l;
     template_content = ( ! ) r_template_content;
     template_subject = ( ! ) r_template_subject;
     from_email_address = ( ! ) r_from_email_address;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
   }
    : update_custom_verification_email_template_request)

let from_email_address_not_verified_exception_of_xml i =
  let r_message = ref None in
  let r_from_email_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "FromEmailAddress" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; from_email_address = ( ! ) r_from_email_address }
    : from_email_address_not_verified_exception)

let custom_verification_email_template_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_custom_verification_email_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "CustomVerificationEmailTemplateName" ]
    (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "CustomVerificationEmailTemplateName" ->
          r_custom_verification_email_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomVerificationEmailTemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     custom_verification_email_template_name = ( ! ) r_custom_verification_email_template_name;
   }
    : custom_verification_email_template_does_not_exist_exception)

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

let update_configuration_set_tracking_options_response_of_xml i = ()
let configuration_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
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

let update_configuration_set_tracking_options_request_of_xml i =
  let r_tracking_options = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrackingOptions"; "ConfigurationSetName" ]
    (fun tag _ ->
      match tag with
      | "TrackingOptions" ->
          r_tracking_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackingOptions"
                 (fun i _ -> tracking_options_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tracking_options = Smaws_Lib.Xml.Parse.required "TrackingOptions" (( ! ) r_tracking_options) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : update_configuration_set_tracking_options_request)

let tracking_options_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; configuration_set_name = ( ! ) r_configuration_set_name }
    : tracking_options_does_not_exist_exception)

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

let configuration_set_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; configuration_set_name = ( ! ) r_configuration_set_name }
    : configuration_set_does_not_exist_exception)

let update_configuration_set_sending_enabled_request_of_xml i =
  let r_enabled = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : update_configuration_set_sending_enabled_request)

let update_configuration_set_reputation_metrics_enabled_request_of_xml i =
  let r_enabled = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : update_configuration_set_reputation_metrics_enabled_request)

let update_configuration_set_event_destination_response_of_xml i = ()
let event_destination_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let event_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "renderingFailure" -> RENDERING_FAILURE
   | "click" -> CLICK
   | "open" -> OPEN
   | "delivery" -> DELIVERY
   | "complaint" -> COMPLAINT
   | "bounce" -> BOUNCE
   | "reject" -> REJECT
   | "send" -> SEND
   | _ -> failwith "unknown enum value"
    : event_type)

let event_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_type_of_xml i) ()

let kinesis_firehose_destination_of_xml i =
  let r_delivery_stream_ar_n = ref None in
  let r_iam_role_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeliveryStreamARN"; "IAMRoleARN" ] (fun tag _ ->
      match tag with
      | "DeliveryStreamARN" ->
          r_delivery_stream_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryStreamARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "IAMRoleARN" ->
          r_iam_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMRoleARN"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delivery_stream_ar_n =
       Smaws_Lib.Xml.Parse.required "DeliveryStreamARN" (( ! ) r_delivery_stream_ar_n) i;
     iam_role_ar_n = Smaws_Lib.Xml.Parse.required "IAMRoleARN" (( ! ) r_iam_role_ar_n) i;
   }
    : kinesis_firehose_destination)

let dimension_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let dimension_value_source_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "linkTag" -> LINK_TAG
   | "emailHeader" -> EMAIL_HEADER
   | "messageTag" -> MESSAGE_TAG
   | _ -> failwith "unknown enum value"
    : dimension_value_source)

let default_dimension_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cloud_watch_dimension_configuration_of_xml i =
  let r_default_dimension_value = ref None in
  let r_dimension_value_source = ref None in
  let r_dimension_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultDimensionValue"; "DimensionValueSource"; "DimensionName" ] (fun tag _ ->
      match tag with
      | "DefaultDimensionValue" ->
          r_default_dimension_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultDimensionValue"
                 (fun i _ -> default_dimension_value_of_xml i)
                 ())
      | "DimensionValueSource" ->
          r_dimension_value_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DimensionValueSource"
                 (fun i _ -> dimension_value_source_of_xml i)
                 ())
      | "DimensionName" ->
          r_dimension_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DimensionName"
                 (fun i _ -> dimension_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_dimension_value =
       Smaws_Lib.Xml.Parse.required "DefaultDimensionValue" (( ! ) r_default_dimension_value) i;
     dimension_value_source =
       Smaws_Lib.Xml.Parse.required "DimensionValueSource" (( ! ) r_dimension_value_source) i;
     dimension_name = Smaws_Lib.Xml.Parse.required "DimensionName" (( ! ) r_dimension_name) i;
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

let event_destination_of_xml i =
  let r_sns_destination = ref None in
  let r_cloud_watch_destination = ref None in
  let r_kinesis_firehose_destination = ref None in
  let r_matching_event_types = ref None in
  let r_enabled = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SNSDestination";
      "CloudWatchDestination";
      "KinesisFirehoseDestination";
      "MatchingEventTypes";
      "Enabled";
      "Name";
    ] (fun tag _ ->
      match tag with
      | "SNSDestination" ->
          r_sns_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SNSDestination"
                 (fun i _ -> sns_destination_of_xml i)
                 ())
      | "CloudWatchDestination" ->
          r_cloud_watch_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloudWatchDestination"
                 (fun i _ -> cloud_watch_destination_of_xml i)
                 ())
      | "KinesisFirehoseDestination" ->
          r_kinesis_firehose_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KinesisFirehoseDestination"
                 (fun i _ -> kinesis_firehose_destination_of_xml i)
                 ())
      | "MatchingEventTypes" ->
          r_matching_event_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MatchingEventTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_type_of_xml i) ())
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sns_destination = ( ! ) r_sns_destination;
     cloud_watch_destination = ( ! ) r_cloud_watch_destination;
     kinesis_firehose_destination = ( ! ) r_kinesis_firehose_destination;
     matching_event_types =
       Smaws_Lib.Xml.Parse.required "MatchingEventTypes" (( ! ) r_matching_event_types) i;
     enabled = ( ! ) r_enabled;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : event_destination)

let update_configuration_set_event_destination_request_of_xml i =
  let r_event_destination = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventDestination"; "ConfigurationSetName" ]
    (fun tag _ ->
      match tag with
      | "EventDestination" ->
          r_event_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestination"
                 (fun i _ -> event_destination_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_destination =
       Smaws_Lib.Xml.Parse.required "EventDestination" (( ! ) r_event_destination) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : update_configuration_set_event_destination_request)

let invalid_sns_destination_exception_of_xml i =
  let r_message = ref None in
  let r_event_destination_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "message"; "EventDestinationName"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     event_destination_name = ( ! ) r_event_destination_name;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : invalid_sns_destination_exception)

let invalid_firehose_destination_exception_of_xml i =
  let r_message = ref None in
  let r_event_destination_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "message"; "EventDestinationName"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     event_destination_name = ( ! ) r_event_destination_name;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : invalid_firehose_destination_exception)

let invalid_cloud_watch_destination_exception_of_xml i =
  let r_message = ref None in
  let r_event_destination_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "message"; "EventDestinationName"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     event_destination_name = ( ! ) r_event_destination_name;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : invalid_cloud_watch_destination_exception)

let event_destination_does_not_exist_exception_of_xml i =
  let r_message = ref None in
  let r_event_destination_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "message"; "EventDestinationName"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     event_destination_name = ( ! ) r_event_destination_name;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : event_destination_does_not_exist_exception)

let update_account_sending_enabled_request_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : update_account_sending_enabled_request)

let tracking_options_already_exists_exception_of_xml i =
  let r_message = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; configuration_set_name = ( ! ) r_configuration_set_name }
    : tracking_options_already_exists_exception)

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let rendered_template_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let template_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let test_render_template_request_of_xml i =
  let r_template_data = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateData"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "TemplateData" ->
          r_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_data = Smaws_Lib.Xml.Parse.required "TemplateData" (( ! ) r_template_data) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
   }
    : test_render_template_request)

let missing_rendering_attribute_exception_of_xml i =
  let r_message = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; template_name = ( ! ) r_template_name }
    : missing_rendering_attribute_exception)

let invalid_rendering_parameter_exception_of_xml i =
  let r_message = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; template_name = ( ! ) r_template_name }
    : invalid_rendering_parameter_exception)

let template_metadata_of_xml i =
  let r_created_timestamp = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CreatedTimestamp"; "Name" ] (fun tag _ ->
      match tag with
      | "CreatedTimestamp" ->
          r_created_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> template_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ created_timestamp = ( ! ) r_created_timestamp; name = ( ! ) r_name } : template_metadata)

let template_metadata_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_metadata_of_xml i) ()

let set_receipt_rule_position_response_of_xml i = ()

let set_receipt_rule_position_request_of_xml i =
  let r_after = ref None in
  let r_rule_name = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "After"; "RuleName"; "RuleSetName" ] (fun tag _ ->
      match tag with
      | "After" ->
          r_after :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "After"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     after = ( ! ) r_after;
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : set_receipt_rule_position_request)

let set_identity_notification_topic_response_of_xml i = ()

let notification_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Delivery" -> Delivery
   | "Complaint" -> Complaint
   | "Bounce" -> Bounce
   | _ -> failwith "unknown enum value"
    : notification_type)

let notification_topic_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let set_identity_notification_topic_request_of_xml i =
  let r_sns_topic = ref None in
  let r_notification_type = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnsTopic"; "NotificationType"; "Identity" ]
    (fun tag _ ->
      match tag with
      | "SnsTopic" ->
          r_sns_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | "NotificationType" ->
          r_notification_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationType"
                 (fun i _ -> notification_type_of_xml i)
                 ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sns_topic = ( ! ) r_sns_topic;
     notification_type =
       Smaws_Lib.Xml.Parse.required "NotificationType" (( ! ) r_notification_type) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : set_identity_notification_topic_request)

let set_identity_mail_from_domain_response_of_xml i = ()
let mail_from_domain_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let behavior_on_mx_failure_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RejectMessage" -> RejectMessage
   | "UseDefaultValue" -> UseDefaultValue
   | _ -> failwith "unknown enum value"
    : behavior_on_mx_failure)

let set_identity_mail_from_domain_request_of_xml i =
  let r_behavior_on_mx_failure = ref None in
  let r_mail_from_domain = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "BehaviorOnMXFailure"; "MailFromDomain"; "Identity" ] (fun tag _ ->
      match tag with
      | "BehaviorOnMXFailure" ->
          r_behavior_on_mx_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BehaviorOnMXFailure"
                 (fun i _ -> behavior_on_mx_failure_of_xml i)
                 ())
      | "MailFromDomain" ->
          r_mail_from_domain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomain"
                 (fun i _ -> mail_from_domain_name_of_xml i)
                 ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     behavior_on_mx_failure = ( ! ) r_behavior_on_mx_failure;
     mail_from_domain = ( ! ) r_mail_from_domain;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : set_identity_mail_from_domain_request)

let set_identity_headers_in_notifications_enabled_response_of_xml i = ()

let set_identity_headers_in_notifications_enabled_request_of_xml i =
  let r_enabled = ref None in
  let r_notification_type = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled"; "NotificationType"; "Identity" ]
    (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | "NotificationType" ->
          r_notification_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationType"
                 (fun i _ -> notification_type_of_xml i)
                 ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
     notification_type =
       Smaws_Lib.Xml.Parse.required "NotificationType" (( ! ) r_notification_type) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : set_identity_headers_in_notifications_enabled_request)

let set_identity_feedback_forwarding_enabled_response_of_xml i = ()

let set_identity_feedback_forwarding_enabled_request_of_xml i =
  let r_forwarding_enabled = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ForwardingEnabled"; "Identity" ] (fun tag _ ->
      match tag with
      | "ForwardingEnabled" ->
          r_forwarding_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForwardingEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     forwarding_enabled =
       Smaws_Lib.Xml.Parse.required "ForwardingEnabled" (( ! ) r_forwarding_enabled) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : set_identity_feedback_forwarding_enabled_request)

let set_identity_dkim_enabled_response_of_xml i = ()

let set_identity_dkim_enabled_request_of_xml i =
  let r_dkim_enabled = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DkimEnabled"; "Identity" ] (fun tag _ ->
      match tag with
      | "DkimEnabled" ->
          r_dkim_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimEnabled" (fun i _ -> enabled_of_xml i) ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dkim_enabled = Smaws_Lib.Xml.Parse.required "DkimEnabled" (( ! ) r_dkim_enabled) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : set_identity_dkim_enabled_request)

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

let configuration_set_sending_paused_exception_of_xml i =
  let r_message = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; configuration_set_name = ( ! ) r_configuration_set_name }
    : configuration_set_sending_paused_exception)

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

let message_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let address_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ()

let destination_of_xml i =
  let r_bcc_addresses = ref None in
  let r_cc_addresses = ref None in
  let r_to_addresses = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "BccAddresses"; "CcAddresses"; "ToAddresses" ]
    (fun tag _ ->
      match tag with
      | "BccAddresses" ->
          r_bcc_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BccAddresses"
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
      | "ToAddresses" ->
          r_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     bcc_addresses = ( ! ) r_bcc_addresses;
     cc_addresses = ( ! ) r_cc_addresses;
     to_addresses = ( ! ) r_to_addresses;
   }
    : destination)

let message_tag_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let message_tag_of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> message_tag_value_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> message_tag_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : message_tag)

let message_tag_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> message_tag_of_xml i) ()

let send_templated_email_request_of_xml i =
  let r_template_data = ref None in
  let r_template_arn = ref None in
  let r_template = ref None in
  let r_configuration_set_name = ref None in
  let r_tags = ref None in
  let r_return_path_arn = ref None in
  let r_source_arn = ref None in
  let r_return_path = ref None in
  let r_reply_to_addresses = ref None in
  let r_destination = ref None in
  let r_source = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateData";
      "TemplateArn";
      "Template";
      "ConfigurationSetName";
      "Tags";
      "ReturnPathArn";
      "SourceArn";
      "ReturnPath";
      "ReplyToAddresses";
      "Destination";
      "Source";
    ] (fun tag _ ->
      match tag with
      | "TemplateData" ->
          r_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | "TemplateArn" ->
          r_template_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Template" ->
          r_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Template"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
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
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReturnPath" ->
          r_return_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPath" (fun i _ -> address_of_xml i) ())
      | "ReplyToAddresses" ->
          r_reply_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplyToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> destination_of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_data = Smaws_Lib.Xml.Parse.required "TemplateData" (( ! ) r_template_data) i;
     template_arn = ( ! ) r_template_arn;
     template = Smaws_Lib.Xml.Parse.required "Template" (( ! ) r_template) i;
     configuration_set_name = ( ! ) r_configuration_set_name;
     tags = ( ! ) r_tags;
     return_path_arn = ( ! ) r_return_path_arn;
     source_arn = ( ! ) r_source_arn;
     return_path = ( ! ) r_return_path;
     reply_to_addresses = ( ! ) r_reply_to_addresses;
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
   }
    : send_templated_email_request)

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

let send_raw_email_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_tags = ref None in
  let r_return_path_arn = ref None in
  let r_source_arn = ref None in
  let r_from_arn = ref None in
  let r_raw_message = ref None in
  let r_destinations = ref None in
  let r_source = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConfigurationSetName";
      "Tags";
      "ReturnPathArn";
      "SourceArn";
      "FromArn";
      "RawMessage";
      "Destinations";
      "Source";
    ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
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
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "FromArn" ->
          r_from_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "RawMessage" ->
          r_raw_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RawMessage"
                 (fun i _ -> raw_message_of_xml i)
                 ())
      | "Destinations" ->
          r_destinations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destinations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     tags = ( ! ) r_tags;
     return_path_arn = ( ! ) r_return_path_arn;
     source_arn = ( ! ) r_source_arn;
     from_arn = ( ! ) r_from_arn;
     raw_message = Smaws_Lib.Xml.Parse.required "RawMessage" (( ! ) r_raw_message) i;
     destinations = ( ! ) r_destinations;
     source = ( ! ) r_source;
   }
    : send_raw_email_request)

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

let message_data_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let charset_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let content_of_xml i =
  let r_charset = ref None in
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Charset"; "Data" ] (fun tag _ ->
      match tag with
      | "Charset" ->
          r_charset :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Charset" (fun i _ -> charset_of_xml i) ())
      | "Data" ->
          r_data :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Data" (fun i _ -> message_data_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ charset = ( ! ) r_charset; data = Smaws_Lib.Xml.Parse.required "Data" (( ! ) r_data) i }
    : content)

let body_of_xml i =
  let r_html = ref None in
  let r_text = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Html"; "Text" ] (fun tag _ ->
      match tag with
      | "Html" ->
          r_html :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Html" (fun i _ -> content_of_xml i) ())
      | "Text" ->
          r_text :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Text" (fun i _ -> content_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ html = ( ! ) r_html; text = ( ! ) r_text } : body)

let message_of_xml i =
  let r_body = ref None in
  let r_subject = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Body"; "Subject" ] (fun tag _ ->
      match tag with
      | "Body" ->
          r_body := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Body" (fun i _ -> body_of_xml i) ())
      | "Subject" ->
          r_subject :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Subject" (fun i _ -> content_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     body = Smaws_Lib.Xml.Parse.required "Body" (( ! ) r_body) i;
     subject = Smaws_Lib.Xml.Parse.required "Subject" (( ! ) r_subject) i;
   }
    : message)

let send_email_request_of_xml i =
  let r_configuration_set_name = ref None in
  let r_tags = ref None in
  let r_return_path_arn = ref None in
  let r_source_arn = ref None in
  let r_return_path = ref None in
  let r_reply_to_addresses = ref None in
  let r_message = ref None in
  let r_destination = ref None in
  let r_source = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConfigurationSetName";
      "Tags";
      "ReturnPathArn";
      "SourceArn";
      "ReturnPath";
      "ReplyToAddresses";
      "Message";
      "Destination";
      "Source";
    ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
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
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReturnPath" ->
          r_return_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPath" (fun i _ -> address_of_xml i) ())
      | "ReplyToAddresses" ->
          r_reply_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplyToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> destination_of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     tags = ( ! ) r_tags;
     return_path_arn = ( ! ) r_return_path_arn;
     source_arn = ( ! ) r_source_arn;
     return_path = ( ! ) r_return_path;
     reply_to_addresses = ( ! ) r_reply_to_addresses;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
   }
    : send_email_request)

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
  let r_configuration_set_name = ref None in
  let r_template_name = ref None in
  let r_email_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetName"; "TemplateName"; "EmailAddress" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | "EmailAddress" ->
          r_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EmailAddress" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     configuration_set_name = ( ! ) r_configuration_set_name;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     email_address = Smaws_Lib.Xml.Parse.required "EmailAddress" (( ! ) r_email_address) i;
   }
    : send_custom_verification_email_request)

let bulk_email_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Failed" -> Failed
   | "TransientFailure" -> TransientFailure
   | "InvalidParameterValue" -> InvalidParameterValue
   | "ConfigurationSetSendingPaused" -> ConfigurationSetSendingPaused
   | "AccountSendingPaused" -> AccountSendingPaused
   | "InvalidSendingPoolName" -> InvalidSendingPoolName
   | "AccountDailyQuotaExceeded" -> AccountDailyQuotaExceeded
   | "AccountThrottled" -> AccountThrottled
   | "AccountSuspended" -> AccountSuspended
   | "TemplateDoesNotExist" -> TemplateDoesNotExist
   | "ConfigurationSetDoesNotExist" -> ConfigurationSetDoesNotExist
   | "MailFromDomainNotVerified" -> MailFromDomainNotVerified
   | "MessageRejected" -> MessageRejected
   | "Success" -> Success
   | _ -> failwith "unknown enum value"
    : bulk_email_status)

let error_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let bulk_email_destination_status_of_xml i =
  let r_message_id = ref None in
  let r_error = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MessageId"; "Error"; "Status" ] (fun tag _ ->
      match tag with
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | "Error" ->
          r_error :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Error" (fun i _ -> error_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> bulk_email_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message_id = ( ! ) r_message_id; error = ( ! ) r_error; status = ( ! ) r_status }
    : bulk_email_destination_status)

let bulk_email_destination_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> bulk_email_destination_status_of_xml i)
    ()

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

let bulk_email_destination_of_xml i =
  let r_replacement_template_data = ref None in
  let r_replacement_tags = ref None in
  let r_destination = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplacementTemplateData"; "ReplacementTags"; "Destination" ] (fun tag _ ->
      match tag with
      | "ReplacementTemplateData" ->
          r_replacement_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplacementTemplateData"
                 (fun i _ -> template_data_of_xml i)
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
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> destination_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replacement_template_data = ( ! ) r_replacement_template_data;
     replacement_tags = ( ! ) r_replacement_tags;
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
   }
    : bulk_email_destination)

let bulk_email_destination_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> bulk_email_destination_of_xml i) ()

let send_bulk_templated_email_request_of_xml i =
  let r_destinations = ref None in
  let r_default_template_data = ref None in
  let r_template_arn = ref None in
  let r_template = ref None in
  let r_default_tags = ref None in
  let r_configuration_set_name = ref None in
  let r_return_path_arn = ref None in
  let r_return_path = ref None in
  let r_reply_to_addresses = ref None in
  let r_source_arn = ref None in
  let r_source = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Destinations";
      "DefaultTemplateData";
      "TemplateArn";
      "Template";
      "DefaultTags";
      "ConfigurationSetName";
      "ReturnPathArn";
      "ReturnPath";
      "ReplyToAddresses";
      "SourceArn";
      "Source";
    ] (fun tag _ ->
      match tag with
      | "Destinations" ->
          r_destinations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destinations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> bulk_email_destination_of_xml i)
                     ())
                 ())
      | "DefaultTemplateData" ->
          r_default_template_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultTemplateData"
                 (fun i _ -> template_data_of_xml i)
                 ())
      | "TemplateArn" ->
          r_template_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Template" ->
          r_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Template"
                 (fun i _ -> template_name_of_xml i)
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
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | "ReturnPathArn" ->
          r_return_path_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPathArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "ReturnPath" ->
          r_return_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnPath" (fun i _ -> address_of_xml i) ())
      | "ReplyToAddresses" ->
          r_reply_to_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplyToAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> address_of_xml i) ())
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     destinations = Smaws_Lib.Xml.Parse.required "Destinations" (( ! ) r_destinations) i;
     default_template_data =
       Smaws_Lib.Xml.Parse.required "DefaultTemplateData" (( ! ) r_default_template_data) i;
     template_arn = ( ! ) r_template_arn;
     template = Smaws_Lib.Xml.Parse.required "Template" (( ! ) r_template) i;
     default_tags = ( ! ) r_default_tags;
     configuration_set_name = ( ! ) r_configuration_set_name;
     return_path_arn = ( ! ) r_return_path_arn;
     return_path = ( ! ) r_return_path;
     reply_to_addresses = ( ! ) r_reply_to_addresses;
     source_arn = ( ! ) r_source_arn;
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
   }
    : send_bulk_templated_email_request)

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

let explanation_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let reporting_mta_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let arrival_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let extension_field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let extension_field_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let extension_field_of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> extension_field_value_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> extension_field_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : extension_field)

let extension_field_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> extension_field_of_xml i) ()

let message_dsn_of_xml i =
  let r_extension_fields = ref None in
  let r_arrival_date = ref None in
  let r_reporting_mta = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExtensionFields"; "ArrivalDate"; "ReportingMta" ]
    (fun tag _ ->
      match tag with
      | "ExtensionFields" ->
          r_extension_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtensionFields"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> extension_field_of_xml i)
                     ())
                 ())
      | "ArrivalDate" ->
          r_arrival_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ArrivalDate"
                 (fun i _ -> arrival_date_of_xml i)
                 ())
      | "ReportingMta" ->
          r_reporting_mta :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReportingMta"
                 (fun i _ -> reporting_mta_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     extension_fields = ( ! ) r_extension_fields;
     arrival_date = ( ! ) r_arrival_date;
     reporting_mta = Smaws_Lib.Xml.Parse.required "ReportingMta" (( ! ) r_reporting_mta) i;
   }
    : message_dsn)

let bounce_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TemporaryFailure" -> TemporaryFailure
   | "Undefined" -> Undefined
   | "ContentRejected" -> ContentRejected
   | "ExceededQuota" -> ExceededQuota
   | "MessageTooLarge" -> MessageTooLarge
   | "DoesNotExist" -> DoesNotExist
   | _ -> failwith "unknown enum value"
    : bounce_type)

let dsn_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "expanded" -> EXPANDED
   | "relayed" -> RELAYED
   | "delivered" -> DELIVERED
   | "delayed" -> DELAYED
   | "failed" -> FAILED
   | _ -> failwith "unknown enum value"
    : dsn_action)

let remote_mta_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dsn_status_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let diagnostic_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let last_attempt_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let recipient_dsn_fields_of_xml i =
  let r_extension_fields = ref None in
  let r_last_attempt_date = ref None in
  let r_diagnostic_code = ref None in
  let r_status = ref None in
  let r_remote_mta = ref None in
  let r_action = ref None in
  let r_final_recipient = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ExtensionFields";
      "LastAttemptDate";
      "DiagnosticCode";
      "Status";
      "RemoteMta";
      "Action";
      "FinalRecipient";
    ] (fun tag _ ->
      match tag with
      | "ExtensionFields" ->
          r_extension_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtensionFields"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> extension_field_of_xml i)
                     ())
                 ())
      | "LastAttemptDate" ->
          r_last_attempt_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAttemptDate"
                 (fun i _ -> last_attempt_date_of_xml i)
                 ())
      | "DiagnosticCode" ->
          r_diagnostic_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DiagnosticCode"
                 (fun i _ -> diagnostic_code_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> dsn_status_of_xml i) ())
      | "RemoteMta" ->
          r_remote_mta :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoteMta" (fun i _ -> remote_mta_of_xml i) ())
      | "Action" ->
          r_action :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Action" (fun i _ -> dsn_action_of_xml i) ())
      | "FinalRecipient" ->
          r_final_recipient :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalRecipient"
                 (fun i _ -> address_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     extension_fields = ( ! ) r_extension_fields;
     last_attempt_date = ( ! ) r_last_attempt_date;
     diagnostic_code = ( ! ) r_diagnostic_code;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     remote_mta = ( ! ) r_remote_mta;
     action = Smaws_Lib.Xml.Parse.required "Action" (( ! ) r_action) i;
     final_recipient = ( ! ) r_final_recipient;
   }
    : recipient_dsn_fields)

let bounced_recipient_info_of_xml i =
  let r_recipient_dsn_fields = ref None in
  let r_bounce_type = ref None in
  let r_recipient_arn = ref None in
  let r_recipient = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RecipientDsnFields"; "BounceType"; "RecipientArn"; "Recipient" ] (fun tag _ ->
      match tag with
      | "RecipientDsnFields" ->
          r_recipient_dsn_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecipientDsnFields"
                 (fun i _ -> recipient_dsn_fields_of_xml i)
                 ())
      | "BounceType" ->
          r_bounce_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceType"
                 (fun i _ -> bounce_type_of_xml i)
                 ())
      | "RecipientArn" ->
          r_recipient_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecipientArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | "Recipient" ->
          r_recipient :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Recipient" (fun i _ -> address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     recipient_dsn_fields = ( ! ) r_recipient_dsn_fields;
     bounce_type = ( ! ) r_bounce_type;
     recipient_arn = ( ! ) r_recipient_arn;
     recipient = Smaws_Lib.Xml.Parse.required "Recipient" (( ! ) r_recipient) i;
   }
    : bounced_recipient_info)

let bounced_recipient_info_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> bounced_recipient_info_of_xml i) ()

let send_bounce_request_of_xml i =
  let r_bounce_sender_arn = ref None in
  let r_bounced_recipient_info_list = ref None in
  let r_message_dsn = ref None in
  let r_explanation = ref None in
  let r_bounce_sender = ref None in
  let r_original_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "BounceSenderArn";
      "BouncedRecipientInfoList";
      "MessageDsn";
      "Explanation";
      "BounceSender";
      "OriginalMessageId";
    ] (fun tag _ ->
      match tag with
      | "BounceSenderArn" ->
          r_bounce_sender_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceSenderArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
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
      | "MessageDsn" ->
          r_message_dsn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageDsn"
                 (fun i _ -> message_dsn_of_xml i)
                 ())
      | "Explanation" ->
          r_explanation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Explanation"
                 (fun i _ -> explanation_of_xml i)
                 ())
      | "BounceSender" ->
          r_bounce_sender :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceSender" (fun i _ -> address_of_xml i) ())
      | "OriginalMessageId" ->
          r_original_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalMessageId"
                 (fun i _ -> message_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     bounce_sender_arn = ( ! ) r_bounce_sender_arn;
     bounced_recipient_info_list =
       Smaws_Lib.Xml.Parse.required "BouncedRecipientInfoList"
         (( ! ) r_bounced_recipient_info_list)
         i;
     message_dsn = ( ! ) r_message_dsn;
     explanation = ( ! ) r_explanation;
     bounce_sender = Smaws_Lib.Xml.Parse.required "BounceSender" (( ! ) r_bounce_sender) i;
     original_message_id =
       Smaws_Lib.Xml.Parse.required "OriginalMessageId" (( ! ) r_original_message_id) i;
   }
    : send_bounce_request)

let reorder_receipt_rule_set_response_of_xml i = ()

let receipt_rule_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_rule_name_of_xml i) ()

let reorder_receipt_rule_set_request_of_xml i =
  let r_rule_names = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleNames"; "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleNames" ->
          r_rule_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_name_of_xml i)
                     ())
                 ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_names = Smaws_Lib.Xml.Parse.required "RuleNames" (( ! ) r_rule_names) i;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : reorder_receipt_rule_set_request)

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

let put_identity_policy_response_of_xml i = ()
let policy_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let policy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_identity_policy_request_of_xml i =
  let r_policy = ref None in
  let r_policy_name = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy"; "PolicyName"; "Identity" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> policy_of_xml i) ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy = Smaws_Lib.Xml.Parse.required "Policy" (( ! ) r_policy) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : put_identity_policy_request)

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

let put_configuration_set_delivery_options_response_of_xml i = ()

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

let put_configuration_set_delivery_options_request_of_xml i =
  let r_delivery_options = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeliveryOptions"; "ConfigurationSetName" ]
    (fun tag _ ->
      match tag with
      | "DeliveryOptions" ->
          r_delivery_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryOptions"
                 (fun i _ -> delivery_options_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delivery_options = ( ! ) r_delivery_options;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : put_configuration_set_delivery_options_request)

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

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_templates_response_of_xml i =
  let r_next_token = ref None in
  let r_templates_metadata = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "TemplatesMetadata" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "TemplatesMetadata" ->
          r_templates_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplatesMetadata"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_metadata_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; templates_metadata = ( ! ) r_templates_metadata }
    : list_templates_response)

let max_items_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_templates_request_of_xml i =
  let r_max_items = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxItems"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxItems" ->
          r_max_items :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems" (fun i _ -> max_items_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_items = ( ! ) r_max_items; next_token = ( ! ) r_next_token } : list_templates_request)

let receipt_rule_set_metadata_of_xml i =
  let r_created_timestamp = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CreatedTimestamp"; "Name" ] (fun tag _ ->
      match tag with
      | "CreatedTimestamp" ->
          r_created_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ created_timestamp = ( ! ) r_created_timestamp; name = ( ! ) r_name }
    : receipt_rule_set_metadata)

let receipt_rule_sets_lists_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_rule_set_metadata_of_xml i) ()

let list_receipt_rule_sets_response_of_xml i =
  let r_next_token = ref None in
  let r_rule_sets = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "RuleSets" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "RuleSets" ->
          r_rule_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_set_metadata_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; rule_sets = ( ! ) r_rule_sets }
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

let receipt_filter_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let receipt_filter_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Allow" -> Allow | "Block" -> Block | _ -> failwith "unknown enum value"
    : receipt_filter_policy)

let cidr_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let receipt_ip_filter_of_xml i =
  let r_cidr = ref None in
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cidr"; "Policy" ] (fun tag _ ->
      match tag with
      | "Cidr" ->
          r_cidr := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cidr" (fun i _ -> cidr_of_xml i) ())
      | "Policy" ->
          r_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                 (fun i _ -> receipt_filter_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cidr = Smaws_Lib.Xml.Parse.required "Cidr" (( ! ) r_cidr) i;
     policy = Smaws_Lib.Xml.Parse.required "Policy" (( ! ) r_policy) i;
   }
    : receipt_ip_filter)

let receipt_filter_of_xml i =
  let r_ip_filter = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IpFilter"; "Name" ] (fun tag _ ->
      match tag with
      | "IpFilter" ->
          r_ip_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpFilter"
                 (fun i _ -> receipt_ip_filter_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> receipt_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ip_filter = Smaws_Lib.Xml.Parse.required "IpFilter" (( ! ) r_ip_filter) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : receipt_filter)

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

let policy_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_name_of_xml i) ()

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

let identity_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ()

let list_identities_response_of_xml i =
  let r_next_token = ref None in
  let r_identities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Identities" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Identities" ->
          r_identities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> identity_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     identities = Smaws_Lib.Xml.Parse.required "Identities" (( ! ) r_identities) i;
   }
    : list_identities_response)

let identity_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Domain" -> Domain
   | "EmailAddress" -> EmailAddress
   | _ -> failwith "unknown enum value"
    : identity_type)

let list_identities_request_of_xml i =
  let r_max_items = ref None in
  let r_next_token = ref None in
  let r_identity_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxItems"; "NextToken"; "IdentityType" ]
    (fun tag _ ->
      match tag with
      | "MaxItems" ->
          r_max_items :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems" (fun i _ -> max_items_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "IdentityType" ->
          r_identity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityType"
                 (fun i _ -> identity_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_items = ( ! ) r_max_items;
     next_token = ( ! ) r_next_token;
     identity_type = ( ! ) r_identity_type;
   }
    : list_identities_request)

let custom_verification_email_template_of_xml i =
  let r_failure_redirection_ur_l = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_template_subject = ref None in
  let r_from_email_address = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FailureRedirectionURL";
      "SuccessRedirectionURL";
      "TemplateSubject";
      "FromEmailAddress";
      "TemplateName";
    ] (fun tag _ ->
      match tag with
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_redirection_ur_l = ( ! ) r_failure_redirection_ur_l;
     success_redirection_ur_l = ( ! ) r_success_redirection_ur_l;
     template_subject = ( ! ) r_template_subject;
     from_email_address = ( ! ) r_from_email_address;
     template_name = ( ! ) r_template_name;
   }
    : custom_verification_email_template)

let custom_verification_email_templates_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> custom_verification_email_template_of_xml i)
    ()

let list_custom_verification_email_templates_response_of_xml i =
  let r_next_token = ref None in
  let r_custom_verification_email_templates = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "CustomVerificationEmailTemplates" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "CustomVerificationEmailTemplates" ->
          r_custom_verification_email_templates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomVerificationEmailTemplates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> custom_verification_email_template_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     custom_verification_email_templates = ( ! ) r_custom_verification_email_templates;
   }
    : list_custom_verification_email_templates_response)

let max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_custom_verification_email_templates_request_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_results = ( ! ) r_max_results; next_token = ( ! ) r_next_token }
    : list_custom_verification_email_templates_request)

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

let configuration_sets_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> configuration_set_of_xml i) ()

let list_configuration_sets_response_of_xml i =
  let r_next_token = ref None in
  let r_configuration_sets = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ConfigurationSets" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ConfigurationSets" ->
          r_configuration_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_set_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; configuration_sets = ( ! ) r_configuration_sets }
    : list_configuration_sets_response)

let list_configuration_sets_request_of_xml i =
  let r_max_items = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxItems"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxItems" ->
          r_max_items :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems" (fun i _ -> max_items_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_items = ( ! ) r_max_items; next_token = ( ! ) r_next_token }
    : list_configuration_sets_request)

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

let counter_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let send_data_point_of_xml i =
  let r_rejects = ref None in
  let r_complaints = ref None in
  let r_bounces = ref None in
  let r_delivery_attempts = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Rejects"; "Complaints"; "Bounces"; "DeliveryAttempts"; "Timestamp" ] (fun tag _ ->
      match tag with
      | "Rejects" ->
          r_rejects :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rejects" (fun i _ -> counter_of_xml i) ())
      | "Complaints" ->
          r_complaints :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Complaints" (fun i _ -> counter_of_xml i) ())
      | "Bounces" ->
          r_bounces :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Bounces" (fun i _ -> counter_of_xml i) ())
      | "DeliveryAttempts" ->
          r_delivery_attempts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryAttempts"
                 (fun i _ -> counter_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rejects = ( ! ) r_rejects;
     complaints = ( ! ) r_complaints;
     bounces = ( ! ) r_bounces;
     delivery_attempts = ( ! ) r_delivery_attempts;
     timestamp = ( ! ) r_timestamp;
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

let max24_hour_send_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_send_rate_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let sent_last24_hours_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_send_quota_response_of_xml i =
  let r_sent_last24_hours = ref None in
  let r_max_send_rate = ref None in
  let r_max24_hour_send = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SentLast24Hours"; "MaxSendRate"; "Max24HourSend" ]
    (fun tag _ ->
      match tag with
      | "SentLast24Hours" ->
          r_sent_last24_hours :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SentLast24Hours"
                 (fun i _ -> sent_last24_hours_of_xml i)
                 ())
      | "MaxSendRate" ->
          r_max_send_rate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSendRate"
                 (fun i _ -> max_send_rate_of_xml i)
                 ())
      | "Max24HourSend" ->
          r_max24_hour_send :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Max24HourSend"
                 (fun i _ -> max24_hour_send_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sent_last24_hours = ( ! ) r_sent_last24_hours;
     max_send_rate = ( ! ) r_max_send_rate;
     max24_hour_send = ( ! ) r_max24_hour_send;
   }
    : get_send_quota_response)

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

let get_identity_policies_request_of_xml i =
  let r_policy_names = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "Identity" ] (fun tag _ ->
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
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : get_identity_policies_request)

let identity_notification_attributes_of_xml i =
  let r_headers_in_delivery_notifications_enabled = ref None in
  let r_headers_in_complaint_notifications_enabled = ref None in
  let r_headers_in_bounce_notifications_enabled = ref None in
  let r_forwarding_enabled = ref None in
  let r_delivery_topic = ref None in
  let r_complaint_topic = ref None in
  let r_bounce_topic = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "HeadersInDeliveryNotificationsEnabled";
      "HeadersInComplaintNotificationsEnabled";
      "HeadersInBounceNotificationsEnabled";
      "ForwardingEnabled";
      "DeliveryTopic";
      "ComplaintTopic";
      "BounceTopic";
    ] (fun tag _ ->
      match tag with
      | "HeadersInDeliveryNotificationsEnabled" ->
          r_headers_in_delivery_notifications_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeadersInDeliveryNotificationsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "HeadersInComplaintNotificationsEnabled" ->
          r_headers_in_complaint_notifications_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeadersInComplaintNotificationsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "HeadersInBounceNotificationsEnabled" ->
          r_headers_in_bounce_notifications_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HeadersInBounceNotificationsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "ForwardingEnabled" ->
          r_forwarding_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForwardingEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "DeliveryTopic" ->
          r_delivery_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | "ComplaintTopic" ->
          r_complaint_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComplaintTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | "BounceTopic" ->
          r_bounce_topic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BounceTopic"
                 (fun i _ -> notification_topic_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     headers_in_delivery_notifications_enabled = ( ! ) r_headers_in_delivery_notifications_enabled;
     headers_in_complaint_notifications_enabled = ( ! ) r_headers_in_complaint_notifications_enabled;
     headers_in_bounce_notifications_enabled = ( ! ) r_headers_in_bounce_notifications_enabled;
     forwarding_enabled =
       Smaws_Lib.Xml.Parse.required "ForwardingEnabled" (( ! ) r_forwarding_enabled) i;
     delivery_topic = Smaws_Lib.Xml.Parse.required "DeliveryTopic" (( ! ) r_delivery_topic) i;
     complaint_topic = Smaws_Lib.Xml.Parse.required "ComplaintTopic" (( ! ) r_complaint_topic) i;
     bounce_topic = Smaws_Lib.Xml.Parse.required "BounceTopic" (( ! ) r_bounce_topic) i;
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

let custom_mail_from_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TemporaryFailure" -> TemporaryFailure
   | "Failed" -> Failed
   | "Success" -> Success
   | "Pending" -> Pending
   | _ -> failwith "unknown enum value"
    : custom_mail_from_status)

let identity_mail_from_domain_attributes_of_xml i =
  let r_behavior_on_mx_failure = ref None in
  let r_mail_from_domain_status = ref None in
  let r_mail_from_domain = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "BehaviorOnMXFailure"; "MailFromDomainStatus"; "MailFromDomain" ] (fun tag _ ->
      match tag with
      | "BehaviorOnMXFailure" ->
          r_behavior_on_mx_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BehaviorOnMXFailure"
                 (fun i _ -> behavior_on_mx_failure_of_xml i)
                 ())
      | "MailFromDomainStatus" ->
          r_mail_from_domain_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomainStatus"
                 (fun i _ -> custom_mail_from_status_of_xml i)
                 ())
      | "MailFromDomain" ->
          r_mail_from_domain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MailFromDomain"
                 (fun i _ -> mail_from_domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     behavior_on_mx_failure =
       Smaws_Lib.Xml.Parse.required "BehaviorOnMXFailure" (( ! ) r_behavior_on_mx_failure) i;
     mail_from_domain_status =
       Smaws_Lib.Xml.Parse.required "MailFromDomainStatus" (( ! ) r_mail_from_domain_status) i;
     mail_from_domain = Smaws_Lib.Xml.Parse.required "MailFromDomain" (( ! ) r_mail_from_domain) i;
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

let identity_dkim_attributes_of_xml i =
  let r_dkim_tokens = ref None in
  let r_dkim_verification_status = ref None in
  let r_dkim_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DkimTokens"; "DkimVerificationStatus"; "DkimEnabled" ] (fun tag _ ->
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
      | "DkimVerificationStatus" ->
          r_dkim_verification_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimVerificationStatus"
                 (fun i _ -> verification_status_of_xml i)
                 ())
      | "DkimEnabled" ->
          r_dkim_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DkimEnabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dkim_tokens = ( ! ) r_dkim_tokens;
     dkim_verification_status =
       Smaws_Lib.Xml.Parse.required "DkimVerificationStatus" (( ! ) r_dkim_verification_status) i;
     dkim_enabled = Smaws_Lib.Xml.Parse.required "DkimEnabled" (( ! ) r_dkim_enabled) i;
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

let get_custom_verification_email_template_response_of_xml i =
  let r_failure_redirection_ur_l = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_template_content = ref None in
  let r_template_subject = ref None in
  let r_from_email_address = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FailureRedirectionURL";
      "SuccessRedirectionURL";
      "TemplateContent";
      "TemplateSubject";
      "FromEmailAddress";
      "TemplateName";
    ] (fun tag _ ->
      match tag with
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "TemplateContent" ->
          r_template_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateContent"
                 (fun i _ -> template_content_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_redirection_ur_l = ( ! ) r_failure_redirection_ur_l;
     success_redirection_ur_l = ( ! ) r_success_redirection_ur_l;
     template_content = ( ! ) r_template_content;
     template_subject = ( ! ) r_template_subject;
     from_email_address = ( ! ) r_from_email_address;
     template_name = ( ! ) r_template_name;
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

let get_account_sending_enabled_response_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> enabled_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : get_account_sending_enabled_response)

let receipt_rules_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> receipt_rule_of_xml i) ()

let describe_receipt_rule_set_response_of_xml i =
  let r_rules = ref None in
  let r_metadata = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rules"; "Metadata" ] (fun tag _ ->
      match tag with
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_of_xml i)
                     ())
                 ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata"
                 (fun i _ -> receipt_rule_set_metadata_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rules = ( ! ) r_rules; metadata = ( ! ) r_metadata } : describe_receipt_rule_set_response)

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
  let r_rule_name = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleName"; "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : describe_receipt_rule_request)

let event_destinations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_destination_of_xml i) ()

let last_fresh_start_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let reputation_options_of_xml i =
  let r_last_fresh_start = ref None in
  let r_reputation_metrics_enabled = ref None in
  let r_sending_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LastFreshStart"; "ReputationMetricsEnabled"; "SendingEnabled" ] (fun tag _ ->
      match tag with
      | "LastFreshStart" ->
          r_last_fresh_start :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastFreshStart"
                 (fun i _ -> last_fresh_start_of_xml i)
                 ())
      | "ReputationMetricsEnabled" ->
          r_reputation_metrics_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReputationMetricsEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | "SendingEnabled" ->
          r_sending_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SendingEnabled"
                 (fun i _ -> enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_fresh_start = ( ! ) r_last_fresh_start;
     reputation_metrics_enabled = ( ! ) r_reputation_metrics_enabled;
     sending_enabled = ( ! ) r_sending_enabled;
   }
    : reputation_options)

let describe_configuration_set_response_of_xml i =
  let r_reputation_options = ref None in
  let r_delivery_options = ref None in
  let r_tracking_options = ref None in
  let r_event_destinations = ref None in
  let r_configuration_set = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReputationOptions";
      "DeliveryOptions";
      "TrackingOptions";
      "EventDestinations";
      "ConfigurationSet";
    ] (fun tag _ ->
      match tag with
      | "ReputationOptions" ->
          r_reputation_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReputationOptions"
                 (fun i _ -> reputation_options_of_xml i)
                 ())
      | "DeliveryOptions" ->
          r_delivery_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryOptions"
                 (fun i _ -> delivery_options_of_xml i)
                 ())
      | "TrackingOptions" ->
          r_tracking_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackingOptions"
                 (fun i _ -> tracking_options_of_xml i)
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
      | "ConfigurationSet" ->
          r_configuration_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSet"
                 (fun i _ -> configuration_set_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reputation_options = ( ! ) r_reputation_options;
     delivery_options = ( ! ) r_delivery_options;
     tracking_options = ( ! ) r_tracking_options;
     event_destinations = ( ! ) r_event_destinations;
     configuration_set = ( ! ) r_configuration_set;
   }
    : describe_configuration_set_response)

let configuration_set_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "reputationOptions" -> REPUTATION_OPTIONS
   | "deliveryOptions" -> DELIVERY_OPTIONS
   | "trackingOptions" -> TRACKING_OPTIONS
   | "eventDestinations" -> EVENT_DESTINATIONS
   | _ -> failwith "unknown enum value"
    : configuration_set_attribute)

let configuration_set_attribute_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> configuration_set_attribute_of_xml i) ()

let describe_configuration_set_request_of_xml i =
  let r_configuration_set_attribute_names = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConfigurationSetAttributeNames"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "ConfigurationSetAttributeNames" ->
          r_configuration_set_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetAttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_set_attribute_of_xml i)
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
     configuration_set_attribute_names = ( ! ) r_configuration_set_attribute_names;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : describe_configuration_set_request)

let describe_active_receipt_rule_set_response_of_xml i =
  let r_rules = ref None in
  let r_metadata = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rules"; "Metadata" ] (fun tag _ ->
      match tag with
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> receipt_rule_of_xml i)
                     ())
                 ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata"
                 (fun i _ -> receipt_rule_set_metadata_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rules = ( ! ) r_rules; metadata = ( ! ) r_metadata }
    : describe_active_receipt_rule_set_response)

let describe_active_receipt_rule_set_request_of_xml i = ()

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

let cannot_delete_exception_of_xml i =
  let r_message = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "Name" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; name = ( ! ) r_name } : cannot_delete_exception)

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

let delete_receipt_rule_response_of_xml i = ()

let delete_receipt_rule_request_of_xml i =
  let r_rule_name = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleName"; "RuleSetName" ] (fun tag _ ->
      match tag with
      | "RuleName" ->
          r_rule_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleName"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule_name = Smaws_Lib.Xml.Parse.required "RuleName" (( ! ) r_rule_name) i;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : delete_receipt_rule_request)

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

let delete_identity_policy_response_of_xml i = ()

let delete_identity_policy_request_of_xml i =
  let r_policy_name = ref None in
  let r_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyName"; "Identity" ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "Identity" ->
          r_identity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Identity" (fun i _ -> identity_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     identity = Smaws_Lib.Xml.Parse.required "Identity" (( ! ) r_identity) i;
   }
    : delete_identity_policy_request)

let delete_identity_response_of_xml i = ()

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

let delete_configuration_set_event_destination_response_of_xml i = ()

let delete_configuration_set_event_destination_request_of_xml i =
  let r_event_destination_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventDestinationName"; "ConfigurationSetName" ]
    (fun tag _ ->
      match tag with
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_destination_name =
       Smaws_Lib.Xml.Parse.required "EventDestinationName" (( ! ) r_event_destination_name) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : delete_configuration_set_event_destination_request)

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

let already_exists_exception_of_xml i =
  let r_message = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "Name" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> rule_or_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; name = ( ! ) r_name } : already_exists_exception)

let create_template_response_of_xml i = ()

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

let create_receipt_rule_response_of_xml i = ()

let create_receipt_rule_request_of_xml i =
  let r_rule = ref None in
  let r_after = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rule"; "After"; "RuleSetName" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Rule" (fun i _ -> receipt_rule_of_xml i) ())
      | "After" ->
          r_after :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "After"
                 (fun i _ -> receipt_rule_name_of_xml i)
                 ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rule = Smaws_Lib.Xml.Parse.required "Rule" (( ! ) r_rule) i;
     after = ( ! ) r_after;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : create_receipt_rule_request)

let create_receipt_filter_response_of_xml i = ()

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

let custom_verification_email_template_already_exists_exception_of_xml i =
  let r_message = ref None in
  let r_custom_verification_email_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "CustomVerificationEmailTemplateName" ]
    (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "CustomVerificationEmailTemplateName" ->
          r_custom_verification_email_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomVerificationEmailTemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     custom_verification_email_template_name = ( ! ) r_custom_verification_email_template_name;
   }
    : custom_verification_email_template_already_exists_exception)

let create_custom_verification_email_template_request_of_xml i =
  let r_failure_redirection_ur_l = ref None in
  let r_success_redirection_ur_l = ref None in
  let r_template_content = ref None in
  let r_template_subject = ref None in
  let r_from_email_address = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FailureRedirectionURL";
      "SuccessRedirectionURL";
      "TemplateContent";
      "TemplateSubject";
      "FromEmailAddress";
      "TemplateName";
    ] (fun tag _ ->
      match tag with
      | "FailureRedirectionURL" ->
          r_failure_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureRedirectionURL"
                 (fun i _ -> failure_redirection_ur_l_of_xml i)
                 ())
      | "SuccessRedirectionURL" ->
          r_success_redirection_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuccessRedirectionURL"
                 (fun i _ -> success_redirection_ur_l_of_xml i)
                 ())
      | "TemplateContent" ->
          r_template_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateContent"
                 (fun i _ -> template_content_of_xml i)
                 ())
      | "TemplateSubject" ->
          r_template_subject :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSubject"
                 (fun i _ -> subject_of_xml i)
                 ())
      | "FromEmailAddress" ->
          r_from_email_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromEmailAddress"
                 (fun i _ -> from_address_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_redirection_ur_l =
       Smaws_Lib.Xml.Parse.required "FailureRedirectionURL" (( ! ) r_failure_redirection_ur_l) i;
     success_redirection_ur_l =
       Smaws_Lib.Xml.Parse.required "SuccessRedirectionURL" (( ! ) r_success_redirection_ur_l) i;
     template_content = Smaws_Lib.Xml.Parse.required "TemplateContent" (( ! ) r_template_content) i;
     template_subject = Smaws_Lib.Xml.Parse.required "TemplateSubject" (( ! ) r_template_subject) i;
     from_email_address =
       Smaws_Lib.Xml.Parse.required "FromEmailAddress" (( ! ) r_from_email_address) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
   }
    : create_custom_verification_email_template_request)

let create_configuration_set_tracking_options_response_of_xml i = ()

let create_configuration_set_tracking_options_request_of_xml i =
  let r_tracking_options = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrackingOptions"; "ConfigurationSetName" ]
    (fun tag _ ->
      match tag with
      | "TrackingOptions" ->
          r_tracking_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackingOptions"
                 (fun i _ -> tracking_options_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tracking_options = Smaws_Lib.Xml.Parse.required "TrackingOptions" (( ! ) r_tracking_options) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : create_configuration_set_tracking_options_request)

let event_destination_already_exists_exception_of_xml i =
  let r_message = ref None in
  let r_event_destination_name = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "message"; "EventDestinationName"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "EventDestinationName" ->
          r_event_destination_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestinationName"
                 (fun i _ -> event_destination_name_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     event_destination_name = ( ! ) r_event_destination_name;
     configuration_set_name = ( ! ) r_configuration_set_name;
   }
    : event_destination_already_exists_exception)

let create_configuration_set_event_destination_response_of_xml i = ()

let create_configuration_set_event_destination_request_of_xml i =
  let r_event_destination = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventDestination"; "ConfigurationSetName" ]
    (fun tag _ ->
      match tag with
      | "EventDestination" ->
          r_event_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDestination"
                 (fun i _ -> event_destination_of_xml i)
                 ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_destination =
       Smaws_Lib.Xml.Parse.required "EventDestination" (( ! ) r_event_destination) i;
     configuration_set_name =
       Smaws_Lib.Xml.Parse.required "ConfigurationSetName" (( ! ) r_configuration_set_name) i;
   }
    : create_configuration_set_event_destination_request)

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

let configuration_set_already_exists_exception_of_xml i =
  let r_message = ref None in
  let r_configuration_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message"; "ConfigurationSetName" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> error_message_of_xml i) ())
      | "ConfigurationSetName" ->
          r_configuration_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSetName"
                 (fun i _ -> configuration_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; configuration_set_name = ( ! ) r_configuration_set_name }
    : configuration_set_already_exists_exception)

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

let clone_receipt_rule_set_response_of_xml i = ()

let clone_receipt_rule_set_request_of_xml i =
  let r_original_rule_set_name = ref None in
  let r_rule_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OriginalRuleSetName"; "RuleSetName" ]
    (fun tag _ ->
      match tag with
      | "OriginalRuleSetName" ->
          r_original_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalRuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | "RuleSetName" ->
          r_rule_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleSetName"
                 (fun i _ -> receipt_rule_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     original_rule_set_name =
       Smaws_Lib.Xml.Parse.required "OriginalRuleSetName" (( ! ) r_original_rule_set_name) i;
     rule_set_name = Smaws_Lib.Xml.Parse.required "RuleSetName" (( ! ) r_rule_set_name) i;
   }
    : clone_receipt_rule_set_request)
