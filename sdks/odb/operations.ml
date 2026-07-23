open Types
open Service_metadata

module UpdateOdbPeeringConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : update_odb_peering_connection_input) =
    let input = Json_serializers.update_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.UpdateOdbPeeringConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_odb_peering_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_odb_peering_connection_input) =
    let input = Json_serializers.update_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.UpdateOdbPeeringConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_odb_peering_connection_output_of_yojson
      ~error_deserializer
end

module UpdateOdbNetwork = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : update_odb_network_input) =
    let input = Json_serializers.update_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.UpdateOdbNetwork" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_odb_network_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_odb_network_input) =
    let input = Json_serializers.update_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.UpdateOdbNetwork" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_odb_network_output_of_yojson
      ~error_deserializer
end

module UpdateCloudExadataInfrastructure = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : update_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.update_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.UpdateCloudExadataInfrastructure" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.update_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.UpdateCloudExadataInfrastructure" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer
end

module UpdateAutonomousDatabaseBackup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : update_autonomous_database_backup_input) =
    let input = Json_serializers.update_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.UpdateAutonomousDatabaseBackup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_autonomous_database_backup_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_autonomous_database_backup_input) =
    let input = Json_serializers.update_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.UpdateAutonomousDatabaseBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_autonomous_database_backup_output_of_yojson
      ~error_deserializer
end

module UpdateAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : update_autonomous_database_input) =
    let input = Json_serializers.update_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.UpdateAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_autonomous_database_input) =
    let input = Json_serializers.update_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.UpdateAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_autonomous_database_output_of_yojson
      ~error_deserializer
end

module SwitchoverAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : switchover_autonomous_database_input) =
    let input = Json_serializers.switchover_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.SwitchoverAutonomousDatabase" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.switchover_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : switchover_autonomous_database_input) =
    let input = Json_serializers.switchover_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.SwitchoverAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.switchover_autonomous_database_output_of_yojson
      ~error_deserializer
end

module StopDbNode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : stop_db_node_input) =
    let input = Json_serializers.stop_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.StopDbNode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_db_node_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_db_node_input) =
    let input = Json_serializers.stop_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.StopDbNode" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_db_node_output_of_yojson
      ~error_deserializer
end

module StopAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : stop_autonomous_database_input) =
    let input = Json_serializers.stop_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.StopAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_autonomous_database_input) =
    let input = Json_serializers.stop_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.StopAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_autonomous_database_output_of_yojson
      ~error_deserializer
end

module StartDbNode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : start_db_node_input) =
    let input = Json_serializers.start_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.StartDbNode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_db_node_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : start_db_node_input) =
    let input = Json_serializers.start_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.StartDbNode" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_db_node_output_of_yojson
      ~error_deserializer
end

module StartAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : start_autonomous_database_input) =
    let input = Json_serializers.start_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.StartAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_autonomous_database_input) =
    let input = Json_serializers.start_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.StartAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_autonomous_database_output_of_yojson
      ~error_deserializer
end

module ShrinkAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : shrink_autonomous_database_input) =
    let input = Json_serializers.shrink_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ShrinkAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.shrink_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : shrink_autonomous_database_input) =
    let input = Json_serializers.shrink_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ShrinkAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.shrink_autonomous_database_output_of_yojson
      ~error_deserializer
end

module RestoreAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : restore_autonomous_database_input) =
    let input = Json_serializers.restore_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.RestoreAutonomousDatabase" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.restore_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_autonomous_database_input) =
    let input = Json_serializers.restore_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.RestoreAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_autonomous_database_output_of_yojson
      ~error_deserializer
end

module RebootDbNode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : reboot_db_node_input) =
    let input = Json_serializers.reboot_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.RebootDbNode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_db_node_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : reboot_db_node_input) =
    let input = Json_serializers.reboot_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.RebootDbNode" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reboot_db_node_output_of_yojson
      ~error_deserializer
end

module RebootAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : reboot_autonomous_database_input) =
    let input = Json_serializers.reboot_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.RebootAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.reboot_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reboot_autonomous_database_input) =
    let input = Json_serializers.reboot_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.RebootAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_autonomous_database_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListSystemVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_system_versions_input) =
    let input = Json_serializers.list_system_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListSystemVersions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_system_versions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_system_versions_input) =
    let input = Json_serializers.list_system_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListSystemVersions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_system_versions_output_of_yojson
      ~error_deserializer
end

module ListOdbPeeringConnections = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_odb_peering_connections_input) =
    let input = Json_serializers.list_odb_peering_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListOdbPeeringConnections" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_odb_peering_connections_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_odb_peering_connections_input) =
    let input = Json_serializers.list_odb_peering_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListOdbPeeringConnections"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_odb_peering_connections_output_of_yojson
      ~error_deserializer
end

module ListOdbNetworks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_odb_networks_input) =
    let input = Json_serializers.list_odb_networks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListOdbNetworks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_odb_networks_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_odb_networks_input) =
    let input = Json_serializers.list_odb_networks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListOdbNetworks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_odb_networks_output_of_yojson
      ~error_deserializer
end

module ListGiVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_gi_versions_input) =
    let input = Json_serializers.list_gi_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListGiVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_gi_versions_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_gi_versions_input) =
    let input = Json_serializers.list_gi_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListGiVersions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_gi_versions_output_of_yojson
      ~error_deserializer
end

module ListDbSystemShapes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_db_system_shapes_input) =
    let input = Json_serializers.list_db_system_shapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListDbSystemShapes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_db_system_shapes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_db_system_shapes_input) =
    let input = Json_serializers.list_db_system_shapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListDbSystemShapes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_db_system_shapes_output_of_yojson
      ~error_deserializer
end

module ListDbServers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_db_servers_input) =
    let input = Json_serializers.list_db_servers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListDbServers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_servers_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_db_servers_input) =
    let input = Json_serializers.list_db_servers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListDbServers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_db_servers_output_of_yojson
      ~error_deserializer
end

module ListDbNodes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_db_nodes_input) =
    let input = Json_serializers.list_db_nodes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListDbNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_db_nodes_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_db_nodes_input) =
    let input = Json_serializers.list_db_nodes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListDbNodes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_db_nodes_output_of_yojson
      ~error_deserializer
end

module ListCloudVmClusters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_cloud_vm_clusters_input) =
    let input = Json_serializers.list_cloud_vm_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListCloudVmClusters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_cloud_vm_clusters_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cloud_vm_clusters_input) =
    let input = Json_serializers.list_cloud_vm_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListCloudVmClusters" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_cloud_vm_clusters_output_of_yojson
      ~error_deserializer
end

module ListCloudExadataInfrastructures = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_cloud_exadata_infrastructures_input) =
    let input = Json_serializers.list_cloud_exadata_infrastructures_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListCloudExadataInfrastructures" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_cloud_exadata_infrastructures_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cloud_exadata_infrastructures_input) =
    let input = Json_serializers.list_cloud_exadata_infrastructures_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.ListCloudExadataInfrastructures" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cloud_exadata_infrastructures_output_of_yojson
      ~error_deserializer
end

module ListCloudAutonomousVmClusters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_cloud_autonomous_vm_clusters_input) =
    let input = Json_serializers.list_cloud_autonomous_vm_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListCloudAutonomousVmClusters" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_cloud_autonomous_vm_clusters_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cloud_autonomous_vm_clusters_input) =
    let input = Json_serializers.list_cloud_autonomous_vm_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.ListCloudAutonomousVmClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cloud_autonomous_vm_clusters_output_of_yojson
      ~error_deserializer
end

module ListAutonomousVirtualMachines = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_virtual_machines_input) =
    let input = Json_serializers.list_autonomous_virtual_machines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousVirtualMachines" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_virtual_machines_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_virtual_machines_input) =
    let input = Json_serializers.list_autonomous_virtual_machines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.ListAutonomousVirtualMachines" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_virtual_machines_output_of_yojson
      ~error_deserializer
end

module ListAutonomousDatabases = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_databases_input) =
    let input = Json_serializers.list_autonomous_databases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousDatabases" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_autonomous_databases_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_databases_input) =
    let input = Json_serializers.list_autonomous_databases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListAutonomousDatabases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_databases_output_of_yojson
      ~error_deserializer
end

module ListAutonomousDatabaseVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_database_versions_input) =
    let input = Json_serializers.list_autonomous_database_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousDatabaseVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_versions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_database_versions_input) =
    let input = Json_serializers.list_autonomous_database_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.ListAutonomousDatabaseVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_versions_output_of_yojson
      ~error_deserializer
end

module ListAutonomousDatabasePeers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_database_peers_input) =
    let input = Json_serializers.list_autonomous_database_peers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousDatabasePeers" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_peers_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_database_peers_input) =
    let input = Json_serializers.list_autonomous_database_peers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListAutonomousDatabasePeers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_peers_output_of_yojson
      ~error_deserializer
end

module ListAutonomousDatabaseClones = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_database_clones_input) =
    let input = Json_serializers.list_autonomous_database_clones_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousDatabaseClones" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_clones_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_database_clones_input) =
    let input = Json_serializers.list_autonomous_database_clones_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.ListAutonomousDatabaseClones"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_clones_output_of_yojson
      ~error_deserializer
end

module ListAutonomousDatabaseCharacterSets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_database_character_sets_input) =
    let input = Json_serializers.list_autonomous_database_character_sets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousDatabaseCharacterSets"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_autonomous_database_character_sets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_database_character_sets_input) =
    let input = Json_serializers.list_autonomous_database_character_sets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.ListAutonomousDatabaseCharacterSets" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_autonomous_database_character_sets_output_of_yojson
      ~error_deserializer
end

module ListAutonomousDatabaseBackups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : list_autonomous_database_backups_input) =
    let input = Json_serializers.list_autonomous_database_backups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.ListAutonomousDatabaseBackups" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_backups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_autonomous_database_backups_input) =
    let input = Json_serializers.list_autonomous_database_backups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.ListAutonomousDatabaseBackups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_autonomous_database_backups_output_of_yojson
      ~error_deserializer
end

module InitializeService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : initialize_service_input) =
    let input = Json_serializers.initialize_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.InitializeService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.initialize_service_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : initialize_service_input) =
    let input = Json_serializers.initialize_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.InitializeService" ~service
      ~context ~input ~output_deserializer:Json_deserializers.initialize_service_output_of_yojson
      ~error_deserializer
end

module GetOdbPeeringConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_odb_peering_connection_input) =
    let input = Json_serializers.get_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetOdbPeeringConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_odb_peering_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_odb_peering_connection_input) =
    let input = Json_serializers.get_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetOdbPeeringConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_odb_peering_connection_output_of_yojson
      ~error_deserializer
end

module GetOdbNetwork = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_odb_network_input) =
    let input = Json_serializers.get_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetOdbNetwork" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_odb_network_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_odb_network_input) =
    let input = Json_serializers.get_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetOdbNetwork" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_odb_network_output_of_yojson
      ~error_deserializer
end

module GetOciOnboardingStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_oci_onboarding_status_input) =
    let input = Json_serializers.get_oci_onboarding_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetOciOnboardingStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_oci_onboarding_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_oci_onboarding_status_input) =
    let input = Json_serializers.get_oci_onboarding_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetOciOnboardingStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_oci_onboarding_status_output_of_yojson
      ~error_deserializer
end

module GetDbServer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_db_server_input) =
    let input = Json_serializers.get_db_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetDbServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_server_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_db_server_input) =
    let input = Json_serializers.get_db_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetDbServer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_db_server_output_of_yojson
      ~error_deserializer
end

module GetDbNode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_db_node_input) =
    let input = Json_serializers.get_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetDbNode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_db_node_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_db_node_input) =
    let input = Json_serializers.get_db_node_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetDbNode" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_db_node_output_of_yojson
      ~error_deserializer
end

module GetCloudVmCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_cloud_vm_cluster_input) =
    let input = Json_serializers.get_cloud_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetCloudVmCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cloud_vm_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cloud_vm_cluster_input) =
    let input = Json_serializers.get_cloud_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetCloudVmCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_cloud_vm_cluster_output_of_yojson
      ~error_deserializer
end

module GetCloudExadataInfrastructureUnallocatedResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_cloud_exadata_infrastructure_unallocated_resources_input) =
    let input =
      Json_serializers.get_cloud_exadata_infrastructure_unallocated_resources_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Odb.GetCloudExadataInfrastructureUnallocatedResources" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_cloud_exadata_infrastructure_unallocated_resources_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : get_cloud_exadata_infrastructure_unallocated_resources_input) =
    let input =
      Json_serializers.get_cloud_exadata_infrastructure_unallocated_resources_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.GetCloudExadataInfrastructureUnallocatedResources" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_cloud_exadata_infrastructure_unallocated_resources_output_of_yojson
      ~error_deserializer
end

module GetCloudExadataInfrastructure = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.get_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetCloudExadataInfrastructure" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.get_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.GetCloudExadataInfrastructure" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer
end

module GetCloudAutonomousVmCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_cloud_autonomous_vm_cluster_input) =
    let input = Json_serializers.get_cloud_autonomous_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetCloudAutonomousVmCluster" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_cloud_autonomous_vm_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cloud_autonomous_vm_cluster_input) =
    let input = Json_serializers.get_cloud_autonomous_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetCloudAutonomousVmCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cloud_autonomous_vm_cluster_output_of_yojson
      ~error_deserializer
end

module GetAutonomousDatabaseWalletDetails = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_autonomous_database_wallet_details_input) =
    let input = Json_serializers.get_autonomous_database_wallet_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetAutonomousDatabaseWalletDetails"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_autonomous_database_wallet_details_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_autonomous_database_wallet_details_input) =
    let input = Json_serializers.get_autonomous_database_wallet_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.GetAutonomousDatabaseWalletDetails" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_autonomous_database_wallet_details_output_of_yojson
      ~error_deserializer
end

module GetAutonomousDatabaseBackup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_autonomous_database_backup_input) =
    let input = Json_serializers.get_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetAutonomousDatabaseBackup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_autonomous_database_backup_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_autonomous_database_backup_input) =
    let input = Json_serializers.get_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetAutonomousDatabaseBackup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_autonomous_database_backup_output_of_yojson
      ~error_deserializer
end

module GetAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : get_autonomous_database_input) =
    let input = Json_serializers.get_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.GetAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_autonomous_database_input) =
    let input = Json_serializers.get_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.GetAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_autonomous_database_output_of_yojson
      ~error_deserializer
end

module FailoverAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : failover_autonomous_database_input) =
    let input = Json_serializers.failover_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.FailoverAutonomousDatabase" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.failover_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : failover_autonomous_database_input) =
    let input = Json_serializers.failover_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.FailoverAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.failover_autonomous_database_output_of_yojson
      ~error_deserializer
end

module DisassociateIamRoleFromResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : disassociate_iam_role_from_resource_input) =
    let input = Json_serializers.disassociate_iam_role_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DisassociateIamRoleFromResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_iam_role_from_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_iam_role_from_resource_input) =
    let input = Json_serializers.disassociate_iam_role_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.DisassociateIamRoleFromResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_iam_role_from_resource_output_of_yojson
      ~error_deserializer
end

module DeleteOdbPeeringConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : delete_odb_peering_connection_input) =
    let input = Json_serializers.delete_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteOdbPeeringConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_odb_peering_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_odb_peering_connection_input) =
    let input = Json_serializers.delete_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.DeleteOdbPeeringConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_odb_peering_connection_output_of_yojson
      ~error_deserializer
end

module DeleteOdbNetwork = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : delete_odb_network_input) =
    let input = Json_serializers.delete_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteOdbNetwork" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_odb_network_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_odb_network_input) =
    let input = Json_serializers.delete_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.DeleteOdbNetwork" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_odb_network_output_of_yojson
      ~error_deserializer
end

module DeleteCloudVmCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cloud_vm_cluster_input) =
    let input = Json_serializers.delete_cloud_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteCloudVmCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_cloud_vm_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cloud_vm_cluster_input) =
    let input = Json_serializers.delete_cloud_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.DeleteCloudVmCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cloud_vm_cluster_output_of_yojson
      ~error_deserializer
end

module DeleteCloudExadataInfrastructure = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : delete_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.delete_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteCloudExadataInfrastructure" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.delete_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.DeleteCloudExadataInfrastructure" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer
end

module DeleteCloudAutonomousVmCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cloud_autonomous_vm_cluster_input) =
    let input = Json_serializers.delete_cloud_autonomous_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteCloudAutonomousVmCluster" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_cloud_autonomous_vm_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cloud_autonomous_vm_cluster_input) =
    let input = Json_serializers.delete_cloud_autonomous_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.DeleteCloudAutonomousVmCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cloud_autonomous_vm_cluster_output_of_yojson
      ~error_deserializer
end

module DeleteAutonomousDatabaseBackup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : delete_autonomous_database_backup_input) =
    let input = Json_serializers.delete_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteAutonomousDatabaseBackup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_autonomous_database_backup_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_autonomous_database_backup_input) =
    let input = Json_serializers.delete_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.DeleteAutonomousDatabaseBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_autonomous_database_backup_output_of_yojson
      ~error_deserializer
end

module DeleteAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : delete_autonomous_database_input) =
    let input = Json_serializers.delete_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.DeleteAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_autonomous_database_input) =
    let input = Json_serializers.delete_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.DeleteAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_autonomous_database_output_of_yojson
      ~error_deserializer
end

module CreateOdbPeeringConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_odb_peering_connection_input) =
    let input = Json_serializers.create_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateOdbPeeringConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_odb_peering_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_odb_peering_connection_input) =
    let input = Json_serializers.create_odb_peering_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.CreateOdbPeeringConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_odb_peering_connection_output_of_yojson
      ~error_deserializer
end

module CreateOdbNetwork = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_odb_network_input) =
    let input = Json_serializers.create_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateOdbNetwork" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_odb_network_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_odb_network_input) =
    let input = Json_serializers.create_odb_network_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.CreateOdbNetwork" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_odb_network_output_of_yojson
      ~error_deserializer
end

module CreateCloudVmCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_cloud_vm_cluster_input) =
    let input = Json_serializers.create_cloud_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateCloudVmCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_cloud_vm_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cloud_vm_cluster_input) =
    let input = Json_serializers.create_cloud_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.CreateCloudVmCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cloud_vm_cluster_output_of_yojson
      ~error_deserializer
end

module CreateCloudExadataInfrastructure = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.create_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateCloudExadataInfrastructure" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cloud_exadata_infrastructure_input) =
    let input = Json_serializers.create_cloud_exadata_infrastructure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.CreateCloudExadataInfrastructure" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cloud_exadata_infrastructure_output_of_yojson
      ~error_deserializer
end

module CreateCloudAutonomousVmCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_cloud_autonomous_vm_cluster_input) =
    let input = Json_serializers.create_cloud_autonomous_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateCloudAutonomousVmCluster" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_cloud_autonomous_vm_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cloud_autonomous_vm_cluster_input) =
    let input = Json_serializers.create_cloud_autonomous_vm_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.CreateCloudAutonomousVmCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cloud_autonomous_vm_cluster_output_of_yojson
      ~error_deserializer
end

module CreateAutonomousDatabaseWallet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_autonomous_database_wallet_input) =
    let input = Json_serializers.create_autonomous_database_wallet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateAutonomousDatabaseWallet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_autonomous_database_wallet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_autonomous_database_wallet_input) =
    let input = Json_serializers.create_autonomous_database_wallet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.CreateAutonomousDatabaseWallet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_autonomous_database_wallet_output_of_yojson
      ~error_deserializer
end

module CreateAutonomousDatabaseBackup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_autonomous_database_backup_input) =
    let input = Json_serializers.create_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateAutonomousDatabaseBackup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_autonomous_database_backup_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_autonomous_database_backup_input) =
    let input = Json_serializers.create_autonomous_database_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.CreateAutonomousDatabaseBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_autonomous_database_backup_output_of_yojson
      ~error_deserializer
end

module CreateAutonomousDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.odb#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : create_autonomous_database_input) =
    let input = Json_serializers.create_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.CreateAutonomousDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_autonomous_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_autonomous_database_input) =
    let input = Json_serializers.create_autonomous_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.CreateAutonomousDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_autonomous_database_output_of_yojson
      ~error_deserializer
end

module AssociateIamRoleToResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.odb#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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

  let request context (request : associate_iam_role_to_resource_input) =
    let input = Json_serializers.associate_iam_role_to_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.AssociateIamRoleToResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_iam_role_to_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_iam_role_to_resource_input) =
    let input = Json_serializers.associate_iam_role_to_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Odb.AssociateIamRoleToResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_iam_role_to_resource_output_of_yojson
      ~error_deserializer
end

module AcceptMarketplaceRegistration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.odb#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.odb#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.odb#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.odb#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.odb#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_marketplace_registration_input) =
    let input = Json_serializers.accept_marketplace_registration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Odb.AcceptMarketplaceRegistration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.accept_marketplace_registration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_marketplace_registration_input) =
    let input = Json_serializers.accept_marketplace_registration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Odb.AcceptMarketplaceRegistration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_marketplace_registration_output_of_yojson
      ~error_deserializer
end
