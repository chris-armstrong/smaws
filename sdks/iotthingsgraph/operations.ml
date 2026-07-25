open Types
open Service_metadata

module ListFlowExecutionMessages = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_flow_execution_messages_request) =
    let input = Json_serializers.list_flow_execution_messages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.ListFlowExecutionMessages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_execution_messages_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_flow_execution_messages_request) =
    let input = Json_serializers.list_flow_execution_messages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.ListFlowExecutionMessages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_execution_messages_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.iotthingsgraph#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module SearchEntities = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_entities_request) =
    let input = Json_serializers.search_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.SearchEntities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_entities_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_entities_request) =
    let input = Json_serializers.search_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.SearchEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_entities_response_of_yojson ~error_deserializer
end

module SearchFlowExecutions = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_flow_executions_request) =
    let input = Json_serializers.search_flow_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.SearchFlowExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_flow_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_flow_executions_request) =
    let input = Json_serializers.search_flow_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.SearchFlowExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_flow_executions_response_of_yojson
      ~error_deserializer
end

module SearchFlowTemplates = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_flow_templates_request) =
    let input = Json_serializers.search_flow_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.SearchFlowTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_flow_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_flow_templates_request) =
    let input = Json_serializers.search_flow_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.SearchFlowTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_flow_templates_response_of_yojson
      ~error_deserializer
end

module SearchSystemInstances = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_system_instances_request) =
    let input = Json_serializers.search_system_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.SearchSystemInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_system_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_system_instances_request) =
    let input = Json_serializers.search_system_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.SearchSystemInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_system_instances_response_of_yojson
      ~error_deserializer
end

module SearchSystemTemplates = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_system_templates_request) =
    let input = Json_serializers.search_system_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.SearchSystemTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_system_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_system_templates_request) =
    let input = Json_serializers.search_system_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.SearchSystemTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_system_templates_response_of_yojson
      ~error_deserializer
end

module SearchThings = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_things_request) =
    let input = Json_serializers.search_things_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.SearchThings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_things_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_things_request) =
    let input = Json_serializers.search_things_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.SearchThings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_things_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.iotthingsgraph#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UndeploySystemInstance = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.iotthingsgraph#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
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

  let request context (request : undeploy_system_instance_request) =
    let input = Json_serializers.undeploy_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.UndeploySystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.undeploy_system_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : undeploy_system_instance_request) =
    let input = Json_serializers.undeploy_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.UndeploySystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.undeploy_system_instance_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.iotthingsgraph#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateFlowTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_flow_template_request) =
    let input = Json_serializers.update_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.UpdateFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_flow_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_flow_template_request) =
    let input = Json_serializers.update_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.UpdateFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_flow_template_response_of_yojson
      ~error_deserializer
end

module UpdateSystemTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_system_template_request) =
    let input = Json_serializers.update_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.UpdateSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_system_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_system_template_request) =
    let input = Json_serializers.update_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.UpdateSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_system_template_response_of_yojson
      ~error_deserializer
end

module UploadEntityDefinitions = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : upload_entity_definitions_request) =
    let input = Json_serializers.upload_entity_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.UploadEntityDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.upload_entity_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : upload_entity_definitions_request) =
    let input = Json_serializers.upload_entity_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.UploadEntityDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.upload_entity_definitions_response_of_yojson
      ~error_deserializer
end

module GetUploadStatus = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_upload_status_request) =
    let input = Json_serializers.get_upload_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.GetUploadStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_upload_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_upload_status_request) =
    let input = Json_serializers.get_upload_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetUploadStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_upload_status_response_of_yojson
      ~error_deserializer
end

module GetSystemTemplateRevisions = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_system_template_revisions_request) =
    let input = Json_serializers.get_system_template_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.GetSystemTemplateRevisions" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_system_template_revisions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_system_template_revisions_request) =
    let input = Json_serializers.get_system_template_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetSystemTemplateRevisions" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_system_template_revisions_response_of_yojson
      ~error_deserializer
end

module GetSystemTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_system_template_request) =
    let input = Json_serializers.get_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.GetSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_system_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_system_template_request) =
    let input = Json_serializers.get_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_system_template_response_of_yojson
      ~error_deserializer
end

module GetSystemInstance = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_system_instance_request) =
    let input = Json_serializers.get_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.GetSystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_system_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_system_instance_request) =
    let input = Json_serializers.get_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetSystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_system_instance_response_of_yojson
      ~error_deserializer
end

module GetNamespaceDeletionStatus = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_namespace_deletion_status_request) =
    let input = Json_serializers.get_namespace_deletion_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.GetNamespaceDeletionStatus" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_namespace_deletion_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_namespace_deletion_status_request) =
    let input = Json_serializers.get_namespace_deletion_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetNamespaceDeletionStatus" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_namespace_deletion_status_response_of_yojson
      ~error_deserializer
end

module GetFlowTemplateRevisions = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_flow_template_revisions_request) =
    let input = Json_serializers.get_flow_template_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.GetFlowTemplateRevisions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_flow_template_revisions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_flow_template_revisions_request) =
    let input = Json_serializers.get_flow_template_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetFlowTemplateRevisions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_flow_template_revisions_response_of_yojson
      ~error_deserializer
end

module GetFlowTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_flow_template_request) =
    let input = Json_serializers.get_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.GetFlowTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_flow_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_flow_template_request) =
    let input = Json_serializers.get_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_flow_template_response_of_yojson
      ~error_deserializer
end

module GetEntities = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_entities_request) =
    let input = Json_serializers.get_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.GetEntities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entities_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_entities_request) =
    let input = Json_serializers.get_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.GetEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entities_response_of_yojson ~error_deserializer
end

module DissociateEntityFromThing = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : dissociate_entity_from_thing_request) =
    let input = Json_serializers.dissociate_entity_from_thing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DissociateEntityFromThing" ~service ~context ~input
      ~output_deserializer:Json_deserializers.dissociate_entity_from_thing_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : dissociate_entity_from_thing_request) =
    let input = Json_serializers.dissociate_entity_from_thing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DissociateEntityFromThing" ~service ~context ~input
      ~output_deserializer:Json_deserializers.dissociate_entity_from_thing_response_of_yojson
      ~error_deserializer
end

module DescribeNamespace = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_namespace_request) =
    let input = Json_serializers.describe_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DescribeNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_namespace_request) =
    let input = Json_serializers.describe_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DescribeNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_namespace_response_of_yojson
      ~error_deserializer
end

module DeprecateSystemTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deprecate_system_template_request) =
    let input = Json_serializers.deprecate_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DeprecateSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deprecate_system_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deprecate_system_template_request) =
    let input = Json_serializers.deprecate_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeprecateSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deprecate_system_template_response_of_yojson
      ~error_deserializer
end

module DeprecateFlowTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deprecate_flow_template_request) =
    let input = Json_serializers.deprecate_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DeprecateFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deprecate_flow_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deprecate_flow_template_request) =
    let input = Json_serializers.deprecate_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeprecateFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deprecate_flow_template_response_of_yojson
      ~error_deserializer
end

module DeploySystemInstance = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.iotthingsgraph#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
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

  let request context (request : deploy_system_instance_request) =
    let input = Json_serializers.deploy_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DeploySystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deploy_system_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deploy_system_instance_request) =
    let input = Json_serializers.deploy_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeploySystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deploy_system_instance_response_of_yojson
      ~error_deserializer
end

module DeleteSystemTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.iotthingsgraph#ResourceInUseException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_system_template_request) =
    let input = Json_serializers.delete_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DeleteSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_system_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_system_template_request) =
    let input = Json_serializers.delete_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeleteSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_system_template_response_of_yojson
      ~error_deserializer
end

module DeleteSystemInstance = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.iotthingsgraph#ResourceInUseException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_system_instance_request) =
    let input = Json_serializers.delete_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DeleteSystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_system_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_system_instance_request) =
    let input = Json_serializers.delete_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeleteSystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_system_instance_response_of_yojson
      ~error_deserializer
end

module DeleteNamespace = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_namespace_request) =
    let input = Json_serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IotThingsGraphFrontEndService.DeleteNamespace"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_namespace_request) =
    let input = Json_serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeleteNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_namespace_response_of_yojson
      ~error_deserializer
end

module DeleteFlowTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.iotthingsgraph#ResourceInUseException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_flow_template_request) =
    let input = Json_serializers.delete_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.DeleteFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_flow_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_flow_template_request) =
    let input = Json_serializers.delete_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.DeleteFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_flow_template_response_of_yojson
      ~error_deserializer
end

module CreateSystemTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.iotthingsgraph#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_system_template_request) =
    let input = Json_serializers.create_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.CreateSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_system_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_system_template_request) =
    let input = Json_serializers.create_system_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.CreateSystemTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_system_template_response_of_yojson
      ~error_deserializer
end

module CreateSystemInstance = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.iotthingsgraph#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.iotthingsgraph#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_system_instance_request) =
    let input = Json_serializers.create_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.CreateSystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_system_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_system_instance_request) =
    let input = Json_serializers.create_system_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.CreateSystemInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_system_instance_response_of_yojson
      ~error_deserializer
end

module CreateFlowTemplate = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.iotthingsgraph#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.iotthingsgraph#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_flow_template_request) =
    let input = Json_serializers.create_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.CreateFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_flow_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_flow_template_request) =
    let input = Json_serializers.create_flow_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.CreateFlowTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_flow_template_response_of_yojson
      ~error_deserializer
end

module AssociateEntityToThing = struct
  let error_to_string = function
    | `InternalFailureException _ -> "com.amazonaws.iotthingsgraph#InternalFailureException"
    | `InvalidRequestException _ -> "com.amazonaws.iotthingsgraph#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotthingsgraph#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotthingsgraph#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_entity_to_thing_request) =
    let input = Json_serializers.associate_entity_to_thing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IotThingsGraphFrontEndService.AssociateEntityToThing" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_entity_to_thing_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_entity_to_thing_request) =
    let input = Json_serializers.associate_entity_to_thing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IotThingsGraphFrontEndService.AssociateEntityToThing" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_entity_to_thing_response_of_yojson
      ~error_deserializer
end
