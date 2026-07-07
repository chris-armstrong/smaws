open Types
open Service_metadata

module AcceptEngagementInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : accept_engagement_invitation_request) =
    let input = Json_serializers.accept_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.AcceptEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_engagement_invitation_request) =
    let input = Json_serializers.accept_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.AcceptEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AssignOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : assign_opportunity_request) =
    let input = Json_serializers.assign_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.AssignOpportunity"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : assign_opportunity_request) =
    let input = Json_serializers.assign_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.AssignOpportunity" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AssociateOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : associate_opportunity_request) =
    let input = Json_serializers.associate_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.AssociateOpportunity"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_opportunity_request) =
    let input = Json_serializers.associate_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.AssociateOpportunity" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateEngagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : create_engagement_request) =
    let input = Json_serializers.create_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.CreateEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_engagement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_engagement_request) =
    let input = Json_serializers.create_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.CreateEngagement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_engagement_response_of_yojson
      ~error_deserializer
end

module CreateEngagementContext = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : create_engagement_context_request) =
    let input = Json_serializers.create_engagement_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.CreateEngagementContext" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_engagement_context_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_engagement_context_request) =
    let input = Json_serializers.create_engagement_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.CreateEngagementContext" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_engagement_context_response_of_yojson
      ~error_deserializer
end

module CreateEngagementInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : create_engagement_invitation_request) =
    let input = Json_serializers.create_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.CreateEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_engagement_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_engagement_invitation_request) =
    let input = Json_serializers.create_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.CreateEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_engagement_invitation_response_of_yojson
      ~error_deserializer
end

module CreateOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : create_opportunity_request) =
    let input = Json_serializers.create_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.CreateOpportunity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_opportunity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_opportunity_request) =
    let input = Json_serializers.create_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.CreateOpportunity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_opportunity_response_of_yojson
      ~error_deserializer
end

module CreateResourceSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : create_resource_snapshot_request) =
    let input = Json_serializers.create_resource_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.CreateResourceSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resource_snapshot_request) =
    let input = Json_serializers.create_resource_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.CreateResourceSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_snapshot_response_of_yojson
      ~error_deserializer
end

module CreateResourceSnapshotJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : create_resource_snapshot_job_request) =
    let input = Json_serializers.create_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.CreateResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_snapshot_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resource_snapshot_job_request) =
    let input = Json_serializers.create_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.CreateResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_snapshot_job_response_of_yojson
      ~error_deserializer
end

module DeleteResourceSnapshotJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : delete_resource_snapshot_job_request) =
    let input = Json_serializers.delete_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.DeleteResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_snapshot_job_request) =
    let input = Json_serializers.delete_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.DeleteResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DisassociateOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : disassociate_opportunity_request) =
    let input = Json_serializers.disassociate_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.DisassociateOpportunity" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_opportunity_request) =
    let input = Json_serializers.disassociate_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.DisassociateOpportunity" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module GetAwsOpportunitySummary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_aws_opportunity_summary_request) =
    let input = Json_serializers.get_aws_opportunity_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.GetAwsOpportunitySummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_aws_opportunity_summary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_aws_opportunity_summary_request) =
    let input = Json_serializers.get_aws_opportunity_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetAwsOpportunitySummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_aws_opportunity_summary_response_of_yojson
      ~error_deserializer
end

module GetEngagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_engagement_request) =
    let input = Json_serializers.get_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.GetEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_engagement_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_engagement_request) =
    let input = Json_serializers.get_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetEngagement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_engagement_response_of_yojson ~error_deserializer
end

module GetEngagementInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_engagement_invitation_request) =
    let input = Json_serializers.get_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.GetEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_engagement_invitation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_engagement_invitation_request) =
    let input = Json_serializers.get_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_engagement_invitation_response_of_yojson
      ~error_deserializer
end

module GetOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_opportunity_request) =
    let input = Json_serializers.get_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.GetOpportunity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_opportunity_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_opportunity_request) =
    let input = Json_serializers.get_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetOpportunity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_opportunity_response_of_yojson ~error_deserializer
end

module GetProspectingFromEngagementTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_prospecting_from_engagement_task_request) =
    let input = Json_serializers.get_prospecting_from_engagement_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.GetProspectingFromEngagementTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_prospecting_from_engagement_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_prospecting_from_engagement_task_request) =
    let input = Json_serializers.get_prospecting_from_engagement_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetProspectingFromEngagementTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_prospecting_from_engagement_task_response_of_yojson
      ~error_deserializer
end

module GetResourceSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_resource_snapshot_request) =
    let input = Json_serializers.get_resource_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.GetResourceSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_snapshot_request) =
    let input = Json_serializers.get_resource_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetResourceSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_snapshot_response_of_yojson
      ~error_deserializer
end

module GetResourceSnapshotJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_resource_snapshot_job_request) =
    let input = Json_serializers.get_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.GetResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_snapshot_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_snapshot_job_request) =
    let input = Json_serializers.get_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_snapshot_job_response_of_yojson
      ~error_deserializer
end

module GetSellingSystemSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : get_selling_system_settings_request) =
    let input = Json_serializers.get_selling_system_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.GetSellingSystemSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_selling_system_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_selling_system_settings_request) =
    let input = Json_serializers.get_selling_system_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.GetSellingSystemSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_selling_system_settings_response_of_yojson
      ~error_deserializer
end

module ListEngagementByAcceptingInvitationTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_engagement_by_accepting_invitation_tasks_request) =
    let input =
      Json_serializers.list_engagement_by_accepting_invitation_tasks_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementByAcceptingInvitationTasks" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_engagement_by_accepting_invitation_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_engagement_by_accepting_invitation_tasks_request) =
    let input =
      Json_serializers.list_engagement_by_accepting_invitation_tasks_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementByAcceptingInvitationTasks" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_engagement_by_accepting_invitation_tasks_response_of_yojson
      ~error_deserializer
end

module ListEngagementFromOpportunityTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_engagement_from_opportunity_tasks_request) =
    let input = Json_serializers.list_engagement_from_opportunity_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementFromOpportunityTasks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_engagement_from_opportunity_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engagement_from_opportunity_tasks_request) =
    let input = Json_serializers.list_engagement_from_opportunity_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementFromOpportunityTasks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_engagement_from_opportunity_tasks_response_of_yojson
      ~error_deserializer
end

module ListEngagementInvitations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_engagement_invitations_request) =
    let input = Json_serializers.list_engagement_invitations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementInvitations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagement_invitations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engagement_invitations_request) =
    let input = Json_serializers.list_engagement_invitations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementInvitations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagement_invitations_response_of_yojson
      ~error_deserializer
end

module ListEngagementMembers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_engagement_members_request) =
    let input = Json_serializers.list_engagement_members_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.ListEngagementMembers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagement_members_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engagement_members_request) =
    let input = Json_serializers.list_engagement_members_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementMembers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagement_members_response_of_yojson
      ~error_deserializer
end

module ListEngagementResourceAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_engagement_resource_associations_request) =
    let input = Json_serializers.list_engagement_resource_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementResourceAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_engagement_resource_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engagement_resource_associations_request) =
    let input = Json_serializers.list_engagement_resource_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListEngagementResourceAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_engagement_resource_associations_response_of_yojson
      ~error_deserializer
end

module ListEngagements = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_engagements_request) =
    let input = Json_serializers.list_engagements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.ListEngagements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagements_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engagements_request) =
    let input = Json_serializers.list_engagements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListEngagements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagements_response_of_yojson
      ~error_deserializer
end

module ListOpportunities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_opportunities_request) =
    let input = Json_serializers.list_opportunities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.ListOpportunities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_opportunities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_opportunities_request) =
    let input = Json_serializers.list_opportunities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListOpportunities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_opportunities_response_of_yojson
      ~error_deserializer
end

module ListOpportunityFromEngagementTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_opportunity_from_engagement_tasks_request) =
    let input = Json_serializers.list_opportunity_from_engagement_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListOpportunityFromEngagementTasks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_opportunity_from_engagement_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_opportunity_from_engagement_tasks_request) =
    let input = Json_serializers.list_opportunity_from_engagement_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListOpportunityFromEngagementTasks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_opportunity_from_engagement_tasks_response_of_yojson
      ~error_deserializer
end

module ListProspectingFromEngagementTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_prospecting_from_engagement_tasks_request) =
    let input = Json_serializers.list_prospecting_from_engagement_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListProspectingFromEngagementTasks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_prospecting_from_engagement_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_prospecting_from_engagement_tasks_request) =
    let input = Json_serializers.list_prospecting_from_engagement_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListProspectingFromEngagementTasks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_prospecting_from_engagement_tasks_response_of_yojson
      ~error_deserializer
end

module ListResourceSnapshotJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_resource_snapshot_jobs_request) =
    let input = Json_serializers.list_resource_snapshot_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.ListResourceSnapshotJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_snapshot_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resource_snapshot_jobs_request) =
    let input = Json_serializers.list_resource_snapshot_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListResourceSnapshotJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_snapshot_jobs_response_of_yojson
      ~error_deserializer
end

module ListResourceSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_resource_snapshots_request) =
    let input = Json_serializers.list_resource_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.ListResourceSnapshots"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_snapshots_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resource_snapshots_request) =
    let input = Json_serializers.list_resource_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListResourceSnapshots" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_snapshots_response_of_yojson
      ~error_deserializer
end

module ListSolutions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : list_solutions_request) =
    let input = Json_serializers.list_solutions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.ListSolutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_solutions_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_solutions_request) =
    let input = Json_serializers.list_solutions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListSolutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_solutions_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutSellingSystemSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : put_selling_system_settings_request) =
    let input = Json_serializers.put_selling_system_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.PutSellingSystemSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_selling_system_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_selling_system_settings_request) =
    let input = Json_serializers.put_selling_system_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.PutSellingSystemSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_selling_system_settings_response_of_yojson
      ~error_deserializer
end

module RejectEngagementInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : reject_engagement_invitation_request) =
    let input = Json_serializers.reject_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.RejectEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_engagement_invitation_request) =
    let input = Json_serializers.reject_engagement_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.RejectEngagementInvitation" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartEngagementByAcceptingInvitationTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : start_engagement_by_accepting_invitation_task_request) =
    let input =
      Json_serializers.start_engagement_by_accepting_invitation_task_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.StartEngagementByAcceptingInvitationTask" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.start_engagement_by_accepting_invitation_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : start_engagement_by_accepting_invitation_task_request) =
    let input =
      Json_serializers.start_engagement_by_accepting_invitation_task_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.StartEngagementByAcceptingInvitationTask" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.start_engagement_by_accepting_invitation_task_response_of_yojson
      ~error_deserializer
end

module StartEngagementFromOpportunityTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : start_engagement_from_opportunity_task_request) =
    let input = Json_serializers.start_engagement_from_opportunity_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.StartEngagementFromOpportunityTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_engagement_from_opportunity_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_engagement_from_opportunity_task_request) =
    let input = Json_serializers.start_engagement_from_opportunity_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.StartEngagementFromOpportunityTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_engagement_from_opportunity_task_response_of_yojson
      ~error_deserializer
end

module StartOpportunityFromEngagementTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : start_opportunity_from_engagement_task_request) =
    let input = Json_serializers.start_opportunity_from_engagement_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.StartOpportunityFromEngagementTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_opportunity_from_engagement_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_opportunity_from_engagement_task_request) =
    let input = Json_serializers.start_opportunity_from_engagement_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.StartOpportunityFromEngagementTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_opportunity_from_engagement_task_response_of_yojson
      ~error_deserializer
end

module StartProspectingFromEngagementTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : start_prospecting_from_engagement_task_request) =
    let input = Json_serializers.start_prospecting_from_engagement_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.StartProspectingFromEngagementTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_prospecting_from_engagement_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_prospecting_from_engagement_task_request) =
    let input = Json_serializers.start_prospecting_from_engagement_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.StartProspectingFromEngagementTask" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_prospecting_from_engagement_task_response_of_yojson
      ~error_deserializer
end

module StartResourceSnapshotJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : start_resource_snapshot_job_request) =
    let input = Json_serializers.start_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.StartResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_resource_snapshot_job_request) =
    let input = Json_serializers.start_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.StartResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopResourceSnapshotJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : stop_resource_snapshot_job_request) =
    let input = Json_serializers.stop_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.StopResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_resource_snapshot_job_request) =
    let input = Json_serializers.stop_resource_snapshot_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.StopResourceSnapshotJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SubmitOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : submit_opportunity_request) =
    let input = Json_serializers.submit_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.SubmitOpportunity"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : submit_opportunity_request) =
    let input = Json_serializers.submit_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.SubmitOpportunity" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateEngagementContext = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralselling#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : update_engagement_context_request) =
    let input = Json_serializers.update_engagement_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPartnerCentralSelling.UpdateEngagementContext" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_engagement_context_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_engagement_context_request) =
    let input = Json_serializers.update_engagement_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.UpdateEngagementContext" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_engagement_context_response_of_yojson
      ~error_deserializer
end

module UpdateOpportunity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralselling#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralselling#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralselling#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralselling#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralselling#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralselling#ValidationException"
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

  let request context (request : update_opportunity_request) =
    let input = Json_serializers.update_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPartnerCentralSelling.UpdateOpportunity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_opportunity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_opportunity_request) =
    let input = Json_serializers.update_opportunity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPartnerCentralSelling.UpdateOpportunity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_opportunity_response_of_yojson
      ~error_deserializer
end
