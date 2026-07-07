open Types

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
