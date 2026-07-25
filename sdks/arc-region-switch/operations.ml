open Types
open Service_metadata

module UpdatePlan = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_plan_request) =
    let input = Json_serializers.update_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.UpdatePlan" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_plan_request) =
    let input = Json_serializers.update_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.UpdatePlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_plan_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.arcregionswitch#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.arcregionswitch#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.arcregionswitch#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListPlans = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_plans_request) =
    let input = Json_serializers.list_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ListPlans" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_plans_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_plans_request) =
    let input = Json_serializers.list_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.ListPlans"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_plans_response_of_yojson
      ~error_deserializer
end

module GetPlan = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_plan_request) =
    let input = Json_serializers.get_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.GetPlan" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_plan_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_plan_request) =
    let input = Json_serializers.get_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.GetPlan" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_plan_response_of_yojson
      ~error_deserializer
end

module DeletePlan = struct
  let error_to_string = function
    | `IllegalStateException _ -> "com.amazonaws.arcregionswitch#IllegalStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IllegalStateException" ->
          `IllegalStateException (Json_deserializers.illegal_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_plan_request) =
    let input = Json_serializers.delete_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.DeletePlan" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_plan_request) =
    let input = Json_serializers.delete_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.DeletePlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_plan_response_of_yojson ~error_deserializer
end

module CreatePlan = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_plan_request) =
    let input = Json_serializers.create_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.CreatePlan" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_plan_request) =
    let input = Json_serializers.create_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.CreatePlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_plan_response_of_yojson ~error_deserializer
end

module CancelPlanExecution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_plan_execution_request) =
    let input = Json_serializers.cancel_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.CancelPlanExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_plan_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_plan_execution_request) =
    let input = Json_serializers.cancel_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.CancelPlanExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_plan_execution_response_of_yojson
      ~error_deserializer
end

module GetPlanEvaluationStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_plan_evaluation_status_request) =
    let input = Json_serializers.get_plan_evaluation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.GetPlanEvaluationStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_plan_evaluation_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_plan_evaluation_status_request) =
    let input = Json_serializers.get_plan_evaluation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.GetPlanEvaluationStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_plan_evaluation_status_response_of_yojson
      ~error_deserializer
end

module GetPlanExecution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_plan_execution_request) =
    let input = Json_serializers.get_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.GetPlanExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_plan_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_plan_execution_request) =
    let input = Json_serializers.get_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.GetPlanExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_plan_execution_response_of_yojson
      ~error_deserializer
end

module GetPlanInRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_plan_in_region_request) =
    let input = Json_serializers.get_plan_in_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.GetPlanInRegion" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_plan_in_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_plan_in_region_request) =
    let input = Json_serializers.get_plan_in_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ArcRegionSwitch.GetPlanInRegion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_plan_in_region_response_of_yojson
      ~error_deserializer
end

module ListPlanExecutionEvents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_plan_execution_events_request) =
    let input = Json_serializers.list_plan_execution_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ListPlanExecutionEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_plan_execution_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_plan_execution_events_request) =
    let input = Json_serializers.list_plan_execution_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ListPlanExecutionEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_plan_execution_events_response_of_yojson
      ~error_deserializer
end

module ListPlanExecutions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_plan_executions_request) =
    let input = Json_serializers.list_plan_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ListPlanExecutions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_plan_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_plan_executions_request) =
    let input = Json_serializers.list_plan_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ListPlanExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_plan_executions_response_of_yojson
      ~error_deserializer
end

module ListPlansInRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_plans_in_region_request) =
    let input = Json_serializers.list_plans_in_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ListPlansInRegion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_plans_in_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_plans_in_region_request) =
    let input = Json_serializers.list_plans_in_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ListPlansInRegion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_plans_in_region_response_of_yojson
      ~error_deserializer
end

module ListRoute53HealthChecks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.arcregionswitch#IllegalArgumentException"
    | `InternalServerException _ -> "com.amazonaws.arcregionswitch#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_route53_health_checks_request) =
    let input = Json_serializers.list_route53_health_checks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ListRoute53HealthChecks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_route53_health_checks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_route53_health_checks_request) =
    let input = Json_serializers.list_route53_health_checks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ListRoute53HealthChecks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_route53_health_checks_response_of_yojson
      ~error_deserializer
end

module ListRoute53HealthChecksInRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.arcregionswitch#IllegalArgumentException"
    | `InternalServerException _ -> "com.amazonaws.arcregionswitch#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_route53_health_checks_in_region_request) =
    let input = Json_serializers.list_route53_health_checks_in_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ArcRegionSwitch.ListRoute53HealthChecksInRegion" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_route53_health_checks_in_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_route53_health_checks_in_region_request) =
    let input = Json_serializers.list_route53_health_checks_in_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ListRoute53HealthChecksInRegion" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_route53_health_checks_in_region_response_of_yojson
      ~error_deserializer
end

module StartPlanExecution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `IllegalArgumentException _ -> "com.amazonaws.arcregionswitch#IllegalArgumentException"
    | `IllegalStateException _ -> "com.amazonaws.arcregionswitch#IllegalStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalArgumentException" ->
          `IllegalArgumentException
            (Json_deserializers.illegal_argument_exception_of_yojson tree path)
      | _, "IllegalStateException" ->
          `IllegalStateException (Json_deserializers.illegal_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_plan_execution_request) =
    let input = Json_serializers.start_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.StartPlanExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_plan_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_plan_execution_request) =
    let input = Json_serializers.start_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.StartPlanExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_plan_execution_response_of_yojson
      ~error_deserializer
end

module UpdatePlanExecution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `IllegalStateException _ -> "com.amazonaws.arcregionswitch#IllegalStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IllegalStateException" ->
          `IllegalStateException (Json_deserializers.illegal_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_plan_execution_request) =
    let input = Json_serializers.update_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.UpdatePlanExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_plan_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_plan_execution_request) =
    let input = Json_serializers.update_plan_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.UpdatePlanExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_plan_execution_response_of_yojson
      ~error_deserializer
end

module UpdatePlanExecutionStep = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_plan_execution_step_request) =
    let input = Json_serializers.update_plan_execution_step_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.UpdatePlanExecutionStep"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_plan_execution_step_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_plan_execution_step_request) =
    let input = Json_serializers.update_plan_execution_step_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.UpdatePlanExecutionStep" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_plan_execution_step_response_of_yojson
      ~error_deserializer
end

module ApprovePlanExecutionStep = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.arcregionswitch#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.arcregionswitch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : approve_plan_execution_step_request) =
    let input = Json_serializers.approve_plan_execution_step_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ArcRegionSwitch.ApprovePlanExecutionStep"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.approve_plan_execution_step_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : approve_plan_execution_step_request) =
    let input = Json_serializers.approve_plan_execution_step_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ArcRegionSwitch.ApprovePlanExecutionStep" ~service ~context ~input
      ~output_deserializer:Json_deserializers.approve_plan_execution_step_response_of_yojson
      ~error_deserializer
end
