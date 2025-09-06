open Types
val make_vpc_configuration :
  ?tls_certificate:tls_certificate ->
    security_group_ids:security_group_ids ->
      subnet_ids:subnet_ids -> vpc_id:vpc_id -> unit -> vpc_configuration
val make_sync_configuration :
  ?pull_request_comment:pull_request_comment ->
    ?trigger_resource_update_on:trigger_resource_update_on ->
      ?publish_deployment_status:publish_deployment_status ->
        ?config_file:deployment_file_path ->
          sync_type:sync_configuration_type ->
            role_arn:iam_role_arn ->
              resource_name:resource_name ->
                repository_name:repository_name ->
                  repository_link_id:repository_link_id ->
                    provider_type:provider_type ->
                      owner_id:owner_id ->
                        branch:branch_name -> unit -> sync_configuration
val make_update_sync_configuration_output :
  sync_configuration:sync_configuration ->
    unit -> update_sync_configuration_output
val make_update_sync_configuration_input :
  ?pull_request_comment:pull_request_comment ->
    ?trigger_resource_update_on:trigger_resource_update_on ->
      ?publish_deployment_status:publish_deployment_status ->
        ?role_arn:iam_role_arn ->
          ?repository_link_id:repository_link_id ->
            ?config_file:deployment_file_path ->
              ?branch:branch_name ->
                sync_type:sync_configuration_type ->
                  resource_name:resource_name ->
                    unit -> update_sync_configuration_input
val make_sync_blocker_context :
  value:sync_blocker_context_value ->
    key:sync_blocker_context_key -> unit -> sync_blocker_context
val make_sync_blocker :
  ?resolved_at:timestamp ->
    ?resolved_reason:resolved_reason ->
      ?contexts:sync_blocker_context_list ->
        created_at:timestamp ->
          created_reason:created_reason ->
            status:blocker_status ->
              type_:blocker_type -> id:id -> unit -> sync_blocker
val make_update_sync_blocker_output :
  ?parent_resource_name:resource_name ->
    sync_blocker:sync_blocker ->
      resource_name:resource_name -> unit -> update_sync_blocker_output
val make_update_sync_blocker_input :
  resolved_reason:resolved_reason ->
    resource_name:resource_name ->
      sync_type:sync_configuration_type ->
        id:id -> unit -> update_sync_blocker_input
val make_repository_link_info :
  ?encryption_key_arn:kms_key_arn ->
    repository_name:repository_name ->
      repository_link_id:repository_link_id ->
        repository_link_arn:repository_link_arn ->
          provider_type:provider_type ->
            owner_id:owner_id ->
              connection_arn:connection_arn -> unit -> repository_link_info
val make_update_repository_link_output :
  repository_link_info:repository_link_info ->
    unit -> update_repository_link_output
val make_update_repository_link_input :
  ?encryption_key_arn:kms_key_arn ->
    ?connection_arn:connection_arn ->
      repository_link_id:repository_link_id ->
        unit -> update_repository_link_input
val make_update_host_output : unit -> unit
val make_update_host_input :
  ?vpc_configuration:vpc_configuration ->
    ?provider_endpoint:url -> host_arn:host_arn -> unit -> update_host_input
val make_untag_resource_output : unit -> unit
val make_untag_resource_input :
  tag_keys:tag_key_list ->
    resource_arn:amazon_resource_name -> unit -> untag_resource_input
val make_tag_resource_output : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_input :
  tags:tag_list ->
    resource_arn:amazon_resource_name -> unit -> tag_resource_input
val make_sync_blocker_summary :
  ?latest_blockers:latest_sync_blocker_list ->
    ?parent_resource_name:resource_name ->
      resource_name:resource_name -> unit -> sync_blocker_summary
val make_revision :
  sha:sh_a ->
    provider_type:provider_type ->
      repository_name:repository_name ->
        owner_id:owner_id ->
          directory:directory -> branch:branch_name -> unit -> revision
val make_resource_sync_event :
  ?external_id:external_id ->
    type_:type_ ->
      time:timestamp -> event:event -> unit -> resource_sync_event
val make_resource_sync_attempt :
  target:target ->
    target_revision:revision ->
      status:resource_sync_status ->
        started_at:timestamp ->
          initial_revision:revision ->
            events:resource_sync_event_list -> unit -> resource_sync_attempt
val make_repository_sync_event :
  ?external_id:external_id ->
    type_:type_ ->
      time:timestamp -> event:event -> unit -> repository_sync_event
val make_repository_sync_definition :
  target:target ->
    parent:parent ->
      directory:directory ->
        branch:branch_name -> unit -> repository_sync_definition
val make_repository_sync_attempt :
  events:repository_sync_event_list ->
    status:repository_sync_status ->
      started_at:timestamp -> unit -> repository_sync_attempt
val make_list_tags_for_resource_output :
  ?tags:tag_list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_input
val make_list_sync_configurations_output :
  ?next_token:sharp_next_token ->
    sync_configurations:sync_configuration_list ->
      unit -> list_sync_configurations_output
val make_list_sync_configurations_input :
  ?next_token:sharp_next_token ->
    ?max_results:max_results ->
      sync_type:sync_configuration_type ->
        repository_link_id:repository_link_id ->
          unit -> list_sync_configurations_input
val make_list_repository_sync_definitions_output :
  ?next_token:sharp_next_token ->
    repository_sync_definitions:repository_sync_definition_list ->
      unit -> list_repository_sync_definitions_output
val make_list_repository_sync_definitions_input :
  sync_type:sync_configuration_type ->
    repository_link_id:repository_link_id ->
      unit -> list_repository_sync_definitions_input
val make_list_repository_links_output :
  ?next_token:sharp_next_token ->
    repository_links:repository_link_list ->
      unit -> list_repository_links_output
val make_list_repository_links_input :
  ?next_token:sharp_next_token ->
    ?max_results:max_results -> unit -> list_repository_links_input
val make_host :
  ?status_message:host_status_message ->
    ?status:host_status ->
      ?vpc_configuration:vpc_configuration ->
        ?provider_endpoint:url ->
          ?provider_type:provider_type ->
            ?host_arn:host_arn -> ?name:host_name -> unit -> host
val make_list_hosts_output :
  ?next_token:next_token -> ?hosts:host_list -> unit -> list_hosts_output
val make_list_hosts_input :
  ?next_token:next_token ->
    ?max_results:max_results -> unit -> list_hosts_input
val make_connection :
  ?host_arn:host_arn ->
    ?connection_status:connection_status ->
      ?owner_account_id:account_id ->
        ?provider_type:provider_type ->
          ?connection_arn:connection_arn ->
            ?connection_name:connection_name -> unit -> connection
val make_list_connections_output :
  ?next_token:next_token ->
    ?connections:connection_list -> unit -> list_connections_output
val make_list_connections_input :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?host_arn_filter:host_arn ->
        ?provider_type_filter:provider_type -> unit -> list_connections_input
val make_get_sync_configuration_output :
  sync_configuration:sync_configuration ->
    unit -> get_sync_configuration_output
val make_get_sync_configuration_input :
  resource_name:resource_name ->
    sync_type:sync_configuration_type -> unit -> get_sync_configuration_input
val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary ->
    unit -> get_sync_blocker_summary_output
val make_get_sync_blocker_summary_input :
  resource_name:resource_name ->
    sync_type:sync_configuration_type ->
      unit -> get_sync_blocker_summary_input
val make_get_resource_sync_status_output :
  ?latest_successful_sync:resource_sync_attempt ->
    ?desired_state:revision ->
      latest_sync:resource_sync_attempt ->
        unit -> get_resource_sync_status_output
val make_get_resource_sync_status_input :
  sync_type:sync_configuration_type ->
    resource_name:resource_name -> unit -> get_resource_sync_status_input
val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt ->
    unit -> get_repository_sync_status_output
val make_get_repository_sync_status_input :
  sync_type:sync_configuration_type ->
    repository_link_id:repository_link_id ->
      branch:branch_name -> unit -> get_repository_sync_status_input
val make_get_repository_link_output :
  repository_link_info:repository_link_info ->
    unit -> get_repository_link_output
val make_get_repository_link_input :
  repository_link_id:repository_link_id -> unit -> get_repository_link_input
val make_get_host_output :
  ?vpc_configuration:vpc_configuration ->
    ?provider_endpoint:url ->
      ?provider_type:provider_type ->
        ?status:host_status -> ?name:host_name -> unit -> get_host_output
val make_get_host_input : host_arn:host_arn -> unit -> get_host_input
val make_get_connection_output :
  ?connection:connection -> unit -> get_connection_output
val make_get_connection_input :
  connection_arn:connection_arn -> unit -> get_connection_input
val make_delete_sync_configuration_output : unit -> unit
val make_delete_sync_configuration_input :
  resource_name:resource_name ->
    sync_type:sync_configuration_type ->
      unit -> delete_sync_configuration_input
val make_delete_repository_link_output : unit -> unit
val make_delete_repository_link_input :
  repository_link_id:repository_link_id ->
    unit -> delete_repository_link_input
val make_delete_host_output : unit -> unit
val make_delete_host_input : host_arn:host_arn -> unit -> delete_host_input
val make_delete_connection_output : unit -> unit
val make_delete_connection_input :
  connection_arn:connection_arn -> unit -> delete_connection_input
val make_create_sync_configuration_output :
  sync_configuration:sync_configuration ->
    unit -> create_sync_configuration_output
val make_create_sync_configuration_input :
  ?pull_request_comment:pull_request_comment ->
    ?trigger_resource_update_on:trigger_resource_update_on ->
      ?publish_deployment_status:publish_deployment_status ->
        sync_type:sync_configuration_type ->
          role_arn:iam_role_arn ->
            resource_name:resource_name ->
              repository_link_id:repository_link_id ->
                config_file:deployment_file_path ->
                  branch:branch_name ->
                    unit -> create_sync_configuration_input
val make_create_repository_link_output :
  repository_link_info:repository_link_info ->
    unit -> create_repository_link_output
val make_create_repository_link_input :
  ?tags:tag_list ->
    ?encryption_key_arn:kms_key_arn ->
      repository_name:repository_name ->
        owner_id:owner_id ->
          connection_arn:connection_arn ->
            unit -> create_repository_link_input
val make_create_host_output :
  ?tags:tag_list -> ?host_arn:host_arn -> unit -> create_host_output
val make_create_host_input :
  ?tags:tag_list ->
    ?vpc_configuration:vpc_configuration ->
      provider_endpoint:url ->
        provider_type:provider_type ->
          name:host_name -> unit -> create_host_input
val make_create_connection_output :
  ?tags:tag_list ->
    connection_arn:connection_arn -> unit -> create_connection_output
val make_create_connection_input :
  ?host_arn:host_arn ->
    ?tags:tag_list ->
      ?provider_type:provider_type ->
        connection_name:connection_name -> unit -> create_connection_input