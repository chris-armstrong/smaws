open Smaws_Lib
open Types
let make_task ?progress_percent:(progress_percent_ : int option) 
  ?status_detail:(status_detail_ : string option)  ~status:(status_ : status)
   () =
  ({
     progress_percent = progress_percent_;
     status_detail = status_detail_;
     status = status_
   } : task)
let make_resource_attribute ~value:(value_ : string) 
  ~type_:(type__ : resource_attribute_type)  () =
  ({ value = value_; type_ = type__ } : resource_attribute)
let make_put_resource_attributes_request ?dry_run:(dry_run_ : bool option) 
  ~resource_attribute_list:(resource_attribute_list_ :
                             resource_attribute list)
   ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     resource_attribute_list = resource_attribute_list_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : put_resource_attributes_request)
let make_progress_update_stream_summary
  ?progress_update_stream_name:(progress_update_stream_name_ : string option)
   () =
  ({ progress_update_stream_name = progress_update_stream_name_ } : progress_update_stream_summary)
let make_notify_migration_task_state_request
  ?dry_run:(dry_run_ : bool option) 
  ~next_update_seconds:(next_update_seconds_ : int) 
  ~update_date_time:(update_date_time_ : CoreTypes.Timestamp.t) 
  ~task:(task_ : task)  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     next_update_seconds = next_update_seconds_;
     update_date_time = update_date_time_;
     task = task_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : notify_migration_task_state_request)
let make_notify_application_state_request ?dry_run:(dry_run_ : bool option) 
  ?update_date_time:(update_date_time_ : CoreTypes.Timestamp.t option) 
  ~status:(status_ : application_status) 
  ~application_id:(application_id_ : string)  () =
  ({
     dry_run = dry_run_;
     update_date_time = update_date_time_;
     status = status_;
     application_id = application_id_
   } : notify_application_state_request)
let make_migration_task_summary
  ?update_date_time:(update_date_time_ : CoreTypes.Timestamp.t option) 
  ?status_detail:(status_detail_ : string option) 
  ?progress_percent:(progress_percent_ : int option) 
  ?status:(status_ : status option) 
  ?migration_task_name:(migration_task_name_ : string option) 
  ?progress_update_stream:(progress_update_stream_ : string option)  () =
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
                             resource_attribute list option)
   ?update_date_time:(update_date_time_ : CoreTypes.Timestamp.t option) 
  ?task:(task_ : task option) 
  ?migration_task_name:(migration_task_name_ : string option) 
  ?progress_update_stream:(progress_update_stream_ : string option)  () =
  ({
     resource_attribute_list = resource_attribute_list_;
     update_date_time = update_date_time_;
     task = task_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : migration_task)
let make_list_progress_update_streams_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  () =
  ({ max_results = max_results_; next_token = next_token_ } : list_progress_update_streams_request)
let make_list_migration_tasks_request
  ?resource_name:(resource_name_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  () =
  ({
     resource_name = resource_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_migration_tasks_request)
let make_discovered_resource ?description:(description_ : string option) 
  ~configuration_id:(configuration_id_ : string)  () =
  ({ description = description_; configuration_id = configuration_id_ } : 
  discovered_resource)
let make_list_discovered_resources_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : list_discovered_resources_request)
let make_created_artifact ?description:(description_ : string option) 
  ~name:(name_ : string)  () =
  ({ description = description_; name = name_ } : created_artifact)
let make_list_created_artifacts_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : list_created_artifacts_request)
let make_application_state
  ?last_updated_time:(last_updated_time_ : CoreTypes.Timestamp.t option) 
  ?application_status:(application_status_ : application_status option) 
  ?application_id:(application_id_ : string option)  () =
  ({
     last_updated_time = last_updated_time_;
     application_status = application_status_;
     application_id = application_id_
   } : application_state)
let make_list_application_states_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?application_ids:(application_ids_ : string list option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     application_ids = application_ids_
   } : list_application_states_request)
let make_import_migration_task_request ?dry_run:(dry_run_ : bool option) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : import_migration_task_request)
let make_disassociate_discovered_resource_request
  ?dry_run:(dry_run_ : bool option) 
  ~configuration_id:(configuration_id_ : string) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     configuration_id = configuration_id_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : disassociate_discovered_resource_request)
let make_disassociate_created_artifact_request
  ?dry_run:(dry_run_ : bool option) 
  ~created_artifact_name:(created_artifact_name_ : string) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     created_artifact_name = created_artifact_name_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : disassociate_created_artifact_request)
let make_describe_migration_task_request
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : describe_migration_task_request)
let make_describe_application_state_request
  ~application_id:(application_id_ : string)  () =
  ({ application_id = application_id_ } : describe_application_state_request)
let make_delete_progress_update_stream_request
  ?dry_run:(dry_run_ : bool option) 
  ~progress_update_stream_name:(progress_update_stream_name_ : string)  () =
  ({
     dry_run = dry_run_;
     progress_update_stream_name = progress_update_stream_name_
   } : delete_progress_update_stream_request)
let make_create_progress_update_stream_request
  ?dry_run:(dry_run_ : bool option) 
  ~progress_update_stream_name:(progress_update_stream_name_ : string)  () =
  ({
     dry_run = dry_run_;
     progress_update_stream_name = progress_update_stream_name_
   } : create_progress_update_stream_request)
let make_associate_discovered_resource_request
  ?dry_run:(dry_run_ : bool option) 
  ~discovered_resource:(discovered_resource_ : discovered_resource) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     discovered_resource = discovered_resource_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : associate_discovered_resource_request)
let make_associate_created_artifact_request ?dry_run:(dry_run_ : bool option)
   ~created_artifact:(created_artifact_ : created_artifact) 
  ~migration_task_name:(migration_task_name_ : string) 
  ~progress_update_stream:(progress_update_stream_ : string)  () =
  ({
     dry_run = dry_run_;
     created_artifact = created_artifact_;
     migration_task_name = migration_task_name_;
     progress_update_stream = progress_update_stream_
   } : associate_created_artifact_request)