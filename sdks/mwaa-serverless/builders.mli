open Types

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:error_message ->
  unit ->
  validation_exception_field

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_resource_arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:taggable_resource_arn -> tags:tags -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_create_workflow_response :
  ?created_at:timestamp_value ->
  ?revision_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workflow_status:workflow_status ->
  ?workflow_version:workflow_version ->
  ?is_latest_version:is_latest_version ->
  ?warnings:warning_messages ->
  workflow_arn:workflow_arn ->
  unit ->
  create_workflow_response

val make_network_configuration :
  ?security_group_ids:security_group_ids -> ?subnet_ids:subnet_ids -> unit -> network_configuration

val make_logging_configuration :
  log_group_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> logging_configuration

val make_encryption_configuration :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:encryption_type ->
  unit ->
  encryption_configuration

val make_definition_s3_location :
  ?version_id:Smaws_Lib.Smithy_api.Types.string_ ->
  bucket:Smaws_Lib.Smithy_api.Types.string_ ->
  object_key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  definition_s3_location

val make_create_workflow_request :
  ?client_token:idempotency_token_string ->
  ?description:description_string ->
  ?encryption_configuration:encryption_configuration ->
  ?logging_configuration:logging_configuration ->
  ?engine_version:engine_version ->
  ?network_configuration:network_configuration ->
  ?tags:tags ->
  ?trigger_mode:generic_string ->
  name:name_string ->
  definition_s3_location:definition_s3_location ->
  role_arn:role_ar_n ->
  unit ->
  create_workflow_request

val make_delete_workflow_response :
  ?workflow_version:workflow_version ->
  workflow_arn:workflow_arn ->
  unit ->
  delete_workflow_response

val make_delete_workflow_request :
  ?workflow_version:workflow_version -> workflow_arn:workflow_arn -> unit -> delete_workflow_request

val make_get_task_instance_response :
  ?workflow_version:version_id ->
  ?status:task_instance_status ->
  ?duration_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?operator_name:generic_string ->
  ?modified_at:timestamp_value ->
  ?ended_at:timestamp_value ->
  ?started_at:timestamp_value ->
  ?attempt_number:Smaws_Lib.Smithy_api.Types.integer ->
  ?error_message:generic_string ->
  ?task_id:id_string ->
  ?log_stream:id_string ->
  ?xcom:generic_map ->
  workflow_arn:workflow_arn ->
  run_id:id_string ->
  task_instance_id:id_string ->
  unit ->
  get_task_instance_response

val make_get_task_instance_request :
  workflow_arn:workflow_arn ->
  task_instance_id:id_string ->
  run_id:id_string ->
  unit ->
  get_task_instance_request

val make_schedule_configuration :
  ?cron_expression:Smaws_Lib.Smithy_api.Types.string_ -> unit -> schedule_configuration

val make_get_workflow_response :
  ?workflow_version:workflow_version ->
  ?name:name_string ->
  ?description:description_string ->
  ?created_at:timestamp_value ->
  ?modified_at:timestamp_value ->
  ?encryption_configuration:encryption_configuration ->
  ?logging_configuration:logging_configuration ->
  ?engine_version:engine_version ->
  ?workflow_status:workflow_status ->
  ?definition_s3_location:definition_s3_location ->
  ?schedule_configuration:schedule_configuration ->
  ?role_arn:role_ar_n ->
  ?network_configuration:network_configuration ->
  ?trigger_mode:generic_string ->
  ?workflow_definition:generic_string ->
  workflow_arn:workflow_arn ->
  unit ->
  get_workflow_response

val make_get_workflow_request :
  ?workflow_version:workflow_version -> workflow_arn:workflow_arn -> unit -> get_workflow_request

val make_workflow_run_detail :
  ?workflow_arn:workflow_arn ->
  ?workflow_version:version_id ->
  ?run_id:id_string ->
  ?run_type:run_type ->
  ?started_on:timestamp_value ->
  ?created_at:timestamp_value ->
  ?completed_on:timestamp_value ->
  ?modified_at:timestamp_value ->
  ?duration:Smaws_Lib.Smithy_api.Types.integer ->
  ?error_message:generic_string ->
  ?task_instances:task_instance_ids ->
  ?run_state:workflow_run_status ->
  unit ->
  workflow_run_detail

val make_get_workflow_run_response :
  ?workflow_arn:workflow_arn ->
  ?workflow_version:version_id ->
  ?run_id:id_string ->
  ?run_type:run_type ->
  ?override_parameters:object_map ->
  ?run_detail:workflow_run_detail ->
  unit ->
  get_workflow_run_response

val make_get_workflow_run_request :
  workflow_arn:workflow_arn -> run_id:id_string -> unit -> get_workflow_run_request

val make_task_instance_summary :
  ?workflow_arn:workflow_arn ->
  ?workflow_version:version_id ->
  ?run_id:id_string ->
  ?task_instance_id:id_string ->
  ?status:task_instance_status ->
  ?duration_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?operator_name:generic_string ->
  unit ->
  task_instance_summary

val make_list_task_instances_response :
  ?task_instances:task_instance_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_task_instances_response

val make_list_task_instances_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  workflow_arn:workflow_arn ->
  run_id:id_string ->
  unit ->
  list_task_instances_request

val make_run_detail_summary :
  ?status:workflow_run_status ->
  ?created_on:timestamp_value ->
  ?started_at:timestamp_value ->
  ?ended_at:timestamp_value ->
  unit ->
  run_detail_summary

val make_workflow_run_summary :
  ?run_id:id_string ->
  ?workflow_arn:workflow_arn ->
  ?workflow_version:version_id ->
  ?run_type:run_type ->
  ?run_detail_summary:run_detail_summary ->
  unit ->
  workflow_run_summary

val make_list_workflow_runs_response :
  ?workflow_runs:workflow_run_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_workflow_runs_response

val make_list_workflow_runs_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workflow_version:version_id ->
  workflow_arn:workflow_arn ->
  unit ->
  list_workflow_runs_request

val make_workflow_version_summary :
  ?is_latest_version:is_latest_version ->
  ?created_at:timestamp_value ->
  ?modified_at:timestamp_value ->
  ?definition_s3_location:definition_s3_location ->
  ?schedule_configuration:schedule_configuration ->
  ?trigger_mode:generic_string ->
  workflow_version:workflow_version ->
  workflow_arn:workflow_arn ->
  unit ->
  workflow_version_summary

val make_list_workflow_versions_response :
  ?workflow_versions:workflow_version_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_workflow_versions_response

val make_list_workflow_versions_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  workflow_arn:workflow_arn ->
  unit ->
  list_workflow_versions_request

val make_workflow_summary :
  ?workflow_version:workflow_version ->
  ?name:name_string ->
  ?description:description_string ->
  ?created_at:timestamp_value ->
  ?modified_at:timestamp_value ->
  ?workflow_status:workflow_status ->
  ?trigger_mode:generic_string ->
  workflow_arn:workflow_arn ->
  unit ->
  workflow_summary

val make_list_workflows_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  workflows:workflow_summaries ->
  unit ->
  list_workflows_response

val make_list_workflows_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_workflows_request

val make_start_workflow_run_response :
  ?run_id:id_string ->
  ?status:workflow_run_status ->
  ?started_at:timestamp_value ->
  unit ->
  start_workflow_run_response

val make_start_workflow_run_request :
  ?client_token:idempotency_token_string ->
  ?override_parameters:object_map ->
  ?workflow_version:version_id ->
  workflow_arn:workflow_arn ->
  unit ->
  start_workflow_run_request

val make_stop_workflow_run_response :
  ?workflow_arn:workflow_arn ->
  ?workflow_version:version_id ->
  ?run_id:id_string ->
  ?status:workflow_run_status ->
  unit ->
  stop_workflow_run_response

val make_stop_workflow_run_request :
  workflow_arn:workflow_arn -> run_id:id_string -> unit -> stop_workflow_run_request

val make_update_workflow_response :
  ?modified_at:timestamp_value ->
  ?workflow_version:workflow_version ->
  ?warnings:warning_messages ->
  workflow_arn:workflow_arn ->
  unit ->
  update_workflow_response

val make_update_workflow_request :
  ?description:description_string ->
  ?logging_configuration:logging_configuration ->
  ?engine_version:engine_version ->
  ?network_configuration:network_configuration ->
  ?trigger_mode:generic_string ->
  workflow_arn:workflow_arn ->
  definition_s3_location:definition_s3_location ->
  role_arn:role_ar_n ->
  unit ->
  update_workflow_request
