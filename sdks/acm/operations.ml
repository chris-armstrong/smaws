open Types
open Service_metadata

module AddTagsToCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `InvalidParameterException _ -> "com.amazonaws.acm#InvalidParameterException"
    | `InvalidTagException _ -> "com.amazonaws.acm#InvalidTagException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | `TagPolicyException _ -> "com.amazonaws.acm#TagPolicyException"
    | `ThrottlingException _ -> "com.amazonaws.acm#ThrottlingException"
    | `TooManyTagsException _ -> "com.amazonaws.acm#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_certificate_request) =
    let input = Json_serializers.add_tags_to_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.AddTagsToCertificate"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.acm#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.acm#ConflictException"
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `ResourceInUseException _ -> "com.amazonaws.acm#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.acm#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_certificate_request) =
    let input = Json_serializers.delete_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.DeleteCertificate" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
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

  let request context (request : describe_certificate_request) =
    let input = Json_serializers.describe_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.DescribeCertificate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificate_response_of_yojson
      ~error_deserializer
end

module ExportCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `RequestInProgressException _ -> "com.amazonaws.acm#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
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

  let request context (request : export_certificate_request) =
    let input = Json_serializers.export_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.ExportCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.export_certificate_response_of_yojson
      ~error_deserializer
end

module GetAccountConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.acm#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.acm#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.GetAccountConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_configuration_response_of_yojson
      ~error_deserializer
end

module GetCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `RequestInProgressException _ -> "com.amazonaws.acm#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.GetCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_certificate_response_of_yojson
      ~error_deserializer
end

module ImportCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `InvalidParameterException _ -> "com.amazonaws.acm#InvalidParameterException"
    | `InvalidTagException _ -> "com.amazonaws.acm#InvalidTagException"
    | `LimitExceededException _ -> "com.amazonaws.acm#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | `TagPolicyException _ -> "com.amazonaws.acm#TagPolicyException"
    | `TooManyTagsException _ -> "com.amazonaws.acm#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_certificate_request) =
    let input = Json_serializers.import_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.ImportCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_certificate_response_of_yojson
      ~error_deserializer
end

module ListCertificates = struct
  let error_to_string = function
    | `InvalidArgsException _ -> "com.amazonaws.acm#InvalidArgsException"
    | `ValidationException _ -> "com.amazonaws.acm#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_certificates_request) =
    let input = Json_serializers.list_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.ListCertificates" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_certificates_response_of_yojson
      ~error_deserializer
end

module ListTagsForCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
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

  let request context (request : list_tags_for_certificate_request) =
    let input = Json_serializers.list_tags_for_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.ListTagsForCertificate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_certificate_response_of_yojson
      ~error_deserializer
end

module PutAccountConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.acm#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.acm#ConflictException"
    | `ThrottlingException _ -> "com.amazonaws.acm#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.acm#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_account_configuration_request) =
    let input = Json_serializers.put_account_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.PutAccountConfiguration"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RemoveTagsFromCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `InvalidParameterException _ -> "com.amazonaws.acm#InvalidParameterException"
    | `InvalidTagException _ -> "com.amazonaws.acm#InvalidTagException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | `TagPolicyException _ -> "com.amazonaws.acm#TagPolicyException"
    | `ThrottlingException _ -> "com.amazonaws.acm#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_certificate_request) =
    let input = Json_serializers.remove_tags_from_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.RemoveTagsFromCertificate"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RenewCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `RequestInProgressException _ -> "com.amazonaws.acm#RequestInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
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

  let request context (request : renew_certificate_request) =
    let input = Json_serializers.renew_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.RenewCertificate" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RequestCertificate = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `InvalidDomainValidationOptionsException _ ->
        "com.amazonaws.acm#InvalidDomainValidationOptionsException"
    | `InvalidParameterException _ -> "com.amazonaws.acm#InvalidParameterException"
    | `InvalidTagException _ -> "com.amazonaws.acm#InvalidTagException"
    | `LimitExceededException _ -> "com.amazonaws.acm#LimitExceededException"
    | `TagPolicyException _ -> "com.amazonaws.acm#TagPolicyException"
    | `TooManyTagsException _ -> "com.amazonaws.acm#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidDomainValidationOptionsException" ->
          `InvalidDomainValidationOptionsException
            (Json_deserializers.invalid_domain_validation_options_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : request_certificate_request) =
    let input = Json_serializers.request_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.RequestCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.request_certificate_response_of_yojson
      ~error_deserializer
end

module ResendValidationEmail = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `InvalidDomainValidationOptionsException _ ->
        "com.amazonaws.acm#InvalidDomainValidationOptionsException"
    | `InvalidStateException _ -> "com.amazonaws.acm#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidDomainValidationOptionsException" ->
          `InvalidDomainValidationOptionsException
            (Json_deserializers.invalid_domain_validation_options_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resend_validation_email_request) =
    let input = Json_serializers.resend_validation_email_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.ResendValidationEmail"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RevokeCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.acm#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.acm#ConflictException"
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `ResourceInUseException _ -> "com.amazonaws.acm#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.acm#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : revoke_certificate_request) =
    let input = Json_serializers.revoke_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.RevokeCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.revoke_certificate_response_of_yojson
      ~error_deserializer
end

module UpdateCertificateOptions = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.acm#InvalidArnException"
    | `InvalidStateException _ -> "com.amazonaws.acm#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.acm#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.acm#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_certificate_options_request) =
    let input = Json_serializers.update_certificate_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CertificateManager.UpdateCertificateOptions"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
