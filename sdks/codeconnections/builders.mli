open Types

val make_sync_configuration :
  ?config_file:deployment_file_path ->
  ?publish_deployment_status:publish_deployment_status ->
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?pull_request_comment:pull_request_comment ->
  branch:branch_name ->
  owner_id:owner_id ->
  provider_type:provider_type ->
  repository_link_id:repository_link_id ->
  repository_name:repository_name ->
  resource_name:resource_name ->
  role_arn:iam_role_arn ->
  sync_type:sync_configuration_type ->
  unit ->
  sync_configuration

val make_update_sync_configuration_output :
  sync_configuration:sync_configuration -> unit -> update_sync_configuration_output

val make_update_sync_configuration_input :
  ?branch:branch_name ->
  ?config_file:deployment_file_path ->
  ?repository_link_id:repository_link_id ->
  ?role_arn:iam_role_arn ->
  ?publish_deployment_status:publish_deployment_status ->
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?pull_request_comment:pull_request_comment ->
  resource_name:resource_name ->
  sync_type:sync_configuration_type ->
  unit ->
  update_sync_configuration_input

val make_sync_blocker_context :
  key:sync_blocker_context_key -> value:sync_blocker_context_value -> unit -> sync_blocker_context

val make_sync_blocker :
  ?contexts:sync_blocker_context_list ->
  ?resolved_reason:resolved_reason ->
  ?resolved_at:timestamp ->
  id:id ->
  type_:blocker_type ->
  status:blocker_status ->
  created_reason:created_reason ->
  created_at:timestamp ->
  unit ->
  sync_blocker

val make_update_sync_blocker_output :
  ?parent_resource_name:resource_name ->
  resource_name:resource_name ->
  sync_blocker:sync_blocker ->
  unit ->
  update_sync_blocker_output

val make_update_sync_blocker_input :
  id:id ->
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  resolved_reason:resolved_reason ->
  unit ->
  update_sync_blocker_input

val make_repository_link_info :
  ?encryption_key_arn:kms_key_arn ->
  connection_arn:connection_arn ->
  owner_id:owner_id ->
  provider_type:provider_type ->
  repository_link_arn:repository_link_arn ->
  repository_link_id:repository_link_id ->
  repository_name:repository_name ->
  unit ->
  repository_link_info

val make_update_repository_link_output :
  repository_link_info:repository_link_info -> unit -> update_repository_link_output

val make_update_repository_link_input :
  ?connection_arn:connection_arn ->
  ?encryption_key_arn:kms_key_arn ->
  repository_link_id:repository_link_id ->
  unit ->
  update_repository_link_input

val make_update_host_output : unit -> unit

val make_vpc_configuration :
  ?tls_certificate:tls_certificate ->
  vpc_id:vpc_id ->
  subnet_ids:subnet_ids ->
  security_group_ids:security_group_ids ->
  unit ->
  vpc_configuration

val make_update_host_input :
  ?provider_endpoint:url ->
  ?vpc_configuration:vpc_configuration ->
  host_arn:host_arn ->
  unit ->
  update_host_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_input :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_input

val make_list_sync_configurations_output :
  ?next_token:sharp_next_token ->
  sync_configurations:sync_configuration_list ->
  unit ->
  list_sync_configurations_output

val make_list_sync_configurations_input :
  ?max_results:max_results ->
  ?next_token:sharp_next_token ->
  repository_link_id:repository_link_id ->
  sync_type:sync_configuration_type ->
  unit ->
  list_sync_configurations_input

val make_repository_sync_definition :
  branch:branch_name ->
  directory:directory ->
  parent:parent ->
  target:target ->
  unit ->
  repository_sync_definition

val make_list_repository_sync_definitions_output :
  ?next_token:sharp_next_token ->
  repository_sync_definitions:repository_sync_definition_list ->
  unit ->
  list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  repository_link_id:repository_link_id ->
  sync_type:sync_configuration_type ->
  unit ->
  list_repository_sync_definitions_input

val make_list_repository_links_output :
  ?next_token:sharp_next_token ->
  repository_links:repository_link_list ->
  unit ->
  list_repository_links_output

val make_list_repository_links_input :
  ?max_results:max_results -> ?next_token:sharp_next_token -> unit -> list_repository_links_input

val make_host :
  ?name:host_name ->
  ?host_arn:host_arn ->
  ?provider_type:provider_type ->
  ?provider_endpoint:url ->
  ?vpc_configuration:vpc_configuration ->
  ?status:host_status ->
  ?status_message:host_status_message ->
  unit ->
  host

val make_list_hosts_output : ?hosts:host_list -> ?next_token:next_token -> unit -> list_hosts_output

val make_list_hosts_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_hosts_input

val make_connection :
  ?connection_name:connection_name ->
  ?connection_arn:connection_arn ->
  ?provider_type:provider_type ->
  ?owner_account_id:account_id ->
  ?connection_status:connection_status ->
  ?host_arn:host_arn ->
  unit ->
  connection

val make_list_connections_output :
  ?connections:connection_list -> ?next_token:next_token -> unit -> list_connections_output

val make_list_connections_input :
  ?provider_type_filter:provider_type ->
  ?host_arn_filter:host_arn ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_connections_input

val make_get_sync_configuration_output :
  sync_configuration:sync_configuration -> unit -> get_sync_configuration_output

val make_get_sync_configuration_input :
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  unit ->
  get_sync_configuration_input

val make_sync_blocker_summary :
  ?parent_resource_name:resource_name ->
  ?latest_blockers:latest_sync_blocker_list ->
  resource_name:resource_name ->
  unit ->
  sync_blocker_summary

val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary -> unit -> get_sync_blocker_summary_output

val make_get_sync_blocker_summary_input :
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  unit ->
  get_sync_blocker_summary_input

val make_revision :
  branch:branch_name ->
  directory:directory ->
  owner_id:owner_id ->
  repository_name:repository_name ->
  provider_type:provider_type ->
  sha:sh_a ->
  unit ->
  revision

val make_resource_sync_event :
  ?external_id:external_id ->
  event:event ->
  time:timestamp ->
  type_:type_ ->
  unit ->
  resource_sync_event

val make_resource_sync_attempt :
  events:resource_sync_event_list ->
  initial_revision:revision ->
  started_at:timestamp ->
  status:resource_sync_status ->
  target_revision:revision ->
  target:target ->
  unit ->
  resource_sync_attempt

val make_get_resource_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  latest_sync:resource_sync_attempt ->
  unit ->
  get_resource_sync_status_output

val make_get_resource_sync_status_input :
  resource_name:resource_name ->
  sync_type:sync_configuration_type ->
  unit ->
  get_resource_sync_status_input

val make_repository_sync_event :
  ?external_id:external_id ->
  event:event ->
  time:timestamp ->
  type_:type_ ->
  unit ->
  repository_sync_event

val make_repository_sync_attempt :
  started_at:timestamp ->
  status:repository_sync_status ->
  events:repository_sync_event_list ->
  unit ->
  repository_sync_attempt

val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt -> unit -> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  branch:branch_name ->
  repository_link_id:repository_link_id ->
  sync_type:sync_configuration_type ->
  unit ->
  get_repository_sync_status_input

val make_get_repository_link_output :
  repository_link_info:repository_link_info -> unit -> get_repository_link_output

val make_get_repository_link_input :
  repository_link_id:repository_link_id -> unit -> get_repository_link_input

val make_get_host_output :
  ?name:host_name ->
  ?status:host_status ->
  ?provider_type:provider_type ->
  ?provider_endpoint:url ->
  ?vpc_configuration:vpc_configuration ->
  unit ->
  get_host_output

val make_get_host_input : host_arn:host_arn -> unit -> get_host_input
val make_get_connection_output : ?connection:connection -> unit -> get_connection_output
val make_get_connection_input : connection_arn:connection_arn -> unit -> get_connection_input
val make_delete_sync_configuration_output : unit -> unit

val make_delete_sync_configuration_input :
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  unit ->
  delete_sync_configuration_input

val make_delete_repository_link_output : unit -> unit

val make_delete_repository_link_input :
  repository_link_id:repository_link_id -> unit -> delete_repository_link_input

val make_delete_host_output : unit -> unit
val make_delete_host_input : host_arn:host_arn -> unit -> delete_host_input
val make_delete_connection_output : unit -> unit
val make_delete_connection_input : connection_arn:connection_arn -> unit -> delete_connection_input

val make_create_sync_configuration_output :
  sync_configuration:sync_configuration -> unit -> create_sync_configuration_output

val make_create_sync_configuration_input :
  ?publish_deployment_status:publish_deployment_status ->
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?pull_request_comment:pull_request_comment ->
  branch:branch_name ->
  config_file:deployment_file_path ->
  repository_link_id:repository_link_id ->
  resource_name:resource_name ->
  role_arn:iam_role_arn ->
  sync_type:sync_configuration_type ->
  unit ->
  create_sync_configuration_input

val make_create_repository_link_output :
  repository_link_info:repository_link_info -> unit -> create_repository_link_output

val make_create_repository_link_input :
  ?encryption_key_arn:kms_key_arn ->
  ?tags:tag_list ->
  connection_arn:connection_arn ->
  owner_id:owner_id ->
  repository_name:repository_name ->
  unit ->
  create_repository_link_input

val make_create_host_output : ?host_arn:host_arn -> ?tags:tag_list -> unit -> create_host_output

val make_create_host_input :
  ?vpc_configuration:vpc_configuration ->
  ?tags:tag_list ->
  name:host_name ->
  provider_type:provider_type ->
  provider_endpoint:url ->
  unit ->
  create_host_input

val make_create_connection_output :
  ?tags:tag_list -> connection_arn:connection_arn -> unit -> create_connection_output

val make_create_connection_input :
  ?provider_type:provider_type ->
  ?tags:tag_list ->
  ?host_arn:host_arn ->
  connection_name:connection_name ->
  unit ->
  create_connection_input
