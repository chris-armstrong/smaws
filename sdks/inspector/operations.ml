open Types
open Service_metadata

module ListAssessmentRunAgents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_assessment_run_agents_request) =
    let input = Json_serializers.list_assessment_run_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListAssessmentRunAgents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_run_agents_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_assessment_run_agents_request) =
    let input = Json_serializers.list_assessment_run_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListAssessmentRunAgents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_run_agents_response_of_yojson
      ~error_deserializer
end

module ListAssessmentRuns = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_assessment_runs_request) =
    let input = Json_serializers.list_assessment_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListAssessmentRuns" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_assessment_runs_request) =
    let input = Json_serializers.list_assessment_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListAssessmentRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_runs_response_of_yojson
      ~error_deserializer
end

module ListAssessmentTargets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_assessment_targets_request) =
    let input = Json_serializers.list_assessment_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListAssessmentTargets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_targets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_assessment_targets_request) =
    let input = Json_serializers.list_assessment_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListAssessmentTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_targets_response_of_yojson
      ~error_deserializer
end

module ListAssessmentTemplates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_assessment_templates_request) =
    let input = Json_serializers.list_assessment_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListAssessmentTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_assessment_templates_request) =
    let input = Json_serializers.list_assessment_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListAssessmentTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assessment_templates_response_of_yojson
      ~error_deserializer
end

module ListEventSubscriptions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_event_subscriptions_request) =
    let input = Json_serializers.list_event_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListEventSubscriptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_event_subscriptions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_event_subscriptions_request) =
    let input = Json_serializers.list_event_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListEventSubscriptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_event_subscriptions_response_of_yojson
      ~error_deserializer
end

module ListExclusions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_exclusions_request) =
    let input = Json_serializers.list_exclusions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListExclusions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_exclusions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_exclusions_request) =
    let input = Json_serializers.list_exclusions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"InspectorService.ListExclusions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_exclusions_response_of_yojson ~error_deserializer
end

module ListFindings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_findings_request) =
    let input = Json_serializers.list_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListFindings" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_findings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_findings_request) =
    let input = Json_serializers.list_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"InspectorService.ListFindings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_findings_response_of_yojson ~error_deserializer
end

module ListRulesPackages = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rules_packages_request) =
    let input = Json_serializers.list_rules_packages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListRulesPackages" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_rules_packages_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rules_packages_request) =
    let input = Json_serializers.list_rules_packages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListRulesPackages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rules_packages_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PreviewAgents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidCrossAccountRoleException _ ->
        "com.amazonaws.inspector#InvalidCrossAccountRoleException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidCrossAccountRoleException" ->
          `InvalidCrossAccountRoleException
            (Json_deserializers.invalid_cross_account_role_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : preview_agents_request) =
    let input = Json_serializers.preview_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.PreviewAgents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.preview_agents_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : preview_agents_request) =
    let input = Json_serializers.preview_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"InspectorService.PreviewAgents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.preview_agents_response_of_yojson ~error_deserializer
end

module RegisterCrossAccountAccessRole = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidCrossAccountRoleException _ ->
        "com.amazonaws.inspector#InvalidCrossAccountRoleException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidCrossAccountRoleException" ->
          `InvalidCrossAccountRoleException
            (Json_deserializers.invalid_cross_account_role_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_cross_account_access_role_request) =
    let input = Json_serializers.register_cross_account_access_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"InspectorService.RegisterCrossAccountAccessRole" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_cross_account_access_role_request) =
    let input = Json_serializers.register_cross_account_access_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.RegisterCrossAccountAccessRole" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RemoveAttributesFromFindings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_attributes_from_findings_request) =
    let input = Json_serializers.remove_attributes_from_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.RemoveAttributesFromFindings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_attributes_from_findings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_attributes_from_findings_request) =
    let input = Json_serializers.remove_attributes_from_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.RemoveAttributesFromFindings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_attributes_from_findings_response_of_yojson
      ~error_deserializer
end

module SetTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_tags_for_resource_request) =
    let input = Json_serializers.set_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.SetTagsForResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_tags_for_resource_request) =
    let input = Json_serializers.set_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.SetTagsForResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartAssessmentRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `AgentsAlreadyRunningAssessmentException _ ->
        "com.amazonaws.inspector#AgentsAlreadyRunningAssessmentException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidCrossAccountRoleException _ ->
        "com.amazonaws.inspector#InvalidCrossAccountRoleException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.inspector#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AgentsAlreadyRunningAssessmentException" ->
          `AgentsAlreadyRunningAssessmentException
            (Json_deserializers.agents_already_running_assessment_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidCrossAccountRoleException" ->
          `InvalidCrossAccountRoleException
            (Json_deserializers.invalid_cross_account_role_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_assessment_run_request) =
    let input = Json_serializers.start_assessment_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.StartAssessmentRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_assessment_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_assessment_run_request) =
    let input = Json_serializers.start_assessment_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.StartAssessmentRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_assessment_run_response_of_yojson
      ~error_deserializer
end

module StopAssessmentRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_assessment_run_request) =
    let input = Json_serializers.stop_assessment_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.StopAssessmentRun" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_assessment_run_request) =
    let input = Json_serializers.stop_assessment_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.StopAssessmentRun" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SubscribeToEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.inspector#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : subscribe_to_event_request) =
    let input = Json_serializers.subscribe_to_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.SubscribeToEvent" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : subscribe_to_event_request) =
    let input = Json_serializers.subscribe_to_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.SubscribeToEvent" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UnsubscribeFromEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : unsubscribe_from_event_request) =
    let input = Json_serializers.unsubscribe_from_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.UnsubscribeFromEvent" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : unsubscribe_from_event_request) =
    let input = Json_serializers.unsubscribe_from_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.UnsubscribeFromEvent" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateAssessmentTarget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_assessment_target_request) =
    let input = Json_serializers.update_assessment_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.UpdateAssessmentTarget"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_assessment_target_request) =
    let input = Json_serializers.update_assessment_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.UpdateAssessmentTarget" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module GetTelemetryMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_telemetry_metadata_request) =
    let input = Json_serializers.get_telemetry_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.GetTelemetryMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_telemetry_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_telemetry_metadata_request) =
    let input = Json_serializers.get_telemetry_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.GetTelemetryMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_telemetry_metadata_response_of_yojson
      ~error_deserializer
end

module GetExclusionsPreview = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_exclusions_preview_request) =
    let input = Json_serializers.get_exclusions_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.GetExclusionsPreview" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_exclusions_preview_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_exclusions_preview_request) =
    let input = Json_serializers.get_exclusions_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.GetExclusionsPreview" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_exclusions_preview_response_of_yojson
      ~error_deserializer
end

module GetAssessmentReport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `AssessmentRunInProgressException _ ->
        "com.amazonaws.inspector#AssessmentRunInProgressException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.inspector#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AssessmentRunInProgressException" ->
          `AssessmentRunInProgressException
            (Json_deserializers.assessment_run_in_progress_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_assessment_report_request) =
    let input = Json_serializers.get_assessment_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.GetAssessmentReport" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_assessment_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_assessment_report_request) =
    let input = Json_serializers.get_assessment_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.GetAssessmentReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_assessment_report_response_of_yojson
      ~error_deserializer
end

module DescribeRulesPackages = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_rules_packages_request) =
    let input = Json_serializers.describe_rules_packages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeRulesPackages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rules_packages_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rules_packages_request) =
    let input = Json_serializers.describe_rules_packages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeRulesPackages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rules_packages_response_of_yojson
      ~error_deserializer
end

module DescribeResourceGroups = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_resource_groups_request) =
    let input = Json_serializers.describe_resource_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeResourceGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_resource_groups_request) =
    let input = Json_serializers.describe_resource_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeResourceGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_groups_response_of_yojson
      ~error_deserializer
end

module DescribeFindings = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_findings_request) =
    let input = Json_serializers.describe_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeFindings" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_findings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_findings_request) =
    let input = Json_serializers.describe_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeFindings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_findings_response_of_yojson
      ~error_deserializer
end

module DescribeExclusions = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_exclusions_request) =
    let input = Json_serializers.describe_exclusions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeExclusions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_exclusions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_exclusions_request) =
    let input = Json_serializers.describe_exclusions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeExclusions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_exclusions_response_of_yojson
      ~error_deserializer
end

module DescribeCrossAccountAccessRole = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"InspectorService.DescribeCrossAccountAccessRole" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cross_account_access_role_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeCrossAccountAccessRole" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cross_account_access_role_response_of_yojson
      ~error_deserializer
end

module DescribeAssessmentTemplates = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_assessment_templates_request) =
    let input = Json_serializers.describe_assessment_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeAssessmentTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_assessment_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_assessment_templates_request) =
    let input = Json_serializers.describe_assessment_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeAssessmentTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_assessment_templates_response_of_yojson
      ~error_deserializer
end

module DescribeAssessmentTargets = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_assessment_targets_request) =
    let input = Json_serializers.describe_assessment_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeAssessmentTargets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_assessment_targets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_assessment_targets_request) =
    let input = Json_serializers.describe_assessment_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeAssessmentTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_assessment_targets_response_of_yojson
      ~error_deserializer
end

module DescribeAssessmentRuns = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_assessment_runs_request) =
    let input = Json_serializers.describe_assessment_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DescribeAssessmentRuns"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_assessment_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_assessment_runs_request) =
    let input = Json_serializers.describe_assessment_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DescribeAssessmentRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_assessment_runs_response_of_yojson
      ~error_deserializer
end

module DeleteAssessmentTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `AssessmentRunInProgressException _ ->
        "com.amazonaws.inspector#AssessmentRunInProgressException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AssessmentRunInProgressException" ->
          `AssessmentRunInProgressException
            (Json_deserializers.assessment_run_in_progress_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_assessment_template_request) =
    let input = Json_serializers.delete_assessment_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DeleteAssessmentTemplate"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_assessment_template_request) =
    let input = Json_serializers.delete_assessment_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DeleteAssessmentTemplate" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAssessmentTarget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `AssessmentRunInProgressException _ ->
        "com.amazonaws.inspector#AssessmentRunInProgressException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AssessmentRunInProgressException" ->
          `AssessmentRunInProgressException
            (Json_deserializers.assessment_run_in_progress_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_assessment_target_request) =
    let input = Json_serializers.delete_assessment_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DeleteAssessmentTarget"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_assessment_target_request) =
    let input = Json_serializers.delete_assessment_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DeleteAssessmentTarget" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAssessmentRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `AssessmentRunInProgressException _ ->
        "com.amazonaws.inspector#AssessmentRunInProgressException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AssessmentRunInProgressException" ->
          `AssessmentRunInProgressException
            (Json_deserializers.assessment_run_in_progress_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_assessment_run_request) =
    let input = Json_serializers.delete_assessment_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.DeleteAssessmentRun" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_assessment_run_request) =
    let input = Json_serializers.delete_assessment_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.DeleteAssessmentRun" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateResourceGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.inspector#LimitExceededException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resource_group_request) =
    let input = Json_serializers.create_resource_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.CreateResourceGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resource_group_request) =
    let input = Json_serializers.create_resource_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.CreateResourceGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_group_response_of_yojson
      ~error_deserializer
end

module CreateExclusionsPreview = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `PreviewGenerationInProgressException _ ->
        "com.amazonaws.inspector#PreviewGenerationInProgressException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "PreviewGenerationInProgressException" ->
          `PreviewGenerationInProgressException
            (Json_deserializers.preview_generation_in_progress_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_exclusions_preview_request) =
    let input = Json_serializers.create_exclusions_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.CreateExclusionsPreview"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_exclusions_preview_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_exclusions_preview_request) =
    let input = Json_serializers.create_exclusions_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.CreateExclusionsPreview" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_exclusions_preview_response_of_yojson
      ~error_deserializer
end

module CreateAssessmentTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.inspector#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_assessment_template_request) =
    let input = Json_serializers.create_assessment_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.CreateAssessmentTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_assessment_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_assessment_template_request) =
    let input = Json_serializers.create_assessment_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.CreateAssessmentTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_assessment_template_response_of_yojson
      ~error_deserializer
end

module CreateAssessmentTarget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidCrossAccountRoleException _ ->
        "com.amazonaws.inspector#InvalidCrossAccountRoleException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.inspector#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidCrossAccountRoleException" ->
          `InvalidCrossAccountRoleException
            (Json_deserializers.invalid_cross_account_role_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_assessment_target_request) =
    let input = Json_serializers.create_assessment_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.CreateAssessmentTarget"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_assessment_target_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_assessment_target_request) =
    let input = Json_serializers.create_assessment_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.CreateAssessmentTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_assessment_target_response_of_yojson
      ~error_deserializer
end

module AddAttributesToFindings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.inspector#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.inspector#InternalException"
    | `InvalidInputException _ -> "com.amazonaws.inspector#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.inspector#NoSuchEntityException"
    | `ServiceTemporarilyUnavailableException _ ->
        "com.amazonaws.inspector#ServiceTemporarilyUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NoSuchEntityException" ->
          `NoSuchEntityException (Json_deserializers.no_such_entity_exception_of_yojson tree path)
      | _, "ServiceTemporarilyUnavailableException" ->
          `ServiceTemporarilyUnavailableException
            (Json_deserializers.service_temporarily_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_attributes_to_findings_request) =
    let input = Json_serializers.add_attributes_to_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"InspectorService.AddAttributesToFindings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_attributes_to_findings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_attributes_to_findings_request) =
    let input = Json_serializers.add_attributes_to_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"InspectorService.AddAttributesToFindings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_attributes_to_findings_response_of_yojson
      ~error_deserializer
end
