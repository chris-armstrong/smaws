open Types

module ListFlowExecutionMessages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flow_execution_messages_request ->
    ( list_flow_execution_messages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flow_execution_messages_request ->
    ( list_flow_execution_messages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of objects that contain information about events in a flow execution.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags on an AWS IoT Things Graph resource.\n"]

module SearchEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_entities_request ->
    ( search_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_entities_request ->
    ( search_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for entities of the specified type. You can search for entities in your namespace and \
   the public namespace that you're tracking.\n"]

module SearchFlowExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_flow_executions_request ->
    ( search_flow_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_flow_executions_request ->
    ( search_flow_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Searches for AWS IoT Things Graph workflow execution instances.\n"]

module SearchFlowTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_flow_templates_request ->
    ( search_flow_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_flow_templates_request ->
    ( search_flow_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Searches for summary information about workflows.\n"]

module SearchSystemInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_system_instances_request ->
    ( search_system_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_system_instances_request ->
    ( search_system_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Searches for system instances in the user's account.\n"]

module SearchSystemTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_system_templates_request ->
    ( search_system_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_system_templates_request ->
    ( search_system_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for summary information about systems in the user's account. You can filter by the ID \
   of a workflow to return only systems that use the specified workflow.\n"]

module SearchThings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_things_request ->
    ( search_things_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_things_request ->
    ( search_things_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for things associated with the specified entity. You can search by both device and \
   device model.\n\n\
  \ For example, if two different devices, camera1 and camera2, implement the camera device model, \
   the user can associate thing1 to camera1 and thing2 to camera2. [SearchThings(camera2)] will \
   return only thing2, but [SearchThings(camera)] will return both thing1 and thing2.\n\
  \ \n\
  \  This action searches for exact matches and doesn't perform partial text matching.\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a tag for the specified resource.\n"]

module UndeploySystemInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    undeploy_system_instance_request ->
    ( undeploy_system_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    undeploy_system_instance_request ->
    ( undeploy_system_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a system instance from its target (Cloud or Greengrass).\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a tag from the specified resource.\n"]

module UpdateFlowTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_flow_template_request ->
    ( update_flow_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_flow_template_request ->
    ( update_flow_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified workflow. All deployed systems and system instances that use the workflow \
   will see the changes in the flow when it is redeployed. If you don't want this behavior, copy \
   the workflow (creating a new workflow with a different ID), and update the copy. The workflow \
   can contain only entities in the specified namespace. \n"]

module UpdateSystemTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_system_template_request ->
    ( update_system_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_system_template_request ->
    ( update_system_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified system. You don't need to run this action after updating a workflow. Any \
   deployment that uses the system will see the changes in the system when it is redeployed.\n"]

module UploadEntityDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upload_entity_definitions_request ->
    ( upload_entity_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upload_entity_definitions_request ->
    ( upload_entity_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Asynchronously uploads one or more entity definitions to the user's namespace. The [document] \
   parameter is required if [syncWithPublicNamespace] and [deleteExistingEntites] are false. If \
   the [syncWithPublicNamespace] parameter is set to [true], the user's namespace will synchronize \
   with the latest version of the public namespace. If [deprecateExistingEntities] is set to true, \
   all entities in the latest version will be deleted before the new [DefinitionDocument] is \
   uploaded.\n\n\
  \ When a user uploads entity definitions for the first time, the service creates a new namespace \
   for the user. The new namespace tracks the public namespace. Currently users can have only one \
   namespace. The namespace version increments whenever a user uploads entity definitions that are \
   backwards-incompatible and whenever a user sets the [syncWithPublicNamespace] parameter or the \
   [deprecateExistingEntities] parameter to [true].\n\
  \ \n\
  \  The IDs for all of the entities should be in URN format. Each entity must be in the user's \
   namespace. Users can't create entities in the public namespace, but entity definitions can \
   refer to entities in the public namespace.\n\
  \  \n\
  \   Valid entities are [Device], [DeviceModel], [Service], [Capability], [State], [Action], \
   [Event], [Property], [Mapping], [Enum]. \n\
  \   "]

module GetUploadStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_upload_status_request ->
    ( get_upload_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_upload_status_request ->
    ( get_upload_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the status of the specified upload.\n"]

module GetSystemTemplateRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_system_template_revisions_request ->
    ( get_system_template_revisions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_system_template_revisions_request ->
    ( get_system_template_revisions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets revisions made to the specified system template. Only the previous 100 revisions are \
   stored. If the system has been deprecated, this action will return the revisions that occurred \
   before its deprecation. This action won't work with systems that have been deleted.\n"]

module GetSystemTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_system_template_request ->
    ( get_system_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_system_template_request ->
    ( get_system_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a system.\n"]

module GetSystemInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_system_instance_request ->
    ( get_system_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_system_instance_request ->
    ( get_system_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a system instance.\n"]

module GetNamespaceDeletionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_namespace_deletion_status_request ->
    ( get_namespace_deletion_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_namespace_deletion_status_request ->
    ( get_namespace_deletion_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the status of a namespace deletion task.\n"]

module GetFlowTemplateRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_flow_template_revisions_request ->
    ( get_flow_template_revisions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_flow_template_revisions_request ->
    ( get_flow_template_revisions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets revisions of the specified workflow. Only the last 100 revisions are stored. If the \
   workflow has been deprecated, this action will return revisions that occurred before the \
   deprecation. This action won't work for workflows that have been deleted.\n"]

module GetFlowTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_flow_template_request ->
    ( get_flow_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_flow_template_request ->
    ( get_flow_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the latest version of the [DefinitionDocument] and [FlowTemplateSummary] for the specified \
   workflow.\n"]

module GetEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_entities_request ->
    ( get_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_entities_request ->
    ( get_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets definitions of the specified entities. Uses the latest version of the user's namespace by \
   default. This API returns the following TDM entities.\n\n\
  \ {ul\n\
  \       {-  Properties\n\
  \           \n\
  \            }\n\
  \       {-  States\n\
  \           \n\
  \            }\n\
  \       {-  Events\n\
  \           \n\
  \            }\n\
  \       {-  Actions\n\
  \           \n\
  \            }\n\
  \       {-  Capabilities\n\
  \           \n\
  \            }\n\
  \       {-  Mappings\n\
  \           \n\
  \            }\n\
  \       {-  Devices\n\
  \           \n\
  \            }\n\
  \       {-  Device Models\n\
  \           \n\
  \            }\n\
  \       {-  Services\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   This action doesn't return definitions for systems, flows, and deployments.\n\
  \   "]

module DissociateEntityFromThing : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    dissociate_entity_from_thing_request ->
    ( dissociate_entity_from_thing_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    dissociate_entity_from_thing_request ->
    ( dissociate_entity_from_thing_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Dissociates a device entity from a concrete thing. The action takes only the type of the entity \
   that you need to dissociate because only one entity of a particular type can be associated with \
   a thing.\n"]

module DescribeNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_namespace_request ->
    ( describe_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_namespace_request ->
    ( describe_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the latest version of the user's namespace and the public version that it is tracking.\n"]

module DeprecateSystemTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deprecate_system_template_request ->
    ( deprecate_system_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deprecate_system_template_request ->
    ( deprecate_system_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deprecates the specified system.\n"]

module DeprecateFlowTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deprecate_flow_template_request ->
    ( deprecate_flow_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deprecate_flow_template_request ->
    ( deprecate_flow_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deprecates the specified workflow. This action marks the workflow for deletion. Deprecated \
   flows can't be deployed, but existing deployments will continue to run.\n"]

module DeploySystemInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deploy_system_instance_request ->
    ( deploy_system_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deploy_system_instance_request ->
    ( deploy_system_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b Greengrass and Cloud Deployments} \n\n\
  \ Deploys the system instance to the target specified in [CreateSystemInstance]. \n\
  \ \n\
  \   {b Greengrass Deployments} \n\
  \  \n\
  \   If the system or any workflows and entities have been updated before this action is called, \
   then the deployment will create a new Amazon Simple Storage Service resource file and then \
   deploy it.\n\
  \   \n\
  \    Since this action creates a Greengrass deployment on the caller's behalf, the calling \
   identity must have write permissions to the specified Greengrass group. Otherwise, the call \
   will fail with an authorization error.\n\
  \    \n\
  \     For information about the artifacts that get added to your Greengrass core device when you \
   use this API, see \
   {{:https://docs.aws.amazon.com/thingsgraph/latest/ug/iot-tg-greengrass.html}AWS IoT Things \
   Graph and AWS IoT Greengrass}.\n\
  \     "]

module DeleteSystemTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_system_template_request ->
    ( delete_system_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_system_template_request ->
    ( delete_system_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a system. New deployments can't contain the system after its deletion. Existing \
   deployments that contain the system will continue to work because they use a snapshot of the \
   system that is taken when it is deployed.\n"]

module DeleteSystemInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_system_instance_request ->
    ( delete_system_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_system_instance_request ->
    ( delete_system_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a system instance. Only system instances that have never been deployed, or that have \
   been undeployed can be deleted.\n\n\
  \ Users can create a new system instance that has the same ID as a deleted system instance.\n\
  \ "]

module DeleteNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified namespace. This action deletes all of the entities in the namespace. \
   Delete the systems and flows that use entities in the namespace before performing this action. \
   This action takes no request parameters.\n"]

module DeleteFlowTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_flow_template_request ->
    ( delete_flow_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_flow_template_request ->
    ( delete_flow_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a workflow. Any new system or deployment that contains this workflow will fail to \
   update or deploy. Existing deployments that contain the workflow will continue to run (since \
   they use a snapshot of the workflow taken at the time of deployment).\n"]

module CreateSystemTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_system_template_request ->
    ( create_system_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_system_template_request ->
    ( create_system_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a system. The system is validated against the entities in the latest version of the \
   user's namespace unless another namespace version is specified in the request.\n"]

module CreateSystemInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_system_instance_request ->
    ( create_system_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_system_instance_request ->
    ( create_system_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a system instance. \n\n\
  \ This action validates the system instance, prepares the deployment-related resources. For \
   Greengrass deployments, it updates the Greengrass group that is specified by the \
   [greengrassGroupName] parameter. It also adds a file to the S3 bucket specified by the \
   [s3BucketName] parameter. You need to call [DeploySystemInstance] after running this action.\n\
  \ \n\
  \  For Greengrass deployments, since this action modifies and adds resources to a Greengrass \
   group and an S3 bucket on the caller's behalf, the calling identity must have write permissions \
   to both the specified Greengrass group and S3 bucket. Otherwise, the call will fail with an \
   authorization error.\n\
  \  \n\
  \   For cloud deployments, this action requires a [flowActionsRoleArn] value. This is an IAM \
   role that has permissions to access AWS services, such as AWS Lambda and AWS IoT, that the flow \
   uses when it executes.\n\
  \   \n\
  \    If the definition document doesn't specify a version of the user's namespace, the latest \
   version will be used by default.\n\
  \    "]

module CreateFlowTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_flow_template_request ->
    ( create_flow_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_flow_template_request ->
    ( create_flow_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a workflow template. Workflows can be created only in the user's namespace. (The public \
   namespace contains only entities.) The workflow can contain only entities in the specified \
   namespace. The workflow is validated against the entities in the latest version of the user's \
   namespace unless another namespace version is specified in the request.\n"]

module AssociateEntityToThing : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalFailureException of internal_failure_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_entity_to_thing_request ->
    ( associate_entity_to_thing_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_entity_to_thing_request ->
    ( associate_entity_to_thing_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalFailureException of internal_failure_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a device with a concrete thing that is in the user's registry.\n\n\
  \ A thing can be associated with only one device at a time. If you associate a thing with a new \
   device id, its previous association will be removed.\n\
  \ "]
