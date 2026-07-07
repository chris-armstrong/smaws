(** IoTThingsGraph client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_upload_entity_definitions_response :
  upload_id:upload_id -> unit -> upload_entity_definitions_response

val make_definition_document :
  text:definition_text -> language:definition_language -> unit -> definition_document

val make_upload_entity_definitions_request :
  ?deprecate_existing_entities:deprecate_existing_entities ->
  ?sync_with_public_namespace:sync_with_public_namespace ->
  ?document:definition_document ->
  unit ->
  upload_entity_definitions_request

val make_system_template_summary :
  ?created_at:timestamp ->
  ?revision_number:version ->
  ?arn:arn ->
  ?id:urn ->
  unit ->
  system_template_summary

val make_update_system_template_response :
  ?summary:system_template_summary -> unit -> update_system_template_response

val make_update_system_template_request :
  ?compatible_namespace_version:version ->
  definition:definition_document ->
  id:urn ->
  unit ->
  update_system_template_request

val make_flow_template_summary :
  ?created_at:timestamp ->
  ?revision_number:version ->
  ?arn:arn ->
  ?id:urn ->
  unit ->
  flow_template_summary

val make_update_flow_template_response :
  ?summary:flow_template_summary -> unit -> update_flow_template_response

val make_update_flow_template_request :
  ?compatible_namespace_version:version ->
  definition:definition_document ->
  id:urn ->
  unit ->
  update_flow_template_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_system_instance_summary :
  ?greengrass_group_version_id:greengrass_group_version_id ->
  ?greengrass_group_id:greengrass_group_id ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?greengrass_group_name:group_name ->
  ?target:deployment_target ->
  ?status:system_instance_deployment_status ->
  ?arn:arn ->
  ?id:urn ->
  unit ->
  system_instance_summary

val make_undeploy_system_instance_response :
  ?summary:system_instance_summary -> unit -> undeploy_system_instance_response

val make_undeploy_system_instance_request : ?id:urn -> unit -> undeploy_system_instance_request
val make_thing : ?thing_name:thing_name -> ?thing_arn:thing_arn -> unit -> thing
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_system_template_filter :
  value:system_template_filter_values ->
  name:system_template_filter_name ->
  unit ->
  system_template_filter

val make_system_template_description :
  ?validated_namespace_version:version ->
  ?definition:definition_document ->
  ?summary:system_template_summary ->
  unit ->
  system_template_description

val make_system_instance_filter :
  ?value:system_instance_filter_values ->
  ?name:system_instance_filter_name ->
  unit ->
  system_instance_filter

val make_metrics_configuration :
  ?metric_rule_role_arn:role_arn -> ?cloud_metric_enabled:enabled -> unit -> metrics_configuration

val make_dependency_revision : ?revision_number:version -> ?id:urn -> unit -> dependency_revision

val make_system_instance_description :
  ?flow_actions_role_arn:role_arn ->
  ?validated_dependency_revisions:dependency_revisions ->
  ?validated_namespace_version:version ->
  ?metrics_configuration:metrics_configuration ->
  ?s3_bucket_name:s3_bucket_name ->
  ?definition:definition_document ->
  ?summary:system_instance_summary ->
  unit ->
  system_instance_description

val make_search_things_response :
  ?next_token:next_token -> ?things:things -> unit -> search_things_response

val make_search_things_request :
  ?namespace_version:version ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  entity_id:urn ->
  unit ->
  search_things_request

val make_search_system_templates_response :
  ?next_token:next_token ->
  ?summaries:system_template_summaries ->
  unit ->
  search_system_templates_response

val make_search_system_templates_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:system_template_filters ->
  unit ->
  search_system_templates_request

val make_search_system_instances_response :
  ?next_token:next_token ->
  ?summaries:system_instance_summaries ->
  unit ->
  search_system_instances_response

val make_search_system_instances_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:system_instance_filters ->
  unit ->
  search_system_instances_request

val make_search_flow_templates_response :
  ?next_token:next_token ->
  ?summaries:flow_template_summaries ->
  unit ->
  search_flow_templates_response

val make_flow_template_filter :
  value:flow_template_filter_values ->
  name:flow_template_filter_name ->
  unit ->
  flow_template_filter

val make_search_flow_templates_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:flow_template_filters ->
  unit ->
  search_flow_templates_request

val make_flow_execution_summary :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?flow_template_id:urn ->
  ?system_instance_id:urn ->
  ?status:flow_execution_status ->
  ?flow_execution_id:flow_execution_id ->
  unit ->
  flow_execution_summary

val make_search_flow_executions_response :
  ?next_token:next_token ->
  ?summaries:flow_execution_summaries ->
  unit ->
  search_flow_executions_response

val make_search_flow_executions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?flow_execution_id:flow_execution_id ->
  system_instance_id:urn ->
  unit ->
  search_flow_executions_request

val make_entity_description :
  ?definition:definition_document ->
  ?created_at:timestamp ->
  ?type_:entity_type ->
  ?arn:arn ->
  ?id:urn ->
  unit ->
  entity_description

val make_search_entities_response :
  ?next_token:next_token -> ?descriptions:entity_descriptions -> unit -> search_entities_response

val make_entity_filter :
  ?value:entity_filter_values -> ?name:entity_filter_name -> unit -> entity_filter

val make_search_entities_request :
  ?namespace_version:version ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:entity_filters ->
  entity_types:entity_types ->
  unit ->
  search_entities_request

val make_list_tags_for_resource_response :
  ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_flow_execution_message :
  ?payload:flow_execution_message_payload ->
  ?timestamp:timestamp ->
  ?event_type:flow_execution_event_type ->
  ?message_id:flow_execution_message_id ->
  unit ->
  flow_execution_message

val make_list_flow_execution_messages_response :
  ?next_token:next_token ->
  ?messages:flow_execution_messages ->
  unit ->
  list_flow_execution_messages_response

val make_list_flow_execution_messages_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  flow_execution_id:flow_execution_id ->
  unit ->
  list_flow_execution_messages_request

val make_get_upload_status_response :
  ?failure_reason:string_list ->
  ?namespace_version:version ->
  ?namespace_name:namespace_name ->
  ?namespace_arn:arn ->
  created_date:timestamp ->
  upload_status:upload_status ->
  upload_id:upload_id ->
  unit ->
  get_upload_status_response

val make_get_upload_status_request : upload_id:upload_id -> unit -> get_upload_status_request

val make_get_system_template_revisions_response :
  ?next_token:next_token ->
  ?summaries:system_template_summaries ->
  unit ->
  get_system_template_revisions_response

val make_get_system_template_revisions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  id:urn ->
  unit ->
  get_system_template_revisions_request

val make_get_system_template_response :
  ?description:system_template_description -> unit -> get_system_template_response

val make_get_system_template_request :
  ?revision_number:version -> id:urn -> unit -> get_system_template_request

val make_get_system_instance_response :
  ?description:system_instance_description -> unit -> get_system_instance_response

val make_get_system_instance_request : id:urn -> unit -> get_system_instance_request

val make_get_namespace_deletion_status_response :
  ?error_message:string_ ->
  ?error_code:namespace_deletion_status_error_codes ->
  ?status:namespace_deletion_status ->
  ?namespace_name:namespace_name ->
  ?namespace_arn:arn ->
  unit ->
  get_namespace_deletion_status_response

val make_get_namespace_deletion_status_request : unit -> unit

val make_get_flow_template_revisions_response :
  ?next_token:next_token ->
  ?summaries:flow_template_summaries ->
  unit ->
  get_flow_template_revisions_response

val make_get_flow_template_revisions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  id:urn ->
  unit ->
  get_flow_template_revisions_request

val make_flow_template_description :
  ?validated_namespace_version:version ->
  ?definition:definition_document ->
  ?summary:flow_template_summary ->
  unit ->
  flow_template_description

val make_get_flow_template_response :
  ?description:flow_template_description -> unit -> get_flow_template_response

val make_get_flow_template_request :
  ?revision_number:version -> id:urn -> unit -> get_flow_template_request

val make_get_entities_response : ?descriptions:entity_descriptions -> unit -> get_entities_response

val make_get_entities_request :
  ?namespace_version:version -> ids:urns -> unit -> get_entities_request

val make_dissociate_entity_from_thing_response : unit -> unit

val make_dissociate_entity_from_thing_request :
  entity_type:entity_type -> thing_name:thing_name -> unit -> dissociate_entity_from_thing_request

val make_describe_namespace_response :
  ?namespace_version:version ->
  ?tracking_namespace_version:version ->
  ?tracking_namespace_name:namespace_name ->
  ?namespace_name:namespace_name ->
  ?namespace_arn:arn ->
  unit ->
  describe_namespace_response

val make_describe_namespace_request :
  ?namespace_name:namespace_name -> unit -> describe_namespace_request

val make_deprecate_system_template_response : unit -> unit
val make_deprecate_system_template_request : id:urn -> unit -> deprecate_system_template_request
val make_deprecate_flow_template_response : unit -> unit
val make_deprecate_flow_template_request : id:urn -> unit -> deprecate_flow_template_request

val make_deploy_system_instance_response :
  ?greengrass_deployment_id:greengrass_deployment_id ->
  summary:system_instance_summary ->
  unit ->
  deploy_system_instance_response

val make_deploy_system_instance_request : ?id:urn -> unit -> deploy_system_instance_request
val make_delete_system_template_response : unit -> unit
val make_delete_system_template_request : id:urn -> unit -> delete_system_template_request
val make_delete_system_instance_response : unit -> unit
val make_delete_system_instance_request : ?id:urn -> unit -> delete_system_instance_request

val make_delete_namespace_response :
  ?namespace_name:namespace_name -> ?namespace_arn:arn -> unit -> delete_namespace_response

val make_delete_namespace_request : unit -> unit
val make_delete_flow_template_response : unit -> unit
val make_delete_flow_template_request : id:urn -> unit -> delete_flow_template_request

val make_create_system_template_response :
  ?summary:system_template_summary -> unit -> create_system_template_response

val make_create_system_template_request :
  ?compatible_namespace_version:version ->
  definition:definition_document ->
  unit ->
  create_system_template_request

val make_create_system_instance_response :
  ?summary:system_instance_summary -> unit -> create_system_instance_response

val make_create_system_instance_request :
  ?flow_actions_role_arn:role_arn ->
  ?metrics_configuration:metrics_configuration ->
  ?s3_bucket_name:s3_bucket_name ->
  ?greengrass_group_name:group_name ->
  ?tags:tag_list ->
  target:deployment_target ->
  definition:definition_document ->
  unit ->
  create_system_instance_request

val make_create_flow_template_response :
  ?summary:flow_template_summary -> unit -> create_flow_template_response

val make_create_flow_template_request :
  ?compatible_namespace_version:version ->
  definition:definition_document ->
  unit ->
  create_flow_template_request

val make_associate_entity_to_thing_response : unit -> unit

val make_associate_entity_to_thing_request :
  ?namespace_version:version ->
  entity_id:urn ->
  thing_name:thing_name ->
  unit ->
  associate_entity_to_thing_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
