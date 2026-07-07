open Types

val make_definition_s3_location :
  ?version_id:Smaws_Lib.Smithy_api.Types.string_ ->
  object_key:Smaws_Lib.Smithy_api.Types.string_ ->
  bucket:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  definition_s3_location

val make_schedule_configuration :
  ?cron_expression:Smaws_Lib.Smithy_api.Types.string_ -> unit -> schedule_configuration

val make_workflow_version_summary :
  ?trigger_mode:generic_string ->
  ?schedule_configuration:schedule_configuration ->
  ?definition_s3_location:definition_s3_location ->
  ?modified_at:timestamp_value ->
  ?created_at:timestamp_value ->
  ?is_latest_version:is_latest_version ->
  workflow_arn:workflow_arn ->
  workflow_version:workflow_version ->
  unit ->
  workflow_version_summary

val make_workflow_summary :
  ?trigger_mode:generic_string ->
  ?workflow_status:workflow_status ->
  ?modified_at:timestamp_value ->
  ?created_at:timestamp_value ->
  ?description:description_string ->
  ?name:name_string ->
  ?workflow_version:workflow_version ->
  workflow_arn:workflow_arn ->
  unit ->
  workflow_summary

val make_run_detail_summary :
  ?ended_at:timestamp_value ->
  ?started_at:timestamp_value ->
  ?created_on:timestamp_value ->
  ?status:workflow_run_status ->
  unit ->
  run_detail_summary

val make_workflow_run_summary :
  ?run_detail_summary:run_detail_summary ->
  ?run_type:run_type ->
  ?workflow_version:version_id ->
  ?workflow_arn:workflow_arn ->
  ?run_id:id_string ->
  unit ->
  workflow_run_summary

val make_workflow_run_detail :
  ?run_state:workflow_run_status ->
  ?task_instances:task_instance_ids ->
  ?error_message:generic_string ->
  ?duration:Smaws_Lib.Smithy_api.Types.integer ->
  ?modified_at:timestamp_value ->
  ?completed_on:timestamp_value ->
  ?created_at:timestamp_value ->
  ?started_on:timestamp_value ->
  ?run_type:run_type ->
  ?run_id:id_string ->
  ?workflow_version:version_id ->
  ?workflow_arn:workflow_arn ->
  unit ->
  workflow_run_detail

val make_validation_exception_field :
  message:error_message ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_workflow_response :
  ?warnings:warning_messages ->
  ?workflow_version:workflow_version ->
  ?modified_at:timestamp_value ->
  workflow_arn:workflow_arn ->
  unit ->
  update_workflow_response

val make_logging_configuration :
  log_group_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> logging_configuration

val make_network_configuration :
  ?subnet_ids:subnet_ids -> ?security_group_ids:security_group_ids -> unit -> network_configuration

val make_update_workflow_request :
  ?trigger_mode:generic_string ->
  ?network_configuration:network_configuration ->
  ?engine_version:engine_version ->
  ?logging_configuration:logging_configuration ->
  ?description:description_string ->
  role_arn:role_ar_n ->
  definition_s3_location:definition_s3_location ->
  workflow_arn:workflow_arn ->
  unit ->
  update_workflow_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:taggable_resource_arn -> unit -> untag_resource_request

val make_task_instance_summary :
  ?operator_name:generic_string ->
  ?duration_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?status:task_instance_status ->
  ?task_instance_id:id_string ->
  ?run_id:id_string ->
  ?workflow_version:version_id ->
  ?workflow_arn:workflow_arn ->
  unit ->
  task_instance_summary

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tags -> resource_arn:taggable_resource_arn -> unit -> tag_resource_request

val make_stop_workflow_run_response :
  ?status:workflow_run_status ->
  ?run_id:id_string ->
  ?workflow_version:version_id ->
  ?workflow_arn:workflow_arn ->
  unit ->
  stop_workflow_run_response

val make_stop_workflow_run_request :
  run_id:id_string -> workflow_arn:workflow_arn -> unit -> stop_workflow_run_request

val make_start_workflow_run_response :
  ?started_at:timestamp_value ->
  ?status:workflow_run_status ->
  ?run_id:id_string ->
  unit ->
  start_workflow_run_response

val make_start_workflow_run_request :
  ?workflow_version:version_id ->
  ?override_parameters:object_map ->
  ?client_token:idempotency_token_string ->
  workflow_arn:workflow_arn ->
  unit ->
  start_workflow_run_request

val make_list_workflows_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  workflows:workflow_summaries ->
  unit ->
  list_workflows_response

val make_list_workflows_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_workflows_request

val make_list_workflow_versions_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workflow_versions:workflow_version_summaries ->
  unit ->
  list_workflow_versions_response

val make_list_workflow_versions_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  workflow_arn:workflow_arn ->
  unit ->
  list_workflow_versions_request

val make_list_workflow_runs_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workflow_runs:workflow_run_summaries ->
  unit ->
  list_workflow_runs_response

val make_list_workflow_runs_request :
  ?workflow_version:version_id ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  workflow_arn:workflow_arn ->
  unit ->
  list_workflow_runs_request

val make_list_task_instances_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_instances:task_instance_summaries ->
  unit ->
  list_task_instances_response

val make_list_task_instances_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  run_id:id_string ->
  workflow_arn:workflow_arn ->
  unit ->
  list_task_instances_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_get_workflow_run_response :
  ?run_detail:workflow_run_detail ->
  ?override_parameters:object_map ->
  ?run_type:run_type ->
  ?run_id:id_string ->
  ?workflow_version:version_id ->
  ?workflow_arn:workflow_arn ->
  unit ->
  get_workflow_run_response

val make_get_workflow_run_request :
  run_id:id_string -> workflow_arn:workflow_arn -> unit -> get_workflow_run_request

val make_encryption_configuration :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:encryption_type ->
  unit ->
  encryption_configuration

val make_get_workflow_response :
  ?workflow_definition:generic_string ->
  ?trigger_mode:generic_string ->
  ?network_configuration:network_configuration ->
  ?role_arn:role_ar_n ->
  ?schedule_configuration:schedule_configuration ->
  ?definition_s3_location:definition_s3_location ->
  ?workflow_status:workflow_status ->
  ?engine_version:engine_version ->
  ?logging_configuration:logging_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?modified_at:timestamp_value ->
  ?created_at:timestamp_value ->
  ?description:description_string ->
  ?name:name_string ->
  ?workflow_version:workflow_version ->
  workflow_arn:workflow_arn ->
  unit ->
  get_workflow_response

val make_get_workflow_request :
  ?workflow_version:workflow_version -> workflow_arn:workflow_arn -> unit -> get_workflow_request

val make_get_task_instance_response :
  ?xcom:generic_map ->
  ?log_stream:id_string ->
  ?task_id:id_string ->
  ?error_message:generic_string ->
  ?attempt_number:Smaws_Lib.Smithy_api.Types.integer ->
  ?started_at:timestamp_value ->
  ?ended_at:timestamp_value ->
  ?modified_at:timestamp_value ->
  ?operator_name:generic_string ->
  ?duration_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?status:task_instance_status ->
  ?workflow_version:version_id ->
  task_instance_id:id_string ->
  run_id:id_string ->
  workflow_arn:workflow_arn ->
  unit ->
  get_task_instance_response

val make_get_task_instance_request :
  run_id:id_string ->
  task_instance_id:id_string ->
  workflow_arn:workflow_arn ->
  unit ->
  get_task_instance_request

val make_delete_workflow_response :
  ?workflow_version:workflow_version ->
  workflow_arn:workflow_arn ->
  unit ->
  delete_workflow_response

val make_delete_workflow_request :
  ?workflow_version:workflow_version -> workflow_arn:workflow_arn -> unit -> delete_workflow_request

val make_create_workflow_response :
  ?warnings:warning_messages ->
  ?is_latest_version:is_latest_version ->
  ?workflow_version:workflow_version ->
  ?workflow_status:workflow_status ->
  ?revision_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:timestamp_value ->
  workflow_arn:workflow_arn ->
  unit ->
  create_workflow_response

val make_create_workflow_request :
  ?trigger_mode:generic_string ->
  ?tags:tags ->
  ?network_configuration:network_configuration ->
  ?engine_version:engine_version ->
  ?logging_configuration:logging_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?description:description_string ->
  ?client_token:idempotency_token_string ->
  role_arn:role_ar_n ->
  definition_s3_location:definition_s3_location ->
  name:name_string ->
  unit ->
  create_workflow_request
