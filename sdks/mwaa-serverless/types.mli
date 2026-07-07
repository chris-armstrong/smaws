type nonrec workflow_version = string [@@ocaml.doc ""]

type nonrec workflow_arn = string [@@ocaml.doc ""]

type nonrec is_latest_version = bool [@@ocaml.doc ""]

type nonrec timestamp_value = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec definition_s3_location = {
  version_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Optional. The version ID of the workflow definition file in Amazon S3. If not specified, \
         the latest version is used.\n"]
  object_key : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The key (name) of the workflow definition file within the S3 bucket.\n"]
  bucket : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the Amazon S3 bucket that contains the workflow definition file.\n"]
}
[@@ocaml.doc
  "Specifies the Amazon S3 location of a workflow definition file. This structure contains the \
   bucket name, object key, and optional version ID for the workflow definition. Amazon Managed \
   Workflows for Apache Airflow Serverless takes a snapshot of the definition file at the time of \
   workflow creation or update, ensuring that the workflow behavior remains consistent even if the \
   source file is modified. The definition must be a valid YAML file that uses supported Amazon \
   Web Services operators and Amazon Managed Workflows for Apache Airflow Serverless syntax.\n"]

type nonrec schedule_configuration = {
  cron_expression : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A cron expression that defines when the workflow is automatically executed. Uses standard \
         cron syntax.\n"]
}
[@@ocaml.doc
  "The configuration to use to schedule automated workflow execution using cron expressions. \
   Amazon Managed Workflows for Apache Airflow Serverless integrates with EventBridge Scheduler to \
   provide cost-effective, timezone-aware scheduling capabilities. The service supports both \
   time-based and event-based scheduling (event-based scheduling available post-GA). When a \
   workflow definition includes scheduling information, Amazon Managed Workflows for Apache \
   Airflow Serverless automatically configures the appropriate triggers and ensures only one \
   version of a workflow has an active schedule at any time.\n"]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec workflow_version_summary = {
  trigger_mode : generic_string option;
      [@ocaml.doc "The trigger mode for the workflow execution.\n"]
  schedule_configuration : schedule_configuration option;
      [@ocaml.doc "The schedule configuration for this workflow version.\n"]
  definition_s3_location : definition_s3_location option;
      [@ocaml.doc "The Amazon S3 location of the workflow definition file for this version.\n"]
  modified_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow version was last modified, in ISO 8601 date-time format.\n"]
  created_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow version was created, in ISO 8601 date-time format.\n"]
  is_latest_version : is_latest_version option;
      [@ocaml.doc
        "Boolean flag that indicates whether this is the latest version of the workflow.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains this version.\n"]
  workflow_version : workflow_version;
      [@ocaml.doc "The version identifier of the workflow version.\n"]
}
[@@ocaml.doc
  "Summary information about a workflow version, including identification and configuration details.\n"]

type nonrec workflow_version_summaries = workflow_version_summary list [@@ocaml.doc ""]

type nonrec workflow_version_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec workflow_version_arn = string [@@ocaml.doc ""]

type nonrec name_string = string [@@ocaml.doc ""]

type nonrec description_string = string [@@ocaml.doc ""]

type nonrec workflow_status = DELETING [@ocaml.doc ""] | READY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workflow_summary = {
  trigger_mode : generic_string option;
      [@ocaml.doc "The trigger mode for the workflow execution.\n"]
  workflow_status : workflow_status option; [@ocaml.doc "The current status of the workflow.\n"]
  modified_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow was last modified, in ISO 8601 date-time format.\n"]
  created_at : timestamp_value option;
      [@ocaml.doc "The timestamp when the workflow was created, in ISO 8601 date-time format.\n"]
  description : description_string option; [@ocaml.doc "The description of the workflow.\n"]
  name : name_string option; [@ocaml.doc "The name of the workflow.\n"]
  workflow_version : workflow_version option;
      [@ocaml.doc "The version identifier of the workflow.\n"]
  workflow_arn : workflow_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow.\n"]
}
[@@ocaml.doc "Summary information about a workflow, including basic identification and metadata.\n"]

type nonrec workflow_summaries = workflow_summary list [@@ocaml.doc ""]

type nonrec id_string = string [@@ocaml.doc ""]

type nonrec version_id = string [@@ocaml.doc ""]

type nonrec run_type = SCHEDULED [@ocaml.doc ""] | ON_DEMAND [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workflow_run_status =
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec run_detail_summary = {
  ended_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run completed execution, in ISO 8601 date-time format. \
         This value is null if the run is not complete.\n"]
  started_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run started execution, in ISO 8601 date-time format.\n"]
  created_on : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run was created, in ISO 8601 date-time format.\n"]
  status : workflow_run_status option; [@ocaml.doc "The current status of the workflow run.\n"]
}
[@@ocaml.doc
  "Summary information about a workflow run's execution details, including status and timing \
   information.\n"]

type nonrec workflow_run_summary = {
  run_detail_summary : run_detail_summary option;
      [@ocaml.doc "Summary details about the workflow run execution.\n"]
  run_type : run_type option; [@ocaml.doc "The type of workflow run.\n"]
  workflow_version : version_id option;
      [@ocaml.doc "The version of the workflow used for this run.\n"]
  workflow_arn : workflow_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains this run.\n"]
  run_id : id_string option; [@ocaml.doc "The unique identifier of the workflow run.\n"]
}
[@@ocaml.doc
  "Summary information about a workflow run, including basic identification and status information.\n"]

type nonrec workflow_run_summaries = workflow_run_summary list [@@ocaml.doc ""]

type nonrec workflow_run_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec task_instance_ids = id_string list [@@ocaml.doc ""]

type nonrec workflow_run_detail = {
  run_state : workflow_run_status option;
      [@ocaml.doc "The current execution state of the workflow run.\n"]
  task_instances : task_instance_ids option;
      [@ocaml.doc "A list of task instance IDs that are part of this workflow run.\n"]
  error_message : generic_string option;
      [@ocaml.doc
        "The error message if the workflow run failed. This value is null if the run completed \
         successfully.\n"]
  duration : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total duration of the workflow run execution in seconds. This value is null if the \
         run is not complete.\n"]
  modified_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run was last modified, in ISO 8601 date-time format.\n"]
  completed_on : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run completed execution, in ISO 8601 date-time format. \
         This value is null if the run is not complete.\n"]
  created_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run was created, in ISO 8601 date-time format.\n"]
  started_on : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run started execution, in ISO 8601 date-time format.\n"]
  run_type : run_type option; [@ocaml.doc "The type of workflow run.\n"]
  run_id : id_string option; [@ocaml.doc "The unique identifier of this workflow run.\n"]
  workflow_version : version_id option;
      [@ocaml.doc "The version of the workflow used for this run.\n"]
  workflow_arn : workflow_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains this run.\n"]
}
[@@ocaml.doc
  "Detailed information about a workflow run execution, including timing, status, error \
   information, and associated task instances. This structure provides comprehensive visibility \
   into the workflow execution lifecycle within the Amazon Managed Workflows for Apache Airflow \
   Serverless serverless environment. The service tracks execution across distributed ECS worker \
   tasks and provides detailed timing information, error diagnostics, and task instance \
   relationships to support effective monitoring and troubleshooting of complex workflow \
   executions.\n"]

type nonrec workflow_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec warning_messages = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : error_message;
      [@ocaml.doc "A message that describes why the field failed validation.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the field that failed validation.\n"]
}
[@@ocaml.doc
  "Contains information about a field that failed validation, including the field name and a \
   descriptive error message.\n"]

type nonrec validation_exception_fields = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_fields option;
      [@ocaml.doc "The fields that failed validation.\n"]
  reason : validation_exception_reason; [@ocaml.doc "The reason the request failed validation.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified request parameters are invalid, missing, or inconsistent with Amazon Managed \
   Workflows for Apache Airflow Serverless service requirements. This can occur when workflow \
   definitions contain unsupported operators, when required IAM permissions are missing, when S3 \
   locations are inaccessible, or when network configurations are invalid. The service validates \
   workflow definitions, execution roles, and resource configurations to ensure compatibility with \
   the managed Airflow environment and security requirements.\n"]

type nonrec update_workflow_response = {
  warnings : warning_messages option;
      [@ocaml.doc "Warning messages generated during workflow update.\n"]
  workflow_version : workflow_version option;
      [@ocaml.doc "The version identifier of the updated workflow.\n"]
  modified_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow was last modified, in ISO 8601 date-time format.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec role_ar_n = string [@@ocaml.doc ""]

type nonrec logging_configuration = {
  log_group_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The name of the CloudWatch log group where workflow execution logs are stored.\n"]
}
[@@ocaml.doc
  "Configuration for workflow logging that specifies where you should store your workflow \
   execution logs. Amazon Managed Workflows for Apache Airflow Serverless provides comprehensive \
   logging capabilities that capture workflow execution details, task-level information, and \
   system events. Logs are automatically exported to your specified CloudWatch log group using \
   remote logging functionality, providing centralized observability across the distributed, \
   multi-tenant execution environment. This enables effective debugging, monitoring, and \
   compliance auditing of workflow executions.\n"]

type nonrec engine_version =
  | ONE [@ocaml.doc "Engine version 1 of Amazon Managed Workflows for Apache Airflow Serverless\n"]
[@@ocaml.doc ""]

type nonrec security_group_string = string [@@ocaml.doc ""]

type nonrec security_group_ids = security_group_string list [@@ocaml.doc ""]

type nonrec subnet_string = string [@@ocaml.doc ""]

type nonrec subnet_ids = subnet_string list [@@ocaml.doc ""]

type nonrec network_configuration = {
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "A list of VPC subnet IDs where the workflow execution environment is deployed.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "A list of VPC security group IDs to associate with the workflow execution environment.\n"]
}
[@@ocaml.doc
  "Network configuration for workflow execution. Specifies VPC security groups and subnets for \
   secure network access. When provided, Amazon Managed Workflows for Apache Airflow Serverless \
   deploys ECS worker tasks in your specified VPC configuration, enabling secure access to \
   VPC-only resources. The service uses a proxy API container architecture where one container \
   handles external communication while the worker container connects to your VPC for task \
   execution. This design provides both security isolation and connectivity flexibility.\n"]

type nonrec update_workflow_request = {
  trigger_mode : generic_string option;
      [@ocaml.doc "The trigger mode for the workflow execution.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc "Updated network configuration for the workflow execution environment.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The version of the Amazon Managed Workflows for Apache Airflow Serverless engine that you \
         want to use for the updated workflow.\n"]
  logging_configuration : logging_configuration option;
      [@ocaml.doc "Updated logging configuration for the workflow.\n"]
  description : description_string option; [@ocaml.doc "An updated description for the workflow.\n"]
  role_arn : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that Amazon Managed Workflows for Apache \
         Airflow Serverless assumes when it executes the updated workflow.\n"]
  definition_s3_location : definition_s3_location;
      [@ocaml.doc "The Amazon S3 location where the updated workflow definition file is stored.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of seconds to wait before retrying the operation.\n"]
  quota_code : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The code of the quota.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The code for the service.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was denied because too many requests were made in a short period, exceeding the \
   service rate limits. Amazon Managed Workflows for Apache Airflow Serverless implements \
   throttling controls to ensure fair resource allocation across all customers in the multi-tenant \
   environment. This helps maintain service stability and performance. If you encounter \
   throttling, implement exponential backoff and retry logic in your applications, or consider \
   distributing your API calls over a longer time period.\n"]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The code of the quota.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The code for the service.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of resource affected.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the resource.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request exceeds the service quota for Amazon Managed Workflows for Apache Airflow \
   Serverless resources. This can occur when you attempt to create more workflows than allowed, \
   exceed concurrent workflow run limits, or surpass task execution limits. Amazon Managed \
   Workflows for Apache Airflow Serverless implements admission control using DynamoDB-based \
   counters to manage resource utilization across the multi-tenant environment. Contact Amazon Web \
   Services Support to request quota increases if you need higher limits for your use case.\n"]

type nonrec resource_not_found_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The type of the resource.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the resource.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified resource was not found. You can only access or modify a resource that already \
   exists.\n"]

type nonrec operation_timeout_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation timed out.\n"]

type nonrec internal_server_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of seconds to wait before retrying the operation.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc "An unexpected server-side error occurred during request processing.\n"]

type nonrec conflict_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The type of the resource.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the resource.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You cannot create a resource that already exists, or the resource is in a state that prevents \
   the requested operation.\n"]

type nonrec access_denied_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "You do not have sufficient permission to perform this action.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys;
      [@ocaml.doc
        "A list of tag keys to remove from the resource. Only the keys are required; the values \
         are ignored.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource from which to remove tags.\n"]
}
[@@ocaml.doc ""]

type nonrec task_instance_status =
  | TIMEOUT [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
  | DEFERRED [@ocaml.doc ""]
  | RESTARTING [@ocaml.doc ""]
  | REMOVED [@ocaml.doc ""]
  | UPSTREAM_FAILED [@ocaml.doc ""]
  | UP_FOR_RETRY [@ocaml.doc ""]
  | UP_FOR_RESCHEDULE [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_instance_summary = {
  operator_name : generic_string option;
      [@ocaml.doc "The name of the Apache Airflow operator used for this task instance.\n"]
  duration_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The duration of the task instance execution in seconds. This value is null if the task is \
         not complete.\n"]
  status : task_instance_status option; [@ocaml.doc "The current status of the task instance.\n"]
  task_instance_id : id_string option; [@ocaml.doc "The unique identifier of this task instance.\n"]
  run_id : id_string option;
      [@ocaml.doc "The unique identifier of the workflow run that contains this task instance.\n"]
  workflow_version : version_id option;
      [@ocaml.doc "The version of the workflow that contains this task instance.\n"]
  workflow_arn : workflow_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the workflow that contains this task instance.\n"]
}
[@@ocaml.doc
  "Summary information about a task instance within a workflow run, including its status and \
   execution details.\n"]

type nonrec task_instance_summaries = task_instance_summary list [@@ocaml.doc ""]

type nonrec task_instance_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tags = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags;
      [@ocaml.doc "A map of tags to add to the resource. Each tag consists of a key-value pair.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to which to add tags.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_workflow_run_response = {
  status : workflow_run_status option;
      [@ocaml.doc
        "The status of the workflow run after the stop operation. This is typically [STOPPING] or \
         [STOPPED].\n"]
  run_id : id_string option; [@ocaml.doc "The unique identifier of the stopped workflow run.\n"]
  workflow_version : version_id option;
      [@ocaml.doc "The version of the workflow that was stopped.\n"]
  workflow_arn : workflow_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains the stopped run.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_workflow_run_request = {
  run_id : id_string; [@ocaml.doc "The unique identifier of the workflow run to stop.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the workflow that contains the run you want to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec start_workflow_run_response = {
  started_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow run was started, in ISO 8601 date-time format.\n"]
  status : workflow_run_status option;
      [@ocaml.doc
        "The initial status of the workflow run. This is typically [STARTING] when you first \
         create the run.\n"]
  run_id : id_string option;
      [@ocaml.doc "The unique identifier of the newly started workflow run.\n"]
}
[@@ocaml.doc ""]

type nonrec idempotency_token_string = string [@@ocaml.doc ""]

type nonrec object_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.document) list
[@@ocaml.doc ""]

type nonrec start_workflow_run_request = {
  workflow_version : version_id option;
      [@ocaml.doc
        "Optional. The specific version of the workflow to execute. If not specified, the latest \
         version is used.\n"]
  override_parameters : object_map option;
      [@ocaml.doc
        "Optional parameters to override default workflow parameters for this specific run. These \
         parameters are passed to the workflow during execution and can be used to customize \
         behavior without modifying the workflow definition. Parameters are made available as \
         environment variables to tasks and you can reference them within the YAML workflow \
         definition using standard parameter substitution syntax.\n"]
  client_token : idempotency_token_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. This token prevents duplicate workflow run requests.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow you want to run.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflows_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         null if there are no more results.\n"]
  workflows : workflow_summaries;
      [@ocaml.doc "A list of workflow summaries for all workflows in your account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflows_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         returned from a previous call to [ListWorkflows].\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of workflows you want to return in a single response.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflow_versions_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         null if there are no more results.\n"]
  workflow_versions : workflow_version_summaries option;
      [@ocaml.doc "A list of workflow version summaries for the specified workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflow_versions_request = {
  workflow_arn : workflow_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the workflow for which you want to list versions.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         returned from a previous call to [ListWorkflowVersions].\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of workflow versions to return in a single response.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflow_runs_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         null if there are no more results.\n"]
  workflow_runs : workflow_run_summaries option;
      [@ocaml.doc "A list of workflow run summaries for the specified workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflow_runs_request = {
  workflow_version : version_id option;
      [@ocaml.doc
        "Optional. The specific version of the workflow for which you want a list of runs. If not \
         specified, runs for all versions are returned.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the workflow for which you want a list of runs.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         returned from a previous call to [ListWorkflowRuns].\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of workflow runs to return in a single response.\n"]
}
[@@ocaml.doc ""]

type nonrec list_task_instances_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         null if there are no more results.\n"]
  task_instances : task_instance_summaries option;
      [@ocaml.doc "A list of task instance summaries for the specified workflow run.\n"]
}
[@@ocaml.doc ""]

type nonrec list_task_instances_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token you need to use to retrieve the next set of results. This value is \
         returned from a previous call to [ListTaskInstances].\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of task instances to return in a single response.\n"]
  run_id : id_string;
      [@ocaml.doc
        "The unique identifier of the workflow run for which you want a list of task instances.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains the run.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option;
      [@ocaml.doc
        "A map of tags that are associated with the resource, where each tag consists of a \
         key-value pair.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource for which to list tags.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_run_response = {
  run_detail : workflow_run_detail option;
      [@ocaml.doc
        "Detailed information about the workflow run execution, including timing, status, and task \
         instances.\n"]
  override_parameters : object_map option;
      [@ocaml.doc "Parameters that were overridden for this specific workflow run.\n"]
  run_type : run_type option;
      [@ocaml.doc
        "The type of workflow run. Values are [ON_DEMAND] (manually triggered) or [SCHEDULED] \
         (automatically triggered by schedule).\n"]
  run_id : id_string option; [@ocaml.doc "The unique identifier of this workflow run.\n"]
  workflow_version : version_id option;
      [@ocaml.doc "The version of the workflow that is used for this run.\n"]
  workflow_arn : workflow_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains this run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_run_request = {
  run_id : id_string; [@ocaml.doc "The unique identifier of the workflow run to retrieve.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow that contains the run.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_type =
  | CUSTOMER_MANAGED_KEY [@ocaml.doc ""]
  | AWS_MANAGED_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_configuration = {
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The ID or ARN of the Amazon Web Services KMS key to use for encryption. Required when \
         [Type] is [CUSTOMER_MANAGED_KEY].\n"]
  type_ : encryption_type;
      [@ocaml.doc
        "The type of encryption to use. Values are [AWS_MANAGED_KEY] (Amazon Web Services manages \
         the encryption key) or [CUSTOMER_MANAGED_KEY] (you provide a KMS key).\n"]
}
[@@ocaml.doc
  "Configuration for encrypting workflow data at rest and in transit. Amazon Managed Workflows for \
   Apache Airflow Serverless provides comprehensive encryption capabilities to protect sensitive \
   workflow data, parameters, and execution logs. When using customer-managed keys, the service \
   integrates with Amazon Web Services KMS to provide fine-grained access control and audit \
   capabilities. Encryption is applied consistently across the distributed execution environment \
   including task containers, metadata storage, and log streams.\n"]

type nonrec get_workflow_response = {
  workflow_definition : generic_string option; [@ocaml.doc "The workflow definition content.\n"]
  trigger_mode : generic_string option;
      [@ocaml.doc "The trigger mode for the workflow execution.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc "The network configuration for the workflow execution environment.\n"]
  role_arn : role_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role used for workflow execution.\n"]
  schedule_configuration : schedule_configuration option;
      [@ocaml.doc
        "The schedule configuration for the workflow, including cron expressions for automated \
         execution. Amazon Managed Workflows for Apache Airflow Serverless uses EventBridge \
         Scheduler for cost-effective, timezone-aware scheduling. When a workflow includes \
         schedule information in its YAML definition, the service automatically configures the \
         appropriate triggers for automated execution. Only one version of a workflow can have an \
         active schedule at any given time.\n"]
  definition_s3_location : definition_s3_location option;
      [@ocaml.doc "The Amazon S3 location of the workflow definition file.\n"]
  workflow_status : workflow_status option; [@ocaml.doc "The current status of the workflow.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The version of the Amazon Managed Workflows for Apache Airflow Serverless engine that \
         this workflow uses.\n"]
  logging_configuration : logging_configuration option;
      [@ocaml.doc "The logging configuration for the workflow.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc "The encryption configuration for the workflow.\n"]
  modified_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the workflow was last modified, in ISO 8601 date-time format.\n"]
  created_at : timestamp_value option;
      [@ocaml.doc "The timestamp when the workflow was created, in ISO 8601 date-time format.\n"]
  description : description_string option; [@ocaml.doc "The description of the workflow.\n"]
  name : name_string option; [@ocaml.doc "The name of the workflow.\n"]
  workflow_version : workflow_version option;
      [@ocaml.doc "The version identifier of the workflow.\n"]
  workflow_arn : workflow_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_request = {
  workflow_version : workflow_version option;
      [@ocaml.doc
        "Optional. The specific version of the workflow to retrieve. If not specified, the latest \
         version is returned.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec generic_map = (generic_string * generic_string) list [@@ocaml.doc ""]

type nonrec get_task_instance_response = {
  xcom : generic_map option;
      [@ocaml.doc "Cross-communication data exchanged between tasks in the workflow execution.\n"]
  log_stream : id_string option;
      [@ocaml.doc "The CloudWatch log stream name for this task instance execution.\n"]
  task_id : id_string option;
      [@ocaml.doc "The unique identifier of the task definition within the workflow.\n"]
  error_message : generic_string option;
      [@ocaml.doc
        "The error message if the task instance failed. This value is null if the task completed \
         successfully.\n"]
  attempt_number : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The attempt number for this task instance.\n"]
  started_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the task instance started execution, in ISO 8601 date-time format. \
         This value is null if the task has not started.\n"]
  ended_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the task instance completed execution, in ISO 8601 date-time format. \
         This value is null if the task is not complete.\n"]
  modified_at : timestamp_value option;
      [@ocaml.doc
        "The timestamp when the task instance was last modified, in ISO 8601 date-time format.\n"]
  operator_name : generic_string option;
      [@ocaml.doc "The name of the Apache Airflow operator used for this task instance.\n"]
  duration_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The duration of the task instance execution in seconds. This value is null if the task is \
         not complete.\n"]
  status : task_instance_status option; [@ocaml.doc "The current status of the task instance.\n"]
  workflow_version : version_id option;
      [@ocaml.doc "The version of the workflow that contains this task instance.\n"]
  task_instance_id : id_string; [@ocaml.doc "The unique identifier of this task instance.\n"]
  run_id : id_string;
      [@ocaml.doc "The unique identifier of the workflow run that contains this task instance.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the workflow that contains this task instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_task_instance_request = {
  run_id : id_string;
      [@ocaml.doc "The unique identifier of the workflow run that contains the task instance.\n"]
  task_instance_id : id_string;
      [@ocaml.doc "The unique identifier of the task instance to retrieve.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the workflow that contains the task instance.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workflow_response = {
  workflow_version : workflow_version option;
      [@ocaml.doc "The version of the workflow that was deleted.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workflow_request = {
  workflow_version : workflow_version option;
      [@ocaml.doc
        "Optional. The specific version of the workflow to delete. If not specified, all versions \
         of the workflow are deleted.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the workflow you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workflow_response = {
  warnings : warning_messages option;
      [@ocaml.doc "Warning messages generated during workflow creation.\n"]
  is_latest_version : is_latest_version option;
      [@ocaml.doc
        "A Boolean flag that indicates whether this workflow version is the latest version of the \
         workflow.\n"]
  workflow_version : workflow_version option;
      [@ocaml.doc
        "The version identifier of the workflow. This is a service-generated alphanumeric string \
         that uniquely identifies this version of the workflow. Amazon Managed Workflows for \
         Apache Airflow Serverless uses a version-first approach where each workflow can have \
         multiple immutable versions, which allows you to maintain different configurations and \
         roll back to previous versions as needed. The version identifier is used in ARNs and API \
         operations to reference specific workflow versions.\n"]
  workflow_status : workflow_status option;
      [@ocaml.doc
        "The current status of the workflow. Possible values are [READY] (workflow is ready to \
         run) and [DELETING] (workflow is being deleted).\n"]
  revision_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A unique identifier for this revision of the workflow configuration. This ID changes when \
         the workflow is updated and you can use it for optimistic concurrency control in update \
         operations. The revision ID helps prevent conflicting updates and ensures that updates \
         are applied to the expected version of the workflow configuration.\n"]
  created_at : timestamp_value option;
      [@ocaml.doc "The timestamp when the workflow was created, in ISO 8601 date-time format.\n"]
  workflow_arn : workflow_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the newly created workflow. This ARN uniquely \
         identifies the workflow resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workflow_request = {
  trigger_mode : generic_string option;
      [@ocaml.doc "The trigger mode for the workflow execution.\n"]
  tags : tags option;
      [@ocaml.doc
        "A map of tags to assign to the workflow resource. Tags are key-value pairs that are used \
         for resource organization and cost allocation.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "Network configuration for the workflow execution environment, including VPC security \
         groups and subnets for secure network access. When specified, Amazon Managed Workflows \
         for Apache Airflow Serverless deploys ECS worker tasks in your customer VPC to provide \
         secure connectivity to your resources. If not specified, tasks run in the service's \
         default worker VPC with network isolation from other customers. This configuration \
         enables secure access to VPC-only resources like RDS databases or private endpoints.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The version of the Amazon Managed Workflows for Apache Airflow Serverless engine that you \
         want to use for this workflow. This determines the feature set, supported operators, and \
         execution environment capabilities available to your workflow. Amazon Managed Workflows \
         for Apache Airflow Serverless maintains backward compatibility across versions while \
         introducing new features and improvements. Currently supports version 1 with plans for \
         additional versions as the service evolves.\n"]
  logging_configuration : logging_configuration option;
      [@ocaml.doc
        "The configuration for workflow logging. Specifies the CloudWatch log group where workflow \
         execution logs are stored. Amazon Managed Workflows for Apache Airflow Serverless \
         automatically exports worker logs and task-level information to the specified log group \
         in your account using remote logging functionality. This provides comprehensive \
         observability for debugging and monitoring workflow execution across the distributed, \
         serverless environment.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The configuration for encrypting workflow data at rest and in transit. Specifies the \
         encryption type and optional KMS key for customer-managed encryption.\n"]
  description : description_string option;
      [@ocaml.doc
        "An optional description of the workflow that you can use to provide additional context \
         about the workflow's purpose and functionality.\n"]
  role_arn : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that Amazon Managed Workflows for Apache \
         Airflow Serverless assumes when executing the workflow. This role must have the necessary \
         permissions to access the required Amazon Web Services services and resources that your \
         workflow tasks will interact with. The role is used for task execution in the isolated, \
         multi-tenant environment and should follow the principle of least privilege. Amazon \
         Managed Workflows for Apache Airflow Serverless validates role access during workflow \
         creation but runtime permission checks are performed by the target services.\n"]
  definition_s3_location : definition_s3_location;
      [@ocaml.doc
        "The Amazon S3 location where the workflow definition file is stored. This must point to a \
         valid YAML file that defines the workflow structure using supported Amazon Web Services \
         operators and tasks. Amazon Managed Workflows for Apache Airflow Serverless takes a \
         snapshot of the definition at creation time, so subsequent changes to the Amazon S3 \
         object will not affect the workflow unless you create a new version. In your YAML \
         definition, include task dependencies, scheduling information, and operator \
         configurations that are compatible with the Amazon Managed Workflows for Apache Airflow \
         Serverless execution environment.\n"]
  client_token : idempotency_token_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. This token prevents duplicate workflow creation requests.\n"]
  name : name_string;
      [@ocaml.doc
        "The name of the workflow. You must use unique workflow names within your Amazon Web \
         Services account. The service generates a unique identifier that is appended to ensure \
         temporal uniqueness across the account lifecycle.\n"]
}
[@@ocaml.doc ""]
