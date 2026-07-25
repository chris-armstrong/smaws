open Types

let error_description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alpn_policy_not_supported_exception_to_query path (x : alpn_policy_not_supported_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let jwt_validation_action_additional_claim_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jwt_validation_action_additional_claim_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    jwt_validation_action_additional_claim_value_to_query path xs

let jwt_validation_action_additional_claim_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jwt_validation_action_additional_claim_format_enum_to_query path
    (x : jwt_validation_action_additional_claim_format_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SINGLE_STRING -> "single-string"
    | STRING_ARRAY -> "string-array"
    | SPACE_SEPARATED_VALUES -> "space-separated-values")

let jwt_validation_action_additional_claim_to_query path
    (x : jwt_validation_action_additional_claim) =
  List.concat
    [
      jwt_validation_action_additional_claim_format_enum_to_query (List.append path [ "Format" ])
        x.format;
      jwt_validation_action_additional_claim_name_to_query (List.append path [ "Name" ]) x.name;
      jwt_validation_action_additional_claim_values_to_query (List.append path [ "Values" ])
        x.values;
    ]

let jwt_validation_action_additional_claims_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    jwt_validation_action_additional_claim_to_query path xs

let jwt_validation_action_issuer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jwt_validation_action_jwks_endpoint_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jwt_validation_action_config_to_query path (x : jwt_validation_action_config) =
  List.concat
    [
      jwt_validation_action_jwks_endpoint_to_query
        (List.append path [ "JwksEndpoint" ])
        x.jwks_endpoint;
      jwt_validation_action_issuer_to_query (List.append path [ "Issuer" ]) x.issuer;
      (match x.additional_claims with
      | None -> []
      | Some v ->
          jwt_validation_action_additional_claims_to_query
            (List.append path [ "AdditionalClaims" ])
            v);
    ]

let target_group_stickiness_duration_seconds_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let target_group_stickiness_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let target_group_stickiness_config_to_query path (x : target_group_stickiness_config) =
  List.concat
    [
      (match x.enabled with
      | None -> []
      | Some v -> target_group_stickiness_enabled_to_query (List.append path [ "Enabled" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v ->
          target_group_stickiness_duration_seconds_to_query
            (List.append path [ "DurationSeconds" ])
            v);
    ]

let target_group_weight_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let target_group_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_group_tuple_to_query path (x : target_group_tuple) =
  List.concat
    [
      (match x.target_group_arn with
      | None -> []
      | Some v -> target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) v);
      (match x.weight with
      | None -> []
      | Some v -> target_group_weight_to_query (List.append path [ "Weight" ]) v);
    ]

let target_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_group_tuple_to_query path xs

let forward_action_config_to_query path (x : forward_action_config) =
  List.concat
    [
      (match x.target_groups with
      | None -> []
      | Some v -> target_group_list_to_query (List.append path [ "TargetGroups" ]) v);
      (match x.target_group_stickiness_config with
      | None -> []
      | Some v ->
          target_group_stickiness_config_to_query
            (List.append path [ "TargetGroupStickinessConfig" ])
            v);
    ]

let fixed_response_action_content_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let fixed_response_action_status_code_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let fixed_response_action_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let fixed_response_action_config_to_query path (x : fixed_response_action_config) =
  List.concat
    [
      (match x.message_body with
      | None -> []
      | Some v -> fixed_response_action_message_to_query (List.append path [ "MessageBody" ]) v);
      fixed_response_action_status_code_to_query (List.append path [ "StatusCode" ]) x.status_code;
      (match x.content_type with
      | None -> []
      | Some v -> fixed_response_action_content_type_to_query (List.append path [ "ContentType" ]) v);
    ]

let redirect_action_status_code_enum_to_query path (x : redirect_action_status_code_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with HTTP_301 -> "HTTP_301" | HTTP_302 -> "HTTP_302")

let redirect_action_query_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redirect_action_path_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redirect_action_host_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redirect_action_port_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redirect_action_protocol_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redirect_action_config_to_query path (x : redirect_action_config) =
  List.concat
    [
      (match x.protocol with
      | None -> []
      | Some v -> redirect_action_protocol_to_query (List.append path [ "Protocol" ]) v);
      (match x.port with
      | None -> []
      | Some v -> redirect_action_port_to_query (List.append path [ "Port" ]) v);
      (match x.host with
      | None -> []
      | Some v -> redirect_action_host_to_query (List.append path [ "Host" ]) v);
      (match x.path with
      | None -> []
      | Some v -> redirect_action_path_to_query (List.append path [ "Path" ]) v);
      (match x.query with
      | None -> []
      | Some v -> redirect_action_query_to_query (List.append path [ "Query" ]) v);
      redirect_action_status_code_enum_to_query (List.append path [ "StatusCode" ]) x.status_code;
    ]

let action_order_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let authenticate_cognito_action_conditional_behavior_enum_to_query path
    (x : authenticate_cognito_action_conditional_behavior_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DENY -> "deny" | ALLOW -> "allow" | AUTHENTICATE -> "authenticate")

let authenticate_cognito_action_authentication_request_param_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_authentication_request_param_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_authentication_request_extra_params_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    authenticate_cognito_action_authentication_request_param_name_to_query
    authenticate_cognito_action_authentication_request_param_value_to_query path pairs

let authenticate_cognito_action_session_timeout_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let authenticate_cognito_action_scope_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_session_cookie_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_user_pool_domain_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_user_pool_client_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_user_pool_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_cognito_action_config_to_query path (x : authenticate_cognito_action_config) =
  List.concat
    [
      authenticate_cognito_action_user_pool_arn_to_query
        (List.append path [ "UserPoolArn" ])
        x.user_pool_arn;
      authenticate_cognito_action_user_pool_client_id_to_query
        (List.append path [ "UserPoolClientId" ])
        x.user_pool_client_id;
      authenticate_cognito_action_user_pool_domain_to_query
        (List.append path [ "UserPoolDomain" ])
        x.user_pool_domain;
      (match x.session_cookie_name with
      | None -> []
      | Some v ->
          authenticate_cognito_action_session_cookie_name_to_query
            (List.append path [ "SessionCookieName" ])
            v);
      (match x.scope with
      | None -> []
      | Some v -> authenticate_cognito_action_scope_to_query (List.append path [ "Scope" ]) v);
      (match x.session_timeout with
      | None -> []
      | Some v ->
          authenticate_cognito_action_session_timeout_to_query
            (List.append path [ "SessionTimeout" ])
            v);
      (match x.authentication_request_extra_params with
      | None -> []
      | Some v ->
          authenticate_cognito_action_authentication_request_extra_params_to_query
            (List.append path [ "AuthenticationRequestExtraParams" ])
            v);
      (match x.on_unauthenticated_request with
      | None -> []
      | Some v ->
          authenticate_cognito_action_conditional_behavior_enum_to_query
            (List.append path [ "OnUnauthenticatedRequest" ])
            v);
    ]

let authenticate_oidc_action_use_existing_client_secret_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let authenticate_oidc_action_conditional_behavior_enum_to_query path
    (x : authenticate_oidc_action_conditional_behavior_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DENY -> "deny" | ALLOW -> "allow" | AUTHENTICATE -> "authenticate")

let authenticate_oidc_action_authentication_request_param_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_authentication_request_param_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_authentication_request_extra_params_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    authenticate_oidc_action_authentication_request_param_name_to_query
    authenticate_oidc_action_authentication_request_param_value_to_query path pairs

let authenticate_oidc_action_session_timeout_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let authenticate_oidc_action_scope_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_session_cookie_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_client_secret_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_client_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_user_info_endpoint_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_token_endpoint_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_authorization_endpoint_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_issuer_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authenticate_oidc_action_config_to_query path (x : authenticate_oidc_action_config) =
  List.concat
    [
      authenticate_oidc_action_issuer_to_query (List.append path [ "Issuer" ]) x.issuer;
      authenticate_oidc_action_authorization_endpoint_to_query
        (List.append path [ "AuthorizationEndpoint" ])
        x.authorization_endpoint;
      authenticate_oidc_action_token_endpoint_to_query
        (List.append path [ "TokenEndpoint" ])
        x.token_endpoint;
      authenticate_oidc_action_user_info_endpoint_to_query
        (List.append path [ "UserInfoEndpoint" ])
        x.user_info_endpoint;
      authenticate_oidc_action_client_id_to_query (List.append path [ "ClientId" ]) x.client_id;
      (match x.client_secret with
      | None -> []
      | Some v ->
          authenticate_oidc_action_client_secret_to_query (List.append path [ "ClientSecret" ]) v);
      (match x.session_cookie_name with
      | None -> []
      | Some v ->
          authenticate_oidc_action_session_cookie_name_to_query
            (List.append path [ "SessionCookieName" ])
            v);
      (match x.scope with
      | None -> []
      | Some v -> authenticate_oidc_action_scope_to_query (List.append path [ "Scope" ]) v);
      (match x.session_timeout with
      | None -> []
      | Some v ->
          authenticate_oidc_action_session_timeout_to_query
            (List.append path [ "SessionTimeout" ])
            v);
      (match x.authentication_request_extra_params with
      | None -> []
      | Some v ->
          authenticate_oidc_action_authentication_request_extra_params_to_query
            (List.append path [ "AuthenticationRequestExtraParams" ])
            v);
      (match x.on_unauthenticated_request with
      | None -> []
      | Some v ->
          authenticate_oidc_action_conditional_behavior_enum_to_query
            (List.append path [ "OnUnauthenticatedRequest" ])
            v);
      (match x.use_existing_client_secret with
      | None -> []
      | Some v ->
          authenticate_oidc_action_use_existing_client_secret_to_query
            (List.append path [ "UseExistingClientSecret" ])
            v);
    ]

let action_type_enum_to_query path (x : action_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FORWARD -> "forward"
    | AUTHENTICATE_OIDC -> "authenticate-oidc"
    | AUTHENTICATE_COGNITO -> "authenticate-cognito"
    | REDIRECT -> "redirect"
    | FIXED_RESPONSE -> "fixed-response"
    | JWT_VALIDATION -> "jwt-validation")

let action_to_query path (x : action) =
  List.concat
    [
      action_type_enum_to_query (List.append path [ "Type" ]) x.type_;
      (match x.target_group_arn with
      | None -> []
      | Some v -> target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) v);
      (match x.authenticate_oidc_config with
      | None -> []
      | Some v ->
          authenticate_oidc_action_config_to_query (List.append path [ "AuthenticateOidcConfig" ]) v);
      (match x.authenticate_cognito_config with
      | None -> []
      | Some v ->
          authenticate_cognito_action_config_to_query
            (List.append path [ "AuthenticateCognitoConfig" ])
            v);
      (match x.order with
      | None -> []
      | Some v -> action_order_to_query (List.append path [ "Order" ]) v);
      (match x.redirect_config with
      | None -> []
      | Some v -> redirect_action_config_to_query (List.append path [ "RedirectConfig" ]) v);
      (match x.fixed_response_config with
      | None -> []
      | Some v ->
          fixed_response_action_config_to_query (List.append path [ "FixedResponseConfig" ]) v);
      (match x.forward_config with
      | None -> []
      | Some v -> forward_action_config_to_query (List.append path [ "ForwardConfig" ]) v);
      (match x.jwt_validation_config with
      | None -> []
      | Some v ->
          jwt_validation_action_config_to_query (List.append path [ "JwtValidationConfig" ]) v);
    ]

let actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" action_to_query path xs

let too_many_certificates_exception_to_query path (x : too_many_certificates_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let listener_not_found_exception_to_query path (x : listener_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let certificate_not_found_exception_to_query path (x : certificate_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let default_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let certificate_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let certificate_to_query path (x : certificate) =
  List.concat
    [
      (match x.certificate_arn with
      | None -> []
      | Some v -> certificate_arn_to_query (List.append path [ "CertificateArn" ]) v);
      (match x.is_default with
      | None -> []
      | Some v -> default_to_query (List.append path [ "IsDefault" ]) v);
    ]

let certificate_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" certificate_to_query path xs

let add_listener_certificates_output_to_query path (x : add_listener_certificates_output) =
  List.concat
    [
      (match x.certificates with
      | None -> []
      | Some v -> certificate_list_to_query (List.append path [ "Certificates" ]) v);
    ]

let listener_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let add_listener_certificates_input_to_query path (x : add_listener_certificates_input) =
  List.concat
    [
      listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn;
      certificate_list_to_query (List.append path [ "Certificates" ]) x.certificates;
    ]

let trust_store_not_found_exception_to_query path (x : trust_store_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_tags_exception_to_query path (x : too_many_tags_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let target_group_not_found_exception_to_query path (x : target_group_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let rule_not_found_exception_to_query path (x : rule_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let load_balancer_not_found_exception_to_query path (x : load_balancer_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let duplicate_tag_keys_exception_to_query path (x : duplicate_tag_keys_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let add_tags_output_to_query path _x = []
let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_key_to_query (List.append path [ "Key" ]) x.key;
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let resource_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_arn_to_query path xs

let add_tags_input_to_query path (x : add_tags_input) =
  List.concat
    [
      resource_arns_to_query (List.append path [ "ResourceArns" ]) x.resource_arns;
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let too_many_trust_store_revocation_entries_exception_to_query path
    (x : too_many_trust_store_revocation_entries_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let revocation_content_not_found_exception_to_query path
    (x : revocation_content_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_revocation_content_exception_to_query path (x : invalid_revocation_content_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let number_of_revoked_entries_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let revocation_type_to_query path (x : revocation_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with CRL -> "CRL")

let revocation_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v
let trust_store_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let trust_store_revocation_to_query path (x : trust_store_revocation) =
  List.concat
    [
      (match x.trust_store_arn with
      | None -> []
      | Some v -> trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) v);
      (match x.revocation_id with
      | None -> []
      | Some v -> revocation_id_to_query (List.append path [ "RevocationId" ]) v);
      (match x.revocation_type with
      | None -> []
      | Some v -> revocation_type_to_query (List.append path [ "RevocationType" ]) v);
      (match x.number_of_revoked_entries with
      | None -> []
      | Some v ->
          number_of_revoked_entries_to_query (List.append path [ "NumberOfRevokedEntries" ]) v);
    ]

let trust_store_revocations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" trust_store_revocation_to_query path
    xs

let add_trust_store_revocations_output_to_query path (x : add_trust_store_revocations_output) =
  List.concat
    [
      (match x.trust_store_revocations with
      | None -> []
      | Some v -> trust_store_revocations_to_query (List.append path [ "TrustStoreRevocations" ]) v);
    ]

let s3_object_version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let s3_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let s3_bucket_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let revocation_content_to_query path (x : revocation_content) =
  List.concat
    [
      (match x.s3_bucket with
      | None -> []
      | Some v -> s3_bucket_to_query (List.append path [ "S3Bucket" ]) v);
      (match x.s3_key with
      | None -> []
      | Some v -> s3_key_to_query (List.append path [ "S3Key" ]) v);
      (match x.s3_object_version with
      | None -> []
      | Some v -> s3_object_version_to_query (List.append path [ "S3ObjectVersion" ]) v);
      (match x.revocation_type with
      | None -> []
      | Some v -> revocation_type_to_query (List.append path [ "RevocationType" ]) v);
    ]

let revocation_contents_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" revocation_content_to_query path xs

let add_trust_store_revocations_input_to_query path (x : add_trust_store_revocations_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      (match x.revocation_contents with
      | None -> []
      | Some v -> revocation_contents_to_query (List.append path [ "RevocationContents" ]) v);
    ]

let description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_administrative_override_reason_enum_to_query path
    (x : target_administrative_override_reason_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | INTERNAL_ERROR -> "AdministrativeOverride.Unknown"
    | NO_OVERRIDE_ENGAGED -> "AdministrativeOverride.NoOverride"
    | ZONAL_SHIFT_ENGAGED -> "AdministrativeOverride.ZonalShiftActive"
    | ZONAL_SHIFT_DELEGATED_TO_DNS -> "AdministrativeOverride.ZonalShiftDelegatedToDns")

let target_administrative_override_state_enum_to_query path
    (x : target_administrative_override_state_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | UNKNOWN -> "unknown"
    | NO_OVERRIDE -> "no_override"
    | ZONAL_SHIFT_ACTIVE -> "zonal_shift_active"
    | ZONAL_SHIFT_DELEGATED_TO_DNS -> "zonal_shift_delegated_to_dns")

let administrative_override_to_query path (x : administrative_override) =
  List.concat
    [
      (match x.state with
      | None -> []
      | Some v ->
          target_administrative_override_state_enum_to_query (List.append path [ "State" ]) v);
      (match x.reason with
      | None -> []
      | Some v ->
          target_administrative_override_reason_enum_to_query (List.append path [ "Reason" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let advertise_trust_store_ca_names_enum_to_query path (x : advertise_trust_store_ca_names_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with On -> "on" | Off -> "off")

let allocation_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let allocation_id_not_found_exception_to_query path (x : allocation_id_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let alpn_policy_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let alpn_policy_name_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" alpn_policy_value_to_query path xs

let mitigation_in_effect_enum_to_query path (x : mitigation_in_effect_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with YES -> "yes" | NO -> "no")

let anomaly_result_enum_to_query path (x : anomaly_result_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ANOMALOUS -> "anomalous" | NORMAL -> "normal")

let anomaly_detection_to_query path (x : anomaly_detection) =
  List.concat
    [
      (match x.result_ with
      | None -> []
      | Some v -> anomaly_result_enum_to_query (List.append path [ "Result" ]) v);
      (match x.mitigation_in_effect with
      | None -> []
      | Some v -> mitigation_in_effect_enum_to_query (List.append path [ "MitigationInEffect" ]) v);
    ]

let source_nat_ipv6_prefix_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let source_nat_ipv6_prefixes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" source_nat_ipv6_prefix_to_query path
    xs

let i_pv6_address_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let private_i_pv4_address_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let ip_address_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_address_to_query path (x : load_balancer_address) =
  List.concat
    [
      (match x.ip_address with
      | None -> []
      | Some v -> ip_address_to_query (List.append path [ "IpAddress" ]) v);
      (match x.allocation_id with
      | None -> []
      | Some v -> allocation_id_to_query (List.append path [ "AllocationId" ]) v);
      (match x.private_i_pv4_address with
      | None -> []
      | Some v -> private_i_pv4_address_to_query (List.append path [ "PrivateIPv4Address" ]) v);
      (match x.i_pv6_address with
      | None -> []
      | Some v -> i_pv6_address_to_query (List.append path [ "IPv6Address" ]) v);
    ]

let load_balancer_addresses_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_address_to_query path
    xs

let outpost_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subnet_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let zone_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let availability_zone_to_query path (x : availability_zone) =
  List.concat
    [
      (match x.zone_name with
      | None -> []
      | Some v -> zone_name_to_query (List.append path [ "ZoneName" ]) v);
      (match x.subnet_id with
      | None -> []
      | Some v -> subnet_id_to_query (List.append path [ "SubnetId" ]) v);
      (match x.outpost_id with
      | None -> []
      | Some v -> outpost_id_to_query (List.append path [ "OutpostId" ]) v);
      (match x.load_balancer_addresses with
      | None -> []
      | Some v -> load_balancer_addresses_to_query (List.append path [ "LoadBalancerAddresses" ]) v);
      (match x.source_nat_ipv6_prefixes with
      | None -> []
      | Some v -> source_nat_ipv6_prefixes_to_query (List.append path [ "SourceNatIpv6Prefixes" ]) v);
    ]

let availability_zone_not_supported_exception_to_query path
    (x : availability_zone_not_supported_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" availability_zone_to_query path xs

let ca_certificates_bundle_not_found_exception_to_query path
    (x : ca_certificates_bundle_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let canonical_hosted_zone_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let capacity_decrease_requests_limit_exceeded_exception_to_query path
    (x : capacity_decrease_requests_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let capacity_reservation_pending_exception_to_query path
    (x : capacity_reservation_pending_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let capacity_reservation_state_enum_to_query path (x : capacity_reservation_state_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PROVISIONED -> "provisioned"
    | PENDING -> "pending"
    | REBALANCING -> "rebalancing"
    | FAILED -> "failed")

let state_reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let capacity_reservation_status_to_query path (x : capacity_reservation_status) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> capacity_reservation_state_enum_to_query (List.append path [ "Code" ]) v);
      (match x.reason with
      | None -> []
      | Some v -> state_reason_to_query (List.append path [ "Reason" ]) v);
    ]

let capacity_units_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let capacity_units_double_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let capacity_units_limit_exceeded_exception_to_query path
    (x : capacity_units_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let cipher_priority_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let cipher_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let cipher_to_query path (x : cipher) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> cipher_name_to_query (List.append path [ "Name" ]) v);
      (match x.priority with
      | None -> []
      | Some v -> cipher_priority_to_query (List.append path [ "Priority" ]) v);
    ]

let ciphers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" cipher_to_query path xs

let condition_field_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let unsupported_protocol_exception_to_query path (x : unsupported_protocol_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let trust_store_not_ready_exception_to_query path (x : trust_store_not_ready_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_unique_target_groups_per_load_balancer_exception_to_query path
    (x : too_many_unique_target_groups_per_load_balancer_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_targets_exception_to_query path (x : too_many_targets_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_registrations_for_target_id_exception_to_query path
    (x : too_many_registrations_for_target_id_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_listeners_exception_to_query path (x : too_many_listeners_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_actions_exception_to_query path (x : too_many_actions_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let target_group_association_limit_exception_to_query path
    (x : target_group_association_limit_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let ssl_policy_not_found_exception_to_query path (x : ssl_policy_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_load_balancer_action_exception_to_query path
    (x : invalid_load_balancer_action_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_configuration_request_exception_to_query path
    (x : invalid_configuration_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let incompatible_protocols_exception_to_query path (x : incompatible_protocols_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let duplicate_listener_exception_to_query path (x : duplicate_listener_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let trust_store_association_status_enum_to_query path (x : trust_store_association_status_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ACTIVE -> "active" | REMOVED -> "removed")

let ignore_client_certificate_expiry_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let mode_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let mutual_authentication_attributes_to_query path (x : mutual_authentication_attributes) =
  List.concat
    [
      (match x.mode with None -> [] | Some v -> mode_to_query (List.append path [ "Mode" ]) v);
      (match x.trust_store_arn with
      | None -> []
      | Some v -> trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) v);
      (match x.ignore_client_certificate_expiry with
      | None -> []
      | Some v ->
          ignore_client_certificate_expiry_to_query
            (List.append path [ "IgnoreClientCertificateExpiry" ])
            v);
      (match x.trust_store_association_status with
      | None -> []
      | Some v ->
          trust_store_association_status_enum_to_query
            (List.append path [ "TrustStoreAssociationStatus" ])
            v);
      (match x.advertise_trust_store_ca_names with
      | None -> []
      | Some v ->
          advertise_trust_store_ca_names_enum_to_query
            (List.append path [ "AdvertiseTrustStoreCaNames" ])
            v);
    ]

let ssl_policy_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let protocol_enum_to_query path (x : protocol_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | HTTP -> "HTTP"
    | HTTPS -> "HTTPS"
    | TCP -> "TCP"
    | TLS -> "TLS"
    | UDP -> "UDP"
    | TCP_UDP -> "TCP_UDP"
    | GENEVE -> "GENEVE"
    | QUIC -> "QUIC"
    | TCP_QUIC -> "TCP_QUIC")

let port_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let load_balancer_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let listener_to_query path (x : listener) =
  List.concat
    [
      (match x.listener_arn with
      | None -> []
      | Some v -> listener_arn_to_query (List.append path [ "ListenerArn" ]) v);
      (match x.load_balancer_arn with
      | None -> []
      | Some v -> load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) v);
      (match x.port with None -> [] | Some v -> port_to_query (List.append path [ "Port" ]) v);
      (match x.protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "Protocol" ]) v);
      (match x.certificates with
      | None -> []
      | Some v -> certificate_list_to_query (List.append path [ "Certificates" ]) v);
      (match x.ssl_policy with
      | None -> []
      | Some v -> ssl_policy_name_to_query (List.append path [ "SslPolicy" ]) v);
      (match x.default_actions with
      | None -> []
      | Some v -> actions_to_query (List.append path [ "DefaultActions" ]) v);
      (match x.alpn_policy with
      | None -> []
      | Some v -> alpn_policy_name_to_query (List.append path [ "AlpnPolicy" ]) v);
      (match x.mutual_authentication with
      | None -> []
      | Some v ->
          mutual_authentication_attributes_to_query (List.append path [ "MutualAuthentication" ]) v);
    ]

let listeners_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" listener_to_query path xs

let create_listener_output_to_query path (x : create_listener_output) =
  List.concat
    [
      (match x.listeners with
      | None -> []
      | Some v -> listeners_to_query (List.append path [ "Listeners" ]) v);
    ]

let create_listener_input_to_query path (x : create_listener_input) =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      (match x.protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "Protocol" ]) v);
      (match x.port with None -> [] | Some v -> port_to_query (List.append path [ "Port" ]) v);
      (match x.ssl_policy with
      | None -> []
      | Some v -> ssl_policy_name_to_query (List.append path [ "SslPolicy" ]) v);
      (match x.certificates with
      | None -> []
      | Some v -> certificate_list_to_query (List.append path [ "Certificates" ]) v);
      actions_to_query (List.append path [ "DefaultActions" ]) x.default_actions;
      (match x.alpn_policy with
      | None -> []
      | Some v -> alpn_policy_name_to_query (List.append path [ "AlpnPolicy" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.mutual_authentication with
      | None -> []
      | Some v ->
          mutual_authentication_attributes_to_query (List.append path [ "MutualAuthentication" ]) v);
    ]

let too_many_load_balancers_exception_to_query path (x : too_many_load_balancers_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let subnet_not_found_exception_to_query path (x : subnet_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let resource_in_use_exception_to_query path (x : resource_in_use_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let operation_not_permitted_exception_to_query path (x : operation_not_permitted_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_subnet_exception_to_query path (x : invalid_subnet_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_security_group_exception_to_query path (x : invalid_security_group_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_scheme_exception_to_query path (x : invalid_scheme_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let duplicate_load_balancer_name_exception_to_query path
    (x : duplicate_load_balancer_name_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let ipam_pool_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let ipam_pools_to_query path (x : ipam_pools) =
  List.concat
    [
      (match x.ipv4_ipam_pool_id with
      | None -> []
      | Some v -> ipam_pool_id_to_query (List.append path [ "Ipv4IpamPoolId" ]) v);
    ]

let enable_prefix_for_ipv6_source_nat_enum_to_query path
    (x : enable_prefix_for_ipv6_source_nat_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ON -> "on" | OFF -> "off")

let enforce_security_group_inbound_rules_on_private_link_traffic_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let customer_owned_ipv4_pool_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let ip_address_type_to_query path (x : ip_address_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | IPV4 -> "ipv4"
    | DUALSTACK -> "dualstack"
    | DUALSTACK_WITHOUT_PUBLIC_IPV4 -> "dualstack-without-public-ipv4")

let security_group_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" security_group_id_to_query path xs

let load_balancer_type_enum_to_query path (x : load_balancer_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with APPLICATION -> "application" | NETWORK -> "network" | GATEWAY -> "gateway")

let load_balancer_state_enum_to_query path (x : load_balancer_state_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ACTIVE -> "active"
    | PROVISIONING -> "provisioning"
    | ACTIVE_IMPAIRED -> "active_impaired"
    | FAILED -> "failed")

let load_balancer_state_to_query path (x : load_balancer_state) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> load_balancer_state_enum_to_query (List.append path [ "Code" ]) v);
      (match x.reason with
      | None -> []
      | Some v -> state_reason_to_query (List.append path [ "Reason" ]) v);
    ]

let vpc_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_scheme_enum_to_query path (x : load_balancer_scheme_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INTERNET_FACING -> "internet-facing" | INTERNAL -> "internal")

let load_balancer_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let created_time_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let dns_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_to_query path (x : load_balancer) =
  List.concat
    [
      (match x.load_balancer_arn with
      | None -> []
      | Some v -> load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) v);
      (match x.dns_name with
      | None -> []
      | Some v -> dns_name_to_query (List.append path [ "DNSName" ]) v);
      (match x.canonical_hosted_zone_id with
      | None -> []
      | Some v -> canonical_hosted_zone_id_to_query (List.append path [ "CanonicalHostedZoneId" ]) v);
      (match x.created_time with
      | None -> []
      | Some v -> created_time_to_query (List.append path [ "CreatedTime" ]) v);
      (match x.load_balancer_name with
      | None -> []
      | Some v -> load_balancer_name_to_query (List.append path [ "LoadBalancerName" ]) v);
      (match x.scheme with
      | None -> []
      | Some v -> load_balancer_scheme_enum_to_query (List.append path [ "Scheme" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> vpc_id_to_query (List.append path [ "VpcId" ]) v);
      (match x.state with
      | None -> []
      | Some v -> load_balancer_state_to_query (List.append path [ "State" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> load_balancer_type_enum_to_query (List.append path [ "Type" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> ip_address_type_to_query (List.append path [ "IpAddressType" ]) v);
      (match x.customer_owned_ipv4_pool with
      | None -> []
      | Some v -> customer_owned_ipv4_pool_to_query (List.append path [ "CustomerOwnedIpv4Pool" ]) v);
      (match x.enforce_security_group_inbound_rules_on_private_link_traffic with
      | None -> []
      | Some v ->
          enforce_security_group_inbound_rules_on_private_link_traffic_to_query
            (List.append path [ "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic" ])
            v);
      (match x.enable_prefix_for_ipv6_source_nat with
      | None -> []
      | Some v ->
          enable_prefix_for_ipv6_source_nat_enum_to_query
            (List.append path [ "EnablePrefixForIpv6SourceNat" ])
            v);
      (match x.ipam_pools with
      | None -> []
      | Some v -> ipam_pools_to_query (List.append path [ "IpamPools" ]) v);
    ]

let load_balancers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_to_query path xs

let create_load_balancer_output_to_query path (x : create_load_balancer_output) =
  List.concat
    [
      (match x.load_balancers with
      | None -> []
      | Some v -> load_balancers_to_query (List.append path [ "LoadBalancers" ]) v);
    ]

let subnet_mapping_to_query path (x : subnet_mapping) =
  List.concat
    [
      (match x.subnet_id with
      | None -> []
      | Some v -> subnet_id_to_query (List.append path [ "SubnetId" ]) v);
      (match x.allocation_id with
      | None -> []
      | Some v -> allocation_id_to_query (List.append path [ "AllocationId" ]) v);
      (match x.private_i_pv4_address with
      | None -> []
      | Some v -> private_i_pv4_address_to_query (List.append path [ "PrivateIPv4Address" ]) v);
      (match x.i_pv6_address with
      | None -> []
      | Some v -> i_pv6_address_to_query (List.append path [ "IPv6Address" ]) v);
      (match x.source_nat_ipv6_prefix with
      | None -> []
      | Some v -> source_nat_ipv6_prefix_to_query (List.append path [ "SourceNatIpv6Prefix" ]) v);
    ]

let subnet_mappings_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" subnet_mapping_to_query path xs

let subnets_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" subnet_id_to_query path xs

let create_load_balancer_input_to_query path (x : create_load_balancer_input) =
  List.concat
    [
      load_balancer_name_to_query (List.append path [ "Name" ]) x.name;
      (match x.subnets with
      | None -> []
      | Some v -> subnets_to_query (List.append path [ "Subnets" ]) v);
      (match x.subnet_mappings with
      | None -> []
      | Some v -> subnet_mappings_to_query (List.append path [ "SubnetMappings" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.scheme with
      | None -> []
      | Some v -> load_balancer_scheme_enum_to_query (List.append path [ "Scheme" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> load_balancer_type_enum_to_query (List.append path [ "Type" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> ip_address_type_to_query (List.append path [ "IpAddressType" ]) v);
      (match x.customer_owned_ipv4_pool with
      | None -> []
      | Some v -> customer_owned_ipv4_pool_to_query (List.append path [ "CustomerOwnedIpv4Pool" ]) v);
      (match x.enable_prefix_for_ipv6_source_nat with
      | None -> []
      | Some v ->
          enable_prefix_for_ipv6_source_nat_enum_to_query
            (List.append path [ "EnablePrefixForIpv6SourceNat" ])
            v);
      (match x.ipam_pools with
      | None -> []
      | Some v -> ipam_pools_to_query (List.append path [ "IpamPools" ]) v);
    ]

let too_many_target_groups_exception_to_query path (x : too_many_target_groups_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_rules_exception_to_query path (x : too_many_rules_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let priority_in_use_exception_to_query path (x : priority_in_use_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let string_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let rewrite_config_to_query path (x : rewrite_config) =
  List.concat
    [
      string_value_to_query (List.append path [ "Regex" ]) x.regex;
      string_value_to_query (List.append path [ "Replace" ]) x.replace;
    ]

let rewrite_config_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rewrite_config_to_query path xs

let url_rewrite_config_to_query path (x : url_rewrite_config) =
  List.concat
    [
      (match x.rewrites with
      | None -> []
      | Some v -> rewrite_config_list_to_query (List.append path [ "Rewrites" ]) v);
    ]

let host_header_rewrite_config_to_query path (x : host_header_rewrite_config) =
  List.concat
    [
      (match x.rewrites with
      | None -> []
      | Some v -> rewrite_config_list_to_query (List.append path [ "Rewrites" ]) v);
    ]

let transform_type_enum_to_query path (x : transform_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with HOST_HEADER_REWRITE -> "host-header-rewrite" | URL_REWRITE -> "url-rewrite")

let rule_transform_to_query path (x : rule_transform) =
  List.concat
    [
      transform_type_enum_to_query (List.append path [ "Type" ]) x.type_;
      (match x.host_header_rewrite_config with
      | None -> []
      | Some v ->
          host_header_rewrite_config_to_query (List.append path [ "HostHeaderRewriteConfig" ]) v);
      (match x.url_rewrite_config with
      | None -> []
      | Some v -> url_rewrite_config_to_query (List.append path [ "UrlRewriteConfig" ]) v);
    ]

let rule_transform_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rule_transform_to_query path xs

let is_default_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let list_of_string_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string_value_to_query path xs

let source_ip_condition_config_to_query path (x : source_ip_condition_config) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "Values" ]) v);
    ]

let http_request_method_condition_config_to_query path (x : http_request_method_condition_config) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "Values" ]) v);
    ]

let query_string_key_value_pair_to_query path (x : query_string_key_value_pair) =
  List.concat
    [
      (match x.key with
      | None -> []
      | Some v -> string_value_to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> string_value_to_query (List.append path [ "Value" ]) v);
    ]

let query_string_key_value_pair_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" query_string_key_value_pair_to_query
    path xs

let query_string_condition_config_to_query path (x : query_string_condition_config) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> query_string_key_value_pair_list_to_query (List.append path [ "Values" ]) v);
    ]

let http_header_condition_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let http_header_condition_config_to_query path (x : http_header_condition_config) =
  List.concat
    [
      (match x.http_header_name with
      | None -> []
      | Some v -> http_header_condition_name_to_query (List.append path [ "HttpHeaderName" ]) v);
      (match x.values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "Values" ]) v);
      (match x.regex_values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "RegexValues" ]) v);
    ]

let path_pattern_condition_config_to_query path (x : path_pattern_condition_config) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "Values" ]) v);
      (match x.regex_values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "RegexValues" ]) v);
    ]

let host_header_condition_config_to_query path (x : host_header_condition_config) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "Values" ]) v);
      (match x.regex_values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "RegexValues" ]) v);
    ]

let rule_condition_to_query path (x : rule_condition) =
  List.concat
    [
      (match x.field with
      | None -> []
      | Some v -> condition_field_name_to_query (List.append path [ "Field" ]) v);
      (match x.values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "Values" ]) v);
      (match x.host_header_config with
      | None -> []
      | Some v -> host_header_condition_config_to_query (List.append path [ "HostHeaderConfig" ]) v);
      (match x.path_pattern_config with
      | None -> []
      | Some v ->
          path_pattern_condition_config_to_query (List.append path [ "PathPatternConfig" ]) v);
      (match x.http_header_config with
      | None -> []
      | Some v -> http_header_condition_config_to_query (List.append path [ "HttpHeaderConfig" ]) v);
      (match x.query_string_config with
      | None -> []
      | Some v ->
          query_string_condition_config_to_query (List.append path [ "QueryStringConfig" ]) v);
      (match x.http_request_method_config with
      | None -> []
      | Some v ->
          http_request_method_condition_config_to_query
            (List.append path [ "HttpRequestMethodConfig" ])
            v);
      (match x.source_ip_config with
      | None -> []
      | Some v -> source_ip_condition_config_to_query (List.append path [ "SourceIpConfig" ]) v);
      (match x.regex_values with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "RegexValues" ]) v);
    ]

let rule_condition_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rule_condition_to_query path xs

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let rule_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let rule_to_query path (x : rule) =
  List.concat
    [
      (match x.rule_arn with
      | None -> []
      | Some v -> rule_arn_to_query (List.append path [ "RuleArn" ]) v);
      (match x.priority with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Priority" ]) v);
      (match x.conditions with
      | None -> []
      | Some v -> rule_condition_list_to_query (List.append path [ "Conditions" ]) v);
      (match x.actions with
      | None -> []
      | Some v -> actions_to_query (List.append path [ "Actions" ]) v);
      (match x.is_default with
      | None -> []
      | Some v -> is_default_to_query (List.append path [ "IsDefault" ]) v);
      (match x.transforms with
      | None -> []
      | Some v -> rule_transform_list_to_query (List.append path [ "Transforms" ]) v);
    ]

let rules_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rule_to_query path xs

let create_rule_output_to_query path (x : create_rule_output) =
  List.concat
    [
      (match x.rules with None -> [] | Some v -> rules_to_query (List.append path [ "Rules" ]) v);
    ]

let rule_priority_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let create_rule_input_to_query path (x : create_rule_input) =
  List.concat
    [
      listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn;
      rule_condition_list_to_query (List.append path [ "Conditions" ]) x.conditions;
      rule_priority_to_query (List.append path [ "Priority" ]) x.priority;
      actions_to_query (List.append path [ "Actions" ]) x.actions;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.transforms with
      | None -> []
      | Some v -> rule_transform_list_to_query (List.append path [ "Transforms" ]) v);
    ]

let duplicate_target_group_name_exception_to_query path (x : duplicate_target_group_name_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let target_control_port_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let target_group_ip_address_type_enum_to_query path (x : target_group_ip_address_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IPV4 -> "ipv4" | IPV6 -> "ipv6")

let protocol_version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_type_enum_to_query path (x : target_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INSTANCE -> "instance" | IP -> "ip" | LAMBDA -> "lambda" | ALB -> "alb")

let load_balancer_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_arn_to_query path xs

let grpc_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let http_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let matcher_to_query path (x : matcher) =
  List.concat
    [
      (match x.http_code with
      | None -> []
      | Some v -> http_code_to_query (List.append path [ "HttpCode" ]) v);
      (match x.grpc_code with
      | None -> []
      | Some v -> grpc_code_to_query (List.append path [ "GrpcCode" ]) v);
    ]

let path_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let health_check_threshold_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let health_check_timeout_seconds_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let health_check_interval_seconds_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let health_check_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let health_check_port_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let target_group_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_group_to_query path (x : target_group) =
  List.concat
    [
      (match x.target_group_arn with
      | None -> []
      | Some v -> target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) v);
      (match x.target_group_name with
      | None -> []
      | Some v -> target_group_name_to_query (List.append path [ "TargetGroupName" ]) v);
      (match x.protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "Protocol" ]) v);
      (match x.port with None -> [] | Some v -> port_to_query (List.append path [ "Port" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> vpc_id_to_query (List.append path [ "VpcId" ]) v);
      (match x.health_check_protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "HealthCheckProtocol" ]) v);
      (match x.health_check_port with
      | None -> []
      | Some v -> health_check_port_to_query (List.append path [ "HealthCheckPort" ]) v);
      (match x.health_check_enabled with
      | None -> []
      | Some v -> health_check_enabled_to_query (List.append path [ "HealthCheckEnabled" ]) v);
      (match x.health_check_interval_seconds with
      | None -> []
      | Some v ->
          health_check_interval_seconds_to_query
            (List.append path [ "HealthCheckIntervalSeconds" ])
            v);
      (match x.health_check_timeout_seconds with
      | None -> []
      | Some v ->
          health_check_timeout_seconds_to_query (List.append path [ "HealthCheckTimeoutSeconds" ]) v);
      (match x.healthy_threshold_count with
      | None -> []
      | Some v ->
          health_check_threshold_count_to_query (List.append path [ "HealthyThresholdCount" ]) v);
      (match x.unhealthy_threshold_count with
      | None -> []
      | Some v ->
          health_check_threshold_count_to_query (List.append path [ "UnhealthyThresholdCount" ]) v);
      (match x.health_check_path with
      | None -> []
      | Some v -> path_to_query (List.append path [ "HealthCheckPath" ]) v);
      (match x.matcher with
      | None -> []
      | Some v -> matcher_to_query (List.append path [ "Matcher" ]) v);
      (match x.load_balancer_arns with
      | None -> []
      | Some v -> load_balancer_arns_to_query (List.append path [ "LoadBalancerArns" ]) v);
      (match x.target_type with
      | None -> []
      | Some v -> target_type_enum_to_query (List.append path [ "TargetType" ]) v);
      (match x.protocol_version with
      | None -> []
      | Some v -> protocol_version_to_query (List.append path [ "ProtocolVersion" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v ->
          target_group_ip_address_type_enum_to_query (List.append path [ "IpAddressType" ]) v);
      (match x.target_control_port with
      | None -> []
      | Some v -> target_control_port_to_query (List.append path [ "TargetControlPort" ]) v);
    ]

let target_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_group_to_query path xs

let create_target_group_output_to_query path (x : create_target_group_output) =
  List.concat
    [
      (match x.target_groups with
      | None -> []
      | Some v -> target_groups_to_query (List.append path [ "TargetGroups" ]) v);
    ]

let create_target_group_input_to_query path (x : create_target_group_input) =
  List.concat
    [
      target_group_name_to_query (List.append path [ "Name" ]) x.name;
      (match x.protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "Protocol" ]) v);
      (match x.protocol_version with
      | None -> []
      | Some v -> protocol_version_to_query (List.append path [ "ProtocolVersion" ]) v);
      (match x.port with None -> [] | Some v -> port_to_query (List.append path [ "Port" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> vpc_id_to_query (List.append path [ "VpcId" ]) v);
      (match x.health_check_protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "HealthCheckProtocol" ]) v);
      (match x.health_check_port with
      | None -> []
      | Some v -> health_check_port_to_query (List.append path [ "HealthCheckPort" ]) v);
      (match x.health_check_enabled with
      | None -> []
      | Some v -> health_check_enabled_to_query (List.append path [ "HealthCheckEnabled" ]) v);
      (match x.health_check_path with
      | None -> []
      | Some v -> path_to_query (List.append path [ "HealthCheckPath" ]) v);
      (match x.health_check_interval_seconds with
      | None -> []
      | Some v ->
          health_check_interval_seconds_to_query
            (List.append path [ "HealthCheckIntervalSeconds" ])
            v);
      (match x.health_check_timeout_seconds with
      | None -> []
      | Some v ->
          health_check_timeout_seconds_to_query (List.append path [ "HealthCheckTimeoutSeconds" ]) v);
      (match x.healthy_threshold_count with
      | None -> []
      | Some v ->
          health_check_threshold_count_to_query (List.append path [ "HealthyThresholdCount" ]) v);
      (match x.unhealthy_threshold_count with
      | None -> []
      | Some v ->
          health_check_threshold_count_to_query (List.append path [ "UnhealthyThresholdCount" ]) v);
      (match x.matcher with
      | None -> []
      | Some v -> matcher_to_query (List.append path [ "Matcher" ]) v);
      (match x.target_type with
      | None -> []
      | Some v -> target_type_enum_to_query (List.append path [ "TargetType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v ->
          target_group_ip_address_type_enum_to_query (List.append path [ "IpAddressType" ]) v);
      (match x.target_control_port with
      | None -> []
      | Some v -> target_control_port_to_query (List.append path [ "TargetControlPort" ]) v);
    ]

let too_many_trust_stores_exception_to_query path (x : too_many_trust_stores_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_ca_certificates_bundle_exception_to_query path
    (x : invalid_ca_certificates_bundle_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let duplicate_trust_store_name_exception_to_query path (x : duplicate_trust_store_name_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let total_revoked_entries_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let number_of_ca_certificates_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let trust_store_status_to_query path (x : trust_store_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ACTIVE -> "ACTIVE" | CREATING -> "CREATING")

let trust_store_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let trust_store_to_query path (x : trust_store) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> trust_store_name_to_query (List.append path [ "Name" ]) v);
      (match x.trust_store_arn with
      | None -> []
      | Some v -> trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> trust_store_status_to_query (List.append path [ "Status" ]) v);
      (match x.number_of_ca_certificates with
      | None -> []
      | Some v ->
          number_of_ca_certificates_to_query (List.append path [ "NumberOfCaCertificates" ]) v);
      (match x.total_revoked_entries with
      | None -> []
      | Some v -> total_revoked_entries_to_query (List.append path [ "TotalRevokedEntries" ]) v);
    ]

let trust_stores_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" trust_store_to_query path xs

let create_trust_store_output_to_query path (x : create_trust_store_output) =
  List.concat
    [
      (match x.trust_stores with
      | None -> []
      | Some v -> trust_stores_to_query (List.append path [ "TrustStores" ]) v);
    ]

let create_trust_store_input_to_query path (x : create_trust_store_input) =
  List.concat
    [
      trust_store_name_to_query (List.append path [ "Name" ]) x.name;
      s3_bucket_to_query
        (List.append path [ "CaCertificatesBundleS3Bucket" ])
        x.ca_certificates_bundle_s3_bucket;
      s3_key_to_query
        (List.append path [ "CaCertificatesBundleS3Key" ])
        x.ca_certificates_bundle_s3_key;
      (match x.ca_certificates_bundle_s3_object_version with
      | None -> []
      | Some v ->
          s3_object_version_to_query (List.append path [ "CaCertificatesBundleS3ObjectVersion" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let decrease_requests_remaining_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let delete_association_same_account_exception_to_query path
    (x : delete_association_same_account_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let delete_listener_output_to_query path _x = []

let delete_listener_input_to_query path (x : delete_listener_input) =
  List.concat [ listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn ]

let delete_load_balancer_output_to_query path _x = []

let delete_load_balancer_input_to_query path (x : delete_load_balancer_input) =
  List.concat
    [ load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn ]

let delete_rule_output_to_query path _x = []

let delete_rule_input_to_query path (x : delete_rule_input) =
  List.concat [ rule_arn_to_query (List.append path [ "RuleArn" ]) x.rule_arn ]

let trust_store_association_not_found_exception_to_query path
    (x : trust_store_association_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let delete_shared_trust_store_association_output_to_query path _x = []

let delete_shared_trust_store_association_input_to_query path
    (x : delete_shared_trust_store_association_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      resource_arn_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
    ]

let delete_target_group_output_to_query path _x = []

let delete_target_group_input_to_query path (x : delete_target_group_input) =
  List.concat
    [ target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn ]

let trust_store_in_use_exception_to_query path (x : trust_store_in_use_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let delete_trust_store_output_to_query path _x = []

let delete_trust_store_input_to_query path (x : delete_trust_store_input) =
  List.concat [ trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn ]

let invalid_target_exception_to_query path (x : invalid_target_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let deregister_targets_output_to_query path _x = []
let quic_server_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let target_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_description_to_query path (x : target_description) =
  List.concat
    [
      target_id_to_query (List.append path [ "Id" ]) x.id;
      (match x.port with None -> [] | Some v -> port_to_query (List.append path [ "Port" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> zone_name_to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.quic_server_id with
      | None -> []
      | Some v -> quic_server_id_to_query (List.append path [ "QuicServerId" ]) v);
    ]

let target_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_description_to_query path xs

let deregister_targets_input_to_query path (x : deregister_targets_input) =
  List.concat
    [
      target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn;
      target_descriptions_to_query (List.append path [ "Targets" ]) x.targets;
    ]

let marker_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let max_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let limit_to_query path (x : limit) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> name_to_query (List.append path [ "Name" ]) v);
      (match x.max with None -> [] | Some v -> max_to_query (List.append path [ "Max" ]) v);
    ]

let limits_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" limit_to_query path xs

let describe_account_limits_output_to_query path (x : describe_account_limits_output) =
  List.concat
    [
      (match x.limits with
      | None -> []
      | Some v -> limits_to_query (List.append path [ "Limits" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let page_size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_account_limits_input_to_query path (x : describe_account_limits_input) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let zonal_capacity_reservation_state_to_query path (x : zonal_capacity_reservation_state) =
  List.concat
    [
      (match x.state with
      | None -> []
      | Some v -> capacity_reservation_status_to_query (List.append path [ "State" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> zone_name_to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.effective_capacity_units with
      | None -> []
      | Some v -> capacity_units_double_to_query (List.append path [ "EffectiveCapacityUnits" ]) v);
    ]

let zonal_capacity_reservation_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    zonal_capacity_reservation_state_to_query path xs

let minimum_load_balancer_capacity_to_query path (x : minimum_load_balancer_capacity) =
  List.concat
    [
      (match x.capacity_units with
      | None -> []
      | Some v -> capacity_units_to_query (List.append path [ "CapacityUnits" ]) v);
    ]

let last_modified_time_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let describe_capacity_reservation_output_to_query path (x : describe_capacity_reservation_output) =
  List.concat
    [
      (match x.last_modified_time with
      | None -> []
      | Some v -> last_modified_time_to_query (List.append path [ "LastModifiedTime" ]) v);
      (match x.decrease_requests_remaining with
      | None -> []
      | Some v ->
          decrease_requests_remaining_to_query (List.append path [ "DecreaseRequestsRemaining" ]) v);
      (match x.minimum_load_balancer_capacity with
      | None -> []
      | Some v ->
          minimum_load_balancer_capacity_to_query
            (List.append path [ "MinimumLoadBalancerCapacity" ])
            v);
      (match x.capacity_reservation_state with
      | None -> []
      | Some v ->
          zonal_capacity_reservation_states_to_query
            (List.append path [ "CapacityReservationState" ])
            v);
    ]

let describe_capacity_reservation_input_to_query path (x : describe_capacity_reservation_input) =
  List.concat
    [ load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn ]

let listener_attribute_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let listener_attribute_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let listener_attribute_to_query path (x : listener_attribute) =
  List.concat
    [
      (match x.key with
      | None -> []
      | Some v -> listener_attribute_key_to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> listener_attribute_value_to_query (List.append path [ "Value" ]) v);
    ]

let listener_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" listener_attribute_to_query path xs

let describe_listener_attributes_output_to_query path (x : describe_listener_attributes_output) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> listener_attributes_to_query (List.append path [ "Attributes" ]) v);
    ]

let describe_listener_attributes_input_to_query path (x : describe_listener_attributes_input) =
  List.concat [ listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn ]

let describe_listener_certificates_output_to_query path (x : describe_listener_certificates_output)
    =
  List.concat
    [
      (match x.certificates with
      | None -> []
      | Some v -> certificate_list_to_query (List.append path [ "Certificates" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let describe_listener_certificates_input_to_query path (x : describe_listener_certificates_input) =
  List.concat
    [
      listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn;
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let describe_listeners_output_to_query path (x : describe_listeners_output) =
  List.concat
    [
      (match x.listeners with
      | None -> []
      | Some v -> listeners_to_query (List.append path [ "Listeners" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let listener_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" listener_arn_to_query path xs

let describe_listeners_input_to_query path (x : describe_listeners_input) =
  List.concat
    [
      (match x.load_balancer_arn with
      | None -> []
      | Some v -> load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) v);
      (match x.listener_arns with
      | None -> []
      | Some v -> listener_arns_to_query (List.append path [ "ListenerArns" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let load_balancer_attribute_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_attribute_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_attribute_to_query path (x : load_balancer_attribute) =
  List.concat
    [
      (match x.key with
      | None -> []
      | Some v -> load_balancer_attribute_key_to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> load_balancer_attribute_value_to_query (List.append path [ "Value" ]) v);
    ]

let load_balancer_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_attribute_to_query
    path xs

let describe_load_balancer_attributes_output_to_query path
    (x : describe_load_balancer_attributes_output) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> load_balancer_attributes_to_query (List.append path [ "Attributes" ]) v);
    ]

let describe_load_balancer_attributes_input_to_query path
    (x : describe_load_balancer_attributes_input) =
  List.concat
    [ load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn ]

let describe_load_balancers_output_to_query path (x : describe_load_balancers_output) =
  List.concat
    [
      (match x.load_balancers with
      | None -> []
      | Some v -> load_balancers_to_query (List.append path [ "LoadBalancers" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let load_balancer_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_name_to_query path xs

let describe_load_balancers_input_to_query path (x : describe_load_balancers_input) =
  List.concat
    [
      (match x.load_balancer_arns with
      | None -> []
      | Some v -> load_balancer_arns_to_query (List.append path [ "LoadBalancerArns" ]) v);
      (match x.names with
      | None -> []
      | Some v -> load_balancer_names_to_query (List.append path [ "Names" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let describe_rules_output_to_query path (x : describe_rules_output) =
  List.concat
    [
      (match x.rules with None -> [] | Some v -> rules_to_query (List.append path [ "Rules" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let rule_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rule_arn_to_query path xs

let describe_rules_input_to_query path (x : describe_rules_input) =
  List.concat
    [
      (match x.listener_arn with
      | None -> []
      | Some v -> listener_arn_to_query (List.append path [ "ListenerArn" ]) v);
      (match x.rule_arns with
      | None -> []
      | Some v -> rule_arns_to_query (List.append path [ "RuleArns" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let ssl_protocol_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let ssl_protocols_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ssl_protocol_to_query path xs

let ssl_policy_to_query path (x : ssl_policy) =
  List.concat
    [
      (match x.ssl_protocols with
      | None -> []
      | Some v -> ssl_protocols_to_query (List.append path [ "SslProtocols" ]) v);
      (match x.ciphers with
      | None -> []
      | Some v -> ciphers_to_query (List.append path [ "Ciphers" ]) v);
      (match x.name with
      | None -> []
      | Some v -> ssl_policy_name_to_query (List.append path [ "Name" ]) v);
      (match x.supported_load_balancer_types with
      | None -> []
      | Some v -> list_of_string_to_query (List.append path [ "SupportedLoadBalancerTypes" ]) v);
    ]

let ssl_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ssl_policy_to_query path xs

let describe_ssl_policies_output_to_query path (x : describe_ssl_policies_output) =
  List.concat
    [
      (match x.ssl_policies with
      | None -> []
      | Some v -> ssl_policies_to_query (List.append path [ "SslPolicies" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let ssl_policy_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ssl_policy_name_to_query path xs

let describe_ssl_policies_input_to_query path (x : describe_ssl_policies_input) =
  List.concat
    [
      (match x.names with
      | None -> []
      | Some v -> ssl_policy_names_to_query (List.append path [ "Names" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
      (match x.load_balancer_type with
      | None -> []
      | Some v -> load_balancer_type_enum_to_query (List.append path [ "LoadBalancerType" ]) v);
    ]

let tag_description_to_query path (x : tag_description) =
  List.concat
    [
      (match x.resource_arn with
      | None -> []
      | Some v -> resource_arn_to_query (List.append path [ "ResourceArn" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let tag_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_description_to_query path xs

let describe_tags_output_to_query path (x : describe_tags_output) =
  List.concat
    [
      (match x.tag_descriptions with
      | None -> []
      | Some v -> tag_descriptions_to_query (List.append path [ "TagDescriptions" ]) v);
    ]

let describe_tags_input_to_query path (x : describe_tags_input) =
  List.concat [ resource_arns_to_query (List.append path [ "ResourceArns" ]) x.resource_arns ]

let target_group_attribute_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_group_attribute_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_group_attribute_to_query path (x : target_group_attribute) =
  List.concat
    [
      (match x.key with
      | None -> []
      | Some v -> target_group_attribute_key_to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> target_group_attribute_value_to_query (List.append path [ "Value" ]) v);
    ]

let target_group_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_group_attribute_to_query path
    xs

let describe_target_group_attributes_output_to_query path
    (x : describe_target_group_attributes_output) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> target_group_attributes_to_query (List.append path [ "Attributes" ]) v);
    ]

let describe_target_group_attributes_input_to_query path
    (x : describe_target_group_attributes_input) =
  List.concat
    [ target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn ]

let describe_target_groups_output_to_query path (x : describe_target_groups_output) =
  List.concat
    [
      (match x.target_groups with
      | None -> []
      | Some v -> target_groups_to_query (List.append path [ "TargetGroups" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let target_group_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_group_name_to_query path xs

let target_group_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_group_arn_to_query path xs

let describe_target_groups_input_to_query path (x : describe_target_groups_input) =
  List.concat
    [
      (match x.load_balancer_arn with
      | None -> []
      | Some v -> load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) v);
      (match x.target_group_arns with
      | None -> []
      | Some v -> target_group_arns_to_query (List.append path [ "TargetGroupArns" ]) v);
      (match x.names with
      | None -> []
      | Some v -> target_group_names_to_query (List.append path [ "Names" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let health_unavailable_exception_to_query path (x : health_unavailable_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let target_health_reason_enum_to_query path (x : target_health_reason_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | REGISTRATION_IN_PROGRESS -> "Elb.RegistrationInProgress"
    | INITIAL_HEALTH_CHECKING -> "Elb.InitialHealthChecking"
    | RESPONSE_CODE_MISMATCH -> "Target.ResponseCodeMismatch"
    | TIMEOUT -> "Target.Timeout"
    | FAILED_HEALTH_CHECKS -> "Target.FailedHealthChecks"
    | NOT_REGISTERED -> "Target.NotRegistered"
    | NOT_IN_USE -> "Target.NotInUse"
    | DEREGISTRATION_IN_PROGRESS -> "Target.DeregistrationInProgress"
    | INVALID_STATE -> "Target.InvalidState"
    | IP_UNUSABLE -> "Target.IpUnusable"
    | HEALTH_CHECK_DISABLED -> "Target.HealthCheckDisabled"
    | INTERNAL_ERROR -> "Elb.InternalError")

let target_health_state_enum_to_query path (x : target_health_state_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | INITIAL -> "initial"
    | HEALTHY -> "healthy"
    | UNHEALTHY -> "unhealthy"
    | UNHEALTHY_DRAINING -> "unhealthy.draining"
    | UNUSED -> "unused"
    | DRAINING -> "draining"
    | UNAVAILABLE -> "unavailable")

let target_health_to_query path (x : target_health) =
  List.concat
    [
      (match x.state with
      | None -> []
      | Some v -> target_health_state_enum_to_query (List.append path [ "State" ]) v);
      (match x.reason with
      | None -> []
      | Some v -> target_health_reason_enum_to_query (List.append path [ "Reason" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let target_health_description_to_query path (x : target_health_description) =
  List.concat
    [
      (match x.target with
      | None -> []
      | Some v -> target_description_to_query (List.append path [ "Target" ]) v);
      (match x.health_check_port with
      | None -> []
      | Some v -> health_check_port_to_query (List.append path [ "HealthCheckPort" ]) v);
      (match x.target_health with
      | None -> []
      | Some v -> target_health_to_query (List.append path [ "TargetHealth" ]) v);
      (match x.anomaly_detection with
      | None -> []
      | Some v -> anomaly_detection_to_query (List.append path [ "AnomalyDetection" ]) v);
      (match x.administrative_override with
      | None -> []
      | Some v -> administrative_override_to_query (List.append path [ "AdministrativeOverride" ]) v);
    ]

let target_health_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" target_health_description_to_query
    path xs

let describe_target_health_output_to_query path (x : describe_target_health_output) =
  List.concat
    [
      (match x.target_health_descriptions with
      | None -> []
      | Some v ->
          target_health_descriptions_to_query (List.append path [ "TargetHealthDescriptions" ]) v);
    ]

let describe_target_health_input_include_enum_to_query path
    (x : describe_target_health_input_include_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ANOMALY -> "AnomalyDetection" | ALL -> "All")

let list_of_describe_target_health_include_options_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    describe_target_health_input_include_enum_to_query path xs

let describe_target_health_input_to_query path (x : describe_target_health_input) =
  List.concat
    [
      target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn;
      (match x.targets with
      | None -> []
      | Some v -> target_descriptions_to_query (List.append path [ "Targets" ]) v);
      (match x.include_ with
      | None -> []
      | Some v ->
          list_of_describe_target_health_include_options_to_query (List.append path [ "Include" ]) v);
    ]

let trust_store_association_resource_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let trust_store_association_to_query path (x : trust_store_association) =
  List.concat
    [
      (match x.resource_arn with
      | None -> []
      | Some v ->
          trust_store_association_resource_arn_to_query (List.append path [ "ResourceArn" ]) v);
    ]

let trust_store_associations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" trust_store_association_to_query
    path xs

let describe_trust_store_associations_output_to_query path
    (x : describe_trust_store_associations_output) =
  List.concat
    [
      (match x.trust_store_associations with
      | None -> []
      | Some v ->
          trust_store_associations_to_query (List.append path [ "TrustStoreAssociations" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let describe_trust_store_associations_input_to_query path
    (x : describe_trust_store_associations_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let describe_trust_store_revocation_to_query path (x : describe_trust_store_revocation) =
  List.concat
    [
      (match x.trust_store_arn with
      | None -> []
      | Some v -> trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) v);
      (match x.revocation_id with
      | None -> []
      | Some v -> revocation_id_to_query (List.append path [ "RevocationId" ]) v);
      (match x.revocation_type with
      | None -> []
      | Some v -> revocation_type_to_query (List.append path [ "RevocationType" ]) v);
      (match x.number_of_revoked_entries with
      | None -> []
      | Some v ->
          number_of_revoked_entries_to_query (List.append path [ "NumberOfRevokedEntries" ]) v);
    ]

let describe_trust_store_revocation_response_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    describe_trust_store_revocation_to_query path xs

let revocation_id_not_found_exception_to_query path (x : revocation_id_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let describe_trust_store_revocations_output_to_query path
    (x : describe_trust_store_revocations_output) =
  List.concat
    [
      (match x.trust_store_revocations with
      | None -> []
      | Some v ->
          describe_trust_store_revocation_response_to_query
            (List.append path [ "TrustStoreRevocations" ])
            v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let revocation_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" revocation_id_to_query path xs

let describe_trust_store_revocations_input_to_query path
    (x : describe_trust_store_revocations_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      (match x.revocation_ids with
      | None -> []
      | Some v -> revocation_ids_to_query (List.append path [ "RevocationIds" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let describe_trust_stores_output_to_query path (x : describe_trust_stores_output) =
  List.concat
    [
      (match x.trust_stores with
      | None -> []
      | Some v -> trust_stores_to_query (List.append path [ "TrustStores" ]) v);
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
    ]

let trust_store_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" trust_store_name_to_query path xs

let trust_store_arns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" trust_store_arn_to_query path xs

let describe_trust_stores_input_to_query path (x : describe_trust_stores_input) =
  List.concat
    [
      (match x.trust_store_arns with
      | None -> []
      | Some v -> trust_store_arns_to_query (List.append path [ "TrustStoreArns" ]) v);
      (match x.names with
      | None -> []
      | Some v -> trust_store_names_to_query (List.append path [ "Names" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
    ]

let set_subnets_output_to_query path (x : set_subnets_output) =
  List.concat
    [
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> ip_address_type_to_query (List.append path [ "IpAddressType" ]) v);
      (match x.enable_prefix_for_ipv6_source_nat with
      | None -> []
      | Some v ->
          enable_prefix_for_ipv6_source_nat_enum_to_query
            (List.append path [ "EnablePrefixForIpv6SourceNat" ])
            v);
    ]

let set_subnets_input_to_query path (x : set_subnets_input) =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      (match x.subnets with
      | None -> []
      | Some v -> subnets_to_query (List.append path [ "Subnets" ]) v);
      (match x.subnet_mappings with
      | None -> []
      | Some v -> subnet_mappings_to_query (List.append path [ "SubnetMappings" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> ip_address_type_to_query (List.append path [ "IpAddressType" ]) v);
      (match x.enable_prefix_for_ipv6_source_nat with
      | None -> []
      | Some v ->
          enable_prefix_for_ipv6_source_nat_enum_to_query
            (List.append path [ "EnablePrefixForIpv6SourceNat" ])
            v);
    ]

let enforce_security_group_inbound_rules_on_private_link_traffic_enum_to_query path
    (x : enforce_security_group_inbound_rules_on_private_link_traffic_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with On -> "on" | Off -> "off")

let set_security_groups_output_to_query path (x : set_security_groups_output) =
  List.concat
    [
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.enforce_security_group_inbound_rules_on_private_link_traffic with
      | None -> []
      | Some v ->
          enforce_security_group_inbound_rules_on_private_link_traffic_enum_to_query
            (List.append path [ "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic" ])
            v);
    ]

let set_security_groups_input_to_query path (x : set_security_groups_input) =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      security_groups_to_query (List.append path [ "SecurityGroups" ]) x.security_groups;
      (match x.enforce_security_group_inbound_rules_on_private_link_traffic with
      | None -> []
      | Some v ->
          enforce_security_group_inbound_rules_on_private_link_traffic_enum_to_query
            (List.append path [ "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic" ])
            v);
    ]

let set_rule_priorities_output_to_query path (x : set_rule_priorities_output) =
  List.concat
    [
      (match x.rules with None -> [] | Some v -> rules_to_query (List.append path [ "Rules" ]) v);
    ]

let rule_priority_pair_to_query path (x : rule_priority_pair) =
  List.concat
    [
      (match x.rule_arn with
      | None -> []
      | Some v -> rule_arn_to_query (List.append path [ "RuleArn" ]) v);
      (match x.priority with
      | None -> []
      | Some v -> rule_priority_to_query (List.append path [ "Priority" ]) v);
    ]

let rule_priority_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rule_priority_pair_to_query path xs

let set_rule_priorities_input_to_query path (x : set_rule_priorities_input) =
  List.concat
    [ rule_priority_list_to_query (List.append path [ "RulePriorities" ]) x.rule_priorities ]

let set_ip_address_type_output_to_query path (x : set_ip_address_type_output) =
  List.concat
    [
      (match x.ip_address_type with
      | None -> []
      | Some v -> ip_address_type_to_query (List.append path [ "IpAddressType" ]) v);
    ]

let set_ip_address_type_input_to_query path (x : set_ip_address_type_input) =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      ip_address_type_to_query (List.append path [ "IpAddressType" ]) x.ip_address_type;
    ]

let remove_trust_store_revocations_output_to_query path _x = []

let remove_trust_store_revocations_input_to_query path (x : remove_trust_store_revocations_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      revocation_ids_to_query (List.append path [ "RevocationIds" ]) x.revocation_ids;
    ]

let remove_tags_output_to_query path _x = []

let tag_keys_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_to_query path xs

let remove_tags_input_to_query path (x : remove_tags_input) =
  List.concat
    [
      resource_arns_to_query (List.append path [ "ResourceArns" ]) x.resource_arns;
      tag_keys_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
    ]

let remove_listener_certificates_output_to_query path _x = []

let remove_listener_certificates_input_to_query path (x : remove_listener_certificates_input) =
  List.concat
    [
      listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn;
      certificate_list_to_query (List.append path [ "Certificates" ]) x.certificates;
    ]

let register_targets_output_to_query path _x = []

let register_targets_input_to_query path (x : register_targets_input) =
  List.concat
    [
      target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn;
      target_descriptions_to_query (List.append path [ "Targets" ]) x.targets;
    ]

let modify_trust_store_output_to_query path (x : modify_trust_store_output) =
  List.concat
    [
      (match x.trust_stores with
      | None -> []
      | Some v -> trust_stores_to_query (List.append path [ "TrustStores" ]) v);
    ]

let modify_trust_store_input_to_query path (x : modify_trust_store_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      s3_bucket_to_query
        (List.append path [ "CaCertificatesBundleS3Bucket" ])
        x.ca_certificates_bundle_s3_bucket;
      s3_key_to_query
        (List.append path [ "CaCertificatesBundleS3Key" ])
        x.ca_certificates_bundle_s3_key;
      (match x.ca_certificates_bundle_s3_object_version with
      | None -> []
      | Some v ->
          s3_object_version_to_query (List.append path [ "CaCertificatesBundleS3ObjectVersion" ]) v);
    ]

let modify_target_group_attributes_output_to_query path (x : modify_target_group_attributes_output)
    =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> target_group_attributes_to_query (List.append path [ "Attributes" ]) v);
    ]

let modify_target_group_attributes_input_to_query path (x : modify_target_group_attributes_input) =
  List.concat
    [
      target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn;
      target_group_attributes_to_query (List.append path [ "Attributes" ]) x.attributes;
    ]

let modify_target_group_output_to_query path (x : modify_target_group_output) =
  List.concat
    [
      (match x.target_groups with
      | None -> []
      | Some v -> target_groups_to_query (List.append path [ "TargetGroups" ]) v);
    ]

let modify_target_group_input_to_query path (x : modify_target_group_input) =
  List.concat
    [
      target_group_arn_to_query (List.append path [ "TargetGroupArn" ]) x.target_group_arn;
      (match x.health_check_protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "HealthCheckProtocol" ]) v);
      (match x.health_check_port with
      | None -> []
      | Some v -> health_check_port_to_query (List.append path [ "HealthCheckPort" ]) v);
      (match x.health_check_path with
      | None -> []
      | Some v -> path_to_query (List.append path [ "HealthCheckPath" ]) v);
      (match x.health_check_enabled with
      | None -> []
      | Some v -> health_check_enabled_to_query (List.append path [ "HealthCheckEnabled" ]) v);
      (match x.health_check_interval_seconds with
      | None -> []
      | Some v ->
          health_check_interval_seconds_to_query
            (List.append path [ "HealthCheckIntervalSeconds" ])
            v);
      (match x.health_check_timeout_seconds with
      | None -> []
      | Some v ->
          health_check_timeout_seconds_to_query (List.append path [ "HealthCheckTimeoutSeconds" ]) v);
      (match x.healthy_threshold_count with
      | None -> []
      | Some v ->
          health_check_threshold_count_to_query (List.append path [ "HealthyThresholdCount" ]) v);
      (match x.unhealthy_threshold_count with
      | None -> []
      | Some v ->
          health_check_threshold_count_to_query (List.append path [ "UnhealthyThresholdCount" ]) v);
      (match x.matcher with
      | None -> []
      | Some v -> matcher_to_query (List.append path [ "Matcher" ]) v);
    ]

let modify_rule_output_to_query path (x : modify_rule_output) =
  List.concat
    [
      (match x.rules with None -> [] | Some v -> rules_to_query (List.append path [ "Rules" ]) v);
    ]

let reset_transforms_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let modify_rule_input_to_query path (x : modify_rule_input) =
  List.concat
    [
      rule_arn_to_query (List.append path [ "RuleArn" ]) x.rule_arn;
      (match x.conditions with
      | None -> []
      | Some v -> rule_condition_list_to_query (List.append path [ "Conditions" ]) v);
      (match x.actions with
      | None -> []
      | Some v -> actions_to_query (List.append path [ "Actions" ]) v);
      (match x.transforms with
      | None -> []
      | Some v -> rule_transform_list_to_query (List.append path [ "Transforms" ]) v);
      (match x.reset_transforms with
      | None -> []
      | Some v -> reset_transforms_to_query (List.append path [ "ResetTransforms" ]) v);
    ]

let modify_load_balancer_attributes_output_to_query path
    (x : modify_load_balancer_attributes_output) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> load_balancer_attributes_to_query (List.append path [ "Attributes" ]) v);
    ]

let modify_load_balancer_attributes_input_to_query path (x : modify_load_balancer_attributes_input)
    =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      load_balancer_attributes_to_query (List.append path [ "Attributes" ]) x.attributes;
    ]

let modify_listener_attributes_output_to_query path (x : modify_listener_attributes_output) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> listener_attributes_to_query (List.append path [ "Attributes" ]) v);
    ]

let modify_listener_attributes_input_to_query path (x : modify_listener_attributes_input) =
  List.concat
    [
      listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn;
      listener_attributes_to_query (List.append path [ "Attributes" ]) x.attributes;
    ]

let modify_listener_output_to_query path (x : modify_listener_output) =
  List.concat
    [
      (match x.listeners with
      | None -> []
      | Some v -> listeners_to_query (List.append path [ "Listeners" ]) v);
    ]

let modify_listener_input_to_query path (x : modify_listener_input) =
  List.concat
    [
      listener_arn_to_query (List.append path [ "ListenerArn" ]) x.listener_arn;
      (match x.port with None -> [] | Some v -> port_to_query (List.append path [ "Port" ]) v);
      (match x.protocol with
      | None -> []
      | Some v -> protocol_enum_to_query (List.append path [ "Protocol" ]) v);
      (match x.ssl_policy with
      | None -> []
      | Some v -> ssl_policy_name_to_query (List.append path [ "SslPolicy" ]) v);
      (match x.certificates with
      | None -> []
      | Some v -> certificate_list_to_query (List.append path [ "Certificates" ]) v);
      (match x.default_actions with
      | None -> []
      | Some v -> actions_to_query (List.append path [ "DefaultActions" ]) v);
      (match x.alpn_policy with
      | None -> []
      | Some v -> alpn_policy_name_to_query (List.append path [ "AlpnPolicy" ]) v);
      (match x.mutual_authentication with
      | None -> []
      | Some v ->
          mutual_authentication_attributes_to_query (List.append path [ "MutualAuthentication" ]) v);
    ]

let modify_ip_pools_output_to_query path (x : modify_ip_pools_output) =
  List.concat
    [
      (match x.ipam_pools with
      | None -> []
      | Some v -> ipam_pools_to_query (List.append path [ "IpamPools" ]) v);
    ]

let remove_ipam_pool_enum_to_query path (x : remove_ipam_pool_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with Ipv4 -> "ipv4")

let remove_ipam_pools_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" remove_ipam_pool_enum_to_query path
    xs

let modify_ip_pools_input_to_query path (x : modify_ip_pools_input) =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      (match x.ipam_pools with
      | None -> []
      | Some v -> ipam_pools_to_query (List.append path [ "IpamPools" ]) v);
      (match x.remove_ipam_pools with
      | None -> []
      | Some v -> remove_ipam_pools_to_query (List.append path [ "RemoveIpamPools" ]) v);
    ]

let prior_request_not_complete_exception_to_query path (x : prior_request_not_complete_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let insufficient_capacity_exception_to_query path (x : insufficient_capacity_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let modify_capacity_reservation_output_to_query path (x : modify_capacity_reservation_output) =
  List.concat
    [
      (match x.last_modified_time with
      | None -> []
      | Some v -> last_modified_time_to_query (List.append path [ "LastModifiedTime" ]) v);
      (match x.decrease_requests_remaining with
      | None -> []
      | Some v ->
          decrease_requests_remaining_to_query (List.append path [ "DecreaseRequestsRemaining" ]) v);
      (match x.minimum_load_balancer_capacity with
      | None -> []
      | Some v ->
          minimum_load_balancer_capacity_to_query
            (List.append path [ "MinimumLoadBalancerCapacity" ])
            v);
      (match x.capacity_reservation_state with
      | None -> []
      | Some v ->
          zonal_capacity_reservation_states_to_query
            (List.append path [ "CapacityReservationState" ])
            v);
    ]

let reset_capacity_reservation_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let modify_capacity_reservation_input_to_query path (x : modify_capacity_reservation_input) =
  List.concat
    [
      load_balancer_arn_to_query (List.append path [ "LoadBalancerArn" ]) x.load_balancer_arn;
      (match x.minimum_load_balancer_capacity with
      | None -> []
      | Some v ->
          minimum_load_balancer_capacity_to_query
            (List.append path [ "MinimumLoadBalancerCapacity" ])
            v);
      (match x.reset_capacity_reservation with
      | None -> []
      | Some v ->
          reset_capacity_reservation_to_query (List.append path [ "ResetCapacityReservation" ]) v);
    ]

let location_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_trust_store_revocation_content_output_to_query path
    (x : get_trust_store_revocation_content_output) =
  List.concat
    [
      (match x.location with
      | None -> []
      | Some v -> location_to_query (List.append path [ "Location" ]) v);
    ]

let get_trust_store_revocation_content_input_to_query path
    (x : get_trust_store_revocation_content_input) =
  List.concat
    [
      trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn;
      revocation_id_to_query (List.append path [ "RevocationId" ]) x.revocation_id;
    ]

let get_trust_store_ca_certificates_bundle_output_to_query path
    (x : get_trust_store_ca_certificates_bundle_output) =
  List.concat
    [
      (match x.location with
      | None -> []
      | Some v -> location_to_query (List.append path [ "Location" ]) v);
    ]

let get_trust_store_ca_certificates_bundle_input_to_query path
    (x : get_trust_store_ca_certificates_bundle_input) =
  List.concat [ trust_store_arn_to_query (List.append path [ "TrustStoreArn" ]) x.trust_store_arn ]

let resource_not_found_exception_to_query path (x : resource_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let policy_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_resource_policy_output_to_query path (x : get_resource_policy_output) =
  List.concat
    [
      (match x.policy with
      | None -> []
      | Some v -> policy_to_query (List.append path [ "Policy" ]) v);
    ]

let get_resource_policy_input_to_query path (x : get_resource_policy_input) =
  List.concat [ resource_arn_to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]
