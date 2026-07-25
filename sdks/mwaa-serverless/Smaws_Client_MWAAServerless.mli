(** MWAA Serverless client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module UpdateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workflow_request ->
    ( update_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workflow_request ->
    ( update_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing workflow with new configuration settings. This operation allows you to \
   modify the workflow definition, role, and other settings. When you update a workflow, Amazon \
   Managed Workflows for Apache Airflow Serverless automatically creates a new version with the \
   updated configuration and disables scheduling on all previous versions to ensure only one \
   version is actively scheduled at a time. The update operation maintains workflow history while \
   providing a clean transition to the new configuration.\n"]

module StopWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_workflow_run_request ->
    ( stop_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_workflow_run_request ->
    ( stop_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a running workflow execution. This operation terminates all running tasks and prevents \
   new tasks from starting. Amazon Managed Workflows for Apache Airflow Serverless gracefully \
   shuts down the workflow execution by stopping task scheduling and terminating active ECS worker \
   containers. The operation transitions the workflow run to a [STOPPING] state and then to \
   [STOPPED] once all cleanup is complete. In-flight tasks may complete or be terminated depending \
   on their current execution state.\n"]

module StartWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_workflow_run_request ->
    ( start_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_workflow_run_request ->
    ( start_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a new execution of a workflow. This operation creates a workflow run that executes the \
   tasks that are defined in the workflow. Amazon Managed Workflows for Apache Airflow Serverless \
   schedules the workflow execution across its managed Airflow environment, automatically scaling \
   ECS worker tasks based on the workload. The service handles task isolation, dependency \
   resolution, and provides comprehensive monitoring and logging throughout the execution \
   lifecycle.\n"]

module ListWorkflows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all workflows in your account, with optional pagination support. This operation returns \
   summary information for workflows, showing only the most recently created version of each \
   workflow. Amazon Managed Workflows for Apache Airflow Serverless maintains workflow metadata in \
   a highly available, distributed storage system that enables efficient querying and filtering. \
   The service implements proper access controls to ensure you can only view workflows that you \
   have permissions to access, supporting both individual and team-based workflow management \
   scenarios.\n"]

module ListWorkflowVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workflow_versions_request ->
    ( list_workflow_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workflow_versions_request ->
    ( list_workflow_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all versions of a specified workflow, with optional pagination support.\n"]

module ListWorkflowRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workflow_runs_request ->
    ( list_workflow_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workflow_runs_request ->
    ( list_workflow_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all runs for a specified workflow, with optional pagination and filtering support.\n"]

module ListTaskInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_task_instances_request ->
    ( list_task_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_task_instances_request ->
    ( list_task_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all task instances for a specific workflow run, with optional pagination support.\n"]

module GetWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_request ->
    ( get_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_request ->
    ( get_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific workflow run, including its status, execution \
   details, and task instances.\n"]

module GetWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_request ->
    ( get_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_request ->
    ( get_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a workflow, including its configuration, status, and \
   metadata.\n"]

module GetTaskInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_task_instance_request ->
    ( get_task_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_task_instance_request ->
    ( get_task_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific task instance within a workflow run. Task \
   instances represent individual tasks that are executed as part of a workflow in the Amazon \
   Managed Workflows for Apache Airflow Serverless environment. Each task instance runs in an \
   isolated ECS container with dedicated resources and security boundaries. The service tracks \
   task execution state, retry attempts, and provides detailed timing and error information for \
   troubleshooting and monitoring purposes.\n"]

module DeleteWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( delete_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( delete_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a workflow and all its versions. This operation permanently removes the workflow and \
   cannot be undone. Amazon Managed Workflows for Apache Airflow Serverless ensures that all \
   associated resources are properly cleaned up, including stopping any running executions, \
   removing scheduled triggers, and cleaning up execution history. The deletion process respects \
   the multi-tenant isolation boundaries and ensures that no residual data or configurations \
   remain that could affect other customers or workflows.\n"]

module CreateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new workflow in Amazon Managed Workflows for Apache Airflow Serverless. This \
   operation initializes a workflow with the specified configuration including the workflow \
   definition, execution role, and optional settings for encryption, logging, and networking. You \
   must provide the workflow definition as a YAML file stored in Amazon S3 that defines the DAG \
   structure using supported Amazon Web Services operators. Amazon Managed Workflows for Apache \
   Airflow Serverless automatically creates the first version of the workflow and sets up the \
   necessary execution environment with multi-tenant isolation and security controls.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all tags that are associated with a specified Amazon Managed Workflows for Apache Airflow \
   Serverless resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to an Amazon Managed Workflows for Apache Airflow Serverless resource. Tags are \
   key-value pairs that help you organize and categorize your resources.\n"]

(** {1:Serialization and Deserialization} *)
module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from an Amazon Managed Workflows for Apache Airflow Serverless resource. This \
   operation removes the specified tags from the resource.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
