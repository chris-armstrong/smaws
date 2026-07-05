open Types
open Service_metadata
open Query_deserializers
open Query_serializers
module AssumeRole =
  struct
    let error_to_string =
      function
      | `ExpiredTokenException _ -> "com.amazonaws.sts#ExpiredTokenException"
      | `MalformedPolicyDocumentException _ ->
          "com.amazonaws.sts#MalformedPolicyDocumentException"
      | `PackedPolicyTooLargeException _ ->
          "com.amazonaws.sts#PackedPolicyTooLargeException"
      | `RegionDisabledException _ ->
          "com.amazonaws.sts#RegionDisabledException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "ExpiredTokenException" ->
          `ExpiredTokenException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:expired_token_exception_of_xml)
      | "MalformedPolicyDocument" ->
          `MalformedPolicyDocumentException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:malformed_policy_document_exception_of_xml)
      | "PackedPolicyTooLarge" ->
          `PackedPolicyTooLargeException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:packed_policy_too_large_exception_of_xml)
      | "RegionDisabledException" ->
          `RegionDisabledException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:region_disabled_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : assume_role_request) =
      let fields = assume_role_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"AssumeRole"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields ~output_deserializer:assume_role_response_of_xml
        ~error_deserializer
  end
module AssumeRoleWithSAML =
  struct
    let error_to_string =
      function
      | `ExpiredTokenException _ -> "com.amazonaws.sts#ExpiredTokenException"
      | `IDPRejectedClaimException _ ->
          "com.amazonaws.sts#IDPRejectedClaimException"
      | `InvalidIdentityTokenException _ ->
          "com.amazonaws.sts#InvalidIdentityTokenException"
      | `MalformedPolicyDocumentException _ ->
          "com.amazonaws.sts#MalformedPolicyDocumentException"
      | `PackedPolicyTooLargeException _ ->
          "com.amazonaws.sts#PackedPolicyTooLargeException"
      | `RegionDisabledException _ ->
          "com.amazonaws.sts#RegionDisabledException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "ExpiredTokenException" ->
          `ExpiredTokenException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:expired_token_exception_of_xml)
      | "IDPRejectedClaim" ->
          `IDPRejectedClaimException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:idp_rejected_claim_exception_of_xml)
      | "InvalidIdentityToken" ->
          `InvalidIdentityTokenException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:invalid_identity_token_exception_of_xml)
      | "MalformedPolicyDocument" ->
          `MalformedPolicyDocumentException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:malformed_policy_document_exception_of_xml)
      | "PackedPolicyTooLarge" ->
          `PackedPolicyTooLargeException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:packed_policy_too_large_exception_of_xml)
      | "RegionDisabledException" ->
          `RegionDisabledException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:region_disabled_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : assume_role_with_saml_request) =
      let fields = assume_role_with_saml_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"AssumeRoleWithSAML"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:assume_role_with_saml_response_of_xml
        ~error_deserializer
  end
module AssumeRoleWithWebIdentity =
  struct
    let error_to_string =
      function
      | `ExpiredTokenException _ -> "com.amazonaws.sts#ExpiredTokenException"
      | `IDPCommunicationErrorException _ ->
          "com.amazonaws.sts#IDPCommunicationErrorException"
      | `IDPRejectedClaimException _ ->
          "com.amazonaws.sts#IDPRejectedClaimException"
      | `InvalidIdentityTokenException _ ->
          "com.amazonaws.sts#InvalidIdentityTokenException"
      | `MalformedPolicyDocumentException _ ->
          "com.amazonaws.sts#MalformedPolicyDocumentException"
      | `PackedPolicyTooLargeException _ ->
          "com.amazonaws.sts#PackedPolicyTooLargeException"
      | `RegionDisabledException _ ->
          "com.amazonaws.sts#RegionDisabledException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "ExpiredTokenException" ->
          `ExpiredTokenException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:expired_token_exception_of_xml)
      | "IDPCommunicationError" ->
          `IDPCommunicationErrorException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:idp_communication_error_exception_of_xml)
      | "IDPRejectedClaim" ->
          `IDPRejectedClaimException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:idp_rejected_claim_exception_of_xml)
      | "InvalidIdentityToken" ->
          `InvalidIdentityTokenException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:invalid_identity_token_exception_of_xml)
      | "MalformedPolicyDocument" ->
          `MalformedPolicyDocumentException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:malformed_policy_document_exception_of_xml)
      | "PackedPolicyTooLarge" ->
          `PackedPolicyTooLargeException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:packed_policy_too_large_exception_of_xml)
      | "RegionDisabledException" ->
          `RegionDisabledException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:region_disabled_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : assume_role_with_web_identity_request) =
      let fields = assume_role_with_web_identity_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"AssumeRoleWithWebIdentity"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:assume_role_with_web_identity_response_of_xml
        ~error_deserializer
  end
module AssumeRoot =
  struct
    let error_to_string =
      function
      | `ExpiredTokenException _ -> "com.amazonaws.sts#ExpiredTokenException"
      | `RegionDisabledException _ ->
          "com.amazonaws.sts#RegionDisabledException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "ExpiredTokenException" ->
          `ExpiredTokenException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:expired_token_exception_of_xml)
      | "RegionDisabledException" ->
          `RegionDisabledException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:region_disabled_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : assume_root_request) =
      let fields = assume_root_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"AssumeRoot"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields ~output_deserializer:assume_root_response_of_xml
        ~error_deserializer
  end
module DecodeAuthorizationMessage =
  struct
    let error_to_string =
      function
      | `InvalidAuthorizationMessageException _ ->
          "com.amazonaws.sts#InvalidAuthorizationMessageException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "InvalidAuthorizationMessageException" ->
          `InvalidAuthorizationMessageException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:invalid_authorization_message_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : decode_authorization_message_request) =
      let fields = decode_authorization_message_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"DecodeAuthorizationMessage"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:decode_authorization_message_response_of_xml
        ~error_deserializer
  end
module GetAccessKeyInfo =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body:_ = Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : get_access_key_info_request) =
      let fields = get_access_key_info_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAccessKeyInfo"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:get_access_key_info_response_of_xml
        ~error_deserializer
  end
module GetCallerIdentity =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body:_ = Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : get_caller_identity_request) =
      let fields = get_caller_identity_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"GetCallerIdentity"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:get_caller_identity_response_of_xml
        ~error_deserializer
  end
module GetFederationToken =
  struct
    let error_to_string =
      function
      | `MalformedPolicyDocumentException _ ->
          "com.amazonaws.sts#MalformedPolicyDocumentException"
      | `PackedPolicyTooLargeException _ ->
          "com.amazonaws.sts#PackedPolicyTooLargeException"
      | `RegionDisabledException _ ->
          "com.amazonaws.sts#RegionDisabledException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "MalformedPolicyDocument" ->
          `MalformedPolicyDocumentException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:malformed_policy_document_exception_of_xml)
      | "PackedPolicyTooLarge" ->
          `PackedPolicyTooLargeException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:packed_policy_too_large_exception_of_xml)
      | "RegionDisabledException" ->
          `RegionDisabledException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:region_disabled_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : get_federation_token_request) =
      let fields = get_federation_token_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"GetFederationToken"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:get_federation_token_response_of_xml
        ~error_deserializer
  end
module GetSessionToken =
  struct
    let error_to_string =
      function
      | `RegionDisabledException _ ->
          "com.amazonaws.sts#RegionDisabledException"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t)
      ~body =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "RegionDisabledException" ->
          `RegionDisabledException
            (Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
               ~structParser:region_disabled_exception_of_xml)
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : get_session_token_request) =
      let fields = get_session_token_request_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSessionToken"
        ~xmlNamespace:"https://sts.amazonaws.com/doc/2011-06-15/" ~service
        ~context ~fields
        ~output_deserializer:get_session_token_response_of_xml
        ~error_deserializer
  end