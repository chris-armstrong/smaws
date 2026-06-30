open Types
val make_template_sync_config :
  ?subdirectory:subdirectory ->
    branch:git_branch_name ->
      repository_name:repository_name ->
        repository_provider:repository_provider ->
          template_type:template_type ->
            template_name:resource_name -> unit -> template_sync_config
val make_update_template_sync_config_output :
  ?template_sync_config:template_sync_config ->
    unit -> update_template_sync_config_output
val make_update_template_sync_config_input :
  ?subdirectory:subdirectory ->
    branch:git_branch_name ->
      repository_name:repository_name ->
        repository_provider:repository_provider ->
          template_type:template_type ->
            template_name:resource_name ->
              unit -> update_template_sync_config_input
val make_compatible_environment_template :
  major_version:template_version_part ->
    template_name:resource_name -> unit -> compatible_environment_template
val make_service_template_version :
  ?supported_component_sources:service_template_supported_component_source_input_list
    ->
    ?schema:template_schema ->
      ?description:description ->
        ?status_message:status_message ->
          ?recommended_minor_version:template_version_part ->
            compatible_environment_templates:compatible_environment_template_list
              ->
              last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                  arn:service_template_version_arn ->
                    status:template_version_status ->
                      minor_version:template_version_part ->
                        major_version:template_version_part ->
                          template_name:resource_name ->
                            unit -> service_template_version
val make_update_service_template_version_output :
  service_template_version:service_template_version ->
    unit -> update_service_template_version_output
val make_compatible_environment_template_input :
  major_version:template_version_part ->
    template_name:resource_name ->
      unit -> compatible_environment_template_input
val make_update_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_input_list
    ->
    ?compatible_environment_templates:compatible_environment_template_input_list
      ->
      ?status:template_version_status ->
        ?description:description ->
          minor_version:template_version_part ->
            major_version:template_version_part ->
              template_name:resource_name ->
                unit -> update_service_template_version_input
val make_service_template :
  ?pipeline_provisioning:provisioning ->
    ?encryption_key:arn ->
      ?recommended_version:full_template_version_number ->
        ?description:description ->
          ?display_name:display_name ->
            last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
              created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                arn:service_template_arn ->
                  name:resource_name -> unit -> service_template
val make_update_service_template_output :
  service_template:service_template -> unit -> update_service_template_output
val make_update_service_template_input :
  ?description:description ->
    ?display_name:display_name ->
      name:resource_name -> unit -> update_service_template_input
val make_service_sync_config :
  file_path:ops_file_path ->
    branch:git_branch_name ->
      repository_name:repository_name ->
        repository_provider:repository_provider ->
          service_name:resource_name -> unit -> service_sync_config
val make_update_service_sync_config_output :
  ?service_sync_config:service_sync_config ->
    unit -> update_service_sync_config_output
val make_update_service_sync_config_input :
  file_path:ops_file_path ->
    branch:git_branch_name ->
      repository_name:repository_name ->
        repository_provider:repository_provider ->
          service_name:resource_name ->
            unit -> update_service_sync_config_input
val make_sync_blocker_context :
  value:Smaws_Lib.Smithy_api.Types.string_ ->
    key:Smaws_Lib.Smithy_api.Types.string_ -> unit -> sync_blocker_context
val make_sync_blocker :
  ?resolved_at:Smaws_Lib.Smithy_api.Types.timestamp ->
    ?resolved_reason:Smaws_Lib.Smithy_api.Types.string_ ->
      ?contexts:sync_blocker_contexts ->
        created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
          created_reason:Smaws_Lib.Smithy_api.Types.string_ ->
            status:blocker_status ->
              type_:blocker_type ->
                id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> sync_blocker
val make_update_service_sync_blocker_output :
  ?service_instance_name:resource_name ->
    service_sync_blocker:sync_blocker ->
      service_name:resource_name ->
        unit -> update_service_sync_blocker_output
val make_update_service_sync_blocker_input :
  resolved_reason:Smaws_Lib.Smithy_api.Types.string_ ->
    id:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> update_service_sync_blocker_input
val make_service_pipeline :
  ?last_succeeded_deployment_id:deployment_id ->
    ?last_attempted_deployment_id:deployment_id ->
      ?spec:spec_contents ->
        ?deployment_status_message:status_message ->
          deployment_status:deployment_status ->
            template_minor_version:template_version_part ->
              template_major_version:template_version_part ->
                template_name:resource_name ->
                  last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp
                    ->
                    last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
                      ->
                      created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                        arn:arn -> unit -> service_pipeline
val make_update_service_pipeline_output :
  pipeline:service_pipeline -> unit -> update_service_pipeline_output
val make_update_service_pipeline_input :
  ?template_minor_version:template_version_part ->
    ?template_major_version:template_version_part ->
      deployment_type:deployment_update_type ->
        spec:spec_contents ->
          service_name:resource_name -> unit -> update_service_pipeline_input
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
                          name:resource_name -> unit -> service
val make_update_service_output :
  service:service -> unit -> update_service_output
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
                        last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp
                          ->
                          last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
                            ->
                            created_at:Smaws_Lib.Smithy_api.Types.timestamp
                              ->
                              arn:service_instance_arn ->
                                name:resource_name ->
                                  unit -> service_instance
val make_update_service_instance_output :
  service_instance:service_instance -> unit -> update_service_instance_output
val make_update_service_instance_input :
  ?client_token:client_token ->
    ?template_minor_version:template_version_part ->
      ?template_major_version:template_version_part ->
        ?spec:spec_contents ->
          deployment_type:deployment_update_type ->
            service_name:resource_name ->
              name:resource_name -> unit -> update_service_instance_input
val make_update_service_input :
  ?spec:spec_contents ->
    ?description:description ->
      name:resource_name -> unit -> update_service_input
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
                        unit -> environment_template_version
val make_update_environment_template_version_output :
  environment_template_version:environment_template_version ->
    unit -> update_environment_template_version_output
val make_update_environment_template_version_input :
  ?status:template_version_status ->
    ?description:description ->
      minor_version:template_version_part ->
        major_version:template_version_part ->
          template_name:resource_name ->
            unit -> update_environment_template_version_input
val make_environment_template :
  ?provisioning:provisioning ->
    ?encryption_key:arn ->
      ?recommended_version:full_template_version_number ->
        ?description:description ->
          ?display_name:display_name ->
            last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
              created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                arn:environment_template_arn ->
                  name:resource_name -> unit -> environment_template
val make_update_environment_template_output :
  environment_template:environment_template ->
    unit -> update_environment_template_output
val make_update_environment_template_input :
  ?description:description ->
    ?display_name:display_name ->
      name:resource_name -> unit -> update_environment_template_input
val make_repository_branch :
  branch:git_branch_name ->
    name:repository_name ->
      provider:repository_provider ->
        arn:repository_arn -> unit -> repository_branch
val make_environment :
  ?last_succeeded_deployment_id:deployment_id ->
    ?last_attempted_deployment_id:deployment_id ->
      ?codebuild_role_arn:role_arn ->
        ?component_role_arn:role_arn ->
          ?provisioning_repository:repository_branch ->
            ?provisioning:provisioning ->
              ?spec:spec_contents ->
                ?environment_account_id:aws_account_id ->
                  ?environment_account_connection_id:environment_account_connection_id
                    ->
                    ?proton_service_role_arn:arn ->
                      ?deployment_status_message:status_message ->
                        ?description:description ->
                          deployment_status:deployment_status ->
                            template_minor_version:template_version_part ->
                              template_major_version:template_version_part ->
                                template_name:resource_name ->
                                  arn:environment_arn ->
                                    last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp
                                      ->
                                      last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
                                        ->
                                        created_at:Smaws_Lib.Smithy_api.Types.timestamp
                                          ->
                                          name:resource_name ->
                                            unit -> environment
val make_update_environment_output :
  environment:environment -> unit -> update_environment_output
val make_repository_branch_input :
  branch:git_branch_name ->
    name:repository_name ->
      provider:repository_provider -> unit -> repository_branch_input
val make_update_environment_input :
  ?codebuild_role_arn:role_arn ->
    ?component_role_arn:role_arn ->
      ?provisioning_repository:repository_branch_input ->
        ?environment_account_connection_id:environment_account_connection_id
          ->
          ?proton_service_role_arn:arn ->
            ?template_minor_version:template_version_part ->
              ?template_major_version:template_version_part ->
                ?spec:spec_contents ->
                  ?description:description ->
                    deployment_type:deployment_update_type ->
                      name:resource_name -> unit -> update_environment_input
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
                        unit -> environment_account_connection
val make_update_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
    unit -> update_environment_account_connection_output
val make_update_environment_account_connection_input :
  ?codebuild_role_arn:role_arn ->
    ?component_role_arn:role_arn ->
      ?role_arn:role_arn ->
        id:environment_account_connection_id ->
          unit -> update_environment_account_connection_input
val make_component :
  ?last_succeeded_deployment_id:deployment_id ->
    ?last_attempted_deployment_id:deployment_id ->
      ?last_client_request_token:Smaws_Lib.Smithy_api.Types.string_ ->
        ?service_spec:spec_contents ->
          ?deployment_status_message:status_message ->
            ?last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp
              ->
              ?last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
                ->
                ?service_instance_name:resource_name ->
                  ?service_name:resource_name ->
                    ?description:description ->
                      deployment_status:deployment_status ->
                        last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp
                          ->
                          created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                            environment_name:resource_name ->
                              arn:component_arn ->
                                name:resource_name -> unit -> component
val make_update_component_output :
  component:component -> unit -> update_component_output
val make_update_component_input :
  ?client_token:client_token ->
    ?template_file:template_file_contents ->
      ?service_spec:spec_contents ->
        ?service_instance_name:resource_name_or_empty ->
          ?service_name:resource_name_or_empty ->
            ?description:description ->
              deployment_type:component_deployment_update_type ->
                name:resource_name -> unit -> update_component_input
val make_account_settings :
  ?pipeline_codebuild_role_arn:role_arn_or_empty_string ->
    ?pipeline_provisioning_repository:repository_branch ->
      ?pipeline_service_role_arn:role_arn_or_empty_string ->
        unit -> account_settings
val make_update_account_settings_output :
  account_settings:account_settings -> unit -> update_account_settings_output
val make_update_account_settings_input :
  ?pipeline_codebuild_role_arn:role_arn_or_empty_string ->
    ?delete_pipeline_provisioning_repository:Smaws_Lib.Smithy_api.Types.boolean_
      ->
      ?pipeline_provisioning_repository:repository_branch_input ->
        ?pipeline_service_role_arn:role_arn_or_empty_string ->
          unit -> update_account_settings_input
val make_untag_resource_output : unit -> unit
val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_input
val make_s3_object_source :
  key:s3_key -> bucket:s3_bucket -> unit -> s3_object_source
val make_tag_resource_output : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_input :
  tags:tag_list -> resource_arn:arn -> unit -> tag_resource_input
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
                      unit -> service_template_version_summary
val make_service_template_summary :
  ?pipeline_provisioning:provisioning ->
    ?recommended_version:full_template_version_number ->
      ?description:description ->
        ?display_name:display_name ->
          last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
            created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
              arn:service_template_arn ->
                name:resource_name -> unit -> service_template_summary
val make_service_sync_blocker_summary :
  ?latest_blockers:latest_sync_blockers ->
    ?service_instance_name:Smaws_Lib.Smithy_api.Types.string_ ->
      service_name:Smaws_Lib.Smithy_api.Types.string_ ->
        unit -> service_sync_blocker_summary
val make_service_summary :
  ?status_message:status_message ->
    ?description:description ->
      status:service_status ->
        last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
          created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
            template_name:resource_name ->
              arn:service_arn ->
                name:resource_name -> unit -> service_summary
val make_service_pipeline_state :
  ?spec:spec_contents ->
    template_minor_version:template_version_part ->
      template_major_version:template_version_part ->
        template_name:resource_name -> unit -> service_pipeline_state
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
                    last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp
                      ->
                      last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
                        ->
                        created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                          arn:service_instance_arn ->
                            name:resource_name ->
                              unit -> service_instance_summary
val make_service_instance_state :
  ?last_successful_service_pipeline_deployment_id:deployment_id ->
    ?last_successful_environment_deployment_id:deployment_id ->
      ?last_successful_component_deployment_ids:component_deployment_id_list
        ->
        template_minor_version:template_version_part ->
          template_major_version:template_version_part ->
            template_name:resource_name ->
              spec:spec_contents -> unit -> service_instance_state
val make_revision :
  branch:git_branch_name ->
    directory:Smaws_Lib.Smithy_api.Types.string_ ->
      sha:sh_a ->
        repository_provider:repository_provider ->
          repository_name:repository_name -> unit -> revision
val make_resource_sync_event :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
    event:Smaws_Lib.Smithy_api.Types.string_ ->
      time:Smaws_Lib.Smithy_api.Types.timestamp ->
        type_:Smaws_Lib.Smithy_api.Types.string_ ->
          unit -> resource_sync_event
val make_resource_sync_attempt :
  events:resource_sync_events ->
    status:resource_sync_status ->
      started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
        target:Smaws_Lib.Smithy_api.Types.string_ ->
          target_revision:revision ->
            initial_revision:revision -> unit -> resource_sync_attempt
val make_resource_counts_summary :
  ?behind_minor:Smaws_Lib.Smithy_api.Types.integer ->
    ?behind_major:Smaws_Lib.Smithy_api.Types.integer ->
      ?up_to_date:Smaws_Lib.Smithy_api.Types.integer ->
        ?failed:Smaws_Lib.Smithy_api.Types.integer ->
          total:Smaws_Lib.Smithy_api.Types.integer ->
            unit -> resource_counts_summary
val make_repository_sync_event :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
    event:Smaws_Lib.Smithy_api.Types.string_ ->
      time:Smaws_Lib.Smithy_api.Types.timestamp ->
        type_:Smaws_Lib.Smithy_api.Types.string_ ->
          unit -> repository_sync_event
val make_repository_sync_definition :
  directory:Smaws_Lib.Smithy_api.Types.string_ ->
    branch:git_branch_name ->
      parent:Smaws_Lib.Smithy_api.Types.string_ ->
        target:Smaws_Lib.Smithy_api.Types.string_ ->
          unit -> repository_sync_definition
val make_repository_sync_attempt :
  events:repository_sync_events ->
    status:repository_sync_status ->
      started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
        unit -> repository_sync_attempt
val make_repository_summary :
  connection_arn:arn ->
    name:repository_name ->
      provider:repository_provider ->
        arn:repository_arn -> unit -> repository_summary
val make_repository :
  ?encryption_key:arn ->
    connection_arn:arn ->
      name:repository_name ->
        provider:repository_provider ->
          arn:repository_arn -> unit -> repository
val make_reject_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
    unit -> reject_environment_account_connection_output
val make_reject_environment_account_connection_input :
  id:environment_account_connection_id ->
    unit -> reject_environment_account_connection_input
val make_provisioned_resource :
  ?provisioning_engine:provisioned_resource_engine ->
    ?identifier:provisioned_resource_identifier ->
      ?name:provisioned_resource_name -> unit -> provisioned_resource
val make_output :
  ?value_string:output_value_string -> ?key:output_key -> unit -> output
val make_notify_resource_deployment_status_change_output : unit -> unit
val make_notify_resource_deployment_status_change_input :
  ?status_message:status_message ->
    ?deployment_id:deployment_id ->
      ?outputs:outputs_list ->
        ?status:resource_deployment_status ->
          resource_arn:arn ->
            unit -> notify_resource_deployment_status_change_input
val make_list_tags_for_resource_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
    tags:tag_list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  ?max_results:max_page_results ->
    ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
      resource_arn:arn -> unit -> list_tags_for_resource_input
val make_list_services_output :
  ?next_token:next_token ->
    services:service_summary_list -> unit -> list_services_output
val make_list_services_input :
  ?max_results:max_page_results ->
    ?next_token:next_token -> unit -> list_services_input
val make_list_service_templates_output :
  ?next_token:next_token ->
    templates:service_template_summary_list ->
      unit -> list_service_templates_output
val make_list_service_templates_input :
  ?max_results:max_page_results ->
    ?next_token:next_token -> unit -> list_service_templates_input
val make_list_service_template_versions_output :
  ?next_token:next_token ->
    template_versions:service_template_version_summary_list ->
      unit -> list_service_template_versions_output
val make_list_service_template_versions_input :
  ?major_version:template_version_part ->
    ?max_results:max_page_results ->
      ?next_token:next_token ->
        template_name:resource_name ->
          unit -> list_service_template_versions_input
val make_list_service_pipeline_provisioned_resources_output :
  ?next_token:empty_next_token ->
    provisioned_resources:provisioned_resource_list ->
      unit -> list_service_pipeline_provisioned_resources_output
val make_list_service_pipeline_provisioned_resources_input :
  ?next_token:empty_next_token ->
    service_name:resource_name ->
      unit -> list_service_pipeline_provisioned_resources_input
val make_list_service_pipeline_outputs_output :
  ?next_token:empty_next_token ->
    outputs:outputs_list -> unit -> list_service_pipeline_outputs_output
val make_list_service_pipeline_outputs_input :
  ?deployment_id:deployment_id ->
    ?next_token:empty_next_token ->
      service_name:resource_name ->
        unit -> list_service_pipeline_outputs_input
val make_list_service_instances_output :
  ?next_token:next_token ->
    service_instances:service_instance_summary_list ->
      unit -> list_service_instances_output
val make_list_service_instances_filter :
  ?value:list_service_instances_filter_value ->
    ?key:list_service_instances_filter_by ->
      unit -> list_service_instances_filter
val make_list_service_instances_input :
  ?sort_order:sort_order ->
    ?sort_by:list_service_instances_sort_by ->
      ?filters:list_service_instances_filter_list ->
        ?max_results:max_page_results ->
          ?next_token:next_token ->
            ?service_name:resource_name ->
              unit -> list_service_instances_input
val make_list_service_instance_provisioned_resources_output :
  ?next_token:empty_next_token ->
    provisioned_resources:provisioned_resource_list ->
      unit -> list_service_instance_provisioned_resources_output
val make_list_service_instance_provisioned_resources_input :
  ?next_token:empty_next_token ->
    service_instance_name:resource_name ->
      service_name:resource_name ->
        unit -> list_service_instance_provisioned_resources_input
val make_list_service_instance_outputs_output :
  ?next_token:empty_next_token ->
    outputs:outputs_list -> unit -> list_service_instance_outputs_output
val make_list_service_instance_outputs_input :
  ?deployment_id:deployment_id ->
    ?next_token:empty_next_token ->
      service_name:resource_name ->
        service_instance_name:resource_name ->
          unit -> list_service_instance_outputs_input
val make_list_repository_sync_definitions_output :
  ?next_token:empty_next_token ->
    sync_definitions:repository_sync_definition_list ->
      unit -> list_repository_sync_definitions_output
val make_list_repository_sync_definitions_input :
  ?next_token:empty_next_token ->
    sync_type:sync_type ->
      repository_provider:repository_provider ->
        repository_name:repository_name ->
          unit -> list_repository_sync_definitions_input
val make_list_repositories_output :
  ?next_token:next_token ->
    repositories:repository_summary_list -> unit -> list_repositories_output
val make_list_repositories_input :
  ?max_results:max_page_results ->
    ?next_token:next_token -> unit -> list_repositories_input
val make_environment_summary :
  ?last_succeeded_deployment_id:deployment_id ->
    ?last_attempted_deployment_id:deployment_id ->
      ?component_role_arn:arn ->
        ?provisioning:provisioning ->
          ?environment_account_id:aws_account_id ->
            ?environment_account_connection_id:environment_account_connection_id
              ->
              ?proton_service_role_arn:arn ->
                ?deployment_status_message:status_message ->
                  ?description:description ->
                    deployment_status:deployment_status ->
                      template_minor_version:template_version_part ->
                        template_major_version:template_version_part ->
                          template_name:resource_name ->
                            arn:environment_arn ->
                              last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp
                                ->
                                last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
                                  ->
                                  created_at:Smaws_Lib.Smithy_api.Types.timestamp
                                    ->
                                    name:resource_name ->
                                      unit -> environment_summary
val make_list_environments_output :
  ?next_token:next_token ->
    environments:environment_summary_list -> unit -> list_environments_output
val make_environment_template_filter :
  major_version:template_version_part ->
    template_name:resource_name -> unit -> environment_template_filter
val make_list_environments_input :
  ?environment_templates:environment_template_filter_list ->
    ?max_results:max_page_results ->
      ?next_token:next_token -> unit -> list_environments_input
val make_environment_template_summary :
  ?provisioning:provisioning ->
    ?recommended_version:full_template_version_number ->
      ?description:description ->
        ?display_name:display_name ->
          last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
            created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
              arn:environment_template_arn ->
                name:resource_name -> unit -> environment_template_summary
val make_list_environment_templates_output :
  ?next_token:next_token ->
    templates:environment_template_summary_list ->
      unit -> list_environment_templates_output
val make_list_environment_templates_input :
  ?max_results:max_page_results ->
    ?next_token:next_token -> unit -> list_environment_templates_input
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
                      unit -> environment_template_version_summary
val make_list_environment_template_versions_output :
  ?next_token:next_token ->
    template_versions:environment_template_version_summary_list ->
      unit -> list_environment_template_versions_output
val make_list_environment_template_versions_input :
  ?major_version:template_version_part ->
    ?max_results:max_page_results ->
      ?next_token:next_token ->
        template_name:resource_name ->
          unit -> list_environment_template_versions_input
val make_list_environment_provisioned_resources_output :
  ?next_token:empty_next_token ->
    provisioned_resources:provisioned_resource_list ->
      unit -> list_environment_provisioned_resources_output
val make_list_environment_provisioned_resources_input :
  ?next_token:empty_next_token ->
    environment_name:resource_name ->
      unit -> list_environment_provisioned_resources_input
val make_list_environment_outputs_output :
  ?next_token:empty_next_token ->
    outputs:outputs_list -> unit -> list_environment_outputs_output
val make_list_environment_outputs_input :
  ?deployment_id:deployment_id ->
    ?next_token:empty_next_token ->
      environment_name:resource_name ->
        unit -> list_environment_outputs_input
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
                      unit -> environment_account_connection_summary
val make_list_environment_account_connections_output :
  ?next_token:next_token ->
    environment_account_connections:environment_account_connection_summary_list
      -> unit -> list_environment_account_connections_output
val make_list_environment_account_connections_input :
  ?max_results:max_page_results ->
    ?next_token:next_token ->
      ?statuses:environment_account_connection_status_list ->
        ?environment_name:resource_name ->
          requested_by:environment_account_connection_requester_account_type
            -> unit -> list_environment_account_connections_input
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
                        target_resource_created_at:Smaws_Lib.Smithy_api.Types.timestamp
                          ->
                          target_arn:arn ->
                            arn:deployment_arn ->
                              id:deployment_id -> unit -> deployment_summary
val make_list_deployments_output :
  ?next_token:next_token ->
    deployments:deployment_summary_list -> unit -> list_deployments_output
val make_list_deployments_input :
  ?max_results:max_page_results ->
    ?component_name:resource_name ->
      ?service_instance_name:resource_name ->
        ?service_name:resource_name ->
          ?environment_name:resource_name ->
            ?next_token:next_token -> unit -> list_deployments_input
val make_component_summary :
  ?last_succeeded_deployment_id:deployment_id ->
    ?last_attempted_deployment_id:deployment_id ->
      ?deployment_status_message:status_message ->
        ?last_deployment_succeeded_at:Smaws_Lib.Smithy_api.Types.timestamp ->
          ?last_deployment_attempted_at:Smaws_Lib.Smithy_api.Types.timestamp
            ->
            ?service_instance_name:resource_name ->
              ?service_name:resource_name ->
                deployment_status:deployment_status ->
                  last_modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                    created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
                      environment_name:resource_name ->
                        arn:component_arn ->
                          name:resource_name -> unit -> component_summary
val make_list_components_output :
  ?next_token:next_token ->
    components:component_summary_list -> unit -> list_components_output
val make_list_components_input :
  ?max_results:max_page_results ->
    ?service_instance_name:resource_name ->
      ?service_name:resource_name ->
        ?environment_name:resource_name ->
          ?next_token:next_token -> unit -> list_components_input
val make_list_component_provisioned_resources_output :
  ?next_token:empty_next_token ->
    provisioned_resources:provisioned_resource_list ->
      unit -> list_component_provisioned_resources_output
val make_list_component_provisioned_resources_input :
  ?next_token:empty_next_token ->
    component_name:resource_name ->
      unit -> list_component_provisioned_resources_input
val make_list_component_outputs_output :
  ?next_token:empty_next_token ->
    outputs:outputs_list -> unit -> list_component_outputs_output
val make_list_component_outputs_input :
  ?deployment_id:deployment_id ->
    ?next_token:empty_next_token ->
      component_name:resource_name -> unit -> list_component_outputs_input
val make_get_template_sync_status_output :
  ?desired_state:revision ->
    ?latest_successful_sync:resource_sync_attempt ->
      ?latest_sync:resource_sync_attempt ->
        unit -> get_template_sync_status_output
val make_get_template_sync_status_input :
  template_version:template_version_part ->
    template_type:template_type ->
      template_name:resource_name -> unit -> get_template_sync_status_input
val make_get_template_sync_config_output :
  ?template_sync_config:template_sync_config ->
    unit -> get_template_sync_config_output
val make_get_template_sync_config_input :
  template_type:template_type ->
    template_name:resource_name -> unit -> get_template_sync_config_input
val make_get_service_template_version_output :
  service_template_version:service_template_version ->
    unit -> get_service_template_version_output
val make_get_service_template_version_input :
  minor_version:template_version_part ->
    major_version:template_version_part ->
      template_name:resource_name ->
        unit -> get_service_template_version_input
val make_get_service_template_output :
  service_template:service_template -> unit -> get_service_template_output
val make_get_service_template_input :
  name:resource_name -> unit -> get_service_template_input
val make_get_service_sync_config_output :
  ?service_sync_config:service_sync_config ->
    unit -> get_service_sync_config_output
val make_get_service_sync_config_input :
  service_name:resource_name -> unit -> get_service_sync_config_input
val make_get_service_sync_blocker_summary_output :
  ?service_sync_blocker_summary:service_sync_blocker_summary ->
    unit -> get_service_sync_blocker_summary_output
val make_get_service_sync_blocker_summary_input :
  ?service_instance_name:resource_name ->
    service_name:resource_name ->
      unit -> get_service_sync_blocker_summary_input
val make_get_service_output : ?service:service -> unit -> get_service_output
val make_get_service_instance_sync_status_output :
  ?desired_state:revision ->
    ?latest_successful_sync:resource_sync_attempt ->
      ?latest_sync:resource_sync_attempt ->
        unit -> get_service_instance_sync_status_output
val make_get_service_instance_sync_status_input :
  service_instance_name:resource_name ->
    service_name:resource_name ->
      unit -> get_service_instance_sync_status_input
val make_get_service_instance_output :
  service_instance:service_instance -> unit -> get_service_instance_output
val make_get_service_instance_input :
  service_name:resource_name ->
    name:resource_name -> unit -> get_service_instance_input
val make_get_service_input : name:resource_name -> unit -> get_service_input
val make_counts_summary :
  ?pipelines:resource_counts_summary ->
    ?service_templates:resource_counts_summary ->
      ?services:resource_counts_summary ->
        ?service_instances:resource_counts_summary ->
          ?environment_templates:resource_counts_summary ->
            ?environments:resource_counts_summary ->
              ?components:resource_counts_summary -> unit -> counts_summary
val make_get_resources_summary_output :
  counts:counts_summary -> unit -> get_resources_summary_output
val make_get_resources_summary_input : unit -> unit
val make_get_repository_sync_status_output :
  ?latest_sync:repository_sync_attempt ->
    unit -> get_repository_sync_status_output
val make_get_repository_sync_status_input :
  sync_type:sync_type ->
    branch:git_branch_name ->
      repository_provider:repository_provider ->
        repository_name:repository_name ->
          unit -> get_repository_sync_status_input
val make_get_repository_output :
  repository:repository -> unit -> get_repository_output
val make_get_repository_input :
  name:repository_name ->
    provider:repository_provider -> unit -> get_repository_input
val make_get_environment_template_version_output :
  environment_template_version:environment_template_version ->
    unit -> get_environment_template_version_output
val make_get_environment_template_version_input :
  minor_version:template_version_part ->
    major_version:template_version_part ->
      template_name:resource_name ->
        unit -> get_environment_template_version_input
val make_get_environment_template_output :
  environment_template:environment_template ->
    unit -> get_environment_template_output
val make_get_environment_template_input :
  name:resource_name -> unit -> get_environment_template_input
val make_get_environment_output :
  environment:environment -> unit -> get_environment_output
val make_get_environment_input :
  name:resource_name -> unit -> get_environment_input
val make_get_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
    unit -> get_environment_account_connection_output
val make_get_environment_account_connection_input :
  id:environment_account_connection_id ->
    unit -> get_environment_account_connection_input
val make_environment_state :
  ?spec:spec_contents ->
    template_minor_version:template_version_part ->
      template_major_version:template_version_part ->
        template_name:resource_name -> unit -> environment_state
val make_component_state :
  ?template_file:template_file_contents ->
    ?service_spec:spec_contents ->
      ?service_instance_name:resource_name_or_empty ->
        ?service_name:resource_name_or_empty -> unit -> component_state
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
                            target_resource_type:deployment_target_resource_type
                              ->
                              target_resource_created_at:Smaws_Lib.Smithy_api.Types.timestamp
                                ->
                                target_arn:arn ->
                                  arn:deployment_arn ->
                                    id:deployment_id -> unit -> deployment
val make_get_deployment_output :
  ?deployment:deployment -> unit -> get_deployment_output
val make_get_deployment_input :
  ?component_name:resource_name ->
    ?service_instance_name:resource_name ->
      ?service_name:resource_name ->
        ?environment_name:resource_name ->
          id:deployment_id -> unit -> get_deployment_input
val make_get_component_output :
  ?component:component -> unit -> get_component_output
val make_get_component_input :
  name:resource_name -> unit -> get_component_input
val make_get_account_settings_output :
  ?account_settings:account_settings -> unit -> get_account_settings_output
val make_get_account_settings_input : unit -> unit
val make_delete_template_sync_config_output :
  ?template_sync_config:template_sync_config ->
    unit -> delete_template_sync_config_output
val make_delete_template_sync_config_input :
  template_type:template_type ->
    template_name:resource_name -> unit -> delete_template_sync_config_input
val make_delete_service_template_version_output :
  ?service_template_version:service_template_version ->
    unit -> delete_service_template_version_output
val make_delete_service_template_version_input :
  minor_version:template_version_part ->
    major_version:template_version_part ->
      template_name:resource_name ->
        unit -> delete_service_template_version_input
val make_delete_service_template_output :
  ?service_template:service_template ->
    unit -> delete_service_template_output
val make_delete_service_template_input :
  name:resource_name -> unit -> delete_service_template_input
val make_delete_service_sync_config_output :
  ?service_sync_config:service_sync_config ->
    unit -> delete_service_sync_config_output
val make_delete_service_sync_config_input :
  service_name:resource_name -> unit -> delete_service_sync_config_input
val make_delete_service_output :
  ?service:service -> unit -> delete_service_output
val make_delete_service_input :
  name:resource_name -> unit -> delete_service_input
val make_delete_repository_output :
  ?repository:repository -> unit -> delete_repository_output
val make_delete_repository_input :
  name:repository_name ->
    provider:repository_provider -> unit -> delete_repository_input
val make_delete_environment_template_version_output :
  ?environment_template_version:environment_template_version ->
    unit -> delete_environment_template_version_output
val make_delete_environment_template_version_input :
  minor_version:template_version_part ->
    major_version:template_version_part ->
      template_name:resource_name ->
        unit -> delete_environment_template_version_input
val make_delete_environment_template_output :
  ?environment_template:environment_template ->
    unit -> delete_environment_template_output
val make_delete_environment_template_input :
  name:resource_name -> unit -> delete_environment_template_input
val make_delete_environment_output :
  ?environment:environment -> unit -> delete_environment_output
val make_delete_environment_input :
  name:resource_name -> unit -> delete_environment_input
val make_delete_environment_account_connection_output :
  ?environment_account_connection:environment_account_connection ->
    unit -> delete_environment_account_connection_output
val make_delete_environment_account_connection_input :
  id:environment_account_connection_id ->
    unit -> delete_environment_account_connection_input
val make_delete_deployment_output :
  ?deployment:deployment -> unit -> delete_deployment_output
val make_delete_deployment_input :
  id:deployment_id -> unit -> delete_deployment_input
val make_delete_component_output :
  ?component:component -> unit -> delete_component_output
val make_delete_component_input :
  name:resource_name -> unit -> delete_component_input
val make_create_template_sync_config_output :
  ?template_sync_config:template_sync_config ->
    unit -> create_template_sync_config_output
val make_create_template_sync_config_input :
  ?subdirectory:subdirectory ->
    branch:git_branch_name ->
      repository_name:repository_name ->
        repository_provider:repository_provider ->
          template_type:template_type ->
            template_name:resource_name ->
              unit -> create_template_sync_config_input
val make_create_service_template_version_output :
  service_template_version:service_template_version ->
    unit -> create_service_template_version_output
val make_create_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_input_list
    ->
    ?tags:tag_list ->
      ?major_version:template_version_part ->
        ?description:description ->
          ?client_token:client_token ->
            compatible_environment_templates:compatible_environment_template_input_list
              ->
              source:template_version_source_input ->
                template_name:resource_name ->
                  unit -> create_service_template_version_input
val make_create_service_template_output :
  service_template:service_template -> unit -> create_service_template_output
val make_create_service_template_input :
  ?tags:tag_list ->
    ?pipeline_provisioning:provisioning ->
      ?encryption_key:arn ->
        ?description:description ->
          ?display_name:display_name ->
            name:resource_name -> unit -> create_service_template_input
val make_create_service_sync_config_output :
  ?service_sync_config:service_sync_config ->
    unit -> create_service_sync_config_output
val make_create_service_sync_config_input :
  file_path:ops_file_path ->
    branch:git_branch_name ->
      repository_name:repository_name ->
        repository_provider:repository_provider ->
          service_name:resource_name ->
            unit -> create_service_sync_config_input
val make_create_service_output :
  service:service -> unit -> create_service_output
val make_create_service_instance_output :
  service_instance:service_instance -> unit -> create_service_instance_output
val make_create_service_instance_input :
  ?client_token:client_token ->
    ?tags:tag_list ->
      ?template_minor_version:template_version_part ->
        ?template_major_version:template_version_part ->
          spec:spec_contents ->
            service_name:resource_name ->
              name:resource_name -> unit -> create_service_instance_input
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
                    name:resource_name -> unit -> create_service_input
val make_create_repository_output :
  repository:repository -> unit -> create_repository_output
val make_create_repository_input :
  ?tags:tag_list ->
    ?encryption_key:arn ->
      connection_arn:arn ->
        name:repository_name ->
          provider:repository_provider -> unit -> create_repository_input
val make_create_environment_template_version_output :
  environment_template_version:environment_template_version ->
    unit -> create_environment_template_version_output
val make_create_environment_template_version_input :
  ?tags:tag_list ->
    ?major_version:template_version_part ->
      ?description:description ->
        ?client_token:client_token ->
          source:template_version_source_input ->
            template_name:resource_name ->
              unit -> create_environment_template_version_input
val make_create_environment_template_output :
  environment_template:environment_template ->
    unit -> create_environment_template_output
val make_create_environment_template_input :
  ?tags:tag_list ->
    ?provisioning:provisioning ->
      ?encryption_key:arn ->
        ?description:description ->
          ?display_name:display_name ->
            name:resource_name -> unit -> create_environment_template_input
val make_create_environment_output :
  environment:environment -> unit -> create_environment_output
val make_create_environment_input :
  ?codebuild_role_arn:role_arn ->
    ?component_role_arn:role_arn ->
      ?provisioning_repository:repository_branch_input ->
        ?tags:tag_list ->
          ?environment_account_connection_id:environment_account_connection_id
            ->
            ?proton_service_role_arn:arn ->
              ?description:description ->
                ?template_minor_version:template_version_part ->
                  spec:spec_contents ->
                    template_major_version:template_version_part ->
                      template_name:resource_name ->
                        name:resource_name ->
                          unit -> create_environment_input
val make_create_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
    unit -> create_environment_account_connection_output
val make_create_environment_account_connection_input :
  ?codebuild_role_arn:role_arn ->
    ?component_role_arn:role_arn ->
      ?tags:tag_list ->
        ?role_arn:role_arn ->
          ?client_token:client_token ->
            environment_name:resource_name ->
              management_account_id:aws_account_id ->
                unit -> create_environment_account_connection_input
val make_create_component_output :
  component:component -> unit -> create_component_output
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
                    name:resource_name -> unit -> create_component_input
val make_cancel_service_pipeline_deployment_output :
  pipeline:service_pipeline ->
    unit -> cancel_service_pipeline_deployment_output
val make_cancel_service_pipeline_deployment_input :
  service_name:resource_name ->
    unit -> cancel_service_pipeline_deployment_input
val make_cancel_service_instance_deployment_output :
  service_instance:service_instance ->
    unit -> cancel_service_instance_deployment_output
val make_cancel_service_instance_deployment_input :
  service_name:resource_name ->
    service_instance_name:resource_name ->
      unit -> cancel_service_instance_deployment_input
val make_cancel_environment_deployment_output :
  environment:environment -> unit -> cancel_environment_deployment_output
val make_cancel_environment_deployment_input :
  environment_name:resource_name ->
    unit -> cancel_environment_deployment_input
val make_cancel_component_deployment_output :
  component:component -> unit -> cancel_component_deployment_output
val make_cancel_component_deployment_input :
  component_name:resource_name -> unit -> cancel_component_deployment_input
val make_accept_environment_account_connection_output :
  environment_account_connection:environment_account_connection ->
    unit -> accept_environment_account_connection_output
val make_accept_environment_account_connection_input :
  id:environment_account_connection_id ->
    unit -> accept_environment_account_connection_input