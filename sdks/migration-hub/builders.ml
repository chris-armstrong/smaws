open Types
let make_task ?progress_percent:(progress_percent_ : progress_percent option)
  ?status_detail:(status_detail_ : status_detail option)
  ~status:(status_ : status) () =
  ({
     progress_percent = progress_percent_;
     status_detail = status_detail_;
     status = status_
   } : task)
let make_source_resource
  ?status_detail:(status_detail_ : status_detail option)
  ?description:(description_ : source_resource_description option)
  ~name:(name_ : source_resource_name) () =
  ({ status_detail = status_detail_; description = description_; name = name_
   } : source_resource)
let make_resource_attribute ~value:(value_ : resource_attribute_value)
  ~type_:(type__ : resource_attribute_type) () =
  ({ value = value_; type_ = type__ } : resource_attribute)
let make_put_resource_attributes_request ?dry_run:(dry_run_ : dry_run option)
  ~resource_attribute_list:(resource_attribute_list_ :
                             resource_attribute_list)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     resource_attribute_list = resource_attribute_list_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : put_resource_attributes_request)
let make_progress_update_stream_summary
  ?progress_update_stream_name:(progress_update_stream_name_ :
                                 progress_update_stream option)
  () =
  ({ progress_update_stream_name = progress_update_stream_name_ } : progress_update_stream_summary)
let make_notify_migration_task_state_request
  ?dry_run:(dry_run_ : dry_run option)
  ~next_update_seconds:(next_update_seconds_ : next_update_seconds)
  ~update_date_time:(update_date_time_ : update_date_time)
  ~task:(task_ : task)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     next_update_seconds = next_update_seconds_;
     update_date_time = update_date_time_;
     task = task_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : notify_migration_task_state_request)
let make_notify_application_state_request
  ?dry_run:(dry_run_ : dry_run option)
  ?update_date_time:(update_date_time_ : update_date_time option)
  ~status:(status_ : application_status)
  ~application_id:(application_id_ : application_id) () =
  ({
     dry_run = dry_run_;
     update_date_time = update_date_time_;
     status = status_;
     application_id = application_id_
   } : notify_application_state_request)
let make_migration_task_update
  ?migration_task_state:(migration_task_state_ : task option)
  ?update_type:(update_type_ : update_type option)
  ?update_date_time:(update_date_time_ : update_date_time option) () =
  ({
     migration_task_state = migration_task_state_;
     update_type = update_type_;
     update_date_time = update_date_time_
   } : migration_task_update)
let make_migration_task_summary
  ?update_date_time:(update_date_time_ : update_date_time option)
  ?status_detail:(status_detail_ : status_detail option)
  ?progress_percent:(progress_percent_ : progress_percent option)
  ?status:(status_ : status option)
  ?migration_task_name:(migration_task_name_ : migration_task_name option)
  ?progress_update_stream:(progress_update_stream_ :
                            progress_update_stream option)
  () =
  ({
     update_date_time = update_date_time_;
     status_detail = status_detail_;
     progress_percent = progress_percent_;
     status = status_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : migration_task_summary)
let make_migration_task
  ?resource_attribute_list:(resource_attribute_list_ :
                             latest_resource_attribute_list option)
  ?update_date_time:(update_date_time_ : update_date_time option)
  ?task:(task_ : task option)
  ?migration_task_name:(migration_task_name_ : migration_task_name option)
  ?progress_update_stream:(progress_update_stream_ :
                            progress_update_stream option)
  () =
  ({
     resource_attribute_list = resource_attribute_list_;
     update_date_time = update_date_time_;
     task = task_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : migration_task)
let make_list_source_resources_request
  ?max_results:(max_results_ : max_results_source_resources option)
  ?next_token:(next_token_ : token option)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : list_source_resources_request)
let make_list_progress_update_streams_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_progress_update_streams_request)
let make_list_migration_tasks_request
  ?resource_name:(resource_name_ : resource_name option)
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : token option) () =
  ({
     resource_name = resource_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_migration_tasks_request)
let make_list_migration_task_updates_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : token option)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : list_migration_task_updates_request)
let make_discovered_resource
  ?description:(description_ : discovered_resource_description option)
  ~configuration_id:(configuration_id_ : configuration_id) () =
  ({ description = description_; configuration_id = configuration_id_ } : 
  discovered_resource)
let make_list_discovered_resources_request
  ?max_results:(max_results_ : max_results_resources option)
  ?next_token:(next_token_ : token option)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : list_discovered_resources_request)
let make_created_artifact
  ?description:(description_ : created_artifact_description option)
  ~name:(name_ : created_artifact_name) () =
  ({ description = description_; name = name_ } : created_artifact)
let make_list_created_artifacts_request
  ?max_results:(max_results_ : max_results_created_artifacts option)
  ?next_token:(next_token_ : token option)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : list_created_artifacts_request)
let make_application_state
  ?last_updated_time:(last_updated_time_ : update_date_time option)
  ?application_status:(application_status_ : application_status option)
  ?application_id:(application_id_ : application_id option) () =
  ({
     last_updated_time = last_updated_time_;
     application_status = application_status_;
     application_id = application_id_
   } : application_state)
let make_list_application_states_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : token option)
  ?application_ids:(application_ids_ : application_ids option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     application_ids = application_ids_
   } : list_application_states_request)
let make_import_migration_task_request ?dry_run:(dry_run_ : dry_run option)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : import_migration_task_request)
let make_disassociate_source_resource_request
  ?dry_run:(dry_run_ : dry_run option)
  ~source_resource_name:(source_resource_name_ : source_resource_name)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     source_resource_name = source_resource_name_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : disassociate_source_resource_request)
let make_disassociate_discovered_resource_request
  ?dry_run:(dry_run_ : dry_run option)
  ~configuration_id:(configuration_id_ : configuration_id)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     configuration_id = configuration_id_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : disassociate_discovered_resource_request)
let make_disassociate_created_artifact_request
  ?dry_run:(dry_run_ : dry_run option)
  ~created_artifact_name:(created_artifact_name_ : created_artifact_name)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     created_artifact_name = created_artifact_name_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : disassociate_created_artifact_request)
let make_describe_migration_task_request
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : describe_migration_task_request)
let make_describe_application_state_request
  ~application_id:(application_id_ : application_id) () =
  ({ application_id = application_id_ } : describe_application_state_request)
let make_delete_progress_update_stream_request
  ?dry_run:(dry_run_ : dry_run option)
  ~progress_update_stream_name:(progress_update_stream_name_ :
                                 progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     progress_update_stream_name = progress_update_stream_name_
   } : delete_progress_update_stream_request)
let make_create_progress_update_stream_request
  ?dry_run:(dry_run_ : dry_run option)
  ~progress_update_stream_name:(progress_update_stream_name_ :
                                 progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     progress_update_stream_name = progress_update_stream_name_
   } : create_progress_update_stream_request)
let make_associate_source_resource_request
  ?dry_run:(dry_run_ : dry_run option)
  ~source_resource:(source_resource_ : source_resource)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     source_resource = source_resource_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : associate_source_resource_request)
let make_associate_discovered_resource_request
  ?dry_run:(dry_run_ : dry_run option)
  ~discovered_resource:(discovered_resource_ : discovered_resource)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     discovered_resource = discovered_resource_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : associate_discovered_resource_request)
let make_associate_created_artifact_request
  ?dry_run:(dry_run_ : dry_run option)
  ~created_artifact:(created_artifact_ : created_artifact)
  ~migration_task_name:(migration_task_name_ : migration_task_name)
  ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
  () =
  ({
     dry_run = dry_run_;
     created_artifact = created_artifact_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : associate_created_artifact_request)