open Types

val make_resource_attribute :
  type_:resource_attribute_type -> value:resource_attribute_value -> unit -> resource_attribute

val make_put_resource_attributes_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  resource_attribute_list:resource_attribute_list ->
  unit ->
  put_resource_attributes_request

val make_task :
  ?status_detail:status_detail ->
  ?progress_percent:progress_percent ->
  status:status ->
  unit ->
  task

val make_notify_migration_task_state_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  task:task ->
  update_date_time:update_date_time ->
  next_update_seconds:next_update_seconds ->
  unit ->
  notify_migration_task_state_request

val make_notify_application_state_request :
  ?update_date_time:update_date_time ->
  ?dry_run:dry_run ->
  application_id:application_id ->
  status:application_status ->
  unit ->
  notify_application_state_request

val make_source_resource :
  ?description:source_resource_description ->
  ?status_detail:status_detail ->
  name:source_resource_name ->
  unit ->
  source_resource

val make_list_source_resources_request :
  ?next_token:token ->
  ?max_results:max_results_source_resources ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  unit ->
  list_source_resources_request

val make_progress_update_stream_summary :
  ?progress_update_stream_name:progress_update_stream -> unit -> progress_update_stream_summary

val make_list_progress_update_streams_request :
  ?next_token:token -> ?max_results:max_results -> unit -> list_progress_update_streams_request

val make_migration_task_update :
  ?update_date_time:update_date_time ->
  ?update_type:update_type ->
  ?migration_task_state:task ->
  unit ->
  migration_task_update

val make_list_migration_task_updates_request :
  ?next_token:token ->
  ?max_results:max_results ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  unit ->
  list_migration_task_updates_request

val make_migration_task_summary :
  ?progress_update_stream:progress_update_stream ->
  ?migration_task_name:migration_task_name ->
  ?status:status ->
  ?progress_percent:progress_percent ->
  ?status_detail:status_detail ->
  ?update_date_time:update_date_time ->
  unit ->
  migration_task_summary

val make_list_migration_tasks_request :
  ?next_token:token ->
  ?max_results:max_results ->
  ?resource_name:resource_name ->
  unit ->
  list_migration_tasks_request

val make_discovered_resource :
  ?description:discovered_resource_description ->
  configuration_id:configuration_id ->
  unit ->
  discovered_resource

val make_list_discovered_resources_request :
  ?next_token:token ->
  ?max_results:max_results_resources ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  unit ->
  list_discovered_resources_request

val make_created_artifact :
  ?description:created_artifact_description ->
  name:created_artifact_name ->
  unit ->
  created_artifact

val make_list_created_artifacts_request :
  ?next_token:token ->
  ?max_results:max_results_created_artifacts ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  unit ->
  list_created_artifacts_request

val make_application_state :
  ?application_id:application_id ->
  ?application_status:application_status ->
  ?last_updated_time:update_date_time ->
  unit ->
  application_state

val make_list_application_states_request :
  ?application_ids:application_ids ->
  ?next_token:token ->
  ?max_results:max_results ->
  unit ->
  list_application_states_request

val make_import_migration_task_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  unit ->
  import_migration_task_request

val make_disassociate_source_resource_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  source_resource_name:source_resource_name ->
  unit ->
  disassociate_source_resource_request

val make_disassociate_discovered_resource_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  configuration_id:configuration_id ->
  unit ->
  disassociate_discovered_resource_request

val make_disassociate_created_artifact_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  created_artifact_name:created_artifact_name ->
  unit ->
  disassociate_created_artifact_request

val make_migration_task :
  ?progress_update_stream:progress_update_stream ->
  ?migration_task_name:migration_task_name ->
  ?task:task ->
  ?update_date_time:update_date_time ->
  ?resource_attribute_list:latest_resource_attribute_list ->
  unit ->
  migration_task

val make_describe_migration_task_request :
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  unit ->
  describe_migration_task_request

val make_describe_application_state_request :
  application_id:application_id -> unit -> describe_application_state_request

val make_delete_progress_update_stream_request :
  ?dry_run:dry_run ->
  progress_update_stream_name:progress_update_stream ->
  unit ->
  delete_progress_update_stream_request

val make_create_progress_update_stream_request :
  ?dry_run:dry_run ->
  progress_update_stream_name:progress_update_stream ->
  unit ->
  create_progress_update_stream_request

val make_associate_source_resource_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  source_resource:source_resource ->
  unit ->
  associate_source_resource_request

val make_associate_discovered_resource_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  discovered_resource:discovered_resource ->
  unit ->
  associate_discovered_resource_request

val make_associate_created_artifact_request :
  ?dry_run:dry_run ->
  progress_update_stream:progress_update_stream ->
  migration_task_name:migration_task_name ->
  created_artifact:created_artifact ->
  unit ->
  associate_created_artifact_request
