open Types
open Service_metadata

module UpdateDbInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : update_db_instance_input) =
    let input = Json_serializers.update_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.UpdateDbInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_db_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_db_instance_input) =
    let input = Json_serializers.update_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.UpdateDbInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_db_instance_output_of_yojson
      ~error_deserializer
end

module UpdateDbCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : update_db_cluster_input) =
    let input = Json_serializers.update_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.UpdateDbCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_db_cluster_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_db_cluster_input) =
    let input = Json_serializers.update_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.UpdateDbCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_db_cluster_output_of_yojson ~error_deserializer
end

module RebootDbInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : reboot_db_instance_input) =
    let input = Json_serializers.reboot_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.RebootDbInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_db_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reboot_db_instance_input) =
    let input = Json_serializers.reboot_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.RebootDbInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_db_instance_output_of_yojson
      ~error_deserializer
end

module RebootDbCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : reboot_db_cluster_input) =
    let input = Json_serializers.reboot_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.RebootDbCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_db_cluster_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : reboot_db_cluster_input) =
    let input = Json_serializers.reboot_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.RebootDbCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_db_cluster_output_of_yojson ~error_deserializer
end

module ListDbParameterGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : list_db_parameter_groups_input) =
    let input = Json_serializers.list_db_parameter_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.ListDbParameterGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_parameter_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_db_parameter_groups_input) =
    let input = Json_serializers.list_db_parameter_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.ListDbParameterGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_parameter_groups_output_of_yojson
      ~error_deserializer
end

module ListDbInstancesForCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : list_db_instances_for_cluster_input) =
    let input = Json_serializers.list_db_instances_for_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonTimestreamInfluxDB.ListDbInstancesForCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_instances_for_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_db_instances_for_cluster_input) =
    let input = Json_serializers.list_db_instances_for_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.ListDbInstancesForCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_instances_for_cluster_output_of_yojson
      ~error_deserializer
end

module ListDbInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : list_db_instances_input) =
    let input = Json_serializers.list_db_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.ListDbInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_instances_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_db_instances_input) =
    let input = Json_serializers.list_db_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.ListDbInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_instances_output_of_yojson ~error_deserializer
end

module ListDbClusters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : list_db_clusters_input) =
    let input = Json_serializers.list_db_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.ListDbClusters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_clusters_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_db_clusters_input) =
    let input = Json_serializers.list_db_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.ListDbClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_clusters_output_of_yojson ~error_deserializer
end

module GetDbParameterGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : get_db_parameter_group_input) =
    let input = Json_serializers.get_db_parameter_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.GetDbParameterGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_parameter_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_db_parameter_group_input) =
    let input = Json_serializers.get_db_parameter_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.GetDbParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_parameter_group_output_of_yojson
      ~error_deserializer
end

module GetDbInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : get_db_instance_input) =
    let input = Json_serializers.get_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.GetDbInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_instance_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_db_instance_input) =
    let input = Json_serializers.get_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.GetDbInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_instance_output_of_yojson ~error_deserializer
end

module GetDbCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : get_db_cluster_input) =
    let input = Json_serializers.get_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.GetDbCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_db_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_db_cluster_input) =
    let input = Json_serializers.get_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.GetDbCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_cluster_output_of_yojson ~error_deserializer
end

module DeleteDbInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : delete_db_instance_input) =
    let input = Json_serializers.delete_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.DeleteDbInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_db_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_db_instance_input) =
    let input = Json_serializers.delete_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.DeleteDbInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_db_instance_output_of_yojson
      ~error_deserializer
end

module DeleteDbCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : delete_db_cluster_input) =
    let input = Json_serializers.delete_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.DeleteDbCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_db_cluster_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_input) =
    let input = Json_serializers.delete_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.DeleteDbCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_db_cluster_output_of_yojson ~error_deserializer
end

module CreateDbParameterGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreaminfluxdb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : create_db_parameter_group_input) =
    let input = Json_serializers.create_db_parameter_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonTimestreamInfluxDB.CreateDbParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_db_parameter_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_db_parameter_group_input) =
    let input = Json_serializers.create_db_parameter_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.CreateDbParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_db_parameter_group_output_of_yojson
      ~error_deserializer
end

module CreateDbInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreaminfluxdb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : create_db_instance_input) =
    let input = Json_serializers.create_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.CreateDbInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_db_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_db_instance_input) =
    let input = Json_serializers.create_db_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.CreateDbInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_db_instance_output_of_yojson
      ~error_deserializer
end

module CreateDbCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreaminfluxdb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreaminfluxdb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreaminfluxdb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreaminfluxdb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreaminfluxdb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreaminfluxdb#ValidationException"
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

  let request context (request : create_db_cluster_input) =
    let input = Json_serializers.create_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.CreateDbCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_db_cluster_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_db_cluster_input) =
    let input = Json_serializers.create_db_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.CreateDbCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_db_cluster_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreaminfluxdb#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.TagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.TagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreaminfluxdb#ResourceNotFoundException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonTimestreamInfluxDB.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonTimestreamInfluxDB.UntagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
