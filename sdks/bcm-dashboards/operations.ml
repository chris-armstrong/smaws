open Types
open Service_metadata

module CreateDashboard = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmdashboards#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : create_dashboard_request) =
    let input = Json_serializers.create_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.CreateDashboard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dashboard_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dashboard_request) =
    let input = Json_serializers.create_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.CreateDashboard" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dashboard_response_of_yojson
      ~error_deserializer
end

module CreateScheduledReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.bcmdashboards#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmdashboards#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : create_scheduled_report_request) =
    let input = Json_serializers.create_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.CreateScheduledReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_scheduled_report_request) =
    let input = Json_serializers.create_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.CreateScheduledReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_report_response_of_yojson
      ~error_deserializer
end

module DeleteDashboard = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : delete_dashboard_request) =
    let input = Json_serializers.delete_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.DeleteDashboard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_dashboard_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dashboard_request) =
    let input = Json_serializers.delete_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.DeleteDashboard" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_dashboard_response_of_yojson
      ~error_deserializer
end

module DeleteScheduledReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : delete_scheduled_report_request) =
    let input = Json_serializers.delete_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.DeleteScheduledReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_report_request) =
    let input = Json_serializers.delete_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.DeleteScheduledReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_report_response_of_yojson
      ~error_deserializer
end

module ExecuteScheduledReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.bcmdashboards#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : execute_scheduled_report_request) =
    let input = Json_serializers.execute_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.ExecuteScheduledReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_scheduled_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : execute_scheduled_report_request) =
    let input = Json_serializers.execute_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.ExecuteScheduledReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_scheduled_report_response_of_yojson
      ~error_deserializer
end

module GetDashboard = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : get_dashboard_request) =
    let input = Json_serializers.get_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.GetDashboard" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_dashboard_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_dashboard_request) =
    let input = Json_serializers.get_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.GetDashboard" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_dashboard_response_of_yojson ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.GetResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module GetScheduledReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : get_scheduled_report_request) =
    let input = Json_serializers.get_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.GetScheduledReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_scheduled_report_request) =
    let input = Json_serializers.get_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.GetScheduledReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_report_response_of_yojson
      ~error_deserializer
end

module ListDashboards = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : list_dashboards_request) =
    let input = Json_serializers.list_dashboards_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.ListDashboards"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dashboards_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_dashboards_request) =
    let input = Json_serializers.list_dashboards_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.ListDashboards" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dashboards_response_of_yojson ~error_deserializer
end

module ListScheduledReports = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : list_scheduled_reports_request) =
    let input = Json_serializers.list_scheduled_reports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.ListScheduledReports"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_reports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_scheduled_reports_request) =
    let input = Json_serializers.list_scheduled_reports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.ListScheduledReports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_reports_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateDashboard = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : update_dashboard_request) =
    let input = Json_serializers.update_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.UpdateDashboard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dashboard_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_dashboard_request) =
    let input = Json_serializers.update_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.UpdateDashboard" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dashboard_response_of_yojson
      ~error_deserializer
end

module UpdateScheduledReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdashboards#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.bcmdashboards#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.bcmdashboards#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdashboards#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdashboards#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdashboards#ValidationException"
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

  let request context (request : update_scheduled_report_request) =
    let input = Json_serializers.update_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMDashboardsService.UpdateScheduledReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scheduled_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_scheduled_report_request) =
    let input = Json_serializers.update_scheduled_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMDashboardsService.UpdateScheduledReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scheduled_report_response_of_yojson
      ~error_deserializer
end
