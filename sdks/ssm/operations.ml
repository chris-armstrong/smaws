open Types
open Service_metadata
module AddTagsToResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "InvalidResourceType") ->
              `InvalidResourceType
                (invalid_resource_type_of_yojson tree path)
          | (_, "TooManyTagsError") ->
              `TooManyTagsError (too_many_tags_error_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : add_tags_to_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_tags_to_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMAddTagsToResource"
            ~service ~config:context.config ~input
            ~output_deserializer:add_tags_to_resource_result_of_yojson
            ~error_deserializer
  end
module AssociateOpsItemRelatedItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemConflictException") ->
              `OpsItemConflictException
                (ops_item_conflict_exception_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | (_, "OpsItemLimitExceededException") ->
              `OpsItemLimitExceededException
                (ops_item_limit_exceeded_exception_of_yojson tree path)
          | (_, "OpsItemNotFoundException") ->
              `OpsItemNotFoundException
                (ops_item_not_found_exception_of_yojson tree path)
          | (_, "OpsItemRelatedItemAlreadyExistsException") ->
              `OpsItemRelatedItemAlreadyExistsException
                (ops_item_related_item_already_exists_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_ops_item_related_item_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_ops_item_related_item_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMAssociateOpsItemRelatedItem" ~service
            ~config:context.config ~input
            ~output_deserializer:associate_ops_item_related_item_response_of_yojson
            ~error_deserializer
  end
module CancelCommand =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DuplicateInstanceId") ->
              `DuplicateInstanceId
                (duplicate_instance_id_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidCommandId") ->
              `InvalidCommandId (invalid_command_id_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_command_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.cancel_command_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCancelCommand" ~service
            ~config:context.config ~input
            ~output_deserializer:cancel_command_result_of_yojson
            ~error_deserializer
  end
module CancelMaintenanceWindowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : cancel_maintenance_window_execution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_maintenance_window_execution_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMCancelMaintenanceWindowExecution" ~service
            ~config:context.config ~input
            ~output_deserializer:cancel_maintenance_window_execution_result_of_yojson
            ~error_deserializer
  end
module CreateActivation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidParameters") ->
              `InvalidParameters (invalid_parameters_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_activation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_activation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateActivation"
            ~service ~config:context.config ~input
            ~output_deserializer:create_activation_result_of_yojson
            ~error_deserializer
  end
module CreateAssociation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationAlreadyExists") ->
              `AssociationAlreadyExists
                (association_already_exists_of_yojson tree path)
          | (_, "AssociationLimitExceeded") ->
              `AssociationLimitExceeded
                (association_limit_exceeded_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidOutputLocation") ->
              `InvalidOutputLocation
                (invalid_output_location_of_yojson tree path)
          | (_, "InvalidParameters") ->
              `InvalidParameters (invalid_parameters_of_yojson tree path)
          | (_, "InvalidSchedule") ->
              `InvalidSchedule (invalid_schedule_of_yojson tree path)
          | (_, "InvalidTag") ->
              `InvalidTag (invalid_tag_of_yojson tree path)
          | (_, "InvalidTarget") ->
              `InvalidTarget (invalid_target_of_yojson tree path)
          | (_, "InvalidTargetMaps") ->
              `InvalidTargetMaps (invalid_target_maps_of_yojson tree path)
          | (_, "UnsupportedPlatformType") ->
              `UnsupportedPlatformType
                (unsupported_platform_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_association_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_association_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateAssociation"
            ~service ~config:context.config ~input
            ~output_deserializer:create_association_result_of_yojson
            ~error_deserializer
  end
module CreateAssociationBatch =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationLimitExceeded") ->
              `AssociationLimitExceeded
                (association_limit_exceeded_of_yojson tree path)
          | (_, "DuplicateInstanceId") ->
              `DuplicateInstanceId
                (duplicate_instance_id_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidOutputLocation") ->
              `InvalidOutputLocation
                (invalid_output_location_of_yojson tree path)
          | (_, "InvalidParameters") ->
              `InvalidParameters (invalid_parameters_of_yojson tree path)
          | (_, "InvalidSchedule") ->
              `InvalidSchedule (invalid_schedule_of_yojson tree path)
          | (_, "InvalidTarget") ->
              `InvalidTarget (invalid_target_of_yojson tree path)
          | (_, "InvalidTargetMaps") ->
              `InvalidTargetMaps (invalid_target_maps_of_yojson tree path)
          | (_, "UnsupportedPlatformType") ->
              `UnsupportedPlatformType
                (unsupported_platform_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_association_batch_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_association_batch_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateAssociationBatch"
            ~service ~config:context.config ~input
            ~output_deserializer:create_association_batch_result_of_yojson
            ~error_deserializer
  end
module CreateDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DocumentAlreadyExists") ->
              `DocumentAlreadyExists
                (document_already_exists_of_yojson tree path)
          | (_, "DocumentLimitExceeded") ->
              `DocumentLimitExceeded
                (document_limit_exceeded_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocumentContent") ->
              `InvalidDocumentContent
                (invalid_document_content_of_yojson tree path)
          | (_, "InvalidDocumentSchemaVersion") ->
              `InvalidDocumentSchemaVersion
                (invalid_document_schema_version_of_yojson tree path)
          | (_, "MaxDocumentSizeExceeded") ->
              `MaxDocumentSizeExceeded
                (max_document_size_exceeded_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateDocument" ~service
            ~config:context.config ~input
            ~output_deserializer:create_document_result_of_yojson
            ~error_deserializer
  end
module CreateMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceLimitExceededException") ->
              `ResourceLimitExceededException
                (resource_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_maintenance_window_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:create_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module CreateOpsItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemAccessDeniedException") ->
              `OpsItemAccessDeniedException
                (ops_item_access_denied_exception_of_yojson tree path)
          | (_, "OpsItemAlreadyExistsException") ->
              `OpsItemAlreadyExistsException
                (ops_item_already_exists_exception_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | (_, "OpsItemLimitExceededException") ->
              `OpsItemLimitExceededException
                (ops_item_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_ops_item_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_ops_item_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateOpsItem" ~service
            ~config:context.config ~input
            ~output_deserializer:create_ops_item_response_of_yojson
            ~error_deserializer
  end
module CreateOpsMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsMetadataAlreadyExistsException") ->
              `OpsMetadataAlreadyExistsException
                (ops_metadata_already_exists_exception_of_yojson tree path)
          | (_, "OpsMetadataInvalidArgumentException") ->
              `OpsMetadataInvalidArgumentException
                (ops_metadata_invalid_argument_exception_of_yojson tree path)
          | (_, "OpsMetadataLimitExceededException") ->
              `OpsMetadataLimitExceededException
                (ops_metadata_limit_exceeded_exception_of_yojson tree path)
          | (_, "OpsMetadataTooManyUpdatesException") ->
              `OpsMetadataTooManyUpdatesException
                (ops_metadata_too_many_updates_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_ops_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_ops_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateOpsMetadata"
            ~service ~config:context.config ~input
            ~output_deserializer:create_ops_metadata_result_of_yojson
            ~error_deserializer
  end
module CreatePatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceLimitExceededException") ->
              `ResourceLimitExceededException
                (resource_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_patch_baseline_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreatePatchBaseline"
            ~service ~config:context.config ~input
            ~output_deserializer:create_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module CreateResourceDataSync =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceDataSyncAlreadyExistsException") ->
              `ResourceDataSyncAlreadyExistsException
                (resource_data_sync_already_exists_exception_of_yojson tree
                   path)
          | (_, "ResourceDataSyncCountExceededException") ->
              `ResourceDataSyncCountExceededException
                (resource_data_sync_count_exceeded_exception_of_yojson tree
                   path)
          | (_, "ResourceDataSyncInvalidConfigurationException") ->
              `ResourceDataSyncInvalidConfigurationException
                (resource_data_sync_invalid_configuration_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_resource_data_sync_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_resource_data_sync_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMCreateResourceDataSync"
            ~service ~config:context.config ~input
            ~output_deserializer:create_resource_data_sync_result_of_yojson
            ~error_deserializer
  end
module DeleteActivation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidActivation") ->
              `InvalidActivation (invalid_activation_of_yojson tree path)
          | (_, "InvalidActivationId") ->
              `InvalidActivationId
                (invalid_activation_id_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_activation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_activation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteActivation"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_activation_result_of_yojson
            ~error_deserializer
  end
module DeleteAssociation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_association_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_association_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteAssociation"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_association_result_of_yojson
            ~error_deserializer
  end
module DeleteDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociatedInstances") ->
              `AssociatedInstances (associated_instances_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentOperation") ->
              `InvalidDocumentOperation
                (invalid_document_operation_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteDocument" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_document_result_of_yojson
            ~error_deserializer
  end
module DeleteInventory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDeleteInventoryParametersException") ->
              `InvalidDeleteInventoryParametersException
                (invalid_delete_inventory_parameters_exception_of_yojson tree
                   path)
          | (_, "InvalidInventoryRequestException") ->
              `InvalidInventoryRequestException
                (invalid_inventory_request_exception_of_yojson tree path)
          | (_, "InvalidOptionException") ->
              `InvalidOptionException
                (invalid_option_exception_of_yojson tree path)
          | (_, "InvalidTypeNameException") ->
              `InvalidTypeNameException
                (invalid_type_name_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_inventory_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_inventory_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteInventory"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_inventory_result_of_yojson
            ~error_deserializer
  end
module DeleteMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_maintenance_window_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module DeleteOpsItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_ops_item_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_ops_item_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteOpsItem" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_ops_item_response_of_yojson
            ~error_deserializer
  end
module DeleteOpsMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsMetadataInvalidArgumentException") ->
              `OpsMetadataInvalidArgumentException
                (ops_metadata_invalid_argument_exception_of_yojson tree path)
          | (_, "OpsMetadataNotFoundException") ->
              `OpsMetadataNotFoundException
                (ops_metadata_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_ops_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_ops_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteOpsMetadata"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_ops_metadata_result_of_yojson
            ~error_deserializer
  end
module DeleteParameter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ParameterNotFound") ->
              `ParameterNotFound (parameter_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_parameter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_parameter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteParameter"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_parameter_result_of_yojson
            ~error_deserializer
  end
module DeleteParameters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_parameters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_parameters_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteParameters"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_parameters_result_of_yojson
            ~error_deserializer
  end
module DeletePatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_patch_baseline_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeletePatchBaseline"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module DeleteResourceDataSync =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceDataSyncInvalidConfigurationException") ->
              `ResourceDataSyncInvalidConfigurationException
                (resource_data_sync_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "ResourceDataSyncNotFoundException") ->
              `ResourceDataSyncNotFoundException
                (resource_data_sync_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_data_sync_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_data_sync_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteResourceDataSync"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_resource_data_sync_result_of_yojson
            ~error_deserializer
  end
module DeleteResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "MalformedResourcePolicyDocumentException") ->
              `MalformedResourcePolicyDocumentException
                (malformed_resource_policy_document_exception_of_yojson tree
                   path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourcePolicyConflictException") ->
              `ResourcePolicyConflictException
                (resource_policy_conflict_exception_of_yojson tree path)
          | (_, "ResourcePolicyInvalidParameterException") ->
              `ResourcePolicyInvalidParameterException
                (resource_policy_invalid_parameter_exception_of_yojson tree
                   path)
          | (_, "ResourcePolicyNotFoundException") ->
              `ResourcePolicyNotFoundException
                (resource_policy_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDeleteResourcePolicy"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_resource_policy_response_of_yojson
            ~error_deserializer
  end
module DeregisterManagedInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deregister_managed_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_managed_instance_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDeregisterManagedInstance" ~service
            ~config:context.config ~input
            ~output_deserializer:deregister_managed_instance_result_of_yojson
            ~error_deserializer
  end
module DeregisterPatchBaselineForPatchGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : deregister_patch_baseline_for_patch_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_patch_baseline_for_patch_group_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDeregisterPatchBaselineForPatchGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:deregister_patch_baseline_for_patch_group_result_of_yojson
            ~error_deserializer
  end
module DeregisterTargetFromMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "TargetInUseException") ->
              `TargetInUseException
                (target_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : deregister_target_from_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_target_from_maintenance_window_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDeregisterTargetFromMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:deregister_target_from_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module DeregisterTaskFromMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : deregister_task_from_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_task_from_maintenance_window_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDeregisterTaskFromMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:deregister_task_from_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module DescribeActivations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_activations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_activations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeActivations"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_activations_result_of_yojson
            ~error_deserializer
  end
module DescribeAssociation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAssociationVersion") ->
              `InvalidAssociationVersion
                (invalid_association_version_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_association_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_association_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeAssociation"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_association_result_of_yojson
            ~error_deserializer
  end
module DescribeAssociationExecutionTargets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "AssociationExecutionDoesNotExist") ->
              `AssociationExecutionDoesNotExist
                (association_execution_does_not_exist_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_association_execution_targets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_association_execution_targets_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeAssociationExecutionTargets"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_association_execution_targets_result_of_yojson
            ~error_deserializer
  end
module DescribeAssociationExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_association_executions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_association_executions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeAssociationExecutions" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_association_executions_result_of_yojson
            ~error_deserializer
  end
module DescribeAutomationExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidFilterValue") ->
              `InvalidFilterValue (invalid_filter_value_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_automation_executions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_automation_executions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeAutomationExecutions" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_automation_executions_result_of_yojson
            ~error_deserializer
  end
module DescribeAutomationStepExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AutomationExecutionNotFoundException") ->
              `AutomationExecutionNotFoundException
                (automation_execution_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidFilterValue") ->
              `InvalidFilterValue (invalid_filter_value_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_automation_step_executions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_automation_step_executions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeAutomationStepExecutions" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_automation_step_executions_result_of_yojson
            ~error_deserializer
  end
module DescribeAvailablePatches =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_available_patches_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_available_patches_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeAvailablePatches" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_available_patches_result_of_yojson
            ~error_deserializer
  end
module DescribeDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeDocument"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_document_result_of_yojson
            ~error_deserializer
  end
module DescribeDocumentPermission =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentOperation") ->
              `InvalidDocumentOperation
                (invalid_document_operation_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "InvalidPermissionType") ->
              `InvalidPermissionType
                (invalid_permission_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_document_permission_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_document_permission_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeDocumentPermission" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_document_permission_response_of_yojson
            ~error_deserializer
  end
module DescribeEffectiveInstanceAssociations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_effective_instance_associations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_effective_instance_associations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeEffectiveInstanceAssociations"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_effective_instance_associations_result_of_yojson
            ~error_deserializer
  end
module DescribeEffectivePatchesForPatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "UnsupportedOperatingSystem") ->
              `UnsupportedOperatingSystem
                (unsupported_operating_system_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_effective_patches_for_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_effective_patches_for_patch_baseline_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeEffectivePatchesForPatchBaseline"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_effective_patches_for_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module DescribeInstanceAssociationsStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_instance_associations_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_instance_associations_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeInstanceAssociationsStatus"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_instance_associations_status_result_of_yojson
            ~error_deserializer
  end
module DescribeInstanceInformation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidInstanceInformationFilterValue") ->
              `InvalidInstanceInformationFilterValue
                (invalid_instance_information_filter_value_of_yojson tree
                   path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_instance_information_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_instance_information_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeInstanceInformation" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_instance_information_result_of_yojson
            ~error_deserializer
  end
module DescribeInstancePatchStates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_instance_patch_states_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_instance_patch_states_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeInstancePatchStates" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_instance_patch_states_result_of_yojson
            ~error_deserializer
  end
module DescribeInstancePatchStatesForPatchGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_instance_patch_states_for_patch_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_instance_patch_states_for_patch_group_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeInstancePatchStatesForPatchGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_instance_patch_states_for_patch_group_result_of_yojson
            ~error_deserializer
  end
module DescribeInstancePatches =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_instance_patches_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_instance_patches_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeInstancePatches"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_instance_patches_result_of_yojson
            ~error_deserializer
  end
module DescribeInstanceProperties =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidActivationId") ->
              `InvalidActivationId
                (invalid_activation_id_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidInstancePropertyFilterValue") ->
              `InvalidInstancePropertyFilterValue
                (invalid_instance_property_filter_value_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_instance_properties_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_instance_properties_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeInstanceProperties" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_instance_properties_result_of_yojson
            ~error_deserializer
  end
module DescribeInventoryDeletions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDeletionIdException") ->
              `InvalidDeletionIdException
                (invalid_deletion_id_exception_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_inventory_deletions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_inventory_deletions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeInventoryDeletions" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_inventory_deletions_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowExecutionTaskInvocations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request :
        describe_maintenance_window_execution_task_invocations_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_window_execution_task_invocations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowExecutionTaskInvocations"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_maintenance_window_execution_task_invocations_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowExecutionTasks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_maintenance_window_execution_tasks_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_window_execution_tasks_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowExecutionTasks"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_maintenance_window_execution_tasks_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_maintenance_window_executions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_window_executions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowExecutions"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_maintenance_window_executions_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowSchedule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_maintenance_window_schedule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_window_schedule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowSchedule" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_maintenance_window_schedule_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowTargets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_maintenance_window_targets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_window_targets_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowTargets" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_maintenance_window_targets_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowTasks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_maintenance_window_tasks_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_window_tasks_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowTasks" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_maintenance_window_tasks_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindows =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_maintenance_windows_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_windows_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindows" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_maintenance_windows_result_of_yojson
            ~error_deserializer
  end
module DescribeMaintenanceWindowsForTarget =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_maintenance_windows_for_target_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_maintenance_windows_for_target_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDescribeMaintenanceWindowsForTarget"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_maintenance_windows_for_target_result_of_yojson
            ~error_deserializer
  end
module DescribeOpsItems =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_ops_items_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_ops_items_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeOpsItems"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_ops_items_response_of_yojson
            ~error_deserializer
  end
module DescribeParameters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidFilterOption") ->
              `InvalidFilterOption
                (invalid_filter_option_of_yojson tree path)
          | (_, "InvalidFilterValue") ->
              `InvalidFilterValue (invalid_filter_value_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_parameters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_parameters_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeParameters"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_parameters_result_of_yojson
            ~error_deserializer
  end
module DescribePatchBaselines =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_patch_baselines_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_patch_baselines_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribePatchBaselines"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_patch_baselines_result_of_yojson
            ~error_deserializer
  end
module DescribePatchGroupState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_patch_group_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_patch_group_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribePatchGroupState"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_patch_group_state_result_of_yojson
            ~error_deserializer
  end
module DescribePatchGroups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_patch_groups_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_patch_groups_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribePatchGroups"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_patch_groups_result_of_yojson
            ~error_deserializer
  end
module DescribePatchProperties =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_patch_properties_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_patch_properties_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribePatchProperties"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_patch_properties_result_of_yojson
            ~error_deserializer
  end
module DescribeSessions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_sessions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_sessions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMDescribeSessions"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_sessions_response_of_yojson
            ~error_deserializer
  end
module DisassociateOpsItemRelatedItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemConflictException") ->
              `OpsItemConflictException
                (ops_item_conflict_exception_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | (_, "OpsItemNotFoundException") ->
              `OpsItemNotFoundException
                (ops_item_not_found_exception_of_yojson tree path)
          | (_, "OpsItemRelatedItemAssociationNotFoundException") ->
              `OpsItemRelatedItemAssociationNotFoundException
                (ops_item_related_item_association_not_found_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : disassociate_ops_item_related_item_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_ops_item_related_item_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMDisassociateOpsItemRelatedItem" ~service
            ~config:context.config ~input
            ~output_deserializer:disassociate_ops_item_related_item_response_of_yojson
            ~error_deserializer
  end
module GetAccessToken =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_access_token_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_access_token_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetAccessToken" ~service
            ~config:context.config ~input
            ~output_deserializer:get_access_token_response_of_yojson
            ~error_deserializer
  end
module GetAutomationExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AutomationExecutionNotFoundException") ->
              `AutomationExecutionNotFoundException
                (automation_execution_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_automation_execution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_automation_execution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetAutomationExecution"
            ~service ~config:context.config ~input
            ~output_deserializer:get_automation_execution_result_of_yojson
            ~error_deserializer
  end
module GetCalendarState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentType") ->
              `InvalidDocumentType
                (invalid_document_type_of_yojson tree path)
          | (_, "UnsupportedCalendarException") ->
              `UnsupportedCalendarException
                (unsupported_calendar_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_calendar_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_calendar_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetCalendarState"
            ~service ~config:context.config ~input
            ~output_deserializer:get_calendar_state_response_of_yojson
            ~error_deserializer
  end
module GetCommandInvocation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidCommandId") ->
              `InvalidCommandId (invalid_command_id_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidPluginName") ->
              `InvalidPluginName (invalid_plugin_name_of_yojson tree path)
          | (_, "InvocationDoesNotExist") ->
              `InvocationDoesNotExist
                (invocation_does_not_exist_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_command_invocation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_command_invocation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetCommandInvocation"
            ~service ~config:context.config ~input
            ~output_deserializer:get_command_invocation_result_of_yojson
            ~error_deserializer
  end
module GetConnectionStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_connection_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_connection_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetConnectionStatus"
            ~service ~config:context.config ~input
            ~output_deserializer:get_connection_status_response_of_yojson
            ~error_deserializer
  end
module GetDefaultPatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_default_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_default_patch_baseline_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetDefaultPatchBaseline"
            ~service ~config:context.config ~input
            ~output_deserializer:get_default_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module GetDeployablePatchSnapshotForInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "UnsupportedFeatureRequiredException") ->
              `UnsupportedFeatureRequiredException
                (unsupported_feature_required_exception_of_yojson tree path)
          | (_, "UnsupportedOperatingSystem") ->
              `UnsupportedOperatingSystem
                (unsupported_operating_system_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_deployable_patch_snapshot_for_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_deployable_patch_snapshot_for_instance_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMGetDeployablePatchSnapshotForInstance"
            ~service ~config:context.config ~input
            ~output_deserializer:get_deployable_patch_snapshot_for_instance_result_of_yojson
            ~error_deserializer
  end
module GetDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetDocument" ~service
            ~config:context.config ~input
            ~output_deserializer:get_document_result_of_yojson
            ~error_deserializer
  end
module GetExecutionPreview =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_execution_preview_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_execution_preview_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetExecutionPreview"
            ~service ~config:context.config ~input
            ~output_deserializer:get_execution_preview_response_of_yojson
            ~error_deserializer
  end
module GetInventory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAggregatorException") ->
              `InvalidAggregatorException
                (invalid_aggregator_exception_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidInventoryGroupException") ->
              `InvalidInventoryGroupException
                (invalid_inventory_group_exception_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "InvalidResultAttributeException") ->
              `InvalidResultAttributeException
                (invalid_result_attribute_exception_of_yojson tree path)
          | (_, "InvalidTypeNameException") ->
              `InvalidTypeNameException
                (invalid_type_name_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_inventory_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_inventory_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetInventory" ~service
            ~config:context.config ~input
            ~output_deserializer:get_inventory_result_of_yojson
            ~error_deserializer
  end
module GetInventorySchema =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "InvalidTypeNameException") ->
              `InvalidTypeNameException
                (invalid_type_name_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_inventory_schema_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_inventory_schema_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetInventorySchema"
            ~service ~config:context.config ~input
            ~output_deserializer:get_inventory_schema_result_of_yojson
            ~error_deserializer
  end
module GetMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_maintenance_window_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:get_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module GetMaintenanceWindowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_maintenance_window_execution_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_maintenance_window_execution_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMGetMaintenanceWindowExecution" ~service
            ~config:context.config ~input
            ~output_deserializer:get_maintenance_window_execution_result_of_yojson
            ~error_deserializer
  end
module GetMaintenanceWindowExecutionTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_maintenance_window_execution_task_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_maintenance_window_execution_task_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMGetMaintenanceWindowExecutionTask" ~service
            ~config:context.config ~input
            ~output_deserializer:get_maintenance_window_execution_task_result_of_yojson
            ~error_deserializer
  end
module GetMaintenanceWindowExecutionTaskInvocation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_maintenance_window_execution_task_invocation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_maintenance_window_execution_task_invocation_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMGetMaintenanceWindowExecutionTaskInvocation"
            ~service ~config:context.config ~input
            ~output_deserializer:get_maintenance_window_execution_task_invocation_result_of_yojson
            ~error_deserializer
  end
module GetMaintenanceWindowTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_maintenance_window_task_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_maintenance_window_task_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMGetMaintenanceWindowTask" ~service
            ~config:context.config ~input
            ~output_deserializer:get_maintenance_window_task_result_of_yojson
            ~error_deserializer
  end
module GetOpsItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemAccessDeniedException") ->
              `OpsItemAccessDeniedException
                (ops_item_access_denied_exception_of_yojson tree path)
          | (_, "OpsItemNotFoundException") ->
              `OpsItemNotFoundException
                (ops_item_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_ops_item_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_ops_item_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetOpsItem" ~service
            ~config:context.config ~input
            ~output_deserializer:get_ops_item_response_of_yojson
            ~error_deserializer
  end
module GetOpsMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsMetadataInvalidArgumentException") ->
              `OpsMetadataInvalidArgumentException
                (ops_metadata_invalid_argument_exception_of_yojson tree path)
          | (_, "OpsMetadataNotFoundException") ->
              `OpsMetadataNotFoundException
                (ops_metadata_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_ops_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_ops_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetOpsMetadata" ~service
            ~config:context.config ~input
            ~output_deserializer:get_ops_metadata_result_of_yojson
            ~error_deserializer
  end
module GetOpsSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAggregatorException") ->
              `InvalidAggregatorException
                (invalid_aggregator_exception_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "InvalidTypeNameException") ->
              `InvalidTypeNameException
                (invalid_type_name_exception_of_yojson tree path)
          | (_, "ResourceDataSyncNotFoundException") ->
              `ResourceDataSyncNotFoundException
                (resource_data_sync_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_ops_summary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_ops_summary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetOpsSummary" ~service
            ~config:context.config ~input
            ~output_deserializer:get_ops_summary_result_of_yojson
            ~error_deserializer
  end
module GetParameter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidKeyId") ->
              `InvalidKeyId (invalid_key_id_of_yojson tree path)
          | (_, "ParameterNotFound") ->
              `ParameterNotFound (parameter_not_found_of_yojson tree path)
          | (_, "ParameterVersionNotFound") ->
              `ParameterVersionNotFound
                (parameter_version_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_parameter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_parameter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetParameter" ~service
            ~config:context.config ~input
            ~output_deserializer:get_parameter_result_of_yojson
            ~error_deserializer
  end
module GetParameterHistory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidKeyId") ->
              `InvalidKeyId (invalid_key_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "ParameterNotFound") ->
              `ParameterNotFound (parameter_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_parameter_history_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_parameter_history_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetParameterHistory"
            ~service ~config:context.config ~input
            ~output_deserializer:get_parameter_history_result_of_yojson
            ~error_deserializer
  end
module GetParameters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidKeyId") ->
              `InvalidKeyId (invalid_key_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_parameters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_parameters_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetParameters" ~service
            ~config:context.config ~input
            ~output_deserializer:get_parameters_result_of_yojson
            ~error_deserializer
  end
module GetParametersByPath =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidFilterOption") ->
              `InvalidFilterOption
                (invalid_filter_option_of_yojson tree path)
          | (_, "InvalidFilterValue") ->
              `InvalidFilterValue (invalid_filter_value_of_yojson tree path)
          | (_, "InvalidKeyId") ->
              `InvalidKeyId (invalid_key_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_parameters_by_path_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_parameters_by_path_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetParametersByPath"
            ~service ~config:context.config ~input
            ~output_deserializer:get_parameters_by_path_result_of_yojson
            ~error_deserializer
  end
module GetPatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_patch_baseline_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetPatchBaseline"
            ~service ~config:context.config ~input
            ~output_deserializer:get_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module GetPatchBaselineForPatchGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_patch_baseline_for_patch_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_patch_baseline_for_patch_group_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMGetPatchBaselineForPatchGroup" ~service
            ~config:context.config ~input
            ~output_deserializer:get_patch_baseline_for_patch_group_result_of_yojson
            ~error_deserializer
  end
module GetResourcePolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourcePolicyInvalidParameterException") ->
              `ResourcePolicyInvalidParameterException
                (resource_policy_invalid_parameter_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_policies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetResourcePolicies"
            ~service ~config:context.config ~input
            ~output_deserializer:get_resource_policies_response_of_yojson
            ~error_deserializer
  end
module GetServiceSetting =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ServiceSettingNotFound") ->
              `ServiceSettingNotFound
                (service_setting_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_setting_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_setting_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMGetServiceSetting"
            ~service ~config:context.config ~input
            ~output_deserializer:get_service_setting_result_of_yojson
            ~error_deserializer
  end
module LabelParameterVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ParameterNotFound") ->
              `ParameterNotFound (parameter_not_found_of_yojson tree path)
          | (_, "ParameterVersionLabelLimitExceeded") ->
              `ParameterVersionLabelLimitExceeded
                (parameter_version_label_limit_exceeded_of_yojson tree path)
          | (_, "ParameterVersionNotFound") ->
              `ParameterVersionNotFound
                (parameter_version_not_found_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : label_parameter_version_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.label_parameter_version_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMLabelParameterVersion"
            ~service ~config:context.config ~input
            ~output_deserializer:label_parameter_version_result_of_yojson
            ~error_deserializer
  end
module ListAssociationVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_association_versions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_association_versions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListAssociationVersions"
            ~service ~config:context.config ~input
            ~output_deserializer:list_association_versions_result_of_yojson
            ~error_deserializer
  end
module ListAssociations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_associations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_associations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListAssociations"
            ~service ~config:context.config ~input
            ~output_deserializer:list_associations_result_of_yojson
            ~error_deserializer
  end
module ListCommandInvocations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidCommandId") ->
              `InvalidCommandId (invalid_command_id_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_command_invocations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_command_invocations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListCommandInvocations"
            ~service ~config:context.config ~input
            ~output_deserializer:list_command_invocations_result_of_yojson
            ~error_deserializer
  end
module ListCommands =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidCommandId") ->
              `InvalidCommandId (invalid_command_id_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_commands_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_commands_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListCommands" ~service
            ~config:context.config ~input
            ~output_deserializer:list_commands_result_of_yojson
            ~error_deserializer
  end
module ListComplianceItems =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "InvalidResourceType") ->
              `InvalidResourceType
                (invalid_resource_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_compliance_items_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_compliance_items_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListComplianceItems"
            ~service ~config:context.config ~input
            ~output_deserializer:list_compliance_items_result_of_yojson
            ~error_deserializer
  end
module ListComplianceSummaries =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_compliance_summaries_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_compliance_summaries_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListComplianceSummaries"
            ~service ~config:context.config ~input
            ~output_deserializer:list_compliance_summaries_result_of_yojson
            ~error_deserializer
  end
module ListDocumentMetadataHistory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_document_metadata_history_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_document_metadata_history_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMListDocumentMetadataHistory" ~service
            ~config:context.config ~input
            ~output_deserializer:list_document_metadata_history_response_of_yojson
            ~error_deserializer
  end
module ListDocumentVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_document_versions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_document_versions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListDocumentVersions"
            ~service ~config:context.config ~input
            ~output_deserializer:list_document_versions_result_of_yojson
            ~error_deserializer
  end
module ListDocuments =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilterKey") ->
              `InvalidFilterKey (invalid_filter_key_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_documents_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_documents_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListDocuments" ~service
            ~config:context.config ~input
            ~output_deserializer:list_documents_result_of_yojson
            ~error_deserializer
  end
module ListInventoryEntries =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "InvalidTypeNameException") ->
              `InvalidTypeNameException
                (invalid_type_name_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_inventory_entries_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_inventory_entries_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListInventoryEntries"
            ~service ~config:context.config ~input
            ~output_deserializer:list_inventory_entries_result_of_yojson
            ~error_deserializer
  end
module ListNodes =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "ResourceDataSyncNotFoundException") ->
              `ResourceDataSyncNotFoundException
                (resource_data_sync_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_nodes_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_nodes_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListNodes" ~service
            ~config:context.config ~input
            ~output_deserializer:list_nodes_result_of_yojson
            ~error_deserializer
  end
module ListNodesSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAggregatorException") ->
              `InvalidAggregatorException
                (invalid_aggregator_exception_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "ResourceDataSyncNotFoundException") ->
              `ResourceDataSyncNotFoundException
                (resource_data_sync_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_nodes_summary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_nodes_summary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListNodesSummary"
            ~service ~config:context.config ~input
            ~output_deserializer:list_nodes_summary_result_of_yojson
            ~error_deserializer
  end
module ListOpsItemEvents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | (_, "OpsItemLimitExceededException") ->
              `OpsItemLimitExceededException
                (ops_item_limit_exceeded_exception_of_yojson tree path)
          | (_, "OpsItemNotFoundException") ->
              `OpsItemNotFoundException
                (ops_item_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_ops_item_events_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_ops_item_events_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListOpsItemEvents"
            ~service ~config:context.config ~input
            ~output_deserializer:list_ops_item_events_response_of_yojson
            ~error_deserializer
  end
module ListOpsItemRelatedItems =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_ops_item_related_items_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_ops_item_related_items_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListOpsItemRelatedItems"
            ~service ~config:context.config ~input
            ~output_deserializer:list_ops_item_related_items_response_of_yojson
            ~error_deserializer
  end
module ListOpsMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsMetadataInvalidArgumentException") ->
              `OpsMetadataInvalidArgumentException
                (ops_metadata_invalid_argument_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_ops_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_ops_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListOpsMetadata"
            ~service ~config:context.config ~input
            ~output_deserializer:list_ops_metadata_result_of_yojson
            ~error_deserializer
  end
module ListResourceComplianceSummaries =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidFilter") ->
              `InvalidFilter (invalid_filter_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_resource_compliance_summaries_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_compliance_summaries_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMListResourceComplianceSummaries" ~service
            ~config:context.config ~input
            ~output_deserializer:list_resource_compliance_summaries_result_of_yojson
            ~error_deserializer
  end
module ListResourceDataSync =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidNextToken") ->
              `InvalidNextToken (invalid_next_token_of_yojson tree path)
          | (_, "ResourceDataSyncInvalidConfigurationException") ->
              `ResourceDataSyncInvalidConfigurationException
                (resource_data_sync_invalid_configuration_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resource_data_sync_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_data_sync_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListResourceDataSync"
            ~service ~config:context.config ~input
            ~output_deserializer:list_resource_data_sync_result_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "InvalidResourceType") ->
              `InvalidResourceType
                (invalid_resource_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMListTagsForResource"
            ~service ~config:context.config ~input
            ~output_deserializer:list_tags_for_resource_result_of_yojson
            ~error_deserializer
  end
module ModifyDocumentPermission =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DocumentLimitExceeded") ->
              `DocumentLimitExceeded
                (document_limit_exceeded_of_yojson tree path)
          | (_, "DocumentPermissionLimit") ->
              `DocumentPermissionLimit
                (document_permission_limit_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidPermissionType") ->
              `InvalidPermissionType
                (invalid_permission_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : modify_document_permission_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.modify_document_permission_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMModifyDocumentPermission" ~service
            ~config:context.config ~input
            ~output_deserializer:modify_document_permission_response_of_yojson
            ~error_deserializer
  end
module PutComplianceItems =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ComplianceTypeCountLimitExceededException") ->
              `ComplianceTypeCountLimitExceededException
                (compliance_type_count_limit_exceeded_exception_of_yojson
                   tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidItemContentException") ->
              `InvalidItemContentException
                (invalid_item_content_exception_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "InvalidResourceType") ->
              `InvalidResourceType
                (invalid_resource_type_of_yojson tree path)
          | (_, "ItemSizeLimitExceededException") ->
              `ItemSizeLimitExceededException
                (item_size_limit_exceeded_exception_of_yojson tree path)
          | (_, "TotalSizeLimitExceededException") ->
              `TotalSizeLimitExceededException
                (total_size_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_compliance_items_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_compliance_items_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMPutComplianceItems"
            ~service ~config:context.config ~input
            ~output_deserializer:put_compliance_items_result_of_yojson
            ~error_deserializer
  end
module PutInventory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CustomSchemaCountLimitExceededException") ->
              `CustomSchemaCountLimitExceededException
                (custom_schema_count_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidInventoryItemContextException") ->
              `InvalidInventoryItemContextException
                (invalid_inventory_item_context_exception_of_yojson tree path)
          | (_, "InvalidItemContentException") ->
              `InvalidItemContentException
                (invalid_item_content_exception_of_yojson tree path)
          | (_, "InvalidTypeNameException") ->
              `InvalidTypeNameException
                (invalid_type_name_exception_of_yojson tree path)
          | (_, "ItemContentMismatchException") ->
              `ItemContentMismatchException
                (item_content_mismatch_exception_of_yojson tree path)
          | (_, "ItemSizeLimitExceededException") ->
              `ItemSizeLimitExceededException
                (item_size_limit_exceeded_exception_of_yojson tree path)
          | (_, "SubTypeCountLimitExceededException") ->
              `SubTypeCountLimitExceededException
                (sub_type_count_limit_exceeded_exception_of_yojson tree path)
          | (_, "TotalSizeLimitExceededException") ->
              `TotalSizeLimitExceededException
                (total_size_limit_exceeded_exception_of_yojson tree path)
          | (_, "UnsupportedInventoryItemContextException") ->
              `UnsupportedInventoryItemContextException
                (unsupported_inventory_item_context_exception_of_yojson tree
                   path)
          | (_, "UnsupportedInventorySchemaVersionException") ->
              `UnsupportedInventorySchemaVersionException
                (unsupported_inventory_schema_version_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_inventory_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_inventory_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMPutInventory" ~service
            ~config:context.config ~input
            ~output_deserializer:put_inventory_result_of_yojson
            ~error_deserializer
  end
module PutParameter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "HierarchyLevelLimitExceededException") ->
              `HierarchyLevelLimitExceededException
                (hierarchy_level_limit_exceeded_exception_of_yojson tree path)
          | (_, "HierarchyTypeMismatchException") ->
              `HierarchyTypeMismatchException
                (hierarchy_type_mismatch_exception_of_yojson tree path)
          | (_, "IncompatiblePolicyException") ->
              `IncompatiblePolicyException
                (incompatible_policy_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAllowedPatternException") ->
              `InvalidAllowedPatternException
                (invalid_allowed_pattern_exception_of_yojson tree path)
          | (_, "InvalidKeyId") ->
              `InvalidKeyId (invalid_key_id_of_yojson tree path)
          | (_, "InvalidPolicyAttributeException") ->
              `InvalidPolicyAttributeException
                (invalid_policy_attribute_exception_of_yojson tree path)
          | (_, "InvalidPolicyTypeException") ->
              `InvalidPolicyTypeException
                (invalid_policy_type_exception_of_yojson tree path)
          | (_, "ParameterAlreadyExists") ->
              `ParameterAlreadyExists
                (parameter_already_exists_of_yojson tree path)
          | (_, "ParameterLimitExceeded") ->
              `ParameterLimitExceeded
                (parameter_limit_exceeded_of_yojson tree path)
          | (_, "ParameterMaxVersionLimitExceeded") ->
              `ParameterMaxVersionLimitExceeded
                (parameter_max_version_limit_exceeded_of_yojson tree path)
          | (_, "ParameterPatternMismatchException") ->
              `ParameterPatternMismatchException
                (parameter_pattern_mismatch_exception_of_yojson tree path)
          | (_, "PoliciesLimitExceededException") ->
              `PoliciesLimitExceededException
                (policies_limit_exceeded_exception_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | (_, "UnsupportedParameterType") ->
              `UnsupportedParameterType
                (unsupported_parameter_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_parameter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_parameter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMPutParameter" ~service
            ~config:context.config ~input
            ~output_deserializer:put_parameter_result_of_yojson
            ~error_deserializer
  end
module PutResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "MalformedResourcePolicyDocumentException") ->
              `MalformedResourcePolicyDocumentException
                (malformed_resource_policy_document_exception_of_yojson tree
                   path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourcePolicyConflictException") ->
              `ResourcePolicyConflictException
                (resource_policy_conflict_exception_of_yojson tree path)
          | (_, "ResourcePolicyInvalidParameterException") ->
              `ResourcePolicyInvalidParameterException
                (resource_policy_invalid_parameter_exception_of_yojson tree
                   path)
          | (_, "ResourcePolicyLimitExceededException") ->
              `ResourcePolicyLimitExceededException
                (resource_policy_limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourcePolicyNotFoundException") ->
              `ResourcePolicyNotFoundException
                (resource_policy_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_resource_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMPutResourcePolicy"
            ~service ~config:context.config ~input
            ~output_deserializer:put_resource_policy_response_of_yojson
            ~error_deserializer
  end
module RegisterDefaultPatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_default_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_default_patch_baseline_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMRegisterDefaultPatchBaseline" ~service
            ~config:context.config ~input
            ~output_deserializer:register_default_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module RegisterPatchBaselineForPatchGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AlreadyExistsException") ->
              `AlreadyExistsException
                (already_exists_exception_of_yojson tree path)
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "ResourceLimitExceededException") ->
              `ResourceLimitExceededException
                (resource_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : register_patch_baseline_for_patch_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_patch_baseline_for_patch_group_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMRegisterPatchBaselineForPatchGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:register_patch_baseline_for_patch_group_result_of_yojson
            ~error_deserializer
  end
module RegisterTargetWithMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceLimitExceededException") ->
              `ResourceLimitExceededException
                (resource_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : register_target_with_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_target_with_maintenance_window_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMRegisterTargetWithMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:register_target_with_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module RegisterTaskWithMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "FeatureNotAvailableException") ->
              `FeatureNotAvailableException
                (feature_not_available_exception_of_yojson tree path)
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceLimitExceededException") ->
              `ResourceLimitExceededException
                (resource_limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : register_task_with_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_task_with_maintenance_window_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMRegisterTaskWithMaintenanceWindow" ~service
            ~config:context.config ~input
            ~output_deserializer:register_task_with_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module RemoveTagsFromResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidResourceId") ->
              `InvalidResourceId (invalid_resource_id_of_yojson tree path)
          | (_, "InvalidResourceType") ->
              `InvalidResourceType
                (invalid_resource_type_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : remove_tags_from_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.remove_tags_from_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMRemoveTagsFromResource"
            ~service ~config:context.config ~input
            ~output_deserializer:remove_tags_from_resource_result_of_yojson
            ~error_deserializer
  end
module ResetServiceSetting =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ServiceSettingNotFound") ->
              `ServiceSettingNotFound
                (service_setting_not_found_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : reset_service_setting_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.reset_service_setting_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMResetServiceSetting"
            ~service ~config:context.config ~input
            ~output_deserializer:reset_service_setting_result_of_yojson
            ~error_deserializer
  end
module ResumeSession =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : resume_session_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.resume_session_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMResumeSession" ~service
            ~config:context.config ~input
            ~output_deserializer:resume_session_response_of_yojson
            ~error_deserializer
  end
module SendAutomationSignal =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AutomationExecutionNotFoundException") ->
              `AutomationExecutionNotFoundException
                (automation_execution_not_found_exception_of_yojson tree path)
          | (_, "AutomationStepNotFoundException") ->
              `AutomationStepNotFoundException
                (automation_step_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAutomationSignalException") ->
              `InvalidAutomationSignalException
                (invalid_automation_signal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : send_automation_signal_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.send_automation_signal_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMSendAutomationSignal"
            ~service ~config:context.config ~input
            ~output_deserializer:send_automation_signal_result_of_yojson
            ~error_deserializer
  end
module SendCommand =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DuplicateInstanceId") ->
              `DuplicateInstanceId
                (duplicate_instance_id_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "InvalidNotificationConfig") ->
              `InvalidNotificationConfig
                (invalid_notification_config_of_yojson tree path)
          | (_, "InvalidOutputFolder") ->
              `InvalidOutputFolder
                (invalid_output_folder_of_yojson tree path)
          | (_, "InvalidParameters") ->
              `InvalidParameters (invalid_parameters_of_yojson tree path)
          | (_, "InvalidRole") ->
              `InvalidRole (invalid_role_of_yojson tree path)
          | (_, "MaxDocumentSizeExceeded") ->
              `MaxDocumentSizeExceeded
                (max_document_size_exceeded_of_yojson tree path)
          | (_, "UnsupportedPlatformType") ->
              `UnsupportedPlatformType
                (unsupported_platform_type_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : send_command_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.send_command_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMSendCommand" ~service
            ~config:context.config ~input
            ~output_deserializer:send_command_result_of_yojson
            ~error_deserializer
  end
module StartAccessRequest =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_access_request_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_access_request_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMStartAccessRequest"
            ~service ~config:context.config ~input
            ~output_deserializer:start_access_request_response_of_yojson
            ~error_deserializer
  end
module StartAssociationsOnce =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "InvalidAssociation") ->
              `InvalidAssociation (invalid_association_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_associations_once_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_associations_once_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMStartAssociationsOnce"
            ~service ~config:context.config ~input
            ~output_deserializer:start_associations_once_result_of_yojson
            ~error_deserializer
  end
module StartAutomationExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AutomationDefinitionNotFoundException") ->
              `AutomationDefinitionNotFoundException
                (automation_definition_not_found_exception_of_yojson tree
                   path)
          | (_, "AutomationDefinitionVersionNotFoundException") ->
              `AutomationDefinitionVersionNotFoundException
                (automation_definition_version_not_found_exception_of_yojson
                   tree path)
          | (_, "AutomationExecutionLimitExceededException") ->
              `AutomationExecutionLimitExceededException
                (automation_execution_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAutomationExecutionParametersException") ->
              `InvalidAutomationExecutionParametersException
                (invalid_automation_execution_parameters_exception_of_yojson
                   tree path)
          | (_, "InvalidTarget") ->
              `InvalidTarget (invalid_target_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_automation_execution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_automation_execution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMStartAutomationExecution" ~service
            ~config:context.config ~input
            ~output_deserializer:start_automation_execution_result_of_yojson
            ~error_deserializer
  end
module StartChangeRequestExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AutomationDefinitionNotApprovedException") ->
              `AutomationDefinitionNotApprovedException
                (automation_definition_not_approved_exception_of_yojson tree
                   path)
          | (_, "AutomationDefinitionNotFoundException") ->
              `AutomationDefinitionNotFoundException
                (automation_definition_not_found_exception_of_yojson tree
                   path)
          | (_, "AutomationDefinitionVersionNotFoundException") ->
              `AutomationDefinitionVersionNotFoundException
                (automation_definition_version_not_found_exception_of_yojson
                   tree path)
          | (_, "AutomationExecutionLimitExceededException") ->
              `AutomationExecutionLimitExceededException
                (automation_execution_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAutomationExecutionParametersException") ->
              `InvalidAutomationExecutionParametersException
                (invalid_automation_execution_parameters_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_change_request_execution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_change_request_execution_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMStartChangeRequestExecution" ~service
            ~config:context.config ~input
            ~output_deserializer:start_change_request_execution_result_of_yojson
            ~error_deserializer
  end
module StartExecutionPreview =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_execution_preview_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_execution_preview_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMStartExecutionPreview"
            ~service ~config:context.config ~input
            ~output_deserializer:start_execution_preview_response_of_yojson
            ~error_deserializer
  end
module StartSession =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "TargetNotConnected") ->
              `TargetNotConnected (target_not_connected_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_session_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_session_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMStartSession" ~service
            ~config:context.config ~input
            ~output_deserializer:start_session_response_of_yojson
            ~error_deserializer
  end
module StopAutomationExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AutomationExecutionNotFoundException") ->
              `AutomationExecutionNotFoundException
                (automation_execution_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAutomationStatusUpdateException") ->
              `InvalidAutomationStatusUpdateException
                (invalid_automation_status_update_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_automation_execution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.stop_automation_execution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMStopAutomationExecution"
            ~service ~config:context.config ~input
            ~output_deserializer:stop_automation_execution_result_of_yojson
            ~error_deserializer
  end
module TerminateSession =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : terminate_session_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.terminate_session_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMTerminateSession"
            ~service ~config:context.config ~input
            ~output_deserializer:terminate_session_response_of_yojson
            ~error_deserializer
  end
module UnlabelParameterVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ParameterNotFound") ->
              `ParameterNotFound (parameter_not_found_of_yojson tree path)
          | (_, "ParameterVersionNotFound") ->
              `ParameterVersionNotFound
                (parameter_version_not_found_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unlabel_parameter_version_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.unlabel_parameter_version_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUnlabelParameterVersion"
            ~service ~config:context.config ~input
            ~output_deserializer:unlabel_parameter_version_result_of_yojson
            ~error_deserializer
  end
module UpdateAssociation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "AssociationVersionLimitExceeded") ->
              `AssociationVersionLimitExceeded
                (association_version_limit_exceeded_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidAssociationVersion") ->
              `InvalidAssociationVersion
                (invalid_association_version_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "InvalidOutputLocation") ->
              `InvalidOutputLocation
                (invalid_output_location_of_yojson tree path)
          | (_, "InvalidParameters") ->
              `InvalidParameters (invalid_parameters_of_yojson tree path)
          | (_, "InvalidSchedule") ->
              `InvalidSchedule (invalid_schedule_of_yojson tree path)
          | (_, "InvalidTarget") ->
              `InvalidTarget (invalid_target_of_yojson tree path)
          | (_, "InvalidTargetMaps") ->
              `InvalidTargetMaps (invalid_target_maps_of_yojson tree path)
          | (_, "InvalidUpdate") ->
              `InvalidUpdate (invalid_update_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_association_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_association_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateAssociation"
            ~service ~config:context.config ~input
            ~output_deserializer:update_association_result_of_yojson
            ~error_deserializer
  end
module UpdateAssociationStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AssociationDoesNotExist") ->
              `AssociationDoesNotExist
                (association_does_not_exist_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | (_, "StatusUnchanged") ->
              `StatusUnchanged (status_unchanged_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_association_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_association_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateAssociationStatus"
            ~service ~config:context.config ~input
            ~output_deserializer:update_association_status_result_of_yojson
            ~error_deserializer
  end
module UpdateDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DocumentVersionLimitExceeded") ->
              `DocumentVersionLimitExceeded
                (document_version_limit_exceeded_of_yojson tree path)
          | (_, "DuplicateDocumentContent") ->
              `DuplicateDocumentContent
                (duplicate_document_content_of_yojson tree path)
          | (_, "DuplicateDocumentVersionName") ->
              `DuplicateDocumentVersionName
                (duplicate_document_version_name_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentContent") ->
              `InvalidDocumentContent
                (invalid_document_content_of_yojson tree path)
          | (_, "InvalidDocumentOperation") ->
              `InvalidDocumentOperation
                (invalid_document_operation_of_yojson tree path)
          | (_, "InvalidDocumentSchemaVersion") ->
              `InvalidDocumentSchemaVersion
                (invalid_document_schema_version_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "MaxDocumentSizeExceeded") ->
              `MaxDocumentSizeExceeded
                (max_document_size_exceeded_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateDocument" ~service
            ~config:context.config ~input
            ~output_deserializer:update_document_result_of_yojson
            ~error_deserializer
  end
module UpdateDocumentDefaultVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentSchemaVersion") ->
              `InvalidDocumentSchemaVersion
                (invalid_document_schema_version_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_document_default_version_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_document_default_version_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMUpdateDocumentDefaultVersion" ~service
            ~config:context.config ~input
            ~output_deserializer:update_document_default_version_result_of_yojson
            ~error_deserializer
  end
module UpdateDocumentMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidDocument") ->
              `InvalidDocument (invalid_document_of_yojson tree path)
          | (_, "InvalidDocumentOperation") ->
              `InvalidDocumentOperation
                (invalid_document_operation_of_yojson tree path)
          | (_, "InvalidDocumentVersion") ->
              `InvalidDocumentVersion
                (invalid_document_version_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_document_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_document_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateDocumentMetadata"
            ~service ~config:context.config ~input
            ~output_deserializer:update_document_metadata_response_of_yojson
            ~error_deserializer
  end
module UpdateMaintenanceWindow =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_maintenance_window_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_maintenance_window_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateMaintenanceWindow"
            ~service ~config:context.config ~input
            ~output_deserializer:update_maintenance_window_result_of_yojson
            ~error_deserializer
  end
module UpdateMaintenanceWindowTarget =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_maintenance_window_target_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_maintenance_window_target_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMUpdateMaintenanceWindowTarget" ~service
            ~config:context.config ~input
            ~output_deserializer:update_maintenance_window_target_result_of_yojson
            ~error_deserializer
  end
module UpdateMaintenanceWindowTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_maintenance_window_task_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_maintenance_window_task_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMUpdateMaintenanceWindowTask" ~service
            ~config:context.config ~input
            ~output_deserializer:update_maintenance_window_task_result_of_yojson
            ~error_deserializer
  end
module UpdateManagedInstanceRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInstanceId") ->
              `InvalidInstanceId (invalid_instance_id_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_managed_instance_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_managed_instance_role_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AmazonSSMUpdateManagedInstanceRole" ~service
            ~config:context.config ~input
            ~output_deserializer:update_managed_instance_role_result_of_yojson
            ~error_deserializer
  end
module UpdateOpsItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsItemAccessDeniedException") ->
              `OpsItemAccessDeniedException
                (ops_item_access_denied_exception_of_yojson tree path)
          | (_, "OpsItemAlreadyExistsException") ->
              `OpsItemAlreadyExistsException
                (ops_item_already_exists_exception_of_yojson tree path)
          | (_, "OpsItemConflictException") ->
              `OpsItemConflictException
                (ops_item_conflict_exception_of_yojson tree path)
          | (_, "OpsItemInvalidParameterException") ->
              `OpsItemInvalidParameterException
                (ops_item_invalid_parameter_exception_of_yojson tree path)
          | (_, "OpsItemLimitExceededException") ->
              `OpsItemLimitExceededException
                (ops_item_limit_exceeded_exception_of_yojson tree path)
          | (_, "OpsItemNotFoundException") ->
              `OpsItemNotFoundException
                (ops_item_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_ops_item_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_ops_item_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateOpsItem" ~service
            ~config:context.config ~input
            ~output_deserializer:update_ops_item_response_of_yojson
            ~error_deserializer
  end
module UpdateOpsMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "OpsMetadataInvalidArgumentException") ->
              `OpsMetadataInvalidArgumentException
                (ops_metadata_invalid_argument_exception_of_yojson tree path)
          | (_, "OpsMetadataKeyLimitExceededException") ->
              `OpsMetadataKeyLimitExceededException
                (ops_metadata_key_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "OpsMetadataNotFoundException") ->
              `OpsMetadataNotFoundException
                (ops_metadata_not_found_exception_of_yojson tree path)
          | (_, "OpsMetadataTooManyUpdatesException") ->
              `OpsMetadataTooManyUpdatesException
                (ops_metadata_too_many_updates_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_ops_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_ops_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateOpsMetadata"
            ~service ~config:context.config ~input
            ~output_deserializer:update_ops_metadata_result_of_yojson
            ~error_deserializer
  end
module UpdatePatchBaseline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DoesNotExistException") ->
              `DoesNotExistException
                (does_not_exist_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_patch_baseline_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_patch_baseline_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdatePatchBaseline"
            ~service ~config:context.config ~input
            ~output_deserializer:update_patch_baseline_result_of_yojson
            ~error_deserializer
  end
module UpdateResourceDataSync =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceDataSyncConflictException") ->
              `ResourceDataSyncConflictException
                (resource_data_sync_conflict_exception_of_yojson tree path)
          | (_, "ResourceDataSyncInvalidConfigurationException") ->
              `ResourceDataSyncInvalidConfigurationException
                (resource_data_sync_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "ResourceDataSyncNotFoundException") ->
              `ResourceDataSyncNotFoundException
                (resource_data_sync_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_resource_data_sync_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_resource_data_sync_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateResourceDataSync"
            ~service ~config:context.config ~input
            ~output_deserializer:update_resource_data_sync_result_of_yojson
            ~error_deserializer
  end
module UpdateServiceSetting =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ServiceSettingNotFound") ->
              `ServiceSettingNotFound
                (service_setting_not_found_of_yojson tree path)
          | (_, "TooManyUpdates") ->
              `TooManyUpdates (too_many_updates_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_setting_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_setting_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AmazonSSMUpdateServiceSetting"
            ~service ~config:context.config ~input
            ~output_deserializer:update_service_setting_result_of_yojson
            ~error_deserializer
  end