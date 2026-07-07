open Types
open Service_metadata

module CreateCertificateAuthority = struct
  let error_to_string = function
    | `InvalidArgsException _ -> "com.amazonaws.acmpca#InvalidArgsException"
    | `InvalidPolicyException _ -> "com.amazonaws.acmpca#InvalidPolicyException"
    | `InvalidTagException _ -> "com.amazonaws.acmpca#InvalidTagException"
    | `LimitExceededException _ -> "com.amazonaws.acmpca#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "InvalidPolicyException" ->
          `InvalidPolicyException (Json_deserializers.invalid_policy_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_certificate_authority_request) =
    let input = Json_serializers.create_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.CreateCertificateAuthority"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_certificate_authority_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_certificate_authority_request) =
    let input = Json_serializers.create_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.CreateCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_certificate_authority_response_of_yojson
      ~error_deserializer
end

module CreateCertificateAuthorityAuditReport = struct
  let error_to_string = function
    | `InvalidArgsException _ -> "com.amazonaws.acmpca#InvalidArgsException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `RequestInProgressException _ -> "com.amazonaws.acmpca#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "RequestInProgressException" ->
          `RequestInProgressException
            (Json_deserializers.request_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_certificate_authority_audit_report_request) =
    let input =
      Json_serializers.create_certificate_authority_audit_report_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ACMPrivateCA.CreateCertificateAuthorityAuditReport" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_certificate_authority_audit_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_certificate_authority_audit_report_request) =
    let input =
      Json_serializers.create_certificate_authority_audit_report_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.CreateCertificateAuthorityAuditReport" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_certificate_authority_audit_report_response_of_yojson
      ~error_deserializer
end

module CreatePermission = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.acmpca#LimitExceededException"
    | `PermissionAlreadyExistsException _ -> "com.amazonaws.acmpca#PermissionAlreadyExistsException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "PermissionAlreadyExistsException" ->
          `PermissionAlreadyExistsException
            (Json_deserializers.permission_already_exists_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_permission_request) =
    let input = Json_serializers.create_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.CreatePermission" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_permission_request) =
    let input = Json_serializers.create_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.CreatePermission"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCertificateAuthority = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.acmpca#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_certificate_authority_request) =
    let input = Json_serializers.delete_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.DeleteCertificateAuthority"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_certificate_authority_request) =
    let input = Json_serializers.delete_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.DeleteCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePermission = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_permission_request) =
    let input = Json_serializers.delete_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.DeletePermission" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_permission_request) =
    let input = Json_serializers.delete_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.DeletePermission"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePolicy = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.acmpca#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `LockoutPreventedException _ -> "com.amazonaws.acmpca#LockoutPreventedException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LockoutPreventedException" ->
          `LockoutPreventedException
            (Json_deserializers.lockout_prevented_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_request) =
    let input = Json_serializers.delete_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.DeletePolicy" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_policy_request) =
    let input = Json_serializers.delete_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.DeletePolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeCertificateAuthority = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_certificate_authority_request) =
    let input = Json_serializers.describe_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.DescribeCertificateAuthority"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificate_authority_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_certificate_authority_request) =
    let input = Json_serializers.describe_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.DescribeCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificate_authority_response_of_yojson
      ~error_deserializer
end

module DescribeCertificateAuthorityAuditReport = struct
  let error_to_string = function
    | `InvalidArgsException _ -> "com.amazonaws.acmpca#InvalidArgsException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_certificate_authority_audit_report_request) =
    let input =
      Json_serializers.describe_certificate_authority_audit_report_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ACMPrivateCA.DescribeCertificateAuthorityAuditReport" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_certificate_authority_audit_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_certificate_authority_audit_report_request)
      =
    let input =
      Json_serializers.describe_certificate_authority_audit_report_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.DescribeCertificateAuthorityAuditReport" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_certificate_authority_audit_report_response_of_yojson
      ~error_deserializer
end

module GetCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `RequestInProgressException _ -> "com.amazonaws.acmpca#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "RequestInProgressException" ->
          `RequestInProgressException
            (Json_deserializers.request_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_certificate_request) =
    let input = Json_serializers.get_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.GetCertificate" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_certificate_request) =
    let input = Json_serializers.get_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.GetCertificate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_certificate_response_of_yojson ~error_deserializer
end

module GetCertificateAuthorityCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_certificate_authority_certificate_request) =
    let input = Json_serializers.get_certificate_authority_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ACMPrivateCA.GetCertificateAuthorityCertificate" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_certificate_authority_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_certificate_authority_certificate_request) =
    let input = Json_serializers.get_certificate_authority_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.GetCertificateAuthorityCertificate" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_certificate_authority_certificate_response_of_yojson
      ~error_deserializer
end

module GetCertificateAuthorityCsr = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `RequestInProgressException _ -> "com.amazonaws.acmpca#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "RequestInProgressException" ->
          `RequestInProgressException
            (Json_deserializers.request_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_certificate_authority_csr_request) =
    let input = Json_serializers.get_certificate_authority_csr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.GetCertificateAuthorityCsr"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_certificate_authority_csr_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_certificate_authority_csr_request) =
    let input = Json_serializers.get_certificate_authority_csr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.GetCertificateAuthorityCsr" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_certificate_authority_csr_response_of_yojson
      ~error_deserializer
end

module GetPolicy = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_policy_request) =
    let input = Json_serializers.get_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.GetPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_policy_request) =
    let input = Json_serializers.get_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.GetPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_policy_response_of_yojson
      ~error_deserializer
end

module ImportCertificateAuthorityCertificate = struct
  let error_to_string = function
    | `CertificateMismatchException _ -> "com.amazonaws.acmpca#CertificateMismatchException"
    | `ConcurrentModificationException _ -> "com.amazonaws.acmpca#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidRequestException _ -> "com.amazonaws.acmpca#InvalidRequestException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `MalformedCertificateException _ -> "com.amazonaws.acmpca#MalformedCertificateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `RequestInProgressException _ -> "com.amazonaws.acmpca#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CertificateMismatchException" ->
          `CertificateMismatchException
            (Json_deserializers.certificate_mismatch_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "MalformedCertificateException" ->
          `MalformedCertificateException
            (Json_deserializers.malformed_certificate_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "RequestInProgressException" ->
          `RequestInProgressException
            (Json_deserializers.request_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_certificate_authority_certificate_request) =
    let input =
      Json_serializers.import_certificate_authority_certificate_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ACMPrivateCA.ImportCertificateAuthorityCertificate" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_certificate_authority_certificate_request) =
    let input =
      Json_serializers.import_certificate_authority_certificate_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.ImportCertificateAuthorityCertificate" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module IssueCertificate = struct
  let error_to_string = function
    | `InvalidArgsException _ -> "com.amazonaws.acmpca#InvalidArgsException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.acmpca#LimitExceededException"
    | `MalformedCSRException _ -> "com.amazonaws.acmpca#MalformedCSRException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MalformedCSRException" ->
          `MalformedCSRException (Json_deserializers.malformed_csr_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : issue_certificate_request) =
    let input = Json_serializers.issue_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.IssueCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.issue_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : issue_certificate_request) =
    let input = Json_serializers.issue_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.IssueCertificate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.issue_certificate_response_of_yojson
      ~error_deserializer
end

module ListCertificateAuthorities = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.acmpca#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_certificate_authorities_request) =
    let input = Json_serializers.list_certificate_authorities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.ListCertificateAuthorities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_certificate_authorities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_certificate_authorities_request) =
    let input = Json_serializers.list_certificate_authorities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.ListCertificateAuthorities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_certificate_authorities_response_of_yojson
      ~error_deserializer
end

module ListPermissions = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidNextTokenException _ -> "com.amazonaws.acmpca#InvalidNextTokenException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_permissions_request) =
    let input = Json_serializers.list_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.ListPermissions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_permissions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_permissions_request) =
    let input = Json_serializers.list_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.ListPermissions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_permissions_response_of_yojson
      ~error_deserializer
end

module ListTags = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.ListTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.ListTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
      ~error_deserializer
end

module PutPolicy = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.acmpca#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidPolicyException _ -> "com.amazonaws.acmpca#InvalidPolicyException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `LockoutPreventedException _ -> "com.amazonaws.acmpca#LockoutPreventedException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidPolicyException" ->
          `InvalidPolicyException (Json_deserializers.invalid_policy_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LockoutPreventedException" ->
          `LockoutPreventedException
            (Json_deserializers.lockout_prevented_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_policy_request) =
    let input = Json_serializers.put_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.PutPolicy" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_policy_request) =
    let input = Json_serializers.put_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.PutPolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RestoreCertificateAuthority = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_certificate_authority_request) =
    let input = Json_serializers.restore_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.RestoreCertificateAuthority"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_certificate_authority_request) =
    let input = Json_serializers.restore_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.RestoreCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RevokeCertificate = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.acmpca#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidRequestException _ -> "com.amazonaws.acmpca#InvalidRequestException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.acmpca#LimitExceededException"
    | `RequestAlreadyProcessedException _ -> "com.amazonaws.acmpca#RequestAlreadyProcessedException"
    | `RequestFailedException _ -> "com.amazonaws.acmpca#RequestFailedException"
    | `RequestInProgressException _ -> "com.amazonaws.acmpca#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RequestAlreadyProcessedException" ->
          `RequestAlreadyProcessedException
            (Json_deserializers.request_already_processed_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "RequestInProgressException" ->
          `RequestInProgressException
            (Json_deserializers.request_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : revoke_certificate_request) =
    let input = Json_serializers.revoke_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.RevokeCertificate" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : revoke_certificate_request) =
    let input = Json_serializers.revoke_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ACMPrivateCA.RevokeCertificate"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagCertificateAuthority = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `InvalidTagException _ -> "com.amazonaws.acmpca#InvalidTagException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.acmpca#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_certificate_authority_request) =
    let input = Json_serializers.tag_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.TagCertificateAuthority" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_certificate_authority_request) =
    let input = Json_serializers.tag_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.TagCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagCertificateAuthority = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `InvalidTagException _ -> "com.amazonaws.acmpca#InvalidTagException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_certificate_authority_request) =
    let input = Json_serializers.untag_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.UntagCertificateAuthority"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_certificate_authority_request) =
    let input = Json_serializers.untag_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.UntagCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateCertificateAuthority = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.acmpca#ConcurrentModificationException"
    | `InvalidArgsException _ -> "com.amazonaws.acmpca#InvalidArgsException"
    | `InvalidArnException _ -> "com.amazonaws.acmpca#InvalidArnException"
    | `InvalidPolicyException _ -> "com.amazonaws.acmpca#InvalidPolicyException"
    | `InvalidStateException _ -> "com.amazonaws.acmpca#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acmpca#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidPolicyException" ->
          `InvalidPolicyException (Json_deserializers.invalid_policy_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_certificate_authority_request) =
    let input = Json_serializers.update_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ACMPrivateCA.UpdateCertificateAuthority"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_certificate_authority_request) =
    let input = Json_serializers.update_certificate_authority_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ACMPrivateCA.UpdateCertificateAuthority" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
