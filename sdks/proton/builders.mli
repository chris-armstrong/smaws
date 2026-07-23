open Types

val make_environment_account_connection :
  ?component_role_arn:role_arn ->
  ?codebuild_role_arn:role_arn ->
  id:environment_account_connection_id ->
  arn:environment_account_connection_arn ->
  management_account_id:aws_account_id ->
  environment_account_id:aws_account_id ->
  role_arn:arn ->
  environment_name:resource_name ->
  requested_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:environment_account_connection_status ->
  unit ->
  environment_account_connection

val make_accept_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  accept_environment_account_connection_output

val make_accept_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> accept_environment_account_connection_input

val make_repository_branch :
  arn:repository_arn ->
  provider:repository_provider ->
  name:repository_name ->
  branch:git_branch_name ->
  unit ->
  repository_branch

val make_account_settings :
  ?pipeline_service_role_arn:role_arn_or_empty_string ->
  ?pipeline_provisioning_repository:repository_branch ->
  ?pipeline_codebuild_role_arn:role_arn_or_empty_string ->
  unit ->
  account_settings

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_tag_resource_input : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_input
val make_notify_resource_deployment_status_change_output : unit -> unit
val make_output : ?key:output_key -> ?value_string:output_value_string -> unit -> output

val make_notify_resource_deployment_status_change_input :
  ?status:resource_deployment_status ->
  ?outputs:outputs_list ->
  ?deployment_id:deployment_id ->
  ?status_message:status_message ->
  resource_arn:arn ->
  unit ->
  notify_resource_deployment_status_change_input

val make_list_tags_for_resource_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  tags:tag_list ->
  unit ->
  list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_page_results ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_input

val make_repository_sync_definition :
  target:Smaws_Lib.Smithy_api.Types.string_ ->
  parent:Smaws_Lib.Smithy_api.Types.string_ ->
  branch:git_branch_name ->
  directory:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  repository_sync_definition

val make_list_repository_sync_definitions_output :
  ?next_token:empty_next_token ->
  sync_definitions:repository_sync_definition_list ->
  unit ->
  list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  ?next_token:empty_next_token ->
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  sync_type:sync_type ->
  unit ->
  list_repository_sync_definitions_input

val make_revision :
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  sha:sh_a ->
  directory:Smaws_Lib.Smithy_api.Types.string_ ->
  branch:git_branch_name ->
  unit ->
  revision

val make_resource_sync_event :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:Smaws_Lib.Smithy_api.Types.string_ ->
  time:Smaws_Lib.Smithy_api.Types.timestamp ->
  event:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resource_sync_event

val make_resource_sync_attempt :
  initial_revision:revision ->
  target_revision:revision ->
  target:Smaws_Lib.Smithy_api.Types.string_ ->
  started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:resource_sync_status ->
  events:resource_sync_events ->
  unit ->
  resource_sync_attempt

val make_get_template_sync_status_output :
  ?latest_sync:resource_sync_attempt ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?desired_state:revision ->
  unit ->
  get_template_sync_status_output

val make_get_template_sync_status_input :
  template_name:resource_name ->
  template_type:template_type ->
  template_version:template_version_part ->
  unit ->
  get_template_sync_status_input

val make_get_service_instance_sync_status_output :
  ?latest_sync:resource_sync_attempt ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?desired_state:revision ->
  unit ->
  get_service_instance_sync_status_output

val make_get_service_instance_sync_status_input :
  service_name:resource_name ->
  service_instance_name:resource_name ->
  unit ->
  get_service_instance_sync_status_input

val make_resource_counts_summary :
  ?failed:Smaws_Lib.Smithy_api.Types.integer ->
  ?up_to_date:Smaws_Lib.Smithy_api.Types.integer ->
  ?behind_major:Smaws_Lib.Smithy_api.Types.integer ->
  ?behind_minor:Smaws_Lib.Smithy_api.Types.integer ->
  total:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  resource_counts_summary

val make_counts_summary :
  ?components:resource_counts_summary ->
  ?environments:resource_counts_summary ->
  ?environment_templates:resource_counts_summary ->
  ?service_instances:resource_counts_summary ->
  ?services:resource_counts_summary ->
  ?service_templates:resource_counts_summary ->
  ?pipelines:resource_counts_summary ->
  unit ->
  counts_summary

val make_get_resources_summary_output :
  counts:counts_summary -> unit -> get_resources_summary_output

val make_get_resources_summary_input : unit -> unit

val make_repository_sync_event :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:Smaws_Lib.Smithy_api.Types.string_ ->
  time:Smaws_Lib.Smithy_api.Types.timestamp ->
  event:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  repository_sync_event

val make_repository_sync_attempt :
  started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:repository_sync_status ->
  events:repository_sync_events ->
  unit ->
  repository_sync_attempt

val make_get_repository_sync_status_output :
  ?latest_sync:repository_sync_attempt -> unit -> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  repository_name:repository_name ->
  repository_provider:repository_provider ->
  branch:git_branch_name ->
  sync_type:sync_type ->
  unit ->
  get_repository_sync_status_input

val make_service_pipeline :
  ?deployment_status_message:status_message ->
  ?spec:spec_contents ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  arn:arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  deployment_status:deployment_status ->
  unit ->
  service_pipeline

val make_cancel_service_pipeline_deployment_output :
  pipeline:service_pipeline -> unit -> cancel_service_pipeline_deployment_output

val make_cancel_service_pipeline_deployment_input :
  service_name:resource_name -> unit -> cancel_service_pipeline_deployment_input

val make_service_instance :
  ?deployment_status_message:status_message ->
  ?spec:spec_contents ->
  ?last_client_request_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  name:resource_name ->
  arn:service_instance_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  service_name:resource_name ->
  environment_name:resource_name ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  deployment_status:deployment_status ->
  unit ->
  service_instance

val make_cancel_service_instance_deployment_output :
  service_instance:service_instance -> unit -> cancel_service_instance_deployment_output

val make_cancel_service_instance_deployment_input :
  service_instance_name:resource_name ->
  service_name:resource_name ->
  unit ->
  cancel_service_instance_deployment_input

val make_environment :
  ?description:description ->
  ?deployment_status_message:status_message ->
  ?proton_service_role_arn:arn ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?environment_account_id:aws_account_id ->
  ?spec:spec_contents ->
  ?provisioning:provisioning ->
  ?provisioning_repository:repository_branch ->
  ?component_role_arn:role_arn ->
  ?codebuild_role_arn:role_arn ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  name:resource_name ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:environment_arn ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  deployment_status:deployment_status ->
  unit ->
  environment

val make_cancel_environment_deployment_output :
  environment:environment -> unit -> cancel_environment_deployment_output

val make_cancel_environment_deployment_input :
  environment_name:resource_name -> unit -> cancel_environment_deployment_input

val make_component :
  ?description:description ->
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?deployment_status_message:status_message ->
  ?service_spec:spec_contents ->
  ?last_client_request_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  name:resource_name ->
  arn:component_arn ->
  environment_name:resource_name ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  deployment_status:deployment_status ->
  unit ->
  component

val make_cancel_component_deployment_output :
  component:component -> unit -> cancel_component_deployment_output

val make_cancel_component_deployment_input :
  component_name:resource_name -> unit -> cancel_component_deployment_input

val make_compatible_environment_template :
  template_name:resource_name ->
  major_version:template_version_part ->
  unit ->
  compatible_environment_template

val make_compatible_environment_template_input :
  template_name:resource_name ->
  major_version:template_version_part ->
  unit ->
  compatible_environment_template_input

val make_component_state :
  ?service_name:resource_name_or_empty ->
  ?service_instance_name:resource_name_or_empty ->
  ?service_spec:spec_contents ->
  ?template_file:template_file_contents ->
  unit ->
  component_state

val make_component_summary :
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?deployment_status_message:status_message ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  name:resource_name ->
  arn:component_arn ->
  environment_name:resource_name ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  deployment_status:deployment_status ->
  unit ->
  component_summary

val make_create_component_output : component:component -> unit -> create_component_output

val make_create_component_input :
  ?description:description ->
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?environment_name:resource_name ->
  ?service_spec:spec_contents ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  name:resource_name ->
  template_file:template_file_contents ->
  manifest:template_manifest_contents ->
  unit ->
  create_component_input

val make_create_environment_output : environment:environment -> unit -> create_environment_output

val make_repository_branch_input :
  provider:repository_provider ->
  name:repository_name ->
  branch:git_branch_name ->
  unit ->
  repository_branch_input

val make_create_environment_input :
  ?template_minor_version:template_version_part ->
  ?description:description ->
  ?proton_service_role_arn:arn ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?tags:tag_list ->
  ?provisioning_repository:repository_branch_input ->
  ?component_role_arn:role_arn ->
  ?codebuild_role_arn:role_arn ->
  name:resource_name ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  spec:spec_contents ->
  unit ->
  create_environment_input

val make_create_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  create_environment_account_connection_output

val make_create_environment_account_connection_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?tags:tag_list ->
  ?component_role_arn:role_arn ->
  ?codebuild_role_arn:role_arn ->
  management_account_id:aws_account_id ->
  environment_name:resource_name ->
  unit ->
  create_environment_account_connection_input

val make_environment_template :
  ?display_name:display_name ->
  ?description:description ->
  ?recommended_version:full_template_version_number ->
  ?encryption_key:arn ->
  ?provisioning:provisioning ->
  name:resource_name ->
  arn:environment_template_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  environment_template

val make_create_environment_template_output :
  environment_template:environment_template -> unit -> create_environment_template_output

val make_create_environment_template_input :
  ?display_name:display_name ->
  ?description:description ->
  ?encryption_key:arn ->
  ?provisioning:provisioning ->
  ?tags:tag_list ->
  name:resource_name ->
  unit ->
  create_environment_template_input

val make_environment_template_version :
  ?recommended_minor_version:template_version_part ->
  ?status_message:status_message ->
  ?description:description ->
  ?schema:template_schema ->
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  status:template_version_status ->
  arn:environment_template_version_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  environment_template_version

val make_create_environment_template_version_output :
  environment_template_version:environment_template_version ->
  unit ->
  create_environment_template_version_output

val make_s3_object_source : bucket:s3_bucket -> key:s3_key -> unit -> s3_object_source

val make_create_environment_template_version_input :
  ?client_token:client_token ->
  ?description:description ->
  ?major_version:template_version_part ->
  ?tags:tag_list ->
  template_name:resource_name ->
  source:template_version_source_input ->
  unit ->
  create_environment_template_version_input

val make_repository :
  ?encryption_key:arn ->
  arn:repository_arn ->
  provider:repository_provider ->
  name:repository_name ->
  connection_arn:arn ->
  unit ->
  repository

val make_create_repository_output : repository:repository -> unit -> create_repository_output

val make_create_repository_input :
  ?encryption_key:arn ->
  ?tags:tag_list ->
  provider:repository_provider ->
  name:repository_name ->
  connection_arn:arn ->
  unit ->
  create_repository_input

val make_service :
  ?description:description ->
  ?status_message:status_message ->
  ?pipeline:service_pipeline ->
  ?repository_connection_arn:arn ->
  ?repository_id:repository_id ->
  ?branch_name:git_branch_name ->
  name:resource_name ->
  arn:service_arn ->
  template_name:resource_name ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:service_status ->
  spec:spec_contents ->
  unit ->
  service

val make_create_service_output : service:service -> unit -> create_service_output

val make_create_service_input :
  ?description:description ->
  ?template_minor_version:template_version_part ->
  ?repository_connection_arn:arn ->
  ?repository_id:repository_id ->
  ?branch_name:git_branch_name ->
  ?tags:tag_list ->
  name:resource_name ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  spec:spec_contents ->
  unit ->
  create_service_input

val make_create_service_instance_output :
  service_instance:service_instance -> unit -> create_service_instance_output

val make_create_service_instance_input :
  ?template_major_version:template_version_part ->
  ?template_minor_version:template_version_part ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  name:resource_name ->
  service_name:resource_name ->
  spec:spec_contents ->
  unit ->
  create_service_instance_input

val make_service_sync_config :
  service_name:resource_name ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  branch:git_branch_name ->
  file_path:ops_file_path ->
  unit ->
  service_sync_config

val make_create_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> create_service_sync_config_output

val make_create_service_sync_config_input :
  service_name:resource_name ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  branch:git_branch_name ->
  file_path:ops_file_path ->
  unit ->
  create_service_sync_config_input

val make_service_template :
  ?display_name:display_name ->
  ?description:description ->
  ?recommended_version:full_template_version_number ->
  ?encryption_key:arn ->
  ?pipeline_provisioning:provisioning ->
  name:resource_name ->
  arn:service_template_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  service_template

val make_create_service_template_output :
  service_template:service_template -> unit -> create_service_template_output

val make_create_service_template_input :
  ?display_name:display_name ->
  ?description:description ->
  ?encryption_key:arn ->
  ?pipeline_provisioning:provisioning ->
  ?tags:tag_list ->
  name:resource_name ->
  unit ->
  create_service_template_input

val make_service_template_version :
  ?recommended_minor_version:template_version_part ->
  ?status_message:status_message ->
  ?description:description ->
  ?schema:template_schema ->
  ?supported_component_sources:service_template_supported_component_source_input_list ->
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  status:template_version_status ->
  arn:service_template_version_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  compatible_environment_templates:compatible_environment_template_list ->
  unit ->
  service_template_version

val make_create_service_template_version_output :
  service_template_version:service_template_version ->
  unit ->
  create_service_template_version_output

val make_create_service_template_version_input :
  ?client_token:client_token ->
  ?description:description ->
  ?major_version:template_version_part ->
  ?tags:tag_list ->
  ?supported_component_sources:service_template_supported_component_source_input_list ->
  template_name:resource_name ->
  source:template_version_source_input ->
  compatible_environment_templates:compatible_environment_template_input_list ->
  unit ->
  create_service_template_version_input

val make_template_sync_config :
  ?subdirectory:subdirectory ->
  template_name:resource_name ->
  template_type:template_type ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  branch:git_branch_name ->
  unit ->
  template_sync_config

val make_create_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> create_template_sync_config_output

val make_create_template_sync_config_input :
  ?subdirectory:subdirectory ->
  template_name:resource_name ->
  template_type:template_type ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  branch:git_branch_name ->
  unit ->
  create_template_sync_config_input

val make_delete_component_output : ?component:component -> unit -> delete_component_output
val make_delete_component_input : name:resource_name -> unit -> delete_component_input

val make_service_pipeline_state :
  ?spec:spec_contents ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  unit ->
  service_pipeline_state

val make_environment_state :
  ?spec:spec_contents ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  unit ->
  environment_state

val make_service_instance_state :
  ?last_successful_component_deployment_ids:component_deployment_id_list ->
  ?last_successful_environment_deployment_id:deployment_id ->
  ?last_successful_service_pipeline_deployment_id:deployment_id ->
  spec:spec_contents ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  unit ->
  service_instance_state

val make_deployment :
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?component_name:resource_name ->
  ?deployment_status_message:status_message ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  ?initial_state:deployment_state ->
  ?target_state:deployment_state ->
  id:deployment_id ->
  arn:deployment_arn ->
  target_arn:arn ->
  target_resource_created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  target_resource_type:deployment_target_resource_type ->
  environment_name:resource_name ->
  deployment_status:deployment_status ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  deployment

val make_delete_deployment_output : ?deployment:deployment -> unit -> delete_deployment_output
val make_delete_deployment_input : id:deployment_id -> unit -> delete_deployment_input
val make_delete_environment_output : ?environment:environment -> unit -> delete_environment_output
val make_delete_environment_input : name:resource_name -> unit -> delete_environment_input

val make_delete_environment_account_connection_output :
  ?environment_account_connection:environment_account_connection ->
  unit ->
  delete_environment_account_connection_output

val make_delete_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> delete_environment_account_connection_input

val make_delete_environment_template_output :
  ?environment_template:environment_template -> unit -> delete_environment_template_output

val make_delete_environment_template_input :
  name:resource_name -> unit -> delete_environment_template_input

val make_delete_environment_template_version_output :
  ?environment_template_version:environment_template_version ->
  unit ->
  delete_environment_template_version_output

val make_delete_environment_template_version_input :
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  unit ->
  delete_environment_template_version_input

val make_delete_repository_output : ?repository:repository -> unit -> delete_repository_output

val make_delete_repository_input :
  provider:repository_provider -> name:repository_name -> unit -> delete_repository_input

val make_delete_service_output : ?service:service -> unit -> delete_service_output
val make_delete_service_input : name:resource_name -> unit -> delete_service_input

val make_delete_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> delete_service_sync_config_output

val make_delete_service_sync_config_input :
  service_name:resource_name -> unit -> delete_service_sync_config_input

val make_delete_service_template_output :
  ?service_template:service_template -> unit -> delete_service_template_output

val make_delete_service_template_input : name:resource_name -> unit -> delete_service_template_input

val make_delete_service_template_version_output :
  ?service_template_version:service_template_version ->
  unit ->
  delete_service_template_version_output

val make_delete_service_template_version_input :
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  unit ->
  delete_service_template_version_input

val make_delete_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> delete_template_sync_config_output

val make_delete_template_sync_config_input :
  template_name:resource_name ->
  template_type:template_type ->
  unit ->
  delete_template_sync_config_input

val make_deployment_summary :
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?component_name:resource_name ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  id:deployment_id ->
  arn:deployment_arn ->
  target_arn:arn ->
  target_resource_created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  target_resource_type:deployment_target_resource_type ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  environment_name:resource_name ->
  deployment_status:deployment_status ->
  unit ->
  deployment_summary

val make_environment_account_connection_summary :
  ?component_role_arn:arn ->
  id:environment_account_connection_id ->
  arn:environment_account_connection_arn ->
  management_account_id:aws_account_id ->
  environment_account_id:aws_account_id ->
  role_arn:arn ->
  environment_name:resource_name ->
  requested_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:environment_account_connection_status ->
  unit ->
  environment_account_connection_summary

val make_environment_summary :
  ?description:description ->
  ?deployment_status_message:status_message ->
  ?proton_service_role_arn:arn ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?environment_account_id:aws_account_id ->
  ?provisioning:provisioning ->
  ?component_role_arn:arn ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  name:resource_name ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:environment_arn ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  deployment_status:deployment_status ->
  unit ->
  environment_summary

val make_environment_template_filter :
  template_name:resource_name ->
  major_version:template_version_part ->
  unit ->
  environment_template_filter

val make_environment_template_summary :
  ?display_name:display_name ->
  ?description:description ->
  ?recommended_version:full_template_version_number ->
  ?provisioning:provisioning ->
  name:resource_name ->
  arn:environment_template_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  environment_template_summary

val make_environment_template_version_summary :
  ?recommended_minor_version:template_version_part ->
  ?status_message:status_message ->
  ?description:description ->
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  status:template_version_status ->
  arn:environment_template_version_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  environment_template_version_summary

val make_get_account_settings_output :
  ?account_settings:account_settings -> unit -> get_account_settings_output

val make_get_account_settings_input : unit -> unit
val make_get_component_output : ?component:component -> unit -> get_component_output
val make_get_component_input : name:resource_name -> unit -> get_component_input
val make_get_deployment_output : ?deployment:deployment -> unit -> get_deployment_output

val make_get_deployment_input :
  ?environment_name:resource_name ->
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?component_name:resource_name ->
  id:deployment_id ->
  unit ->
  get_deployment_input

val make_get_environment_output : environment:environment -> unit -> get_environment_output
val make_get_environment_input : name:resource_name -> unit -> get_environment_input

val make_get_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  get_environment_account_connection_output

val make_get_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> get_environment_account_connection_input

val make_get_environment_template_output :
  environment_template:environment_template -> unit -> get_environment_template_output

val make_get_environment_template_input :
  name:resource_name -> unit -> get_environment_template_input

val make_get_environment_template_version_output :
  environment_template_version:environment_template_version ->
  unit ->
  get_environment_template_version_output

val make_get_environment_template_version_input :
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  unit ->
  get_environment_template_version_input

val make_get_repository_output : repository:repository -> unit -> get_repository_output

val make_get_repository_input :
  provider:repository_provider -> name:repository_name -> unit -> get_repository_input

val make_get_service_output : ?service:service -> unit -> get_service_output
val make_get_service_input : name:resource_name -> unit -> get_service_input

val make_get_service_instance_output :
  service_instance:service_instance -> unit -> get_service_instance_output

val make_get_service_instance_input :
  name:resource_name -> service_name:resource_name -> unit -> get_service_instance_input

val make_sync_blocker_context :
  key:Smaws_Lib.Smithy_api.Types.string_ ->
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sync_blocker_context

val make_sync_blocker :
  ?contexts:sync_blocker_contexts ->
  ?resolved_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resolved_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:blocker_type ->
  status:blocker_status ->
  created_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  sync_blocker

val make_service_sync_blocker_summary :
  ?service_instance_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?latest_blockers:latest_sync_blockers ->
  service_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  service_sync_blocker_summary

val make_get_service_sync_blocker_summary_output :
  ?service_sync_blocker_summary:service_sync_blocker_summary ->
  unit ->
  get_service_sync_blocker_summary_output

val make_get_service_sync_blocker_summary_input :
  ?service_instance_name:resource_name ->
  service_name:resource_name ->
  unit ->
  get_service_sync_blocker_summary_input

val make_get_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> get_service_sync_config_output

val make_get_service_sync_config_input :
  service_name:resource_name -> unit -> get_service_sync_config_input

val make_get_service_template_output :
  service_template:service_template -> unit -> get_service_template_output

val make_get_service_template_input : name:resource_name -> unit -> get_service_template_input

val make_get_service_template_version_output :
  service_template_version:service_template_version -> unit -> get_service_template_version_output

val make_get_service_template_version_input :
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  unit ->
  get_service_template_version_input

val make_get_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> get_template_sync_config_output

val make_get_template_sync_config_input :
  template_name:resource_name ->
  template_type:template_type ->
  unit ->
  get_template_sync_config_input

val make_list_component_outputs_output :
  ?next_token:empty_next_token -> outputs:outputs_list -> unit -> list_component_outputs_output

val make_list_component_outputs_input :
  ?next_token:empty_next_token ->
  ?deployment_id:deployment_id ->
  component_name:resource_name ->
  unit ->
  list_component_outputs_input

val make_provisioned_resource :
  ?name:provisioned_resource_name ->
  ?identifier:provisioned_resource_identifier ->
  ?provisioning_engine:provisioned_resource_engine ->
  unit ->
  provisioned_resource

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

val make_list_components_output :
  ?next_token:next_token -> components:component_summary_list -> unit -> list_components_output

val make_list_components_input :
  ?next_token:next_token ->
  ?environment_name:resource_name ->
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?max_results:max_page_results ->
  unit ->
  list_components_input

val make_list_deployments_output :
  ?next_token:next_token -> deployments:deployment_summary_list -> unit -> list_deployments_output

val make_list_deployments_input :
  ?next_token:next_token ->
  ?environment_name:resource_name ->
  ?service_name:resource_name ->
  ?service_instance_name:resource_name ->
  ?component_name:resource_name ->
  ?max_results:max_page_results ->
  unit ->
  list_deployments_input

val make_list_environment_account_connections_output :
  ?next_token:next_token ->
  environment_account_connections:environment_account_connection_summary_list ->
  unit ->
  list_environment_account_connections_output

val make_list_environment_account_connections_input :
  ?environment_name:resource_name ->
  ?statuses:environment_account_connection_status_list ->
  ?next_token:next_token ->
  ?max_results:max_page_results ->
  requested_by:environment_account_connection_requester_account_type ->
  unit ->
  list_environment_account_connections_input

val make_list_environment_outputs_output :
  ?next_token:empty_next_token -> outputs:outputs_list -> unit -> list_environment_outputs_output

val make_list_environment_outputs_input :
  ?next_token:empty_next_token ->
  ?deployment_id:deployment_id ->
  environment_name:resource_name ->
  unit ->
  list_environment_outputs_input

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

val make_list_environment_template_versions_output :
  ?next_token:next_token ->
  template_versions:environment_template_version_summary_list ->
  unit ->
  list_environment_template_versions_output

val make_list_environment_template_versions_input :
  ?next_token:next_token ->
  ?max_results:max_page_results ->
  ?major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  list_environment_template_versions_input

val make_list_environment_templates_output :
  ?next_token:next_token ->
  templates:environment_template_summary_list ->
  unit ->
  list_environment_templates_output

val make_list_environment_templates_input :
  ?next_token:next_token ->
  ?max_results:max_page_results ->
  unit ->
  list_environment_templates_input

val make_list_environments_output :
  ?next_token:next_token ->
  environments:environment_summary_list ->
  unit ->
  list_environments_output

val make_list_environments_input :
  ?next_token:next_token ->
  ?max_results:max_page_results ->
  ?environment_templates:environment_template_filter_list ->
  unit ->
  list_environments_input

val make_repository_summary :
  arn:repository_arn ->
  provider:repository_provider ->
  name:repository_name ->
  connection_arn:arn ->
  unit ->
  repository_summary

val make_list_repositories_output :
  ?next_token:next_token -> repositories:repository_summary_list -> unit -> list_repositories_output

val make_list_repositories_input :
  ?next_token:next_token -> ?max_results:max_page_results -> unit -> list_repositories_input

val make_list_service_instance_outputs_output :
  ?next_token:empty_next_token ->
  outputs:outputs_list ->
  unit ->
  list_service_instance_outputs_output

val make_list_service_instance_outputs_input :
  ?next_token:empty_next_token ->
  ?deployment_id:deployment_id ->
  service_instance_name:resource_name ->
  service_name:resource_name ->
  unit ->
  list_service_instance_outputs_input

val make_list_service_instance_provisioned_resources_output :
  ?next_token:empty_next_token ->
  provisioned_resources:provisioned_resource_list ->
  unit ->
  list_service_instance_provisioned_resources_output

val make_list_service_instance_provisioned_resources_input :
  ?next_token:empty_next_token ->
  service_name:resource_name ->
  service_instance_name:resource_name ->
  unit ->
  list_service_instance_provisioned_resources_input

val make_service_instance_summary :
  ?deployment_status_message:status_message ->
  ?last_attempted_deployment_id:deployment_id ->
  ?last_succeeded_deployment_id:deployment_id ->
  name:resource_name ->
  arn:service_instance_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  service_name:resource_name ->
  environment_name:resource_name ->
  template_name:resource_name ->
  template_major_version:template_version_part ->
  template_minor_version:template_version_part ->
  deployment_status:deployment_status ->
  unit ->
  service_instance_summary

val make_list_service_instances_output :
  ?next_token:next_token ->
  service_instances:service_instance_summary_list ->
  unit ->
  list_service_instances_output

val make_list_service_instances_filter :
  ?key:list_service_instances_filter_by ->
  ?value:list_service_instances_filter_value ->
  unit ->
  list_service_instances_filter

val make_list_service_instances_input :
  ?service_name:resource_name ->
  ?next_token:next_token ->
  ?max_results:max_page_results ->
  ?filters:list_service_instances_filter_list ->
  ?sort_by:list_service_instances_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_service_instances_input

val make_list_service_pipeline_outputs_output :
  ?next_token:empty_next_token ->
  outputs:outputs_list ->
  unit ->
  list_service_pipeline_outputs_output

val make_list_service_pipeline_outputs_input :
  ?next_token:empty_next_token ->
  ?deployment_id:deployment_id ->
  service_name:resource_name ->
  unit ->
  list_service_pipeline_outputs_input

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

val make_service_template_version_summary :
  ?recommended_minor_version:template_version_part ->
  ?status_message:status_message ->
  ?description:description ->
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  status:template_version_status ->
  arn:service_template_version_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  service_template_version_summary

val make_list_service_template_versions_output :
  ?next_token:next_token ->
  template_versions:service_template_version_summary_list ->
  unit ->
  list_service_template_versions_output

val make_list_service_template_versions_input :
  ?next_token:next_token ->
  ?max_results:max_page_results ->
  ?major_version:template_version_part ->
  template_name:resource_name ->
  unit ->
  list_service_template_versions_input

val make_service_template_summary :
  ?display_name:display_name ->
  ?description:description ->
  ?recommended_version:full_template_version_number ->
  ?pipeline_provisioning:provisioning ->
  name:resource_name ->
  arn:service_template_arn ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  service_template_summary

val make_list_service_templates_output :
  ?next_token:next_token ->
  templates:service_template_summary_list ->
  unit ->
  list_service_templates_output

val make_list_service_templates_input :
  ?next_token:next_token -> ?max_results:max_page_results -> unit -> list_service_templates_input

val make_service_summary :
  ?description:description ->
  ?status_message:status_message ->
  name:resource_name ->
  arn:service_arn ->
  template_name:resource_name ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:service_status ->
  unit ->
  service_summary

val make_list_services_output :
  ?next_token:next_token -> services:service_summary_list -> unit -> list_services_output

val make_list_services_input :
  ?next_token:next_token -> ?max_results:max_page_results -> unit -> list_services_input

val make_reject_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  reject_environment_account_connection_output

val make_reject_environment_account_connection_input :
  id:environment_account_connection_id -> unit -> reject_environment_account_connection_input

val make_update_account_settings_output :
  account_settings:account_settings -> unit -> update_account_settings_output

val make_update_account_settings_input :
  ?pipeline_service_role_arn:role_arn_or_empty_string ->
  ?pipeline_provisioning_repository:repository_branch_input ->
  ?delete_pipeline_provisioning_repository:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?pipeline_codebuild_role_arn:role_arn_or_empty_string ->
  unit ->
  update_account_settings_input

val make_update_component_output : component:component -> unit -> update_component_output

val make_update_component_input :
  ?description:description ->
  ?service_name:resource_name_or_empty ->
  ?service_instance_name:resource_name_or_empty ->
  ?service_spec:spec_contents ->
  ?template_file:template_file_contents ->
  ?client_token:client_token ->
  name:resource_name ->
  deployment_type:component_deployment_update_type ->
  unit ->
  update_component_input

val make_update_environment_output : environment:environment -> unit -> update_environment_output

val make_update_environment_input :
  ?description:description ->
  ?spec:spec_contents ->
  ?template_major_version:template_version_part ->
  ?template_minor_version:template_version_part ->
  ?proton_service_role_arn:arn ->
  ?environment_account_connection_id:environment_account_connection_id ->
  ?provisioning_repository:repository_branch_input ->
  ?component_role_arn:role_arn ->
  ?codebuild_role_arn:role_arn ->
  name:resource_name ->
  deployment_type:deployment_update_type ->
  unit ->
  update_environment_input

val make_update_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
  unit ->
  update_environment_account_connection_output

val make_update_environment_account_connection_input :
  ?role_arn:role_arn ->
  ?component_role_arn:role_arn ->
  ?codebuild_role_arn:role_arn ->
  id:environment_account_connection_id ->
  unit ->
  update_environment_account_connection_input

val make_update_environment_template_output :
  environment_template:environment_template -> unit -> update_environment_template_output

val make_update_environment_template_input :
  ?display_name:display_name ->
  ?description:description ->
  name:resource_name ->
  unit ->
  update_environment_template_input

val make_update_environment_template_version_output :
  environment_template_version:environment_template_version ->
  unit ->
  update_environment_template_version_output

val make_update_environment_template_version_input :
  ?description:description ->
  ?status:template_version_status ->
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  unit ->
  update_environment_template_version_input

val make_update_service_output : service:service -> unit -> update_service_output

val make_update_service_input :
  ?description:description ->
  ?spec:spec_contents ->
  name:resource_name ->
  unit ->
  update_service_input

val make_update_service_instance_output :
  service_instance:service_instance -> unit -> update_service_instance_output

val make_update_service_instance_input :
  ?spec:spec_contents ->
  ?template_major_version:template_version_part ->
  ?template_minor_version:template_version_part ->
  ?client_token:client_token ->
  name:resource_name ->
  service_name:resource_name ->
  deployment_type:deployment_update_type ->
  unit ->
  update_service_instance_input

val make_update_service_pipeline_output :
  pipeline:service_pipeline -> unit -> update_service_pipeline_output

val make_update_service_pipeline_input :
  ?template_major_version:template_version_part ->
  ?template_minor_version:template_version_part ->
  service_name:resource_name ->
  spec:spec_contents ->
  deployment_type:deployment_update_type ->
  unit ->
  update_service_pipeline_input

val make_update_service_sync_blocker_output :
  ?service_instance_name:resource_name ->
  service_name:resource_name ->
  service_sync_blocker:sync_blocker ->
  unit ->
  update_service_sync_blocker_output

val make_update_service_sync_blocker_input :
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  resolved_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_service_sync_blocker_input

val make_update_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit -> update_service_sync_config_output

val make_update_service_sync_config_input :
  service_name:resource_name ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  branch:git_branch_name ->
  file_path:ops_file_path ->
  unit ->
  update_service_sync_config_input

val make_update_service_template_output :
  service_template:service_template -> unit -> update_service_template_output

val make_update_service_template_input :
  ?display_name:display_name ->
  ?description:description ->
  name:resource_name ->
  unit ->
  update_service_template_input

val make_update_service_template_version_output :
  service_template_version:service_template_version ->
  unit ->
  update_service_template_version_output

val make_update_service_template_version_input :
  ?description:description ->
  ?status:template_version_status ->
  ?compatible_environment_templates:compatible_environment_template_input_list ->
  ?supported_component_sources:service_template_supported_component_source_input_list ->
  template_name:resource_name ->
  major_version:template_version_part ->
  minor_version:template_version_part ->
  unit ->
  update_service_template_version_input

val make_update_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit -> update_template_sync_config_output

val make_update_template_sync_config_input :
  ?subdirectory:subdirectory ->
  template_name:resource_name ->
  template_type:template_type ->
  repository_provider:repository_provider ->
  repository_name:repository_name ->
  branch:git_branch_name ->
  unit ->
  update_template_sync_config_input
