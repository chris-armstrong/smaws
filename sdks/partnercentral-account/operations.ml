open Types
open Service_metadata

module AcceptConnectionInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_connection_invitation_request) =
    let input = Json_serializers.accept_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.AcceptConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_connection_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_connection_invitation_request) =
    let input = Json_serializers.accept_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.AcceptConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_connection_invitation_response_of_yojson
      ~error_deserializer
end

module AssociateAwsTrainingCertificationEmailDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_aws_training_certification_email_domain_request) =
    let input =
      Json_serializers.associate_aws_training_certification_email_domain_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.AssociateAwsTrainingCertificationEmailDomain" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_aws_training_certification_email_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : associate_aws_training_certification_email_domain_request) =
    let input =
      Json_serializers.associate_aws_training_certification_email_domain_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.AssociateAwsTrainingCertificationEmailDomain" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_aws_training_certification_email_domain_response_of_yojson
      ~error_deserializer
end

module CancelConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_connection_request) =
    let input = Json_serializers.cancel_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.CancelConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_connection_request) =
    let input = Json_serializers.cancel_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.CancelConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_connection_response_of_yojson
      ~error_deserializer
end

module CancelConnectionInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_connection_invitation_request) =
    let input = Json_serializers.cancel_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.CancelConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_connection_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_connection_invitation_request) =
    let input = Json_serializers.cancel_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.CancelConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_connection_invitation_response_of_yojson
      ~error_deserializer
end

module CancelProfileUpdateTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_profile_update_task_request) =
    let input = Json_serializers.cancel_profile_update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.CancelProfileUpdateTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_profile_update_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_profile_update_task_request) =
    let input = Json_serializers.cancel_profile_update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.CancelProfileUpdateTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_profile_update_task_response_of_yojson
      ~error_deserializer
end

module CreateConnectionInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_invitation_request) =
    let input = Json_serializers.create_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.CreateConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connection_invitation_request) =
    let input = Json_serializers.create_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.CreateConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_invitation_response_of_yojson
      ~error_deserializer
end

module CreatePartner = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_partner_request) =
    let input = Json_serializers.create_partner_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.CreatePartner" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_partner_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_partner_request) =
    let input = Json_serializers.create_partner_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.CreatePartner" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_partner_response_of_yojson ~error_deserializer
end

module DisassociateAwsTrainingCertificationEmailDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_aws_training_certification_email_domain_request) =
    let input =
      Json_serializers.disassociate_aws_training_certification_email_domain_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.DisassociateAwsTrainingCertificationEmailDomain" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_aws_training_certification_email_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : disassociate_aws_training_certification_email_domain_request) =
    let input =
      Json_serializers.disassociate_aws_training_certification_email_domain_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.DisassociateAwsTrainingCertificationEmailDomain" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_aws_training_certification_email_domain_response_of_yojson
      ~error_deserializer
end

module GetAllianceLeadContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_alliance_lead_contact_request) =
    let input = Json_serializers.get_alliance_lead_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetAllianceLeadContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_alliance_lead_contact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_alliance_lead_contact_request) =
    let input = Json_serializers.get_alliance_lead_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetAllianceLeadContact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_alliance_lead_contact_response_of_yojson
      ~error_deserializer
end

module GetConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_request) =
    let input = Json_serializers.get_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_connection_request) =
    let input = Json_serializers.get_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_response_of_yojson ~error_deserializer
end

module GetConnectionInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_invitation_request) =
    let input = Json_serializers.get_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetConnectionInvitation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_connection_invitation_request) =
    let input = Json_serializers.get_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_invitation_response_of_yojson
      ~error_deserializer
end

module GetConnectionPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_preferences_request) =
    let input = Json_serializers.get_connection_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetConnectionPreferences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_connection_preferences_request) =
    let input = Json_serializers.get_connection_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetConnectionPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_preferences_response_of_yojson
      ~error_deserializer
end

module GetPartner = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_partner_request) =
    let input = Json_serializers.get_partner_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetPartner" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_partner_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_partner_request) =
    let input = Json_serializers.get_partner_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PartnerCentralAccount.GetPartner"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_partner_response_of_yojson ~error_deserializer
end

module GetProfileUpdateTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_profile_update_task_request) =
    let input = Json_serializers.get_profile_update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetProfileUpdateTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_profile_update_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_profile_update_task_request) =
    let input = Json_serializers.get_profile_update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetProfileUpdateTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_profile_update_task_response_of_yojson
      ~error_deserializer
end

module GetProfileVisibility = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_profile_visibility_request) =
    let input = Json_serializers.get_profile_visibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetProfileVisibility"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_profile_visibility_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_profile_visibility_request) =
    let input = Json_serializers.get_profile_visibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetProfileVisibility" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_profile_visibility_response_of_yojson
      ~error_deserializer
end

module ListConnectionInvitations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connection_invitations_request) =
    let input = Json_serializers.list_connection_invitations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.ListConnectionInvitations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connection_invitations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_connection_invitations_request) =
    let input = Json_serializers.list_connection_invitations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.ListConnectionInvitations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connection_invitations_response_of_yojson
      ~error_deserializer
end

module ListConnections = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connections_request) =
    let input = Json_serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.ListConnections" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_connections_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_connections_request) =
    let input = Json_serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.ListConnections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connections_response_of_yojson
      ~error_deserializer
end

module ListPartners = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_partners_request) =
    let input = Json_serializers.list_partners_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.ListPartners" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_partners_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_partners_request) =
    let input = Json_serializers.list_partners_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.ListPartners" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_partners_response_of_yojson ~error_deserializer
end

module GetVerification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_verification_request) =
    let input = Json_serializers.get_verification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.GetVerification" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_verification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_verification_request) =
    let input = Json_serializers.get_verification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.GetVerification" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_verification_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutAllianceLeadContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_alliance_lead_contact_request) =
    let input = Json_serializers.put_alliance_lead_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.PutAllianceLeadContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_alliance_lead_contact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_alliance_lead_contact_request) =
    let input = Json_serializers.put_alliance_lead_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.PutAllianceLeadContact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_alliance_lead_contact_response_of_yojson
      ~error_deserializer
end

module PutProfileVisibility = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_profile_visibility_request) =
    let input = Json_serializers.put_profile_visibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.PutProfileVisibility"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_profile_visibility_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_profile_visibility_request) =
    let input = Json_serializers.put_profile_visibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.PutProfileVisibility" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_profile_visibility_response_of_yojson
      ~error_deserializer
end

module RejectConnectionInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_connection_invitation_request) =
    let input = Json_serializers.reject_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.RejectConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_connection_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_connection_invitation_request) =
    let input = Json_serializers.reject_connection_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.RejectConnectionInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_connection_invitation_response_of_yojson
      ~error_deserializer
end

module SendEmailVerificationCode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_email_verification_code_request) =
    let input = Json_serializers.send_email_verification_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.SendEmailVerificationCode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_email_verification_code_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_email_verification_code_request) =
    let input = Json_serializers.send_email_verification_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.SendEmailVerificationCode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_email_verification_code_response_of_yojson
      ~error_deserializer
end

module StartProfileUpdateTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_profile_update_task_request) =
    let input = Json_serializers.start_profile_update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.StartProfileUpdateTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_profile_update_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_profile_update_task_request) =
    let input = Json_serializers.start_profile_update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.StartProfileUpdateTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_profile_update_task_response_of_yojson
      ~error_deserializer
end

module StartVerification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralaccount#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_verification_request) =
    let input = Json_serializers.start_verification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.StartVerification"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_verification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_verification_request) =
    let input = Json_serializers.start_verification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.StartVerification" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_verification_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralaccount#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralAccount.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateConnectionPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralaccount#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralaccount#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralaccount#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralaccount#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralaccount#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connection_preferences_request) =
    let input = Json_serializers.update_connection_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralAccount.UpdateConnectionPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connection_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connection_preferences_request) =
    let input = Json_serializers.update_connection_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralAccount.UpdateConnectionPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connection_preferences_response_of_yojson
      ~error_deserializer
end
