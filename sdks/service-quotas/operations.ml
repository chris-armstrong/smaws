open Types
open Service_metadata

module AssociateServiceQuotaTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.servicequotas#OrganizationNotInAllFeaturesModeException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_service_quota_template_request) =
    let input = Json_serializers.associate_service_quota_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.AssociateServiceQuotaTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_service_quota_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_service_quota_template_request) =
    let input = Json_serializers.associate_service_quota_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.AssociateServiceQuotaTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_service_quota_template_response_of_yojson
      ~error_deserializer
end

module CreateSupportCase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidResourceStateException _ ->
        "com.amazonaws.servicequotas#InvalidResourceStateException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.servicequotas#ResourceAlreadyExistsException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_support_case_request) =
    let input = Json_serializers.create_support_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.CreateSupportCase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_support_case_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_support_case_request) =
    let input = Json_serializers.create_support_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.CreateSupportCase" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_support_case_response_of_yojson
      ~error_deserializer
end

module DeleteServiceQuotaIncreaseRequestFromTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_quota_increase_request_from_template_request) =
    let input =
      Json_serializers.delete_service_quota_increase_request_from_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.DeleteServiceQuotaIncreaseRequestFromTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_service_quota_increase_request_from_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : delete_service_quota_increase_request_from_template_request) =
    let input =
      Json_serializers.delete_service_quota_increase_request_from_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.DeleteServiceQuotaIncreaseRequestFromTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_service_quota_increase_request_from_template_response_of_yojson
      ~error_deserializer
end

module DisassociateServiceQuotaTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `ServiceQuotaTemplateNotInUseException _ ->
        "com.amazonaws.servicequotas#ServiceQuotaTemplateNotInUseException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "ServiceQuotaTemplateNotInUseException" ->
          `ServiceQuotaTemplateNotInUseException
            (Json_deserializers.service_quota_template_not_in_use_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_service_quota_template_request) =
    let input = Json_serializers.disassociate_service_quota_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.DisassociateServiceQuotaTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_service_quota_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_service_quota_template_request) =
    let input = Json_serializers.disassociate_service_quota_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.DisassociateServiceQuotaTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_service_quota_template_response_of_yojson
      ~error_deserializer
end

module GetAssociationForServiceQuotaTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `ServiceQuotaTemplateNotInUseException _ ->
        "com.amazonaws.servicequotas#ServiceQuotaTemplateNotInUseException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "ServiceQuotaTemplateNotInUseException" ->
          `ServiceQuotaTemplateNotInUseException
            (Json_deserializers.service_quota_template_not_in_use_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_association_for_service_quota_template_request) =
    let input =
      Json_serializers.get_association_for_service_quota_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.GetAssociationForServiceQuotaTemplate" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_association_for_service_quota_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_association_for_service_quota_template_request) =
    let input =
      Json_serializers.get_association_for_service_quota_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetAssociationForServiceQuotaTemplate" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_association_for_service_quota_template_response_of_yojson
      ~error_deserializer
end

module GetAutoManagementConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_auto_management_configuration_request) =
    let input = Json_serializers.get_auto_management_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.GetAutoManagementConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_auto_management_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_auto_management_configuration_request) =
    let input = Json_serializers.get_auto_management_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetAutoManagementConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_auto_management_configuration_response_of_yojson
      ~error_deserializer
end

module GetAWSDefaultServiceQuota = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aws_default_service_quota_request) =
    let input = Json_serializers.get_aws_default_service_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.GetAWSDefaultServiceQuota" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_aws_default_service_quota_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_aws_default_service_quota_request) =
    let input = Json_serializers.get_aws_default_service_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetAWSDefaultServiceQuota" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_aws_default_service_quota_response_of_yojson
      ~error_deserializer
end

module GetQuotaUtilizationReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_quota_utilization_report_request) =
    let input = Json_serializers.get_quota_utilization_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.GetQuotaUtilizationReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_quota_utilization_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_quota_utilization_report_request) =
    let input = Json_serializers.get_quota_utilization_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetQuotaUtilizationReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_quota_utilization_report_response_of_yojson
      ~error_deserializer
end

module GetRequestedServiceQuotaChange = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_requested_service_quota_change_request) =
    let input = Json_serializers.get_requested_service_quota_change_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.GetRequestedServiceQuotaChange" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_requested_service_quota_change_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_requested_service_quota_change_request) =
    let input = Json_serializers.get_requested_service_quota_change_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetRequestedServiceQuotaChange" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_requested_service_quota_change_response_of_yojson
      ~error_deserializer
end

module GetServiceQuota = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_quota_request) =
    let input = Json_serializers.get_service_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.GetServiceQuota"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_quota_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_service_quota_request) =
    let input = Json_serializers.get_service_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetServiceQuota" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_quota_response_of_yojson
      ~error_deserializer
end

module GetServiceQuotaIncreaseRequestFromTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_quota_increase_request_from_template_request) =
    let input =
      Json_serializers.get_service_quota_increase_request_from_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.GetServiceQuotaIncreaseRequestFromTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_service_quota_increase_request_from_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : get_service_quota_increase_request_from_template_request) =
    let input =
      Json_serializers.get_service_quota_increase_request_from_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.GetServiceQuotaIncreaseRequestFromTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_service_quota_increase_request_from_template_response_of_yojson
      ~error_deserializer
end

module ListAWSDefaultServiceQuotas = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.servicequotas#InvalidPaginationTokenException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aws_default_service_quotas_request) =
    let input = Json_serializers.list_aws_default_service_quotas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.ListAWSDefaultServiceQuotas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aws_default_service_quotas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_aws_default_service_quotas_request) =
    let input = Json_serializers.list_aws_default_service_quotas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListAWSDefaultServiceQuotas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aws_default_service_quotas_response_of_yojson
      ~error_deserializer
end

module ListRequestedServiceQuotaChangeHistory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.servicequotas#InvalidPaginationTokenException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_requested_service_quota_change_history_request) =
    let input =
      Json_serializers.list_requested_service_quota_change_history_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistory" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_requested_service_quota_change_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_requested_service_quota_change_history_request)
      =
    let input =
      Json_serializers.list_requested_service_quota_change_history_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistory" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_requested_service_quota_change_history_response_of_yojson
      ~error_deserializer
end

module ListRequestedServiceQuotaChangeHistoryByQuota = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.servicequotas#InvalidPaginationTokenException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_requested_service_quota_change_history_by_quota_request) =
    let input =
      Json_serializers.list_requested_service_quota_change_history_by_quota_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistoryByQuota" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_requested_service_quota_change_history_by_quota_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_requested_service_quota_change_history_by_quota_request) =
    let input =
      Json_serializers.list_requested_service_quota_change_history_by_quota_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistoryByQuota" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_requested_service_quota_change_history_by_quota_response_of_yojson
      ~error_deserializer
end

module ListServiceQuotaIncreaseRequestsInTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_quota_increase_requests_in_template_request) =
    let input =
      Json_serializers.list_service_quota_increase_requests_in_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.ListServiceQuotaIncreaseRequestsInTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_service_quota_increase_requests_in_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_service_quota_increase_requests_in_template_request) =
    let input =
      Json_serializers.list_service_quota_increase_requests_in_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListServiceQuotaIncreaseRequestsInTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_service_quota_increase_requests_in_template_response_of_yojson
      ~error_deserializer
end

module ListServiceQuotas = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.servicequotas#InvalidPaginationTokenException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_quotas_request) =
    let input = Json_serializers.list_service_quotas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.ListServiceQuotas"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_quotas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_service_quotas_request) =
    let input = Json_serializers.list_service_quotas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListServiceQuotas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_quotas_response_of_yojson
      ~error_deserializer
end

module ListServices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.servicequotas#InvalidPaginationTokenException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_request) =
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.ListServices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_services_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_services_request) =
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_services_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutServiceQuotaIncreaseRequestIntoTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `AWSServiceAccessNotEnabledException _ ->
        "com.amazonaws.servicequotas#AWSServiceAccessNotEnabledException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.servicequotas#NoAvailableOrganizationException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `QuotaExceededException _ -> "com.amazonaws.servicequotas#QuotaExceededException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TemplatesNotAvailableInRegionException _ ->
        "com.amazonaws.servicequotas#TemplatesNotAvailableInRegionException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSServiceAccessNotEnabledException" ->
          `AWSServiceAccessNotEnabledException
            (Json_deserializers.aws_service_access_not_enabled_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "QuotaExceededException" ->
          `QuotaExceededException (Json_deserializers.quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TemplatesNotAvailableInRegionException" ->
          `TemplatesNotAvailableInRegionException
            (Json_deserializers.templates_not_available_in_region_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_service_quota_increase_request_into_template_request) =
    let input =
      Json_serializers.put_service_quota_increase_request_into_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.PutServiceQuotaIncreaseRequestIntoTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.put_service_quota_increase_request_into_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : put_service_quota_increase_request_into_template_request) =
    let input =
      Json_serializers.put_service_quota_increase_request_into_template_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.PutServiceQuotaIncreaseRequestIntoTemplate" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.put_service_quota_increase_request_into_template_response_of_yojson
      ~error_deserializer
end

module RequestServiceQuotaIncrease = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `DependencyAccessDeniedException _ ->
        "com.amazonaws.servicequotas#DependencyAccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidResourceStateException _ ->
        "com.amazonaws.servicequotas#InvalidResourceStateException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `QuotaExceededException _ -> "com.amazonaws.servicequotas#QuotaExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.servicequotas#ResourceAlreadyExistsException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DependencyAccessDeniedException" ->
          `DependencyAccessDeniedException
            (Json_deserializers.dependency_access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "QuotaExceededException" ->
          `QuotaExceededException (Json_deserializers.quota_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : request_service_quota_increase_request) =
    let input = Json_serializers.request_service_quota_increase_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.RequestServiceQuotaIncrease" ~service ~context ~input
      ~output_deserializer:Json_deserializers.request_service_quota_increase_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : request_service_quota_increase_request) =
    let input = Json_serializers.request_service_quota_increase_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.RequestServiceQuotaIncrease" ~service ~context ~input
      ~output_deserializer:Json_deserializers.request_service_quota_increase_response_of_yojson
      ~error_deserializer
end

module StartAutoManagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_auto_management_request) =
    let input = Json_serializers.start_auto_management_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.StartAutoManagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_auto_management_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_auto_management_request) =
    let input = Json_serializers.start_auto_management_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.StartAutoManagement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_auto_management_response_of_yojson
      ~error_deserializer
end

module StartQuotaUtilizationReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.servicequotas#InvalidPaginationTokenException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_quota_utilization_report_request) =
    let input = Json_serializers.start_quota_utilization_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ServiceQuotasV20190624.StartQuotaUtilizationReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_quota_utilization_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_quota_utilization_report_request) =
    let input = Json_serializers.start_quota_utilization_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.StartQuotaUtilizationReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_quota_utilization_report_response_of_yojson
      ~error_deserializer
end

module StopAutoManagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_auto_management_request) =
    let input = Json_serializers.stop_auto_management_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.StopAutoManagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_auto_management_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_auto_management_request) =
    let input = Json_serializers.stop_auto_management_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.StopAutoManagement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_auto_management_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TagPolicyViolationException _ -> "com.amazonaws.servicequotas#TagPolicyViolationException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.servicequotas#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TagPolicyViolationException" ->
          `TagPolicyViolationException
            (Json_deserializers.tag_policy_violation_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAutoManagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.servicequotas#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.servicequotas#IllegalArgumentException"
    | `NoSuchResourceException _ -> "com.amazonaws.servicequotas#NoSuchResourceException"
    | `ServiceException _ -> "com.amazonaws.servicequotas#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.servicequotas#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "NoSuchResourceException" ->
          `NoSuchResourceException
            (Json_deserializers.no_such_resource_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_auto_management_request) =
    let input = Json_serializers.update_auto_management_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ServiceQuotasV20190624.UpdateAutoManagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_auto_management_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_auto_management_request) =
    let input = Json_serializers.update_auto_management_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ServiceQuotasV20190624.UpdateAutoManagement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_auto_management_response_of_yojson
      ~error_deserializer
end
