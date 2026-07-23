open Types
open Service_metadata

module GetComputeAccess = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compute_access_input) =
    let input = Json_serializers.get_compute_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.GetComputeAccess" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_compute_access_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_compute_access_input) =
    let input = Json_serializers.get_compute_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.GetComputeAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_compute_access_output_of_yojson
      ~error_deserializer
end

module GetComputeAuthToken = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compute_auth_token_input) =
    let input = Json_serializers.get_compute_auth_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.GetComputeAuthToken" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_compute_auth_token_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_compute_auth_token_input) =
    let input = Json_serializers.get_compute_auth_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.GetComputeAuthToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_compute_auth_token_output_of_yojson
      ~error_deserializer
end

module GetGameSessionLogUrl = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_game_session_log_url_input) =
    let input = Json_serializers.get_game_session_log_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.GetGameSessionLogUrl" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_game_session_log_url_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_game_session_log_url_input) =
    let input = Json_serializers.get_game_session_log_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.GetGameSessionLogUrl"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_game_session_log_url_output_of_yojson
      ~error_deserializer
end

module GetInstanceAccess = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_access_input) =
    let input = Json_serializers.get_instance_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.GetInstanceAccess" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_instance_access_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_instance_access_input) =
    let input = Json_serializers.get_instance_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.GetInstanceAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_access_output_of_yojson
      ~error_deserializer
end

module GetPlayerConnectionDetails = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidGameSessionStatusException _ ->
        "com.amazonaws.gamelift#InvalidGameSessionStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidGameSessionStatusException" ->
          `InvalidGameSessionStatusException
            (Json_deserializers.invalid_game_session_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_player_connection_details_input) =
    let input = Json_serializers.get_player_connection_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.GetPlayerConnectionDetails" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_player_connection_details_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_player_connection_details_input) =
    let input = Json_serializers.get_player_connection_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.GetPlayerConnectionDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_player_connection_details_output_of_yojson
      ~error_deserializer
end

module ListAliases = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aliases_input) =
    let input = Json_serializers.list_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aliases_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_aliases_input) =
    let input = Json_serializers.list_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListAliases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_aliases_output_of_yojson
      ~error_deserializer
end

module ListBuilds = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_builds_input) =
    let input = Json_serializers.list_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListBuilds" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_builds_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_builds_input) =
    let input = Json_serializers.list_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListBuilds" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_builds_output_of_yojson
      ~error_deserializer
end

module ListCompute = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_compute_input) =
    let input = Json_serializers.list_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListCompute" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_compute_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_compute_input) =
    let input = Json_serializers.list_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListCompute" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_compute_output_of_yojson
      ~error_deserializer
end

module ListContainerFleets = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_container_fleets_input) =
    let input = Json_serializers.list_container_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListContainerFleets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_container_fleets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_container_fleets_input) =
    let input = Json_serializers.list_container_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListContainerFleets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_container_fleets_output_of_yojson
      ~error_deserializer
end

module ListContainerGroupDefinitions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_container_group_definitions_input) =
    let input = Json_serializers.list_container_group_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListContainerGroupDefinitions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_container_group_definitions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_container_group_definitions_input) =
    let input = Json_serializers.list_container_group_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.ListContainerGroupDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_container_group_definitions_output_of_yojson
      ~error_deserializer
end

module ListContainerGroupDefinitionVersions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_container_group_definition_versions_input) =
    let input = Json_serializers.list_container_group_definition_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListContainerGroupDefinitionVersions"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_container_group_definition_versions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_container_group_definition_versions_input) =
    let input = Json_serializers.list_container_group_definition_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.ListContainerGroupDefinitionVersions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_container_group_definition_versions_output_of_yojson
      ~error_deserializer
end

module ListFleetDeployments = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_fleet_deployments_input) =
    let input = Json_serializers.list_fleet_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListFleetDeployments" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_fleet_deployments_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fleet_deployments_input) =
    let input = Json_serializers.list_fleet_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListFleetDeployments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fleet_deployments_output_of_yojson
      ~error_deserializer
end

module ListFleets = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_fleets_input) =
    let input = Json_serializers.list_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListFleets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fleets_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_fleets_input) =
    let input = Json_serializers.list_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListFleets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_fleets_output_of_yojson
      ~error_deserializer
end

module ListGameServerGroups = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_game_server_groups_input) =
    let input = Json_serializers.list_game_server_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListGameServerGroups" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_game_server_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_game_server_groups_input) =
    let input = Json_serializers.list_game_server_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListGameServerGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_game_server_groups_output_of_yojson
      ~error_deserializer
end

module ListGameServers = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_game_servers_input) =
    let input = Json_serializers.list_game_servers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListGameServers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_game_servers_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_game_servers_input) =
    let input = Json_serializers.list_game_servers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListGameServers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_game_servers_output_of_yojson ~error_deserializer
end

module ListLocations = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_locations_input) =
    let input = Json_serializers.list_locations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListLocations" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_locations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_locations_input) =
    let input = Json_serializers.list_locations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListLocations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_locations_output_of_yojson
      ~error_deserializer
end

module ListScripts = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_scripts_input) =
    let input = Json_serializers.list_scripts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListScripts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scripts_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_scripts_input) =
    let input = Json_serializers.list_scripts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListScripts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_scripts_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutScalingPolicy = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_scaling_policy_input) =
    let input = Json_serializers.put_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.PutScalingPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_scaling_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_scaling_policy_input) =
    let input = Json_serializers.put_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.PutScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_scaling_policy_output_of_yojson
      ~error_deserializer
end

module RegisterCompute = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotReadyException _ -> "com.amazonaws.gamelift#NotReadyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotReadyException" ->
          `NotReadyException (Json_deserializers.not_ready_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_compute_input) =
    let input = Json_serializers.register_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.RegisterCompute" ~service ~context
      ~input ~output_deserializer:Json_deserializers.register_compute_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_compute_input) =
    let input = Json_serializers.register_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.RegisterCompute"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_compute_output_of_yojson ~error_deserializer
end

module RegisterGameServer = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_game_server_input) =
    let input = Json_serializers.register_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.RegisterGameServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.register_game_server_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_game_server_input) =
    let input = Json_serializers.register_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.RegisterGameServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_game_server_output_of_yojson
      ~error_deserializer
end

module RequestUploadCredentials = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : request_upload_credentials_input) =
    let input = Json_serializers.request_upload_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.RequestUploadCredentials" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.request_upload_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : request_upload_credentials_input) =
    let input = Json_serializers.request_upload_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.RequestUploadCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.request_upload_credentials_output_of_yojson
      ~error_deserializer
end

module ResolveAlias = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resolve_alias_input) =
    let input = Json_serializers.resolve_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ResolveAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.resolve_alias_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : resolve_alias_input) =
    let input = Json_serializers.resolve_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ResolveAlias" ~service
      ~context ~input ~output_deserializer:Json_deserializers.resolve_alias_output_of_yojson
      ~error_deserializer
end

module ResumeGameServerGroup = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resume_game_server_group_input) =
    let input = Json_serializers.resume_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ResumeGameServerGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.resume_game_server_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resume_game_server_group_input) =
    let input = Json_serializers.resume_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ResumeGameServerGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.resume_game_server_group_output_of_yojson
      ~error_deserializer
end

module SearchGameSessions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_game_sessions_input) =
    let input = Json_serializers.search_game_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.SearchGameSessions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.search_game_sessions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_game_sessions_input) =
    let input = Json_serializers.search_game_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.SearchGameSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_game_sessions_output_of_yojson
      ~error_deserializer
end

module StartFleetActions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_fleet_actions_input) =
    let input = Json_serializers.start_fleet_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StartFleetActions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_fleet_actions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_fleet_actions_input) =
    let input = Json_serializers.start_fleet_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.StartFleetActions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_fleet_actions_output_of_yojson
      ~error_deserializer
end

module StartGameSessionPlacement = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_game_session_placement_input) =
    let input = Json_serializers.start_game_session_placement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StartGameSessionPlacement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_game_session_placement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_game_session_placement_input) =
    let input = Json_serializers.start_game_session_placement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.StartGameSessionPlacement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_game_session_placement_output_of_yojson
      ~error_deserializer
end

module StartMatchBackfill = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_match_backfill_input) =
    let input = Json_serializers.start_match_backfill_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StartMatchBackfill" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_match_backfill_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_match_backfill_input) =
    let input = Json_serializers.start_match_backfill_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.StartMatchBackfill"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_match_backfill_output_of_yojson
      ~error_deserializer
end

module StartMatchmaking = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_matchmaking_input) =
    let input = Json_serializers.start_matchmaking_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StartMatchmaking" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_matchmaking_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_matchmaking_input) =
    let input = Json_serializers.start_matchmaking_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.StartMatchmaking"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_matchmaking_output_of_yojson ~error_deserializer
end

module StopFleetActions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_fleet_actions_input) =
    let input = Json_serializers.stop_fleet_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StopFleetActions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_fleet_actions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_fleet_actions_input) =
    let input = Json_serializers.stop_fleet_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.StopFleetActions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_fleet_actions_output_of_yojson
      ~error_deserializer
end

module StopGameSessionPlacement = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_game_session_placement_input) =
    let input = Json_serializers.stop_game_session_placement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StopGameSessionPlacement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_game_session_placement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_game_session_placement_input) =
    let input = Json_serializers.stop_game_session_placement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.StopGameSessionPlacement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_game_session_placement_output_of_yojson
      ~error_deserializer
end

module StopMatchmaking = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_matchmaking_input) =
    let input = Json_serializers.stop_matchmaking_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.StopMatchmaking" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_matchmaking_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_matchmaking_input) =
    let input = Json_serializers.stop_matchmaking_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.StopMatchmaking"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_matchmaking_output_of_yojson ~error_deserializer
end

module SuspendGameServerGroup = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : suspend_game_server_group_input) =
    let input = Json_serializers.suspend_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.SuspendGameServerGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.suspend_game_server_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : suspend_game_server_group_input) =
    let input = Json_serializers.suspend_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.SuspendGameServerGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.suspend_game_server_group_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module TerminateGameSession = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidGameSessionStatusException _ ->
        "com.amazonaws.gamelift#InvalidGameSessionStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `NotReadyException _ -> "com.amazonaws.gamelift#NotReadyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidGameSessionStatusException" ->
          `InvalidGameSessionStatusException
            (Json_deserializers.invalid_game_session_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "NotReadyException" ->
          `NotReadyException (Json_deserializers.not_ready_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_game_session_input) =
    let input = Json_serializers.terminate_game_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.TerminateGameSession" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.terminate_game_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_game_session_input) =
    let input = Json_serializers.terminate_game_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.TerminateGameSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_game_session_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateAlias = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_alias_input) =
    let input = Json_serializers.update_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_alias_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_alias_input) =
    let input = Json_serializers.update_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateAlias" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_alias_output_of_yojson
      ~error_deserializer
end

module UpdateBuild = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_build_input) =
    let input = Json_serializers.update_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateBuild" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_build_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_build_input) =
    let input = Json_serializers.update_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateBuild" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_build_output_of_yojson
      ~error_deserializer
end

module UpdateContainerFleet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `NotReadyException _ -> "com.amazonaws.gamelift#NotReadyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "NotReadyException" ->
          `NotReadyException (Json_deserializers.not_ready_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_container_fleet_input) =
    let input = Json_serializers.update_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateContainerFleet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_container_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_container_fleet_input) =
    let input = Json_serializers.update_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateContainerFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_fleet_output_of_yojson
      ~error_deserializer
end

module UpdateContainerGroupDefinition = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_container_group_definition_input) =
    let input = Json_serializers.update_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateContainerGroupDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_group_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_container_group_definition_input) =
    let input = Json_serializers.update_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.UpdateContainerGroupDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_group_definition_output_of_yojson
      ~error_deserializer
end

module UpdateFleetAttributes = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_fleet_attributes_input) =
    let input = Json_serializers.update_fleet_attributes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateFleetAttributes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_attributes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fleet_attributes_input) =
    let input = Json_serializers.update_fleet_attributes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateFleetAttributes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_attributes_output_of_yojson
      ~error_deserializer
end

module UpdateFleetCapacity = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_fleet_capacity_input) =
    let input = Json_serializers.update_fleet_capacity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateFleetCapacity" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_fleet_capacity_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fleet_capacity_input) =
    let input = Json_serializers.update_fleet_capacity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateFleetCapacity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_capacity_output_of_yojson
      ~error_deserializer
end

module UpdateFleetPortSettings = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_fleet_port_settings_input) =
    let input = Json_serializers.update_fleet_port_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateFleetPortSettings" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_port_settings_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fleet_port_settings_input) =
    let input = Json_serializers.update_fleet_port_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateFleetPortSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_port_settings_output_of_yojson
      ~error_deserializer
end

module UpdateGameServer = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_game_server_input) =
    let input = Json_serializers.update_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateGameServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_game_server_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_game_server_input) =
    let input = Json_serializers.update_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateGameServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_game_server_output_of_yojson
      ~error_deserializer
end

module UpdateGameServerGroup = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_game_server_group_input) =
    let input = Json_serializers.update_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateGameServerGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_game_server_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_game_server_group_input) =
    let input = Json_serializers.update_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateGameServerGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_game_server_group_output_of_yojson
      ~error_deserializer
end

module UpdateGameSession = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidGameSessionStatusException _ ->
        "com.amazonaws.gamelift#InvalidGameSessionStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `NotReadyException _ -> "com.amazonaws.gamelift#NotReadyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidGameSessionStatusException" ->
          `InvalidGameSessionStatusException
            (Json_deserializers.invalid_game_session_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "NotReadyException" ->
          `NotReadyException (Json_deserializers.not_ready_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_game_session_input) =
    let input = Json_serializers.update_game_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateGameSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_game_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_game_session_input) =
    let input = Json_serializers.update_game_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateGameSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_game_session_output_of_yojson
      ~error_deserializer
end

module UpdateGameSessionQueue = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_game_session_queue_input) =
    let input = Json_serializers.update_game_session_queue_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateGameSessionQueue" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_game_session_queue_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_game_session_queue_input) =
    let input = Json_serializers.update_game_session_queue_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateGameSessionQueue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_game_session_queue_output_of_yojson
      ~error_deserializer
end

module UpdateMatchmakingConfiguration = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_matchmaking_configuration_input) =
    let input = Json_serializers.update_matchmaking_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateMatchmakingConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_matchmaking_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_matchmaking_configuration_input) =
    let input = Json_serializers.update_matchmaking_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.UpdateMatchmakingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_matchmaking_configuration_output_of_yojson
      ~error_deserializer
end

module UpdateRuntimeConfiguration = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_runtime_configuration_input) =
    let input = Json_serializers.update_runtime_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateRuntimeConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_runtime_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_runtime_configuration_input) =
    let input = Json_serializers.update_runtime_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.UpdateRuntimeConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_runtime_configuration_output_of_yojson
      ~error_deserializer
end

module UpdateScript = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_script_input) =
    let input = Json_serializers.update_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.UpdateScript" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_script_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_script_input) =
    let input = Json_serializers.update_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.UpdateScript" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_script_output_of_yojson
      ~error_deserializer
end

module ValidateMatchmakingRuleSet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : validate_matchmaking_rule_set_input) =
    let input = Json_serializers.validate_matchmaking_rule_set_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ValidateMatchmakingRuleSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.validate_matchmaking_rule_set_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : validate_matchmaking_rule_set_input) =
    let input = Json_serializers.validate_matchmaking_rule_set_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.ValidateMatchmakingRuleSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.validate_matchmaking_rule_set_output_of_yojson
      ~error_deserializer
end

module DescribeVpcPeeringConnections = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_vpc_peering_connections_input) =
    let input = Json_serializers.describe_vpc_peering_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeVpcPeeringConnections"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vpc_peering_connections_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_vpc_peering_connections_input) =
    let input = Json_serializers.describe_vpc_peering_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeVpcPeeringConnections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vpc_peering_connections_output_of_yojson
      ~error_deserializer
end

module DescribeVpcPeeringAuthorizations = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_vpc_peering_authorizations_input) =
    let input = Json_serializers.describe_vpc_peering_authorizations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeVpcPeeringAuthorizations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vpc_peering_authorizations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_vpc_peering_authorizations_input) =
    let input = Json_serializers.describe_vpc_peering_authorizations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeVpcPeeringAuthorizations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vpc_peering_authorizations_output_of_yojson
      ~error_deserializer
end

module DescribeScript = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_script_input) =
    let input = Json_serializers.describe_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeScript" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_script_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_script_input) =
    let input = Json_serializers.describe_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeScript" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_script_output_of_yojson
      ~error_deserializer
end

module DescribeScalingPolicies = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_scaling_policies_input) =
    let input = Json_serializers.describe_scaling_policies_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeScalingPolicies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_policies_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scaling_policies_input) =
    let input = Json_serializers.describe_scaling_policies_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeScalingPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_policies_output_of_yojson
      ~error_deserializer
end

module DescribeRuntimeConfiguration = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_runtime_configuration_input) =
    let input = Json_serializers.describe_runtime_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeRuntimeConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_runtime_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_runtime_configuration_input) =
    let input = Json_serializers.describe_runtime_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeRuntimeConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_runtime_configuration_output_of_yojson
      ~error_deserializer
end

module DescribePlayerSessions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_player_sessions_input) =
    let input = Json_serializers.describe_player_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribePlayerSessions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_player_sessions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_player_sessions_input) =
    let input = Json_serializers.describe_player_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribePlayerSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_player_sessions_output_of_yojson
      ~error_deserializer
end

module DescribeMatchmakingRuleSets = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_matchmaking_rule_sets_input) =
    let input = Json_serializers.describe_matchmaking_rule_sets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeMatchmakingRuleSets" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_matchmaking_rule_sets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_matchmaking_rule_sets_input) =
    let input = Json_serializers.describe_matchmaking_rule_sets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeMatchmakingRuleSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_matchmaking_rule_sets_output_of_yojson
      ~error_deserializer
end

module DescribeMatchmakingConfigurations = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_matchmaking_configurations_input) =
    let input = Json_serializers.describe_matchmaking_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeMatchmakingConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_matchmaking_configurations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_matchmaking_configurations_input) =
    let input = Json_serializers.describe_matchmaking_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeMatchmakingConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_matchmaking_configurations_output_of_yojson
      ~error_deserializer
end

module DescribeMatchmaking = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_matchmaking_input) =
    let input = Json_serializers.describe_matchmaking_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeMatchmaking" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_matchmaking_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_matchmaking_input) =
    let input = Json_serializers.describe_matchmaking_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeMatchmaking"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_matchmaking_output_of_yojson
      ~error_deserializer
end

module DescribeInstances = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instances_input) =
    let input = Json_serializers.describe_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeInstances" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_instances_input) =
    let input = Json_serializers.describe_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_instances_output_of_yojson
      ~error_deserializer
end

module DescribeGameSessions = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_sessions_input) =
    let input = Json_serializers.describe_game_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameSessions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_sessions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_sessions_input) =
    let input = Json_serializers.describe_game_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeGameSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_sessions_output_of_yojson
      ~error_deserializer
end

module DescribeGameSessionQueues = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_session_queues_input) =
    let input = Json_serializers.describe_game_session_queues_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameSessionQueues" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_session_queues_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_session_queues_input) =
    let input = Json_serializers.describe_game_session_queues_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeGameSessionQueues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_session_queues_output_of_yojson
      ~error_deserializer
end

module DescribeGameSessionPlacement = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_session_placement_input) =
    let input = Json_serializers.describe_game_session_placement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameSessionPlacement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_session_placement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_session_placement_input) =
    let input = Json_serializers.describe_game_session_placement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeGameSessionPlacement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_session_placement_output_of_yojson
      ~error_deserializer
end

module DescribeGameSessionDetails = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_session_details_input) =
    let input = Json_serializers.describe_game_session_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameSessionDetails" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_session_details_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_session_details_input) =
    let input = Json_serializers.describe_game_session_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeGameSessionDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_session_details_output_of_yojson
      ~error_deserializer
end

module DescribeGameServerInstances = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_server_instances_input) =
    let input = Json_serializers.describe_game_server_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameServerInstances" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_server_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_server_instances_input) =
    let input = Json_serializers.describe_game_server_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeGameServerInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_server_instances_output_of_yojson
      ~error_deserializer
end

module DescribeGameServerGroup = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_server_group_input) =
    let input = Json_serializers.describe_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameServerGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_server_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_server_group_input) =
    let input = Json_serializers.describe_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeGameServerGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_server_group_output_of_yojson
      ~error_deserializer
end

module DescribeGameServer = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_game_server_input) =
    let input = Json_serializers.describe_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeGameServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_game_server_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_game_server_input) =
    let input = Json_serializers.describe_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeGameServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_game_server_output_of_yojson
      ~error_deserializer
end

module DescribeFleetUtilization = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_utilization_input) =
    let input = Json_serializers.describe_fleet_utilization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetUtilization" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_utilization_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_utilization_input) =
    let input = Json_serializers.describe_fleet_utilization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeFleetUtilization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_utilization_output_of_yojson
      ~error_deserializer
end

module DescribeFleetPortSettings = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_port_settings_input) =
    let input = Json_serializers.describe_fleet_port_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetPortSettings" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_port_settings_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_port_settings_input) =
    let input = Json_serializers.describe_fleet_port_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeFleetPortSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_port_settings_output_of_yojson
      ~error_deserializer
end

module DescribeFleetLocationUtilization = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_location_utilization_input) =
    let input = Json_serializers.describe_fleet_location_utilization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetLocationUtilization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_location_utilization_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_location_utilization_input) =
    let input = Json_serializers.describe_fleet_location_utilization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeFleetLocationUtilization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_location_utilization_output_of_yojson
      ~error_deserializer
end

module DescribeFleetLocationCapacity = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_location_capacity_input) =
    let input = Json_serializers.describe_fleet_location_capacity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetLocationCapacity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_location_capacity_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_location_capacity_input) =
    let input = Json_serializers.describe_fleet_location_capacity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeFleetLocationCapacity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_location_capacity_output_of_yojson
      ~error_deserializer
end

module DescribeFleetLocationAttributes = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_location_attributes_input) =
    let input = Json_serializers.describe_fleet_location_attributes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetLocationAttributes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_location_attributes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_location_attributes_input) =
    let input = Json_serializers.describe_fleet_location_attributes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeFleetLocationAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_location_attributes_output_of_yojson
      ~error_deserializer
end

module DescribeFleetEvents = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_events_input) =
    let input = Json_serializers.describe_fleet_events_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_fleet_events_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_events_input) =
    let input = Json_serializers.describe_fleet_events_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeFleetEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_events_output_of_yojson
      ~error_deserializer
end

module DescribeFleetDeployment = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_deployment_input) =
    let input = Json_serializers.describe_fleet_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetDeployment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_deployment_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_deployment_input) =
    let input = Json_serializers.describe_fleet_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeFleetDeployment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_deployment_output_of_yojson
      ~error_deserializer
end

module DescribeFleetCapacity = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_capacity_input) =
    let input = Json_serializers.describe_fleet_capacity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetCapacity" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_capacity_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_capacity_input) =
    let input = Json_serializers.describe_fleet_capacity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeFleetCapacity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_capacity_output_of_yojson
      ~error_deserializer
end

module DescribeFleetAttributes = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_attributes_input) =
    let input = Json_serializers.describe_fleet_attributes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeFleetAttributes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_attributes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_attributes_input) =
    let input = Json_serializers.describe_fleet_attributes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeFleetAttributes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_attributes_output_of_yojson
      ~error_deserializer
end

module DescribeEC2InstanceLimits = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ec2_instance_limits_input) =
    let input = Json_serializers.describe_ec2_instance_limits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeEC2InstanceLimits" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_ec2_instance_limits_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ec2_instance_limits_input) =
    let input = Json_serializers.describe_ec2_instance_limits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeEC2InstanceLimits" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ec2_instance_limits_output_of_yojson
      ~error_deserializer
end

module DescribeContainerGroupPortMappings = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_container_group_port_mappings_input) =
    let input = Json_serializers.describe_container_group_port_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeContainerGroupPortMappings"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_container_group_port_mappings_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_container_group_port_mappings_input) =
    let input = Json_serializers.describe_container_group_port_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeContainerGroupPortMappings" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_container_group_port_mappings_output_of_yojson
      ~error_deserializer
end

module DescribeContainerGroupDefinition = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_container_group_definition_input) =
    let input = Json_serializers.describe_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeContainerGroupDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_group_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_container_group_definition_input) =
    let input = Json_serializers.describe_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DescribeContainerGroupDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_group_definition_output_of_yojson
      ~error_deserializer
end

module DescribeContainerFleet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_container_fleet_input) =
    let input = Json_serializers.describe_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeContainerFleet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_container_fleet_input) =
    let input = Json_serializers.describe_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeContainerFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_fleet_output_of_yojson
      ~error_deserializer
end

module DescribeCompute = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_compute_input) =
    let input = Json_serializers.describe_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeCompute" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_compute_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_compute_input) =
    let input = Json_serializers.describe_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeCompute"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_compute_output_of_yojson ~error_deserializer
end

module DescribeBuild = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_build_input) =
    let input = Json_serializers.describe_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeBuild" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_build_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_build_input) =
    let input = Json_serializers.describe_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeBuild" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_build_output_of_yojson
      ~error_deserializer
end

module DescribeAlias = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_alias_input) =
    let input = Json_serializers.describe_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DescribeAlias" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_alias_input) =
    let input = Json_serializers.describe_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DescribeAlias" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_alias_output_of_yojson
      ~error_deserializer
end

module DeregisterGameServer = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_game_server_input) =
    let input = Json_serializers.deregister_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeregisterGameServer" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_game_server_input) =
    let input = Json_serializers.deregister_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeregisterGameServer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeregisterCompute = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_compute_input) =
    let input = Json_serializers.deregister_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeregisterCompute" ~service ~context
      ~input ~output_deserializer:Json_deserializers.deregister_compute_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_compute_input) =
    let input = Json_serializers.deregister_compute_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeregisterCompute"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_compute_output_of_yojson
      ~error_deserializer
end

module DeleteVpcPeeringConnection = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpc_peering_connection_input) =
    let input = Json_serializers.delete_vpc_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteVpcPeeringConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_peering_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_vpc_peering_connection_input) =
    let input = Json_serializers.delete_vpc_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DeleteVpcPeeringConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_peering_connection_output_of_yojson
      ~error_deserializer
end

module DeleteVpcPeeringAuthorization = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpc_peering_authorization_input) =
    let input = Json_serializers.delete_vpc_peering_authorization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteVpcPeeringAuthorization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_peering_authorization_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_vpc_peering_authorization_input) =
    let input = Json_serializers.delete_vpc_peering_authorization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DeleteVpcPeeringAuthorization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_peering_authorization_output_of_yojson
      ~error_deserializer
end

module DeleteScript = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_script_input) =
    let input = Json_serializers.delete_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteScript" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_script_input) =
    let input = Json_serializers.delete_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteScript" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteScalingPolicy = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_scaling_policy_input) =
    let input = Json_serializers.delete_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteScalingPolicy" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scaling_policy_input) =
    let input = Json_serializers.delete_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMatchmakingRuleSet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_matchmaking_rule_set_input) =
    let input = Json_serializers.delete_matchmaking_rule_set_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteMatchmakingRuleSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_matchmaking_rule_set_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_matchmaking_rule_set_input) =
    let input = Json_serializers.delete_matchmaking_rule_set_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DeleteMatchmakingRuleSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_matchmaking_rule_set_output_of_yojson
      ~error_deserializer
end

module DeleteMatchmakingConfiguration = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_matchmaking_configuration_input) =
    let input = Json_serializers.delete_matchmaking_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteMatchmakingConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_matchmaking_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_matchmaking_configuration_input) =
    let input = Json_serializers.delete_matchmaking_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DeleteMatchmakingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_matchmaking_configuration_output_of_yojson
      ~error_deserializer
end

module DeleteLocation = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_location_input) =
    let input = Json_serializers.delete_location_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteLocation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_location_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_location_input) =
    let input = Json_serializers.delete_location_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteLocation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_location_output_of_yojson
      ~error_deserializer
end

module DeleteGameSessionQueue = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_game_session_queue_input) =
    let input = Json_serializers.delete_game_session_queue_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteGameSessionQueue" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_game_session_queue_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_game_session_queue_input) =
    let input = Json_serializers.delete_game_session_queue_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteGameSessionQueue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_game_session_queue_output_of_yojson
      ~error_deserializer
end

module DeleteGameServerGroup = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_game_server_group_input) =
    let input = Json_serializers.delete_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteGameServerGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_game_server_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_game_server_group_input) =
    let input = Json_serializers.delete_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteGameServerGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_game_server_group_output_of_yojson
      ~error_deserializer
end

module DeleteFleetLocations = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_fleet_locations_input) =
    let input = Json_serializers.delete_fleet_locations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteFleetLocations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_fleet_locations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fleet_locations_input) =
    let input = Json_serializers.delete_fleet_locations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteFleetLocations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_fleet_locations_output_of_yojson
      ~error_deserializer
end

module DeleteFleet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_fleet_input) =
    let input = Json_serializers.delete_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteFleet" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fleet_input) =
    let input = Json_serializers.delete_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteFleet" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteContainerGroupDefinition = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_group_definition_input) =
    let input = Json_serializers.delete_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteContainerGroupDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_group_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_container_group_definition_input) =
    let input = Json_serializers.delete_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.DeleteContainerGroupDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_group_definition_output_of_yojson
      ~error_deserializer
end

module DeleteContainerFleet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_fleet_input) =
    let input = Json_serializers.delete_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteContainerFleet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_container_fleet_input) =
    let input = Json_serializers.delete_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteContainerFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_fleet_output_of_yojson
      ~error_deserializer
end

module DeleteBuild = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_build_input) =
    let input = Json_serializers.delete_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteBuild" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_build_input) =
    let input = Json_serializers.delete_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteBuild" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAlias = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_alias_input) =
    let input = Json_serializers.delete_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.DeleteAlias" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_alias_input) =
    let input = Json_serializers.delete_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.DeleteAlias" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateVpcPeeringConnection = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vpc_peering_connection_input) =
    let input = Json_serializers.create_vpc_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateVpcPeeringConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_peering_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_vpc_peering_connection_input) =
    let input = Json_serializers.create_vpc_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.CreateVpcPeeringConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_peering_connection_output_of_yojson
      ~error_deserializer
end

module CreateVpcPeeringAuthorization = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vpc_peering_authorization_input) =
    let input = Json_serializers.create_vpc_peering_authorization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateVpcPeeringAuthorization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_peering_authorization_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_vpc_peering_authorization_input) =
    let input = Json_serializers.create_vpc_peering_authorization_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.CreateVpcPeeringAuthorization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_peering_authorization_output_of_yojson
      ~error_deserializer
end

module CreateScript = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_script_input) =
    let input = Json_serializers.create_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateScript" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_script_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_script_input) =
    let input = Json_serializers.create_script_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateScript" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_script_output_of_yojson
      ~error_deserializer
end

module CreatePlayerSessions = struct
  let error_to_string = function
    | `GameSessionFullException _ -> "com.amazonaws.gamelift#GameSessionFullException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidGameSessionStatusException _ ->
        "com.amazonaws.gamelift#InvalidGameSessionStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "GameSessionFullException" ->
          `GameSessionFullException
            (Json_deserializers.game_session_full_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidGameSessionStatusException" ->
          `InvalidGameSessionStatusException
            (Json_deserializers.invalid_game_session_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_player_sessions_input) =
    let input = Json_serializers.create_player_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreatePlayerSessions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_player_sessions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_player_sessions_input) =
    let input = Json_serializers.create_player_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreatePlayerSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_player_sessions_output_of_yojson
      ~error_deserializer
end

module CreatePlayerSession = struct
  let error_to_string = function
    | `GameSessionFullException _ -> "com.amazonaws.gamelift#GameSessionFullException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidGameSessionStatusException _ ->
        "com.amazonaws.gamelift#InvalidGameSessionStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "GameSessionFullException" ->
          `GameSessionFullException
            (Json_deserializers.game_session_full_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidGameSessionStatusException" ->
          `InvalidGameSessionStatusException
            (Json_deserializers.invalid_game_session_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_player_session_input) =
    let input = Json_serializers.create_player_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreatePlayerSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_player_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_player_session_input) =
    let input = Json_serializers.create_player_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreatePlayerSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_player_session_output_of_yojson
      ~error_deserializer
end

module CreateMatchmakingRuleSet = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_matchmaking_rule_set_input) =
    let input = Json_serializers.create_matchmaking_rule_set_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateMatchmakingRuleSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_matchmaking_rule_set_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_matchmaking_rule_set_input) =
    let input = Json_serializers.create_matchmaking_rule_set_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.CreateMatchmakingRuleSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_matchmaking_rule_set_output_of_yojson
      ~error_deserializer
end

module CreateMatchmakingConfiguration = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_matchmaking_configuration_input) =
    let input = Json_serializers.create_matchmaking_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateMatchmakingConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_matchmaking_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_matchmaking_configuration_input) =
    let input = Json_serializers.create_matchmaking_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.CreateMatchmakingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_matchmaking_configuration_output_of_yojson
      ~error_deserializer
end

module CreateLocation = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_input) =
    let input = Json_serializers.create_location_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateLocation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_location_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_input) =
    let input = Json_serializers.create_location_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateLocation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_location_output_of_yojson
      ~error_deserializer
end

module CreateGameSessionQueue = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_game_session_queue_input) =
    let input = Json_serializers.create_game_session_queue_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateGameSessionQueue" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_game_session_queue_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_game_session_queue_input) =
    let input = Json_serializers.create_game_session_queue_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateGameSessionQueue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_game_session_queue_output_of_yojson
      ~error_deserializer
end

module CreateGameSession = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `FleetCapacityExceededException _ -> "com.amazonaws.gamelift#FleetCapacityExceededException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.gamelift#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `TerminalRoutingStrategyException _ ->
        "com.amazonaws.gamelift#TerminalRoutingStrategyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "FleetCapacityExceededException" ->
          `FleetCapacityExceededException
            (Json_deserializers.fleet_capacity_exceeded_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TerminalRoutingStrategyException" ->
          `TerminalRoutingStrategyException
            (Json_deserializers.terminal_routing_strategy_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_game_session_input) =
    let input = Json_serializers.create_game_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateGameSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_game_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_game_session_input) =
    let input = Json_serializers.create_game_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateGameSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_game_session_output_of_yojson
      ~error_deserializer
end

module CreateGameServerGroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_game_server_group_input) =
    let input = Json_serializers.create_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateGameServerGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_game_server_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_game_server_group_input) =
    let input = Json_serializers.create_game_server_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateGameServerGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_game_server_group_output_of_yojson
      ~error_deserializer
end

module CreateFleetLocations = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidFleetStatusException _ -> "com.amazonaws.gamelift#InvalidFleetStatusException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `NotReadyException _ -> "com.amazonaws.gamelift#NotReadyException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidFleetStatusException" ->
          `InvalidFleetStatusException
            (Json_deserializers.invalid_fleet_status_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "NotReadyException" ->
          `NotReadyException (Json_deserializers.not_ready_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_fleet_locations_input) =
    let input = Json_serializers.create_fleet_locations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateFleetLocations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_locations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_fleet_locations_input) =
    let input = Json_serializers.create_fleet_locations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateFleetLocations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_locations_output_of_yojson
      ~error_deserializer
end

module CreateFleet = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `NotReadyException _ -> "com.amazonaws.gamelift#NotReadyException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "NotReadyException" ->
          `NotReadyException (Json_deserializers.not_ready_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_fleet_input) =
    let input = Json_serializers.create_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_fleet_input) =
    let input = Json_serializers.create_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_fleet_output_of_yojson
      ~error_deserializer
end

module CreateContainerGroupDefinition = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_group_definition_input) =
    let input = Json_serializers.create_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateContainerGroupDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_group_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_container_group_definition_input) =
    let input = Json_serializers.create_container_group_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GameLift.CreateContainerGroupDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_group_definition_output_of_yojson
      ~error_deserializer
end

module CreateContainerFleet = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_fleet_input) =
    let input = Json_serializers.create_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateContainerFleet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_container_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_container_fleet_input) =
    let input = Json_serializers.create_container_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateContainerFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_fleet_output_of_yojson
      ~error_deserializer
end

module CreateBuild = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_build_input) =
    let input = Json_serializers.create_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateBuild" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_build_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_build_input) =
    let input = Json_serializers.create_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateBuild" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_build_output_of_yojson
      ~error_deserializer
end

module CreateAlias = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.gamelift#LimitExceededException"
    | `TaggingFailedException _ -> "com.amazonaws.gamelift#TaggingFailedException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TaggingFailedException" ->
          `TaggingFailedException (Json_deserializers.tagging_failed_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_alias_input) =
    let input = Json_serializers.create_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.CreateAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_alias_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_alias_input) =
    let input = Json_serializers.create_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.CreateAlias" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_alias_output_of_yojson
      ~error_deserializer
end

module ClaimGameServer = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.gamelift#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `OutOfCapacityException _ -> "com.amazonaws.gamelift#OutOfCapacityException"
    | `UnauthorizedException _ -> "com.amazonaws.gamelift#UnauthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OutOfCapacityException" ->
          `OutOfCapacityException (Json_deserializers.out_of_capacity_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : claim_game_server_input) =
    let input = Json_serializers.claim_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.ClaimGameServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.claim_game_server_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : claim_game_server_input) =
    let input = Json_serializers.claim_game_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.ClaimGameServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.claim_game_server_output_of_yojson ~error_deserializer
end

module AcceptMatch = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.gamelift#InternalServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.gamelift#InvalidRequestException"
    | `NotFoundException _ -> "com.amazonaws.gamelift#NotFoundException"
    | `UnsupportedRegionException _ -> "com.amazonaws.gamelift#UnsupportedRegionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "UnsupportedRegionException" ->
          `UnsupportedRegionException
            (Json_deserializers.unsupported_region_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_match_input) =
    let input = Json_serializers.accept_match_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GameLift.AcceptMatch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_match_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : accept_match_input) =
    let input = Json_serializers.accept_match_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"GameLift.AcceptMatch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.accept_match_output_of_yojson
      ~error_deserializer
end
