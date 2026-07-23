open Types
open Service_metadata

module UpdateVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : update_vehicle_request) =
    let input = Json_serializers.update_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateVehicle" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_vehicle_request) =
    let input = Json_serializers.update_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_vehicle_response_of_yojson ~error_deserializer
end

module UpdateStateTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : update_state_template_request) =
    let input = Json_serializers.update_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateStateTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_state_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_state_template_request) =
    let input = Json_serializers.update_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateStateTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_state_template_response_of_yojson
      ~error_deserializer
end

module UpdateSignalCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `InvalidNodeException _ -> "com.amazonaws.iotfleetwise#InvalidNodeException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "InvalidNodeException" ->
          `InvalidNodeException (Json_deserializers.invalid_node_exception_of_yojson tree path)
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : update_signal_catalog_request) =
    let input = Json_serializers.update_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateSignalCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_signal_catalog_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_signal_catalog_request) =
    let input = Json_serializers.update_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateSignalCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_signal_catalog_response_of_yojson
      ~error_deserializer
end

module UpdateModelManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
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

  let request context (request : update_model_manifest_request) =
    let input = Json_serializers.update_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateModelManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_manifest_request) =
    let input = Json_serializers.update_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateModelManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_manifest_response_of_yojson
      ~error_deserializer
end

module UpdateFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : update_fleet_request) =
    let input = Json_serializers.update_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fleet_request) =
    let input = Json_serializers.update_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_response_of_yojson ~error_deserializer
end

module UpdateDecoderManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `DecoderManifestValidationException _ ->
        "com.amazonaws.iotfleetwise#DecoderManifestValidationException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DecoderManifestValidationException" ->
          `DecoderManifestValidationException
            (Json_deserializers.decoder_manifest_validation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : update_decoder_manifest_request) =
    let input = Json_serializers.update_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateDecoderManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_decoder_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_decoder_manifest_request) =
    let input = Json_serializers.update_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateDecoderManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_decoder_manifest_response_of_yojson
      ~error_deserializer
end

module UpdateCampaign = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_campaign_request) =
    let input = Json_serializers.update_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UpdateCampaign"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_campaign_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_campaign_request) =
    let input = Json_serializers.update_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UpdateCampaign" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_campaign_response_of_yojson ~error_deserializer
end

module ListVehiclesInFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_vehicles_in_fleet_request) =
    let input = Json_serializers.list_vehicles_in_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListVehiclesInFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vehicles_in_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_vehicles_in_fleet_request) =
    let input = Json_serializers.list_vehicles_in_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListVehiclesInFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vehicles_in_fleet_response_of_yojson
      ~error_deserializer
end

module ListVehicles = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_vehicles_request) =
    let input = Json_serializers.list_vehicles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListVehicles" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_vehicles_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_vehicles_request) =
    let input = Json_serializers.list_vehicles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListVehicles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vehicles_response_of_yojson ~error_deserializer
end

module ListStateTemplates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_state_templates_request) =
    let input = Json_serializers.list_state_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListStateTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_state_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_state_templates_request) =
    let input = Json_serializers.list_state_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListStateTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_state_templates_response_of_yojson
      ~error_deserializer
end

module ListSignalCatalogs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_signal_catalogs_request) =
    let input = Json_serializers.list_signal_catalogs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListSignalCatalogs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_signal_catalogs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_signal_catalogs_request) =
    let input = Json_serializers.list_signal_catalogs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListSignalCatalogs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_signal_catalogs_response_of_yojson
      ~error_deserializer
end

module ListSignalCatalogNodes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : list_signal_catalog_nodes_request) =
    let input = Json_serializers.list_signal_catalog_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListSignalCatalogNodes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_signal_catalog_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_signal_catalog_nodes_request) =
    let input = Json_serializers.list_signal_catalog_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListSignalCatalogNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_signal_catalog_nodes_response_of_yojson
      ~error_deserializer
end

module ListModelManifests = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_model_manifests_request) =
    let input = Json_serializers.list_model_manifests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListModelManifests"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_manifests_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_manifests_request) =
    let input = Json_serializers.list_model_manifests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListModelManifests" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_manifests_response_of_yojson
      ~error_deserializer
end

module ListModelManifestNodes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : list_model_manifest_nodes_request) =
    let input = Json_serializers.list_model_manifest_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListModelManifestNodes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_manifest_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_manifest_nodes_request) =
    let input = Json_serializers.list_model_manifest_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListModelManifestNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_manifest_nodes_response_of_yojson
      ~error_deserializer
end

module ListFleetsForVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_fleets_for_vehicle_request) =
    let input = Json_serializers.list_fleets_for_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListFleetsForVehicle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fleets_for_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fleets_for_vehicle_request) =
    let input = Json_serializers.list_fleets_for_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListFleetsForVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fleets_for_vehicle_response_of_yojson
      ~error_deserializer
end

module ListFleets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_fleets_request) =
    let input = Json_serializers.list_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListFleets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_fleets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fleets_request) =
    let input = Json_serializers.list_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListFleets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fleets_response_of_yojson ~error_deserializer
end

module ListDecoderManifests = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_decoder_manifests_request) =
    let input = Json_serializers.list_decoder_manifests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListDecoderManifests"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_decoder_manifests_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_decoder_manifests_request) =
    let input = Json_serializers.list_decoder_manifests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListDecoderManifests" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_decoder_manifests_response_of_yojson
      ~error_deserializer
end

module ListDecoderManifestSignals = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_decoder_manifest_signals_request) =
    let input = Json_serializers.list_decoder_manifest_signals_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IoTAutobahnControlPlane.ListDecoderManifestSignals" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_decoder_manifest_signals_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_decoder_manifest_signals_request) =
    let input = Json_serializers.list_decoder_manifest_signals_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListDecoderManifestSignals" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_decoder_manifest_signals_response_of_yojson
      ~error_deserializer
end

module ListDecoderManifestNetworkInterfaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_decoder_manifest_network_interfaces_request) =
    let input =
      Json_serializers.list_decoder_manifest_network_interfaces_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IoTAutobahnControlPlane.ListDecoderManifestNetworkInterfaces" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_decoder_manifest_network_interfaces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_decoder_manifest_network_interfaces_request) =
    let input =
      Json_serializers.list_decoder_manifest_network_interfaces_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListDecoderManifestNetworkInterfaces" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_decoder_manifest_network_interfaces_response_of_yojson
      ~error_deserializer
end

module ListCampaigns = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_campaigns_request) =
    let input = Json_serializers.list_campaigns_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListCampaigns" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_campaigns_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_campaigns_request) =
    let input = Json_serializers.list_campaigns_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListCampaigns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_campaigns_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutEncryptionConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : put_encryption_configuration_request) =
    let input = Json_serializers.put_encryption_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IoTAutobahnControlPlane.PutEncryptionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_encryption_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_encryption_configuration_request) =
    let input = Json_serializers.put_encryption_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.PutEncryptionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_encryption_configuration_response_of_yojson
      ~error_deserializer
end

module PutLoggingOptions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_logging_options_request) =
    let input = Json_serializers.put_logging_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.PutLoggingOptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_logging_options_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_logging_options_request) =
    let input = Json_serializers.put_logging_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.PutLoggingOptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_logging_options_response_of_yojson
      ~error_deserializer
end

module RegisterAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : register_account_request) =
    let input = Json_serializers.register_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.RegisterAccount"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_account_request) =
    let input = Json_serializers.register_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.RegisterAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_account_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module ImportSignalCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : import_signal_catalog_request) =
    let input = Json_serializers.import_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ImportSignalCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_signal_catalog_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_signal_catalog_request) =
    let input = Json_serializers.import_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ImportSignalCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_signal_catalog_response_of_yojson
      ~error_deserializer
end

module ImportDecoderManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `DecoderManifestValidationException _ ->
        "com.amazonaws.iotfleetwise#DecoderManifestValidationException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DecoderManifestValidationException" ->
          `DecoderManifestValidationException
            (Json_deserializers.decoder_manifest_validation_exception_of_yojson tree path)
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
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

  let request context (request : import_decoder_manifest_request) =
    let input = Json_serializers.import_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.ImportDecoderManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_decoder_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_decoder_manifest_request) =
    let input = Json_serializers.import_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.ImportDecoderManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_decoder_manifest_response_of_yojson
      ~error_deserializer
end

module GetVehicleStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_vehicle_status_request) =
    let input = Json_serializers.get_vehicle_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetVehicleStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_vehicle_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_vehicle_status_request) =
    let input = Json_serializers.get_vehicle_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetVehicleStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_vehicle_status_response_of_yojson
      ~error_deserializer
end

module GetVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : get_vehicle_request) =
    let input = Json_serializers.get_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetVehicle" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_vehicle_request) =
    let input = Json_serializers.get_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_vehicle_response_of_yojson ~error_deserializer
end

module GetStateTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : get_state_template_request) =
    let input = Json_serializers.get_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetStateTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_state_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_state_template_request) =
    let input = Json_serializers.get_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetStateTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_state_template_response_of_yojson
      ~error_deserializer
end

module GetSignalCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_signal_catalog_request) =
    let input = Json_serializers.get_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetSignalCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_signal_catalog_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_signal_catalog_request) =
    let input = Json_serializers.get_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetSignalCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_signal_catalog_response_of_yojson
      ~error_deserializer
end

module GetRegisterAccountStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : get_register_account_status_request) =
    let input = Json_serializers.get_register_account_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IoTAutobahnControlPlane.GetRegisterAccountStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_register_account_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_register_account_status_request) =
    let input = Json_serializers.get_register_account_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetRegisterAccountStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_register_account_status_response_of_yojson
      ~error_deserializer
end

module GetModelManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_model_manifest_request) =
    let input = Json_serializers.get_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetModelManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_model_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_model_manifest_request) =
    let input = Json_serializers.get_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetModelManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_model_manifest_response_of_yojson
      ~error_deserializer
end

module GetLoggingOptions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_logging_options_request) =
    let input = Json_serializers.get_logging_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetLoggingOptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_logging_options_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_logging_options_request) =
    let input = Json_serializers.get_logging_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetLoggingOptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_logging_options_response_of_yojson
      ~error_deserializer
end

module GetFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : get_fleet_request) =
    let input = Json_serializers.get_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_fleet_request) =
    let input = Json_serializers.get_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"IoTAutobahnControlPlane.GetFleet"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_fleet_response_of_yojson
      ~error_deserializer
end

module GetEncryptionConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : get_encryption_configuration_request) =
    let input = Json_serializers.get_encryption_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IoTAutobahnControlPlane.GetEncryptionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_encryption_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_encryption_configuration_request) =
    let input = Json_serializers.get_encryption_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetEncryptionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_encryption_configuration_response_of_yojson
      ~error_deserializer
end

module GetDecoderManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_decoder_manifest_request) =
    let input = Json_serializers.get_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetDecoderManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_decoder_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_decoder_manifest_request) =
    let input = Json_serializers.get_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetDecoderManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_decoder_manifest_response_of_yojson
      ~error_deserializer
end

module GetCampaign = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_campaign_request) =
    let input = Json_serializers.get_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.GetCampaign" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_campaign_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_campaign_request) =
    let input = Json_serializers.get_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.GetCampaign" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_campaign_response_of_yojson ~error_deserializer
end

module DisassociateVehicleFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : disassociate_vehicle_fleet_request) =
    let input = Json_serializers.disassociate_vehicle_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"IoTAutobahnControlPlane.DisassociateVehicleFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_vehicle_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_vehicle_fleet_request) =
    let input = Json_serializers.disassociate_vehicle_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DisassociateVehicleFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_vehicle_fleet_response_of_yojson
      ~error_deserializer
end

module DeleteVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : delete_vehicle_request) =
    let input = Json_serializers.delete_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteVehicle" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_vehicle_request) =
    let input = Json_serializers.delete_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vehicle_response_of_yojson ~error_deserializer
end

module DeleteStateTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : delete_state_template_request) =
    let input = Json_serializers.delete_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteStateTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_state_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_state_template_request) =
    let input = Json_serializers.delete_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteStateTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_state_template_response_of_yojson
      ~error_deserializer
end

module DeleteSignalCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : delete_signal_catalog_request) =
    let input = Json_serializers.delete_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteSignalCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_signal_catalog_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_signal_catalog_request) =
    let input = Json_serializers.delete_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteSignalCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_signal_catalog_response_of_yojson
      ~error_deserializer
end

module DeleteModelManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : delete_model_manifest_request) =
    let input = Json_serializers.delete_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteModelManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_model_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_manifest_request) =
    let input = Json_serializers.delete_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteModelManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_model_manifest_response_of_yojson
      ~error_deserializer
end

module DeleteFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : delete_fleet_request) =
    let input = Json_serializers.delete_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fleet_request) =
    let input = Json_serializers.delete_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_fleet_response_of_yojson ~error_deserializer
end

module DeleteDecoderManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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

  let request context (request : delete_decoder_manifest_request) =
    let input = Json_serializers.delete_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteDecoderManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_decoder_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_decoder_manifest_request) =
    let input = Json_serializers.delete_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteDecoderManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_decoder_manifest_response_of_yojson
      ~error_deserializer
end

module DeleteCampaign = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : delete_campaign_request) =
    let input = Json_serializers.delete_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.DeleteCampaign"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_campaign_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_campaign_request) =
    let input = Json_serializers.delete_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.DeleteCampaign" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_campaign_response_of_yojson ~error_deserializer
end

module CreateVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_vehicle_request) =
    let input = Json_serializers.create_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateVehicle" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_vehicle_request) =
    let input = Json_serializers.create_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vehicle_response_of_yojson ~error_deserializer
end

module CreateStateTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_state_template_request) =
    let input = Json_serializers.create_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateStateTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_state_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_state_template_request) =
    let input = Json_serializers.create_state_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateStateTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_state_template_response_of_yojson
      ~error_deserializer
end

module CreateSignalCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InvalidNodeException _ -> "com.amazonaws.iotfleetwise#InvalidNodeException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidNodeException" ->
          `InvalidNodeException (Json_deserializers.invalid_node_exception_of_yojson tree path)
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_signal_catalog_request) =
    let input = Json_serializers.create_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateSignalCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_signal_catalog_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_signal_catalog_request) =
    let input = Json_serializers.create_signal_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateSignalCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_signal_catalog_response_of_yojson
      ~error_deserializer
end

module CreateModelManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InvalidSignalsException _ -> "com.amazonaws.iotfleetwise#InvalidSignalsException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidSignalsException" ->
          `InvalidSignalsException
            (Json_deserializers.invalid_signals_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_model_manifest_request) =
    let input = Json_serializers.create_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateModelManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_manifest_request) =
    let input = Json_serializers.create_model_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateModelManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_manifest_response_of_yojson
      ~error_deserializer
end

module CreateFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
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
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_fleet_request) =
    let input = Json_serializers.create_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_fleet_request) =
    let input = Json_serializers.create_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_response_of_yojson ~error_deserializer
end

module CreateDecoderManifest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `DecoderManifestValidationException _ ->
        "com.amazonaws.iotfleetwise#DecoderManifestValidationException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DecoderManifestValidationException" ->
          `DecoderManifestValidationException
            (Json_deserializers.decoder_manifest_validation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_decoder_manifest_request) =
    let input = Json_serializers.create_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateDecoderManifest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_decoder_manifest_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_decoder_manifest_request) =
    let input = Json_serializers.create_decoder_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateDecoderManifest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_decoder_manifest_response_of_yojson
      ~error_deserializer
end

module CreateCampaign = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.iotfleetwise#ConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_campaign_request) =
    let input = Json_serializers.create_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.CreateCampaign"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_campaign_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_campaign_request) =
    let input = Json_serializers.create_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.CreateCampaign" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_campaign_response_of_yojson ~error_deserializer
end

module BatchUpdateVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_vehicle_request) =
    let input = Json_serializers.batch_update_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.BatchUpdateVehicle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_update_vehicle_request) =
    let input = Json_serializers.batch_update_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.BatchUpdateVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_vehicle_response_of_yojson
      ~error_deserializer
end

module BatchCreateVehicle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_create_vehicle_request) =
    let input = Json_serializers.batch_create_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.BatchCreateVehicle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_vehicle_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_create_vehicle_request) =
    let input = Json_serializers.batch_create_vehicle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.BatchCreateVehicle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_vehicle_response_of_yojson
      ~error_deserializer
end

module AssociateVehicleFleet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.iotfleetwise#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.iotfleetwise#InternalServerException"
    | `LimitExceededException _ -> "com.amazonaws.iotfleetwise#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.iotfleetwise#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.iotfleetwise#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.iotfleetwise#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : associate_vehicle_fleet_request) =
    let input = Json_serializers.associate_vehicle_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"IoTAutobahnControlPlane.AssociateVehicleFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_vehicle_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_vehicle_fleet_request) =
    let input = Json_serializers.associate_vehicle_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"IoTAutobahnControlPlane.AssociateVehicleFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_vehicle_fleet_response_of_yojson
      ~error_deserializer
end
