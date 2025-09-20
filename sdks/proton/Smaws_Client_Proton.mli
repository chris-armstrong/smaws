(** Proton client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_template_sync_config :
  ?subdirectory:subdirectory ->
  branch:git_branch_name ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:resource_name ->
  unit ->
  template_sync_config

val make_update_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> update_template_sync_config_output

val make_update_template_sync_config_input :
  ?subdirectory:subdirectory ->
  branch:git_branch_name ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:resource_name ->
  unit ->
  update_template_sync_config_input

val make_compatible_environment_template :
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  compatible_environment_template

val make_service_template_version :
  ?supported_component_sources:service_template_supported_component_source_input_list ->
  ?schema:template_schema ->
  ?description:description ->
  ?status_message:status_message ->
  ?recommended_minor_version:template_version_part ->
  compatible_environment_templates:compatible_environment_template_list ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:service_template_version_arn ->
  status:template_version_status ->
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  service_template_version

val make_update_service_template_version_output :
  service_template_version:service_template_version ->
  unit ->
  update_service_template_version_output

val make_compatible_environment_template_input :
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  compatible_environment_template_input

val make_update_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_input_list ->
  ?compatible_environment_templates:compatible_environment_template_input_list ->
  ?status:template_version_status ->
  ?description:description ->
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  update_service_template_version_input

val make_service_template :
  ?pipeline_provisioning:provisioning ->
  ?encryption_key:arn ->
  ?recommended_version:full_template_version_number ->
  ?description:description ->
  ?display_name:display_name ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:service_template_arn ->
  name:resource_name ->
  unit ->
  service_template

val make_update_service_template_output :
  service_template:service_template -> unit -> update_service_template_output

val make_update_service_template_input :
  ?description:description ->
  ?display_name:display_name ->
  name:resource_name ->
  unit ->
  update_service_template_input

val make_service_sync_config :
  file_path:ops_file_path ->
  branch:git_branch_name ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  service_name:resource_name ->
  unit ->
  service_sync_config

val make_update_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> update_service_sync_config_output

val make_update_service_sync_config_input :
  file_path:ops_file_path ->
  branch:git_branch_name ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  service_name:resource_name ->
  unit ->
  update_service_sync_config_input

val make_sync_blocker_context :
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sync_blocker_context

val make_sync_blocker :
  ?resolved_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?resolved_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?contexts:sync_blocker_contexts ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  status:blocker_status ->
  type_:blocker_type ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sync_blocker

val make_update_service_sync_blocker_output :
  ?service_instance_name:resource_name ->
  service_sync_blocker:sync_blocker ->
  service_name:resource_name ->
  unit ->
  update_service_sync_blocker_output

val make_update_service_sync_blocker_input :
  resolved_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_service_sync_blocker_input

val make_service_pipeline :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?spec:spec_contents ->
  ?deployment_status_message:status_message ->
  deployment_status:deployment_status ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:arn ->
  unit ->
  service_pipeline

val make_update_service_pipeline_output :
  pipeline:service_pipeline -> unit -> update_service_pipeline_output

val make_update_service_pipeline_input :
  ?template_minor_version:template_version_part ->
  ?template_major_version:template_version_part ->
  deployment_type:deployment_update_type ->
  spec:spec_contents ->
  service_name:resource_name ->
  unit ->
  update_service_pipeline_input

val make_service :
  ?branch_name:git_branch_name ->
  ?repository_id:repository_id ->
  ?repository_connection_arn:arn ->
  ?pipeline:service_pipeline ->
  ?status_message:status_message ->
  ?description:description ->
  spec:spec_contents ->
  status:service_status ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  template_name:resource_name ->
  arn:service_arn ->
  name:resource_name ->
  unit ->
  service

val make_update_service_output : service:service -> unit -> update_service_output

val make_service_instance :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_client_request_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?spec:spec_contents ->
  ?deployment_status_message:status_message ->
  deployment_status:deployment_status ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  environment_name:resource_name ->
  service_name:resource_name ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:service_instance_arn ->
  name:resource_name ->
  unit ->
  service_instance

val make_update_service_instance_output :
  service_instance:service_instance -> unit -> update_service_instance_output

val make_update_service_instance_input :
  ?client_token:client_token ->
  ?template_minor_version:template_version_part ->
  ?template_major_version:template_version_part ->
  ?spec:spec_contents ->
  deployment_type:deployment_update_type ->
  service_name:resource_name ->
  name:resource_name ->
  unit ->
  update_service_instance_input

val make_update_service_input :
  ?spec:spec_contents ->
  ?description:description ->
  name:resource_name ->
  unit ->
  update_service_input

val make_environment_template_version :
  ?schema:template_schema ->
  ?description:description ->
  ?status_message:status_message ->
  ?recommended_minor_version:template_version_part ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:environment_template_version_arn ->
  status:template_version_status ->
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  environment_template_version

val make_update_environment_template_version_output :
  environment_template_version:environment_template_version ->
  unit ->
  update_environment_template_version_output

val make_update_environment_template_version_input :
  ?status:template_version_status ->
  ?description:description ->
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  update_environment_template_version_input

val make_environment_template :
  ?provisioning:provisioning ->
  ?encryption_key:arn ->
  ?recommended_version:full_template_version_number ->
  ?description:description ->
  ?display_name:display_name ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:environment_template_arn ->
  name:resource_name ->
  unit ->
  environment_template

val make_update_environment_template_output :
  environment_template:environment_template -> unit -> update_environment_template_output

val make_update_environment_template_input :
  ?description:description ->
  ?display_name:display_name ->
  name:resource_name ->
  unit ->
  update_environment_template_input

val make_repository_branch :
  branch:git_branch_name ->
  name:repository_name ->
  provider:repository_provider ->
  arn:repository_arn ->
  unit ->
  repository_branch

val make_environment :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?codebuild_role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  ?provisioning_repository:repository_branch ->
  ?provisioning:provisioning ->
  ?spec:spec_contents ->
  ?environment_account_id:aws_account_id ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?proton_service_role_arn:arn ->
  ?deployment_status_message:status_message ->
  ?description:description ->
  deployment_status:deployment_status ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  arn:environment_arn ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  name:resource_name ->
  unit ->
  environment

val make_update_environment_output : environment:environment -> unit -> update_environment_output

val make_repository_branch_input :
  branch:git_branch_name ->
  name:repository_name ->
  provider:repository_provider ->
  unit ->
  repository_branch_input

val make_update_environment_input :
  ?codebuild_role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  ?provisioning_repository:repository_branch_input ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?proton_service_role_arn:arn ->
  ?template_minor_version:template_version_part ->
  ?template_major_version:template_version_part ->
  ?spec:spec_contents ->
  ?description:description ->
  deployment_type:deployment_update_type ->
  name:resource_name ->
  unit ->
  update_environment_input

val make_environment_account_connection :
  ?codebuild_role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  status:environment_account_connection_status ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  requested_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  environment_name:resource_name ->
  role_arn:arn ->
  environment_account_id:aws_account_id ->
  management_account_id:aws_account_id ->
  arn:environment_account_connection_arn ->
  id:environment_account_connection_id ->
  unit ->
  environment_account_connection

val make_update_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  update_environment_account_connection_output

val make_update_environment_account_connection_input :
  ?codebuild_role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  ?role_arn:role_arn ->
  id:environment_account_connection_id ->
  unit ->
  update_environment_account_connection_input

val make_component :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_client_request_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service_spec:spec_contents ->
  ?deployment_status_message:status_message ->
  ?last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  ?description:description ->
  deployment_status:deployment_status ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  environment_name:resource_name ->
  arn:component_arn ->
  name:resource_name ->
  unit ->
  component

val make_update_component_output : component:component -> unit -> update_component_output

val make_update_component_input :
  ?client_token:client_token ->
  ?template_file:template_file_contents ->
  ?service_spec:spec_contents ->
  ?service_instance_name:resource_name_or_empty ->
  ?service_name:resource_name_or_empty ->
  ?description:description ->
  deployment_type:component_deployment_update_type ->
  name:resource_name ->
  unit ->
  update_component_input

val make_account_settings :
  ?pipeline_codebuild_role_arn:role_arn_or_empty_string ->
  ?pipeline_provisioning_repository:repository_branch ->
  ?pipeline_service_role_arn:role_arn_or_empty_string ->
  unit ->
  account_settings

val make_update_account_settings_output :
  account_settings:account_settings -> unit -> update_account_settings_output

val make_update_account_settings_input :
  ?pipeline_codebuild_role_arn:role_arn_or_empty_string ->
  ?delete_pipeline_provisioning_repository:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?pipeline_provisioning_repository:repository_branch_input ->
  ?pipeline_service_role_arn:role_arn_or_empty_string ->
  unit ->
  update_account_settings_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_input

val make_s3_object_source : key:s3_key -> bucket:s3_bucket -> unit -> s3_object_source
val make_tag_resource_output : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_input : tags:tag_list -> resource_arn:arn -> unit -> tag_resource_input

val make_service_template_version_summary :
  ?description:description ->
  ?status_message:status_message ->
  ?recommended_minor_version:template_version_part ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:service_template_version_arn ->
  status:template_version_status ->
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  service_template_version_summary

val make_service_template_summary :
  ?pipeline_provisioning:provisioning ->
  ?recommended_version:full_template_version_number ->
  ?description:description ->
  ?display_name:display_name ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:service_template_arn ->
  name:resource_name ->
  unit ->
  service_template_summary

val make_service_sync_blocker_summary :
  ?latest_blockers:latest_sync_blockers ->
  ?service_instance_name:Smaws_Lib.Smithy_api.Types.string_ ->
  service_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  service_sync_blocker_summary

val make_service_summary :
  ?status_message:status_message ->
  ?description:description ->
  status:service_status ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  template_name:resource_name ->
  arn:service_arn ->
  name:resource_name ->
  unit ->
  service_summary

val make_service_pipeline_state :
  ?spec:spec_contents ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  service_pipeline_state

val make_service_instance_summary :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?deployment_status_message:status_message ->
  deployment_status:deployment_status ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  environment_name:resource_name ->
  service_name:resource_name ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:service_instance_arn ->
  name:resource_name ->
  unit ->
  service_instance_summary

val make_service_instance_state :
  ?last_successful_service_pipeline_deployment_id:deployment_id ->
  ?last_successful_environment_deployment_id:deployment_id ->
  ?last_successful_component_deployment_ids:component_deployment_id_list ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  spec:spec_contents ->
  unit ->
  service_instance_state

val make_revision :
  branch:git_branch_name ->
  directory:Smaws_Lib.Smithy_api.Types.string_ ->
  sha:sh_a ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  unit ->
  revision

val make_resource_sync_event :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  event:Smaws_Lib.Smithy_api.Types.string_ ->
  time:Smaws_Lib.Smithy_api.Types.timestamp ->
  type_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resource_sync_event

val make_resource_sync_attempt :
  events:resource_sync_events ->
  status:resource_sync_status ->
  started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  target:Smaws_Lib.Smithy_api.Types.string_ ->
  target_revision:revision ->
  initial_revision:revision ->
  unit ->
  resource_sync_attempt

val make_resource_counts_summary :
  ?behind_minor:Smaws_Lib.Smithy_api.Types.integer ->
  ?behind_major:Smaws_Lib.Smithy_api.Types.integer ->
  ?up_to_date:Smaws_Lib.Smithy_api.Types.integer ->
  ?failed:Smaws_Lib.Smithy_api.Types.integer ->
  total:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  resource_counts_summary

val make_repository_sync_event :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  event:Smaws_Lib.Smithy_api.Types.string_ ->
  time:Smaws_Lib.Smithy_api.Types.timestamp ->
  type_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  repository_sync_event

val make_repository_sync_definition :
  directory:Smaws_Lib.Smithy_api.Types.string_ ->
  branch:git_branch_name ->
  parent:Smaws_Lib.Smithy_api.Types.string_ ->
  target:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  repository_sync_definition

val make_repository_sync_attempt :
  events:repository_sync_events ->
  status:repository_sync_status ->
  started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  repository_sync_attempt

val make_repository_summary :
  connection_arn:arn ->
  name:repository_name ->
  provider:repository_provider ->
  arn:repository_arn ->
  unit ->
  repository_summary

val make_repository :
  ?encryption_key:arn ->
  connection_arn:arn ->
  name:repository_name ->
  provider:repository_provider ->
  arn:repository_arn ->
  unit ->
  repository

val make_reject_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  reject_environment_account_connection_output

val make_reject_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> reject_environment_account_connection_input

val make_provisioned_resource :
  ?provisioning_engine:provisioned_resource_engine ->
  ?identifier:provisioned_resource_identifier ->
  ?name:provisioned_resource_name ->
  unit ->
  provisioned_resource

val make_output : ?value_string:output_value_string -> ?key:output_key -> unit -> output
val make_notify_resource_deployment_status_change_output : unit -> unit

val make_notify_resource_deployment_status_change_input :
  ?status_message:status_message ->
  ?deployment_id:deployment_id ->
  ?outputs:outputs_list ->
  ?status:resource_deployment_status ->
  resource_arn:arn ->
  unit ->
  notify_resource_deployment_status_change_input

val make_list_tags_for_resource_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  tags:tag_list ->
  unit ->
  list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?max_results:max_page_results ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_input

val make_list_services_output :
  ?next_token:next_token -> services:service_summary_list -> unit -> list_services_output

val make_list_services_input :
  ?max_results:max_page_results -> ?next_token:next_token -> unit -> list_services_input

val make_list_service_templates_output :
  ?next_token:next_token ->
  templates:service_template_summary_list ->
  unit ->
  list_service_templates_output

val make_list_service_templates_input :
  ?max_results:max_page_results -> ?next_token:next_token -> unit -> list_service_templates_input

val make_list_service_template_versions_output :
  ?next_token:next_token ->
  template_versions:service_template_version_summary_list ->
  unit ->
  list_service_template_versions_output

val make_list_service_template_versions_input :
  ?major_version:template_version_part ->
  ?max_results:max_page_results ->
  ?next_token:next_token ->
  template_name:resource_name ->
  unit ->
  list_service_template_versions_input

val make_list_service_pipeline_provisioned_resources_output :
  ?next_token:empty_next_token ->
  provisioned_resources:provisioned_resource_list ->
  unit ->
  list_service_pipeline_provisioned_resources_output

val make_list_service_pipeline_provisioned_resources_input :
  ?next_token:empty_next_token ->
  service_name:resource_name ->
  unit ->
  list_service_pipeline_provisioned_resources_input

val make_list_service_pipeline_outputs_output :
  ?next_token:empty_next_token ->
  outputs:outputs_list ->
  unit ->
  list_service_pipeline_outputs_output

val make_list_service_pipeline_outputs_input :
  ?deployment_id:deployment_id ->
  ?next_token:empty_next_token ->
  service_name:resource_name ->
  unit ->
  list_service_pipeline_outputs_input

val make_list_service_instances_output :
  ?next_token:next_token ->
  service_instances:service_instance_summary_list ->
  unit ->
  list_service_instances_output

val make_list_service_instances_filter :
  ?value:list_service_instances_filter_value ->
  ?key:list_service_instances_filter_by ->
  unit ->
  list_service_instances_filter

val make_list_service_instances_input :
  ?sort_order:sort_order ->
  ?sort_by:list_service_instances_sort_by ->
  ?filters:list_service_instances_filter_list ->
  ?max_results:max_page_results ->
  ?next_token:next_token ->
  ?service_name:resource_name ->
  unit ->
  list_service_instances_input

val make_list_service_instance_provisioned_resources_output :
  ?next_token:empty_next_token ->
  provisioned_resources:provisioned_resource_list ->
  unit ->
  list_service_instance_provisioned_resources_output

val make_list_service_instance_provisioned_resources_input :
  ?next_token:empty_next_token ->
  service_instance_name:resource_name ->
  service_name:resource_name ->
  unit ->
  list_service_instance_provisioned_resources_input

val make_list_service_instance_outputs_output :
  ?next_token:empty_next_token ->
  outputs:outputs_list ->
  unit ->
  list_service_instance_outputs_output

val make_list_service_instance_outputs_input :
  ?deployment_id:deployment_id ->
  ?next_token:empty_next_token ->
  service_name:resource_name ->
  service_instance_name:resource_name ->
  unit ->
  list_service_instance_outputs_input

val make_list_repository_sync_definitions_output :
  ?next_token:empty_next_token ->
  sync_definitions:repository_sync_definition_list ->
  unit ->
  list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  ?next_token:empty_next_token ->
  sync_type:sync_type ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  unit ->
  list_repository_sync_definitions_input

val make_list_repositories_output :
  ?next_token:next_token -> repositories:repository_summary_list -> unit -> list_repositories_output

val make_list_repositories_input :
  ?max_results:max_page_results -> ?next_token:next_token -> unit -> list_repositories_input

val make_environment_summary :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?component_role_arn:arn ->
  ?provisioning:provisioning ->
  ?environment_account_id:aws_account_id ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?proton_service_role_arn:arn ->
  ?deployment_status_message:status_message ->
  ?description:description ->
  deployment_status:deployment_status ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  arn:environment_arn ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  name:resource_name ->
  unit ->
  environment_summary

val make_list_environments_output :
  ?next_token:next_token ->
  environments:environment_summary_list ->
  unit ->
  list_environments_output

val make_environment_template_filter :
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  environment_template_filter

val make_list_environments_input :
  ?environment_templates:environment_template_filter_list ->
  ?max_results:max_page_results ->
  ?next_token:next_token ->
  unit ->
  list_environments_input

val make_environment_template_summary :
  ?provisioning:provisioning ->
  ?recommended_version:full_template_version_number ->
  ?description:description ->
  ?display_name:display_name ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:environment_template_arn ->
  name:resource_name ->
  unit ->
  environment_template_summary

val make_list_environment_templates_output :
  ?next_token:next_token ->
  templates:environment_template_summary_list ->
  unit ->
  list_environment_templates_output

val make_list_environment_templates_input :
  ?max_results:max_page_results ->
  ?next_token:next_token ->
  unit ->
  list_environment_templates_input

val make_environment_template_version_summary :
  ?description:description ->
  ?status_message:status_message ->
  ?recommended_minor_version:template_version_part ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:environment_template_version_arn ->
  status:template_version_status ->
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  environment_template_version_summary

val make_list_environment_template_versions_output :
  ?next_token:next_token ->
  template_versions:environment_template_version_summary_list ->
  unit ->
  list_environment_template_versions_output

val make_list_environment_template_versions_input :
  ?major_version:template_version_part ->
  ?max_results:max_page_results ->
  ?next_token:next_token ->
  template_name:resource_name ->
  unit ->
  list_environment_template_versions_input

val make_list_environment_provisioned_resources_output :
  ?next_token:empty_next_token ->
  provisioned_resources:provisioned_resource_list ->
  unit ->
  list_environment_provisioned_resources_output

val make_list_environment_provisioned_resources_input :
  ?next_token:empty_next_token ->
  environment_name:resource_name ->
  unit ->
  list_environment_provisioned_resources_input

val make_list_environment_outputs_output :
  ?next_token:empty_next_token -> outputs:outputs_list -> unit -> list_environment_outputs_output

val make_list_environment_outputs_input :
  ?deployment_id:deployment_id ->
  ?next_token:empty_next_token ->
  environment_name:resource_name ->
  unit ->
  list_environment_outputs_input

val make_environment_account_connection_summary :
  ?component_role_arn:arn ->
  status:environment_account_connection_status ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  requested_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  environment_name:resource_name ->
  role_arn:arn ->
  environment_account_id:aws_account_id ->
  management_account_id:aws_account_id ->
  arn:environment_account_connection_arn ->
  id:environment_account_connection_id ->
  unit ->
  environment_account_connection_summary

val make_list_environment_account_connections_output :
  ?next_token:next_token ->
  environment_account_connections:environment_account_connection_summary_list ->
  unit ->
  list_environment_account_connections_output

val make_list_environment_account_connections_input :
  ?max_results:max_page_results ->
  ?next_token:next_token ->
  ?statuses:environment_account_connection_status_list ->
  ?environment_name:resource_name ->
  requested_by:environment_account_connection_requester_account_type ->
  unit ->
  list_environment_account_connections_input

val make_deployment_summary :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?component_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  deployment_status:deployment_status ->
  environment_name:resource_name ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  target_resource_type:deployment_target_resource_type ->
  target_resource_created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  target_arn:arn ->
  arn:deployment_arn ->
  id:deployment_id ->
  unit ->
  deployment_summary

val make_list_deployments_output :
  ?next_token:next_token -> deployments:deployment_summary_list -> unit -> list_deployments_output

val make_list_deployments_input :
  ?max_results:max_page_results ->
  ?component_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  ?environment_name:resource_name ->
  ?next_token:next_token ->
  unit ->
  list_deployments_input

val make_component_summary :
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?deployment_status_message:status_message ->
  ?last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  deployment_status:deployment_status ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  environment_name:resource_name ->
  arn:component_arn ->
  name:resource_name ->
  unit ->
  component_summary

val make_list_components_output :
  ?next_token:next_token -> components:component_summary_list -> unit -> list_components_output

val make_list_components_input :
  ?max_results:max_page_results ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  ?environment_name:resource_name ->
  ?next_token:next_token ->
  unit ->
  list_components_input

val make_list_component_provisioned_resources_output :
  ?next_token:empty_next_token ->
  provisioned_resources:provisioned_resource_list ->
  unit ->
  list_component_provisioned_resources_output

val make_list_component_provisioned_resources_input :
  ?next_token:empty_next_token ->
  component_name:resource_name ->
  unit ->
  list_component_provisioned_resources_input

val make_list_component_outputs_output :
  ?next_token:empty_next_token -> outputs:outputs_list -> unit -> list_component_outputs_output

val make_list_component_outputs_input :
  ?deployment_id:deployment_id ->
  ?next_token:empty_next_token ->
  component_name:resource_name ->
  unit ->
  list_component_outputs_input

val make_get_template_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?latest_sync:resource_sync_attempt ->
  unit ->
  get_template_sync_status_output

val make_get_template_sync_status_input :
  template_version:template_version_part ->
  template_type:template_type ->
  template_name:resource_name ->
  unit ->
  get_template_sync_status_input

val make_get_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> get_template_sync_config_output

val make_get_template_sync_config_input :
  template_type:template_type ->
  template_name:resource_name ->
  unit ->
  get_template_sync_config_input

val make_get_service_template_version_output :
  service_template_version:service_template_version -> unit -> get_service_template_version_output

val make_get_service_template_version_input :
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  get_service_template_version_input

val make_get_service_template_output :
  service_template:service_template -> unit -> get_service_template_output

val make_get_service_template_input : name:resource_name -> unit -> get_service_template_input

val make_get_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> get_service_sync_config_output

val make_get_service_sync_config_input :
  service_name:resource_name -> unit -> get_service_sync_config_input

val make_get_service_sync_blocker_summary_output :
  ?service_sync_blocker_summary:service_sync_blocker_summary ->
  unit ->
  get_service_sync_blocker_summary_output

val make_get_service_sync_blocker_summary_input :
  ?service_instance_name:resource_name ->
  service_name:resource_name ->
  unit ->
  get_service_sync_blocker_summary_input

val make_get_service_output : ?service:service -> unit -> get_service_output

val make_get_service_instance_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?latest_sync:resource_sync_attempt ->
  unit ->
  get_service_instance_sync_status_output

val make_get_service_instance_sync_status_input :
  service_instance_name:resource_name ->
  service_name:resource_name ->
  unit ->
  get_service_instance_sync_status_input

val make_get_service_instance_output :
  service_instance:service_instance -> unit -> get_service_instance_output

val make_get_service_instance_input :
  service_name:resource_name -> name:resource_name -> unit -> get_service_instance_input

val make_get_service_input : name:resource_name -> unit -> get_service_input

val make_counts_summary :
  ?pipelines:resource_counts_summary ->
  ?service_templates:resource_counts_summary ->
  ?services:resource_counts_summary ->
  ?service_instances:resource_counts_summary ->
  ?environment_templates:resource_counts_summary ->
  ?environments:resource_counts_summary ->
  ?components:resource_counts_summary ->
  unit ->
  counts_summary

val make_get_resources_summary_output :
  counts:counts_summary -> unit -> get_resources_summary_output

val make_get_resources_summary_input : unit -> unit

val make_get_repository_sync_status_output :
  ?latest_sync:repository_sync_attempt -> unit -> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  sync_type:sync_type ->
  branch:git_branch_name ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  unit ->
  get_repository_sync_status_input

val make_get_repository_output : repository:repository -> unit -> get_repository_output

val make_get_repository_input :
  name:repository_name -> provider:repository_provider -> unit -> get_repository_input

val make_get_environment_template_version_output :
  environment_template_version:environment_template_version ->
  unit ->
  get_environment_template_version_output

val make_get_environment_template_version_input :
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  get_environment_template_version_input

val make_get_environment_template_output :
  environment_template:environment_template -> unit -> get_environment_template_output

val make_get_environment_template_input :
  name:resource_name -> unit -> get_environment_template_input

val make_get_environment_output : environment:environment -> unit -> get_environment_output
val make_get_environment_input : name:resource_name -> unit -> get_environment_input

val make_get_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  get_environment_account_connection_output

val make_get_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> get_environment_account_connection_input

val make_environment_state :
  ?spec:spec_contents ->
  template_minor_version:template_version_part ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  environment_state

val make_component_state :
  ?template_file:template_file_contents ->
  ?service_spec:spec_contents ->
  ?service_instance_name:resource_name_or_empty ->
  ?service_name:resource_name_or_empty ->
  unit ->
  component_state

val make_deployment :
  ?target_state:deployment_state ->
  ?initial_state:deployment_state ->
  ?last_succeeded_deployment_id:deployment_id ->
  ?last_attempted_deployment_id:deployment_id ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?deployment_status_message:status_message ->
  ?component_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  deployment_status:deployment_status ->
  environment_name:resource_name ->
  target_resource_type:deployment_target_resource_type ->
  target_resource_created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  target_arn:arn ->
  arn:deployment_arn ->
  id:deployment_id ->
  unit ->
  deployment

val make_get_deployment_output : ?deployment:deployment -> unit -> get_deployment_output

val make_get_deployment_input :
  ?component_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  ?environment_name:resource_name ->
  id:deployment_id ->
  unit ->
  get_deployment_input

val make_get_component_output : ?component:component -> unit -> get_component_output
val make_get_component_input : name:resource_name -> unit -> get_component_input

val make_get_account_settings_output :
  ?account_settings:account_settings -> unit -> get_account_settings_output

val make_get_account_settings_input : unit -> unit

val make_delete_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> delete_template_sync_config_output

val make_delete_template_sync_config_input :
  template_type:template_type ->
  template_name:resource_name ->
  unit ->
  delete_template_sync_config_input

val make_delete_service_template_version_output :
  ?service_template_version:service_template_version ->
  unit ->
  delete_service_template_version_output

val make_delete_service_template_version_input :
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  delete_service_template_version_input

val make_delete_service_template_output :
  ?service_template:service_template -> unit -> delete_service_template_output

val make_delete_service_template_input : name:resource_name -> unit -> delete_service_template_input

val make_delete_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> delete_service_sync_config_output

val make_delete_service_sync_config_input :
  service_name:resource_name -> unit -> delete_service_sync_config_input

val make_delete_service_output : ?service:service -> unit -> delete_service_output
val make_delete_service_input : name:resource_name -> unit -> delete_service_input
val make_delete_repository_output : ?repository:repository -> unit -> delete_repository_output

val make_delete_repository_input :
  name:repository_name -> provider:repository_provider -> unit -> delete_repository_input

val make_delete_environment_template_version_output :
  ?environment_template_version:environment_template_version ->
  unit ->
  delete_environment_template_version_output

val make_delete_environment_template_version_input :
  minor_version:template_version_part ->
  major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  delete_environment_template_version_input

val make_delete_environment_template_output :
  ?environment_template:environment_template -> unit -> delete_environment_template_output

val make_delete_environment_template_input :
  name:resource_name -> unit -> delete_environment_template_input

val make_delete_environment_output : ?environment:environment -> unit -> delete_environment_output
val make_delete_environment_input : name:resource_name -> unit -> delete_environment_input

val make_delete_environment_account_connection_output :
  ?environment_account_connection:environment_account_connection ->
  unit ->
  delete_environment_account_connection_output

val make_delete_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> delete_environment_account_connection_input

val make_delete_deployment_output : ?deployment:deployment -> unit -> delete_deployment_output
val make_delete_deployment_input : id:deployment_id -> unit -> delete_deployment_input
val make_delete_component_output : ?component:component -> unit -> delete_component_output
val make_delete_component_input : name:resource_name -> unit -> delete_component_input

val make_create_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> create_template_sync_config_output

val make_create_template_sync_config_input :
  ?subdirectory:subdirectory ->
  branch:git_branch_name ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:resource_name ->
  unit ->
  create_template_sync_config_input

val make_create_service_template_version_output :
  service_template_version:service_template_version ->
  unit ->
  create_service_template_version_output

val make_create_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_input_list ->
  ?tags:tag_list ->
  ?major_version:template_version_part ->
  ?description:description ->
  ?client_token:client_token ->
  compatible_environment_templates:compatible_environment_template_input_list ->
  source:template_version_source_input ->
  template_name:resource_name ->
  unit ->
  create_service_template_version_input

val make_create_service_template_output :
  service_template:service_template -> unit -> create_service_template_output

val make_create_service_template_input :
  ?tags:tag_list ->
  ?pipeline_provisioning:provisioning ->
  ?encryption_key:arn ->
  ?description:description ->
  ?display_name:display_name ->
  name:resource_name ->
  unit ->
  create_service_template_input

val make_create_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> create_service_sync_config_output

val make_create_service_sync_config_input :
  file_path:ops_file_path ->
  branch:git_branch_name ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  service_name:resource_name ->
  unit ->
  create_service_sync_config_input

val make_create_service_output : service:service -> unit -> create_service_output

val make_create_service_instance_output :
  service_instance:service_instance -> unit -> create_service_instance_output

val make_create_service_instance_input :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?template_minor_version:template_version_part ->
  ?template_major_version:template_version_part ->
  spec:spec_contents ->
  service_name:resource_name ->
  name:resource_name ->
  unit ->
  create_service_instance_input

val make_create_service_input :
  ?tags:tag_list ->
  ?branch_name:git_branch_name ->
  ?repository_id:repository_id ->
  ?repository_connection_arn:arn ->
  ?template_minor_version:template_version_part ->
  ?description:description ->
  spec:spec_contents ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  name:resource_name ->
  unit ->
  create_service_input

val make_create_repository_output : repository:repository -> unit -> create_repository_output

val make_create_repository_input :
  ?tags:tag_list ->
  ?encryption_key:arn ->
  connection_arn:arn ->
  name:repository_name ->
  provider:repository_provider ->
  unit ->
  create_repository_input

val make_create_environment_template_version_output :
  environment_template_version:environment_template_version ->
  unit ->
  create_environment_template_version_output

val make_create_environment_template_version_input :
  ?tags:tag_list ->
  ?major_version:template_version_part ->
  ?description:description ->
  ?client_token:client_token ->
  source:template_version_source_input ->
  template_name:resource_name ->
  unit ->
  create_environment_template_version_input

val make_create_environment_template_output :
  environment_template:environment_template -> unit -> create_environment_template_output

val make_create_environment_template_input :
  ?tags:tag_list ->
  ?provisioning:provisioning ->
  ?encryption_key:arn ->
  ?description:description ->
  ?display_name:display_name ->
  name:resource_name ->
  unit ->
  create_environment_template_input

val make_create_environment_output : environment:environment -> unit -> create_environment_output

val make_create_environment_input :
  ?codebuild_role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  ?provisioning_repository:repository_branch_input ->
  ?tags:tag_list ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?proton_service_role_arn:arn ->
  ?description:description ->
  ?template_minor_version:template_version_part ->
  spec:spec_contents ->
  template_major_version:template_version_part ->
  template_name:resource_name ->
  name:resource_name ->
  unit ->
  create_environment_input

val make_create_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  create_environment_account_connection_output

val make_create_environment_account_connection_input :
  ?codebuild_role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  ?tags:tag_list ->
  ?role_arn:role_arn ->
  ?client_token:client_token ->
  environment_name:resource_name ->
  management_account_id:aws_account_id ->
  unit ->
  create_environment_account_connection_input

val make_create_component_output : component:component -> unit -> create_component_output

val make_create_component_input :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?service_spec:spec_contents ->
  ?environment_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?service_name:resource_name ->
  ?description:description ->
  manifest:template_manifest_contents ->
  template_file:template_file_contents ->
  name:resource_name ->
  unit ->
  create_component_input

val make_cancel_service_pipeline_deployment_output :
  pipeline:service_pipeline -> unit -> cancel_service_pipeline_deployment_output

val make_cancel_service_pipeline_deployment_input :
  service_name:resource_name -> unit -> cancel_service_pipeline_deployment_input

val make_cancel_service_instance_deployment_output :
  service_instance:service_instance -> unit -> cancel_service_instance_deployment_output

val make_cancel_service_instance_deployment_input :
  service_name:resource_name ->
  service_instance_name:resource_name ->
  unit ->
  cancel_service_instance_deployment_input

val make_cancel_environment_deployment_output :
  environment:environment -> unit -> cancel_environment_deployment_output

val make_cancel_environment_deployment_input :
  environment_name:resource_name -> unit -> cancel_environment_deployment_input

val make_cancel_component_deployment_output :
  component:component -> unit -> cancel_component_deployment_output

val make_cancel_component_deployment_input :
  component_name:resource_name -> unit -> cancel_component_deployment_input

val make_accept_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  accept_environment_account_connection_output

val make_accept_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> accept_environment_account_connection_input
(** {1:operations Operations} *)

module AcceptEnvironmentAccountConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_environment_account_connection_input ->
    ( accept_environment_account_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "In a management account, an environment account connection request is accepted. When the \
   environment account connection request is accepted, Proton can use the associated IAM role to \
   provision environment infrastructure resources in the associated environment account.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \ "]

module CancelComponentDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_component_deployment_input ->
    ( cancel_component_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Attempts to cancel a component deployment (for a component that is in the [IN_PROGRESS] \
   deployment status).\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module CancelEnvironmentDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_environment_deployment_input ->
    ( cancel_environment_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Attempts to cancel an environment deployment on an [UpdateEnvironment] action, if the \
   deployment is [IN_PROGRESS]. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-update.html}Update an \
   environment} in the {i Proton User guide}.\n\n\
  \ The following list includes potential cancellation scenarios.\n\
  \ \n\
  \  {ul\n\
  \        {-  If the cancellation attempt succeeds, the resulting deployment state is [CANCELLED].\n\
  \            \n\
  \             }\n\
  \        {-  If the cancellation attempt fails, the resulting deployment state is [FAILED].\n\
  \            \n\
  \             }\n\
  \        {-  If the current [UpdateEnvironment] action succeeds before the cancellation attempt \
   starts, the resulting deployment state is [SUCCEEDED] and the cancellation attempt has no \
   effect.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CancelServiceInstanceDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_service_instance_deployment_input ->
    ( cancel_service_instance_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Attempts to cancel a service instance deployment on an [UpdateServiceInstance] action, if the \
   deployment is [IN_PROGRESS]. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-instance-update.html}Update a \
   service instance} in the {i Proton User guide}.\n\n\
  \ The following list includes potential cancellation scenarios.\n\
  \ \n\
  \  {ul\n\
  \        {-  If the cancellation attempt succeeds, the resulting deployment state is [CANCELLED].\n\
  \            \n\
  \             }\n\
  \        {-  If the cancellation attempt fails, the resulting deployment state is [FAILED].\n\
  \            \n\
  \             }\n\
  \        {-  If the current [UpdateServiceInstance] action succeeds before the cancellation \
   attempt starts, the resulting deployment state is [SUCCEEDED] and the cancellation attempt has \
   no effect.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CancelServicePipelineDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_service_pipeline_deployment_input ->
    ( cancel_service_pipeline_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Attempts to cancel a service pipeline deployment on an [UpdateServicePipeline] action, if the \
   deployment is [IN_PROGRESS]. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-pipeline-update.html}Update a \
   service pipeline} in the {i Proton User guide}.\n\n\
  \ The following list includes potential cancellation scenarios.\n\
  \ \n\
  \  {ul\n\
  \        {-  If the cancellation attempt succeeds, the resulting deployment state is [CANCELLED].\n\
  \            \n\
  \             }\n\
  \        {-  If the cancellation attempt fails, the resulting deployment state is [FAILED].\n\
  \            \n\
  \             }\n\
  \        {-  If the current [UpdateServicePipeline] action succeeds before the cancellation \
   attempt starts, the resulting deployment state is [SUCCEEDED] and the cancellation attempt has \
   no effect.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_component_input ->
    ( create_component_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create an Proton component. A component is an infrastructure extension for a service instance.\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module CreateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_input ->
    ( create_environment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deploy a new environment. An Proton environment is created from an environment template that \
   defines infrastructure and resources that can be shared across services.\n\n\
  \  {b You can provision environments using the following methods:} \n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon Web Services-managed provisioning: Proton makes direct calls to provision \
   your resources.\n\
  \            \n\
  \             }\n\
  \        {-  Self-managed provisioning: Proton makes pull requests on your repository to provide \
   compiled infrastructure as code (IaC) files that your IaC engine uses to provision resources.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html}Environments} and \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html}Provisioning \
   methods} in the {i Proton User Guide}.\n\
  \   "]

module CreateEnvironmentAccountConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_account_connection_input ->
    ( create_environment_account_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create an environment account connection in an environment account so that environment \
   infrastructure resources can be provisioned in the environment account from a management \
   account.\n\n\
  \ An environment account connection is a secure bi-directional connection between a {i \
   management account} and an {i environment account} that maintains authorization and \
   permissions. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \ "]

module CreateEnvironmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_template_input ->
    ( create_environment_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create an environment template for Proton. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html}Environment Templates} \
   in the {i Proton User Guide}.\n\n\
  \ You can create an environment template in one of the two following ways:\n\
  \ \n\
  \  {ul\n\
  \        {-  Register and publish a {i standard} environment template that instructs Proton to \
   deploy and manage environment infrastructure.\n\
  \            \n\
  \             }\n\
  \        {-  Register and publish a {i customer managed} environment template that connects \
   Proton to your existing provisioned infrastructure that you manage. Proton {i doesn't} manage \
   your existing provisioned infrastructure. To create an environment template for customer \
   provisioned and managed infrastructure, include the [provisioning] parameter and set the value \
   to [CUSTOMER_MANAGED]. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/template-create.html}Register and \
   publish an environment template} in the {i Proton User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateEnvironmentTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_template_version_input ->
    ( create_environment_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create a new major or minor version of an environment template. A major version of an \
   environment template is a version that {i isn't} backwards compatible. A minor version of an \
   environment template is a version that's backwards compatible within its major version.\n"]

module CreateRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_repository_input ->
    ( create_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create and register a link to a repository. Proton uses the link to repeatedly access the \
   repository, to either push to it (self-managed provisioning) or pull from it (template sync). \
   You can share a linked repository across multiple resources (like environments using \
   self-managed provisioning, or synced templates). When you create a repository link, Proton \
   creates a \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/using-service-linked-roles.html}service-linked \
   role} for you.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self}Self-managed \
   provisioning}, \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-authoring.html#ag-template-bundles}Template \
   bundles}, and \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-sync-configs.html}Template \
   sync configurations} in the {i Proton User Guide}.\n\
  \ "]

module CreateService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_input ->
    ( create_service_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create an Proton service. An Proton service is an instantiation of a service template and often \
   includes several service instances and pipeline. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-services.html}Services} in the {i \
   Proton User Guide}.\n"]

module CreateServiceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_instance_input ->
    ( create_service_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Create a service instance.\n"]

module CreateServiceSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_sync_config_input ->
    ( create_service_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Create the Proton Ops configuration file.\n"]

module CreateServiceTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_template_input ->
    ( create_service_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create a service template. The administrator creates a service template to define standardized \
   infrastructure and an optional CI/CD service pipeline. Developers, in turn, select the service \
   template from Proton. If the selected service template includes a service pipeline definition, \
   they provide a link to their source code repository. Proton then deploys and manages the \
   infrastructure defined by the selected service template. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html}Proton templates} in \
   the {i Proton User Guide}.\n"]

module CreateServiceTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_template_version_input ->
    ( create_service_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Create a new major or minor version of a service template. A major version of a service \
   template is a version that {i isn't} backward compatible. A minor version of a service template \
   is a version that's backward compatible within its major version.\n"]

module CreateTemplateSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_template_sync_config_input ->
    ( create_template_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Set up a template to create new template versions automatically by tracking a linked \
   repository. A linked repository is a repository that has been registered with Proton. For more \
   information, see [CreateRepository].\n\n\
  \ When a commit is pushed to your linked repository, Proton checks for changes to your \
   repository template bundles. If it detects a template bundle change, a new major or minor \
   version of its template is created, if the version doesn\226\128\153t already exist. For more \
   information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-sync-configs.html}Template \
   sync configurations} in the {i Proton User Guide}.\n\
  \ "]

module DeleteComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_component_input ->
    ( delete_component_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Delete an Proton component resource.\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module DeleteDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_deployment_input ->
    ( delete_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Delete the deployment.\n"]

module DeleteEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_input ->
    ( delete_environment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Delete an environment.\n"]

module DeleteEnvironmentAccountConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_account_connection_input ->
    ( delete_environment_account_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "In an environment account, delete an environment account connection.\n\n\
  \ After you delete an environment account connection that\226\128\153s in use by an Proton \
   environment, Proton {i can\226\128\153t} manage the environment infrastructure resources until \
   a new environment account connection is accepted for the environment account and associated \
   environment. You're responsible for cleaning up provisioned resources that remain without an \
   environment connection.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \  "]

module DeleteEnvironmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_template_input ->
    ( delete_environment_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "If no other major or minor versions of an environment template exist, delete the environment \
   template.\n"]

module DeleteEnvironmentTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_template_version_input ->
    ( delete_environment_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "If no other minor versions of an environment template exist, delete a major version of the \
   environment template if it's not the [Recommended] version. Delete the [Recommended] version of \
   the environment template if no other major versions or minor versions of the environment \
   template exist. A major version of an environment template is a version that's not backward \
   compatible.\n\n\
  \ Delete a minor version of an environment template if it {i isn't} the [Recommended] version. \
   Delete a [Recommended] minor version of the environment template if no other minor versions of \
   the environment template exist. A minor version of an environment template is a version that's \
   backward compatible.\n\
  \ "]

module DeleteRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_input ->
    ( delete_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "De-register and unlink your repository.\n"]

module DeleteService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_input ->
    ( delete_service_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Delete a service, with its instances and pipeline.\n\n\
  \  You can't delete a service if it has any service instances that have components attached to \
   them.\n\
  \  \n\
  \   For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \   \n\
  \    "]

module DeleteServiceSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_sync_config_input ->
    ( delete_service_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Delete the Proton Ops file.\n"]

module DeleteServiceTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_template_input ->
    ( delete_service_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "If no other major or minor versions of the service template exist, delete the service template.\n"]

module DeleteServiceTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_template_version_input ->
    ( delete_service_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "If no other minor versions of a service template exist, delete a major version of the service \
   template if it's not the [Recommended] version. Delete the [Recommended] version of the service \
   template if no other major versions or minor versions of the service template exist. A major \
   version of a service template is a version that {i isn't} backwards compatible.\n\n\
  \ Delete a minor version of a service template if it's not the [Recommended] version. Delete a \
   [Recommended] minor version of the service template if no other minor versions of the service \
   template exist. A minor version of a service template is a version that's backwards compatible.\n\
  \ "]

module DeleteTemplateSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_template_sync_config_input ->
    ( delete_template_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Delete a template sync configuration.\n"]

module GetAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_settings_input ->
    ( get_account_settings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detail data for Proton account-wide settings.\n"]

module GetComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_component_input ->
    ( get_component_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Get detailed data for a component.\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module GetDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_input ->
    ( get_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for a deployment.\n"]

module GetEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_environment_input ->
    ( get_environment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for an environment.\n"]

module GetEnvironmentAccountConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_environment_account_connection_input ->
    ( get_environment_account_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "In an environment account, get the detailed data for an environment account connection.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \ "]

module GetEnvironmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_environment_template_input ->
    ( get_environment_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for an environment template.\n"]

module GetEnvironmentTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_environment_template_version_input ->
    ( get_environment_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for a major or minor version of an environment template.\n"]

module GetRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_input ->
    ( get_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detail data for a linked repository.\n"]

module GetRepositorySyncStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_sync_status_input ->
    ( get_repository_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Get the sync status of a repository used for Proton template sync. For more information about \
   template sync, see .\n\n\
  \  A repository sync status isn't tied to the Proton Repository resource (or any other Proton \
   resource). Therefore, tags on an Proton Repository resource have no effect on this action. \
   Specifically, you can't use these tags to control access to this action using Attribute-based \
   access control (ABAC).\n\
  \  \n\
  \   For more information about ABAC, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-tags}ABAC} \
   in the {i Proton User Guide}.\n\
  \   \n\
  \    "]

module GetResourcesSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resources_summary_input ->
    ( get_resources_summary_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Get counts of Proton resources.\n\n\
  \ For infrastructure-provisioning resources (environments, services, service instances, \
   pipelines), the action returns staleness counts. A resource is stale when it's behind the \
   recommended version of the Proton template that it uses and it needs an update to become \
   current.\n\
  \ \n\
  \  The action returns staleness counts (counts of resources that are up-to-date, behind a \
   template major version, or behind a template minor version), the total number of resources, and \
   the number of resources that are in a failed state, grouped by resource type. Components, \
   environments, and service templates return less information - see the [components], \
   [environments], and [serviceTemplates] field descriptions.\n\
  \  \n\
  \   For context, the action also returns the total number of each type of Proton template in the \
   Amazon Web Services account.\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/monitoring-dashboard.html}Proton \
   dashboard} in the {i Proton User Guide}.\n\
  \    "]

module GetService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_input ->
    ( get_service_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for a service.\n"]

module GetServiceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_instance_input ->
    ( get_service_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Get detailed data for a service instance. A service instance is an instantiation of service \
   template and it runs in a specific environment.\n"]

module GetServiceInstanceSyncStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_instance_sync_status_input ->
    ( get_service_instance_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get the status of the synced service instance.\n"]

module GetServiceSyncBlockerSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_sync_blocker_summary_input ->
    ( get_service_sync_blocker_summary_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for the service sync blocker summary.\n"]

module GetServiceSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_sync_config_input ->
    ( get_service_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed information for the service sync configuration.\n"]

module GetServiceTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_template_input ->
    ( get_service_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for a service template.\n"]

module GetServiceTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_template_version_input ->
    ( get_service_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detailed data for a major or minor version of a service template.\n"]

module GetTemplateSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_template_sync_config_input ->
    ( get_template_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get detail data for a template sync configuration.\n"]

module GetTemplateSyncStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_template_sync_status_input ->
    ( get_template_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get the status of a template sync.\n"]

module ListComponentOutputs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_component_outputs_input ->
    ( list_component_outputs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Get a list of component Infrastructure as Code (IaC) outputs.\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module ListComponentProvisionedResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_component_provisioned_resources_input ->
    ( list_component_provisioned_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "List provisioned resources for a component with details.\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module ListComponents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_components_input ->
    ( list_components_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "List components with summary data. You can filter the result list by environment, service, or a \
   single service instance.\n\n\
  \ For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \ "]

module ListDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deployments_input ->
    ( list_deployments_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "List deployments. You can filter the result list by environment, service, or a single service \
   instance.\n"]

module ListEnvironmentAccountConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_account_connections_input ->
    ( list_environment_account_connections_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "View a list of environment account connections.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \ "]

module ListEnvironmentOutputs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_outputs_input ->
    ( list_environment_outputs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List the infrastructure as code outputs for your environment.\n"]

module ListEnvironmentProvisionedResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_provisioned_resources_input ->
    ( list_environment_provisioned_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List the provisioned resources for your environment.\n"]

module ListEnvironmentTemplateVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_template_versions_input ->
    ( list_environment_template_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List major or minor versions of an environment template with detail data.\n"]

module ListEnvironmentTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environment_templates_input ->
    ( list_environment_templates_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List environment templates.\n"]

module ListEnvironments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environments_input ->
    ( list_environments_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List environments with detail data summaries.\n"]

module ListRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_repositories_input ->
    ( list_repositories_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List linked repositories with detail data.\n"]

module ListRepositorySyncDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_repository_sync_definitions_input ->
    ( list_repository_sync_definitions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List repository sync definitions with detail data.\n"]

module ListServiceInstanceOutputs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_instance_outputs_input ->
    ( list_service_instance_outputs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get a list service of instance Infrastructure as Code (IaC) outputs.\n"]

module ListServiceInstanceProvisionedResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_instance_provisioned_resources_input ->
    ( list_service_instance_provisioned_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List provisioned resources for a service instance with details.\n"]

module ListServiceInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_instances_input ->
    ( list_service_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "List service instances with summary data. This action lists service instances of all services \
   in the Amazon Web Services account.\n"]

module ListServicePipelineOutputs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_pipeline_outputs_input ->
    ( list_service_pipeline_outputs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Get a list of service pipeline Infrastructure as Code (IaC) outputs.\n"]

module ListServicePipelineProvisionedResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_pipeline_provisioned_resources_input ->
    ( list_service_pipeline_provisioned_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List provisioned resources for a service and pipeline with details.\n"]

module ListServiceTemplateVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_template_versions_input ->
    ( list_service_template_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List major or minor versions of a service template with detail data.\n"]

module ListServiceTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_templates_input ->
    ( list_service_templates_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List service templates with detail data.\n"]

module ListServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_services_input ->
    ( list_services_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List services with summaries of detail data.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "List tags for a resource. For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and \
   tagging} in the {i Proton User Guide}.\n"]

module NotifyResourceDeploymentStatusChange : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_resource_deployment_status_change_input ->
    ( notify_resource_deployment_status_change_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Notify Proton of status changes to a provisioned resource when you use self-managed \
   provisioning.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self}Self-managed \
   provisioning} in the {i Proton User Guide}.\n\
  \ "]

module RejectEnvironmentAccountConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_environment_account_connection_input ->
    ( reject_environment_account_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "In a management account, reject an environment account connection from another environment \
   account.\n\n\
  \ After you reject an environment account connection request, you {i can't} accept or use the \
   rejected environment account connection.\n\
  \ \n\
  \  You {i can\226\128\153t} reject an environment account connection that's connected to an \
   environment.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Tag a resource. A tag is a key-value pair of metadata that you associate with an Proton \
   resource.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and \
   tagging} in the {i Proton User Guide}.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Remove a customer tag from a resource. A tag is a key-value pair of metadata associated with an \
   Proton resource.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and \
   tagging} in the {i Proton User Guide}.\n\
  \ "]

module UpdateAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_account_settings_input ->
    ( update_account_settings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update Proton settings that are used for multiple services in the Amazon Web Services account.\n"]

module UpdateComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_component_input ->
    ( update_component_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update a component.\n\n\
  \ There are a few modes for updating a component. The [deploymentType] field defines the mode.\n\
  \ \n\
  \   You can't update a component while its deployment status, or the deployment status of a \
   service instance attached to it, is [IN_PROGRESS].\n\
  \   \n\
  \     For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \     "]

module UpdateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_input ->
    ( update_environment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update an environment.\n\n\
  \ If the environment is associated with an environment account connection, {i don't} update or \
   include the [protonServiceRoleArn] and [provisioningRepository] parameter to update or connect \
   to an environment account connection.\n\
  \ \n\
  \  You can only update to a new environment account connection if that connection was created in \
   the same environment account that the current environment account connection was created in. \
   The account connection must also be associated with the current environment.\n\
  \  \n\
  \   If the environment {i isn't} associated with an environment account connection, {i don't} \
   update or include the [environmentAccountConnectionId] parameter. You {i can't} update or \
   connect the environment to an environment account connection if it {i isn't} already associated \
   with an environment connection.\n\
  \   \n\
  \    You can update either the [environmentAccountConnectionId] or [protonServiceRoleArn] \
   parameter and value. You can\226\128\153t update both.\n\
  \    \n\
  \     If the environment was configured for Amazon Web Services-managed provisioning, omit the \
   [provisioningRepository] parameter.\n\
  \     \n\
  \      If the environment was configured for self-managed provisioning, specify the \
   [provisioningRepository] parameter and omit the [protonServiceRoleArn] and \
   [environmentAccountConnectionId] parameters.\n\
  \      \n\
  \       For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html}Environments} and \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html}Provisioning \
   methods} in the {i Proton User Guide}.\n\
  \       \n\
  \        There are four modes for updating an environment. The [deploymentType] field defines \
   the mode.\n\
  \        \n\
  \             [NONE] \n\
  \            \n\
  \             In this mode, a deployment {i doesn't} occur. Only the requested metadata \
   parameters are updated.\n\
  \             \n\
  \                  [CURRENT_VERSION] \n\
  \                 \n\
  \                  In this mode, the environment is deployed and updated with the new spec that \
   you provide. Only requested parameters are updated. {i Don\226\128\153t} include minor or major \
   version parameters when you use this [deployment-type].\n\
  \                  \n\
  \                       [MINOR_VERSION] \n\
  \                      \n\
  \                       In this mode, the environment is deployed and updated with the \
   published, recommended (latest) minor version of the current major version in use, by default. \
   You can also specify a different minor version of the current major version in use.\n\
  \                       \n\
  \                            [MAJOR_VERSION] \n\
  \                           \n\
  \                            In this mode, the environment is deployed and updated with the \
   published, recommended (latest) major and minor version of the current template, by default. \
   You can also specify a different major version that's higher than the major version in use and \
   a minor version.\n\
  \                            \n\
  \                              "]

module UpdateEnvironmentAccountConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_account_connection_input ->
    ( update_environment_account_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "In an environment account, update an environment account connection to use a new IAM role.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment \
   account connections} in the {i Proton User guide}.\n\
  \ "]

module UpdateEnvironmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_template_input ->
    ( update_environment_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Update an environment template.\n"]

module UpdateEnvironmentTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_template_version_input ->
    ( update_environment_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Update a major or minor version of an environment template.\n"]

module UpdateService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_input ->
    ( update_service_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Edit a service description or use a spec to add and delete service instances.\n\n\
  \  Existing service instances and the service pipeline {i can't} be edited using this API. They \
   can only be deleted.\n\
  \  \n\
  \    Use the [description] parameter to modify the description.\n\
  \    \n\
  \     Edit the [spec] parameter to add or delete instances.\n\
  \     \n\
  \       You can't delete a service instance (remove it from the spec) if it has an attached \
   component.\n\
  \       \n\
  \        For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \        \n\
  \         "]

module UpdateServiceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_instance_input ->
    ( update_service_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update a service instance.\n\n\
  \ There are a few modes for updating a service instance. The [deploymentType] field defines the \
   mode.\n\
  \ \n\
  \   You can't update a service instance while its deployment status, or the deployment status of \
   a component attached to it, is [IN_PROGRESS].\n\
  \   \n\
  \    For more information about components, see \
   {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in \
   the {i Proton User Guide}.\n\
  \    \n\
  \     "]

module UpdateServicePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_pipeline_input ->
    ( update_service_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update the service pipeline.\n\n\
  \ There are four modes for updating a service pipeline. The [deploymentType] field defines the \
   mode.\n\
  \ \n\
  \      [NONE] \n\
  \     \n\
  \      In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are \
   updated.\n\
  \      \n\
  \           [CURRENT_VERSION] \n\
  \          \n\
  \           In this mode, the service pipeline is deployed and updated with the new spec that \
   you provide. Only requested parameters are updated. {i Don\226\128\153t} include major or minor \
   version parameters when you use this [deployment-type].\n\
  \           \n\
  \                [MINOR_VERSION] \n\
  \               \n\
  \                In this mode, the service pipeline is deployed and updated with the published, \
   recommended (latest) minor version of the current major version in use, by default. You can \
   specify a different minor version of the current major version in use.\n\
  \                \n\
  \                     [MAJOR_VERSION] \n\
  \                    \n\
  \                     In this mode, the service pipeline is deployed and updated with the \
   published, recommended (latest) major and minor version of the current template by default. You \
   can specify a different major version that's higher than the major version in use and a minor \
   version.\n\
  \                     \n\
  \                       "]

module UpdateServiceSyncBlocker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_sync_blocker_input ->
    ( update_service_sync_blocker_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Update the service sync blocker by resolving it.\n"]

module UpdateServiceSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_sync_config_input ->
    ( update_service_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Update the Proton Ops config file.\n"]

module UpdateServiceTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_template_input ->
    ( update_service_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Update a service template.\n"]

module UpdateServiceTemplateVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_template_version_input ->
    ( update_service_template_version_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Update a major or minor version of a service template.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateTemplateSyncConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_template_sync_config_input ->
    ( update_template_sync_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update template sync configuration parameters, except for the [templateName] and \
   [templateType]. Repository details (branch, name, and provider) should be of a linked \
   repository. A linked repository is a repository that has been registered with Proton. For more \
   information, see [CreateRepository].\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
