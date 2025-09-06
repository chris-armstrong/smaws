open Types
val make_task :
  ?progress_percent:progress_percent ->
    ?status_detail:status_detail -> status:status -> unit -> task
val make_source_resource :
  ?status_detail:status_detail ->
    ?description:source_resource_description ->
      name:source_resource_name -> unit -> source_resource
val make_resource_attribute :
  value:resource_attribute_value ->
    type_:resource_attribute_type -> unit -> resource_attribute
val make_put_resource_attributes_request :
  ?dry_run:dry_run ->
    resource_attribute_list:resource_attribute_list ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> put_resource_attributes_request
val make_progress_update_stream_summary :
  ?progress_update_stream_name:progress_update_stream ->
    unit -> progress_update_stream_summary
val make_notify_migration_task_state_request :
  ?dry_run:dry_run ->
    next_update_seconds:next_update_seconds ->
      update_date_time:update_date_time ->
        task:task ->
          migration_task_name:migration_task_name ->
            progress_update_stream:progress_update_stream ->
              unit -> notify_migration_task_state_request
val make_notify_application_state_request :
  ?dry_run:dry_run ->
    ?update_date_time:update_date_time ->
      status:application_status ->
        application_id:application_id ->
          unit -> notify_application_state_request
val make_migration_task_update :
  ?migration_task_state:task ->
    ?update_type:update_type ->
      ?update_date_time:update_date_time -> unit -> migration_task_update
val make_migration_task_summary :
  ?update_date_time:update_date_time ->
    ?status_detail:status_detail ->
      ?progress_percent:progress_percent ->
        ?status:status ->
          ?migration_task_name:migration_task_name ->
            ?progress_update_stream:progress_update_stream ->
              unit -> migration_task_summary
val make_migration_task :
  ?resource_attribute_list:latest_resource_attribute_list ->
    ?update_date_time:update_date_time ->
      ?task:task ->
        ?migration_task_name:migration_task_name ->
          ?progress_update_stream:progress_update_stream ->
            unit -> migration_task
val make_list_source_resources_request :
  ?max_results:max_results_source_resources ->
    ?next_token:token ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> list_source_resources_request
val make_list_progress_update_streams_request :
  ?max_results:max_results ->
    ?next_token:token -> unit -> list_progress_update_streams_request
val make_list_migration_tasks_request :
  ?resource_name:resource_name ->
    ?max_results:max_results ->
      ?next_token:token -> unit -> list_migration_tasks_request
val make_list_migration_task_updates_request :
  ?max_results:max_results ->
    ?next_token:token ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> list_migration_task_updates_request
val make_discovered_resource :
  ?description:discovered_resource_description ->
    configuration_id:configuration_id -> unit -> discovered_resource
val make_list_discovered_resources_request :
  ?max_results:max_results_resources ->
    ?next_token:token ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> list_discovered_resources_request
val make_created_artifact :
  ?description:created_artifact_description ->
    name:created_artifact_name -> unit -> created_artifact
val make_list_created_artifacts_request :
  ?max_results:max_results_created_artifacts ->
    ?next_token:token ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> list_created_artifacts_request
val make_application_state :
  ?last_updated_time:update_date_time ->
    ?application_status:application_status ->
      ?application_id:application_id -> unit -> application_state
val make_list_application_states_request :
  ?max_results:max_results ->
    ?next_token:token ->
      ?application_ids:application_ids ->
        unit -> list_application_states_request
val make_import_migration_task_request :
  ?dry_run:dry_run ->
    migration_task_name:migration_task_name ->
      progress_update_stream:progress_update_stream ->
        unit -> import_migration_task_request
val make_disassociate_source_resource_request :
  ?dry_run:dry_run ->
    source_resource_name:source_resource_name ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> disassociate_source_resource_request
val make_disassociate_discovered_resource_request :
  ?dry_run:dry_run ->
    configuration_id:configuration_id ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> disassociate_discovered_resource_request
val make_disassociate_created_artifact_request :
  ?dry_run:dry_run ->
    created_artifact_name:created_artifact_name ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> disassociate_created_artifact_request
val make_describe_migration_task_request :
  migration_task_name:migration_task_name ->
    progress_update_stream:progress_update_stream ->
      unit -> describe_migration_task_request
val make_describe_application_state_request :
  application_id:application_id -> unit -> describe_application_state_request
val make_delete_progress_update_stream_request :
  ?dry_run:dry_run ->
    progress_update_stream_name:progress_update_stream ->
      unit -> delete_progress_update_stream_request
val make_create_progress_update_stream_request :
  ?dry_run:dry_run ->
    progress_update_stream_name:progress_update_stream ->
      unit -> create_progress_update_stream_request
val make_associate_source_resource_request :
  ?dry_run:dry_run ->
    source_resource:source_resource ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> associate_source_resource_request
val make_associate_discovered_resource_request :
  ?dry_run:dry_run ->
    discovered_resource:discovered_resource ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> associate_discovered_resource_request
val make_associate_created_artifact_request :
  ?dry_run:dry_run ->
    created_artifact:created_artifact ->
      migration_task_name:migration_task_name ->
        progress_update_stream:progress_update_stream ->
          unit -> associate_created_artifact_request