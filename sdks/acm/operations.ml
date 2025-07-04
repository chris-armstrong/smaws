open Types
module AddTagsToCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTagException") ->
              `InvalidTagException
                (invalid_tag_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TagPolicyException") ->
              `TagPolicyException (tag_policy_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : add_tags_to_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_tags_to_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerAddTagsToCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerDeleteCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerDescribeCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_certificate_response_of_yojson
            ~error_deserializer
  end
module ExportCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "RequestInProgressException") ->
              `RequestInProgressException
                (request_in_progress_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : export_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.export_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerExportCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:export_certificate_response_of_yojson
            ~error_deserializer
  end
module GetAccountConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.base_unit_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerGetAccountConfiguration" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_account_configuration_response_of_yojson
            ~error_deserializer
  end
module GetCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "RequestInProgressException") ->
              `RequestInProgressException
                (request_in_progress_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerGetCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_certificate_response_of_yojson
            ~error_deserializer
  end
module ImportCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTagException") ->
              `InvalidTagException
                (invalid_tag_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TagPolicyException") ->
              `TagPolicyException (tag_policy_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : import_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.import_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerImportCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:import_certificate_response_of_yojson
            ~error_deserializer
  end
module ListCertificates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgsException") ->
              `InvalidArgsException
                (invalid_args_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_certificates_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_certificates_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerListCertificates" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_certificates_response_of_yojson
            ~error_deserializer
  end
module ListTagsForCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerListTagsForCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_certificate_response_of_yojson
            ~error_deserializer
  end
module PutAccountConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_account_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_account_configuration_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerPutAccountConfiguration" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RemoveTagsFromCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTagException") ->
              `InvalidTagException
                (invalid_tag_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TagPolicyException") ->
              `TagPolicyException (tag_policy_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : remove_tags_from_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.remove_tags_from_certificate_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerRemoveTagsFromCertificate"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RenewCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "RequestInProgressException") ->
              `RequestInProgressException
                (request_in_progress_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : renew_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.renew_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerRenewCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RequestCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidDomainValidationOptionsException") ->
              `InvalidDomainValidationOptionsException
                (invalid_domain_validation_options_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTagException") ->
              `InvalidTagException
                (invalid_tag_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "TagPolicyException") ->
              `TagPolicyException (tag_policy_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : request_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.request_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerRequestCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:request_certificate_response_of_yojson
            ~error_deserializer
  end
module ResendValidationEmail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidDomainValidationOptionsException") ->
              `InvalidDomainValidationOptionsException
                (invalid_domain_validation_options_exception_of_yojson tree
                   path)
          | (_, "InvalidStateException") ->
              `InvalidStateException
                (invalid_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : resend_validation_email_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.resend_validation_email_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerResendValidationEmail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RevokeCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : revoke_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.revoke_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerRevokeCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:revoke_certificate_response_of_yojson
            ~error_deserializer
  end
module UpdateCertificateOptions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidStateException") ->
              `InvalidStateException
                (invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_certificate_options_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_certificate_options_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CertificateManagerUpdateCertificateOptions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end