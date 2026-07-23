open Types

val make_associate_entity_to_thing_response : unit -> unit

val make_associate_entity_to_thing_request :
  ?namespace_version:version ->
  thing_name:thing_name ->
  entity_id:urn ->
  unit ->
  associate_entity_to_thing_request

val make_flow_template_summary :
  ?id:urn ->
  ?arn:arn ->
  ?revision_number:version ->
  ?created_at:timestamp ->
  unit ->
  flow_template_summary

val make_create_flow_template_response :
  ?summary:flow_template_summary -> unit -> create_flow_template_response

val make_definition_document :
  language:definition_language -> text:definition_text -> unit -> definition_document

val make_create_flow_template_request :
  ?compatible_namespace_version:version ->
  definition:definition_document ->
  unit ->
  create_flow_template_request

val make_system_instance_summary :
  ?id:urn ->
  ?arn:arn ->
  ?status:system_instance_deployment_status ->
  ?target:deployment_target ->
  ?greengrass_group_name:group_name ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?greengrass_group_id:greengrass_group_id ->
  ?greengrass_group_version_id:greengrass_group_version_id ->
  unit ->
  system_instance_summary

val make_create_system_instance_response :
  ?summary:system_instance_summary -> unit -> create_system_instance_response

val make_metrics_configuration :
  ?cloud_metric_enabled:enabled -> ?metric_rule_role_arn:role_arn -> unit -> metrics_configuration

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_system_instance_request :
  ?tags:tag_list ->
  ?greengrass_group_name:group_name ->
  ?s3_bucket_name:s3_bucket_name ->
  ?metrics_configuration:metrics_configuration ->
  ?flow_actions_role_arn:role_arn ->
  definition:definition_document ->
  target:deployment_target ->
  unit ->
  create_system_instance_request

val make_system_template_summary :
  ?id:urn ->
  ?arn:arn ->
  ?revision_number:version ->
  ?created_at:timestamp ->
  unit ->
  system_template_summary

val make_create_system_template_response :
  ?summary:system_template_summary -> unit -> create_system_template_response

val make_create_system_template_request :
  ?compatible_namespace_version:version ->
  definition:definition_document ->
  unit ->
  create_system_template_request

val make_delete_flow_template_response : unit -> unit
val make_delete_flow_template_request : id:urn -> unit -> delete_flow_template_request

val make_delete_namespace_response :
  ?namespace_arn:arn -> ?namespace_name:namespace_name -> unit -> delete_namespace_response

val make_delete_namespace_request : unit -> unit
val make_delete_system_instance_response : unit -> unit
val make_delete_system_instance_request : ?id:urn -> unit -> delete_system_instance_request
val make_delete_system_template_response : unit -> unit
val make_delete_system_template_request : id:urn -> unit -> delete_system_template_request
val make_dependency_revision : ?id:urn -> ?revision_number:version -> unit -> dependency_revision

val make_deploy_system_instance_response :
  ?greengrass_deployment_id:greengrass_deployment_id ->
  summary:system_instance_summary ->
  unit ->
  deploy_system_instance_response

val make_deploy_system_instance_request : ?id:urn -> unit -> deploy_system_instance_request
val make_deprecate_flow_template_response : unit -> unit
val make_deprecate_flow_template_request : id:urn -> unit -> deprecate_flow_template_request
val make_deprecate_system_template_response : unit -> unit
val make_deprecate_system_template_request : id:urn -> unit -> deprecate_system_template_request

val make_describe_namespace_response :
  ?namespace_arn:arn ->
  ?namespace_name:namespace_name ->
  ?tracking_namespace_name:namespace_name ->
  ?tracking_namespace_version:version ->
  ?namespace_version:version ->
  unit ->
  describe_namespace_response

val make_describe_namespace_request :
  ?namespace_name:namespace_name -> unit -> describe_namespace_request

val make_dissociate_entity_from_thing_response : unit -> unit

val make_dissociate_entity_from_thing_request :
  thing_name:thing_name -> entity_type:entity_type -> unit -> dissociate_entity_from_thing_request

val make_entity_description :
  ?id:urn ->
  ?arn:arn ->
  ?type_:entity_type ->
  ?created_at:timestamp ->
  ?definition:definition_document ->
  unit ->
  entity_description

val make_entity_filter :
  ?name:entity_filter_name -> ?value:entity_filter_values -> unit -> entity_filter

val make_flow_execution_message :
  ?message_id:flow_execution_message_id ->
  ?event_type:flow_execution_event_type ->
  ?timestamp:timestamp ->
  ?payload:flow_execution_message_payload ->
  unit ->
  flow_execution_message

val make_flow_execution_summary :
  ?flow_execution_id:flow_execution_id ->
  ?status:flow_execution_status ->
  ?system_instance_id:urn ->
  ?flow_template_id:urn ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  flow_execution_summary

val make_flow_template_description :
  ?summary:flow_template_summary ->
  ?definition:definition_document ->
  ?validated_namespace_version:version ->
  unit ->
  flow_template_description

val make_flow_template_filter :
  name:flow_template_filter_name ->
  value:flow_template_filter_values ->
  unit ->
  flow_template_filter

val make_get_entities_response : ?descriptions:entity_descriptions -> unit -> get_entities_response

val make_get_entities_request :
  ?namespace_version:version -> ids:urns -> unit -> get_entities_request

val make_get_flow_template_response :
  ?description:flow_template_description -> unit -> get_flow_template_response

val make_get_flow_template_request :
  ?revision_number:version -> id:urn -> unit -> get_flow_template_request

val make_get_flow_template_revisions_response :
  ?summaries:flow_template_summaries ->
  ?next_token:next_token ->
  unit ->
  get_flow_template_revisions_response

val make_get_flow_template_revisions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  id:urn ->
  unit ->
  get_flow_template_revisions_request

val make_get_namespace_deletion_status_response :
  ?namespace_arn:arn ->
  ?namespace_name:namespace_name ->
  ?status:namespace_deletion_status ->
  ?error_code:namespace_deletion_status_error_codes ->
  ?error_message:string_ ->
  unit ->
  get_namespace_deletion_status_response

val make_get_namespace_deletion_status_request : unit -> unit

val make_system_instance_description :
  ?summary:system_instance_summary ->
  ?definition:definition_document ->
  ?s3_bucket_name:s3_bucket_name ->
  ?metrics_configuration:metrics_configuration ->
  ?validated_namespace_version:version ->
  ?validated_dependency_revisions:dependency_revisions ->
  ?flow_actions_role_arn:role_arn ->
  unit ->
  system_instance_description

val make_get_system_instance_response :
  ?description:system_instance_description -> unit -> get_system_instance_response

val make_get_system_instance_request : id:urn -> unit -> get_system_instance_request

val make_system_template_description :
  ?summary:system_template_summary ->
  ?definition:definition_document ->
  ?validated_namespace_version:version ->
  unit ->
  system_template_description

val make_get_system_template_response :
  ?description:system_template_description -> unit -> get_system_template_response

val make_get_system_template_request :
  ?revision_number:version -> id:urn -> unit -> get_system_template_request

val make_get_system_template_revisions_response :
  ?summaries:system_template_summaries ->
  ?next_token:next_token ->
  unit ->
  get_system_template_revisions_response

val make_get_system_template_revisions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  id:urn ->
  unit ->
  get_system_template_revisions_request

val make_get_upload_status_response :
  ?namespace_arn:arn ->
  ?namespace_name:namespace_name ->
  ?namespace_version:version ->
  ?failure_reason:string_list ->
  upload_id:upload_id ->
  upload_status:upload_status ->
  created_date:timestamp ->
  unit ->
  get_upload_status_response

val make_get_upload_status_request : upload_id:upload_id -> unit -> get_upload_status_request

val make_upload_entity_definitions_response :
  upload_id:upload_id -> unit -> upload_entity_definitions_response

val make_upload_entity_definitions_request :
  ?document:definition_document ->
  ?sync_with_public_namespace:sync_with_public_namespace ->
  ?deprecate_existing_entities:deprecate_existing_entities ->
  unit ->
  upload_entity_definitions_request

val make_update_system_template_response :
  ?summary:system_template_summary -> unit -> update_system_template_response

val make_update_system_template_request :
  ?compatible_namespace_version:version ->
  id:urn ->
  definition:definition_document ->
  unit ->
  update_system_template_request

val make_update_flow_template_response :
  ?summary:flow_template_summary -> unit -> update_flow_template_response

val make_update_flow_template_request :
  ?compatible_namespace_version:version ->
  id:urn ->
  definition:definition_document ->
  unit ->
  update_flow_template_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_undeploy_system_instance_response :
  ?summary:system_instance_summary -> unit -> undeploy_system_instance_response

val make_undeploy_system_instance_request : ?id:urn -> unit -> undeploy_system_instance_request
val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_thing : ?thing_arn:thing_arn -> ?thing_name:thing_name -> unit -> thing

val make_search_things_response :
  ?things:things -> ?next_token:next_token -> unit -> search_things_response

val make_search_things_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?namespace_version:version ->
  entity_id:urn ->
  unit ->
  search_things_request

val make_search_system_templates_response :
  ?summaries:system_template_summaries ->
  ?next_token:next_token ->
  unit ->
  search_system_templates_response

val make_system_template_filter :
  name:system_template_filter_name ->
  value:system_template_filter_values ->
  unit ->
  system_template_filter

val make_search_system_templates_request :
  ?filters:system_template_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  search_system_templates_request

val make_search_system_instances_response :
  ?summaries:system_instance_summaries ->
  ?next_token:next_token ->
  unit ->
  search_system_instances_response

val make_system_instance_filter :
  ?name:system_instance_filter_name ->
  ?value:system_instance_filter_values ->
  unit ->
  system_instance_filter

val make_search_system_instances_request :
  ?filters:system_instance_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  search_system_instances_request

val make_search_flow_templates_response :
  ?summaries:flow_template_summaries ->
  ?next_token:next_token ->
  unit ->
  search_flow_templates_response

val make_search_flow_templates_request :
  ?filters:flow_template_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  search_flow_templates_request

val make_search_flow_executions_response :
  ?summaries:flow_execution_summaries ->
  ?next_token:next_token ->
  unit ->
  search_flow_executions_response

val make_search_flow_executions_request :
  ?flow_execution_id:flow_execution_id ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  system_instance_id:urn ->
  unit ->
  search_flow_executions_request

val make_search_entities_response :
  ?descriptions:entity_descriptions -> ?next_token:next_token -> unit -> search_entities_response

val make_search_entities_request :
  ?filters:entity_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?namespace_version:version ->
  entity_types:entity_types ->
  unit ->
  search_entities_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_list_flow_execution_messages_response :
  ?messages:flow_execution_messages ->
  ?next_token:next_token ->
  unit ->
  list_flow_execution_messages_response

val make_list_flow_execution_messages_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  flow_execution_id:flow_execution_id ->
  unit ->
  list_flow_execution_messages_request
