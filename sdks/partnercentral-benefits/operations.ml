open Types
open Service_metadata

module AmendBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : amend_benefit_application_input) =
    let input = Json_serializers.amend_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.AmendBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.amend_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : amend_benefit_application_input) =
    let input = Json_serializers.amend_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.AmendBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.amend_benefit_application_output_of_yojson
      ~error_deserializer
end

module AssociateBenefitApplicationResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : associate_benefit_application_resource_input) =
    let input = Json_serializers.associate_benefit_application_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.AssociateBenefitApplicationResource" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_benefit_application_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_benefit_application_resource_input) =
    let input = Json_serializers.associate_benefit_application_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.AssociateBenefitApplicationResource" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_benefit_application_resource_output_of_yojson
      ~error_deserializer
end

module CancelBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : cancel_benefit_application_input) =
    let input = Json_serializers.cancel_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.CancelBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_benefit_application_input) =
    let input = Json_serializers.cancel_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.CancelBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_benefit_application_output_of_yojson
      ~error_deserializer
end

module CreateBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : create_benefit_application_input) =
    let input = Json_serializers.create_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.CreateBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_benefit_application_input) =
    let input = Json_serializers.create_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.CreateBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_benefit_application_output_of_yojson
      ~error_deserializer
end

module DisassociateBenefitApplicationResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : disassociate_benefit_application_resource_input) =
    let input =
      Json_serializers.disassociate_benefit_application_resource_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.DisassociateBenefitApplicationResource" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_benefit_application_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_benefit_application_resource_input) =
    let input =
      Json_serializers.disassociate_benefit_application_resource_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.DisassociateBenefitApplicationResource" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_benefit_application_resource_output_of_yojson
      ~error_deserializer
end

module GetBenefit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : get_benefit_input) =
    let input = Json_serializers.get_benefit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralBenefitsService.GetBenefit"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_benefit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_benefit_input) =
    let input = Json_serializers.get_benefit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.GetBenefit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_benefit_output_of_yojson ~error_deserializer
end

module GetBenefitAllocation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : get_benefit_allocation_input) =
    let input = Json_serializers.get_benefit_allocation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.GetBenefitAllocation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_benefit_allocation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_benefit_allocation_input) =
    let input = Json_serializers.get_benefit_allocation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.GetBenefitAllocation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_benefit_allocation_output_of_yojson
      ~error_deserializer
end

module GetBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : get_benefit_application_input) =
    let input = Json_serializers.get_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.GetBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_benefit_application_input) =
    let input = Json_serializers.get_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.GetBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_benefit_application_output_of_yojson
      ~error_deserializer
end

module ListBenefitAllocations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : list_benefit_allocations_input) =
    let input = Json_serializers.list_benefit_allocations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.ListBenefitAllocations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_benefit_allocations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_benefit_allocations_input) =
    let input = Json_serializers.list_benefit_allocations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.ListBenefitAllocations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_benefit_allocations_output_of_yojson
      ~error_deserializer
end

module ListBenefitApplications = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : list_benefit_applications_input) =
    let input = Json_serializers.list_benefit_applications_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.ListBenefitApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_benefit_applications_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_benefit_applications_input) =
    let input = Json_serializers.list_benefit_applications_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.ListBenefitApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_benefit_applications_output_of_yojson
      ~error_deserializer
end

module ListBenefits = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : list_benefits_input) =
    let input = Json_serializers.list_benefits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralBenefitsService.ListBenefits"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_benefits_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_benefits_input) =
    let input = Json_serializers.list_benefits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.ListBenefits" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_benefits_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RecallBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : recall_benefit_application_input) =
    let input = Json_serializers.recall_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.RecallBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.recall_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : recall_benefit_application_input) =
    let input = Json_serializers.recall_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.RecallBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.recall_benefit_application_output_of_yojson
      ~error_deserializer
end

module SubmitBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : submit_benefit_application_input) =
    let input = Json_serializers.submit_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.SubmitBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.submit_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : submit_benefit_application_input) =
    let input = Json_serializers.submit_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.SubmitBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.submit_benefit_application_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralbenefits#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralBenefitsService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralbenefits#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralBenefitsService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateBenefitApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralbenefits#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralbenefits#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralbenefits#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralbenefits#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralbenefits#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralbenefits#ValidationException"
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

  let request context (request : update_benefit_application_input) =
    let input = Json_serializers.update_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralBenefitsService.UpdateBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_benefit_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_benefit_application_input) =
    let input = Json_serializers.update_benefit_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralBenefitsService.UpdateBenefitApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_benefit_application_output_of_yojson
      ~error_deserializer
end
