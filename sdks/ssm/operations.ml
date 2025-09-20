open Types
open Service_metadata

module AddTagsToResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `InvalidResourceType _ -> "com.amazonaws.ssm#InvalidResourceType"
    | `TooManyTagsError _ -> "com.amazonaws.ssm#TooManyTagsError"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "InvalidResourceType" ->
          `InvalidResourceType (Json_deserializers.invalid_resource_type_of_yojson tree path)
      | _, "TooManyTagsError" ->
          `TooManyTagsError (Json_deserializers.too_many_tags_error_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_resource_request) =
    let input = Json_serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.AddTagsToResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_tags_to_resource_result_of_yojson
      ~error_deserializer
end

module AssociateOpsItemRelatedItem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemConflictException _ -> "com.amazonaws.ssm#OpsItemConflictException"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | `OpsItemLimitExceededException _ -> "com.amazonaws.ssm#OpsItemLimitExceededException"
    | `OpsItemNotFoundException _ -> "com.amazonaws.ssm#OpsItemNotFoundException"
    | `OpsItemRelatedItemAlreadyExistsException _ ->
        "com.amazonaws.ssm#OpsItemRelatedItemAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemConflictException" ->
          `OpsItemConflictException
            (Json_deserializers.ops_item_conflict_exception_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _, "OpsItemLimitExceededException" ->
          `OpsItemLimitExceededException
            (Json_deserializers.ops_item_limit_exceeded_exception_of_yojson tree path)
      | _, "OpsItemNotFoundException" ->
          `OpsItemNotFoundException
            (Json_deserializers.ops_item_not_found_exception_of_yojson tree path)
      | _, "OpsItemRelatedItemAlreadyExistsException" ->
          `OpsItemRelatedItemAlreadyExistsException
            (Json_deserializers.ops_item_related_item_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_ops_item_related_item_request) =
    let input = Json_serializers.associate_ops_item_related_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.AssociateOpsItemRelatedItem" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_ops_item_related_item_response_of_yojson
      ~error_deserializer
end

module CancelCommand = struct
  let error_to_string = function
    | `DuplicateInstanceId _ -> "com.amazonaws.ssm#DuplicateInstanceId"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidCommandId _ -> "com.amazonaws.ssm#InvalidCommandId"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateInstanceId" ->
          `DuplicateInstanceId (Json_deserializers.duplicate_instance_id_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidCommandId" ->
          `InvalidCommandId (Json_deserializers.invalid_command_id_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_command_request) =
    let input = Json_serializers.cancel_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CancelCommand" ~service ~context
      ~input ~output_deserializer:Json_deserializers.cancel_command_result_of_yojson
      ~error_deserializer
end

module CancelMaintenanceWindowExecution = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_maintenance_window_execution_request) =
    let input = Json_serializers.cancel_maintenance_window_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CancelMaintenanceWindowExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_maintenance_window_execution_result_of_yojson
      ~error_deserializer
end

module CreateActivation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidParameters _ -> "com.amazonaws.ssm#InvalidParameters"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameters" ->
          `InvalidParameters (Json_deserializers.invalid_parameters_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_activation_request) =
    let input = Json_serializers.create_activation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateActivation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_activation_result_of_yojson
      ~error_deserializer
end

module CreateAssociation = struct
  let error_to_string = function
    | `AssociationAlreadyExists _ -> "com.amazonaws.ssm#AssociationAlreadyExists"
    | `AssociationLimitExceeded _ -> "com.amazonaws.ssm#AssociationLimitExceeded"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidOutputLocation _ -> "com.amazonaws.ssm#InvalidOutputLocation"
    | `InvalidParameters _ -> "com.amazonaws.ssm#InvalidParameters"
    | `InvalidSchedule _ -> "com.amazonaws.ssm#InvalidSchedule"
    | `InvalidTag _ -> "com.amazonaws.ssm#InvalidTag"
    | `InvalidTarget _ -> "com.amazonaws.ssm#InvalidTarget"
    | `InvalidTargetMaps _ -> "com.amazonaws.ssm#InvalidTargetMaps"
    | `UnsupportedPlatformType _ -> "com.amazonaws.ssm#UnsupportedPlatformType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationAlreadyExists" ->
          `AssociationAlreadyExists
            (Json_deserializers.association_already_exists_of_yojson tree path)
      | _, "AssociationLimitExceeded" ->
          `AssociationLimitExceeded
            (Json_deserializers.association_limit_exceeded_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidOutputLocation" ->
          `InvalidOutputLocation (Json_deserializers.invalid_output_location_of_yojson tree path)
      | _, "InvalidParameters" ->
          `InvalidParameters (Json_deserializers.invalid_parameters_of_yojson tree path)
      | _, "InvalidSchedule" ->
          `InvalidSchedule (Json_deserializers.invalid_schedule_of_yojson tree path)
      | _, "InvalidTag" -> `InvalidTag (Json_deserializers.invalid_tag_of_yojson tree path)
      | _, "InvalidTarget" -> `InvalidTarget (Json_deserializers.invalid_target_of_yojson tree path)
      | _, "InvalidTargetMaps" ->
          `InvalidTargetMaps (Json_deserializers.invalid_target_maps_of_yojson tree path)
      | _, "UnsupportedPlatformType" ->
          `UnsupportedPlatformType
            (Json_deserializers.unsupported_platform_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_association_request) =
    let input = Json_serializers.create_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateAssociation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_association_result_of_yojson
      ~error_deserializer
end

module CreateAssociationBatch = struct
  let error_to_string = function
    | `AssociationLimitExceeded _ -> "com.amazonaws.ssm#AssociationLimitExceeded"
    | `DuplicateInstanceId _ -> "com.amazonaws.ssm#DuplicateInstanceId"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidOutputLocation _ -> "com.amazonaws.ssm#InvalidOutputLocation"
    | `InvalidParameters _ -> "com.amazonaws.ssm#InvalidParameters"
    | `InvalidSchedule _ -> "com.amazonaws.ssm#InvalidSchedule"
    | `InvalidTarget _ -> "com.amazonaws.ssm#InvalidTarget"
    | `InvalidTargetMaps _ -> "com.amazonaws.ssm#InvalidTargetMaps"
    | `UnsupportedPlatformType _ -> "com.amazonaws.ssm#UnsupportedPlatformType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationLimitExceeded" ->
          `AssociationLimitExceeded
            (Json_deserializers.association_limit_exceeded_of_yojson tree path)
      | _, "DuplicateInstanceId" ->
          `DuplicateInstanceId (Json_deserializers.duplicate_instance_id_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidOutputLocation" ->
          `InvalidOutputLocation (Json_deserializers.invalid_output_location_of_yojson tree path)
      | _, "InvalidParameters" ->
          `InvalidParameters (Json_deserializers.invalid_parameters_of_yojson tree path)
      | _, "InvalidSchedule" ->
          `InvalidSchedule (Json_deserializers.invalid_schedule_of_yojson tree path)
      | _, "InvalidTarget" -> `InvalidTarget (Json_deserializers.invalid_target_of_yojson tree path)
      | _, "InvalidTargetMaps" ->
          `InvalidTargetMaps (Json_deserializers.invalid_target_maps_of_yojson tree path)
      | _, "UnsupportedPlatformType" ->
          `UnsupportedPlatformType
            (Json_deserializers.unsupported_platform_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_association_batch_request) =
    let input = Json_serializers.create_association_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateAssociationBatch" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_association_batch_result_of_yojson
      ~error_deserializer
end

module CreateDocument = struct
  let error_to_string = function
    | `DocumentAlreadyExists _ -> "com.amazonaws.ssm#DocumentAlreadyExists"
    | `DocumentLimitExceeded _ -> "com.amazonaws.ssm#DocumentLimitExceeded"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocumentContent _ -> "com.amazonaws.ssm#InvalidDocumentContent"
    | `InvalidDocumentSchemaVersion _ -> "com.amazonaws.ssm#InvalidDocumentSchemaVersion"
    | `MaxDocumentSizeExceeded _ -> "com.amazonaws.ssm#MaxDocumentSizeExceeded"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DocumentAlreadyExists" ->
          `DocumentAlreadyExists (Json_deserializers.document_already_exists_of_yojson tree path)
      | _, "DocumentLimitExceeded" ->
          `DocumentLimitExceeded (Json_deserializers.document_limit_exceeded_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocumentContent" ->
          `InvalidDocumentContent (Json_deserializers.invalid_document_content_of_yojson tree path)
      | _, "InvalidDocumentSchemaVersion" ->
          `InvalidDocumentSchemaVersion
            (Json_deserializers.invalid_document_schema_version_of_yojson tree path)
      | _, "MaxDocumentSizeExceeded" ->
          `MaxDocumentSizeExceeded
            (Json_deserializers.max_document_size_exceeded_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_document_request) =
    let input = Json_serializers.create_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateDocument" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_document_result_of_yojson
      ~error_deserializer
end

module CreateMaintenanceWindow = struct
  let error_to_string = function
    | `IdempotentParameterMismatch _ -> "com.amazonaws.ssm#IdempotentParameterMismatch"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceLimitExceededException _ -> "com.amazonaws.ssm#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_maintenance_window_request) =
    let input = Json_serializers.create_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateMaintenanceWindow" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_maintenance_window_result_of_yojson
      ~error_deserializer
end

module CreateOpsItem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemAccessDeniedException _ -> "com.amazonaws.ssm#OpsItemAccessDeniedException"
    | `OpsItemAlreadyExistsException _ -> "com.amazonaws.ssm#OpsItemAlreadyExistsException"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | `OpsItemLimitExceededException _ -> "com.amazonaws.ssm#OpsItemLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemAccessDeniedException" ->
          `OpsItemAccessDeniedException
            (Json_deserializers.ops_item_access_denied_exception_of_yojson tree path)
      | _, "OpsItemAlreadyExistsException" ->
          `OpsItemAlreadyExistsException
            (Json_deserializers.ops_item_already_exists_exception_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _, "OpsItemLimitExceededException" ->
          `OpsItemLimitExceededException
            (Json_deserializers.ops_item_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ops_item_request) =
    let input = Json_serializers.create_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateOpsItem" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_ops_item_response_of_yojson
      ~error_deserializer
end

module CreateOpsMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsMetadataAlreadyExistsException _ -> "com.amazonaws.ssm#OpsMetadataAlreadyExistsException"
    | `OpsMetadataInvalidArgumentException _ ->
        "com.amazonaws.ssm#OpsMetadataInvalidArgumentException"
    | `OpsMetadataLimitExceededException _ -> "com.amazonaws.ssm#OpsMetadataLimitExceededException"
    | `OpsMetadataTooManyUpdatesException _ ->
        "com.amazonaws.ssm#OpsMetadataTooManyUpdatesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsMetadataAlreadyExistsException" ->
          `OpsMetadataAlreadyExistsException
            (Json_deserializers.ops_metadata_already_exists_exception_of_yojson tree path)
      | _, "OpsMetadataInvalidArgumentException" ->
          `OpsMetadataInvalidArgumentException
            (Json_deserializers.ops_metadata_invalid_argument_exception_of_yojson tree path)
      | _, "OpsMetadataLimitExceededException" ->
          `OpsMetadataLimitExceededException
            (Json_deserializers.ops_metadata_limit_exceeded_exception_of_yojson tree path)
      | _, "OpsMetadataTooManyUpdatesException" ->
          `OpsMetadataTooManyUpdatesException
            (Json_deserializers.ops_metadata_too_many_updates_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ops_metadata_request) =
    let input = Json_serializers.create_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateOpsMetadata" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_ops_metadata_result_of_yojson
      ~error_deserializer
end

module CreatePatchBaseline = struct
  let error_to_string = function
    | `IdempotentParameterMismatch _ -> "com.amazonaws.ssm#IdempotentParameterMismatch"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceLimitExceededException _ -> "com.amazonaws.ssm#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_patch_baseline_request) =
    let input = Json_serializers.create_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreatePatchBaseline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_patch_baseline_result_of_yojson
      ~error_deserializer
end

module CreateResourceDataSync = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceDataSyncAlreadyExistsException _ ->
        "com.amazonaws.ssm#ResourceDataSyncAlreadyExistsException"
    | `ResourceDataSyncCountExceededException _ ->
        "com.amazonaws.ssm#ResourceDataSyncCountExceededException"
    | `ResourceDataSyncInvalidConfigurationException _ ->
        "com.amazonaws.ssm#ResourceDataSyncInvalidConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceDataSyncAlreadyExistsException" ->
          `ResourceDataSyncAlreadyExistsException
            (Json_deserializers.resource_data_sync_already_exists_exception_of_yojson tree path)
      | _, "ResourceDataSyncCountExceededException" ->
          `ResourceDataSyncCountExceededException
            (Json_deserializers.resource_data_sync_count_exceeded_exception_of_yojson tree path)
      | _, "ResourceDataSyncInvalidConfigurationException" ->
          `ResourceDataSyncInvalidConfigurationException
            (Json_deserializers.resource_data_sync_invalid_configuration_exception_of_yojson tree
               path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resource_data_sync_request) =
    let input = Json_serializers.create_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.CreateResourceDataSync" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module DeleteActivation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidActivation _ -> "com.amazonaws.ssm#InvalidActivation"
    | `InvalidActivationId _ -> "com.amazonaws.ssm#InvalidActivationId"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidActivation" ->
          `InvalidActivation (Json_deserializers.invalid_activation_of_yojson tree path)
      | _, "InvalidActivationId" ->
          `InvalidActivationId (Json_deserializers.invalid_activation_id_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_activation_request) =
    let input = Json_serializers.delete_activation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteActivation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_activation_result_of_yojson
      ~error_deserializer
end

module DeleteAssociation = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_association_request) =
    let input = Json_serializers.delete_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteAssociation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_association_result_of_yojson
      ~error_deserializer
end

module DeleteDocument = struct
  let error_to_string = function
    | `AssociatedInstances _ -> "com.amazonaws.ssm#AssociatedInstances"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentOperation _ -> "com.amazonaws.ssm#InvalidDocumentOperation"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociatedInstances" ->
          `AssociatedInstances (Json_deserializers.associated_instances_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentOperation" ->
          `InvalidDocumentOperation
            (Json_deserializers.invalid_document_operation_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_document_request) =
    let input = Json_serializers.delete_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteDocument" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_document_result_of_yojson
      ~error_deserializer
end

module DeleteInventory = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDeleteInventoryParametersException _ ->
        "com.amazonaws.ssm#InvalidDeleteInventoryParametersException"
    | `InvalidInventoryRequestException _ -> "com.amazonaws.ssm#InvalidInventoryRequestException"
    | `InvalidOptionException _ -> "com.amazonaws.ssm#InvalidOptionException"
    | `InvalidTypeNameException _ -> "com.amazonaws.ssm#InvalidTypeNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDeleteInventoryParametersException" ->
          `InvalidDeleteInventoryParametersException
            (Json_deserializers.invalid_delete_inventory_parameters_exception_of_yojson tree path)
      | _, "InvalidInventoryRequestException" ->
          `InvalidInventoryRequestException
            (Json_deserializers.invalid_inventory_request_exception_of_yojson tree path)
      | _, "InvalidOptionException" ->
          `InvalidOptionException (Json_deserializers.invalid_option_exception_of_yojson tree path)
      | _, "InvalidTypeNameException" ->
          `InvalidTypeNameException
            (Json_deserializers.invalid_type_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_inventory_request) =
    let input = Json_serializers.delete_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteInventory" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_inventory_result_of_yojson
      ~error_deserializer
end

module DeleteMaintenanceWindow = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_maintenance_window_request) =
    let input = Json_serializers.delete_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteMaintenanceWindow" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_maintenance_window_result_of_yojson
      ~error_deserializer
end

module DeleteOpsItem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ops_item_request) =
    let input = Json_serializers.delete_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteOpsItem" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_ops_item_response_of_yojson
      ~error_deserializer
end

module DeleteOpsMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsMetadataInvalidArgumentException _ ->
        "com.amazonaws.ssm#OpsMetadataInvalidArgumentException"
    | `OpsMetadataNotFoundException _ -> "com.amazonaws.ssm#OpsMetadataNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsMetadataInvalidArgumentException" ->
          `OpsMetadataInvalidArgumentException
            (Json_deserializers.ops_metadata_invalid_argument_exception_of_yojson tree path)
      | _, "OpsMetadataNotFoundException" ->
          `OpsMetadataNotFoundException
            (Json_deserializers.ops_metadata_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ops_metadata_request) =
    let input = Json_serializers.delete_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteOpsMetadata" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_ops_metadata_result_of_yojson
      ~error_deserializer
end

module DeleteParameter = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ParameterNotFound _ -> "com.amazonaws.ssm#ParameterNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ParameterNotFound" ->
          `ParameterNotFound (Json_deserializers.parameter_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_parameter_request) =
    let input = Json_serializers.delete_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteParameter" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_parameter_result_of_yojson
      ~error_deserializer
end

module DeleteParameters = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_parameters_request) =
    let input = Json_serializers.delete_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteParameters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_parameters_result_of_yojson
      ~error_deserializer
end

module DeletePatchBaseline = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceInUseException _ -> "com.amazonaws.ssm#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_patch_baseline_request) =
    let input = Json_serializers.delete_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeletePatchBaseline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_patch_baseline_result_of_yojson
      ~error_deserializer
end

module DeleteResourceDataSync = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceDataSyncInvalidConfigurationException _ ->
        "com.amazonaws.ssm#ResourceDataSyncInvalidConfigurationException"
    | `ResourceDataSyncNotFoundException _ -> "com.amazonaws.ssm#ResourceDataSyncNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceDataSyncInvalidConfigurationException" ->
          `ResourceDataSyncInvalidConfigurationException
            (Json_deserializers.resource_data_sync_invalid_configuration_exception_of_yojson tree
               path)
      | _, "ResourceDataSyncNotFoundException" ->
          `ResourceDataSyncNotFoundException
            (Json_deserializers.resource_data_sync_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_data_sync_request) =
    let input = Json_serializers.delete_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteResourceDataSync" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `MalformedResourcePolicyDocumentException _ ->
        "com.amazonaws.ssm#MalformedResourcePolicyDocumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssm#ResourceNotFoundException"
    | `ResourcePolicyConflictException _ -> "com.amazonaws.ssm#ResourcePolicyConflictException"
    | `ResourcePolicyInvalidParameterException _ ->
        "com.amazonaws.ssm#ResourcePolicyInvalidParameterException"
    | `ResourcePolicyNotFoundException _ -> "com.amazonaws.ssm#ResourcePolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "MalformedResourcePolicyDocumentException" ->
          `MalformedResourcePolicyDocumentException
            (Json_deserializers.malformed_resource_policy_document_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourcePolicyConflictException" ->
          `ResourcePolicyConflictException
            (Json_deserializers.resource_policy_conflict_exception_of_yojson tree path)
      | _, "ResourcePolicyInvalidParameterException" ->
          `ResourcePolicyInvalidParameterException
            (Json_deserializers.resource_policy_invalid_parameter_exception_of_yojson tree path)
      | _, "ResourcePolicyNotFoundException" ->
          `ResourcePolicyNotFoundException
            (Json_deserializers.resource_policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeleteResourcePolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeregisterManagedInstance = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_managed_instance_request) =
    let input = Json_serializers.deregister_managed_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeregisterManagedInstance" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.deregister_managed_instance_result_of_yojson
      ~error_deserializer
end

module DeregisterPatchBaselineForPatchGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_patch_baseline_for_patch_group_request) =
    let input =
      Json_serializers.deregister_patch_baseline_for_patch_group_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeregisterPatchBaselineForPatchGroup"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.deregister_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
end

module DeregisterTargetFromMaintenanceWindow = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `TargetInUseException _ -> "com.amazonaws.ssm#TargetInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "TargetInUseException" ->
          `TargetInUseException (Json_deserializers.target_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_target_from_maintenance_window_request) =
    let input =
      Json_serializers.deregister_target_from_maintenance_window_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.DeregisterTargetFromMaintenanceWindow" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.deregister_target_from_maintenance_window_result_of_yojson
      ~error_deserializer
end

module DeregisterTaskFromMaintenanceWindow = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_task_from_maintenance_window_request) =
    let input =
      Json_serializers.deregister_task_from_maintenance_window_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DeregisterTaskFromMaintenanceWindow"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.deregister_task_from_maintenance_window_result_of_yojson
      ~error_deserializer
end

module DescribeActivations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_activations_request) =
    let input = Json_serializers.describe_activations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeActivations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_activations_result_of_yojson
      ~error_deserializer
end

module DescribeAssociation = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAssociationVersion _ -> "com.amazonaws.ssm#InvalidAssociationVersion"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAssociationVersion" ->
          `InvalidAssociationVersion
            (Json_deserializers.invalid_association_version_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_association_request) =
    let input = Json_serializers.describe_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeAssociation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_association_result_of_yojson
      ~error_deserializer
end

module DescribeAssociationExecutionTargets = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `AssociationExecutionDoesNotExist _ -> "com.amazonaws.ssm#AssociationExecutionDoesNotExist"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "AssociationExecutionDoesNotExist" ->
          `AssociationExecutionDoesNotExist
            (Json_deserializers.association_execution_does_not_exist_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_association_execution_targets_request) =
    let input = Json_serializers.describe_association_execution_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeAssociationExecutionTargets"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_association_execution_targets_result_of_yojson
      ~error_deserializer
end

module DescribeAssociationExecutions = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_association_executions_request) =
    let input = Json_serializers.describe_association_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeAssociationExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_association_executions_result_of_yojson
      ~error_deserializer
end

module DescribeAutomationExecutions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidFilterValue _ -> "com.amazonaws.ssm#InvalidFilterValue"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidFilterValue" ->
          `InvalidFilterValue (Json_deserializers.invalid_filter_value_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_automation_executions_request) =
    let input = Json_serializers.describe_automation_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeAutomationExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_automation_executions_result_of_yojson
      ~error_deserializer
end

module DescribeAutomationStepExecutions = struct
  let error_to_string = function
    | `AutomationExecutionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationExecutionNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidFilterValue _ -> "com.amazonaws.ssm#InvalidFilterValue"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AutomationExecutionNotFoundException" ->
          `AutomationExecutionNotFoundException
            (Json_deserializers.automation_execution_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidFilterValue" ->
          `InvalidFilterValue (Json_deserializers.invalid_filter_value_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_automation_step_executions_request) =
    let input = Json_serializers.describe_automation_step_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeAutomationStepExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_automation_step_executions_result_of_yojson
      ~error_deserializer
end

module DescribeAvailablePatches = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_available_patches_request) =
    let input = Json_serializers.describe_available_patches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeAvailablePatches" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_available_patches_result_of_yojson
      ~error_deserializer
end

module DescribeDocument = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_document_request) =
    let input = Json_serializers.describe_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeDocument" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_document_result_of_yojson
      ~error_deserializer
end

module DescribeDocumentPermission = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentOperation _ -> "com.amazonaws.ssm#InvalidDocumentOperation"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `InvalidPermissionType _ -> "com.amazonaws.ssm#InvalidPermissionType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentOperation" ->
          `InvalidDocumentOperation
            (Json_deserializers.invalid_document_operation_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "InvalidPermissionType" ->
          `InvalidPermissionType (Json_deserializers.invalid_permission_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_document_permission_request) =
    let input = Json_serializers.describe_document_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeDocumentPermission" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_document_permission_response_of_yojson
      ~error_deserializer
end

module DescribeEffectiveInstanceAssociations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_effective_instance_associations_request) =
    let input =
      Json_serializers.describe_effective_instance_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.DescribeEffectiveInstanceAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_effective_instance_associations_result_of_yojson
      ~error_deserializer
end

module DescribeEffectivePatchesForPatchBaseline = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `UnsupportedOperatingSystem _ -> "com.amazonaws.ssm#UnsupportedOperatingSystem"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "UnsupportedOperatingSystem" ->
          `UnsupportedOperatingSystem
            (Json_deserializers.unsupported_operating_system_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_effective_patches_for_patch_baseline_request) =
    let input =
      Json_serializers.describe_effective_patches_for_patch_baseline_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.DescribeEffectivePatchesForPatchBaseline" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_effective_patches_for_patch_baseline_result_of_yojson
      ~error_deserializer
end

module DescribeInstanceAssociationsStatus = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_associations_status_request) =
    let input = Json_serializers.describe_instance_associations_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeInstanceAssociationsStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_associations_status_result_of_yojson
      ~error_deserializer
end

module DescribeInstanceInformation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidInstanceInformationFilterValue _ ->
        "com.amazonaws.ssm#InvalidInstanceInformationFilterValue"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidInstanceInformationFilterValue" ->
          `InvalidInstanceInformationFilterValue
            (Json_deserializers.invalid_instance_information_filter_value_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_information_request) =
    let input = Json_serializers.describe_instance_information_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeInstanceInformation" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_information_result_of_yojson
      ~error_deserializer
end

module DescribeInstancePatchStates = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_patch_states_request) =
    let input = Json_serializers.describe_instance_patch_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeInstancePatchStates" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_patch_states_result_of_yojson
      ~error_deserializer
end

module DescribeInstancePatchStatesForPatchGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_patch_states_for_patch_group_request) =
    let input =
      Json_serializers.describe_instance_patch_states_for_patch_group_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.DescribeInstancePatchStatesForPatchGroup" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_instance_patch_states_for_patch_group_result_of_yojson
      ~error_deserializer
end

module DescribeInstancePatches = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_patches_request) =
    let input = Json_serializers.describe_instance_patches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeInstancePatches" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_patches_result_of_yojson
      ~error_deserializer
end

module DescribeInstanceProperties = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidActivationId _ -> "com.amazonaws.ssm#InvalidActivationId"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidInstancePropertyFilterValue _ ->
        "com.amazonaws.ssm#InvalidInstancePropertyFilterValue"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidActivationId" ->
          `InvalidActivationId (Json_deserializers.invalid_activation_id_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidInstancePropertyFilterValue" ->
          `InvalidInstancePropertyFilterValue
            (Json_deserializers.invalid_instance_property_filter_value_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_properties_request) =
    let input = Json_serializers.describe_instance_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeInstanceProperties" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_properties_result_of_yojson
      ~error_deserializer
end

module DescribeInventoryDeletions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDeletionIdException _ -> "com.amazonaws.ssm#InvalidDeletionIdException"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDeletionIdException" ->
          `InvalidDeletionIdException
            (Json_deserializers.invalid_deletion_id_exception_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_inventory_deletions_request) =
    let input = Json_serializers.describe_inventory_deletions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeInventoryDeletions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_inventory_deletions_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowExecutionTaskInvocations = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_execution_task_invocations_request) =
    let input =
      Json_serializers.describe_maintenance_window_execution_task_invocations_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowExecutionTaskInvocations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_window_execution_task_invocations_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowExecutionTasks = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_execution_tasks_request) =
    let input =
      Json_serializers.describe_maintenance_window_execution_tasks_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowExecutionTasks" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_window_execution_tasks_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowExecutions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_executions_request) =
    let input = Json_serializers.describe_maintenance_window_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeMaintenanceWindowExecutions"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_window_executions_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowSchedule = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_schedule_request) =
    let input = Json_serializers.describe_maintenance_window_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeMaintenanceWindowSchedule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_window_schedule_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowTargets = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_targets_request) =
    let input = Json_serializers.describe_maintenance_window_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeMaintenanceWindowTargets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_window_targets_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowTasks = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_tasks_request) =
    let input = Json_serializers.describe_maintenance_window_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeMaintenanceWindowTasks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_window_tasks_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindows = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_windows_request) =
    let input = Json_serializers.describe_maintenance_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeMaintenanceWindows" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_windows_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowsForTarget = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_windows_for_target_request) =
    let input =
      Json_serializers.describe_maintenance_windows_for_target_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeMaintenanceWindowsForTarget"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_windows_for_target_result_of_yojson
      ~error_deserializer
end

module DescribeOpsItems = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ops_items_request) =
    let input = Json_serializers.describe_ops_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeOpsItems" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_ops_items_response_of_yojson
      ~error_deserializer
end

module DescribeParameters = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidFilterOption _ -> "com.amazonaws.ssm#InvalidFilterOption"
    | `InvalidFilterValue _ -> "com.amazonaws.ssm#InvalidFilterValue"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidFilterOption" ->
          `InvalidFilterOption (Json_deserializers.invalid_filter_option_of_yojson tree path)
      | _, "InvalidFilterValue" ->
          `InvalidFilterValue (Json_deserializers.invalid_filter_value_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_parameters_request) =
    let input = Json_serializers.describe_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeParameters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_parameters_result_of_yojson
      ~error_deserializer
end

module DescribePatchBaselines = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_baselines_request) =
    let input = Json_serializers.describe_patch_baselines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribePatchBaselines" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_patch_baselines_result_of_yojson
      ~error_deserializer
end

module DescribePatchGroupState = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_group_state_request) =
    let input = Json_serializers.describe_patch_group_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribePatchGroupState" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_patch_group_state_result_of_yojson
      ~error_deserializer
end

module DescribePatchGroups = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_groups_request) =
    let input = Json_serializers.describe_patch_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribePatchGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_patch_groups_result_of_yojson
      ~error_deserializer
end

module DescribePatchProperties = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_properties_request) =
    let input = Json_serializers.describe_patch_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribePatchProperties" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_patch_properties_result_of_yojson
      ~error_deserializer
end

module DescribeSessions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_sessions_request) =
    let input = Json_serializers.describe_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DescribeSessions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_sessions_response_of_yojson
      ~error_deserializer
end

module DisassociateOpsItemRelatedItem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemConflictException _ -> "com.amazonaws.ssm#OpsItemConflictException"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | `OpsItemNotFoundException _ -> "com.amazonaws.ssm#OpsItemNotFoundException"
    | `OpsItemRelatedItemAssociationNotFoundException _ ->
        "com.amazonaws.ssm#OpsItemRelatedItemAssociationNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemConflictException" ->
          `OpsItemConflictException
            (Json_deserializers.ops_item_conflict_exception_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _, "OpsItemNotFoundException" ->
          `OpsItemNotFoundException
            (Json_deserializers.ops_item_not_found_exception_of_yojson tree path)
      | _, "OpsItemRelatedItemAssociationNotFoundException" ->
          `OpsItemRelatedItemAssociationNotFoundException
            (Json_deserializers.ops_item_related_item_association_not_found_exception_of_yojson tree
               path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_ops_item_related_item_request) =
    let input = Json_serializers.disassociate_ops_item_related_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.DisassociateOpsItemRelatedItem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_ops_item_related_item_response_of_yojson
      ~error_deserializer
end

module GetAccessToken = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssm#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssm#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssm#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssm#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
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

  let request context (request : get_access_token_request) =
    let input = Json_serializers.get_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetAccessToken" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_access_token_response_of_yojson
      ~error_deserializer
end

module GetAutomationExecution = struct
  let error_to_string = function
    | `AutomationExecutionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationExecutionNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AutomationExecutionNotFoundException" ->
          `AutomationExecutionNotFoundException
            (Json_deserializers.automation_execution_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_automation_execution_request) =
    let input = Json_serializers.get_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetAutomationExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_automation_execution_result_of_yojson
      ~error_deserializer
end

module GetCalendarState = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentType _ -> "com.amazonaws.ssm#InvalidDocumentType"
    | `UnsupportedCalendarException _ -> "com.amazonaws.ssm#UnsupportedCalendarException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentType" ->
          `InvalidDocumentType (Json_deserializers.invalid_document_type_of_yojson tree path)
      | _, "UnsupportedCalendarException" ->
          `UnsupportedCalendarException
            (Json_deserializers.unsupported_calendar_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_calendar_state_request) =
    let input = Json_serializers.get_calendar_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetCalendarState" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_calendar_state_response_of_yojson
      ~error_deserializer
end

module GetCommandInvocation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidCommandId _ -> "com.amazonaws.ssm#InvalidCommandId"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidPluginName _ -> "com.amazonaws.ssm#InvalidPluginName"
    | `InvocationDoesNotExist _ -> "com.amazonaws.ssm#InvocationDoesNotExist"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidCommandId" ->
          `InvalidCommandId (Json_deserializers.invalid_command_id_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidPluginName" ->
          `InvalidPluginName (Json_deserializers.invalid_plugin_name_of_yojson tree path)
      | _, "InvocationDoesNotExist" ->
          `InvocationDoesNotExist (Json_deserializers.invocation_does_not_exist_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_command_invocation_request) =
    let input = Json_serializers.get_command_invocation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetCommandInvocation" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_command_invocation_result_of_yojson
      ~error_deserializer
end

module GetConnectionStatus = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_status_request) =
    let input = Json_serializers.get_connection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetConnectionStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_status_response_of_yojson
      ~error_deserializer
end

module GetDefaultPatchBaseline = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_default_patch_baseline_request) =
    let input = Json_serializers.get_default_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetDefaultPatchBaseline" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_default_patch_baseline_result_of_yojson
      ~error_deserializer
end

module GetDeployablePatchSnapshotForInstance = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `UnsupportedFeatureRequiredException _ ->
        "com.amazonaws.ssm#UnsupportedFeatureRequiredException"
    | `UnsupportedOperatingSystem _ -> "com.amazonaws.ssm#UnsupportedOperatingSystem"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "UnsupportedFeatureRequiredException" ->
          `UnsupportedFeatureRequiredException
            (Json_deserializers.unsupported_feature_required_exception_of_yojson tree path)
      | _, "UnsupportedOperatingSystem" ->
          `UnsupportedOperatingSystem
            (Json_deserializers.unsupported_operating_system_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployable_patch_snapshot_for_instance_request) =
    let input =
      Json_serializers.get_deployable_patch_snapshot_for_instance_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.GetDeployablePatchSnapshotForInstance" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_deployable_patch_snapshot_for_instance_result_of_yojson
      ~error_deserializer
end

module GetDocument = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_document_request) =
    let input = Json_serializers.get_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetDocument" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_document_result_of_yojson ~error_deserializer
end

module GetExecutionPreview = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssm#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_execution_preview_request) =
    let input = Json_serializers.get_execution_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetExecutionPreview" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_execution_preview_response_of_yojson
      ~error_deserializer
end

module GetInventory = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAggregatorException _ -> "com.amazonaws.ssm#InvalidAggregatorException"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidInventoryGroupException _ -> "com.amazonaws.ssm#InvalidInventoryGroupException"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `InvalidResultAttributeException _ -> "com.amazonaws.ssm#InvalidResultAttributeException"
    | `InvalidTypeNameException _ -> "com.amazonaws.ssm#InvalidTypeNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAggregatorException" ->
          `InvalidAggregatorException
            (Json_deserializers.invalid_aggregator_exception_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidInventoryGroupException" ->
          `InvalidInventoryGroupException
            (Json_deserializers.invalid_inventory_group_exception_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "InvalidResultAttributeException" ->
          `InvalidResultAttributeException
            (Json_deserializers.invalid_result_attribute_exception_of_yojson tree path)
      | _, "InvalidTypeNameException" ->
          `InvalidTypeNameException
            (Json_deserializers.invalid_type_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_inventory_request) =
    let input = Json_serializers.get_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetInventory" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_inventory_result_of_yojson
      ~error_deserializer
end

module GetInventorySchema = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `InvalidTypeNameException _ -> "com.amazonaws.ssm#InvalidTypeNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "InvalidTypeNameException" ->
          `InvalidTypeNameException
            (Json_deserializers.invalid_type_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_inventory_schema_request) =
    let input = Json_serializers.get_inventory_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetInventorySchema" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_inventory_schema_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindow = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_maintenance_window_request) =
    let input = Json_serializers.get_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetMaintenanceWindow" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowExecution = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_maintenance_window_execution_request) =
    let input = Json_serializers.get_maintenance_window_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetMaintenanceWindowExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_execution_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowExecutionTask = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_maintenance_window_execution_task_request) =
    let input = Json_serializers.get_maintenance_window_execution_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetMaintenanceWindowExecutionTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_execution_task_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowExecutionTaskInvocation = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_maintenance_window_execution_task_invocation_request) =
    let input =
      Json_serializers.get_maintenance_window_execution_task_invocation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSM.GetMaintenanceWindowExecutionTaskInvocation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_maintenance_window_execution_task_invocation_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowTask = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_maintenance_window_task_request) =
    let input = Json_serializers.get_maintenance_window_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetMaintenanceWindowTask" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_task_result_of_yojson
      ~error_deserializer
end

module GetOpsItem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemAccessDeniedException _ -> "com.amazonaws.ssm#OpsItemAccessDeniedException"
    | `OpsItemNotFoundException _ -> "com.amazonaws.ssm#OpsItemNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemAccessDeniedException" ->
          `OpsItemAccessDeniedException
            (Json_deserializers.ops_item_access_denied_exception_of_yojson tree path)
      | _, "OpsItemNotFoundException" ->
          `OpsItemNotFoundException
            (Json_deserializers.ops_item_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ops_item_request) =
    let input = Json_serializers.get_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetOpsItem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ops_item_response_of_yojson ~error_deserializer
end

module GetOpsMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsMetadataInvalidArgumentException _ ->
        "com.amazonaws.ssm#OpsMetadataInvalidArgumentException"
    | `OpsMetadataNotFoundException _ -> "com.amazonaws.ssm#OpsMetadataNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsMetadataInvalidArgumentException" ->
          `OpsMetadataInvalidArgumentException
            (Json_deserializers.ops_metadata_invalid_argument_exception_of_yojson tree path)
      | _, "OpsMetadataNotFoundException" ->
          `OpsMetadataNotFoundException
            (Json_deserializers.ops_metadata_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ops_metadata_request) =
    let input = Json_serializers.get_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetOpsMetadata" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_ops_metadata_result_of_yojson
      ~error_deserializer
end

module GetOpsSummary = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAggregatorException _ -> "com.amazonaws.ssm#InvalidAggregatorException"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `InvalidTypeNameException _ -> "com.amazonaws.ssm#InvalidTypeNameException"
    | `ResourceDataSyncNotFoundException _ -> "com.amazonaws.ssm#ResourceDataSyncNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAggregatorException" ->
          `InvalidAggregatorException
            (Json_deserializers.invalid_aggregator_exception_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "InvalidTypeNameException" ->
          `InvalidTypeNameException
            (Json_deserializers.invalid_type_name_exception_of_yojson tree path)
      | _, "ResourceDataSyncNotFoundException" ->
          `ResourceDataSyncNotFoundException
            (Json_deserializers.resource_data_sync_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ops_summary_request) =
    let input = Json_serializers.get_ops_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetOpsSummary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_ops_summary_result_of_yojson
      ~error_deserializer
end

module GetParameter = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidKeyId _ -> "com.amazonaws.ssm#InvalidKeyId"
    | `ParameterNotFound _ -> "com.amazonaws.ssm#ParameterNotFound"
    | `ParameterVersionNotFound _ -> "com.amazonaws.ssm#ParameterVersionNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKeyId" -> `InvalidKeyId (Json_deserializers.invalid_key_id_of_yojson tree path)
      | _, "ParameterNotFound" ->
          `ParameterNotFound (Json_deserializers.parameter_not_found_of_yojson tree path)
      | _, "ParameterVersionNotFound" ->
          `ParameterVersionNotFound
            (Json_deserializers.parameter_version_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_parameter_request) =
    let input = Json_serializers.get_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetParameter" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_parameter_result_of_yojson
      ~error_deserializer
end

module GetParameterHistory = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidKeyId _ -> "com.amazonaws.ssm#InvalidKeyId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `ParameterNotFound _ -> "com.amazonaws.ssm#ParameterNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKeyId" -> `InvalidKeyId (Json_deserializers.invalid_key_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "ParameterNotFound" ->
          `ParameterNotFound (Json_deserializers.parameter_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_parameter_history_request) =
    let input = Json_serializers.get_parameter_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetParameterHistory" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_parameter_history_result_of_yojson
      ~error_deserializer
end

module GetParameters = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidKeyId _ -> "com.amazonaws.ssm#InvalidKeyId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKeyId" -> `InvalidKeyId (Json_deserializers.invalid_key_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_parameters_request) =
    let input = Json_serializers.get_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetParameters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_parameters_result_of_yojson
      ~error_deserializer
end

module GetParametersByPath = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidFilterOption _ -> "com.amazonaws.ssm#InvalidFilterOption"
    | `InvalidFilterValue _ -> "com.amazonaws.ssm#InvalidFilterValue"
    | `InvalidKeyId _ -> "com.amazonaws.ssm#InvalidKeyId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidFilterOption" ->
          `InvalidFilterOption (Json_deserializers.invalid_filter_option_of_yojson tree path)
      | _, "InvalidFilterValue" ->
          `InvalidFilterValue (Json_deserializers.invalid_filter_value_of_yojson tree path)
      | _, "InvalidKeyId" -> `InvalidKeyId (Json_deserializers.invalid_key_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_parameters_by_path_request) =
    let input = Json_serializers.get_parameters_by_path_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetParametersByPath" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_parameters_by_path_result_of_yojson
      ~error_deserializer
end

module GetPatchBaseline = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_patch_baseline_request) =
    let input = Json_serializers.get_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetPatchBaseline" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_patch_baseline_result_of_yojson
      ~error_deserializer
end

module GetPatchBaselineForPatchGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_patch_baseline_for_patch_group_request) =
    let input = Json_serializers.get_patch_baseline_for_patch_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetPatchBaselineForPatchGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
end

module GetResourcePolicies = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssm#ResourceNotFoundException"
    | `ResourcePolicyInvalidParameterException _ ->
        "com.amazonaws.ssm#ResourcePolicyInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourcePolicyInvalidParameterException" ->
          `ResourcePolicyInvalidParameterException
            (Json_deserializers.resource_policy_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policies_request) =
    let input = Json_serializers.get_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetResourcePolicies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policies_response_of_yojson
      ~error_deserializer
end

module GetServiceSetting = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ServiceSettingNotFound _ -> "com.amazonaws.ssm#ServiceSettingNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceSettingNotFound" ->
          `ServiceSettingNotFound (Json_deserializers.service_setting_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_setting_request) =
    let input = Json_serializers.get_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.GetServiceSetting" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_service_setting_result_of_yojson
      ~error_deserializer
end

module LabelParameterVersion = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ParameterNotFound _ -> "com.amazonaws.ssm#ParameterNotFound"
    | `ParameterVersionLabelLimitExceeded _ ->
        "com.amazonaws.ssm#ParameterVersionLabelLimitExceeded"
    | `ParameterVersionNotFound _ -> "com.amazonaws.ssm#ParameterVersionNotFound"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ParameterNotFound" ->
          `ParameterNotFound (Json_deserializers.parameter_not_found_of_yojson tree path)
      | _, "ParameterVersionLabelLimitExceeded" ->
          `ParameterVersionLabelLimitExceeded
            (Json_deserializers.parameter_version_label_limit_exceeded_of_yojson tree path)
      | _, "ParameterVersionNotFound" ->
          `ParameterVersionNotFound
            (Json_deserializers.parameter_version_not_found_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : label_parameter_version_request) =
    let input = Json_serializers.label_parameter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.LabelParameterVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.label_parameter_version_result_of_yojson
      ~error_deserializer
end

module ListAssociationVersions = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_association_versions_request) =
    let input = Json_serializers.list_association_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListAssociationVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_association_versions_result_of_yojson
      ~error_deserializer
end

module ListAssociations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_associations_request) =
    let input = Json_serializers.list_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListAssociations" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_associations_result_of_yojson
      ~error_deserializer
end

module ListCommandInvocations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidCommandId _ -> "com.amazonaws.ssm#InvalidCommandId"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidCommandId" ->
          `InvalidCommandId (Json_deserializers.invalid_command_id_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_command_invocations_request) =
    let input = Json_serializers.list_command_invocations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListCommandInvocations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_command_invocations_result_of_yojson
      ~error_deserializer
end

module ListCommands = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidCommandId _ -> "com.amazonaws.ssm#InvalidCommandId"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidCommandId" ->
          `InvalidCommandId (Json_deserializers.invalid_command_id_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_commands_request) =
    let input = Json_serializers.list_commands_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListCommands" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_commands_result_of_yojson
      ~error_deserializer
end

module ListComplianceItems = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `InvalidResourceType _ -> "com.amazonaws.ssm#InvalidResourceType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "InvalidResourceType" ->
          `InvalidResourceType (Json_deserializers.invalid_resource_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_compliance_items_request) =
    let input = Json_serializers.list_compliance_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListComplianceItems" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_compliance_items_result_of_yojson
      ~error_deserializer
end

module ListComplianceSummaries = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_compliance_summaries_request) =
    let input = Json_serializers.list_compliance_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListComplianceSummaries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_compliance_summaries_result_of_yojson
      ~error_deserializer
end

module ListDocumentMetadataHistory = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_document_metadata_history_request) =
    let input = Json_serializers.list_document_metadata_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListDocumentMetadataHistory" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_document_metadata_history_response_of_yojson
      ~error_deserializer
end

module ListDocumentVersions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_document_versions_request) =
    let input = Json_serializers.list_document_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListDocumentVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_document_versions_result_of_yojson
      ~error_deserializer
end

module ListDocuments = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilterKey _ -> "com.amazonaws.ssm#InvalidFilterKey"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilterKey" ->
          `InvalidFilterKey (Json_deserializers.invalid_filter_key_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_documents_request) =
    let input = Json_serializers.list_documents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListDocuments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_documents_result_of_yojson
      ~error_deserializer
end

module ListInventoryEntries = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `InvalidTypeNameException _ -> "com.amazonaws.ssm#InvalidTypeNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "InvalidTypeNameException" ->
          `InvalidTypeNameException
            (Json_deserializers.invalid_type_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_inventory_entries_request) =
    let input = Json_serializers.list_inventory_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListInventoryEntries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_inventory_entries_result_of_yojson
      ~error_deserializer
end

module ListNodes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `ResourceDataSyncNotFoundException _ -> "com.amazonaws.ssm#ResourceDataSyncNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.ssm#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "ResourceDataSyncNotFoundException" ->
          `ResourceDataSyncNotFoundException
            (Json_deserializers.resource_data_sync_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_nodes_request) =
    let input = Json_serializers.list_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_nodes_result_of_yojson ~error_deserializer
end

module ListNodesSummary = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAggregatorException _ -> "com.amazonaws.ssm#InvalidAggregatorException"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `ResourceDataSyncNotFoundException _ -> "com.amazonaws.ssm#ResourceDataSyncNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.ssm#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAggregatorException" ->
          `InvalidAggregatorException
            (Json_deserializers.invalid_aggregator_exception_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "ResourceDataSyncNotFoundException" ->
          `ResourceDataSyncNotFoundException
            (Json_deserializers.resource_data_sync_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_nodes_summary_request) =
    let input = Json_serializers.list_nodes_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListNodesSummary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_nodes_summary_result_of_yojson
      ~error_deserializer
end

module ListOpsItemEvents = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | `OpsItemLimitExceededException _ -> "com.amazonaws.ssm#OpsItemLimitExceededException"
    | `OpsItemNotFoundException _ -> "com.amazonaws.ssm#OpsItemNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _, "OpsItemLimitExceededException" ->
          `OpsItemLimitExceededException
            (Json_deserializers.ops_item_limit_exceeded_exception_of_yojson tree path)
      | _, "OpsItemNotFoundException" ->
          `OpsItemNotFoundException
            (Json_deserializers.ops_item_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ops_item_events_request) =
    let input = Json_serializers.list_ops_item_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListOpsItemEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_ops_item_events_response_of_yojson
      ~error_deserializer
end

module ListOpsItemRelatedItems = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ops_item_related_items_request) =
    let input = Json_serializers.list_ops_item_related_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListOpsItemRelatedItems" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_ops_item_related_items_response_of_yojson
      ~error_deserializer
end

module ListOpsMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsMetadataInvalidArgumentException _ ->
        "com.amazonaws.ssm#OpsMetadataInvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsMetadataInvalidArgumentException" ->
          `OpsMetadataInvalidArgumentException
            (Json_deserializers.ops_metadata_invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ops_metadata_request) =
    let input = Json_serializers.list_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListOpsMetadata" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_ops_metadata_result_of_yojson
      ~error_deserializer
end

module ListResourceComplianceSummaries = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidFilter _ -> "com.amazonaws.ssm#InvalidFilter"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidFilter" -> `InvalidFilter (Json_deserializers.invalid_filter_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_compliance_summaries_request) =
    let input = Json_serializers.list_resource_compliance_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListResourceComplianceSummaries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_compliance_summaries_result_of_yojson
      ~error_deserializer
end

module ListResourceDataSync = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidNextToken _ -> "com.amazonaws.ssm#InvalidNextToken"
    | `ResourceDataSyncInvalidConfigurationException _ ->
        "com.amazonaws.ssm#ResourceDataSyncInvalidConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNextToken" ->
          `InvalidNextToken (Json_deserializers.invalid_next_token_of_yojson tree path)
      | _, "ResourceDataSyncInvalidConfigurationException" ->
          `ResourceDataSyncInvalidConfigurationException
            (Json_deserializers.resource_data_sync_invalid_configuration_exception_of_yojson tree
               path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_data_sync_request) =
    let input = Json_serializers.list_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListResourceDataSync" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `InvalidResourceType _ -> "com.amazonaws.ssm#InvalidResourceType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "InvalidResourceType" ->
          `InvalidResourceType (Json_deserializers.invalid_resource_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
end

module ModifyDocumentPermission = struct
  let error_to_string = function
    | `DocumentLimitExceeded _ -> "com.amazonaws.ssm#DocumentLimitExceeded"
    | `DocumentPermissionLimit _ -> "com.amazonaws.ssm#DocumentPermissionLimit"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidPermissionType _ -> "com.amazonaws.ssm#InvalidPermissionType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DocumentLimitExceeded" ->
          `DocumentLimitExceeded (Json_deserializers.document_limit_exceeded_of_yojson tree path)
      | _, "DocumentPermissionLimit" ->
          `DocumentPermissionLimit
            (Json_deserializers.document_permission_limit_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidPermissionType" ->
          `InvalidPermissionType (Json_deserializers.invalid_permission_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_document_permission_request) =
    let input = Json_serializers.modify_document_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ModifyDocumentPermission" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.modify_document_permission_response_of_yojson
      ~error_deserializer
end

module PutComplianceItems = struct
  let error_to_string = function
    | `ComplianceTypeCountLimitExceededException _ ->
        "com.amazonaws.ssm#ComplianceTypeCountLimitExceededException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidItemContentException _ -> "com.amazonaws.ssm#InvalidItemContentException"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `InvalidResourceType _ -> "com.amazonaws.ssm#InvalidResourceType"
    | `ItemSizeLimitExceededException _ -> "com.amazonaws.ssm#ItemSizeLimitExceededException"
    | `TotalSizeLimitExceededException _ -> "com.amazonaws.ssm#TotalSizeLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ComplianceTypeCountLimitExceededException" ->
          `ComplianceTypeCountLimitExceededException
            (Json_deserializers.compliance_type_count_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidItemContentException" ->
          `InvalidItemContentException
            (Json_deserializers.invalid_item_content_exception_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "InvalidResourceType" ->
          `InvalidResourceType (Json_deserializers.invalid_resource_type_of_yojson tree path)
      | _, "ItemSizeLimitExceededException" ->
          `ItemSizeLimitExceededException
            (Json_deserializers.item_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TotalSizeLimitExceededException" ->
          `TotalSizeLimitExceededException
            (Json_deserializers.total_size_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_compliance_items_request) =
    let input = Json_serializers.put_compliance_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.PutComplianceItems" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_compliance_items_result_of_yojson
      ~error_deserializer
end

module PutInventory = struct
  let error_to_string = function
    | `CustomSchemaCountLimitExceededException _ ->
        "com.amazonaws.ssm#CustomSchemaCountLimitExceededException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidInventoryItemContextException _ ->
        "com.amazonaws.ssm#InvalidInventoryItemContextException"
    | `InvalidItemContentException _ -> "com.amazonaws.ssm#InvalidItemContentException"
    | `InvalidTypeNameException _ -> "com.amazonaws.ssm#InvalidTypeNameException"
    | `ItemContentMismatchException _ -> "com.amazonaws.ssm#ItemContentMismatchException"
    | `ItemSizeLimitExceededException _ -> "com.amazonaws.ssm#ItemSizeLimitExceededException"
    | `SubTypeCountLimitExceededException _ ->
        "com.amazonaws.ssm#SubTypeCountLimitExceededException"
    | `TotalSizeLimitExceededException _ -> "com.amazonaws.ssm#TotalSizeLimitExceededException"
    | `UnsupportedInventoryItemContextException _ ->
        "com.amazonaws.ssm#UnsupportedInventoryItemContextException"
    | `UnsupportedInventorySchemaVersionException _ ->
        "com.amazonaws.ssm#UnsupportedInventorySchemaVersionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CustomSchemaCountLimitExceededException" ->
          `CustomSchemaCountLimitExceededException
            (Json_deserializers.custom_schema_count_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidInventoryItemContextException" ->
          `InvalidInventoryItemContextException
            (Json_deserializers.invalid_inventory_item_context_exception_of_yojson tree path)
      | _, "InvalidItemContentException" ->
          `InvalidItemContentException
            (Json_deserializers.invalid_item_content_exception_of_yojson tree path)
      | _, "InvalidTypeNameException" ->
          `InvalidTypeNameException
            (Json_deserializers.invalid_type_name_exception_of_yojson tree path)
      | _, "ItemContentMismatchException" ->
          `ItemContentMismatchException
            (Json_deserializers.item_content_mismatch_exception_of_yojson tree path)
      | _, "ItemSizeLimitExceededException" ->
          `ItemSizeLimitExceededException
            (Json_deserializers.item_size_limit_exceeded_exception_of_yojson tree path)
      | _, "SubTypeCountLimitExceededException" ->
          `SubTypeCountLimitExceededException
            (Json_deserializers.sub_type_count_limit_exceeded_exception_of_yojson tree path)
      | _, "TotalSizeLimitExceededException" ->
          `TotalSizeLimitExceededException
            (Json_deserializers.total_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedInventoryItemContextException" ->
          `UnsupportedInventoryItemContextException
            (Json_deserializers.unsupported_inventory_item_context_exception_of_yojson tree path)
      | _, "UnsupportedInventorySchemaVersionException" ->
          `UnsupportedInventorySchemaVersionException
            (Json_deserializers.unsupported_inventory_schema_version_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_inventory_request) =
    let input = Json_serializers.put_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.PutInventory" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_inventory_result_of_yojson
      ~error_deserializer
end

module PutParameter = struct
  let error_to_string = function
    | `HierarchyLevelLimitExceededException _ ->
        "com.amazonaws.ssm#HierarchyLevelLimitExceededException"
    | `HierarchyTypeMismatchException _ -> "com.amazonaws.ssm#HierarchyTypeMismatchException"
    | `IncompatiblePolicyException _ -> "com.amazonaws.ssm#IncompatiblePolicyException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAllowedPatternException _ -> "com.amazonaws.ssm#InvalidAllowedPatternException"
    | `InvalidKeyId _ -> "com.amazonaws.ssm#InvalidKeyId"
    | `InvalidPolicyAttributeException _ -> "com.amazonaws.ssm#InvalidPolicyAttributeException"
    | `InvalidPolicyTypeException _ -> "com.amazonaws.ssm#InvalidPolicyTypeException"
    | `ParameterAlreadyExists _ -> "com.amazonaws.ssm#ParameterAlreadyExists"
    | `ParameterLimitExceeded _ -> "com.amazonaws.ssm#ParameterLimitExceeded"
    | `ParameterMaxVersionLimitExceeded _ -> "com.amazonaws.ssm#ParameterMaxVersionLimitExceeded"
    | `ParameterPatternMismatchException _ -> "com.amazonaws.ssm#ParameterPatternMismatchException"
    | `PoliciesLimitExceededException _ -> "com.amazonaws.ssm#PoliciesLimitExceededException"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | `UnsupportedParameterType _ -> "com.amazonaws.ssm#UnsupportedParameterType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "HierarchyLevelLimitExceededException" ->
          `HierarchyLevelLimitExceededException
            (Json_deserializers.hierarchy_level_limit_exceeded_exception_of_yojson tree path)
      | _, "HierarchyTypeMismatchException" ->
          `HierarchyTypeMismatchException
            (Json_deserializers.hierarchy_type_mismatch_exception_of_yojson tree path)
      | _, "IncompatiblePolicyException" ->
          `IncompatiblePolicyException
            (Json_deserializers.incompatible_policy_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAllowedPatternException" ->
          `InvalidAllowedPatternException
            (Json_deserializers.invalid_allowed_pattern_exception_of_yojson tree path)
      | _, "InvalidKeyId" -> `InvalidKeyId (Json_deserializers.invalid_key_id_of_yojson tree path)
      | _, "InvalidPolicyAttributeException" ->
          `InvalidPolicyAttributeException
            (Json_deserializers.invalid_policy_attribute_exception_of_yojson tree path)
      | _, "InvalidPolicyTypeException" ->
          `InvalidPolicyTypeException
            (Json_deserializers.invalid_policy_type_exception_of_yojson tree path)
      | _, "ParameterAlreadyExists" ->
          `ParameterAlreadyExists (Json_deserializers.parameter_already_exists_of_yojson tree path)
      | _, "ParameterLimitExceeded" ->
          `ParameterLimitExceeded (Json_deserializers.parameter_limit_exceeded_of_yojson tree path)
      | _, "ParameterMaxVersionLimitExceeded" ->
          `ParameterMaxVersionLimitExceeded
            (Json_deserializers.parameter_max_version_limit_exceeded_of_yojson tree path)
      | _, "ParameterPatternMismatchException" ->
          `ParameterPatternMismatchException
            (Json_deserializers.parameter_pattern_mismatch_exception_of_yojson tree path)
      | _, "PoliciesLimitExceededException" ->
          `PoliciesLimitExceededException
            (Json_deserializers.policies_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _, "UnsupportedParameterType" ->
          `UnsupportedParameterType
            (Json_deserializers.unsupported_parameter_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_parameter_request) =
    let input = Json_serializers.put_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.PutParameter" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_parameter_result_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `MalformedResourcePolicyDocumentException _ ->
        "com.amazonaws.ssm#MalformedResourcePolicyDocumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssm#ResourceNotFoundException"
    | `ResourcePolicyConflictException _ -> "com.amazonaws.ssm#ResourcePolicyConflictException"
    | `ResourcePolicyInvalidParameterException _ ->
        "com.amazonaws.ssm#ResourcePolicyInvalidParameterException"
    | `ResourcePolicyLimitExceededException _ ->
        "com.amazonaws.ssm#ResourcePolicyLimitExceededException"
    | `ResourcePolicyNotFoundException _ -> "com.amazonaws.ssm#ResourcePolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "MalformedResourcePolicyDocumentException" ->
          `MalformedResourcePolicyDocumentException
            (Json_deserializers.malformed_resource_policy_document_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourcePolicyConflictException" ->
          `ResourcePolicyConflictException
            (Json_deserializers.resource_policy_conflict_exception_of_yojson tree path)
      | _, "ResourcePolicyInvalidParameterException" ->
          `ResourcePolicyInvalidParameterException
            (Json_deserializers.resource_policy_invalid_parameter_exception_of_yojson tree path)
      | _, "ResourcePolicyLimitExceededException" ->
          `ResourcePolicyLimitExceededException
            (Json_deserializers.resource_policy_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourcePolicyNotFoundException" ->
          `ResourcePolicyNotFoundException
            (Json_deserializers.resource_policy_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.PutResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module RegisterDefaultPatchBaseline = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_default_patch_baseline_request) =
    let input = Json_serializers.register_default_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.RegisterDefaultPatchBaseline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_default_patch_baseline_result_of_yojson
      ~error_deserializer
end

module RegisterPatchBaselineForPatchGroup = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.ssm#AlreadyExistsException"
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `ResourceLimitExceededException _ -> "com.amazonaws.ssm#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_patch_baseline_for_patch_group_request) =
    let input =
      Json_serializers.register_patch_baseline_for_patch_group_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.RegisterPatchBaselineForPatchGroup"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.register_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
end

module RegisterTargetWithMaintenanceWindow = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `IdempotentParameterMismatch _ -> "com.amazonaws.ssm#IdempotentParameterMismatch"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceLimitExceededException _ -> "com.amazonaws.ssm#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_target_with_maintenance_window_request) =
    let input =
      Json_serializers.register_target_with_maintenance_window_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.RegisterTargetWithMaintenanceWindow"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.register_target_with_maintenance_window_result_of_yojson
      ~error_deserializer
end

module RegisterTaskWithMaintenanceWindow = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `FeatureNotAvailableException _ -> "com.amazonaws.ssm#FeatureNotAvailableException"
    | `IdempotentParameterMismatch _ -> "com.amazonaws.ssm#IdempotentParameterMismatch"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceLimitExceededException _ -> "com.amazonaws.ssm#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "FeatureNotAvailableException" ->
          `FeatureNotAvailableException
            (Json_deserializers.feature_not_available_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_task_with_maintenance_window_request) =
    let input = Json_serializers.register_task_with_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.RegisterTaskWithMaintenanceWindow"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_task_with_maintenance_window_result_of_yojson
      ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidResourceId _ -> "com.amazonaws.ssm#InvalidResourceId"
    | `InvalidResourceType _ -> "com.amazonaws.ssm#InvalidResourceType"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidResourceId" ->
          `InvalidResourceId (Json_deserializers.invalid_resource_id_of_yojson tree path)
      | _, "InvalidResourceType" ->
          `InvalidResourceType (Json_deserializers.invalid_resource_type_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_resource_request) =
    let input = Json_serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.RemoveTagsFromResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_result_of_yojson
      ~error_deserializer
end

module ResetServiceSetting = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ServiceSettingNotFound _ -> "com.amazonaws.ssm#ServiceSettingNotFound"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceSettingNotFound" ->
          `ServiceSettingNotFound (Json_deserializers.service_setting_not_found_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_service_setting_request) =
    let input = Json_serializers.reset_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ResetServiceSetting" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reset_service_setting_result_of_yojson
      ~error_deserializer
end

module ResumeSession = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resume_session_request) =
    let input = Json_serializers.resume_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.ResumeSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.resume_session_response_of_yojson
      ~error_deserializer
end

module SendAutomationSignal = struct
  let error_to_string = function
    | `AutomationExecutionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationExecutionNotFoundException"
    | `AutomationStepNotFoundException _ -> "com.amazonaws.ssm#AutomationStepNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAutomationSignalException _ -> "com.amazonaws.ssm#InvalidAutomationSignalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AutomationExecutionNotFoundException" ->
          `AutomationExecutionNotFoundException
            (Json_deserializers.automation_execution_not_found_exception_of_yojson tree path)
      | _, "AutomationStepNotFoundException" ->
          `AutomationStepNotFoundException
            (Json_deserializers.automation_step_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAutomationSignalException" ->
          `InvalidAutomationSignalException
            (Json_deserializers.invalid_automation_signal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_automation_signal_request) =
    let input = Json_serializers.send_automation_signal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.SendAutomationSignal" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.send_automation_signal_result_of_yojson
      ~error_deserializer
end

module SendCommand = struct
  let error_to_string = function
    | `DuplicateInstanceId _ -> "com.amazonaws.ssm#DuplicateInstanceId"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `InvalidNotificationConfig _ -> "com.amazonaws.ssm#InvalidNotificationConfig"
    | `InvalidOutputFolder _ -> "com.amazonaws.ssm#InvalidOutputFolder"
    | `InvalidParameters _ -> "com.amazonaws.ssm#InvalidParameters"
    | `InvalidRole _ -> "com.amazonaws.ssm#InvalidRole"
    | `MaxDocumentSizeExceeded _ -> "com.amazonaws.ssm#MaxDocumentSizeExceeded"
    | `UnsupportedPlatformType _ -> "com.amazonaws.ssm#UnsupportedPlatformType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateInstanceId" ->
          `DuplicateInstanceId (Json_deserializers.duplicate_instance_id_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "InvalidNotificationConfig" ->
          `InvalidNotificationConfig
            (Json_deserializers.invalid_notification_config_of_yojson tree path)
      | _, "InvalidOutputFolder" ->
          `InvalidOutputFolder (Json_deserializers.invalid_output_folder_of_yojson tree path)
      | _, "InvalidParameters" ->
          `InvalidParameters (Json_deserializers.invalid_parameters_of_yojson tree path)
      | _, "InvalidRole" -> `InvalidRole (Json_deserializers.invalid_role_of_yojson tree path)
      | _, "MaxDocumentSizeExceeded" ->
          `MaxDocumentSizeExceeded
            (Json_deserializers.max_document_size_exceeded_of_yojson tree path)
      | _, "UnsupportedPlatformType" ->
          `UnsupportedPlatformType
            (Json_deserializers.unsupported_platform_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_command_request) =
    let input = Json_serializers.send_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.SendCommand" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_command_result_of_yojson ~error_deserializer
end

module StartAccessRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssm#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssm#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssm#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssm#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssm#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
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

  let request context (request : start_access_request_request) =
    let input = Json_serializers.start_access_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StartAccessRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_access_request_response_of_yojson
      ~error_deserializer
end

module StartAssociationsOnce = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `InvalidAssociation _ -> "com.amazonaws.ssm#InvalidAssociation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "InvalidAssociation" ->
          `InvalidAssociation (Json_deserializers.invalid_association_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_associations_once_request) =
    let input = Json_serializers.start_associations_once_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StartAssociationsOnce" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_associations_once_result_of_yojson
      ~error_deserializer
end

module StartAutomationExecution = struct
  let error_to_string = function
    | `AutomationDefinitionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationDefinitionNotFoundException"
    | `AutomationDefinitionVersionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationDefinitionVersionNotFoundException"
    | `AutomationExecutionLimitExceededException _ ->
        "com.amazonaws.ssm#AutomationExecutionLimitExceededException"
    | `IdempotentParameterMismatch _ -> "com.amazonaws.ssm#IdempotentParameterMismatch"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAutomationExecutionParametersException _ ->
        "com.amazonaws.ssm#InvalidAutomationExecutionParametersException"
    | `InvalidTarget _ -> "com.amazonaws.ssm#InvalidTarget"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AutomationDefinitionNotFoundException" ->
          `AutomationDefinitionNotFoundException
            (Json_deserializers.automation_definition_not_found_exception_of_yojson tree path)
      | _, "AutomationDefinitionVersionNotFoundException" ->
          `AutomationDefinitionVersionNotFoundException
            (Json_deserializers.automation_definition_version_not_found_exception_of_yojson tree
               path)
      | _, "AutomationExecutionLimitExceededException" ->
          `AutomationExecutionLimitExceededException
            (Json_deserializers.automation_execution_limit_exceeded_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAutomationExecutionParametersException" ->
          `InvalidAutomationExecutionParametersException
            (Json_deserializers.invalid_automation_execution_parameters_exception_of_yojson tree
               path)
      | _, "InvalidTarget" -> `InvalidTarget (Json_deserializers.invalid_target_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_automation_execution_request) =
    let input = Json_serializers.start_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StartAutomationExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_automation_execution_result_of_yojson
      ~error_deserializer
end

module StartChangeRequestExecution = struct
  let error_to_string = function
    | `AutomationDefinitionNotApprovedException _ ->
        "com.amazonaws.ssm#AutomationDefinitionNotApprovedException"
    | `AutomationDefinitionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationDefinitionNotFoundException"
    | `AutomationDefinitionVersionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationDefinitionVersionNotFoundException"
    | `AutomationExecutionLimitExceededException _ ->
        "com.amazonaws.ssm#AutomationExecutionLimitExceededException"
    | `IdempotentParameterMismatch _ -> "com.amazonaws.ssm#IdempotentParameterMismatch"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAutomationExecutionParametersException _ ->
        "com.amazonaws.ssm#InvalidAutomationExecutionParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AutomationDefinitionNotApprovedException" ->
          `AutomationDefinitionNotApprovedException
            (Json_deserializers.automation_definition_not_approved_exception_of_yojson tree path)
      | _, "AutomationDefinitionNotFoundException" ->
          `AutomationDefinitionNotFoundException
            (Json_deserializers.automation_definition_not_found_exception_of_yojson tree path)
      | _, "AutomationDefinitionVersionNotFoundException" ->
          `AutomationDefinitionVersionNotFoundException
            (Json_deserializers.automation_definition_version_not_found_exception_of_yojson tree
               path)
      | _, "AutomationExecutionLimitExceededException" ->
          `AutomationExecutionLimitExceededException
            (Json_deserializers.automation_execution_limit_exceeded_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAutomationExecutionParametersException" ->
          `InvalidAutomationExecutionParametersException
            (Json_deserializers.invalid_automation_execution_parameters_exception_of_yojson tree
               path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_change_request_execution_request) =
    let input = Json_serializers.start_change_request_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StartChangeRequestExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_change_request_execution_result_of_yojson
      ~error_deserializer
end

module StartExecutionPreview = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ValidationException _ -> "com.amazonaws.ssm#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_execution_preview_request) =
    let input = Json_serializers.start_execution_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StartExecutionPreview" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_execution_preview_response_of_yojson
      ~error_deserializer
end

module StartSession = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `TargetNotConnected _ -> "com.amazonaws.ssm#TargetNotConnected"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "TargetNotConnected" ->
          `TargetNotConnected (Json_deserializers.target_not_connected_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_session_request) =
    let input = Json_serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StartSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_session_response_of_yojson
      ~error_deserializer
end

module StopAutomationExecution = struct
  let error_to_string = function
    | `AutomationExecutionNotFoundException _ ->
        "com.amazonaws.ssm#AutomationExecutionNotFoundException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAutomationStatusUpdateException _ ->
        "com.amazonaws.ssm#InvalidAutomationStatusUpdateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AutomationExecutionNotFoundException" ->
          `AutomationExecutionNotFoundException
            (Json_deserializers.automation_execution_not_found_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAutomationStatusUpdateException" ->
          `InvalidAutomationStatusUpdateException
            (Json_deserializers.invalid_automation_status_update_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_automation_execution_request) =
    let input = Json_serializers.stop_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.StopAutomationExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_automation_execution_result_of_yojson
      ~error_deserializer
end

module TerminateSession = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_session_request) =
    let input = Json_serializers.terminate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.TerminateSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.terminate_session_response_of_yojson
      ~error_deserializer
end

module UnlabelParameterVersion = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ParameterNotFound _ -> "com.amazonaws.ssm#ParameterNotFound"
    | `ParameterVersionNotFound _ -> "com.amazonaws.ssm#ParameterVersionNotFound"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ParameterNotFound" ->
          `ParameterNotFound (Json_deserializers.parameter_not_found_of_yojson tree path)
      | _, "ParameterVersionNotFound" ->
          `ParameterVersionNotFound
            (Json_deserializers.parameter_version_not_found_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : unlabel_parameter_version_request) =
    let input = Json_serializers.unlabel_parameter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UnlabelParameterVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.unlabel_parameter_version_result_of_yojson
      ~error_deserializer
end

module UpdateAssociation = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `AssociationVersionLimitExceeded _ -> "com.amazonaws.ssm#AssociationVersionLimitExceeded"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidAssociationVersion _ -> "com.amazonaws.ssm#InvalidAssociationVersion"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `InvalidOutputLocation _ -> "com.amazonaws.ssm#InvalidOutputLocation"
    | `InvalidParameters _ -> "com.amazonaws.ssm#InvalidParameters"
    | `InvalidSchedule _ -> "com.amazonaws.ssm#InvalidSchedule"
    | `InvalidTarget _ -> "com.amazonaws.ssm#InvalidTarget"
    | `InvalidTargetMaps _ -> "com.amazonaws.ssm#InvalidTargetMaps"
    | `InvalidUpdate _ -> "com.amazonaws.ssm#InvalidUpdate"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "AssociationVersionLimitExceeded" ->
          `AssociationVersionLimitExceeded
            (Json_deserializers.association_version_limit_exceeded_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAssociationVersion" ->
          `InvalidAssociationVersion
            (Json_deserializers.invalid_association_version_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "InvalidOutputLocation" ->
          `InvalidOutputLocation (Json_deserializers.invalid_output_location_of_yojson tree path)
      | _, "InvalidParameters" ->
          `InvalidParameters (Json_deserializers.invalid_parameters_of_yojson tree path)
      | _, "InvalidSchedule" ->
          `InvalidSchedule (Json_deserializers.invalid_schedule_of_yojson tree path)
      | _, "InvalidTarget" -> `InvalidTarget (Json_deserializers.invalid_target_of_yojson tree path)
      | _, "InvalidTargetMaps" ->
          `InvalidTargetMaps (Json_deserializers.invalid_target_maps_of_yojson tree path)
      | _, "InvalidUpdate" -> `InvalidUpdate (Json_deserializers.invalid_update_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_association_request) =
    let input = Json_serializers.update_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateAssociation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_association_result_of_yojson
      ~error_deserializer
end

module UpdateAssociationStatus = struct
  let error_to_string = function
    | `AssociationDoesNotExist _ -> "com.amazonaws.ssm#AssociationDoesNotExist"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | `StatusUnchanged _ -> "com.amazonaws.ssm#StatusUnchanged"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociationDoesNotExist" ->
          `AssociationDoesNotExist
            (Json_deserializers.association_does_not_exist_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _, "StatusUnchanged" ->
          `StatusUnchanged (Json_deserializers.status_unchanged_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_association_status_request) =
    let input = Json_serializers.update_association_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateAssociationStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_association_status_result_of_yojson
      ~error_deserializer
end

module UpdateDocument = struct
  let error_to_string = function
    | `DocumentVersionLimitExceeded _ -> "com.amazonaws.ssm#DocumentVersionLimitExceeded"
    | `DuplicateDocumentContent _ -> "com.amazonaws.ssm#DuplicateDocumentContent"
    | `DuplicateDocumentVersionName _ -> "com.amazonaws.ssm#DuplicateDocumentVersionName"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentContent _ -> "com.amazonaws.ssm#InvalidDocumentContent"
    | `InvalidDocumentOperation _ -> "com.amazonaws.ssm#InvalidDocumentOperation"
    | `InvalidDocumentSchemaVersion _ -> "com.amazonaws.ssm#InvalidDocumentSchemaVersion"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `MaxDocumentSizeExceeded _ -> "com.amazonaws.ssm#MaxDocumentSizeExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DocumentVersionLimitExceeded" ->
          `DocumentVersionLimitExceeded
            (Json_deserializers.document_version_limit_exceeded_of_yojson tree path)
      | _, "DuplicateDocumentContent" ->
          `DuplicateDocumentContent
            (Json_deserializers.duplicate_document_content_of_yojson tree path)
      | _, "DuplicateDocumentVersionName" ->
          `DuplicateDocumentVersionName
            (Json_deserializers.duplicate_document_version_name_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentContent" ->
          `InvalidDocumentContent (Json_deserializers.invalid_document_content_of_yojson tree path)
      | _, "InvalidDocumentOperation" ->
          `InvalidDocumentOperation
            (Json_deserializers.invalid_document_operation_of_yojson tree path)
      | _, "InvalidDocumentSchemaVersion" ->
          `InvalidDocumentSchemaVersion
            (Json_deserializers.invalid_document_schema_version_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "MaxDocumentSizeExceeded" ->
          `MaxDocumentSizeExceeded
            (Json_deserializers.max_document_size_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_document_request) =
    let input = Json_serializers.update_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateDocument" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_document_result_of_yojson
      ~error_deserializer
end

module UpdateDocumentDefaultVersion = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentSchemaVersion _ -> "com.amazonaws.ssm#InvalidDocumentSchemaVersion"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentSchemaVersion" ->
          `InvalidDocumentSchemaVersion
            (Json_deserializers.invalid_document_schema_version_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_document_default_version_request) =
    let input = Json_serializers.update_document_default_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateDocumentDefaultVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_document_default_version_result_of_yojson
      ~error_deserializer
end

module UpdateDocumentMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidDocument _ -> "com.amazonaws.ssm#InvalidDocument"
    | `InvalidDocumentOperation _ -> "com.amazonaws.ssm#InvalidDocumentOperation"
    | `InvalidDocumentVersion _ -> "com.amazonaws.ssm#InvalidDocumentVersion"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDocument" ->
          `InvalidDocument (Json_deserializers.invalid_document_of_yojson tree path)
      | _, "InvalidDocumentOperation" ->
          `InvalidDocumentOperation
            (Json_deserializers.invalid_document_operation_of_yojson tree path)
      | _, "InvalidDocumentVersion" ->
          `InvalidDocumentVersion (Json_deserializers.invalid_document_version_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_document_metadata_request) =
    let input = Json_serializers.update_document_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateDocumentMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_document_metadata_response_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceWindow = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_maintenance_window_request) =
    let input = Json_serializers.update_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateMaintenanceWindow" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_maintenance_window_result_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceWindowTarget = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_maintenance_window_target_request) =
    let input = Json_serializers.update_maintenance_window_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateMaintenanceWindowTarget"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_maintenance_window_target_result_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceWindowTask = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_maintenance_window_task_request) =
    let input = Json_serializers.update_maintenance_window_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateMaintenanceWindowTask" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_maintenance_window_task_result_of_yojson
      ~error_deserializer
end

module UpdateManagedInstanceRole = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `InvalidInstanceId _ -> "com.amazonaws.ssm#InvalidInstanceId"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInstanceId" ->
          `InvalidInstanceId (Json_deserializers.invalid_instance_id_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_managed_instance_role_request) =
    let input = Json_serializers.update_managed_instance_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateManagedInstanceRole" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_managed_instance_role_result_of_yojson
      ~error_deserializer
end

module UpdateOpsItem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsItemAccessDeniedException _ -> "com.amazonaws.ssm#OpsItemAccessDeniedException"
    | `OpsItemAlreadyExistsException _ -> "com.amazonaws.ssm#OpsItemAlreadyExistsException"
    | `OpsItemConflictException _ -> "com.amazonaws.ssm#OpsItemConflictException"
    | `OpsItemInvalidParameterException _ -> "com.amazonaws.ssm#OpsItemInvalidParameterException"
    | `OpsItemLimitExceededException _ -> "com.amazonaws.ssm#OpsItemLimitExceededException"
    | `OpsItemNotFoundException _ -> "com.amazonaws.ssm#OpsItemNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsItemAccessDeniedException" ->
          `OpsItemAccessDeniedException
            (Json_deserializers.ops_item_access_denied_exception_of_yojson tree path)
      | _, "OpsItemAlreadyExistsException" ->
          `OpsItemAlreadyExistsException
            (Json_deserializers.ops_item_already_exists_exception_of_yojson tree path)
      | _, "OpsItemConflictException" ->
          `OpsItemConflictException
            (Json_deserializers.ops_item_conflict_exception_of_yojson tree path)
      | _, "OpsItemInvalidParameterException" ->
          `OpsItemInvalidParameterException
            (Json_deserializers.ops_item_invalid_parameter_exception_of_yojson tree path)
      | _, "OpsItemLimitExceededException" ->
          `OpsItemLimitExceededException
            (Json_deserializers.ops_item_limit_exceeded_exception_of_yojson tree path)
      | _, "OpsItemNotFoundException" ->
          `OpsItemNotFoundException
            (Json_deserializers.ops_item_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ops_item_request) =
    let input = Json_serializers.update_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateOpsItem" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_ops_item_response_of_yojson
      ~error_deserializer
end

module UpdateOpsMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `OpsMetadataInvalidArgumentException _ ->
        "com.amazonaws.ssm#OpsMetadataInvalidArgumentException"
    | `OpsMetadataKeyLimitExceededException _ ->
        "com.amazonaws.ssm#OpsMetadataKeyLimitExceededException"
    | `OpsMetadataNotFoundException _ -> "com.amazonaws.ssm#OpsMetadataNotFoundException"
    | `OpsMetadataTooManyUpdatesException _ ->
        "com.amazonaws.ssm#OpsMetadataTooManyUpdatesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "OpsMetadataInvalidArgumentException" ->
          `OpsMetadataInvalidArgumentException
            (Json_deserializers.ops_metadata_invalid_argument_exception_of_yojson tree path)
      | _, "OpsMetadataKeyLimitExceededException" ->
          `OpsMetadataKeyLimitExceededException
            (Json_deserializers.ops_metadata_key_limit_exceeded_exception_of_yojson tree path)
      | _, "OpsMetadataNotFoundException" ->
          `OpsMetadataNotFoundException
            (Json_deserializers.ops_metadata_not_found_exception_of_yojson tree path)
      | _, "OpsMetadataTooManyUpdatesException" ->
          `OpsMetadataTooManyUpdatesException
            (Json_deserializers.ops_metadata_too_many_updates_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ops_metadata_request) =
    let input = Json_serializers.update_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateOpsMetadata" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_ops_metadata_result_of_yojson
      ~error_deserializer
end

module UpdatePatchBaseline = struct
  let error_to_string = function
    | `DoesNotExistException _ -> "com.amazonaws.ssm#DoesNotExistException"
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DoesNotExistException" ->
          `DoesNotExistException (Json_deserializers.does_not_exist_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_patch_baseline_request) =
    let input = Json_serializers.update_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdatePatchBaseline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_patch_baseline_result_of_yojson
      ~error_deserializer
end

module UpdateResourceDataSync = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ResourceDataSyncConflictException _ -> "com.amazonaws.ssm#ResourceDataSyncConflictException"
    | `ResourceDataSyncInvalidConfigurationException _ ->
        "com.amazonaws.ssm#ResourceDataSyncInvalidConfigurationException"
    | `ResourceDataSyncNotFoundException _ -> "com.amazonaws.ssm#ResourceDataSyncNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ResourceDataSyncConflictException" ->
          `ResourceDataSyncConflictException
            (Json_deserializers.resource_data_sync_conflict_exception_of_yojson tree path)
      | _, "ResourceDataSyncInvalidConfigurationException" ->
          `ResourceDataSyncInvalidConfigurationException
            (Json_deserializers.resource_data_sync_invalid_configuration_exception_of_yojson tree
               path)
      | _, "ResourceDataSyncNotFoundException" ->
          `ResourceDataSyncNotFoundException
            (Json_deserializers.resource_data_sync_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resource_data_sync_request) =
    let input = Json_serializers.update_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateResourceDataSync" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module UpdateServiceSetting = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.ssm#InternalServerError"
    | `ServiceSettingNotFound _ -> "com.amazonaws.ssm#ServiceSettingNotFound"
    | `TooManyUpdates _ -> "com.amazonaws.ssm#TooManyUpdates"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceSettingNotFound" ->
          `ServiceSettingNotFound (Json_deserializers.service_setting_not_found_of_yojson tree path)
      | _, "TooManyUpdates" ->
          `TooManyUpdates (Json_deserializers.too_many_updates_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_setting_request) =
    let input = Json_serializers.update_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSM.UpdateServiceSetting" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_service_setting_result_of_yojson
      ~error_deserializer
end
