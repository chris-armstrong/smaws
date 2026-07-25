open Types

let unit_of_xml _ = ()
let session_duration_escalation_exception2_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let session_duration_escalation_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> session_duration_escalation_exception2_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : session_duration_escalation_exception)

let outbound_web_identity_federation_disabled_exception2_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let outbound_web_identity_federation_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> outbound_web_identity_federation_disabled_exception2_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : outbound_web_identity_federation_disabled_exception)

let jwt_payload_size_exceeded_exception2_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let jwt_payload_size_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> jwt_payload_size_exceeded_exception2_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : jwt_payload_size_exceeded_exception)

let date_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let web_identity_token_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_web_identity_token_response_of_xml i =
  let r_web_identity_token = ref None in
  let r_expiration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "WebIdentityToken"; "Expiration" ] (fun tag _ ->
      match tag with
      | "WebIdentityToken" ->
          r_web_identity_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WebIdentityToken"
                 (fun i _ -> web_identity_token_type_of_xml i)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ web_identity_token = ( ! ) r_web_identity_token; expiration = ( ! ) r_expiration }
    : get_web_identity_token_response)

let tag_value_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_key = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_type_of_xml i) ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : tag)

let tag_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let jwt_algorithm_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let web_identity_token_duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let web_identity_token_audience_string_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let web_identity_token_audience_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> web_identity_token_audience_string_type_of_xml i)
    ()

let get_web_identity_token_request_of_xml i =
  let r_audience = ref None in
  let r_duration_seconds = ref None in
  let r_signing_algorithm = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Audience"; "DurationSeconds"; "SigningAlgorithm"; "Tags" ] (fun tag _ ->
      match tag with
      | "Audience" ->
          r_audience :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Audience"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> web_identity_token_audience_string_type_of_xml i)
                     ())
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> web_identity_token_duration_seconds_type_of_xml i)
                 ())
      | "SigningAlgorithm" ->
          r_signing_algorithm :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SigningAlgorithm"
                 (fun i _ -> jwt_algorithm_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     audience = Smaws_Lib.Xml.Parse.required "Audience" (( ! ) r_audience) i;
     duration_seconds = ( ! ) r_duration_seconds;
     signing_algorithm =
       Smaws_Lib.Xml.Parse.required "SigningAlgorithm" (( ! ) r_signing_algorithm) i;
     tags = ( ! ) r_tags;
   }
    : get_web_identity_token_request)

let region_disabled_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let region_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> region_disabled_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : region_disabled_exception)

let token_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let access_key_secret_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let access_key_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let credentials_of_xml i =
  let r_access_key_id = ref None in
  let r_secret_access_key = ref None in
  let r_session_token = ref None in
  let r_expiration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccessKeyId"; "SecretAccessKey"; "SessionToken"; "Expiration" ] (fun tag _ ->
      match tag with
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | "SecretAccessKey" ->
          r_secret_access_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecretAccessKey"
                 (fun i _ -> access_key_secret_type_of_xml i)
                 ())
      | "SessionToken" ->
          r_session_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionToken"
                 (fun i _ -> token_type_of_xml i)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     access_key_id = Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i;
     secret_access_key =
       Smaws_Lib.Xml.Parse.required "SecretAccessKey" (( ! ) r_secret_access_key) i;
     session_token = Smaws_Lib.Xml.Parse.required "SessionToken" (( ! ) r_session_token) i;
     expiration = Smaws_Lib.Xml.Parse.required "Expiration" (( ! ) r_expiration) i;
   }
    : credentials)

let get_session_token_response_of_xml i =
  let r_credentials = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Credentials" ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ credentials = ( ! ) r_credentials } : get_session_token_response)

let token_code_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let serial_number_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_session_token_request_of_xml i =
  let r_duration_seconds = ref None in
  let r_serial_number = ref None in
  let r_token_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DurationSeconds"; "SerialNumber"; "TokenCode" ]
    (fun tag _ ->
      match tag with
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> duration_seconds_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "TokenCode" ->
          r_token_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TokenCode"
                 (fun i _ -> token_code_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     duration_seconds = ( ! ) r_duration_seconds;
     serial_number = ( ! ) r_serial_number;
     token_code = ( ! ) r_token_code;
   }
    : get_session_token_request)

let packed_policy_too_large_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let packed_policy_too_large_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> packed_policy_too_large_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : packed_policy_too_large_exception)

let malformed_policy_document_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let malformed_policy_document_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> malformed_policy_document_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : malformed_policy_document_exception)

let non_negative_integer_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let arn_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let federated_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let federated_user_of_xml i =
  let r_federated_user_id = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FederatedUserId"; "Arn" ] (fun tag _ ->
      match tag with
      | "FederatedUserId" ->
          r_federated_user_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FederatedUserId"
                 (fun i _ -> federated_id_type_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     federated_user_id =
       Smaws_Lib.Xml.Parse.required "FederatedUserId" (( ! ) r_federated_user_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
   }
    : federated_user)

let get_federation_token_response_of_xml i =
  let r_credentials = ref None in
  let r_federated_user = ref None in
  let r_packed_policy_size = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Credentials"; "FederatedUser"; "PackedPolicySize" ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | "FederatedUser" ->
          r_federated_user :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FederatedUser"
                 (fun i _ -> federated_user_of_xml i)
                 ())
      | "PackedPolicySize" ->
          r_packed_policy_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                 (fun i _ -> non_negative_integer_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     credentials = ( ! ) r_credentials;
     federated_user = ( ! ) r_federated_user;
     packed_policy_size = ( ! ) r_packed_policy_size;
   }
    : get_federation_token_response)

let policy_descriptor_type_of_xml i =
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "arn" ] (fun tag _ ->
      match tag with
      | "arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "arn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = ( ! ) r_arn } : policy_descriptor_type)

let policy_descriptor_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_descriptor_type_of_xml i) ()

let session_policy_document_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let user_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_federation_token_request_of_xml i =
  let r_name = ref None in
  let r_policy = ref None in
  let r_policy_arns = ref None in
  let r_duration_seconds = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Name"; "Policy"; "PolicyArns"; "DurationSeconds"; "Tags" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> user_name_type_of_xml i) ())
      | "Policy" ->
          r_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                 (fun i _ -> session_policy_document_type_of_xml i)
                 ())
      | "PolicyArns" ->
          r_policy_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_descriptor_type_of_xml i)
                     ())
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> duration_seconds_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     policy = ( ! ) r_policy;
     policy_arns = ( ! ) r_policy_arns;
     duration_seconds = ( ! ) r_duration_seconds;
     tags = ( ! ) r_tags;
   }
    : get_federation_token_request)

let expired_trade_in_token_exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let expired_trade_in_token_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> expired_trade_in_token_exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : expired_trade_in_token_exception)

let get_delegated_access_token_response_of_xml i =
  let r_credentials = ref None in
  let r_packed_policy_size = ref None in
  let r_assumed_principal = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Credentials"; "PackedPolicySize"; "AssumedPrincipal" ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | "PackedPolicySize" ->
          r_packed_policy_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                 (fun i _ -> non_negative_integer_type_of_xml i)
                 ())
      | "AssumedPrincipal" ->
          r_assumed_principal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedPrincipal"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     credentials = ( ! ) r_credentials;
     packed_policy_size = ( ! ) r_packed_policy_size;
     assumed_principal = ( ! ) r_assumed_principal;
   }
    : get_delegated_access_token_response)

let trade_in_token_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_delegated_access_token_request_of_xml i =
  let r_trade_in_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TradeInToken" ] (fun tag _ ->
      match tag with
      | "TradeInToken" ->
          r_trade_in_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TradeInToken"
                 (fun i _ -> trade_in_token_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ trade_in_token = Smaws_Lib.Xml.Parse.required "TradeInToken" (( ! ) r_trade_in_token) i }
    : get_delegated_access_token_request)

let account_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let user_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_caller_identity_response_of_xml i =
  let r_user_id = ref None in
  let r_account = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserId"; "Account"; "Arn" ] (fun tag _ ->
      match tag with
      | "UserId" ->
          r_user_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> user_id_type_of_xml i) ())
      | "Account" ->
          r_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_id = ( ! ) r_user_id; account = ( ! ) r_account; arn = ( ! ) r_arn }
    : get_caller_identity_response)

let get_caller_identity_request_of_xml i = ()

let get_access_key_info_response_of_xml i =
  let r_account = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Account" ] (fun tag _ ->
      match tag with
      | "Account" ->
          r_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account = ( ! ) r_account } : get_access_key_info_response)

let get_access_key_info_request_of_xml i =
  let r_access_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessKeyId" ] (fun tag _ ->
      match tag with
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ access_key_id = Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i }
    : get_access_key_info_request)

let invalid_authorization_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_authorization_message_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_authorization_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_authorization_message_exception)

let decoded_message_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let decode_authorization_message_response_of_xml i =
  let r_decoded_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DecodedMessage" ] (fun tag _ ->
      match tag with
      | "DecodedMessage" ->
          r_decoded_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DecodedMessage"
                 (fun i _ -> decoded_message_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ decoded_message = ( ! ) r_decoded_message } : decode_authorization_message_response)

let encoded_message_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let decode_authorization_message_request_of_xml i =
  let r_encoded_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EncodedMessage" ] (fun tag _ ->
      match tag with
      | "EncodedMessage" ->
          r_encoded_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EncodedMessage"
                 (fun i _ -> encoded_message_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ encoded_message = Smaws_Lib.Xml.Parse.required "EncodedMessage" (( ! ) r_encoded_message) i }
    : decode_authorization_message_request)

let expired_identity_token_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let expired_token_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> expired_identity_token_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : expired_token_exception)

let source_identity_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_root_response_of_xml i =
  let r_credentials = ref None in
  let r_source_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Credentials"; "SourceIdentity" ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | "SourceIdentity" ->
          r_source_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                 (fun i _ -> source_identity_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ credentials = ( ! ) r_credentials; source_identity = ( ! ) r_source_identity }
    : assume_root_response)

let root_duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_principal_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_root_request_of_xml i =
  let r_target_principal = ref None in
  let r_task_policy_arn = ref None in
  let r_duration_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetPrincipal"; "TaskPolicyArn"; "DurationSeconds" ] (fun tag _ ->
      match tag with
      | "TargetPrincipal" ->
          r_target_principal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetPrincipal"
                 (fun i _ -> target_principal_type_of_xml i)
                 ())
      | "TaskPolicyArn" ->
          r_task_policy_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TaskPolicyArn"
                 (fun i _ -> policy_descriptor_type_of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> root_duration_seconds_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_principal = Smaws_Lib.Xml.Parse.required "TargetPrincipal" (( ! ) r_target_principal) i;
     task_policy_arn = Smaws_Lib.Xml.Parse.required "TaskPolicyArn" (( ! ) r_task_policy_arn) i;
     duration_seconds = ( ! ) r_duration_seconds;
   }
    : assume_root_request)

let invalid_identity_token_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_identity_token_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_identity_token_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_identity_token_exception)

let idp_rejected_claim_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let idp_rejected_claim_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> idp_rejected_claim_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : idp_rejected_claim_exception)

let idp_communication_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let idp_communication_error_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> idp_communication_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : idp_communication_error_exception)

let audience_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let issuer_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let assumed_role_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assumed_role_user_of_xml i =
  let r_assumed_role_id = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AssumedRoleId"; "Arn" ] (fun tag _ ->
      match tag with
      | "AssumedRoleId" ->
          r_assumed_role_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleId"
                 (fun i _ -> assumed_role_id_type_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     assumed_role_id = Smaws_Lib.Xml.Parse.required "AssumedRoleId" (( ! ) r_assumed_role_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
   }
    : assumed_role_user)

let web_identity_subject_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_role_with_web_identity_response_of_xml i =
  let r_credentials = ref None in
  let r_subject_from_web_identity_token = ref None in
  let r_assumed_role_user = ref None in
  let r_packed_policy_size = ref None in
  let r_provider = ref None in
  let r_audience = ref None in
  let r_source_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Credentials";
      "SubjectFromWebIdentityToken";
      "AssumedRoleUser";
      "PackedPolicySize";
      "Provider";
      "Audience";
      "SourceIdentity";
    ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | "SubjectFromWebIdentityToken" ->
          r_subject_from_web_identity_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubjectFromWebIdentityToken"
                 (fun i _ -> web_identity_subject_type_of_xml i)
                 ())
      | "AssumedRoleUser" ->
          r_assumed_role_user :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleUser"
                 (fun i _ -> assumed_role_user_of_xml i)
                 ())
      | "PackedPolicySize" ->
          r_packed_policy_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                 (fun i _ -> non_negative_integer_type_of_xml i)
                 ())
      | "Provider" ->
          r_provider :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Provider" (fun i _ -> issuer_of_xml i) ())
      | "Audience" ->
          r_audience :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Audience" (fun i _ -> audience_of_xml i) ())
      | "SourceIdentity" ->
          r_source_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                 (fun i _ -> source_identity_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     credentials = ( ! ) r_credentials;
     subject_from_web_identity_token = ( ! ) r_subject_from_web_identity_token;
     assumed_role_user = ( ! ) r_assumed_role_user;
     packed_policy_size = ( ! ) r_packed_policy_size;
     provider = ( ! ) r_provider;
     audience = ( ! ) r_audience;
     source_identity = ( ! ) r_source_identity;
   }
    : assume_role_with_web_identity_response)

let role_duration_seconds_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let url_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let client_token_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let role_session_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_role_with_web_identity_request_of_xml i =
  let r_role_arn = ref None in
  let r_role_session_name = ref None in
  let r_web_identity_token = ref None in
  let r_provider_id = ref None in
  let r_policy_arns = ref None in
  let r_policy = ref None in
  let r_duration_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RoleArn";
      "RoleSessionName";
      "WebIdentityToken";
      "ProviderId";
      "PolicyArns";
      "Policy";
      "DurationSeconds";
    ] (fun tag _ ->
      match tag with
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> arn_type_of_xml i) ())
      | "RoleSessionName" ->
          r_role_session_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleSessionName"
                 (fun i _ -> role_session_name_type_of_xml i)
                 ())
      | "WebIdentityToken" ->
          r_web_identity_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WebIdentityToken"
                 (fun i _ -> client_token_type_of_xml i)
                 ())
      | "ProviderId" ->
          r_provider_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProviderId" (fun i _ -> url_type_of_xml i) ())
      | "PolicyArns" ->
          r_policy_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_descriptor_type_of_xml i)
                     ())
                 ())
      | "Policy" ->
          r_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                 (fun i _ -> session_policy_document_type_of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> role_duration_seconds_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     role_session_name =
       Smaws_Lib.Xml.Parse.required "RoleSessionName" (( ! ) r_role_session_name) i;
     web_identity_token =
       Smaws_Lib.Xml.Parse.required "WebIdentityToken" (( ! ) r_web_identity_token) i;
     provider_id = ( ! ) r_provider_id;
     policy_arns = ( ! ) r_policy_arns;
     policy = ( ! ) r_policy;
     duration_seconds = ( ! ) r_duration_seconds;
   }
    : assume_role_with_web_identity_request)

let name_qualifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_role_with_saml_response_of_xml i =
  let r_credentials = ref None in
  let r_assumed_role_user = ref None in
  let r_packed_policy_size = ref None in
  let r_subject = ref None in
  let r_subject_type = ref None in
  let r_issuer = ref None in
  let r_audience = ref None in
  let r_name_qualifier = ref None in
  let r_source_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Credentials";
      "AssumedRoleUser";
      "PackedPolicySize";
      "Subject";
      "SubjectType";
      "Issuer";
      "Audience";
      "NameQualifier";
      "SourceIdentity";
    ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | "AssumedRoleUser" ->
          r_assumed_role_user :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleUser"
                 (fun i _ -> assumed_role_user_of_xml i)
                 ())
      | "PackedPolicySize" ->
          r_packed_policy_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                 (fun i _ -> non_negative_integer_type_of_xml i)
                 ())
      | "Subject" ->
          r_subject :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Subject" (fun i _ -> subject_of_xml i) ())
      | "SubjectType" ->
          r_subject_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubjectType"
                 (fun i _ -> subject_type_of_xml i)
                 ())
      | "Issuer" ->
          r_issuer :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Issuer" (fun i _ -> issuer_of_xml i) ())
      | "Audience" ->
          r_audience :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Audience" (fun i _ -> audience_of_xml i) ())
      | "NameQualifier" ->
          r_name_qualifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NameQualifier"
                 (fun i _ -> name_qualifier_of_xml i)
                 ())
      | "SourceIdentity" ->
          r_source_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                 (fun i _ -> source_identity_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     credentials = ( ! ) r_credentials;
     assumed_role_user = ( ! ) r_assumed_role_user;
     packed_policy_size = ( ! ) r_packed_policy_size;
     subject = ( ! ) r_subject;
     subject_type = ( ! ) r_subject_type;
     issuer = ( ! ) r_issuer;
     audience = ( ! ) r_audience;
     name_qualifier = ( ! ) r_name_qualifier;
     source_identity = ( ! ) r_source_identity;
   }
    : assume_role_with_saml_response)

let saml_assertion_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_role_with_saml_request_of_xml i =
  let r_role_arn = ref None in
  let r_principal_arn = ref None in
  let r_saml_assertion = ref None in
  let r_policy_arns = ref None in
  let r_policy = ref None in
  let r_duration_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RoleArn"; "PrincipalArn"; "SAMLAssertion"; "PolicyArns"; "Policy"; "DurationSeconds" ]
    (fun tag _ ->
      match tag with
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> arn_type_of_xml i) ())
      | "PrincipalArn" ->
          r_principal_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrincipalArn" (fun i _ -> arn_type_of_xml i) ())
      | "SAMLAssertion" ->
          r_saml_assertion :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLAssertion"
                 (fun i _ -> saml_assertion_type_of_xml i)
                 ())
      | "PolicyArns" ->
          r_policy_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_descriptor_type_of_xml i)
                     ())
                 ())
      | "Policy" ->
          r_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                 (fun i _ -> session_policy_document_type_of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> role_duration_seconds_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     principal_arn = Smaws_Lib.Xml.Parse.required "PrincipalArn" (( ! ) r_principal_arn) i;
     saml_assertion = Smaws_Lib.Xml.Parse.required "SAMLAssertion" (( ! ) r_saml_assertion) i;
     policy_arns = ( ! ) r_policy_arns;
     policy = ( ! ) r_policy;
     duration_seconds = ( ! ) r_duration_seconds;
   }
    : assume_role_with_saml_request)

let assume_role_response_of_xml i =
  let r_credentials = ref None in
  let r_assumed_role_user = ref None in
  let r_packed_policy_size = ref None in
  let r_source_identity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Credentials"; "AssumedRoleUser"; "PackedPolicySize"; "SourceIdentity" ] (fun tag _ ->
      match tag with
      | "Credentials" ->
          r_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Credentials"
                 (fun i _ -> credentials_of_xml i)
                 ())
      | "AssumedRoleUser" ->
          r_assumed_role_user :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumedRoleUser"
                 (fun i _ -> assumed_role_user_of_xml i)
                 ())
      | "PackedPolicySize" ->
          r_packed_policy_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PackedPolicySize"
                 (fun i _ -> non_negative_integer_type_of_xml i)
                 ())
      | "SourceIdentity" ->
          r_source_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                 (fun i _ -> source_identity_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     credentials = ( ! ) r_credentials;
     assumed_role_user = ( ! ) r_assumed_role_user;
     packed_policy_size = ( ! ) r_packed_policy_size;
     source_identity = ( ! ) r_source_identity;
   }
    : assume_role_response)

let context_assertion_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let provided_context_of_xml i =
  let r_provider_arn = ref None in
  let r_context_assertion = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProviderArn"; "ContextAssertion" ] (fun tag _ ->
      match tag with
      | "ProviderArn" ->
          r_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProviderArn" (fun i _ -> arn_type_of_xml i) ())
      | "ContextAssertion" ->
          r_context_assertion :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextAssertion"
                 (fun i _ -> context_assertion_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ provider_arn = ( ! ) r_provider_arn; context_assertion = ( ! ) r_context_assertion }
    : provided_context)

let provided_contexts_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> provided_context_of_xml i) ()

let external_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_key_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_type_of_xml i) ()

let unrestricted_session_policy_document_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assume_role_request_of_xml i =
  let r_role_arn = ref None in
  let r_role_session_name = ref None in
  let r_policy_arns = ref None in
  let r_policy = ref None in
  let r_duration_seconds = ref None in
  let r_tags = ref None in
  let r_transitive_tag_keys = ref None in
  let r_external_id = ref None in
  let r_serial_number = ref None in
  let r_token_code = ref None in
  let r_source_identity = ref None in
  let r_provided_contexts = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RoleArn";
      "RoleSessionName";
      "PolicyArns";
      "Policy";
      "DurationSeconds";
      "Tags";
      "TransitiveTagKeys";
      "ExternalId";
      "SerialNumber";
      "TokenCode";
      "SourceIdentity";
      "ProvidedContexts";
    ] (fun tag _ ->
      match tag with
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> arn_type_of_xml i) ())
      | "RoleSessionName" ->
          r_role_session_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleSessionName"
                 (fun i _ -> role_session_name_type_of_xml i)
                 ())
      | "PolicyArns" ->
          r_policy_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_descriptor_type_of_xml i)
                     ())
                 ())
      | "Policy" ->
          r_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policy"
                 (fun i _ -> unrestricted_session_policy_document_type_of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> role_duration_seconds_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "TransitiveTagKeys" ->
          r_transitive_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitiveTagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | "ExternalId" ->
          r_external_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExternalId"
                 (fun i _ -> external_id_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "TokenCode" ->
          r_token_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TokenCode"
                 (fun i _ -> token_code_type_of_xml i)
                 ())
      | "SourceIdentity" ->
          r_source_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentity"
                 (fun i _ -> source_identity_type_of_xml i)
                 ())
      | "ProvidedContexts" ->
          r_provided_contexts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvidedContexts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> provided_context_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     role_session_name =
       Smaws_Lib.Xml.Parse.required "RoleSessionName" (( ! ) r_role_session_name) i;
     policy_arns = ( ! ) r_policy_arns;
     policy = ( ! ) r_policy;
     duration_seconds = ( ! ) r_duration_seconds;
     tags = ( ! ) r_tags;
     transitive_tag_keys = ( ! ) r_transitive_tag_keys;
     external_id = ( ! ) r_external_id;
     serial_number = ( ! ) r_serial_number;
     token_code = ( ! ) r_token_code;
     source_identity = ( ! ) r_source_identity;
     provided_contexts = ( ! ) r_provided_contexts;
   }
    : assume_role_request)
