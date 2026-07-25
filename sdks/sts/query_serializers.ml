open Types

let session_duration_escalation_exception2_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let session_duration_escalation_exception_to_query path (x : session_duration_escalation_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> session_duration_escalation_exception2_to_query (List.append path [ "message" ]) v);
    ]

let outbound_web_identity_federation_disabled_exception2_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let outbound_web_identity_federation_disabled_exception_to_query path
    (x : outbound_web_identity_federation_disabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          outbound_web_identity_federation_disabled_exception2_to_query
            (List.append path [ "message" ]) v);
    ]

let jwt_payload_size_exceeded_exception2_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jwt_payload_size_exceeded_exception_to_query path (x : jwt_payload_size_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> jwt_payload_size_exceeded_exception2_to_query (List.append path [ "message" ]) v);
    ]

let date_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let web_identity_token_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_web_identity_token_response_to_query path (x : get_web_identity_token_response) =
  List.concat
    [
      (match x.web_identity_token with
      | None -> []
      | Some v -> web_identity_token_type_to_query (List.append path [ "WebIdentityToken" ]) v);
      (match x.expiration with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "Expiration" ]) v);
    ]

let tag_value_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_key_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_key_type_to_query (List.append path [ "Key" ]) x.key;
      tag_value_type_to_query (List.append path [ "Value" ]) x.value;
    ]

let tag_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let jwt_algorithm_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let web_identity_token_duration_seconds_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let web_identity_token_audience_string_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let web_identity_token_audience_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    web_identity_token_audience_string_type_to_query path xs

let get_web_identity_token_request_to_query path (x : get_web_identity_token_request) =
  List.concat
    [
      web_identity_token_audience_list_type_to_query (List.append path [ "Audience" ]) x.audience;
      (match x.duration_seconds with
      | None -> []
      | Some v ->
          web_identity_token_duration_seconds_type_to_query
            (List.append path [ "DurationSeconds" ])
            v);
      jwt_algorithm_type_to_query (List.append path [ "SigningAlgorithm" ]) x.signing_algorithm;
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
    ]

let region_disabled_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let region_disabled_exception_to_query path (x : region_disabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> region_disabled_message_to_query (List.append path [ "message" ]) v);
    ]

let token_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let access_key_secret_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let access_key_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let credentials_to_query path (x : credentials) =
  List.concat
    [
      access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) x.access_key_id;
      access_key_secret_type_to_query (List.append path [ "SecretAccessKey" ]) x.secret_access_key;
      token_type_to_query (List.append path [ "SessionToken" ]) x.session_token;
      date_type_to_query (List.append path [ "Expiration" ]) x.expiration;
    ]

let get_session_token_response_to_query path (x : get_session_token_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
    ]

let token_code_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let serial_number_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let duration_seconds_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let get_session_token_request_to_query path (x : get_session_token_request) =
  List.concat
    [
      (match x.duration_seconds with
      | None -> []
      | Some v -> duration_seconds_type_to_query (List.append path [ "DurationSeconds" ]) v);
      (match x.serial_number with
      | None -> []
      | Some v -> serial_number_type_to_query (List.append path [ "SerialNumber" ]) v);
      (match x.token_code with
      | None -> []
      | Some v -> token_code_type_to_query (List.append path [ "TokenCode" ]) v);
    ]

let packed_policy_too_large_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let packed_policy_too_large_exception_to_query path (x : packed_policy_too_large_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> packed_policy_too_large_message_to_query (List.append path [ "message" ]) v);
    ]

let malformed_policy_document_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let malformed_policy_document_exception_to_query path (x : malformed_policy_document_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> malformed_policy_document_message_to_query (List.append path [ "message" ]) v);
    ]

let non_negative_integer_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let arn_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let federated_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let federated_user_to_query path (x : federated_user) =
  List.concat
    [
      federated_id_type_to_query (List.append path [ "FederatedUserId" ]) x.federated_user_id;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
    ]

let get_federation_token_response_to_query path (x : get_federation_token_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
      (match x.federated_user with
      | None -> []
      | Some v -> federated_user_to_query (List.append path [ "FederatedUser" ]) v);
      (match x.packed_policy_size with
      | None -> []
      | Some v -> non_negative_integer_type_to_query (List.append path [ "PackedPolicySize" ]) v);
    ]

let policy_descriptor_type_to_query path (x : policy_descriptor_type) =
  List.concat
    [ (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "arn" ]) v) ]

let policy_descriptor_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_descriptor_type_to_query path
    xs

let session_policy_document_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let user_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_federation_token_request_to_query path (x : get_federation_token_request) =
  List.concat
    [
      user_name_type_to_query (List.append path [ "Name" ]) x.name;
      (match x.policy with
      | None -> []
      | Some v -> session_policy_document_type_to_query (List.append path [ "Policy" ]) v);
      (match x.policy_arns with
      | None -> []
      | Some v -> policy_descriptor_list_type_to_query (List.append path [ "PolicyArns" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v -> duration_seconds_type_to_query (List.append path [ "DurationSeconds" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
    ]

let expired_trade_in_token_exception_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let expired_trade_in_token_exception_to_query path (x : expired_trade_in_token_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          expired_trade_in_token_exception_message_to_query (List.append path [ "message" ]) v);
    ]

let get_delegated_access_token_response_to_query path (x : get_delegated_access_token_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
      (match x.packed_policy_size with
      | None -> []
      | Some v -> non_negative_integer_type_to_query (List.append path [ "PackedPolicySize" ]) v);
      (match x.assumed_principal with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "AssumedPrincipal" ]) v);
    ]

let trade_in_token_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_delegated_access_token_request_to_query path (x : get_delegated_access_token_request) =
  List.concat
    [ trade_in_token_type_to_query (List.append path [ "TradeInToken" ]) x.trade_in_token ]

let account_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let user_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_caller_identity_response_to_query path (x : get_caller_identity_response) =
  List.concat
    [
      (match x.user_id with
      | None -> []
      | Some v -> user_id_type_to_query (List.append path [ "UserId" ]) v);
      (match x.account with
      | None -> []
      | Some v -> account_type_to_query (List.append path [ "Account" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
    ]

let get_caller_identity_request_to_query path _x = []

let get_access_key_info_response_to_query path (x : get_access_key_info_response) =
  List.concat
    [
      (match x.account with
      | None -> []
      | Some v -> account_type_to_query (List.append path [ "Account" ]) v);
    ]

let get_access_key_info_request_to_query path (x : get_access_key_info_request) =
  List.concat [ access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) x.access_key_id ]

let invalid_authorization_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_authorization_message_exception_to_query path
    (x : invalid_authorization_message_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_authorization_message_to_query (List.append path [ "message" ]) v);
    ]

let decoded_message_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let decode_authorization_message_response_to_query path (x : decode_authorization_message_response)
    =
  List.concat
    [
      (match x.decoded_message with
      | None -> []
      | Some v -> decoded_message_type_to_query (List.append path [ "DecodedMessage" ]) v);
    ]

let encoded_message_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let decode_authorization_message_request_to_query path (x : decode_authorization_message_request) =
  List.concat
    [ encoded_message_type_to_query (List.append path [ "EncodedMessage" ]) x.encoded_message ]

let expired_identity_token_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let expired_token_exception_to_query path (x : expired_token_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> expired_identity_token_message_to_query (List.append path [ "message" ]) v);
    ]

let source_identity_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_root_response_to_query path (x : assume_root_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
      (match x.source_identity with
      | None -> []
      | Some v -> source_identity_type_to_query (List.append path [ "SourceIdentity" ]) v);
    ]

let root_duration_seconds_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let target_principal_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_root_request_to_query path (x : assume_root_request) =
  List.concat
    [
      target_principal_type_to_query (List.append path [ "TargetPrincipal" ]) x.target_principal;
      policy_descriptor_type_to_query (List.append path [ "TaskPolicyArn" ]) x.task_policy_arn;
      (match x.duration_seconds with
      | None -> []
      | Some v -> root_duration_seconds_type_to_query (List.append path [ "DurationSeconds" ]) v);
    ]

let invalid_identity_token_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_identity_token_exception_to_query path (x : invalid_identity_token_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_identity_token_message_to_query (List.append path [ "message" ]) v);
    ]

let idp_rejected_claim_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let idp_rejected_claim_exception_to_query path (x : idp_rejected_claim_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> idp_rejected_claim_message_to_query (List.append path [ "message" ]) v);
    ]

let idp_communication_error_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let idp_communication_error_exception_to_query path (x : idp_communication_error_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> idp_communication_error_message_to_query (List.append path [ "message" ]) v);
    ]

let audience_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let issuer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assumed_role_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assumed_role_user_to_query path (x : assumed_role_user) =
  List.concat
    [
      assumed_role_id_type_to_query (List.append path [ "AssumedRoleId" ]) x.assumed_role_id;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
    ]

let web_identity_subject_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_role_with_web_identity_response_to_query path
    (x : assume_role_with_web_identity_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
      (match x.subject_from_web_identity_token with
      | None -> []
      | Some v ->
          web_identity_subject_type_to_query (List.append path [ "SubjectFromWebIdentityToken" ]) v);
      (match x.assumed_role_user with
      | None -> []
      | Some v -> assumed_role_user_to_query (List.append path [ "AssumedRoleUser" ]) v);
      (match x.packed_policy_size with
      | None -> []
      | Some v -> non_negative_integer_type_to_query (List.append path [ "PackedPolicySize" ]) v);
      (match x.provider with
      | None -> []
      | Some v -> issuer_to_query (List.append path [ "Provider" ]) v);
      (match x.audience with
      | None -> []
      | Some v -> audience_to_query (List.append path [ "Audience" ]) v);
      (match x.source_identity with
      | None -> []
      | Some v -> source_identity_type_to_query (List.append path [ "SourceIdentity" ]) v);
    ]

let role_duration_seconds_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let url_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let client_token_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let role_session_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_role_with_web_identity_request_to_query path (x : assume_role_with_web_identity_request)
    =
  List.concat
    [
      arn_type_to_query (List.append path [ "RoleArn" ]) x.role_arn;
      role_session_name_type_to_query (List.append path [ "RoleSessionName" ]) x.role_session_name;
      client_token_type_to_query (List.append path [ "WebIdentityToken" ]) x.web_identity_token;
      (match x.provider_id with
      | None -> []
      | Some v -> url_type_to_query (List.append path [ "ProviderId" ]) v);
      (match x.policy_arns with
      | None -> []
      | Some v -> policy_descriptor_list_type_to_query (List.append path [ "PolicyArns" ]) v);
      (match x.policy with
      | None -> []
      | Some v -> session_policy_document_type_to_query (List.append path [ "Policy" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v -> role_duration_seconds_type_to_query (List.append path [ "DurationSeconds" ]) v);
    ]

let name_qualifier_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subject_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subject_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_role_with_saml_response_to_query path (x : assume_role_with_saml_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
      (match x.assumed_role_user with
      | None -> []
      | Some v -> assumed_role_user_to_query (List.append path [ "AssumedRoleUser" ]) v);
      (match x.packed_policy_size with
      | None -> []
      | Some v -> non_negative_integer_type_to_query (List.append path [ "PackedPolicySize" ]) v);
      (match x.subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "Subject" ]) v);
      (match x.subject_type with
      | None -> []
      | Some v -> subject_type_to_query (List.append path [ "SubjectType" ]) v);
      (match x.issuer with
      | None -> []
      | Some v -> issuer_to_query (List.append path [ "Issuer" ]) v);
      (match x.audience with
      | None -> []
      | Some v -> audience_to_query (List.append path [ "Audience" ]) v);
      (match x.name_qualifier with
      | None -> []
      | Some v -> name_qualifier_to_query (List.append path [ "NameQualifier" ]) v);
      (match x.source_identity with
      | None -> []
      | Some v -> source_identity_type_to_query (List.append path [ "SourceIdentity" ]) v);
    ]

let saml_assertion_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_role_with_saml_request_to_query path (x : assume_role_with_saml_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "RoleArn" ]) x.role_arn;
      arn_type_to_query (List.append path [ "PrincipalArn" ]) x.principal_arn;
      saml_assertion_type_to_query (List.append path [ "SAMLAssertion" ]) x.saml_assertion;
      (match x.policy_arns with
      | None -> []
      | Some v -> policy_descriptor_list_type_to_query (List.append path [ "PolicyArns" ]) v);
      (match x.policy with
      | None -> []
      | Some v -> session_policy_document_type_to_query (List.append path [ "Policy" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v -> role_duration_seconds_type_to_query (List.append path [ "DurationSeconds" ]) v);
    ]

let assume_role_response_to_query path (x : assume_role_response) =
  List.concat
    [
      (match x.credentials with
      | None -> []
      | Some v -> credentials_to_query (List.append path [ "Credentials" ]) v);
      (match x.assumed_role_user with
      | None -> []
      | Some v -> assumed_role_user_to_query (List.append path [ "AssumedRoleUser" ]) v);
      (match x.packed_policy_size with
      | None -> []
      | Some v -> non_negative_integer_type_to_query (List.append path [ "PackedPolicySize" ]) v);
      (match x.source_identity with
      | None -> []
      | Some v -> source_identity_type_to_query (List.append path [ "SourceIdentity" ]) v);
    ]

let context_assertion_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let provided_context_to_query path (x : provided_context) =
  List.concat
    [
      (match x.provider_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "ProviderArn" ]) v);
      (match x.context_assertion with
      | None -> []
      | Some v -> context_assertion_type_to_query (List.append path [ "ContextAssertion" ]) v);
    ]

let provided_contexts_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" provided_context_to_query path xs

let external_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_key_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_type_to_query path xs

let unrestricted_session_policy_document_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assume_role_request_to_query path (x : assume_role_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "RoleArn" ]) x.role_arn;
      role_session_name_type_to_query (List.append path [ "RoleSessionName" ]) x.role_session_name;
      (match x.policy_arns with
      | None -> []
      | Some v -> policy_descriptor_list_type_to_query (List.append path [ "PolicyArns" ]) v);
      (match x.policy with
      | None -> []
      | Some v ->
          unrestricted_session_policy_document_type_to_query (List.append path [ "Policy" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v -> role_duration_seconds_type_to_query (List.append path [ "DurationSeconds" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.transitive_tag_keys with
      | None -> []
      | Some v -> tag_key_list_type_to_query (List.append path [ "TransitiveTagKeys" ]) v);
      (match x.external_id with
      | None -> []
      | Some v -> external_id_type_to_query (List.append path [ "ExternalId" ]) v);
      (match x.serial_number with
      | None -> []
      | Some v -> serial_number_type_to_query (List.append path [ "SerialNumber" ]) v);
      (match x.token_code with
      | None -> []
      | Some v -> token_code_type_to_query (List.append path [ "TokenCode" ]) v);
      (match x.source_identity with
      | None -> []
      | Some v -> source_identity_type_to_query (List.append path [ "SourceIdentity" ]) v);
      (match x.provided_contexts with
      | None -> []
      | Some v -> provided_contexts_list_type_to_query (List.append path [ "ProvidedContexts" ]) v);
    ]
