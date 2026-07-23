open Types
open Service_metadata

module PutContainerPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_container_policy_input) =
    let input = Json_serializers.put_container_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.PutContainerPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_container_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_container_policy_input) =
    let input = Json_serializers.put_container_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.PutContainerPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_container_policy_output_of_yojson
      ~error_deserializer
end

module PutCorsPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_cors_policy_input) =
    let input = Json_serializers.put_cors_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.PutCorsPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_cors_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_cors_policy_input) =
    let input = Json_serializers.put_cors_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.PutCorsPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_cors_policy_output_of_yojson ~error_deserializer
end

module PutLifecyclePolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_lifecycle_policy_input) =
    let input = Json_serializers.put_lifecycle_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.PutLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_lifecycle_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_lifecycle_policy_input) =
    let input = Json_serializers.put_lifecycle_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.PutLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_lifecycle_policy_output_of_yojson
      ~error_deserializer
end

module PutMetricPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_metric_policy_input) =
    let input = Json_serializers.put_metric_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.PutMetricPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_metric_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_metric_policy_input) =
    let input = Json_serializers.put_metric_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.PutMetricPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_metric_policy_output_of_yojson ~error_deserializer
end

module StartAccessLogging = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_access_logging_input) =
    let input = Json_serializers.start_access_logging_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.StartAccessLogging"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_access_logging_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_access_logging_input) =
    let input = Json_serializers.start_access_logging_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.StartAccessLogging" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_access_logging_output_of_yojson
      ~error_deserializer
end

module StopAccessLogging = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_access_logging_input) =
    let input = Json_serializers.stop_access_logging_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.StopAccessLogging" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_access_logging_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_access_logging_input) =
    let input = Json_serializers.stop_access_logging_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.StopAccessLogging" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_access_logging_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MediaStore_20170901.TagResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListContainers = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_containers_input) =
    let input = Json_serializers.list_containers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.ListContainers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_containers_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_containers_input) =
    let input = Json_serializers.list_containers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.ListContainers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_containers_output_of_yojson ~error_deserializer
end

module GetMetricPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `PolicyNotFoundException _ -> "com.amazonaws.mediastore#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_metric_policy_input) =
    let input = Json_serializers.get_metric_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.GetMetricPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_metric_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_metric_policy_input) =
    let input = Json_serializers.get_metric_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.GetMetricPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_metric_policy_output_of_yojson ~error_deserializer
end

module GetLifecyclePolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `PolicyNotFoundException _ -> "com.amazonaws.mediastore#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_lifecycle_policy_input) =
    let input = Json_serializers.get_lifecycle_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.GetLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lifecycle_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lifecycle_policy_input) =
    let input = Json_serializers.get_lifecycle_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.GetLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lifecycle_policy_output_of_yojson
      ~error_deserializer
end

module GetCorsPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `CorsPolicyNotFoundException _ -> "com.amazonaws.mediastore#CorsPolicyNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "CorsPolicyNotFoundException" ->
          `CorsPolicyNotFoundException
            (Json_deserializers.cors_policy_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cors_policy_input) =
    let input = Json_serializers.get_cors_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.GetCorsPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_cors_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cors_policy_input) =
    let input = Json_serializers.get_cors_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.GetCorsPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cors_policy_output_of_yojson ~error_deserializer
end

module GetContainerPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `PolicyNotFoundException _ -> "com.amazonaws.mediastore#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_policy_input) =
    let input = Json_serializers.get_container_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.GetContainerPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_container_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_container_policy_input) =
    let input = Json_serializers.get_container_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.GetContainerPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_container_policy_output_of_yojson
      ~error_deserializer
end

module DescribeContainer = struct
  let error_to_string = function
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_container_input) =
    let input = Json_serializers.describe_container_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.DescribeContainer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_container_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_container_input) =
    let input = Json_serializers.describe_container_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.DescribeContainer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_output_of_yojson
      ~error_deserializer
end

module DeleteMetricPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `PolicyNotFoundException _ -> "com.amazonaws.mediastore#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_metric_policy_input) =
    let input = Json_serializers.delete_metric_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.DeleteMetricPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_metric_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_metric_policy_input) =
    let input = Json_serializers.delete_metric_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.DeleteMetricPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_metric_policy_output_of_yojson
      ~error_deserializer
end

module DeleteLifecyclePolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `PolicyNotFoundException _ -> "com.amazonaws.mediastore#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_lifecycle_policy_input) =
    let input = Json_serializers.delete_lifecycle_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.DeleteLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_lifecycle_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_lifecycle_policy_input) =
    let input = Json_serializers.delete_lifecycle_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.DeleteLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_lifecycle_policy_output_of_yojson
      ~error_deserializer
end

module DeleteCorsPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `CorsPolicyNotFoundException _ -> "com.amazonaws.mediastore#CorsPolicyNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "CorsPolicyNotFoundException" ->
          `CorsPolicyNotFoundException
            (Json_deserializers.cors_policy_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cors_policy_input) =
    let input = Json_serializers.delete_cors_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.DeleteCorsPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_cors_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cors_policy_input) =
    let input = Json_serializers.delete_cors_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.DeleteCorsPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cors_policy_output_of_yojson
      ~error_deserializer
end

module DeleteContainerPolicy = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `PolicyNotFoundException _ -> "com.amazonaws.mediastore#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_policy_input) =
    let input = Json_serializers.delete_container_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.DeleteContainerPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_container_policy_input) =
    let input = Json_serializers.delete_container_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.DeleteContainerPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_policy_output_of_yojson
      ~error_deserializer
end

module DeleteContainer = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `ContainerNotFoundException _ -> "com.amazonaws.mediastore#ContainerNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "ContainerNotFoundException" ->
          `ContainerNotFoundException
            (Json_deserializers.container_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_input) =
    let input = Json_serializers.delete_container_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.DeleteContainer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_container_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_container_input) =
    let input = Json_serializers.delete_container_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.DeleteContainer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_output_of_yojson ~error_deserializer
end

module CreateContainer = struct
  let error_to_string = function
    | `ContainerInUseException _ -> "com.amazonaws.mediastore#ContainerInUseException"
    | `InternalServerError _ -> "com.amazonaws.mediastore#InternalServerError"
    | `LimitExceededException _ -> "com.amazonaws.mediastore#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ContainerInUseException" ->
          `ContainerInUseException
            (Json_deserializers.container_in_use_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_input) =
    let input = Json_serializers.create_container_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MediaStore_20170901.CreateContainer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_container_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_container_input) =
    let input = Json_serializers.create_container_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MediaStore_20170901.CreateContainer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_output_of_yojson ~error_deserializer
end
