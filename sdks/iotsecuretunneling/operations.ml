open Types
open Service_metadata

module CloseTunnel = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.iotsecuretunneling#ResourceNotFoundException"
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

  let request context (request : close_tunnel_request) =
    let input = Json_serializers.close_tunnel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.CloseTunnel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.close_tunnel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : close_tunnel_request) =
    let input = Json_serializers.close_tunnel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"IoTSecuredTunneling.CloseTunnel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.close_tunnel_response_of_yojson ~error_deserializer
end

module DescribeTunnel = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.iotsecuretunneling#ResourceNotFoundException"
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

  let request context (request : describe_tunnel_request) =
    let input = Json_serializers.describe_tunnel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.DescribeTunnel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_tunnel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tunnel_request) =
    let input = Json_serializers.describe_tunnel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTSecuredTunneling.DescribeTunnel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tunnel_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.iotsecuretunneling#ResourceNotFoundException"
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTSecuredTunneling.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTunnels = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tunnels_request) =
    let input = Json_serializers.list_tunnels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.ListTunnels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tunnels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tunnels_request) =
    let input = Json_serializers.list_tunnels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"IoTSecuredTunneling.ListTunnels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tunnels_response_of_yojson ~error_deserializer
end

module OpenTunnel = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iotsecuretunneling#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : open_tunnel_request) =
    let input = Json_serializers.open_tunnel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.OpenTunnel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.open_tunnel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : open_tunnel_request) =
    let input = Json_serializers.open_tunnel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"IoTSecuredTunneling.OpenTunnel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.open_tunnel_response_of_yojson ~error_deserializer
end

module RotateTunnelAccessToken = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.iotsecuretunneling#ResourceNotFoundException"
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

  let request context (request : rotate_tunnel_access_token_request) =
    let input = Json_serializers.rotate_tunnel_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.RotateTunnelAccessToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.rotate_tunnel_access_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : rotate_tunnel_access_token_request) =
    let input = Json_serializers.rotate_tunnel_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTSecuredTunneling.RotateTunnelAccessToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.rotate_tunnel_access_token_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.iotsecuretunneling#ResourceNotFoundException"
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"IoTSecuredTunneling.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.iotsecuretunneling#ResourceNotFoundException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTSecuredTunneling.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTSecuredTunneling.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
