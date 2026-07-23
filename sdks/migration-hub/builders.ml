open Types

let make_resource_attribute ~type_:(type__ : resource_attribute_type)
    ~value:(value_ : resource_attribute_value) () =
  ({ type_ = type__; value = value_ } : resource_attribute)

let make_put_resource_attributes_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~resource_attribute_list:(resource_attribute_list_ : resource_attribute_list) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     resource_attribute_list = resource_attribute_list_;
     dry_run = dry_run_;
   }
    : put_resource_attributes_request)

let make_task ?status_detail:(status_detail_ : status_detail option)
    ?progress_percent:(progress_percent_ : progress_percent option) ~status:(status_ : status) () =
  ({ status = status_; status_detail = status_detail_; progress_percent = progress_percent_ }
    : task)

let make_notify_migration_task_state_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) ~task:(task_ : task)
    ~update_date_time:(update_date_time_ : update_date_time)
    ~next_update_seconds:(next_update_seconds_ : next_update_seconds) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     task = task_;
     update_date_time = update_date_time_;
     next_update_seconds = next_update_seconds_;
     dry_run = dry_run_;
   }
    : notify_migration_task_state_request)

let make_notify_application_state_request
    ?update_date_time:(update_date_time_ : update_date_time option)
    ?dry_run:(dry_run_ : dry_run option) ~application_id:(application_id_ : application_id)
    ~status:(status_ : application_status) () =
  ({
     application_id = application_id_;
     status = status_;
     update_date_time = update_date_time_;
     dry_run = dry_run_;
   }
    : notify_application_state_request)

let make_source_resource ?description:(description_ : source_resource_description option)
    ?status_detail:(status_detail_ : status_detail option) ~name:(name_ : source_resource_name) () =
  ({ name = name_; description = description_; status_detail = status_detail_ } : source_resource)

let make_list_source_resources_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results_source_resources option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_source_resources_request)

let make_progress_update_stream_summary
    ?progress_update_stream_name:(progress_update_stream_name_ : progress_update_stream option) () =
  ({ progress_update_stream_name = progress_update_stream_name_ } : progress_update_stream_summary)

let make_list_progress_update_streams_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_progress_update_streams_request)

let make_migration_task_update ?update_date_time:(update_date_time_ : update_date_time option)
    ?update_type:(update_type_ : update_type option)
    ?migration_task_state:(migration_task_state_ : task option) () =
  ({
     update_date_time = update_date_time_;
     update_type = update_type_;
     migration_task_state = migration_task_state_;
   }
    : migration_task_update)

let make_list_migration_task_updates_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_migration_task_updates_request)

let make_migration_task_summary
    ?progress_update_stream:(progress_update_stream_ : progress_update_stream option)
    ?migration_task_name:(migration_task_name_ : migration_task_name option)
    ?status:(status_ : status option)
    ?progress_percent:(progress_percent_ : progress_percent option)
    ?status_detail:(status_detail_ : status_detail option)
    ?update_date_time:(update_date_time_ : update_date_time option) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     status = status_;
     progress_percent = progress_percent_;
     status_detail = status_detail_;
     update_date_time = update_date_time_;
   }
    : migration_task_summary)

let make_list_migration_tasks_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option)
    ?resource_name:(resource_name_ : resource_name option) () =
  ({ next_token = next_token_; max_results = max_results_; resource_name = resource_name_ }
    : list_migration_tasks_request)

let make_discovered_resource ?description:(description_ : discovered_resource_description option)
    ~configuration_id:(configuration_id_ : configuration_id) () =
  ({ configuration_id = configuration_id_; description = description_ } : discovered_resource)

let make_list_discovered_resources_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results_resources option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_discovered_resources_request)

let make_created_artifact ?description:(description_ : created_artifact_description option)
    ~name:(name_ : created_artifact_name) () =
  ({ name = name_; description = description_ } : created_artifact)

let make_list_created_artifacts_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results_created_artifacts option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_created_artifacts_request)

let make_application_state ?application_id:(application_id_ : application_id option)
    ?application_status:(application_status_ : application_status option)
    ?last_updated_time:(last_updated_time_ : update_date_time option) () =
  ({
     application_id = application_id_;
     application_status = application_status_;
     last_updated_time = last_updated_time_;
   }
    : application_state)

let make_list_application_states_request
    ?application_ids:(application_ids_ : application_ids option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : max_results option) () =
  ({ application_ids = application_ids_; next_token = next_token_; max_results = max_results_ }
    : list_application_states_request)

let make_import_migration_task_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     dry_run = dry_run_;
   }
    : import_migration_task_request)

let make_disassociate_source_resource_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~source_resource_name:(source_resource_name_ : source_resource_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     source_resource_name = source_resource_name_;
     dry_run = dry_run_;
   }
    : disassociate_source_resource_request)

let make_disassociate_discovered_resource_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~configuration_id:(configuration_id_ : configuration_id) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     configuration_id = configuration_id_;
     dry_run = dry_run_;
   }
    : disassociate_discovered_resource_request)

let make_disassociate_created_artifact_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~created_artifact_name:(created_artifact_name_ : created_artifact_name) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     created_artifact_name = created_artifact_name_;
     dry_run = dry_run_;
   }
    : disassociate_created_artifact_request)

let make_migration_task
    ?progress_update_stream:(progress_update_stream_ : progress_update_stream option)
    ?migration_task_name:(migration_task_name_ : migration_task_name option)
    ?task:(task_ : task option) ?update_date_time:(update_date_time_ : update_date_time option)
    ?resource_attribute_list:(resource_attribute_list_ : latest_resource_attribute_list option) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     task = task_;
     update_date_time = update_date_time_;
     resource_attribute_list = resource_attribute_list_;
   }
    : migration_task)

let make_describe_migration_task_request
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name) () =
  ({ progress_update_stream = progress_update_stream_; migration_task_name = migration_task_name_ }
    : describe_migration_task_request)

let make_describe_application_state_request ~application_id:(application_id_ : application_id) () =
  ({ application_id = application_id_ } : describe_application_state_request)

let make_delete_progress_update_stream_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream_name:(progress_update_stream_name_ : progress_update_stream) () =
  ({ progress_update_stream_name = progress_update_stream_name_; dry_run = dry_run_ }
    : delete_progress_update_stream_request)

let make_create_progress_update_stream_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream_name:(progress_update_stream_name_ : progress_update_stream) () =
  ({ progress_update_stream_name = progress_update_stream_name_; dry_run = dry_run_ }
    : create_progress_update_stream_request)

let make_associate_source_resource_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~source_resource:(source_resource_ : source_resource) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     source_resource = source_resource_;
     dry_run = dry_run_;
   }
    : associate_source_resource_request)

let make_associate_discovered_resource_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~discovered_resource:(discovered_resource_ : discovered_resource) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     discovered_resource = discovered_resource_;
     dry_run = dry_run_;
   }
    : associate_discovered_resource_request)

let make_associate_created_artifact_request ?dry_run:(dry_run_ : dry_run option)
    ~progress_update_stream:(progress_update_stream_ : progress_update_stream)
    ~migration_task_name:(migration_task_name_ : migration_task_name)
    ~created_artifact:(created_artifact_ : created_artifact) () =
  ({
     progress_update_stream = progress_update_stream_;
     migration_task_name = migration_task_name_;
     created_artifact = created_artifact_;
     dry_run = dry_run_;
   }
    : associate_created_artifact_request)
