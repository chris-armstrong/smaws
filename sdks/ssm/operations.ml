open Types
open Service_metadata

module AddTagsToResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMAddTagsToResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_result_of_yojson
      ~error_deserializer
end

module AssociateOpsItemRelatedItem = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.associate_ops_item_related_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMAssociateOpsItemRelatedItem" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.associate_ops_item_related_item_response_of_yojson
      ~error_deserializer
end

module CancelCommand = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.cancel_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCancelCommand" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.cancel_command_result_of_yojson ~error_deserializer
end

module CancelMaintenanceWindowExecution = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.cancel_maintenance_window_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCancelMaintenanceWindowExecution"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.cancel_maintenance_window_execution_result_of_yojson
      ~error_deserializer
end

module CreateActivation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_activation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateActivation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_activation_result_of_yojson ~error_deserializer
end

module CreateAssociation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateAssociation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_association_result_of_yojson
      ~error_deserializer
end

module CreateAssociationBatch = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_association_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateAssociationBatch" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_association_batch_result_of_yojson
      ~error_deserializer
end

module CreateDocument = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateDocument" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_document_result_of_yojson ~error_deserializer
end

module CreateMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateMaintenanceWindow" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_maintenance_window_result_of_yojson
      ~error_deserializer
end

module CreateOpsItem = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateOpsItem" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_ops_item_response_of_yojson ~error_deserializer
end

module CreateOpsMetadata = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateOpsMetadata" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_ops_metadata_result_of_yojson
      ~error_deserializer
end

module CreatePatchBaseline = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreatePatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_patch_baseline_result_of_yojson
      ~error_deserializer
end

module CreateResourceDataSync = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMCreateResourceDataSync" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module DeleteActivation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_activation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteActivation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_activation_result_of_yojson ~error_deserializer
end

module DeleteAssociation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteAssociation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_association_result_of_yojson
      ~error_deserializer
end

module DeleteDocument = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteDocument" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_document_result_of_yojson ~error_deserializer
end

module DeleteInventory = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteInventory" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_inventory_result_of_yojson ~error_deserializer
end

module DeleteMaintenanceWindow = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_maintenance_window_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteMaintenanceWindow" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_maintenance_window_result_of_yojson
      ~error_deserializer
end

module DeleteOpsItem = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteOpsItem" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_ops_item_response_of_yojson ~error_deserializer
end

module DeleteOpsMetadata = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteOpsMetadata" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_ops_metadata_result_of_yojson
      ~error_deserializer
end

module DeleteParameter = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteParameter" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_parameter_result_of_yojson ~error_deserializer
end

module DeleteParameters = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_parameters_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteParameters" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_parameters_result_of_yojson ~error_deserializer
end

module DeletePatchBaseline = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeletePatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_patch_baseline_result_of_yojson
      ~error_deserializer
end

module DeleteResourceDataSync = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteResourceDataSync" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeleteResourcePolicy" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeregisterManagedInstance = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.deregister_managed_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeregisterManagedInstance" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.deregister_managed_instance_result_of_yojson
      ~error_deserializer
end

module DeregisterPatchBaselineForPatchGroup = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.deregister_patch_baseline_for_patch_group_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeregisterPatchBaselineForPatchGroup"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.deregister_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
end

module DeregisterTargetFromMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.deregister_target_from_maintenance_window_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeregisterTargetFromMaintenanceWindow"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.deregister_target_from_maintenance_window_result_of_yojson
      ~error_deserializer
end

module DeregisterTaskFromMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.deregister_task_from_maintenance_window_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDeregisterTaskFromMaintenanceWindow"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.deregister_task_from_maintenance_window_result_of_yojson
      ~error_deserializer
end

module DescribeActivations = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_activations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeActivations" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_activations_result_of_yojson
      ~error_deserializer
end

module DescribeAssociation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeAssociation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_association_result_of_yojson
      ~error_deserializer
end

module DescribeAssociationExecutionTargets = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_association_execution_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeAssociationExecutionTargets"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_association_execution_targets_result_of_yojson
      ~error_deserializer
end

module DescribeAssociationExecutions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_association_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeAssociationExecutions"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_association_executions_result_of_yojson
      ~error_deserializer
end

module DescribeAutomationExecutions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_automation_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeAutomationExecutions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_automation_executions_result_of_yojson
      ~error_deserializer
end

module DescribeAutomationStepExecutions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_automation_step_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeAutomationStepExecutions"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_automation_step_executions_result_of_yojson
      ~error_deserializer
end

module DescribeAvailablePatches = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_available_patches_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_available_patches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeAvailablePatches" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_available_patches_result_of_yojson
      ~error_deserializer
end

module DescribeDocument = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeDocument" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_document_result_of_yojson ~error_deserializer
end

module DescribeDocumentPermission = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_document_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeDocumentPermission" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_document_permission_response_of_yojson
      ~error_deserializer
end

module DescribeEffectiveInstanceAssociations = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_effective_instance_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeEffectiveInstanceAssociations"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_effective_instance_associations_result_of_yojson
      ~error_deserializer
end

module DescribeEffectivePatchesForPatchBaseline = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_effective_patches_for_patch_baseline_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSMDescribeEffectivePatchesForPatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_effective_patches_for_patch_baseline_result_of_yojson
      ~error_deserializer
end

module DescribeInstanceAssociationsStatus = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_instance_associations_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeInstanceAssociationsStatus"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_instance_associations_status_result_of_yojson
      ~error_deserializer
end

module DescribeInstanceInformation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_instance_information_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeInstanceInformation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_instance_information_result_of_yojson
      ~error_deserializer
end

module DescribeInstancePatchStates = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_instance_patch_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeInstancePatchStates" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_instance_patch_states_result_of_yojson
      ~error_deserializer
end

module DescribeInstancePatchStatesForPatchGroup = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_instance_patch_states_for_patch_group_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSMDescribeInstancePatchStatesForPatchGroup" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_instance_patch_states_for_patch_group_result_of_yojson
      ~error_deserializer
end

module DescribeInstancePatches = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_instance_patches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeInstancePatches" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_instance_patches_result_of_yojson
      ~error_deserializer
end

module DescribeInstanceProperties = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_instance_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeInstanceProperties" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_instance_properties_result_of_yojson
      ~error_deserializer
end

module DescribeInventoryDeletions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_inventory_deletions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeInventoryDeletions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_inventory_deletions_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowExecutionTaskInvocations = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_maintenance_window_execution_task_invocations_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSMDescribeMaintenanceWindowExecutionTaskInvocations" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_window_execution_task_invocations_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowExecutionTasks = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_maintenance_window_execution_tasks_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSMDescribeMaintenanceWindowExecutionTasks" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_window_execution_tasks_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowExecutions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_window_executions_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_maintenance_window_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeMaintenanceWindowExecutions"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_window_executions_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowSchedule = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_maintenance_window_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeMaintenanceWindowSchedule"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_window_schedule_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowTargets = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_maintenance_window_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeMaintenanceWindowTargets"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_window_targets_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowTasks = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_maintenance_window_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeMaintenanceWindowTasks"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_window_tasks_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindows = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_windows_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_maintenance_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeMaintenanceWindows" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_windows_result_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceWindowsForTarget = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_windows_for_target_request) =
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_maintenance_windows_for_target_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeMaintenanceWindowsForTarget"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_maintenance_windows_for_target_result_of_yojson
      ~error_deserializer
end

module DescribeOpsItems = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ops_items_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_ops_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeOpsItems" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_ops_items_response_of_yojson
      ~error_deserializer
end

module DescribeParameters = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeParameters" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_parameters_result_of_yojson
      ~error_deserializer
end

module DescribePatchBaselines = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_baselines_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_patch_baselines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribePatchBaselines" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_patch_baselines_result_of_yojson
      ~error_deserializer
end

module DescribePatchGroupState = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_patch_group_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribePatchGroupState" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_patch_group_state_result_of_yojson
      ~error_deserializer
end

module DescribePatchGroups = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_groups_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_patch_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribePatchGroups" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_patch_groups_result_of_yojson
      ~error_deserializer
end

module DescribePatchProperties = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_patch_properties_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_patch_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribePatchProperties" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_patch_properties_result_of_yojson
      ~error_deserializer
end

module DescribeSessions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDescribeSessions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_sessions_response_of_yojson
      ~error_deserializer
end

module DisassociateOpsItemRelatedItem = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.disassociate_ops_item_related_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMDisassociateOpsItemRelatedItem"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disassociate_ops_item_related_item_response_of_yojson
      ~error_deserializer
end

module GetAccessToken = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetAccessToken" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_access_token_response_of_yojson
      ~error_deserializer
end

module GetAutomationExecution = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetAutomationExecution" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_automation_execution_result_of_yojson
      ~error_deserializer
end

module GetCalendarState = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_calendar_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetCalendarState" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_calendar_state_response_of_yojson
      ~error_deserializer
end

module GetCommandInvocation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_command_invocation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetCommandInvocation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_command_invocation_result_of_yojson
      ~error_deserializer
end

module GetConnectionStatus = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_status_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_connection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetConnectionStatus" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_connection_status_response_of_yojson
      ~error_deserializer
end

module GetDefaultPatchBaseline = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_default_patch_baseline_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_default_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetDefaultPatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_default_patch_baseline_result_of_yojson
      ~error_deserializer
end

module GetDeployablePatchSnapshotForInstance = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.get_deployable_patch_snapshot_for_instance_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetDeployablePatchSnapshotForInstance"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.get_deployable_patch_snapshot_for_instance_result_of_yojson
      ~error_deserializer
end

module GetDocument = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetDocument" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_document_result_of_yojson ~error_deserializer
end

module GetExecutionPreview = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_execution_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetExecutionPreview" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_execution_preview_response_of_yojson
      ~error_deserializer
end

module GetInventory = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetInventory" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_inventory_result_of_yojson ~error_deserializer
end

module GetInventorySchema = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_inventory_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetInventorySchema" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_inventory_schema_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetMaintenanceWindow" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowExecution = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_maintenance_window_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetMaintenanceWindowExecution"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_execution_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowExecutionTask = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_maintenance_window_execution_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetMaintenanceWindowExecutionTask"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_execution_task_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowExecutionTaskInvocation = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.get_maintenance_window_execution_task_invocation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonSSMGetMaintenanceWindowExecutionTaskInvocation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.get_maintenance_window_execution_task_invocation_result_of_yojson
      ~error_deserializer
end

module GetMaintenanceWindowTask = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_maintenance_window_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetMaintenanceWindowTask" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_maintenance_window_task_result_of_yojson
      ~error_deserializer
end

module GetOpsItem = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetOpsItem" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_ops_item_response_of_yojson ~error_deserializer
end

module GetOpsMetadata = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetOpsMetadata" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_ops_metadata_result_of_yojson ~error_deserializer
end

module GetOpsSummary = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_ops_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetOpsSummary" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_ops_summary_result_of_yojson ~error_deserializer
end

module GetParameter = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetParameter" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_parameter_result_of_yojson ~error_deserializer
end

module GetParameterHistory = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_parameter_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetParameterHistory" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_parameter_history_result_of_yojson
      ~error_deserializer
end

module GetParameters = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetParameters" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_parameters_result_of_yojson ~error_deserializer
end

module GetParametersByPath = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_parameters_by_path_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetParametersByPath" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_parameters_by_path_result_of_yojson
      ~error_deserializer
end

module GetPatchBaseline = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetPatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_patch_baseline_result_of_yojson
      ~error_deserializer
end

module GetPatchBaselineForPatchGroup = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_patch_baseline_for_patch_group_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_patch_baseline_for_patch_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetPatchBaselineForPatchGroup"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
end

module GetResourcePolicies = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetResourcePolicies" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_resource_policies_response_of_yojson
      ~error_deserializer
end

module GetServiceSetting = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMGetServiceSetting" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_service_setting_result_of_yojson
      ~error_deserializer
end

module LabelParameterVersion = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.label_parameter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMLabelParameterVersion" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.label_parameter_version_result_of_yojson
      ~error_deserializer
end

module ListAssociationVersions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_association_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListAssociationVersions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_association_versions_result_of_yojson
      ~error_deserializer
end

module ListAssociations = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListAssociations" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_associations_result_of_yojson ~error_deserializer
end

module ListCommandInvocations = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_command_invocations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListCommandInvocations" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_command_invocations_result_of_yojson
      ~error_deserializer
end

module ListCommands = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_commands_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListCommands" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_commands_result_of_yojson ~error_deserializer
end

module ListComplianceItems = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_compliance_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListComplianceItems" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_compliance_items_result_of_yojson
      ~error_deserializer
end

module ListComplianceSummaries = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_compliance_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListComplianceSummaries" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_compliance_summaries_result_of_yojson
      ~error_deserializer
end

module ListDocumentMetadataHistory = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_document_metadata_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListDocumentMetadataHistory" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_document_metadata_history_response_of_yojson
      ~error_deserializer
end

module ListDocumentVersions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_document_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListDocumentVersions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_document_versions_result_of_yojson
      ~error_deserializer
end

module ListDocuments = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_documents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListDocuments" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_documents_result_of_yojson ~error_deserializer
end

module ListInventoryEntries = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_inventory_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListInventoryEntries" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_inventory_entries_result_of_yojson
      ~error_deserializer
end

module ListNodes = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListNodes" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_nodes_result_of_yojson ~error_deserializer
end

module ListNodesSummary = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_nodes_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListNodesSummary" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_nodes_summary_result_of_yojson
      ~error_deserializer
end

module ListOpsItemEvents = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_ops_item_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListOpsItemEvents" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_ops_item_events_response_of_yojson
      ~error_deserializer
end

module ListOpsItemRelatedItems = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_ops_item_related_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListOpsItemRelatedItems" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_ops_item_related_items_response_of_yojson
      ~error_deserializer
end

module ListOpsMetadata = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListOpsMetadata" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_ops_metadata_result_of_yojson ~error_deserializer
end

module ListResourceComplianceSummaries = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_resource_compliance_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListResourceComplianceSummaries"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_resource_compliance_summaries_result_of_yojson
      ~error_deserializer
end

module ListResourceDataSync = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListResourceDataSync" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMListTagsForResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
end

module ModifyDocumentPermission = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.modify_document_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMModifyDocumentPermission" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.modify_document_permission_response_of_yojson
      ~error_deserializer
end

module PutComplianceItems = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_compliance_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMPutComplianceItems" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_compliance_items_result_of_yojson
      ~error_deserializer
end

module PutInventory = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMPutInventory" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_inventory_result_of_yojson ~error_deserializer
end

module PutParameter = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMPutParameter" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_parameter_result_of_yojson ~error_deserializer
end

module PutResourcePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMPutResourcePolicy" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module RegisterDefaultPatchBaseline = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_default_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMRegisterDefaultPatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.register_default_patch_baseline_result_of_yojson
      ~error_deserializer
end

module RegisterPatchBaselineForPatchGroup = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.register_patch_baseline_for_patch_group_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMRegisterPatchBaselineForPatchGroup"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.register_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
end

module RegisterTargetWithMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.register_target_with_maintenance_window_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMRegisterTargetWithMaintenanceWindow"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.register_target_with_maintenance_window_result_of_yojson
      ~error_deserializer
end

module RegisterTaskWithMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_task_with_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMRegisterTaskWithMaintenanceWindow"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.register_task_with_maintenance_window_result_of_yojson
      ~error_deserializer
end

module RemoveTagsFromResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMRemoveTagsFromResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_result_of_yojson
      ~error_deserializer
end

module ResetServiceSetting = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.reset_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMResetServiceSetting" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.reset_service_setting_result_of_yojson
      ~error_deserializer
end

module ResumeSession = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.resume_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMResumeSession" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.resume_session_response_of_yojson ~error_deserializer
end

module SendAutomationSignal = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.send_automation_signal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMSendAutomationSignal" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.send_automation_signal_result_of_yojson
      ~error_deserializer
end

module SendCommand = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.send_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMSendCommand" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.send_command_result_of_yojson ~error_deserializer
end

module StartAccessRequest = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_access_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStartAccessRequest" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_access_request_response_of_yojson
      ~error_deserializer
end

module StartAssociationsOnce = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_associations_once_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStartAssociationsOnce" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_associations_once_result_of_yojson
      ~error_deserializer
end

module StartAutomationExecution = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStartAutomationExecution" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_automation_execution_result_of_yojson
      ~error_deserializer
end

module StartChangeRequestExecution = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_change_request_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStartChangeRequestExecution" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_change_request_execution_result_of_yojson
      ~error_deserializer
end

module StartExecutionPreview = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_execution_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStartExecutionPreview" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_execution_preview_response_of_yojson
      ~error_deserializer
end

module StartSession = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStartSession" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_session_response_of_yojson ~error_deserializer
end

module StopAutomationExecution = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.stop_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMStopAutomationExecution" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.stop_automation_execution_result_of_yojson
      ~error_deserializer
end

module TerminateSession = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_session_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.terminate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMTerminateSession" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.terminate_session_response_of_yojson
      ~error_deserializer
end

module UnlabelParameterVersion = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.unlabel_parameter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUnlabelParameterVersion" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.unlabel_parameter_version_result_of_yojson
      ~error_deserializer
end

module UpdateAssociation = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateAssociation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_association_result_of_yojson
      ~error_deserializer
end

module UpdateAssociationStatus = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_association_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateAssociationStatus" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_association_status_result_of_yojson
      ~error_deserializer
end

module UpdateDocument = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateDocument" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_document_result_of_yojson ~error_deserializer
end

module UpdateDocumentDefaultVersion = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_document_default_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateDocumentDefaultVersion" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_document_default_version_result_of_yojson
      ~error_deserializer
end

module UpdateDocumentMetadata = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_document_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateDocumentMetadata" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_document_metadata_response_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceWindow = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateMaintenanceWindow" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_maintenance_window_result_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceWindowTarget = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_maintenance_window_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateMaintenanceWindowTarget"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_maintenance_window_target_result_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceWindowTask = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_maintenance_window_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateMaintenanceWindowTask" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_maintenance_window_task_result_of_yojson
      ~error_deserializer
end

module UpdateManagedInstanceRole = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_managed_instance_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateManagedInstanceRole" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_managed_instance_role_result_of_yojson
      ~error_deserializer
end

module UpdateOpsItem = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateOpsItem" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_ops_item_response_of_yojson ~error_deserializer
end

module UpdateOpsMetadata = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateOpsMetadata" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_ops_metadata_result_of_yojson
      ~error_deserializer
end

module UpdatePatchBaseline = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdatePatchBaseline" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_patch_baseline_result_of_yojson
      ~error_deserializer
end

module UpdateResourceDataSync = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateResourceDataSync" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_resource_data_sync_result_of_yojson
      ~error_deserializer
end

module UpdateServiceSetting = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSSMUpdateServiceSetting" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_service_setting_result_of_yojson
      ~error_deserializer
end
