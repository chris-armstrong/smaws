open Types
let unit_of_xml _ = ()
let web_identity_subject_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let user_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let user_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let url_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let unrestricted_session_policy_document_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i
let token_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let token_code_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_value_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Value"; "Key"]
    (fun tag _ ->
       match tag with
       | "Value" ->
           r_value :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                   (fun i _ -> tag_value_type_of_xml i) ()))
       | "Key" ->
           r_key :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Key"
                   (fun i _ -> tag_key_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = (Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i);
     key = (Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i)
   } : tag)
let tag_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()
let tag_key_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> tag_key_type_of_xml i) ()
let source_identity_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let session_policy_document_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let serial_number_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let role_session_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let role_duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)
let region_disabled_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let arn_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let policy_descriptor_type_of_xml i =
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["arn"]
    (fun tag _ ->
       match tag with
       | "arn" ->
           r_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "arn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = (( ! ) r_arn) } : policy_descriptor_type)
let policy_descriptor_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> policy_descriptor_type_of_xml i) ()
let packed_policy_too_large_message_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i
let non_negative_integer_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)
let malformed_policy_document_message_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i
let invalid_identity_token_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let invalid_authorization_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let idp_rejected_claim_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let idp_communication_error_message_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i
let federated_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let external_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let expired_identity_token_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let encoded_message_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)
let decoded_message_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let date_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)
let context_assertion_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let client_token_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let assumed_role_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let account_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let access_key_secret_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let access_key_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let target_principal_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let saml_assertion_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let root_duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)
let region_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> region_disabled_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : region_disabled_exception)
let provided_context_of_xml i =
  let r_context_assertion = ref None in
  let r_provider_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["ContextAssertion"; "ProviderArn"]
    (fun tag _ ->
       match tag with
       | "ContextAssertion" ->
           r_context_assertion :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ContextAssertion"
                   (fun i _ -> context_assertion_type_of_xml i) ()))
       | "ProviderArn" ->
           r_provider_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ProviderArn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     context_assertion = (( ! ) r_context_assertion);
     provider_arn = (( ! ) r_provider_arn)
   } : provided_context)
let provided_contexts_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> provided_context_of_xml i) ()
let packed_policy_too_large_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> packed_policy_too_large_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : packed_policy_too_large_exception)
let name_qualifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let malformed_policy_document_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> malformed_policy_document_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : malformed_policy_document_exception)
let issuer_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let invalid_identity_token_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> invalid_identity_token_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : invalid_identity_token_exception)
let invalid_authorization_message_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> invalid_authorization_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : invalid_authorization_message_exception)
let idp_rejected_claim_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> idp_rejected_claim_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : idp_rejected_claim_exception)
let idp_communication_error_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> idp_communication_error_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : idp_communication_error_exception)
let credentials_of_xml i =
  let r_expiration = ref None in
  let r_session_token = ref None in
  let r_secret_access_key = ref None in
  let r_access_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["Expiration"; "SessionToken"; "SecretAccessKey"; "AccessKeyId"]
    (fun tag _ ->
       match tag with
       | "Expiration" ->
           r_expiration :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration"
                   (fun i _ -> date_type_of_xml i) ()))
       | "SessionToken" ->
           r_session_token :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SessionToken"
                   (fun i _ -> token_type_of_xml i) ()))
       | "SecretAccessKey" ->
           r_secret_access_key :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SecretAccessKey"
                   (fun i _ -> access_key_secret_type_of_xml i) ()))
       | "AccessKeyId" ->
           r_access_key_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                   (fun i _ -> access_key_id_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expiration =
       (Smaws_Lib.Xml.Parse.required "Expiration" (( ! ) r_expiration) i);
     session_token =
       (Smaws_Lib.Xml.Parse.required "SessionToken" (( ! ) r_session_token) i);
     secret_access_key =
       (Smaws_Lib.Xml.Parse.required "SecretAccessKey"
          (( ! ) r_secret_access_key) i);
     access_key_id =
       (Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i)
   } : credentials)
let get_session_token_response_of_xml i =
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Credentials"]
    (fun tag _ ->
       match tag with
       | "Credentials" ->
           r_credentials :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                   (fun i _ -> credentials_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ credentials = (( ! ) r_credentials) } : get_session_token_response)
let get_session_token_request_of_xml i =
  let r_token_code = ref None in
  let r_serial_number = ref None in
  let r_duration_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["TokenCode"; "SerialNumber"; "DurationSeconds"]
    (fun tag _ ->
       match tag with
       | "TokenCode" ->
           r_token_code :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "TokenCode"
                   (fun i _ -> token_code_type_of_xml i) ()))
       | "SerialNumber" ->
           r_serial_number :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                   (fun i _ -> serial_number_type_of_xml i) ()))
       | "DurationSeconds" ->
           r_duration_seconds :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                   (fun i _ -> duration_seconds_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     token_code = (( ! ) r_token_code);
     serial_number = (( ! ) r_serial_number);
     duration_seconds = (( ! ) r_duration_seconds)
   } : get_session_token_request)
let federated_user_of_xml i =
  let r_arn = ref None in
  let r_federated_user_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Arn"; "FederatedUserId"]
    (fun tag _ ->
       match tag with
       | "Arn" ->
           r_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | "FederatedUserId" ->
           r_federated_user_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "FederatedUserId"
                   (fun i _ -> federated_id_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = (Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i);
     federated_user_id =
       (Smaws_Lib.Xml.Parse.required "FederatedUserId"
          (( ! ) r_federated_user_id) i)
   } : federated_user)
let get_federation_token_response_of_xml i =
  let r_packed_policy_size = ref None in
  let r_federated_user = ref None in
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["PackedPolicySize"; "FederatedUser"; "Credentials"]
    (fun tag _ ->
       match tag with
       | "PackedPolicySize" ->
           r_packed_policy_size :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                   (fun i _ -> non_negative_integer_type_of_xml i) ()))
       | "FederatedUser" ->
           r_federated_user :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "FederatedUser"
                   (fun i _ -> federated_user_of_xml i) ()))
       | "Credentials" ->
           r_credentials :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                   (fun i _ -> credentials_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     packed_policy_size = (( ! ) r_packed_policy_size);
     federated_user = (( ! ) r_federated_user);
     credentials = (( ! ) r_credentials)
   } : get_federation_token_response)
let get_federation_token_request_of_xml i =
  let r_tags = ref None in
  let r_duration_seconds = ref None in
  let r_policy_arns = ref None in
  let r_policy = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["Tags"; "DurationSeconds"; "PolicyArns"; "Policy"; "Name"]
    (fun tag _ ->
       match tag with
       | "Tags" ->
           r_tags :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> tag_of_xml i) ()) ()))
       | "DurationSeconds" ->
           r_duration_seconds :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                   (fun i _ -> duration_seconds_type_of_xml i) ()))
       | "PolicyArns" ->
           r_policy_arns :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> policy_descriptor_type_of_xml i) ()) ()))
       | "Policy" ->
           r_policy :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                   (fun i _ -> session_policy_document_type_of_xml i) ()))
       | "Name" ->
           r_name :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                   (fun i _ -> user_name_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = (( ! ) r_tags);
     duration_seconds = (( ! ) r_duration_seconds);
     policy_arns = (( ! ) r_policy_arns);
     policy = (( ! ) r_policy);
     name = (Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i)
   } : get_federation_token_request)
let get_caller_identity_response_of_xml i =
  let r_arn = ref None in
  let r_account = ref None in
  let r_user_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Arn"; "Account"; "UserId"]
    (fun tag _ ->
       match tag with
       | "Arn" ->
           r_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | "Account" ->
           r_account :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Account"
                   (fun i _ -> account_type_of_xml i) ()))
       | "UserId" ->
           r_user_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "UserId"
                   (fun i _ -> user_id_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = (( ! ) r_arn);
     account = (( ! ) r_account);
     user_id = (( ! ) r_user_id)
   } : get_caller_identity_response)
let get_caller_identity_request_of_xml i = ()
let get_access_key_info_response_of_xml i =
  let r_account = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Account"]
    (fun tag _ ->
       match tag with
       | "Account" ->
           r_account :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Account"
                   (fun i _ -> account_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account = (( ! ) r_account) } : get_access_key_info_response)
let get_access_key_info_request_of_xml i =
  let r_access_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["AccessKeyId"]
    (fun tag _ ->
       match tag with
       | "AccessKeyId" ->
           r_access_key_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                   (fun i _ -> access_key_id_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     access_key_id =
       (Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i)
   } : get_access_key_info_request)
let expired_token_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["message"]
    (fun tag _ ->
       match tag with
       | "message" ->
           r_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                   (fun i _ -> expired_identity_token_message_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : expired_token_exception)
let decode_authorization_message_response_of_xml i =
  let r_decoded_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["DecodedMessage"]
    (fun tag _ ->
       match tag with
       | "DecodedMessage" ->
           r_decoded_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DecodedMessage"
                   (fun i _ -> decoded_message_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ decoded_message = (( ! ) r_decoded_message) } : decode_authorization_message_response)
let decode_authorization_message_request_of_xml i =
  let r_encoded_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["EncodedMessage"]
    (fun tag _ ->
       match tag with
       | "EncodedMessage" ->
           r_encoded_message :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "EncodedMessage"
                   (fun i _ -> encoded_message_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     encoded_message =
       (Smaws_Lib.Xml.Parse.required "EncodedMessage"
          (( ! ) r_encoded_message) i)
   } : decode_authorization_message_request)
let audience_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let assumed_role_user_of_xml i =
  let r_arn = ref None in
  let r_assumed_role_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Arn"; "AssumedRoleId"]
    (fun tag _ ->
       match tag with
       | "Arn" ->
           r_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | "AssumedRoleId" ->
           r_assumed_role_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleId"
                   (fun i _ -> assumed_role_id_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = (Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i);
     assumed_role_id =
       (Smaws_Lib.Xml.Parse.required "AssumedRoleId"
          (( ! ) r_assumed_role_id) i)
   } : assumed_role_user)
let assume_root_response_of_xml i =
  let r_source_identity = ref None in
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["SourceIdentity"; "Credentials"]
    (fun tag _ ->
       match tag with
       | "SourceIdentity" ->
           r_source_identity :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                   (fun i _ -> source_identity_type_of_xml i) ()))
       | "Credentials" ->
           r_credentials :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                   (fun i _ -> credentials_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identity = (( ! ) r_source_identity);
     credentials = (( ! ) r_credentials)
   } : assume_root_response)
let assume_root_request_of_xml i =
  let r_duration_seconds = ref None in
  let r_task_policy_arn = ref None in
  let r_target_principal = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["DurationSeconds"; "TaskPolicyArn"; "TargetPrincipal"]
    (fun tag _ ->
       match tag with
       | "DurationSeconds" ->
           r_duration_seconds :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                   (fun i _ -> root_duration_seconds_type_of_xml i) ()))
       | "TaskPolicyArn" ->
           r_task_policy_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "TaskPolicyArn"
                   (fun i _ -> policy_descriptor_type_of_xml i) ()))
       | "TargetPrincipal" ->
           r_target_principal :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "TargetPrincipal"
                   (fun i _ -> target_principal_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     duration_seconds = (( ! ) r_duration_seconds);
     task_policy_arn =
       (Smaws_Lib.Xml.Parse.required "TaskPolicyArn"
          (( ! ) r_task_policy_arn) i);
     target_principal =
       (Smaws_Lib.Xml.Parse.required "TargetPrincipal"
          (( ! ) r_target_principal) i)
   } : assume_root_request)
let assume_role_with_web_identity_response_of_xml i =
  let r_source_identity = ref None in
  let r_audience = ref None in
  let r_provider = ref None in
  let r_packed_policy_size = ref None in
  let r_assumed_role_user = ref None in
  let r_subject_from_web_identity_token = ref None in
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["SourceIdentity";
    "Audience";
    "Provider";
    "PackedPolicySize";
    "AssumedRoleUser";
    "SubjectFromWebIdentityToken";
    "Credentials"]
    (fun tag _ ->
       match tag with
       | "SourceIdentity" ->
           r_source_identity :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                   (fun i _ -> source_identity_type_of_xml i) ()))
       | "Audience" ->
           r_audience :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Audience"
                   (fun i _ -> audience_of_xml i) ()))
       | "Provider" ->
           r_provider :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Provider"
                   (fun i _ -> issuer_of_xml i) ()))
       | "PackedPolicySize" ->
           r_packed_policy_size :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                   (fun i _ -> non_negative_integer_type_of_xml i) ()))
       | "AssumedRoleUser" ->
           r_assumed_role_user :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleUser"
                   (fun i _ -> assumed_role_user_of_xml i) ()))
       | "SubjectFromWebIdentityToken" ->
           r_subject_from_web_identity_token :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i
                   "SubjectFromWebIdentityToken"
                   (fun i _ -> web_identity_subject_type_of_xml i) ()))
       | "Credentials" ->
           r_credentials :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                   (fun i _ -> credentials_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identity = (( ! ) r_source_identity);
     audience = (( ! ) r_audience);
     provider = (( ! ) r_provider);
     packed_policy_size = (( ! ) r_packed_policy_size);
     assumed_role_user = (( ! ) r_assumed_role_user);
     subject_from_web_identity_token =
       (( ! ) r_subject_from_web_identity_token);
     credentials = (( ! ) r_credentials)
   } : assume_role_with_web_identity_response)
let assume_role_with_web_identity_request_of_xml i =
  let r_duration_seconds = ref None in
  let r_policy = ref None in
  let r_policy_arns = ref None in
  let r_provider_id = ref None in
  let r_web_identity_token = ref None in
  let r_role_session_name = ref None in
  let r_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["DurationSeconds";
    "Policy";
    "PolicyArns";
    "ProviderId";
    "WebIdentityToken";
    "RoleSessionName";
    "RoleArn"]
    (fun tag _ ->
       match tag with
       | "DurationSeconds" ->
           r_duration_seconds :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                   (fun i _ -> role_duration_seconds_type_of_xml i) ()))
       | "Policy" ->
           r_policy :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                   (fun i _ -> session_policy_document_type_of_xml i) ()))
       | "PolicyArns" ->
           r_policy_arns :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> policy_descriptor_type_of_xml i) ()) ()))
       | "ProviderId" ->
           r_provider_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ProviderId"
                   (fun i _ -> url_type_of_xml i) ()))
       | "WebIdentityToken" ->
           r_web_identity_token :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "WebIdentityToken"
                   (fun i _ -> client_token_type_of_xml i) ()))
       | "RoleSessionName" ->
           r_role_session_name :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "RoleSessionName"
                   (fun i _ -> role_session_name_type_of_xml i) ()))
       | "RoleArn" ->
           r_role_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     duration_seconds = (( ! ) r_duration_seconds);
     policy = (( ! ) r_policy);
     policy_arns = (( ! ) r_policy_arns);
     provider_id = (( ! ) r_provider_id);
     web_identity_token =
       (Smaws_Lib.Xml.Parse.required "WebIdentityToken"
          (( ! ) r_web_identity_token) i);
     role_session_name =
       (Smaws_Lib.Xml.Parse.required "RoleSessionName"
          (( ! ) r_role_session_name) i);
     role_arn = (Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i)
   } : assume_role_with_web_identity_request)
let assume_role_with_saml_response_of_xml i =
  let r_source_identity = ref None in
  let r_name_qualifier = ref None in
  let r_audience = ref None in
  let r_issuer = ref None in
  let r_subject_type = ref None in
  let r_subject = ref None in
  let r_packed_policy_size = ref None in
  let r_assumed_role_user = ref None in
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["SourceIdentity";
    "NameQualifier";
    "Audience";
    "Issuer";
    "SubjectType";
    "Subject";
    "PackedPolicySize";
    "AssumedRoleUser";
    "Credentials"]
    (fun tag _ ->
       match tag with
       | "SourceIdentity" ->
           r_source_identity :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                   (fun i _ -> source_identity_type_of_xml i) ()))
       | "NameQualifier" ->
           r_name_qualifier :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "NameQualifier"
                   (fun i _ -> name_qualifier_of_xml i) ()))
       | "Audience" ->
           r_audience :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Audience"
                   (fun i _ -> audience_of_xml i) ()))
       | "Issuer" ->
           r_issuer :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Issuer"
                   (fun i _ -> issuer_of_xml i) ()))
       | "SubjectType" ->
           r_subject_type :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SubjectType"
                   (fun i _ -> subject_type_of_xml i) ()))
       | "Subject" ->
           r_subject :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Subject"
                   (fun i _ -> subject_of_xml i) ()))
       | "PackedPolicySize" ->
           r_packed_policy_size :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                   (fun i _ -> non_negative_integer_type_of_xml i) ()))
       | "AssumedRoleUser" ->
           r_assumed_role_user :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleUser"
                   (fun i _ -> assumed_role_user_of_xml i) ()))
       | "Credentials" ->
           r_credentials :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                   (fun i _ -> credentials_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identity = (( ! ) r_source_identity);
     name_qualifier = (( ! ) r_name_qualifier);
     audience = (( ! ) r_audience);
     issuer = (( ! ) r_issuer);
     subject_type = (( ! ) r_subject_type);
     subject = (( ! ) r_subject);
     packed_policy_size = (( ! ) r_packed_policy_size);
     assumed_role_user = (( ! ) r_assumed_role_user);
     credentials = (( ! ) r_credentials)
   } : assume_role_with_saml_response)
let assume_role_with_saml_request_of_xml i =
  let r_duration_seconds = ref None in
  let r_policy = ref None in
  let r_policy_arns = ref None in
  let r_saml_assertion = ref None in
  let r_principal_arn = ref None in
  let r_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["DurationSeconds";
    "Policy";
    "PolicyArns";
    "SAMLAssertion";
    "PrincipalArn";
    "RoleArn"]
    (fun tag _ ->
       match tag with
       | "DurationSeconds" ->
           r_duration_seconds :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                   (fun i _ -> role_duration_seconds_type_of_xml i) ()))
       | "Policy" ->
           r_policy :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                   (fun i _ -> session_policy_document_type_of_xml i) ()))
       | "PolicyArns" ->
           r_policy_arns :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> policy_descriptor_type_of_xml i) ()) ()))
       | "SAMLAssertion" ->
           r_saml_assertion :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLAssertion"
                   (fun i _ -> saml_assertion_type_of_xml i) ()))
       | "PrincipalArn" ->
           r_principal_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PrincipalArn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | "RoleArn" ->
           r_role_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     duration_seconds = (( ! ) r_duration_seconds);
     policy = (( ! ) r_policy);
     policy_arns = (( ! ) r_policy_arns);
     saml_assertion =
       (Smaws_Lib.Xml.Parse.required "SAMLAssertion" (( ! ) r_saml_assertion)
          i);
     principal_arn =
       (Smaws_Lib.Xml.Parse.required "PrincipalArn" (( ! ) r_principal_arn) i);
     role_arn = (Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i)
   } : assume_role_with_saml_request)
let assume_role_response_of_xml i =
  let r_source_identity = ref None in
  let r_packed_policy_size = ref None in
  let r_assumed_role_user = ref None in
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["SourceIdentity"; "PackedPolicySize"; "AssumedRoleUser"; "Credentials"]
    (fun tag _ ->
       match tag with
       | "SourceIdentity" ->
           r_source_identity :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                   (fun i _ -> source_identity_type_of_xml i) ()))
       | "PackedPolicySize" ->
           r_packed_policy_size :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                   (fun i _ -> non_negative_integer_type_of_xml i) ()))
       | "AssumedRoleUser" ->
           r_assumed_role_user :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleUser"
                   (fun i _ -> assumed_role_user_of_xml i) ()))
       | "Credentials" ->
           r_credentials :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                   (fun i _ -> credentials_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identity = (( ! ) r_source_identity);
     packed_policy_size = (( ! ) r_packed_policy_size);
     assumed_role_user = (( ! ) r_assumed_role_user);
     credentials = (( ! ) r_credentials)
   } : assume_role_response)
let assume_role_request_of_xml i =
  let r_provided_contexts = ref None in
  let r_source_identity = ref None in
  let r_token_code = ref None in
  let r_serial_number = ref None in
  let r_external_id = ref None in
  let r_transitive_tag_keys = ref None in
  let r_tags = ref None in
  let r_duration_seconds = ref None in
  let r_policy = ref None in
  let r_policy_arns = ref None in
  let r_role_session_name = ref None in
  let r_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["ProvidedContexts";
    "SourceIdentity";
    "TokenCode";
    "SerialNumber";
    "ExternalId";
    "TransitiveTagKeys";
    "Tags";
    "DurationSeconds";
    "Policy";
    "PolicyArns";
    "RoleSessionName";
    "RoleArn"]
    (fun tag _ ->
       match tag with
       | "ProvidedContexts" ->
           r_provided_contexts :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ProvidedContexts"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> provided_context_of_xml i) ()) ()))
       | "SourceIdentity" ->
           r_source_identity :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                   (fun i _ -> source_identity_type_of_xml i) ()))
       | "TokenCode" ->
           r_token_code :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "TokenCode"
                   (fun i _ -> token_code_type_of_xml i) ()))
       | "SerialNumber" ->
           r_serial_number :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                   (fun i _ -> serial_number_type_of_xml i) ()))
       | "ExternalId" ->
           r_external_id :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ExternalId"
                   (fun i _ -> external_id_type_of_xml i) ()))
       | "TransitiveTagKeys" ->
           r_transitive_tag_keys :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "TransitiveTagKeys"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> tag_key_type_of_xml i) ()) ()))
       | "Tags" ->
           r_tags :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> tag_of_xml i) ()) ()))
       | "DurationSeconds" ->
           r_duration_seconds :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                   (fun i _ -> role_duration_seconds_type_of_xml i) ()))
       | "Policy" ->
           r_policy :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                   (fun i _ ->
                      unrestricted_session_policy_document_type_of_xml i) ()))
       | "PolicyArns" ->
           r_policy_arns :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ -> policy_descriptor_type_of_xml i) ()) ()))
       | "RoleSessionName" ->
           r_role_session_name :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "RoleSessionName"
                   (fun i _ -> role_session_name_type_of_xml i) ()))
       | "RoleArn" ->
           r_role_arn :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn"
                   (fun i _ -> arn_type_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     provided_contexts = (( ! ) r_provided_contexts);
     source_identity = (( ! ) r_source_identity);
     token_code = (( ! ) r_token_code);
     serial_number = (( ! ) r_serial_number);
     external_id = (( ! ) r_external_id);
     transitive_tag_keys = (( ! ) r_transitive_tag_keys);
     tags = (( ! ) r_tags);
     duration_seconds = (( ! ) r_duration_seconds);
     policy = (( ! ) r_policy);
     policy_arns = (( ! ) r_policy_arns);
     role_session_name =
       (Smaws_Lib.Xml.Parse.required "RoleSessionName"
          (( ! ) r_role_session_name) i);
     role_arn = (Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i)
   } : assume_role_request)