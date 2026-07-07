type nonrec table_name_string = string [@@ocaml.doc ""]

type nonrec metric_counts = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec glue_connection_name_string = string [@@ocaml.doc ""]

type nonrec dpu_hours = float [@@ocaml.doc ""]

type nonrec dpu_duration_in_hour = float [@@ocaml.doc ""]

type nonrec dpu_counts = int [@@ocaml.doc ""]

type nonrec database_name_string = string [@@ocaml.doc ""]

type nonrec name_string = string [@@ocaml.doc ""]

type nonrec classification = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec version_id = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec row_tag = string [@@ocaml.doc ""]

type nonrec xml_classifier = {
  row_tag : row_tag option;
      [@ocaml.doc
        "The XML tag designating the element that contains each record in an XML document being \
         parsed. This can't identify a self-closing element (closed by [/>]). An empty row element \
         that contains only attributes can be parsed as long as it ends with a closing tag (for \
         example, \n\
         {[\n\n\
         ]}\n\
        \ is okay, but \n\
         {[\n\n\
         ]}\n\
        \ is not).\n"]
  version : version_id option; [@ocaml.doc "The version of this classifier.\n"]
  last_updated : timestamp option; [@ocaml.doc "The time that this classifier was last updated.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that this classifier was registered.\n"]
  classification : classification;
      [@ocaml.doc "An identifier of the data format that the classifier matches.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "A classifier for [XML] content.\n"]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec id_string = string [@@ocaml.doc ""]

type nonrec workflow_run_properties = (id_string * generic_string) list [@@ocaml.doc ""]

type nonrec timestamp_value = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec workflow_run_status =
  | ERROR [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_string = string [@@ocaml.doc ""]

type nonrec integer_value = int [@@ocaml.doc ""]

type nonrec workflow_run_statistics = {
  waiting_actions : integer_value option;
      [@ocaml.doc "Indicates the count of job runs in WAITING state in the workflow run.\n"]
  errored_actions : integer_value option;
      [@ocaml.doc "Indicates the count of job runs in the ERROR state in the workflow run.\n"]
  running_actions : integer_value option; [@ocaml.doc "Total number Actions in running state.\n"]
  succeeded_actions : integer_value option;
      [@ocaml.doc "Total number of Actions that have succeeded.\n"]
  stopped_actions : integer_value option;
      [@ocaml.doc "Total number of Actions that have stopped.\n"]
  failed_actions : integer_value option; [@ocaml.doc "Total number of Actions that have failed.\n"]
  timeout_actions : integer_value option; [@ocaml.doc "Total number of Actions that timed out.\n"]
  total_actions : integer_value option; [@ocaml.doc "Total number of Actions in the workflow run.\n"]
}
[@@ocaml.doc "Workflow run statistics provides statistics about the workflow run.\n"]

type nonrec node_type = TRIGGER [@ocaml.doc ""] | JOB [@ocaml.doc ""] | CRAWLER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec trigger_type =
  | EVENT [@ocaml.doc ""]
  | ON_DEMAND [@ocaml.doc ""]
  | CONDITIONAL [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec trigger_state =
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DEACTIVATED [@ocaml.doc ""]
  | DEACTIVATING [@ocaml.doc ""]
  | ACTIVATED [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec description_string = string [@@ocaml.doc ""]

type nonrec generic_map = (generic_string * generic_string) list [@@ocaml.doc ""]

type nonrec timeout = int [@@ocaml.doc ""]

type nonrec notify_delay_after = int [@@ocaml.doc ""]

type nonrec notification_property = {
  notify_delay_after : notify_delay_after option;
      [@ocaml.doc
        "After a job run starts, the number of minutes to wait before sending a job run delay \
         notification.\n"]
}
[@@ocaml.doc "Specifies configuration properties of a notification.\n"]

type nonrec action = {
  crawler_name : name_string option;
      [@ocaml.doc "The name of the crawler to be used with this action.\n"]
  notification_property : notification_property option;
      [@ocaml.doc "Specifies configuration properties of a job run notification.\n"]
  security_configuration : name_string option;
      [@ocaml.doc
        "The name of the [SecurityConfiguration] structure to be used with this action.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The [JobRun] timeout in minutes. This is the maximum time that a job run can consume \
         resources before it is terminated and enters [TIMEOUT] status. This overrides the timeout \
         value set in the parent job.\n\n\
        \ Jobs must have timeout values less than 7 days or 10080 minutes. Otherwise, the jobs \
         will throw an exception.\n\
        \ \n\
        \  When the value is left blank, the timeout is defaulted to 2,880 minutes for Glue \
         version 4.0 and earlier, or 480 minutes for Glue version 5.0 and later.\n\
        \  \n\
        \   Any existing Glue jobs that had a timeout value greater than 7 days will be defaulted \
         to 7 days. For instance if you have specified a timeout of 20 days for a batch job, it \
         will be stopped on the 7th day.\n\
        \   \n\
        \    For streaming jobs, if you have set up a maintenance window, it will be restarted \
         during the maintenance window after 7 days.\n\
        \    "]
  arguments : generic_map option;
      [@ocaml.doc
        "The job arguments used when this trigger fires. For this job run, they replace the \
         default arguments set in the job definition itself.\n\n\
        \ You can specify arguments here that your own job-execution script consumes, as well as \
         arguments that Glue itself consumes.\n\
        \ \n\
        \  For information about how to specify and consume your own Job arguments, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html}Calling \
         Glue APIs in Python} topic in the developer guide.\n\
        \  \n\
        \   For information about the key-value pairs that Glue consumes to set up your job, see \
         the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Special \
         Parameters Used by Glue} topic in the developer guide.\n\
        \   "]
  job_name : name_string option; [@ocaml.doc "The name of a job to be run.\n"]
}
[@@ocaml.doc "Defines an action to be initiated by a trigger.\n"]

type nonrec action_list = action list [@@ocaml.doc ""]

type nonrec logical = ANY [@ocaml.doc ""] | AND [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec logical_operator = EQUALS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec job_run_state =
  | EXPIRED [@ocaml.doc ""]
  | WAITING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec crawl_state =
  | ERROR [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec condition = {
  crawl_state : crawl_state option;
      [@ocaml.doc "The state of the crawler to which this condition applies.\n"]
  crawler_name : name_string option;
      [@ocaml.doc "The name of the crawler to which this condition applies.\n"]
  state : job_run_state option;
      [@ocaml.doc
        "The condition state. Currently, the only job states that a trigger can listen for are \
         [SUCCEEDED], [STOPPED], [FAILED], and [TIMEOUT]. The only crawler states that a trigger \
         can listen for are [SUCCEEDED], [FAILED], and [CANCELLED].\n"]
  job_name : name_string option;
      [@ocaml.doc
        "The name of the job whose [JobRuns] this condition applies to, and on which this trigger \
         waits.\n"]
  logical_operator : logical_operator option; [@ocaml.doc "A logical operator.\n"]
}
[@@ocaml.doc "Defines a condition under which a trigger fires.\n"]

type nonrec condition_list = condition list [@@ocaml.doc ""]

type nonrec predicate = {
  conditions : condition_list option;
      [@ocaml.doc "A list of the conditions that determine when the trigger will fire.\n"]
  logical : logical option;
      [@ocaml.doc
        "An optional field if only one condition is listed. If multiple conditions are listed, \
         then this field is required.\n"]
}
[@@ocaml.doc "Defines the predicate of the trigger, which determines when it fires.\n"]

type nonrec batch_size = int [@@ocaml.doc ""]

type nonrec batch_window = int [@@ocaml.doc ""]

type nonrec event_batching_condition = {
  batch_window : batch_window option;
      [@ocaml.doc
        "Window of time in seconds after which EventBridge event trigger fires. Window starts when \
         first event is received.\n"]
  batch_size : batch_size;
      [@ocaml.doc
        "Number of events that must be received from Amazon EventBridge before EventBridge event \
         trigger fires.\n"]
}
[@@ocaml.doc
  "Batch condition that must be met (specified number of events received or batch time window \
   expired) before EventBridge event trigger fires.\n"]

type nonrec trigger = {
  event_batching_condition : event_batching_condition option;
      [@ocaml.doc
        "Batch condition that must be met (specified number of events received or batch time \
         window expired) before EventBridge event trigger fires.\n"]
  predicate : predicate option;
      [@ocaml.doc "The predicate of this trigger, which defines when it will fire.\n"]
  actions : action_list option; [@ocaml.doc "The actions initiated by this trigger.\n"]
  schedule : generic_string option;
      [@ocaml.doc
        "A [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n"]
  description : description_string option; [@ocaml.doc "A description of this trigger.\n"]
  state : trigger_state option; [@ocaml.doc "The current state of the trigger.\n"]
  type_ : trigger_type option; [@ocaml.doc "The type of trigger that this is.\n"]
  id : id_string option; [@ocaml.doc "Reserved for future use.\n"]
  workflow_name : name_string option;
      [@ocaml.doc "The name of the workflow associated with the trigger.\n"]
  name : name_string option; [@ocaml.doc "The name of the trigger.\n"]
}
[@@ocaml.doc "Information about a specific trigger.\n"]

type nonrec trigger_node_details = {
  trigger : trigger option;
      [@ocaml.doc "The information of the trigger represented by the trigger node.\n"]
}
[@@ocaml.doc "The details of a Trigger node present in the workflow.\n"]

type nonrec attempt_count = int [@@ocaml.doc ""]

type nonrec job_mode = NOTEBOOK [@ocaml.doc ""] | VISUAL [@ocaml.doc ""] | SCRIPT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec predecessor = {
  run_id : id_string option; [@ocaml.doc "The job-run ID of the predecessor job run.\n"]
  job_name : name_string option;
      [@ocaml.doc "The name of the job definition used by the predecessor job run.\n"]
}
[@@ocaml.doc
  "A job run that was used in the predicate of a conditional trigger that triggered this job run.\n"]

type nonrec predecessor_list = predecessor list [@@ocaml.doc ""]

type nonrec execution_time = int [@@ocaml.doc ""]

type nonrec nullable_double = float [@@ocaml.doc ""]

type nonrec worker_type =
  | Z_2X [@ocaml.doc ""]
  | G_8X [@ocaml.doc ""]
  | G_4X [@ocaml.doc ""]
  | G_025X [@ocaml.doc ""]
  | G_2X [@ocaml.doc ""]
  | G_1X [@ocaml.doc ""]
  | Standard [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec nullable_integer = int [@@ocaml.doc ""]

type nonrec glue_version_string = string [@@ocaml.doc ""]

type nonrec execution_class = STANDARD [@ocaml.doc ""] | FLEX [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec maintenance_window = string [@@ocaml.doc ""]

type nonrec orchestration_message_string = string [@@ocaml.doc ""]

type nonrec orchestration_policy_json_string = string [@@ocaml.doc ""]

type nonrec job_run = {
  execution_role_session_policy : orchestration_policy_json_string option;
      [@ocaml.doc
        "This inline session policy to the StartJobRun API allows you to dynamically restrict the \
         permissions of the specified execution role for the scope of the job, without requiring \
         the creation of additional IAM roles.\n"]
  state_detail : orchestration_message_string option;
      [@ocaml.doc
        "This field holds details that pertain to the state of a job run. The field is nullable.\n\n\
        \ For example, when a job run is in a WAITING state as a result of job run queuing, the \
         field has the reason why the job run is in that state.\n\
        \ "]
  profile_name : name_string option;
      [@ocaml.doc "The name of an Glue usage profile associated with the job run.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "This field specifies a day of the week and hour for a maintenance window for streaming \
         jobs. Glue periodically performs maintenance activities. During these maintenance \
         windows, Glue will need to restart your streaming jobs.\n\n\
        \ Glue will restart the job within 3 hours of the specified maintenance window. For \
         instance, if you set up the maintenance window for Monday at 10:00AM GMT, your jobs will \
         be restarted between 10:00AM GMT to 1:00PM GMT.\n\
        \ "]
  execution_class : execution_class option;
      [@ocaml.doc
        "Indicates whether the job is run with a standard or flexible execution class. The \
         standard execution-class is ideal for time-sensitive workloads that require fast job \
         startup and dedicated resources.\n\n\
        \ The flexible execution class is appropriate for time-insensitive jobs whose start and \
         completion times may vary. \n\
        \ \n\
        \  Only jobs with Glue version 3.0 and above and command type [glueetl] will be allowed to \
         set [ExecutionClass] to [FLEX]. The flexible execution class is available for Spark jobs.\n\
        \  "]
  dpu_seconds : nullable_double option;
      [@ocaml.doc
        "This field can be set for either job runs with execution class [FLEX] or when Auto \
         Scaling is enabled, and represents the total time each executor ran during the lifecycle \
         of a job run in seconds, multiplied by a DPU factor (1 for [G.1X], 2 for [G.2X], or 0.25 \
         for [G.025X] workers). This value may be different than the [executionEngineRuntime] * \
         [MaxCapacity] as in the case of Auto Scaling jobs, as the number of executors running at \
         a given time may be less than the [MaxCapacity]. Therefore, it is possible that the value \
         of [DPUSeconds] is less than [executionEngineRuntime] * [MaxCapacity].\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "In Spark jobs, [GlueVersion] determines the versions of Apache Spark and Python that Glue \
         available in a job. The Python version indicates the version supported for jobs of type \
         Spark. \n\n\
        \ Ray jobs should set [GlueVersion] to [4.0] or greater. However, the versions of Ray, \
         Python and additional libraries available in your Ray job are determined by the [Runtime] \
         parameter of the Job command.\n\
        \ \n\
        \  For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \  \n\
        \   Jobs that are created without specifying a Glue version default to Glue 5.1.\n\
        \   "]
  notification_property : notification_property option;
      [@ocaml.doc "Specifies configuration properties of a job run notification.\n"]
  log_group_name : generic_string option;
      [@ocaml.doc
        "The name of the log group for secure logging that can be server-side encrypted in Amazon \
         CloudWatch using KMS. This name can be [/aws-glue/jobs/], in which case the default \
         encryption is [NONE]. If you add a role name and [SecurityConfiguration] name (in other \
         words, [/aws-glue/jobs-yourRoleName-yourSecurityConfigurationName/]), then that security \
         configuration is used to encrypt the log group.\n"]
  security_configuration : name_string option;
      [@ocaml.doc
        "The name of the [SecurityConfiguration] structure to be used with this job run.\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when a job runs.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a job runs. Accepts a value of G.1X, \
         G.2X, G.4X, G.8X or G.025X for Spark jobs. Accepts the value Z.2X for Ray jobs.\n\n\
        \ {ul\n\
        \       {-  For the [G.1X] worker type, each worker maps to 1 DPU (4 vCPUs, 16 GB of \
         memory) with 94GB disk, and provides 1 executor per worker. We recommend this worker type \
         for workloads such as data transforms, joins, and queries, to offers a scalable and cost \
         effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker maps to 2 DPU (8 vCPUs, 32 GB of \
         memory) with 138GB disk, and provides 1 executor per worker. We recommend this worker \
         type for workloads such as data transforms, joins, and queries, to offers a scalable and \
         cost effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.4X] worker type, each worker maps to 4 DPU (16 vCPUs, 64 GB of \
         memory) with 256GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs in the following Amazon Web Services Regions: US East (Ohio), US East (N. \
         Virginia), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia \
         Pacific (Tokyo), Canada (Central), Europe (Frankfurt), Europe (Ireland), and Europe \
         (Stockholm).\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.8X] worker type, each worker maps to 8 DPU (32 vCPUs, 128 GB of \
         memory) with 512GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs, in the same Amazon Web Services Regions as supported for the [G.4X] \
         worker type.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.025X] worker type, each worker maps to 0.25 DPU (2 vCPUs, 4 GB of \
         memory) with 84GB disk, and provides 1 executor per worker. We recommend this worker type \
         for low volume streaming jobs. This worker type is only available for Glue version 3.0 or \
         later streaming jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [Z.2X] worker type, each worker maps to 2 M-DPU (8vCPUs, 64 GB of \
         memory) with 128 GB disk, and provides up to 8 Ray workers based on the autoscaler.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "For Glue version 1.0 or earlier jobs, using the standard worker type, the number of Glue \
         data processing units (DPUs) that can be allocated when this job runs. A DPU is a \
         relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 \
         GB of memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/} Glue \
         pricing page}.\n\n\
        \ For Glue version 2.0+ jobs, you cannot specify a [Maximum capacity]. Instead, you should \
         specify a [Worker type] and the [Number of workers].\n\
        \ \n\
        \  Do not set [MaxCapacity] if using [WorkerType] and [NumberOfWorkers].\n\
        \  \n\
        \   The value that can be allocated for [MaxCapacity] depends on whether you are running a \
         Python shell job, an Apache Spark ETL job, or an Apache Spark streaming ETL job:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you specify a Python shell job ([JobCommand.Name]=\"pythonshell\"), \
         you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.\n\
        \              \n\
        \               }\n\
        \          {-  When you specify an Apache Spark ETL job ([JobCommand.Name]=\"glueetl\") or \
         Apache Spark streaming ETL job ([JobCommand.Name]=\"gluestreaming\"), you can allocate \
         from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU \
         allocation.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  timeout : timeout option;
      [@ocaml.doc
        "The [JobRun] timeout in minutes. This is the maximum time that a job run can consume \
         resources before it is terminated and enters [TIMEOUT] status. This value overrides the \
         timeout value set in the parent job.\n\n\
        \ Jobs must have timeout values less than 7 days or 10080 minutes. Otherwise, the jobs \
         will throw an exception.\n\
        \ \n\
        \  When the value is left blank, the timeout is defaulted to 2,880 minutes for Glue \
         version 4.0 and earlier, or 480 minutes for Glue version 5.0 and later.\n\
        \  \n\
        \   Any existing Glue jobs that had a timeout value greater than 7 days will be defaulted \
         to 7 days. For instance if you have specified a timeout of 20 days for a batch job, it \
         will be stopped on the 7th day.\n\
        \   \n\
        \    For streaming jobs, if you have set up a maintenance window, it will be restarted \
         during the maintenance window after 7 days.\n\
        \    "]
  execution_time : execution_time option;
      [@ocaml.doc "The amount of time (in seconds) that the job run consumed resources.\n"]
  allocated_capacity : integer_value option;
      [@ocaml.doc
        "This field is deprecated. Use [MaxCapacity] instead.\n\n\
        \ The number of Glue data processing units (DPUs) allocated to this JobRun. From 2 to 100 \
         DPUs can be allocated; the default is 10. A DPU is a relative measure of processing power \
         that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, \
         see the {{:https://aws.amazon.com/glue/pricing/}Glue pricing page}.\n\
        \ "]
  predecessor_runs : predecessor_list option;
      [@ocaml.doc "A list of predecessors to this job run.\n"]
  error_message : error_string option;
      [@ocaml.doc "An error message associated with this job run.\n"]
  arguments : generic_map option;
      [@ocaml.doc
        "The job arguments associated with this run. For this job run, they replace the default \
         arguments set in the job definition itself.\n\n\
        \ You can specify arguments here that your own job-execution script consumes, as well as \
         arguments that Glue itself consumes.\n\
        \ \n\
        \  Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve \
         secrets from a Glue Connection, Secrets Manager or other secret management mechanism if \
         you intend to keep them within the Job. \n\
        \  \n\
        \   For information about how to specify and consume your own Job arguments, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html}Calling \
         Glue APIs in Python} topic in the developer guide.\n\
        \   \n\
        \    For information about the arguments you can provide to this field when configuring \
         Spark jobs, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Special \
         Parameters Used by Glue} topic in the developer guide.\n\
        \    \n\
        \     For information about the arguments you can provide to this field when configuring \
         Ray jobs, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/author-job-ray-job-parameters.html}Using \
         job parameters in Ray jobs} in the developer guide.\n\
        \     "]
  job_run_state : job_run_state option;
      [@ocaml.doc
        "The current state of the job run. For more information about the statuses of jobs that \
         have terminated abnormally, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/job-run-statuses.html}Glue Job Run \
         Statuses}.\n"]
  completed_on : timestamp_value option;
      [@ocaml.doc "The date and time that this job run completed.\n"]
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The last time that this job run was modified.\n"]
  started_on : timestamp_value option;
      [@ocaml.doc "The date and time at which this job run was started.\n"]
  job_run_queuing_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether job run queuing is enabled for the job run.\n\n\
        \ A value of true means job run queuing is enabled for the job run. If false or not \
         populated, the job run will not be considered for queueing.\n\
        \ "]
  job_mode : job_mode option;
      [@ocaml.doc
        "A mode that describes how a job was created. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [SCRIPT] - The job was created using the Glue Studio script editor.\n\
        \           \n\
        \            }\n\
        \       {-   [VISUAL] - The job was created using the Glue Studio visual editor.\n\
        \           \n\
        \            }\n\
        \       {-   [NOTEBOOK] - The job was created using an interactive sessions notebook.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When the [JobMode] field is missing or null, [SCRIPT] is assigned as the default value.\n\
        \   "]
  job_name : name_string option;
      [@ocaml.doc "The name of the job definition being used in this run.\n"]
  trigger_name : name_string option;
      [@ocaml.doc "The name of the trigger that started this job run.\n"]
  previous_run_id : id_string option;
      [@ocaml.doc
        "The ID of the previous run of this job. For example, the [JobRunId] specified in the \
         [StartJobRun] action.\n"]
  attempt : attempt_count option; [@ocaml.doc "The number of the attempt to run this job.\n"]
  id : id_string option; [@ocaml.doc "The ID of this job run.\n"]
}
[@@ocaml.doc "Contains information about a job run.\n"]

type nonrec job_run_list = job_run list [@@ocaml.doc ""]

type nonrec job_node_details = {
  job_runs : job_run_list option;
      [@ocaml.doc "The information for the job runs represented by the job node.\n"]
}
[@@ocaml.doc "The details of a Job node present in the workflow.\n"]

type nonrec log_group = string [@@ocaml.doc ""]

type nonrec log_stream = string [@@ocaml.doc ""]

type nonrec crawl = {
  log_stream : log_stream option; [@ocaml.doc "The log stream associated with the crawl.\n"]
  log_group : log_group option; [@ocaml.doc "The log group associated with the crawl.\n"]
  error_message : description_string option;
      [@ocaml.doc "The error message associated with the crawl.\n"]
  completed_on : timestamp_value option;
      [@ocaml.doc "The date and time on which the crawl completed.\n"]
  started_on : timestamp_value option;
      [@ocaml.doc "The date and time on which the crawl started.\n"]
  state : crawl_state option; [@ocaml.doc "The state of the crawler.\n"]
}
[@@ocaml.doc "The details of a crawl in the workflow.\n"]

type nonrec crawl_list = crawl list [@@ocaml.doc ""]

type nonrec crawler_node_details = {
  crawls : crawl_list option; [@ocaml.doc "A list of crawls represented by the crawl node.\n"]
}
[@@ocaml.doc "The details of a Crawler node present in the workflow.\n"]

type nonrec node = {
  crawler_details : crawler_node_details option;
      [@ocaml.doc "Details of the crawler when the node represents a crawler.\n"]
  job_details : job_node_details option;
      [@ocaml.doc "Details of the Job when the node represents a Job.\n"]
  trigger_details : trigger_node_details option;
      [@ocaml.doc "Details of the Trigger when the node represents a Trigger.\n"]
  unique_id : name_string option;
      [@ocaml.doc "The unique Id assigned to the node within the workflow.\n"]
  name : name_string option;
      [@ocaml.doc "The name of the Glue component represented by the node.\n"]
  type_ : node_type option; [@ocaml.doc "The type of Glue component represented by the node.\n"]
}
[@@ocaml.doc
  "A node represents an Glue component (trigger, crawler, or job) on a workflow graph.\n"]

type nonrec node_list = node list [@@ocaml.doc ""]

type nonrec edge = {
  destination_id : name_string option;
      [@ocaml.doc "The unique of the node within the workflow where the edge ends.\n"]
  source_id : name_string option;
      [@ocaml.doc "The unique of the node within the workflow where the edge starts.\n"]
}
[@@ocaml.doc
  "An edge represents a directed connection between two Glue components that are part of the \
   workflow the edge belongs to.\n"]

type nonrec edge_list = edge list [@@ocaml.doc ""]

type nonrec workflow_graph = {
  edges : edge_list option;
      [@ocaml.doc
        "A list of all the directed connections between the nodes belonging to the workflow.\n"]
  nodes : node_list option;
      [@ocaml.doc
        "A list of the the Glue components belong to the workflow represented as nodes.\n"]
}
[@@ocaml.doc
  "A workflow graph represents the complete workflow containing all the Glue components present in \
   the workflow and all the directed connections between them.\n"]

type nonrec starting_event_batch_condition = {
  batch_window : nullable_integer option; [@ocaml.doc "Duration of the batch window in seconds.\n"]
  batch_size : nullable_integer option; [@ocaml.doc "Number of events in the batch.\n"]
}
[@@ocaml.doc
  "The batch condition that started the workflow run. Either the number of events in the batch \
   size arrived, in which case the BatchSize member is non-zero, or the batch window expired, in \
   which case the BatchWindow member is non-zero.\n"]

type nonrec workflow_run = {
  starting_event_batch_condition : starting_event_batch_condition option;
      [@ocaml.doc "The batch condition that started the workflow run.\n"]
  graph : workflow_graph option;
      [@ocaml.doc
        "The graph representing all the Glue components that belong to the workflow as nodes and \
         directed connections between them as edges.\n"]
  statistics : workflow_run_statistics option; [@ocaml.doc "The statistics of the run.\n"]
  error_message : error_string option;
      [@ocaml.doc
        "This error message describes any error that may have occurred in starting the workflow \
         run. Currently the only error message is \"Concurrent runs exceeded for workflow: [foo].\"\n"]
  status : workflow_run_status option; [@ocaml.doc "The status of the workflow run.\n"]
  completed_on : timestamp_value option;
      [@ocaml.doc "The date and time when the workflow run completed.\n"]
  started_on : timestamp_value option;
      [@ocaml.doc "The date and time when the workflow run was started.\n"]
  workflow_run_properties : workflow_run_properties option;
      [@ocaml.doc "The workflow run properties which were set during the run.\n"]
  previous_run_id : id_string option; [@ocaml.doc "The ID of the previous workflow run.\n"]
  workflow_run_id : id_string option; [@ocaml.doc "The ID of this workflow run.\n"]
  name : name_string option; [@ocaml.doc "Name of the workflow that was run.\n"]
}
[@@ocaml.doc
  "A workflow run is an execution of a workflow providing all the runtime information.\n"]

type nonrec orchestration_name_string = string [@@ocaml.doc ""]

type nonrec blueprint_details = {
  run_id : id_string option; [@ocaml.doc "The run ID for this blueprint.\n"]
  blueprint_name : orchestration_name_string option; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc "The details of a blueprint.\n"]

type nonrec workflow = {
  blueprint_details : blueprint_details option;
      [@ocaml.doc
        "This structure indicates the details of the blueprint that this particular workflow is \
         created from.\n"]
  max_concurrent_runs : nullable_integer option;
      [@ocaml.doc
        "You can use this parameter to prevent unwanted multiple updates to data, to control \
         costs, or in some cases, to prevent exceeding the maximum number of concurrent runs of \
         any of the component jobs. If you leave this parameter blank, there is no limit to the \
         number of concurrent workflow runs.\n"]
  graph : workflow_graph option;
      [@ocaml.doc
        "The graph representing all the Glue components that belong to the workflow as nodes and \
         directed connections between them as edges.\n"]
  last_run : workflow_run option;
      [@ocaml.doc "The information about the last execution of the workflow.\n"]
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The date and time when the workflow was last modified.\n"]
  created_on : timestamp_value option;
      [@ocaml.doc "The date and time when the workflow was created.\n"]
  default_run_properties : workflow_run_properties option;
      [@ocaml.doc
        "A collection of properties to be used as part of each execution of the workflow. The run \
         properties are made available to each job in the workflow. A job can modify the \
         properties for the next jobs in the flow.\n"]
  description : generic_string option; [@ocaml.doc "A description of the workflow.\n"]
  name : name_string option; [@ocaml.doc "The name of the workflow.\n"]
}
[@@ocaml.doc
  "A workflow is a collection of multiple dependent Glue jobs and crawlers that are run to \
   complete a complex ETL task. A workflow manages the execution and monitoring of all its jobs \
   and crawlers.\n"]

type nonrec workflows = workflow list [@@ocaml.doc ""]

type nonrec workflow_runs = workflow_run list [@@ocaml.doc ""]

type nonrec workflow_names = name_string list [@@ocaml.doc ""]

type nonrec workflow_description_string = string [@@ocaml.doc ""]

type nonrec view_dialect =
  | SPARK [@ocaml.doc ""]
  | ATHENA [@ocaml.doc ""]
  | REDSHIFT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec view_dialect_version_string = string [@@ocaml.doc ""]

type nonrec view_text_string = string [@@ocaml.doc ""]

type nonrec resource_state =
  | FAILED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_detail = {
  error_message : description_string option; [@ocaml.doc "A message describing the error.\n"]
  error_code : name_string option; [@ocaml.doc "The code associated with this error.\n"]
}
[@@ocaml.doc "Contains details about an error.\n"]

type nonrec view_validation = {
  error : error_detail option; [@ocaml.doc "An error associated with the validation.\n"]
  state : resource_state option; [@ocaml.doc "The state of the validation.\n"]
  update_time : timestamp option; [@ocaml.doc "The time of the last update.\n"]
  view_validation_text : view_text_string option;
      [@ocaml.doc "The [SELECT] query that defines the view, as provided by the customer.\n"]
  dialect_version : view_dialect_version_string option;
      [@ocaml.doc "The version of the dialect of the query engine. For example, 3.0.0.\n"]
  dialect : view_dialect option; [@ocaml.doc "The dialect of the query engine.\n"]
}
[@@ocaml.doc
  "A structure that contains information for an analytical engine to validate a view, prior to \
   persisting the view metadata. Used in the case of direct [UpdateTable] or [CreateTable] API \
   calls.\n"]

type nonrec view_validation_list = view_validation list [@@ocaml.doc ""]

type nonrec view_update_action =
  | DROP [@ocaml.doc ""]
  | ADD_OR_REPLACE [@ocaml.doc ""]
  | REPLACE [@ocaml.doc ""]
  | ADD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec arn_string = string [@@ocaml.doc ""]

type nonrec view_sub_objects_list = arn_string list [@@ocaml.doc ""]

type nonrec table_version_id = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec view_sub_object_version_ids_list = table_version_id list [@@ocaml.doc ""]

type nonrec view_representation = {
  is_stale : nullable_boolean option;
      [@ocaml.doc
        "Dialects marked as stale are no longer valid and must be updated before they can be \
         queried in their respective query engines.\n"]
  validation_connection : name_string option;
      [@ocaml.doc
        "The name of the connection to be used to validate the specific representation of the view.\n"]
  view_expanded_text : view_text_string option;
      [@ocaml.doc
        "The expanded SQL for the view. This SQL is used by engines while processing a query on a \
         view. Engines may perform operations during view creation to transform [ViewOriginalText] \
         to [ViewExpandedText]. For example:\n\n\
        \ {ul\n\
        \       {-  Fully qualified identifiers: [SELECT * from table1 -> SELECT * from db1.table1] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  view_original_text : view_text_string option;
      [@ocaml.doc
        "The [SELECT] query provided by the customer during [CREATE VIEW DDL]. This SQL is not \
         used during a query on a view ([ViewExpandedText] is used instead). [ViewOriginalText] is \
         used for cases like [SHOW CREATE VIEW] where users want to see the original DDL command \
         that created the view.\n"]
  dialect_version : view_dialect_version_string option;
      [@ocaml.doc "The version of the dialect of the query engine. For example, 3.0.0.\n"]
  dialect : view_dialect option; [@ocaml.doc "The dialect of the query engine.\n"]
}
[@@ocaml.doc
  "A structure that contains the dialect of the view, and the query that defines the view.\n"]

type nonrec view_representation_list = view_representation list [@@ocaml.doc ""]

type nonrec view_representation_input = {
  view_expanded_text : view_text_string option;
      [@ocaml.doc
        "A string that represents the SQL query that describes the view with expanded resource ARNs\n"]
  validation_connection : name_string option;
      [@ocaml.doc
        "The name of the connection to be used to validate the specific representation of the view.\n"]
  view_original_text : view_text_string option;
      [@ocaml.doc "A string that represents the original SQL query that describes the view.\n"]
  dialect_version : view_dialect_version_string option;
      [@ocaml.doc
        "A parameter that specifies the version of the engine of a specific representation.\n"]
  dialect : view_dialect option;
      [@ocaml.doc "A parameter that specifies the engine type of a specific representation.\n"]
}
[@@ocaml.doc
  "A structure containing details of a representation to update or create a Lake Formation view.\n"]

type nonrec view_representation_input_list = view_representation_input list [@@ocaml.doc ""]

type nonrec version_string = string [@@ocaml.doc ""]

type nonrec refresh_seconds = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec last_refresh_type = INCREMENTAL [@ocaml.doc ""] | FULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec view_definition_input = {
  sub_object_version_ids : view_sub_object_version_ids_list option;
      [@ocaml.doc
        "List of the Apache Iceberg table versions referenced by the materialized view.\n"]
  sub_objects : view_sub_objects_list option;
      [@ocaml.doc "A list of base table ARNs that make up the view.\n"]
  last_refresh_type : last_refresh_type option;
      [@ocaml.doc
        "The type of the materialized view's last refresh. Valid values: [Full], [Incremental].\n"]
  refresh_seconds : refresh_seconds option;
      [@ocaml.doc
        "Auto refresh interval in seconds for the materialized view. If not specified, the view \
         will not automatically refresh.\n"]
  view_version_token : version_string option;
      [@ocaml.doc "The version ID of the Apache Iceberg table.\n"]
  view_version_id : table_version_id option;
      [@ocaml.doc
        "The ID value that identifies this view's version. For materialized views, the version ID \
         is the Apache Iceberg table's snapshot ID. \n"]
  representations : view_representation_input_list option;
      [@ocaml.doc
        "A list of structures that contains the dialect of the view, and the query that defines \
         the view.\n"]
  definer : arn_string option; [@ocaml.doc "The definer of a view in SQL.\n"]
  is_protected : nullable_boolean option;
      [@ocaml.doc
        "You can set this flag as true to instruct the engine not to push user-provided operations \
         into the logical plan of the view during query planning. However, setting this flag does \
         not guarantee that the engine will comply. Refer to the engine's documentation to \
         understand the guarantees provided, if any.\n"]
}
[@@ocaml.doc "A structure containing details for creating or updating an Glue view.\n"]

type nonrec hash_string = string [@@ocaml.doc ""]

type nonrec view_definition = {
  representations : view_representation_list option; [@ocaml.doc "A list of representations.\n"]
  sub_object_version_ids : view_sub_object_version_ids_list option;
      [@ocaml.doc
        "List of the Apache Iceberg table versions referenced by the materialized view.\n"]
  sub_objects : view_sub_objects_list option;
      [@ocaml.doc "A list of table Amazon Resource Names (ARNs).\n"]
  last_refresh_type : last_refresh_type option;
      [@ocaml.doc "Sets the method used for the most recent refresh.\n"]
  refresh_seconds : refresh_seconds option;
      [@ocaml.doc
        "Auto refresh interval in seconds for the materialized view. If not specified, the view \
         will not automatically refresh.\n"]
  view_version_token : hash_string option;
      [@ocaml.doc "The version ID of the Apache Iceberg table.\n"]
  view_version_id : table_version_id option;
      [@ocaml.doc
        "The ID value that identifies this view's version. For materialized views, the version ID \
         is the Apache Iceberg table's snapshot ID. \n"]
  definer : arn_string option; [@ocaml.doc "The definer of a view in SQL.\n"]
  is_protected : nullable_boolean option;
      [@ocaml.doc
        "You can set this flag as true to instruct the engine not to push user-provided operations \
         into the logical plan of the view during query planning. However, setting this flag does \
         not guarantee that the engine will comply. Refer to the engine's documentation to \
         understand the guarantees provided, if any.\n"]
}
[@@ocaml.doc "A structure containing details for representations.\n"]

type nonrec versions_string = string [@@ocaml.doc ""]

type nonrec message_string = string [@@ocaml.doc ""]

type nonrec version_mismatch_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "There was a version conflict.\n"]

type nonrec version_long_number = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec vendor = string [@@ocaml.doc ""]

type nonrec value_string = string [@@ocaml.doc ""]

type nonrec value_string_list = value_string list [@@ocaml.doc ""]

type nonrec validation_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A value could not be validated.\n"]

type nonrec username = string [@@ocaml.doc ""]

type nonrec user_managed_client_application_client_secret = string [@@ocaml.doc ""]

type nonrec user_managed_client_application_client_id = string [@@ocaml.doc ""]

type nonrec function_type =
  | STORED_PROCEDURE [@ocaml.doc ""]
  | AGGREGATE_FUNCTION [@ocaml.doc ""]
  | REGULAR_FUNCTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec principal_type = GROUP [@ocaml.doc ""] | ROLE [@ocaml.doc ""] | USER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_type = ARCHIVE [@ocaml.doc ""] | FILE [@ocaml.doc ""] | JAR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ur_i = string [@@ocaml.doc ""]

type nonrec resource_uri = {
  uri : ur_i option; [@ocaml.doc "The URI for accessing the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "The type of the resource.\n"]
}
[@@ocaml.doc "The URIs for function resources.\n"]

type nonrec resource_uri_list = resource_uri list [@@ocaml.doc ""]

type nonrec catalog_id_string = string [@@ocaml.doc ""]

type nonrec user_defined_function = {
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the function resides.\n"]
  resource_uris : resource_uri_list option; [@ocaml.doc "The resource URIs for the function.\n"]
  create_time : timestamp option; [@ocaml.doc "The time at which the function was created.\n"]
  owner_type : principal_type option; [@ocaml.doc "The owner type.\n"]
  function_type : function_type option; [@ocaml.doc "The type of the function.\n"]
  owner_name : name_string option; [@ocaml.doc "The owner of the function.\n"]
  class_name : name_string option; [@ocaml.doc "The Java class that contains the function code.\n"]
  database_name : name_string option;
      [@ocaml.doc "The name of the catalog database that contains the function.\n"]
  function_name : name_string option; [@ocaml.doc "The name of the function.\n"]
}
[@@ocaml.doc "Represents the equivalent of a Hive user-defined function ([UDF]) definition.\n"]

type nonrec user_defined_function_list = user_defined_function list [@@ocaml.doc ""]

type nonrec user_defined_function_input = {
  resource_uris : resource_uri_list option; [@ocaml.doc "The resource URIs for the function.\n"]
  owner_type : principal_type option; [@ocaml.doc "The owner type.\n"]
  function_type : function_type option; [@ocaml.doc "The type of the function.\n"]
  owner_name : name_string option; [@ocaml.doc "The owner of the function.\n"]
  class_name : name_string option; [@ocaml.doc "The Java class that contains the function code.\n"]
  function_name : name_string option; [@ocaml.doc "The name of the function.\n"]
}
[@@ocaml.doc "A structure used to create or update a user-defined function.\n"]

type nonrec usage_profile_definition = {
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The date and time when the usage profile was last modified.\n"]
  created_on : timestamp_value option;
      [@ocaml.doc "The date and time when the usage profile was created.\n"]
  description : description_string option; [@ocaml.doc "A description of the usage profile.\n"]
  name : name_string option; [@ocaml.doc "The name of the usage profile.\n"]
}
[@@ocaml.doc "Describes an Glue usage profile.\n"]

type nonrec usage_profile_definition_list = usage_profile_definition list [@@ocaml.doc ""]

type nonrec url_string = string [@@ocaml.doc ""]

type nonrec uri_string = string [@@ocaml.doc ""]

type nonrec enclosed_in_string_property = string [@@ocaml.doc ""]

type nonrec enclosed_in_string_properties_min_one = enclosed_in_string_property list
[@@ocaml.doc ""]

type nonrec upsert_redshift_target_options = {
  upsert_keys : enclosed_in_string_properties_min_one option;
      [@ocaml.doc "The keys used to determine whether to perform an update or insert.\n"]
  connection_name : enclosed_in_string_property option;
      [@ocaml.doc "The name of the connection to use to write to Redshift.\n"]
  table_location : enclosed_in_string_property option;
      [@ocaml.doc "The physical location of the Redshift table.\n"]
}
[@@ocaml.doc "The options to configure an upsert operation when writing to a Redshift target .\n"]

type nonrec updated_timestamp = string [@@ocaml.doc ""]

type nonrec updated_at = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec update_xml_classifier_request = {
  row_tag : row_tag option;
      [@ocaml.doc
        "The XML tag designating the element that contains each record in an XML document being \
         parsed. This cannot identify a self-closing element (closed by [/>]). An empty row \
         element that contains only attributes can be parsed as long as it ends with a closing tag \
         (for example, \n\
         {[\n\n\
         ]}\n\
        \ is okay, but \n\
         {[\n\n\
         ]}\n\
        \ is not).\n"]
  classification : classification option;
      [@ocaml.doc "An identifier of the data format that the classifier matches.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "Specifies an XML classifier to be updated.\n"]

type nonrec update_workflow_response = {
  name : name_string option; [@ocaml.doc "The name of the workflow which was specified in input.\n"]
}
[@@ocaml.doc ""]

type nonrec update_workflow_request = {
  max_concurrent_runs : nullable_integer option;
      [@ocaml.doc
        "You can use this parameter to prevent unwanted multiple updates to data, to control \
         costs, or in some cases, to prevent exceeding the maximum number of concurrent runs of \
         any of the component jobs. If you leave this parameter blank, there is no limit to the \
         number of concurrent workflow runs.\n"]
  default_run_properties : workflow_run_properties option;
      [@ocaml.doc
        "A collection of properties to be used as part of each execution of the workflow.\n\n\
        \ Run properties may be logged. Do not pass plaintext secrets as properties. Retrieve \
         secrets from a Glue Connection, Amazon Web Services Secrets Manager or other secret \
         management mechanism if you intend to use them within the workflow run.\n\
        \ "]
  description : workflow_description_string option;
      [@ocaml.doc "The description of the workflow.\n"]
  name : name_string; [@ocaml.doc "Name of the workflow to be updated.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_timeout_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The operation timed out.\n"]

type nonrec invalid_input_exception = {
  from_federation_source : nullable_boolean option;
      [@ocaml.doc "Indicates whether or not the exception relates to a federated source.\n"]
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The input provided was not valid.\n"]

type nonrec internal_service_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "An internal service error occurred.\n"]

type nonrec entity_not_found_exception = {
  from_federation_source : nullable_boolean option;
      [@ocaml.doc "Indicates whether or not the exception relates to a federated source.\n"]
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A specified entity does not exist\n"]

type nonrec concurrent_modification_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "Two processes are trying to modify a resource simultaneously.\n"]

type nonrec update_user_defined_function_response = unit [@@ocaml.doc ""]

type nonrec update_user_defined_function_request = {
  function_input : user_defined_function_input;
      [@ocaml.doc "A [FunctionInput] object that redefines the function in the Data Catalog.\n"]
  function_name : name_string; [@ocaml.doc "The name of the function.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the function to be updated is located.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the function to be updated is located. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec glue_encryption_exception = {
  message : message_string option; [@ocaml.doc "The message describing the problem.\n"]
}
[@@ocaml.doc "An encryption operation failed.\n"]

type nonrec update_usage_profile_response = {
  name : name_string option; [@ocaml.doc "The name of the usage profile that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec config_value_string = string [@@ocaml.doc ""]

type nonrec allowed_values_string_list = config_value_string list [@@ocaml.doc ""]

type nonrec configuration_object = {
  max_value : config_value_string option;
      [@ocaml.doc "A maximum allowed value for the parameter.\n"]
  min_value : config_value_string option;
      [@ocaml.doc "A minimum allowed value for the parameter.\n"]
  allowed_values : allowed_values_string_list option;
      [@ocaml.doc "A list of allowed values for the parameter.\n"]
  default_value : config_value_string option; [@ocaml.doc "A default value for the parameter.\n"]
}
[@@ocaml.doc
  "Specifies the values that an admin sets for each job or session parameter configured in a Glue \
   usage profile.\n"]

type nonrec configuration_map = (name_string * configuration_object) list [@@ocaml.doc ""]

type nonrec profile_configuration = {
  job_configuration : configuration_map option;
      [@ocaml.doc "A key-value map of configuration parameters for Glue jobs. \n"]
  session_configuration : configuration_map option;
      [@ocaml.doc "A key-value map of configuration parameters for Glue sessions. \n"]
}
[@@ocaml.doc
  "Specifies the job and session values that an admin configures in an Glue usage profile.\n"]

type nonrec update_usage_profile_request = {
  configuration : profile_configuration;
      [@ocaml.doc
        "A [ProfileConfiguration] object specifying the job and session values for the profile.\n"]
  description : description_string option; [@ocaml.doc "A description of the usage profile.\n"]
  name : name_string; [@ocaml.doc "The name of the usage profile.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_not_supported_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The operation is not available in the region.\n"]

type nonrec update_trigger_response = {
  trigger : trigger option; [@ocaml.doc "The resulting trigger definition.\n"]
}
[@@ocaml.doc ""]

type nonrec trigger_update = {
  event_batching_condition : event_batching_condition option;
      [@ocaml.doc
        "Batch condition that must be met (specified number of events received or batch time \
         window expired) before EventBridge event trigger fires.\n"]
  predicate : predicate option;
      [@ocaml.doc "The predicate of this trigger, which defines when it will fire.\n"]
  actions : action_list option; [@ocaml.doc "The actions initiated by this trigger.\n"]
  schedule : generic_string option;
      [@ocaml.doc
        "A [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n"]
  description : description_string option; [@ocaml.doc "A description of this trigger.\n"]
  name : name_string option; [@ocaml.doc "Reserved for future use.\n"]
}
[@@ocaml.doc
  "A structure used to provide information used to update a trigger. This object updates the \
   previous trigger definition by overwriting it completely.\n"]

type nonrec update_trigger_request = {
  trigger_update : trigger_update; [@ocaml.doc "The new values with which to update the trigger.\n"]
  name : name_string; [@ocaml.doc "The name of the trigger to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_table_response = unit [@@ocaml.doc ""]

type nonrec non_negative_integer = int [@@ocaml.doc ""]

type nonrec column_type_string = string [@@ocaml.doc ""]

type nonrec comment_string = string [@@ocaml.doc ""]

type nonrec parameters_map_value = string [@@ocaml.doc ""]

type nonrec key_string = string [@@ocaml.doc ""]

type nonrec parameters_map = (key_string * parameters_map_value) list [@@ocaml.doc ""]

type nonrec column = {
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define properties associated with the column.\n"]
  comment : comment_string option; [@ocaml.doc "A free-form text comment.\n"]
  type_ : column_type_string option; [@ocaml.doc "The data type of the [Column].\n"]
  name : name_string; [@ocaml.doc "The name of the [Column].\n"]
}
[@@ocaml.doc "A column in a [Table].\n"]

type nonrec column_list = column list [@@ocaml.doc ""]

type nonrec location_string = string [@@ocaml.doc ""]

type nonrec location_string_list = location_string list [@@ocaml.doc ""]

type nonrec format_string = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec ser_de_info = {
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define initialization parameters for the SerDe.\n"]
  serialization_library : name_string option;
      [@ocaml.doc
        "Usually the class that implements the SerDe. An example is \
         [org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe].\n"]
  name : name_string option; [@ocaml.doc "Name of the SerDe.\n"]
}
[@@ocaml.doc
  "Information about a serialization/deserialization program (SerDe) that serves as an extractor \
   and loader.\n"]

type nonrec name_string_list = name_string list [@@ocaml.doc ""]

type nonrec integer_flag = int [@@ocaml.doc ""]

type nonrec order = {
  sort_order : integer_flag;
      [@ocaml.doc
        "Indicates that the column is sorted in ascending order ([== 1]), or in descending order \
         ([==0]).\n"]
  column : name_string; [@ocaml.doc "The name of the column.\n"]
}
[@@ocaml.doc "Specifies the sort order of a sorted column.\n"]

type nonrec order_list = order list [@@ocaml.doc ""]

type nonrec column_values_string = string [@@ocaml.doc ""]

type nonrec column_value_string_list = column_values_string list [@@ocaml.doc ""]

type nonrec location_map = (column_values_string * column_values_string) list [@@ocaml.doc ""]

type nonrec skewed_info = {
  skewed_column_value_location_maps : location_map option;
      [@ocaml.doc "A mapping of skewed values to the columns that contain them.\n"]
  skewed_column_values : column_value_string_list option;
      [@ocaml.doc "A list of values that appear so frequently as to be considered skewed.\n"]
  skewed_column_names : name_string_list option;
      [@ocaml.doc "A list of names of columns that contain skewed values.\n"]
}
[@@ocaml.doc
  "Specifies skewed values in a table. Skewed values are those that occur with very high frequency.\n"]

type nonrec glue_resource_arn = string [@@ocaml.doc ""]

type nonrec schema_registry_name_string = string [@@ocaml.doc ""]

type nonrec schema_id = {
  registry_name : schema_registry_name_string option;
      [@ocaml.doc "The name of the schema registry that contains the schema.\n"]
  schema_name : schema_registry_name_string option;
      [@ocaml.doc
        "The name of the schema. One of [SchemaArn] or [SchemaName] has to be provided.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the schema. One of [SchemaArn] or [SchemaName] has to \
         be provided.\n"]
}
[@@ocaml.doc "The unique ID of the schema in the Glue schema registry.\n"]

type nonrec schema_version_id_string = string [@@ocaml.doc ""]

type nonrec schema_reference = {
  schema_version_number : version_long_number option;
      [@ocaml.doc "The version number of the schema.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc
        "The unique ID assigned to a version of the schema. Either this or the [SchemaId] has to \
         be provided.\n"]
  schema_id : schema_id option;
      [@ocaml.doc
        "A structure that contains schema identity fields. Either this or the [SchemaVersionId] \
         has to be provided.\n"]
}
[@@ocaml.doc "An object that references a schema stored in the Glue Schema Registry.\n"]

type nonrec storage_descriptor = {
  schema_reference : schema_reference option;
      [@ocaml.doc
        "An object that references a schema stored in the Glue Schema Registry.\n\n\
        \ When creating a table, you can pass an empty list of columns for the schema, and instead \
         use a schema reference.\n\
        \ "]
  stored_as_sub_directories : boolean_ option;
      [@ocaml.doc " [True] if the table data is stored in subdirectories, or [False] if not.\n"]
  skewed_info : skewed_info option;
      [@ocaml.doc
        "The information about values that appear frequently in a column (skewed values).\n"]
  parameters : parameters_map option;
      [@ocaml.doc "The user-supplied properties in key-value form.\n"]
  sort_columns : order_list option;
      [@ocaml.doc "A list specifying the sort order of each bucket in the table.\n"]
  bucket_columns : name_string_list option;
      [@ocaml.doc
        "A list of reducer grouping columns, clustering columns, and bucketing columns in the table.\n"]
  serde_info : ser_de_info option;
      [@ocaml.doc "The serialization/deserialization (SerDe) information.\n"]
  number_of_buckets : integer option;
      [@ocaml.doc "Must be specified if the table contains any dimension columns.\n"]
  compressed : boolean_ option;
      [@ocaml.doc " [True] if the data in the table is compressed, or [False] if not.\n"]
  output_format : format_string option;
      [@ocaml.doc
        "The output format: [SequenceFileOutputFormat] (binary), or [IgnoreKeyTextOutputFormat], \
         or a custom format.\n"]
  input_format : format_string option;
      [@ocaml.doc
        "The input format: [SequenceFileInputFormat] (binary), or [TextInputFormat], or a custom \
         format.\n"]
  additional_locations : location_string_list option;
      [@ocaml.doc "A list of locations that point to the path where a Delta table is located.\n"]
  location : location_string option;
      [@ocaml.doc
        "The physical location of the table. By default, this takes the form of the warehouse \
         location, followed by the database location in the warehouse, followed by the table name.\n"]
  columns : column_list option; [@ocaml.doc "A list of the [Columns] in the table.\n"]
}
[@@ocaml.doc "Describes the physical storage of table data.\n"]

type nonrec table_type_string = string [@@ocaml.doc ""]

type nonrec table_identifier = {
  region : name_string option; [@ocaml.doc "Region of the target table.\n"]
  name : name_string option; [@ocaml.doc "The name of the target table.\n"]
  database_name : name_string option;
      [@ocaml.doc "The name of the catalog database that contains the target table.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the table resides.\n"]
}
[@@ocaml.doc "A structure that describes a target table for resource linking.\n"]

type nonrec table_input = {
  view_definition : view_definition_input option;
      [@ocaml.doc
        "A structure that contains all the information that defines the view, including the \
         dialect or dialects for the view, and the query.\n"]
  target_table : table_identifier option;
      [@ocaml.doc
        "A [TableIdentifier] structure that describes a target table for resource linking.\n"]
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define properties associated with the table.\n"]
  table_type : table_type_string option;
      [@ocaml.doc
        "The type of this table. Glue will create tables with the [EXTERNAL_TABLE] type. Other \
         services, such as Athena, may create tables with additional table types. \n\n\
        \ Glue related table types:\n\
        \ \n\
        \   EXTERNAL_TABLE  Hive compatible attribute - indicates a non-Hive managed table.\n\
        \                   \n\
        \                     GOVERNED  Used by Lake Formation. The Glue Data Catalog understands \
         [GOVERNED].\n\
        \                               \n\
        \                                 "]
  view_expanded_text : view_text_string option;
      [@ocaml.doc
        "Included for Apache Hive compatibility. Not used in the normal course of Glue operations.\n"]
  view_original_text : view_text_string option;
      [@ocaml.doc
        "Included for Apache Hive compatibility. Not used in the normal course of Glue operations. \
         If the table is a [VIRTUAL_VIEW], certain Athena configuration encoded in base64.\n"]
  partition_keys : column_list option;
      [@ocaml.doc
        "A list of columns by which the table is partitioned. Only primitive types are supported \
         as partition keys.\n\n\
        \ When you create a table used by Amazon Athena, and you do not specify any \
         [partitionKeys], you must at least set the value of [partitionKeys] to an empty list. For \
         example:\n\
        \ \n\
        \   [\"PartitionKeys\": \\[\\]] \n\
        \  "]
  storage_descriptor : storage_descriptor option;
      [@ocaml.doc
        "A storage descriptor containing information about the physical storage of this table.\n"]
  retention : non_negative_integer option; [@ocaml.doc "The retention time for this table.\n"]
  last_analyzed_time : timestamp option;
      [@ocaml.doc "The last time that column statistics were computed for this table.\n"]
  last_access_time : timestamp option; [@ocaml.doc "The last time that the table was accessed.\n"]
  owner : name_string option;
      [@ocaml.doc
        "The table owner. Included for Apache Hive compatibility. Not used in the normal course of \
         Glue operations.\n"]
  description : description_string option; [@ocaml.doc "A description of the table.\n"]
  name : name_string;
      [@ocaml.doc
        "The table name. For Hive compatibility, this is folded to lowercase when it is stored.\n"]
}
[@@ocaml.doc "A structure used to define a table.\n"]

type nonrec boolean_nullable = bool [@@ocaml.doc ""]

type nonrec transaction_id_string = string [@@ocaml.doc ""]

type nonrec integer_list = integer list [@@ocaml.doc ""]

type nonrec iceberg_struct_type_enum = STRUCT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec column_name_string = string [@@ocaml.doc ""]

type nonrec iceberg_document = Smaws_Lib.CoreTypes.Document.t [@@ocaml.doc ""]

type nonrec iceberg_struct_field = {
  write_default : iceberg_document option;
      [@ocaml.doc
        "Default value used to populate the field's value for any records written after the field \
         was added to the schema, if the writer does not supply the field's value. This can be \
         changed through schema evolution.\n"]
  initial_default : iceberg_document option;
      [@ocaml.doc
        "Default value used to populate the field's value for all records that were written before \
         the field was added to the schema. This enables backward compatibility when adding new \
         fields to existing Iceberg tables.\n"]
  doc : comment_string option;
      [@ocaml.doc
        "Optional documentation or description text that provides additional context about the \
         purpose and usage of this field.\n"]
  required : boolean_;
      [@ocaml.doc
        "Indicates whether this field is required (non-nullable) or optional (nullable) in the \
         table schema.\n"]
  type_ : iceberg_document;
      [@ocaml.doc
        "The data type definition for this field, specifying the structure and format of the data \
         it contains.\n"]
  name : column_name_string;
      [@ocaml.doc "The name of the field as it appears in the table schema and query operations.\n"]
  id : integer;
      [@ocaml.doc
        "The unique identifier assigned to this field within the Iceberg table schema, used for \
         schema evolution and field tracking.\n"]
}
[@@ocaml.doc
  "Defines a single field within an Iceberg table schema, including its identifier, name, data \
   type, nullability, and documentation.\n"]

type nonrec iceberg_struct_field_list = iceberg_struct_field list [@@ocaml.doc ""]

type nonrec iceberg_schema = {
  fields : iceberg_struct_field_list;
      [@ocaml.doc
        "The list of field definitions that make up the table schema, including field names, \
         types, and metadata.\n"]
  type_ : iceberg_struct_type_enum option;
      [@ocaml.doc
        "The root type of the schema structure, typically \"struct\" for Iceberg table schemas.\n"]
  identifier_field_ids : integer_list option;
      [@ocaml.doc
        "The list of field identifiers that uniquely identify records in the table, used for \
         row-level operations and deduplication.\n"]
  schema_id : integer option;
      [@ocaml.doc
        "The unique identifier for this schema version within the Iceberg table's schema evolution \
         history.\n"]
}
[@@ocaml.doc
  "Defines the schema structure for an Iceberg table, including field definitions, data types, and \
   schema metadata.\n"]

type nonrec iceberg_transform_string = string [@@ocaml.doc ""]

type nonrec iceberg_partition_field = {
  field_id : integer option;
      [@ocaml.doc
        "The unique identifier assigned to this partition field within the Iceberg table's \
         partition specification.\n"]
  name : column_name_string;
      [@ocaml.doc
        "The name of the partition field as it will appear in the partitioned table structure.\n"]
  transform : iceberg_transform_string;
      [@ocaml.doc
        "The transformation function applied to the source field to create the partition, such as \
         identity, bucket, truncate, year, month, day, or hour.\n"]
  source_id : integer;
      [@ocaml.doc
        "The identifier of the source field from the table schema that this partition field is \
         based on.\n"]
}
[@@ocaml.doc
  "Defines a single partition field within an Iceberg partition specification, including the \
   source field, transformation function, partition name, and unique identifier.\n"]

type nonrec iceberg_partition_spec_field_list = iceberg_partition_field list [@@ocaml.doc ""]

type nonrec iceberg_partition_spec = {
  spec_id : integer option;
      [@ocaml.doc
        "The unique identifier for this partition specification within the Iceberg table's \
         metadata history.\n"]
  fields : iceberg_partition_spec_field_list;
      [@ocaml.doc
        "The list of partition fields that define how the table data should be partitioned, \
         including source fields and their transformations.\n"]
}
[@@ocaml.doc
  "Defines the partitioning specification for an Iceberg table, determining how table data will be \
   organized and partitioned for optimal query performance.\n"]

type nonrec iceberg_sort_direction = DESC [@ocaml.doc ""] | ASC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec iceberg_null_order = NULLS_LAST [@ocaml.doc ""] | NULLS_FIRST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iceberg_sort_field = {
  null_order : iceberg_null_order;
      [@ocaml.doc
        "The ordering behavior for null values in this field, specifying whether nulls should \
         appear first or last in the sort order.\n"]
  direction : iceberg_sort_direction;
      [@ocaml.doc "The sort direction for this field, either ascending or descending.\n"]
  transform : iceberg_transform_string;
      [@ocaml.doc
        "The transformation function applied to the source field before sorting, such as identity, \
         bucket, or truncate.\n"]
  source_id : integer;
      [@ocaml.doc
        "The identifier of the source field from the table schema that this sort field is based on.\n"]
}
[@@ocaml.doc
  "Defines a single field within an Iceberg sort order specification, including the source field, \
   transformation, sort direction, and null value ordering.\n"]

type nonrec iceberg_sort_order_field_list = iceberg_sort_field list [@@ocaml.doc ""]

type nonrec iceberg_sort_order = {
  fields : iceberg_sort_order_field_list;
      [@ocaml.doc
        "The list of fields and their sort directions that define the ordering criteria for the \
         Iceberg table data.\n"]
  order_id : integer;
      [@ocaml.doc
        "The unique identifier for this sort order specification within the Iceberg table's \
         metadata.\n"]
}
[@@ocaml.doc
  "Defines the sort order specification for an Iceberg table, determining how data should be \
   ordered within partitions to optimize query performance.\n"]

type nonrec nullable_string = string [@@ocaml.doc ""]

type nonrec string_to_string_map = (nullable_string * nullable_string) list [@@ocaml.doc ""]

type nonrec iceberg_update_action =
  | REMOVE_ENCRYPTION_KEY [@ocaml.doc ""]
  | ADD_ENCRYPTION_KEY [@ocaml.doc ""]
  | REMOVE_PROPERTIES [@ocaml.doc ""]
  | SET_PROPERTIES [@ocaml.doc ""]
  | SET_LOCATION [@ocaml.doc ""]
  | SET_DEFAULT_SORT_ORDER [@ocaml.doc ""]
  | ADD_SORT_ORDER [@ocaml.doc ""]
  | SET_DEFAULT_SPEC [@ocaml.doc ""]
  | ADD_SPEC [@ocaml.doc ""]
  | SET_CURRENT_SCHEMA [@ocaml.doc ""]
  | ADD_SCHEMA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_key_id_string = string [@@ocaml.doc ""]

type nonrec encrypted_key_metadata_string = string [@@ocaml.doc ""]

type nonrec iceberg_encrypted_key = {
  properties : string_to_string_map option;
      [@ocaml.doc
        "A string to string map of additional metadata used by the table's encryption scheme. \
         These properties provide additional context and configuration for the encryption key \
         implementation.\n"]
  encrypted_by_id : encryption_key_id_string option;
      [@ocaml.doc
        "Optional ID of the key used to encrypt or wrap the key metadata in Iceberg table \
         encryption. This field references another encryption key that was used to encrypt the \
         current key's metadata.\n"]
  encrypted_key_metadata : encrypted_key_metadata_string;
      [@ocaml.doc
        "Encrypted key and metadata, base64 encoded. The format of encrypted key metadata is \
         determined by the table's encryption scheme and can be a wrapped format specific to the \
         table's KMS provider.\n"]
  key_id : encryption_key_id_string;
      [@ocaml.doc
        "Unique identifier of the encryption key used for Iceberg table encryption. This ID is \
         used to reference the key in table metadata and track which key was used to encrypt \
         specific data.\n"]
}
[@@ocaml.doc
  "Encryption key structure used for Iceberg table encryption. Contains the key ID, encrypted key \
   metadata, optional reference to the encrypting key, and additional properties for the table's \
   encryption scheme.\n"]

type nonrec iceberg_table_update = {
  key_id : encryption_key_id_string option;
      [@ocaml.doc
        "Identifier of the encryption key involved in an Iceberg table update operation. \
         References the specific key being added to or removed from the table's encryption \
         configuration.\n"]
  encryption_key : iceberg_encrypted_key option;
      [@ocaml.doc
        "Encryption key information associated with an Iceberg table update operation. Used when \
         adding or removing encryption keys from the table metadata during table evolution.\n"]
  action : iceberg_update_action option;
      [@ocaml.doc
        "The type of update action to be performed on the Iceberg table. Defines the specific \
         operation such as adding schema, setting current schema, adding partition spec, or \
         managing encryption keys.\n"]
  properties : string_to_string_map option;
      [@ocaml.doc
        "Updated key-value pairs of table properties and configuration settings for the Iceberg \
         table.\n"]
  location : location_string;
      [@ocaml.doc "The updated S3 location where the Iceberg table data will be stored.\n"]
  sort_order : iceberg_sort_order option;
      [@ocaml.doc
        "The updated sort order specification that defines how data should be ordered within \
         partitions for optimal query performance.\n"]
  partition_spec : iceberg_partition_spec option;
      [@ocaml.doc
        "The updated partitioning specification that defines how the table data should be \
         reorganized and partitioned.\n"]
  schema : iceberg_schema;
      [@ocaml.doc
        "The updated schema definition for the Iceberg table, specifying any changes to field \
         structure, data types, or schema metadata.\n"]
}
[@@ocaml.doc
  "Defines a complete set of updates to be applied to an Iceberg table, including schema changes, \
   partitioning modifications, sort order adjustments, location updates, and property changes.\n"]

type nonrec iceberg_table_update_list = iceberg_table_update list [@@ocaml.doc ""]

type nonrec update_iceberg_table_input = {
  updates : iceberg_table_update_list;
      [@ocaml.doc
        "The list of table update operations that specify the changes to be made to the Iceberg \
         table, including schema modifications, partition specifications, and table properties.\n"]
}
[@@ocaml.doc
  "Contains the update operations to be applied to an existing Iceberg table inGlue Data Catalog, \
   defining the new state of the table metadata. \n"]

type nonrec update_iceberg_input = {
  update_iceberg_table_input : update_iceberg_table_input;
      [@ocaml.doc
        "The specific update operations to be applied to the Iceberg table, containing a list of \
         updates that define the new state of the table including schema, partitions, and \
         properties.\n"]
}
[@@ocaml.doc
  "Input parameters specific to updating Apache Iceberg tables in Glue Data Catalog, containing \
   the update operations to be applied to an existing Iceberg table.\n"]

type nonrec update_open_table_format_input = {
  update_iceberg_input : update_iceberg_input option;
      [@ocaml.doc
        "Apache Iceberg-specific update parameters that define the table modifications to be \
         applied, including schema changes, partition specifications, and table properties.\n"]
}
[@@ocaml.doc
  "Input parameters for updating open table format tables in GlueData Catalog, serving as a \
   wrapper for format-specific update operations such as Apache Iceberg.\n"]

type nonrec update_table_request = {
  update_open_table_format_input : update_open_table_format_input option;
      [@ocaml.doc
        "Input parameters for updating open table format tables in GlueData Catalog, serving as a \
         wrapper for format-specific update operations such as Apache Iceberg.\n"]
  force : boolean_ option;
      [@ocaml.doc
        "A flag that can be set to true to ignore matching storage descriptor and subobject \
         matching requirements.\n"]
  view_update_action : view_update_action option;
      [@ocaml.doc "The operation to be performed when updating the view.\n"]
  version_id : version_string option;
      [@ocaml.doc "The version ID at which to update the table contents. \n"]
  transaction_id : transaction_id_string option;
      [@ocaml.doc "The transaction ID at which to update the table contents. \n"]
  skip_archive : boolean_nullable option;
      [@ocaml.doc
        "By default, [UpdateTable] always creates an archived version of the table before updating \
         it. However, if [skipArchive] is set to true, [UpdateTable] does not create the archived \
         version.\n"]
  table_input : table_input option;
      [@ocaml.doc "An updated [TableInput] object to define the metadata table in the catalog.\n"]
  name : name_string option;
      [@ocaml.doc
        "The unique identifier for the table within the specified database that will be created in \
         the Glue Data Catalog.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The name of the catalog database in which the table resides. For Hive compatibility, this \
         name is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec update_table_optimizer_response = unit [@@ocaml.doc ""]

type nonrec table_optimizer_type =
  | ORPHAN_FILE_DELETION [@ocaml.doc ""]
  | RETENTION [@ocaml.doc ""]
  | COMPACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_optimizer_vpc_configuration =
  | GlueConnectionName of glue_connection_name_string
      [@ocaml.doc "The name of the Glue connection used for the VPC for the table optimizer.\n"]
[@@ocaml.doc
  "An object that describes the VPC configuration for a table optimizer.\n\n\
  \ This configuration is necessary to perform optimization on tables that are in a customer VPC.\n\
  \ "]

type nonrec compaction_strategy =
  | ZORDER [@ocaml.doc ""]
  | SORT [@ocaml.doc ""]
  | BINPACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iceberg_compaction_configuration = {
  delete_file_threshold : nullable_integer option;
      [@ocaml.doc
        "The minimum number of deletes that must be present in a data file to make it eligible for \
         compaction. This parameter helps optimize compaction by focusing on files that contain a \
         significant number of delete operations, which can improve query performance by removing \
         deleted records. If an input is not provided, the default value 1 will be used.\n"]
  min_input_files : nullable_integer option;
      [@ocaml.doc
        "The minimum number of data files that must be present in a partition before compaction \
         will actually compact files. This parameter helps control when compaction is triggered, \
         preventing unnecessary compaction operations on partitions with few files. If an input is \
         not provided, the default value 100 will be used.\n"]
  strategy : compaction_strategy option;
      [@ocaml.doc
        "The strategy to use for compaction. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [binpack]: Combines small files into larger files, typically targeting sizes \
         over 100MB, while applying any pending deletes. This is the recommended compaction \
         strategy for most use cases. \n\
        \           \n\
        \            }\n\
        \       {-   [sort]: Organizes data based on specified columns which are sorted \
         hierarchically during compaction, improving query performance for filtered operations. \
         This strategy is recommended when your queries frequently filter on specific columns. To \
         use this strategy, you must first define a sort order in your Iceberg table properties \
         using the [sort_order] table property.\n\
        \           \n\
        \            }\n\
        \       {-   [z-order]: Optimizes data organization by blending multiple attributes into a \
         single scalar value that can be used for sorting, allowing efficient querying across \
         multiple dimensions. This strategy is recommended when you need to query data across \
         multiple dimensions simultaneously. To use this strategy, you must first define a sort \
         order in your Iceberg table properties using the [sort_order] table property. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If an input is not provided, the default value 'binpack' will be used.\n\
        \   "]
}
[@@ocaml.doc
  "The configuration for an Iceberg compaction optimizer. This configuration defines parameters \
   for optimizing the layout of data files in Iceberg tables.\n"]

type nonrec compaction_configuration = {
  iceberg_configuration : iceberg_compaction_configuration option;
      [@ocaml.doc "The configuration for an Iceberg compaction optimizer.\n"]
}
[@@ocaml.doc
  "The configuration for a compaction optimizer. This configuration defines how data files in your \
   table will be compacted to improve query performance and reduce storage costs.\n"]

type nonrec iceberg_retention_configuration = {
  run_rate_in_hours : nullable_integer option;
      [@ocaml.doc
        "The interval in hours between retention job runs. This parameter controls how frequently \
         the retention optimizer will run to clean up expired snapshots. The value must be between \
         3 and 168 hours (7 days). If an input is not provided, the default value 24 will be used.\n"]
  clean_expired_files : nullable_boolean option;
      [@ocaml.doc
        "If set to false, snapshots are only deleted from table metadata, and the underlying data \
         and metadata files are not deleted.\n"]
  number_of_snapshots_to_retain : nullable_integer option;
      [@ocaml.doc
        "The number of Iceberg snapshots to retain within the retention period. If an input is not \
         provided, the corresponding Iceberg table configuration field will be used or if not \
         present, the default value 1 will be used.\n"]
  snapshot_retention_period_in_days : nullable_integer option;
      [@ocaml.doc
        "The number of days to retain the Iceberg snapshots. If an input is not provided, the \
         corresponding Iceberg table configuration field will be used or if not present, the \
         default value 5 will be used.\n"]
}
[@@ocaml.doc "The configuration for an Iceberg snapshot retention optimizer.\n"]

type nonrec retention_configuration = {
  iceberg_configuration : iceberg_retention_configuration option;
      [@ocaml.doc "The configuration for an Iceberg snapshot retention optimizer.\n"]
}
[@@ocaml.doc "The configuration for a snapshot retention optimizer.\n"]

type nonrec iceberg_orphan_file_deletion_configuration = {
  run_rate_in_hours : nullable_integer option;
      [@ocaml.doc
        "The interval in hours between orphan file deletion job runs. This parameter controls how \
         frequently the orphan file deletion optimizer will run to clean up orphan files. The \
         value must be between 3 and 168 hours (7 days). If an input is not provided, the default \
         value 24 will be used.\n"]
  location : message_string option;
      [@ocaml.doc
        "Specifies a directory in which to look for files (defaults to the table's location). You \
         may choose a sub-directory rather than the top-level table location.\n"]
  orphan_file_retention_period_in_days : nullable_integer option;
      [@ocaml.doc
        "The number of days that orphan files should be retained before file deletion. If an input \
         is not provided, the default value 3 will be used.\n"]
}
[@@ocaml.doc "The configuration for an Iceberg orphan file deletion optimizer.\n"]

type nonrec orphan_file_deletion_configuration = {
  iceberg_configuration : iceberg_orphan_file_deletion_configuration option;
      [@ocaml.doc "The configuration for an Iceberg orphan file deletion optimizer.\n"]
}
[@@ocaml.doc "The configuration for an orphan file deletion optimizer.\n"]

type nonrec table_optimizer_configuration = {
  orphan_file_deletion_configuration : orphan_file_deletion_configuration option;
      [@ocaml.doc "The configuration for an orphan file deletion optimizer.\n"]
  retention_configuration : retention_configuration option;
      [@ocaml.doc "The configuration for a snapshot retention optimizer.\n"]
  compaction_configuration : compaction_configuration option;
      [@ocaml.doc
        "The configuration for a compaction optimizer. This configuration defines how data files \
         in your table will be compacted to improve query performance and reduce storage costs.\n"]
  vpc_configuration : table_optimizer_vpc_configuration option;
      [@ocaml.doc
        "A [TableOptimizerVpcConfiguration] object representing the VPC configuration for a table \
         optimizer.\n\n\
        \ This configuration is necessary to perform optimization on tables that are in a customer \
         VPC.\n\
        \ "]
  enabled : nullable_boolean option; [@ocaml.doc "Whether table optimization is enabled.\n"]
  role_arn : arn_string option;
      [@ocaml.doc
        "A role passed by the caller which gives the service permission to update the resources \
         associated with the optimizer on the caller's behalf.\n"]
}
[@@ocaml.doc
  "Contains details on the configuration of a table optimizer. You pass this configuration when \
   creating or updating a table optimizer.\n"]

type nonrec update_table_optimizer_request = {
  table_optimizer_configuration : table_optimizer_configuration;
      [@ocaml.doc
        "A [TableOptimizerConfiguration] object representing the configuration of a table optimizer.\n"]
  type_ : table_optimizer_type; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The throttling threshhold was exceeded.\n"]

type nonrec access_denied_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "Access to a resource was denied.\n"]

type nonrec resource_number_limit_exceeded_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A resource numerical limit was exceeded.\n"]

type nonrec resource_not_ready_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A resource was not ready for a transaction.\n"]

type nonrec federation_source_retryable_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A federation source failed, but the operation may be retried.\n"]

type nonrec federation_source_error_code =
  | ThrottlingException [@ocaml.doc ""]
  | PartialFailureException [@ocaml.doc ""]
  | InternalServiceException [@ocaml.doc ""]
  | OperationNotSupportedException [@ocaml.doc ""]
  | OperationTimeoutException [@ocaml.doc ""]
  | InvalidResponseException [@ocaml.doc ""]
  | InvalidInputException [@ocaml.doc ""]
  | InvalidCredentialsException [@ocaml.doc ""]
  | EntityNotFoundException [@ocaml.doc ""]
  | AccessDeniedException [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec federation_source_exception = {
  message : message_string option; [@ocaml.doc "The message describing the problem.\n"]
  federation_source_error_code : federation_source_error_code option;
      [@ocaml.doc "The error code of the problem.\n"]
}
[@@ocaml.doc "A federation source failed.\n"]

type nonrec already_exists_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A resource to be created or added already exists.\n"]

type nonrec update_source_control_from_job_response = {
  job_name : name_string option; [@ocaml.doc "The name of the Glue job.\n"]
}
[@@ocaml.doc ""]

type nonrec source_control_provider =
  | AWS_CODE_COMMIT [@ocaml.doc ""]
  | BITBUCKET [@ocaml.doc ""]
  | GITLAB [@ocaml.doc ""]
  | GITHUB [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec commit_id_string = string [@@ocaml.doc ""]

type nonrec source_control_auth_strategy =
  | AWS_SECRETS_MANAGER [@ocaml.doc ""]
  | PERSONAL_ACCESS_TOKEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auth_token_string = string [@@ocaml.doc ""]

type nonrec update_source_control_from_job_request = {
  auth_token : auth_token_string option; [@ocaml.doc "The value of the authorization token.\n"]
  auth_strategy : source_control_auth_strategy option;
      [@ocaml.doc
        "The type of authentication, which can be an authentication token stored in Amazon Web \
         Services Secrets Manager, or a personal access token.\n"]
  commit_id : commit_id_string option;
      [@ocaml.doc "A commit ID for a commit in the remote repository.\n"]
  folder : name_string option; [@ocaml.doc "An optional folder in the remote repository.\n"]
  branch_name : name_string option; [@ocaml.doc "An optional branch in the remote repository.\n"]
  repository_owner : name_string option;
      [@ocaml.doc "The owner of the remote repository that contains the job artifacts.\n"]
  repository_name : name_string option;
      [@ocaml.doc
        "The name of the remote repository that contains the job artifacts. For BitBucket \
         providers, [RepositoryName] should include [WorkspaceName]. Use the format \n\
         {[\n\
         /\n\
         ]}\n\
         . \n"]
  provider : source_control_provider option;
      [@ocaml.doc
        " The provider for the remote repository. Possible values: GITHUB, AWS_CODE_COMMIT, \
         GITLAB, BITBUCKET. \n"]
  job_name : name_string option;
      [@ocaml.doc "The name of the Glue job to be synchronized to or from the remote repository.\n"]
}
[@@ocaml.doc ""]

type nonrec update_schema_response = {
  registry_name : schema_registry_name_string option;
      [@ocaml.doc "The name of the registry that contains the schema.\n"]
  schema_name : schema_registry_name_string option; [@ocaml.doc "The name of the schema.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec latest_schema_version_boolean = bool [@@ocaml.doc ""]

type nonrec schema_version_number = {
  version_number : version_long_number option; [@ocaml.doc "The version number of the schema.\n"]
  latest_version : latest_schema_version_boolean option;
      [@ocaml.doc "The latest version available for the schema.\n"]
}
[@@ocaml.doc "A structure containing the schema version information.\n"]

type nonrec compatibility =
  | FULL_ALL [@ocaml.doc ""]
  | FULL [@ocaml.doc ""]
  | FORWARD_ALL [@ocaml.doc ""]
  | FORWARD [@ocaml.doc ""]
  | BACKWARD_ALL [@ocaml.doc ""]
  | BACKWARD [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_schema_input = {
  description : description_string option; [@ocaml.doc "The new description for the schema.\n"]
  compatibility : compatibility option;
      [@ocaml.doc "The new compatibility setting for the schema.\n"]
  schema_version_number : schema_version_number option;
      [@ocaml.doc
        "Version number required for check pointing. One of [VersionNumber] or [Compatibility] has \
         to be provided.\n"]
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. One of \
         [SchemaArn] or [SchemaName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. One of [SchemaArn] or \
         [SchemaName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_registry_response = {
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource name (ARN) of the updated registry.\n"]
  registry_name : schema_registry_name_string option;
      [@ocaml.doc "The name of the updated registry.\n"]
}
[@@ocaml.doc ""]

type nonrec registry_id = {
  registry_arn : glue_resource_arn option;
      [@ocaml.doc
        "Arn of the registry to be updated. One of [RegistryArn] or [RegistryName] has to be \
         provided.\n"]
  registry_name : schema_registry_name_string option;
      [@ocaml.doc
        "Name of the registry. Used only for lookup. One of [RegistryArn] or [RegistryName] has to \
         be provided. \n"]
}
[@@ocaml.doc
  "A wrapper structure that may contain the registry name and Amazon Resource Name (ARN).\n"]

type nonrec update_registry_input = {
  description : description_string;
      [@ocaml.doc
        "A description of the registry. If description is not provided, this field will not be \
         updated.\n"]
  registry_id : registry_id;
      [@ocaml.doc
        "This is a wrapper structure that may contain the registry name and Amazon Resource Name \
         (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec update_partition_response = unit [@@ocaml.doc ""]

type nonrec bounded_partition_value_list = value_string list [@@ocaml.doc ""]

type nonrec partition_input = {
  last_analyzed_time : timestamp option;
      [@ocaml.doc "The last time at which column statistics were computed for this partition.\n"]
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define partition parameters.\n"]
  storage_descriptor : storage_descriptor option;
      [@ocaml.doc
        "Provides information about the physical location where the partition is stored.\n"]
  last_access_time : timestamp option;
      [@ocaml.doc "The last time at which the partition was accessed.\n"]
  values : value_string_list option;
      [@ocaml.doc
        "The values of the partition. Although this parameter is not required by the SDK, you must \
         specify this parameter for a valid input.\n\n\
        \ The values for the keys for the new partition must be passed as an array of String \
         objects that must be ordered in the same order as the partition keys appearing in the \
         Amazon S3 prefix. Otherwise Glue will add the values to the wrong keys.\n\
        \ "]
}
[@@ocaml.doc "The structure used to create and update a partition.\n"]

type nonrec update_partition_request = {
  partition_input : partition_input;
      [@ocaml.doc
        "The new partition object to update the partition to.\n\n\
        \ The [Values] property can't be changed. If you want to change the partition key values \
         for a partition, delete and recreate the partition.\n\
        \ "]
  partition_value_list : bounded_partition_value_list;
      [@ocaml.doc "List of partition key values that define the partition to update.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the table in which the partition to be updated is located.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database in which the table in question resides.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partition to be updated resides. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec update_ml_transform_response = {
  transform_id : hash_string option;
      [@ocaml.doc "The unique identifier for the transform that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec transform_type = FIND_MATCHES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec generic_bounded_double = float [@@ocaml.doc ""]

type nonrec find_matches_parameters = {
  enforce_provided_labels : nullable_boolean option;
      [@ocaml.doc
        "The value to switch on or off to force the output to match the provided labels from \
         users. If the value is [True], the [find matches] transform forces the output to match \
         the provided labels. The results override the normal conflation results. If the value is \
         [False], the [find matches] transform does not ensure all the labels provided are \
         respected, and the results rely on the trained model.\n\n\
        \ Note that setting this value to true may increase the conflation execution time.\n\
        \ "]
  accuracy_cost_tradeoff : generic_bounded_double option;
      [@ocaml.doc
        "The value that is selected when tuning your transform for a balance between accuracy and \
         cost. A value of 0.5 means that the system balances accuracy and cost concerns. A value \
         of 1.0 means a bias purely for accuracy, which typically results in a higher cost, \
         sometimes substantially higher. A value of 0.0 means a bias purely for cost, which \
         results in a less accurate [FindMatches] transform, sometimes with unacceptable \
         accuracy.\n\n\
        \ Accuracy measures how well the transform finds true positives and true negatives. \
         Increasing accuracy requires more machine resources and cost. But it also results in \
         increased recall. \n\
        \ \n\
        \  Cost measures how many compute resources, and thus money, are consumed to run the \
         transform.\n\
        \  "]
  precision_recall_tradeoff : generic_bounded_double option;
      [@ocaml.doc
        "The value selected when tuning your transform for a balance between precision and recall. \
         A value of 0.5 means no preference; a value of 1.0 means a bias purely for precision, and \
         a value of 0.0 means a bias for recall. Because this is a tradeoff, choosing values close \
         to 1.0 means very low recall, and choosing values close to 0.0 results in very low \
         precision.\n\n\
        \ The precision metric indicates how often your model is correct when it predicts a match. \n\
        \ \n\
        \  The recall metric indicates that for an actual match, how often your model predicts the \
         match.\n\
        \  "]
  primary_key_column_name : column_name_string option;
      [@ocaml.doc
        "The name of a column that uniquely identifies rows in the source table. Used to help \
         identify matching records.\n"]
}
[@@ocaml.doc "The parameters to configure the find matches transform.\n"]

type nonrec transform_parameters = {
  find_matches_parameters : find_matches_parameters option;
      [@ocaml.doc "The parameters for the find matches algorithm.\n"]
  transform_type : transform_type;
      [@ocaml.doc
        "The type of machine learning transform.\n\n\
        \ For information about the types of machine learning transforms, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/add-job-machine-learning-transform.html}Creating \
         Machine Learning Transforms}.\n\
        \ "]
}
[@@ocaml.doc
  "The algorithm-specific parameters that are associated with the machine learning transform.\n"]

type nonrec role_string = string [@@ocaml.doc ""]

type nonrec update_ml_transform_request = {
  max_retries : nullable_integer option;
      [@ocaml.doc
        "The maximum number of times to retry a task for this transform after a task run fails.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout for a task run for this transform in minutes. This is the maximum time that a \
         task run for this transform can consume resources before it is terminated and enters \
         [TIMEOUT] status. The default is 2,880 minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when this task runs.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when this task runs. Accepts a value of \
         Standard, G.1X, or G.2X.\n\n\
        \ {ul\n\
        \       {-  For the [Standard] worker type, each worker provides 4 vCPU, 16 GB of memory \
         and a 50GB disk, and 2 executors per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.1X] worker type, each worker provides 4 vCPU, 16 GB of memory and a \
         64GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker provides 8 vCPU, 32 GB of memory and a \
         128GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "The number of Glue data processing units (DPUs) that are allocated to task runs for this \
         transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative \
         measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of \
         memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue \
         pricing page}. \n\n\
        \ When the [WorkerType] field is set to a value other than [Standard], the [MaxCapacity] \
         field is set automatically and becomes read-only.\n\
        \ "]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "This value determines which version of Glue this machine learning transform is compatible \
         with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue \
         compatibility defaults to Glue 0.9. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions}Glue \
         Versions} in the developer guide.\n"]
  role : role_string option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role with the required permissions.\n"]
  parameters : transform_parameters option;
      [@ocaml.doc
        "The configuration parameters that are specific to the transform type (algorithm) used. \
         Conditionally dependent on the transform type.\n"]
  description : description_string option;
      [@ocaml.doc "A description of the transform. The default is an empty string.\n"]
  name : name_string option;
      [@ocaml.doc "The unique name that you gave the transform when you created it.\n"]
  transform_id : hash_string;
      [@ocaml.doc "A unique identifier that was generated when the transform was created.\n"]
}
[@@ocaml.doc ""]

type nonrec json_path = string [@@ocaml.doc ""]

type nonrec update_json_classifier_request = {
  json_path : json_path option;
      [@ocaml.doc
        "A [JsonPath] string defining the JSON data for the classifier to classify. Glue supports \
         a subset of JsonPath, as described in \
         {{:https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json}Writing \
         JsonPath Custom Classifiers}.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "Specifies a JSON classifier to be updated.\n"]

type nonrec update_job_response = {
  job_name : name_string option; [@ocaml.doc "Returns the name of the updated job definition.\n"]
}
[@@ocaml.doc ""]

type nonrec max_concurrent_runs = int [@@ocaml.doc ""]

type nonrec execution_property = {
  max_concurrent_runs : max_concurrent_runs option;
      [@ocaml.doc
        "The maximum number of concurrent runs allowed for the job. The default is 1. An error is \
         returned when this threshold is reached. The maximum value you can specify is controlled \
         by a service limit.\n"]
}
[@@ocaml.doc "An execution property of a job.\n"]

type nonrec script_location_string = string [@@ocaml.doc ""]

type nonrec python_version_string = string [@@ocaml.doc ""]

type nonrec runtime_name_string = string [@@ocaml.doc ""]

type nonrec job_command = {
  runtime : runtime_name_string option;
      [@ocaml.doc
        "In Ray jobs, Runtime is used to specify the versions of Ray, Python and additional \
         libraries available in your environment. This field is not used in other job types. For \
         supported runtime environment values, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/ray-jobs-section.html}Supported Ray runtime \
         environments} in the Glue Developer Guide.\n"]
  python_version : python_version_string option;
      [@ocaml.doc
        "The Python version being used to run a Python shell job. Allowed values are 2 or 3.\n"]
  script_location : script_location_string option;
      [@ocaml.doc
        "Specifies the Amazon Simple Storage Service (Amazon S3) path to a script that runs a job.\n"]
  name : generic_string option;
      [@ocaml.doc
        "The name of the job command. For an Apache Spark ETL job, this must be [glueetl]. For a \
         Python shell job, it must be [pythonshell]. For an Apache Spark streaming ETL job, this \
         must be [gluestreaming]. For a Ray job, this must be [glueray].\n"]
}
[@@ocaml.doc "Specifies code that runs when a job is run.\n"]

type nonrec connection_string = string [@@ocaml.doc ""]

type nonrec connection_string_list = connection_string list [@@ocaml.doc ""]

type nonrec connections_list = {
  connections : connection_string_list option;
      [@ocaml.doc "A list of connections used by the job.\n"]
}
[@@ocaml.doc "Specifies the connections used by a job.\n"]

type nonrec max_retries = int [@@ocaml.doc ""]

type nonrec node_name = string [@@ocaml.doc ""]

type nonrec enclosed_in_string_property_with_quote = string [@@ocaml.doc ""]

type nonrec glue_studio_column_name_string = string [@@ocaml.doc ""]

type nonrec glue_studio_schema_column = {
  glue_studio_type : column_type_string option;
      [@ocaml.doc "The data type of the column as defined in Glue Studio.\n"]
  type_ : column_type_string option;
      [@ocaml.doc "The hive type for this column in the Glue Studio schema.\n"]
  name : glue_studio_column_name_string;
      [@ocaml.doc "The name of the column in the Glue Studio schema.\n"]
}
[@@ocaml.doc "Specifies a single column in a Glue schema definition.\n"]

type nonrec glue_studio_schema_column_list = glue_studio_schema_column list [@@ocaml.doc ""]

type nonrec glue_schema = {
  columns : glue_studio_schema_column_list option;
      [@ocaml.doc "Specifies the column definitions that make up a Glue schema.\n"]
}
[@@ocaml.doc "Specifies a user-defined schema when a schema cannot be determined by Glue.\n"]

type nonrec glue_schemas = glue_schema list [@@ocaml.doc ""]

type nonrec athena_connector_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the custom Athena source.\n"]
  schema_name : enclosed_in_string_property;
      [@ocaml.doc
        "The name of the Cloudwatch log group to read from. For example, [/aws-glue/jobs/output].\n"]
  connection_table : enclosed_in_string_property_with_quote option;
      [@ocaml.doc "The name of the table in the data source.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The type of connection, such as marketplace.athena or custom.athena, designating a \
         connection to an Amazon Athena data store.\n"]
  connector_name : enclosed_in_string_property;
      [@ocaml.doc
        "The name of a connector that assists with accessing the data store in Glue Studio.\n"]
  connection_name : enclosed_in_string_property;
      [@ocaml.doc "The name of the connection that is associated with the connector.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a connector to an Amazon Athena data source.\n"]

type nonrec boxed_non_negative_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec enclosed_in_string_properties = enclosed_in_string_property list [@@ocaml.doc ""]

type nonrec glue_record_type =
  | DOUBLE [@ocaml.doc ""]
  | SHORT [@ocaml.doc ""]
  | BYTE [@ocaml.doc ""]
  | BIGDECIMAL [@ocaml.doc ""]
  | LONG [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | INT [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec jdbc_data_type =
  | VARCHAR [@ocaml.doc ""]
  | VARBINARY [@ocaml.doc ""]
  | TINYINT [@ocaml.doc ""]
  | TIMESTAMP_WITH_TIMEZONE [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
  | TIME_WITH_TIMEZONE [@ocaml.doc ""]
  | TIME [@ocaml.doc ""]
  | STRUCT [@ocaml.doc ""]
  | SQLXML [@ocaml.doc ""]
  | SMALLINT [@ocaml.doc ""]
  | ROWID [@ocaml.doc ""]
  | REF_CURSOR [@ocaml.doc ""]
  | REF [@ocaml.doc ""]
  | REAL [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | NVARCHAR [@ocaml.doc ""]
  | NUMERIC [@ocaml.doc ""]
  | NULL [@ocaml.doc ""]
  | NCLOB [@ocaml.doc ""]
  | NCHAR [@ocaml.doc ""]
  | LONGVARCHAR [@ocaml.doc ""]
  | LONGVARBINARY [@ocaml.doc ""]
  | LONGNVARCHAR [@ocaml.doc ""]
  | JAVA_OBJECT [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | DISTINCT [@ocaml.doc ""]
  | DECIMAL [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | DATALINK [@ocaml.doc ""]
  | CLOB [@ocaml.doc ""]
  | CHAR [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | BLOB [@ocaml.doc ""]
  | BIT [@ocaml.doc ""]
  | BINARY [@ocaml.doc ""]
  | BIGINT [@ocaml.doc ""]
  | ARRAY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec jdbc_data_type_mapping = (jdbc_data_type * glue_record_type) list [@@ocaml.doc ""]

type nonrec jdbc_connector_options = {
  data_type_mapping : jdbc_data_type_mapping option;
      [@ocaml.doc
        "Custom data type mapping that builds a mapping from a JDBC data type to an Glue data \
         type. For example, the option [\"dataTypeMapping\":{\"FLOAT\":\"STRING\"}] maps data \
         fields of JDBC type [FLOAT] into the Java [String] type by calling the \
         [ResultSet.getString()] method of the driver, and uses it to build the Glue record. The \
         [ResultSet] object is implemented by each driver, so the behavior is specific to the \
         driver you use. Refer to the documentation for your JDBC driver to understand how the \
         driver performs the conversions.\n"]
  job_bookmark_keys_sort_order : enclosed_in_string_property option;
      [@ocaml.doc "Specifies an ascending or descending sort order.\n"]
  job_bookmark_keys : enclosed_in_string_properties option;
      [@ocaml.doc "The name of the job bookmark keys on which to sort.\n"]
  num_partitions : boxed_non_negative_long option;
      [@ocaml.doc
        "The number of partitions. This value, along with [lowerBound] (inclusive) and \
         [upperBound] (exclusive), form partition strides for generated [WHERE] clause expressions \
         that are used to split the [partitionColumn].\n"]
  upper_bound : boxed_non_negative_long option;
      [@ocaml.doc
        "The maximum value of [partitionColumn] that is used to decide partition stride.\n"]
  lower_bound : boxed_non_negative_long option;
      [@ocaml.doc
        "The minimum value of [partitionColumn] that is used to decide partition stride.\n"]
  partition_column : enclosed_in_string_property option;
      [@ocaml.doc
        "The name of an integer column that is used for partitioning. This option works only when \
         it's included with [lowerBound], [upperBound], and [numPartitions]. This option works the \
         same way as in the Spark SQL JDBC reader.\n"]
  filter_predicate : enclosed_in_string_property option;
      [@ocaml.doc
        "Extra condition clause to filter data from source. For example:\n\n\
        \  [BillingCity='Mountain View'] \n\
        \ \n\
        \  When using a query instead of a table name, you should validate that the query works \
         with the specified [filterPredicate].\n\
        \  "]
}
[@@ocaml.doc "Additional connection options for the connector.\n"]

type nonrec sql_query = string [@@ocaml.doc ""]

type nonrec jdbc_connector_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the custom JDBC source.\n"]
  query : sql_query option;
      [@ocaml.doc
        "The table or SQL query to get the data from. You can specify either [ConnectionTable] or \
         [query], but not both.\n"]
  connection_table : enclosed_in_string_property_with_quote option;
      [@ocaml.doc "The name of the table in the data source.\n"]
  additional_options : jdbc_connector_options option;
      [@ocaml.doc "Additional connection options for the connector.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The type of connection, such as marketplace.jdbc or custom.jdbc, designating a connection \
         to a JDBC data store.\n"]
  connector_name : enclosed_in_string_property;
      [@ocaml.doc
        "The name of a connector that assists with accessing the data store in Glue Studio.\n"]
  connection_name : enclosed_in_string_property;
      [@ocaml.doc "The name of the connection that is associated with the connector.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a connector to a JDBC data source.\n"]

type nonrec additional_options = (enclosed_in_string_property * enclosed_in_string_property) list
[@@ocaml.doc ""]

type nonrec spark_connector_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies data schema for the custom spark source.\n"]
  additional_options : additional_options option;
      [@ocaml.doc "Additional connection options for the connector.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The type of connection, such as marketplace.spark or custom.spark, designating a \
         connection to an Apache Spark data store.\n"]
  connector_name : enclosed_in_string_property;
      [@ocaml.doc
        "The name of a connector that assists with accessing the data store in Glue Studio.\n"]
  connection_name : enclosed_in_string_property;
      [@ocaml.doc "The name of the connection that is associated with the connector.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a connector to an Apache Spark data source.\n"]

type nonrec catalog_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the catalog source.\n"]
  partition_predicate : enclosed_in_string_property option;
      [@ocaml.doc
        " Partitions satisfying this predicate are deleted. Files within the retention period in \
         these partitions are not deleted. \n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies a data store in the Glue Data Catalog.\n"]

type nonrec redshift_source = {
  tmp_dir_iam_role : enclosed_in_string_property option;
      [@ocaml.doc "The IAM role with permissions.\n"]
  redshift_tmp_dir : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon S3 path where temporary data can be staged when copying out of the database.\n"]
  table : enclosed_in_string_property; [@ocaml.doc "The database table to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Amazon Redshift data store.\n"]
}
[@@ocaml.doc "Specifies an Amazon Redshift data store.\n"]

type nonrec boxed_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec s3_source_additional_options = {
  bounded_files : boxed_long option;
      [@ocaml.doc "Sets the upper limit for the target number of files that will be processed.\n"]
  bounded_size : boxed_long option;
      [@ocaml.doc
        "Sets the upper limit for the target size of the dataset in bytes that will be processed.\n"]
}
[@@ocaml.doc "Specifies additional connection options for the Amazon S3 data store.\n"]

type nonrec s3_catalog_source = {
  additional_options : s3_source_additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  partition_predicate : enclosed_in_string_property option;
      [@ocaml.doc
        "Partitions satisfying this predicate are deleted. Files within the retention period in \
         these partitions are not deleted. Set to [\"\"] \226\128\147 empty by default.\n"]
  table : enclosed_in_string_property; [@ocaml.doc "The database table to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies an Amazon S3 data store in the Glue Data Catalog.\n"]

type nonrec compression_type = BZIP2 [@ocaml.doc ""] | GZIP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec boxed_boolean = bool [@@ocaml.doc ""]

type nonrec boxed_non_negative_int = int [@@ocaml.doc ""]

type nonrec s3_direct_source_additional_options = {
  sample_path : enclosed_in_string_property option;
      [@ocaml.doc "If enabled, specifies the sample path.\n"]
  enable_sample_path : boxed_boolean option; [@ocaml.doc "Sets option to enable a sample path.\n"]
  bounded_files : boxed_long option;
      [@ocaml.doc "Sets the upper limit for the target number of files that will be processed.\n"]
  bounded_size : boxed_long option;
      [@ocaml.doc
        "Sets the upper limit for the target size of the dataset in bytes that will be processed.\n"]
}
[@@ocaml.doc "Specifies additional connection options for the Amazon S3 data store.\n"]

type nonrec separator =
  | TAB [@ocaml.doc ""]
  | SEMICOLON [@ocaml.doc ""]
  | PIPE [@ocaml.doc ""]
  | CTRLA [@ocaml.doc ""]
  | COMMA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec quote_char =
  | DISABLED [@ocaml.doc ""]
  | SINGLE_QUOTE [@ocaml.doc ""]
  | QUILLEMET [@ocaml.doc ""]
  | QUOTE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boolean_value = bool [@@ocaml.doc ""]

type nonrec s3_csv_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 CSV source.\n"]
  optimize_performance : boolean_value option;
      [@ocaml.doc
        "A Boolean value that specifies whether to use the advanced SIMD CSV reader along with \
         Apache Arrow based columnar memory formats. Only available in Glue version 3.0.\n"]
  skip_first : boxed_boolean option;
      [@ocaml.doc
        "A Boolean value that specifies whether to skip the first data line. The default value is \
         [False].\n"]
  write_header : boxed_boolean option;
      [@ocaml.doc
        "A Boolean value that specifies whether to write the header to output. The default value \
         is [True]. \n"]
  with_header : boxed_boolean option;
      [@ocaml.doc
        "A Boolean value that specifies whether to treat the first line as a header. The default \
         value is [False].\n"]
  multiline : boxed_boolean option;
      [@ocaml.doc
        "A Boolean value that specifies whether a single record can span multiple lines. This can \
         occur when a field contains a quoted new-line character. You must set this option to True \
         if any record spans multiple lines. The default value is [False], which allows for more \
         aggressive file-splitting during parsing.\n"]
  quote_char : quote_char;
      [@ocaml.doc
        "Specifies the character to use for quoting. The default is a double quote: ['\"']. Set \
         this to [-1] to turn off quoting entirely.\n"]
  escaper : enclosed_in_string_property_with_quote option;
      [@ocaml.doc
        "Specifies a character to use for escaping. This option is used only when reading CSV \
         files. The default value is [none]. If enabled, the character which immediately follows \
         is used as-is, except for a small set of well-known escapes ([\\n], [\\r], [\\t], and \
         [\\0]).\n"]
  separator : separator;
      [@ocaml.doc
        "Specifies the delimiter character. The default is a comma: \",\", but any other character \
         can be specified.\n"]
  additional_options : s3_direct_source_additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  max_files_in_band : boxed_non_negative_int option;
      [@ocaml.doc
        "This option specifies the maximum number of files to save from the last maxBand seconds. \
         If this number is exceeded, extra files are skipped and only processed in the next job \
         run.\n"]
  max_band : boxed_non_negative_int option;
      [@ocaml.doc
        "This option controls the duration in milliseconds after which the s3 listing is likely to \
         be consistent. Files with modification timestamps falling within the last maxBand \
         milliseconds are tracked specially when using JobBookmarks to account for Amazon S3 \
         eventual consistency. Most users don't need to set this option. The default is 900000 \
         milliseconds, or 15 minutes.\n"]
  recurse : boxed_boolean option;
      [@ocaml.doc
        "If set to true, recursively reads files in all subdirectories under the specified paths.\n"]
  group_files : enclosed_in_string_property option;
      [@ocaml.doc
        "Grouping files is turned on by default when the input contains more than 50,000 files. To \
         turn on grouping with fewer than 50,000 files, set this parameter to \"inPartition\". To \
         disable grouping when there are more than 50,000 files, set this parameter to [\"none\"].\n"]
  group_size : enclosed_in_string_property option;
      [@ocaml.doc
        "The target group size in bytes. The default is computed based on the input data size and \
         the size of your cluster. When there are fewer than 50,000 input files, [\"groupFiles\"] \
         must be set to [\"inPartition\"] for this to take effect.\n"]
  exclusions : enclosed_in_string_properties option;
      [@ocaml.doc
        "A string containing a JSON list of Unix-style glob patterns to exclude. For example, \
         \"\\[\\\"**.pdf\\\"\\]\" excludes all PDF files. \n"]
  compression_type : compression_type option;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  paths : enclosed_in_string_properties;
      [@ocaml.doc "A list of the Amazon S3 paths to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies a command-separated value (CSV) data store stored in Amazon S3.\n"]

type nonrec s3_json_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 JSON source.\n"]
  multiline : boxed_boolean option;
      [@ocaml.doc
        "A Boolean value that specifies whether a single record can span multiple lines. This can \
         occur when a field contains a quoted new-line character. You must set this option to True \
         if any record spans multiple lines. The default value is [False], which allows for more \
         aggressive file-splitting during parsing.\n"]
  json_path : enclosed_in_string_property option;
      [@ocaml.doc "A JsonPath string defining the JSON data.\n"]
  additional_options : s3_direct_source_additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  max_files_in_band : boxed_non_negative_int option;
      [@ocaml.doc
        "This option specifies the maximum number of files to save from the last maxBand seconds. \
         If this number is exceeded, extra files are skipped and only processed in the next job \
         run.\n"]
  max_band : boxed_non_negative_int option;
      [@ocaml.doc
        "This option controls the duration in milliseconds after which the s3 listing is likely to \
         be consistent. Files with modification timestamps falling within the last maxBand \
         milliseconds are tracked specially when using JobBookmarks to account for Amazon S3 \
         eventual consistency. Most users don't need to set this option. The default is 900000 \
         milliseconds, or 15 minutes.\n"]
  recurse : boxed_boolean option;
      [@ocaml.doc
        "If set to true, recursively reads files in all subdirectories under the specified paths.\n"]
  group_files : enclosed_in_string_property option;
      [@ocaml.doc
        "Grouping files is turned on by default when the input contains more than 50,000 files. To \
         turn on grouping with fewer than 50,000 files, set this parameter to \"inPartition\". To \
         disable grouping when there are more than 50,000 files, set this parameter to [\"none\"].\n"]
  group_size : enclosed_in_string_property option;
      [@ocaml.doc
        "The target group size in bytes. The default is computed based on the input data size and \
         the size of your cluster. When there are fewer than 50,000 input files, [\"groupFiles\"] \
         must be set to [\"inPartition\"] for this to take effect.\n"]
  exclusions : enclosed_in_string_properties option;
      [@ocaml.doc
        "A string containing a JSON list of Unix-style glob patterns to exclude. For example, \
         \"\\[\\\"**.pdf\\\"\\]\" excludes all PDF files. \n"]
  compression_type : compression_type option;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  paths : enclosed_in_string_properties;
      [@ocaml.doc "A list of the Amazon S3 paths to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies a JSON data store stored in Amazon S3.\n"]

type nonrec parquet_compression_type =
  | NONE [@ocaml.doc ""]
  | UNCOMPRESSED [@ocaml.doc ""]
  | LZ4 [@ocaml.doc ""]
  | BROTLI [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""]
  | LZO [@ocaml.doc ""]
  | SNAPPY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_parquet_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 Parquet source.\n"]
  additional_options : s3_direct_source_additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  max_files_in_band : boxed_non_negative_int option;
      [@ocaml.doc
        "This option specifies the maximum number of files to save from the last maxBand seconds. \
         If this number is exceeded, extra files are skipped and only processed in the next job \
         run.\n"]
  max_band : boxed_non_negative_int option;
      [@ocaml.doc
        "This option controls the duration in milliseconds after which the s3 listing is likely to \
         be consistent. Files with modification timestamps falling within the last maxBand \
         milliseconds are tracked specially when using JobBookmarks to account for Amazon S3 \
         eventual consistency. Most users don't need to set this option. The default is 900000 \
         milliseconds, or 15 minutes.\n"]
  recurse : boxed_boolean option;
      [@ocaml.doc
        "If set to true, recursively reads files in all subdirectories under the specified paths.\n"]
  group_files : enclosed_in_string_property option;
      [@ocaml.doc
        "Grouping files is turned on by default when the input contains more than 50,000 files. To \
         turn on grouping with fewer than 50,000 files, set this parameter to \"inPartition\". To \
         disable grouping when there are more than 50,000 files, set this parameter to [\"none\"].\n"]
  group_size : enclosed_in_string_property option;
      [@ocaml.doc
        "The target group size in bytes. The default is computed based on the input data size and \
         the size of your cluster. When there are fewer than 50,000 input files, [\"groupFiles\"] \
         must be set to [\"inPartition\"] for this to take effect.\n"]
  exclusions : enclosed_in_string_properties option;
      [@ocaml.doc
        "A string containing a JSON list of Unix-style glob patterns to exclude. For example, \
         \"\\[\\\"**.pdf\\\"\\]\" excludes all PDF files. \n"]
  compression_type : parquet_compression_type option;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  paths : enclosed_in_string_properties;
      [@ocaml.doc "A list of the Amazon S3 paths to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies an Apache Parquet data store stored in Amazon S3.\n"]

type nonrec relational_catalog_source = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a Relational database data source in the Glue Data Catalog.\n"]

type nonrec ddbelt_catalog_additional_options = {
  dynamodb_unnest_ddb_json : boolean_value option;
      [@ocaml.doc
        "Specifies whether to unnest DynamoDB JSON format. When set to [true], nested JSON \
         structures in DynamoDB items are flattened.\n"]
  dynamodb_export : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the DynamoDB export configuration for the ELT operation.\n"]
}
[@@ocaml.doc "Specifies additional options for DynamoDB ELT catalog operations.\n"]

type nonrec dynamo_db_catalog_source = {
  additional_options : ddbelt_catalog_additional_options option;
      [@ocaml.doc "Specifies additional connection options for the DynamoDB data source.\n"]
  pitr_enabled : boxed_boolean option;
      [@ocaml.doc
        "Specifies whether Point-in-Time Recovery (PITR) is enabled for the DynamoDB table. When \
         set to [true], allows reading from a specific point in time. The default value is [false].\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a DynamoDB data source in the Glue Data Catalog.\n"]

type nonrec node_id = string [@@ocaml.doc ""]

type nonrec one_input = node_id list [@@ocaml.doc ""]

type nonrec jdbc_connector_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the JDBC target.\n"]
  additional_options : additional_options option;
      [@ocaml.doc "Additional connection options for the connector.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The type of connection, such as marketplace.jdbc or custom.jdbc, designating a connection \
         to a JDBC data target.\n"]
  connector_name : enclosed_in_string_property;
      [@ocaml.doc "The name of a connector that will be used.\n"]
  connection_table : enclosed_in_string_property_with_quote;
      [@ocaml.doc "The name of the table in the data target.\n"]
  connection_name : enclosed_in_string_property;
      [@ocaml.doc "The name of the connection that is associated with the connector.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc
  "Specifies a data target that writes to Amazon S3 in Apache Parquet columnar storage.\n"]

type nonrec spark_connector_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the custom spark target.\n"]
  additional_options : additional_options option;
      [@ocaml.doc "Additional connection options for the connector.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The type of connection, such as marketplace.spark or custom.spark, designating a \
         connection to an Apache Spark data store.\n"]
  connector_name : enclosed_in_string_property;
      [@ocaml.doc "The name of an Apache Spark connector.\n"]
  connection_name : enclosed_in_string_property;
      [@ocaml.doc "The name of a connection for an Apache Spark connector.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses an Apache Spark connector.\n"]

type nonrec glue_studio_path_list = enclosed_in_string_properties list [@@ocaml.doc ""]

type nonrec basic_catalog_target = {
  table : enclosed_in_string_property;
      [@ocaml.doc
        "The table that defines the schema of your output data. This table must already exist in \
         the Data Catalog.\n"]
  database : enclosed_in_string_property;
      [@ocaml.doc
        "The database that contains the table you want to use as the target. This database must \
         already exist in the Data Catalog.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc
        "The partition keys used to distribute data across multiple partitions or shards based on \
         a specific key or set of key.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of your data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses a Glue Data Catalog table.\n"]

type nonrec redshift_target = {
  upsert_redshift_options : upsert_redshift_target_options option;
      [@ocaml.doc
        "The set of options to configure an upsert operation when writing to a Redshift target.\n"]
  tmp_dir_iam_role : enclosed_in_string_property option;
      [@ocaml.doc "The IAM role with permissions.\n"]
  redshift_tmp_dir : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon S3 path where temporary data can be staged when copying out of the database.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses Amazon Redshift.\n"]

type nonrec update_catalog_behavior = LOG [@ocaml.doc ""] | UPDATE_IN_DATABASE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec catalog_schema_change_policy = {
  update_behavior : update_catalog_behavior option;
      [@ocaml.doc "The update behavior when the crawler finds a changed schema.\n"]
  enable_update_catalog : boxed_boolean option;
      [@ocaml.doc
        "Whether to use the specified update behavior when the crawler finds a changed schema.\n"]
}
[@@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]

type nonrec auto_data_quality = {
  evaluation_context : enclosed_in_string_property option;
      [@ocaml.doc
        "The evaluation context for the automatic data quality checks. This defines the scope and \
         parameters for the data quality evaluation.\n"]
  is_enabled : boolean_value option;
      [@ocaml.doc
        "Specifies whether automatic data quality evaluation is enabled. When set to [true], data \
         quality checks are performed automatically.\n"]
}
[@@ocaml.doc
  "Specifies configuration options for automatic data quality evaluation in Glue jobs. This \
   structure enables automated data quality checks and monitoring during ETL operations, helping \
   to ensure data integrity and reliability without manual intervention.\n"]

type nonrec s3_catalog_target = {
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 catalog \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : catalog_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a data target that writes to Amazon S3 using the Glue Data Catalog.\n"]

type nonrec number_target_partitions_string = string [@@ocaml.doc ""]

type nonrec direct_schema_change_policy = {
  database : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the database that the schema change policy applies to.\n"]
  table : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the table in the database that the schema change policy applies to.\n"]
  update_behavior : update_catalog_behavior option;
      [@ocaml.doc "The update behavior when the crawler finds a changed schema.\n"]
  enable_update_catalog : boxed_boolean option;
      [@ocaml.doc
        "Whether to use the specified update behavior when the crawler finds a changed schema.\n"]
}
[@@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]

type nonrec s3_glue_parquet_target = {
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Glue Parquet \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : direct_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  number_target_partitions : number_target_partitions_string option;
      [@ocaml.doc
        "Specifies the number of target partitions for Parquet files when writing to Amazon S3 \
         using Glue.\n"]
  compression : parquet_compression_type option;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  path : enclosed_in_string_property; [@ocaml.doc "A single Amazon S3 path to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc
  "Specifies a data target that writes to Amazon S3 in Apache Parquet columnar storage.\n"]

type nonrec target_format =
  | XML [@ocaml.doc ""]
  | HYPER [@ocaml.doc ""]
  | ICEBERG [@ocaml.doc ""]
  | DELTA [@ocaml.doc ""]
  | HUDI [@ocaml.doc ""]
  | PARQUET [@ocaml.doc ""]
  | ORC [@ocaml.doc ""]
  | AVRO [@ocaml.doc ""]
  | CSV [@ocaml.doc ""]
  | JSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_direct_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 direct target.\n"]
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 direct \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : direct_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  format : target_format; [@ocaml.doc "Specifies the data output format for the target.\n"]
  number_target_partitions : number_target_partitions_string option;
      [@ocaml.doc
        "Specifies the number of target partitions when writing data directly to Amazon S3.\n"]
  compression : enclosed_in_string_property option;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  path : enclosed_in_string_property; [@ocaml.doc "A single Amazon S3 path to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a data target that writes to Amazon S3.\n"]

type mapping = {
  children : mappings option;
      [@ocaml.doc
        "Only applicable to nested data structures. If you want to change the parent structure, \
         but also one of its children, you can fill out this data strucutre. It is also [Mapping], \
         but its [FromPath] will be the parent's [FromPath] plus the [FromPath] from this \
         structure.\n\n\
        \ For the children part, suppose you have the structure:\n\
        \ \n\
        \   [{\n\
        \  \"FromPath\": \"OuterStructure\",\n\
        \  \"ToKey\": \"OuterStructure\",\n\
        \  \"ToType\": \"Struct\",\n\
        \  \"Dropped\": false,\n\
        \  \"Chidlren\": \\[{\n\
        \       \"FromPath\": \"inner\",\n\
        \       \"ToKey\": \"inner\",\n\
        \       \"ToType\": \"Double\",\n\
        \      \"Dropped\": false,\n\
        \  }\\]\n\
         }] \n\
        \  \n\
        \   You can specify a [Mapping] that looks like:\n\
        \   \n\
        \     [{\n\
        \  \"FromPath\": \"OuterStructure\",\n\
        \  \"ToKey\": \"OuterStructure\",\n\
        \  \"ToType\": \"Struct\",\n\
        \  \"Dropped\": false,\n\
        \  \"Chidlren\": \\[{\n\
        \       \"FromPath\": \"inner\",\n\
        \       \"ToKey\": \"inner\",\n\
        \       \"ToType\": \"Double\",\n\
        \      \"Dropped\": false,\n\
        \  }\\]\n\
         }] \n\
        \    "]
  dropped : boxed_boolean option; [@ocaml.doc "If true, then the column is removed.\n"]
  to_type : enclosed_in_string_property option;
      [@ocaml.doc "The data type that the data is to be modified to.\n"]
  from_type : enclosed_in_string_property option;
      [@ocaml.doc "The type of the data to be modified.\n"]
  from_path : enclosed_in_string_properties option;
      [@ocaml.doc "The table or column to be modified.\n"]
  to_key : enclosed_in_string_property option;
      [@ocaml.doc
        "After the apply mapping, what the name of the column should be. Can be the same as \
         [FromPath].\n"]
}
[@@ocaml.doc "Specifies the mapping of data property keys.\n"]

and mappings = mapping list [@@ocaml.doc ""]

type nonrec apply_mapping = {
  mapping : mappings;
      [@ocaml.doc
        "Specifies the mapping of data property keys in the data source to data property keys in \
         the data target.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that maps data property keys in the data source to data property keys in \
   the data target. You can rename keys, modify the data types for keys, and choose which keys to \
   drop from the dataset.\n"]

type nonrec select_fields = {
  paths : glue_studio_path_list; [@ocaml.doc "A JSON path to a variable in the data structure.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that chooses the data property keys that you want to keep.\n"]

type nonrec drop_fields = {
  paths : glue_studio_path_list; [@ocaml.doc "A JSON path to a variable in the data structure.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that chooses the data property keys that you want to drop.\n"]

type nonrec rename_field = {
  target_path : enclosed_in_string_properties;
      [@ocaml.doc "A JSON path to a variable in the data structure for the target data.\n"]
  source_path : enclosed_in_string_properties;
      [@ocaml.doc "A JSON path to a variable in the data structure for the source data.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that renames a single data property key.\n"]

type nonrec topk = int [@@ocaml.doc ""]

type nonrec prob = float [@@ocaml.doc ""]

type nonrec spigot = {
  prob : prob option;
      [@ocaml.doc
        "The probability (a decimal value with a maximum value of 1) of picking any given record. \
         A value of 1 indicates that each row read from the dataset should be included in the \
         sample output.\n"]
  topk : topk option;
      [@ocaml.doc
        "Specifies a number of records to write starting from the beginning of the dataset.\n"]
  path : enclosed_in_string_property;
      [@ocaml.doc
        "A path in Amazon S3 where the transform will write a subset of records from the dataset \
         to a JSON file in an Amazon S3 bucket.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that writes samples of the data to an Amazon S3 bucket.\n"]

type nonrec two_inputs = node_id list [@@ocaml.doc ""]

type nonrec join_type =
  | LEFT_ANTI [@ocaml.doc ""]
  | LEFT_SEMI [@ocaml.doc ""]
  | OUTER [@ocaml.doc ""]
  | RIGHT [@ocaml.doc ""]
  | LEFT [@ocaml.doc ""]
  | EQUIJOIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec join_column = {
  keys : glue_studio_path_list; [@ocaml.doc "The key of the column to be joined.\n"]
  from_ : enclosed_in_string_property; [@ocaml.doc "The column to be joined.\n"]
}
[@@ocaml.doc "Specifies a column to be joined.\n"]

type nonrec join_columns = join_column list [@@ocaml.doc ""]

type nonrec join = {
  columns : join_columns; [@ocaml.doc "A list of the two columns to be joined.\n"]
  join_type : join_type;
      [@ocaml.doc "Specifies the type of join to be performed on the datasets.\n"]
  inputs : two_inputs; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that joins two datasets into one dataset using a comparison phrase on the \
   specified data property keys. You can use inner, outer, left, right, left semi, and left anti \
   joins.\n"]

type nonrec split_fields = {
  paths : glue_studio_path_list; [@ocaml.doc "A JSON path to a variable in the data structure.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that splits data property keys into two [DynamicFrames]. The output is a \
   collection of [DynamicFrames]: one with selected data property keys, and one with the remaining \
   data property keys.\n"]

type nonrec non_negative_int = int [@@ocaml.doc ""]

type nonrec select_from_collection = {
  index : non_negative_int; [@ocaml.doc "The index for the DynamicFrame to be selected.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that chooses one [DynamicFrame] from a collection of [DynamicFrames]. The \
   output is the selected [DynamicFrame] \n"]

type nonrec fill_missing_values = {
  filled_path : enclosed_in_string_property option;
      [@ocaml.doc
        "A JSON path to a variable in the data structure for the dataset that is filled.\n"]
  imputed_path : enclosed_in_string_property;
      [@ocaml.doc
        "A JSON path to a variable in the data structure for the dataset that is imputed.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that locates records in the dataset that have missing values and adds a \
   new field with a value determined by imputation. The input data set is used to train the \
   machine learning model that determines what the missing value should be.\n"]

type nonrec filter_logical_operator = OR [@ocaml.doc ""] | AND [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec filter_operation =
  | ISNULL [@ocaml.doc ""]
  | REGEX [@ocaml.doc ""]
  | GTE [@ocaml.doc ""]
  | LTE [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | EQ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_value_type = CONSTANT [@ocaml.doc ""] | COLUMNEXTRACTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_value = {
  value : enclosed_in_string_properties; [@ocaml.doc "The value to be associated.\n"]
  type_ : filter_value_type; [@ocaml.doc "The type of filter value.\n"]
}
[@@ocaml.doc "Represents a single entry in the list of values for a [FilterExpression]. \n"]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter_expression = {
  values : filter_values; [@ocaml.doc "A list of filter values.\n"]
  negated : boxed_boolean option; [@ocaml.doc "Whether the expression is to be negated.\n"]
  operation : filter_operation; [@ocaml.doc "The type of operation to perform in the expression.\n"]
}
[@@ocaml.doc "Specifies a filter expression.\n"]

type nonrec filter_expressions = filter_expression list [@@ocaml.doc ""]

type nonrec filter = {
  filters : filter_expressions; [@ocaml.doc "Specifies a filter expression.\n"]
  logical_operator : filter_logical_operator;
      [@ocaml.doc
        "The operator used to filter rows by comparing the key value to a specified value.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that splits a dataset into two, based on a filter condition.\n"]

type nonrec many_inputs = node_id list [@@ocaml.doc ""]

type nonrec extended_string = string [@@ocaml.doc ""]

type nonrec custom_code = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the custom code transform.\n"]
  class_name : enclosed_in_string_property;
      [@ocaml.doc "The name defined for the custom code node class.\n"]
  code : extended_string;
      [@ocaml.doc "The custom code that is used to perform the data transformation.\n"]
  inputs : many_inputs; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that uses custom code you provide to perform the data transformation. The \
   output is a collection of DynamicFrames.\n"]

type nonrec sql_alias = {
  alias : enclosed_in_string_property_with_quote;
      [@ocaml.doc "A temporary name given to a table, or a column in a table.\n"]
  from_ : node_id; [@ocaml.doc "A table, or a column in a table.\n"]
}
[@@ocaml.doc "Represents a single entry in the list of values for [SqlAliases]. \n"]

type nonrec sql_aliases = sql_alias list [@@ocaml.doc ""]

type nonrec spark_sq_l = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the SparkSQL transform.\n"]
  sql_aliases : sql_aliases;
      [@ocaml.doc
        "A list of aliases. An alias allows you to specify what name to use in the SQL for a given \
         input. For example, you have a datasource named \"MyDataSource\". If you specify [From] \
         as MyDataSource, and [Alias] as SqlName, then in your SQL you can do:\n\n\
        \  [select *\n\
         from SqlName] \n\
        \ \n\
        \  and that gets data from MyDataSource.\n\
        \  "]
  sql_query : sql_query;
      [@ocaml.doc "A SQL query that must use Spark SQL syntax and return a single data set.\n"]
  inputs : many_inputs;
      [@ocaml.doc
        "The data inputs identified by their node names. You can associate a table name with each \
         input node to use in the SQL query. The name you choose must meet the Spark SQL naming \
         restrictions.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform where you enter a SQL query using Spark SQL syntax to transform the data. \
   The output is a single [DynamicFrame].\n"]

type nonrec boxed_positive_int = int [@@ocaml.doc ""]

type nonrec starting_position =
  | TIMESTAMP [@ocaml.doc ""]
  | EARLIEST [@ocaml.doc ""]
  | TRIM_HORIZON [@ocaml.doc ""]
  | LATEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iso8601_date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec kinesis_streaming_source_options = {
  fanout_consumer_ar_n : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Kinesis Data Streams enhanced fan-out consumer. \
         When specified, enables enhanced fan-out for dedicated throughput and lower latency data \
         consumption.\n"]
  starting_timestamp : iso8601_date_time option;
      [@ocaml.doc
        "The timestamp of the record in the Kinesis data stream to start reading data from. The \
         possible values are a timestamp string in UTC format of the pattern \
         [yyyy-mm-ddTHH:MM:SSZ] (where Z represents a UTC timezone offset with a +/-. For example: \
         \"2023-04-04T08:00:00+08:00\"). \n"]
  emit_consumer_lag_metrics : enclosed_in_string_property option;
      [@ocaml.doc
        "When this option is set to 'true', for each batch, it will emit the metrics for the \
         duration between the oldest record received by the stream and the time it arrives in Glue \
         to CloudWatch. The metric's name is \"glue.driver.streaming.maxConsumerLagInMs\". The \
         default value is 'false'. This option is supported in Glue version 4.0 or later.\n"]
  add_record_timestamp : enclosed_in_string_property option;
      [@ocaml.doc
        "When this option is set to 'true', the data output will contain an additional column \
         named \"__src_timestamp\" that indicates the time when the corresponding record received \
         by the stream. The default value is 'false'. This option is supported in Glue version 4.0 \
         or later.\n"]
  role_session_name : enclosed_in_string_property option;
      [@ocaml.doc
        "An identifier for the session assuming the role using AWS STS. You must use this \
         parameter when accessing a data stream in a different account. Used in conjunction with \
         [\"awsSTSRoleARN\"].\n"]
  role_arn : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role to assume using AWS Security Token Service \
         (AWS STS). This role must have permissions for describe or read record operations for the \
         Kinesis data stream. You must use this parameter when accessing a data stream in a \
         different account. Used in conjunction with [\"awsSTSSessionName\"].\n"]
  stream_arn : enclosed_in_string_property option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Kinesis data stream.\n"]
  avoid_empty_batches : boxed_boolean option;
      [@ocaml.doc
        "Avoids creating an empty microbatch job by checking for unread data in the Kinesis data \
         stream before the batch is started. The default value is [\"False\"].\n"]
  max_retry_interval_ms : boxed_non_negative_long option;
      [@ocaml.doc
        "The maximum cool-off time period (specified in ms) between two retries of a Kinesis Data \
         Streams API call. The default value is [10000].\n"]
  retry_interval_ms : boxed_non_negative_long option;
      [@ocaml.doc
        "The cool-off time period (specified in ms) before retrying the Kinesis Data Streams API \
         call. The default value is [1000].\n"]
  num_retries : boxed_non_negative_int option;
      [@ocaml.doc
        "The maximum number of retries for Kinesis Data Streams API requests. The default value is \
         [3].\n"]
  describe_shard_interval : boxed_non_negative_long option;
      [@ocaml.doc
        "The minimum time interval between two ListShards API calls for your script to consider \
         resharding. The default value is [1s].\n"]
  idle_time_between_reads_in_ms : boxed_non_negative_long option;
      [@ocaml.doc
        "The minimum time delay between two consecutive getRecords operations, specified in ms. \
         The default value is [1000]. This option is only configurable for Glue version 2.0 and \
         above.\n"]
  add_idle_time_between_reads : boxed_boolean option;
      [@ocaml.doc
        "Adds a time delay between two consecutive getRecords operations. The default value is \
         [\"False\"]. This option is only configurable for Glue version 2.0 and above.\n"]
  max_record_per_read : boxed_non_negative_long option;
      [@ocaml.doc
        "The maximum number of records to fetch from the Kinesis data stream in each getRecords \
         operation. The default value is [10000].\n"]
  max_fetch_records_per_shard : boxed_non_negative_long option;
      [@ocaml.doc
        "The maximum number of records to fetch per shard in the Kinesis data stream per \
         microbatch. Note: The client can exceed this limit if the streaming job has already read \
         extra records from Kinesis (in the same get-records call). If [MaxFetchRecordsPerShard] \
         needs to be strict then it needs to be a multiple of [MaxRecordPerRead]. The default \
         value is [100000].\n"]
  max_fetch_time_in_ms : boxed_non_negative_long option;
      [@ocaml.doc
        "The maximum time spent for the job executor to read records for the current batch from \
         the Kinesis data stream, specified in milliseconds (ms). Multiple [GetRecords] API calls \
         may be made within this time. The default value is [1000].\n"]
  starting_position : starting_position option;
      [@ocaml.doc
        "The starting position in the Kinesis data stream to read data from. The possible values \
         are [\"latest\"], [\"trim_horizon\"], [\"earliest\"], or a timestamp string in UTC format \
         in the pattern [yyyy-mm-ddTHH:MM:SSZ] (where [Z] represents a UTC timezone offset with a \
         +/-. For example: \"2023-04-04T08:00:00-04:00\"). The default value is [\"latest\"].\n\n\
        \ Note: Using a value that is a timestamp string in UTC format for \"startingPosition\" is \
         supported only for Glue version 4.0 or later.\n\
        \ "]
  delimiter : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the delimiter character.\n"]
  classification : enclosed_in_string_property option; [@ocaml.doc "An optional classification.\n"]
  stream_name : enclosed_in_string_property option;
      [@ocaml.doc "The name of the Kinesis data stream.\n"]
  endpoint_url : enclosed_in_string_property option;
      [@ocaml.doc "The URL of the Kinesis endpoint.\n"]
}
[@@ocaml.doc "Additional options for the Amazon Kinesis streaming data source.\n"]

type nonrec polling_time = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec positive_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec streaming_data_preview_options = {
  record_polling_limit : positive_long option;
      [@ocaml.doc "The limit to the number of records polled.\n"]
  polling_time : polling_time option; [@ocaml.doc "The polling time in milliseconds.\n"]
}
[@@ocaml.doc "Specifies options related to data preview for viewing a sample of your data.\n"]

type nonrec direct_kinesis_source = {
  data_preview_options : streaming_data_preview_options option;
      [@ocaml.doc "Additional options for data preview.\n"]
  streaming_options : kinesis_streaming_source_options option;
      [@ocaml.doc "Additional options for the Kinesis streaming data source.\n"]
  detect_schema : boxed_boolean option;
      [@ocaml.doc "Whether to automatically determine the schema from the incoming data.\n"]
  window_size : boxed_positive_int option;
      [@ocaml.doc "The amount of time to spend processing each micro batch.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a direct Amazon Kinesis data source.\n"]

type nonrec kafka_streaming_source_options = {
  starting_timestamp : iso8601_date_time option;
      [@ocaml.doc
        "The timestamp of the record in the Kafka topic to start reading data from. The possible \
         values are a timestamp string in UTC format of the pattern [yyyy-mm-ddTHH:MM:SSZ] (where \
         Z represents a UTC timezone offset with a +/-. For example: \
         \"2023-04-04T08:00:00+08:00\"). \n\n\
        \ Only one of [StartingTimestamp] or [StartingOffsets] must be set.\n\
        \ "]
  emit_consumer_lag_metrics : enclosed_in_string_property option;
      [@ocaml.doc
        "When this option is set to 'true', for each batch, it will emit the metrics for the \
         duration between the oldest record received by the topic and the time it arrives in Glue \
         to CloudWatch. The metric's name is \"glue.driver.streaming.maxConsumerLagInMs\". The \
         default value is 'false'. This option is supported in Glue version 4.0 or later.\n"]
  add_record_timestamp : enclosed_in_string_property option;
      [@ocaml.doc
        "When this option is set to 'true', the data output will contain an additional column \
         named \"__src_timestamp\" that indicates the time when the corresponding record received \
         by the topic. The default value is 'false'. This option is supported in Glue version 4.0 \
         or later.\n"]
  include_headers : boxed_boolean option;
      [@ocaml.doc
        "Whether to include the Kafka headers. When the option is set to \"true\", the data output \
         will contain an additional column named \"glue_streaming_kafka_headers\" with type \
         [Array\\[Struct(key: String, value: String)\\]]. The default value is \"false\". This \
         option is available in Glue version 3.0 or later only.\n"]
  min_partitions : boxed_non_negative_int option;
      [@ocaml.doc
        "The desired minimum number of partitions to read from Kafka. The default value is null, \
         which means that the number of spark partitions is equal to the number of Kafka \
         partitions.\n"]
  max_offsets_per_trigger : boxed_non_negative_long option;
      [@ocaml.doc
        "The rate limit on the maximum number of offsets that are processed per trigger interval. \
         The specified total number of offsets is proportionally split across [topicPartitions] of \
         different volumes. The default value is null, which means that the consumer reads all \
         offsets until the known latest offset.\n"]
  retry_interval_ms : boxed_non_negative_long option;
      [@ocaml.doc
        "The time in milliseconds to wait before retrying to fetch Kafka offsets. The default \
         value is [10].\n"]
  num_retries : boxed_non_negative_int option;
      [@ocaml.doc
        "The number of times to retry before failing to fetch Kafka offsets. The default value is \
         [3].\n"]
  poll_timeout_ms : boxed_non_negative_long option;
      [@ocaml.doc
        "The timeout in milliseconds to poll data from Kafka in Spark job executors. The default \
         value is [512].\n"]
  ending_offsets : enclosed_in_string_property option;
      [@ocaml.doc
        "The end point when a batch query is ended. Possible values are either [\"latest\"] or a \
         JSON string that specifies an ending offset for each [TopicPartition].\n"]
  starting_offsets : enclosed_in_string_property option;
      [@ocaml.doc
        "The starting position in the Kafka topic to read data from. The possible values are \
         [\"earliest\"] or [\"latest\"]. The default value is [\"latest\"].\n"]
  delimiter : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the delimiter character.\n"]
  classification : enclosed_in_string_property option; [@ocaml.doc "An optional classification.\n"]
  subscribe_pattern : enclosed_in_string_property option;
      [@ocaml.doc
        "A Java regex string that identifies the topic list to subscribe to. You must specify at \
         least one of [\"topicName\"], [\"assign\"] or [\"subscribePattern\"].\n"]
  assign : enclosed_in_string_property option;
      [@ocaml.doc
        "The specific [TopicPartitions] to consume. You must specify at least one of \
         [\"topicName\"], [\"assign\"] or [\"subscribePattern\"].\n"]
  topic_name : enclosed_in_string_property option;
      [@ocaml.doc
        "The topic name as specified in Apache Kafka. You must specify at least one of \
         [\"topicName\"], [\"assign\"] or [\"subscribePattern\"].\n"]
  connection_name : enclosed_in_string_property option; [@ocaml.doc "The name of the connection.\n"]
  security_protocol : enclosed_in_string_property option;
      [@ocaml.doc
        "The protocol used to communicate with brokers. The possible values are [\"SSL\"] or \
         [\"PLAINTEXT\"].\n"]
  bootstrap_servers : enclosed_in_string_property option;
      [@ocaml.doc
        "A list of bootstrap server URLs, for example, as \
         [b-1.vpc-test-2.o4q88o.c6.kafka.us-east-1.amazonaws.com:9094]. This option must be \
         specified in the API call or defined in the table metadata in the Data Catalog.\n"]
}
[@@ocaml.doc "Additional options for streaming.\n"]

type nonrec direct_kafka_source = {
  data_preview_options : streaming_data_preview_options option;
      [@ocaml.doc "Specifies options related to data preview for viewing a sample of your data.\n"]
  detect_schema : boxed_boolean option;
      [@ocaml.doc "Whether to automatically determine the schema from the incoming data.\n"]
  window_size : boxed_positive_int option;
      [@ocaml.doc "The amount of time to spend processing each micro batch.\n"]
  streaming_options : kafka_streaming_source_options option;
      [@ocaml.doc "Specifies the streaming options.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies an Apache Kafka data store.\n"]

type nonrec catalog_kinesis_source = {
  data_preview_options : streaming_data_preview_options option;
      [@ocaml.doc "Additional options for data preview.\n"]
  streaming_options : kinesis_streaming_source_options option;
      [@ocaml.doc "Additional options for the Kinesis streaming data source.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  detect_schema : boxed_boolean option;
      [@ocaml.doc "Whether to automatically determine the schema from the incoming data.\n"]
  window_size : boxed_positive_int option;
      [@ocaml.doc "The amount of time to spend processing each micro batch.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a Kinesis data source in the Glue Data Catalog.\n"]

type nonrec catalog_kafka_source = {
  data_preview_options : streaming_data_preview_options option;
      [@ocaml.doc "Specifies options related to data preview for viewing a sample of your data.\n"]
  streaming_options : kafka_streaming_source_options option;
      [@ocaml.doc "Specifies the streaming options.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  detect_schema : boxed_boolean option;
      [@ocaml.doc "Whether to automatically determine the schema from the incoming data.\n"]
  window_size : boxed_positive_int option;
      [@ocaml.doc "The amount of time to spend processing each micro batch.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies an Apache Kafka data store in the Data Catalog.\n"]

type nonrec null_check_box_list = {
  is_neg_one : boxed_boolean option;
      [@ocaml.doc "Specifies that an integer value of -1 is considered as a null value.\n"]
  is_null_string : boxed_boolean option;
      [@ocaml.doc
        "Specifies that a value spelling out the word 'null' is considered as a null value.\n"]
  is_empty : boxed_boolean option;
      [@ocaml.doc "Specifies that an empty string is considered as a null value.\n"]
}
[@@ocaml.doc "Represents whether certain values are recognized as null values for removal.\n"]

type nonrec generic_limited_string = string [@@ocaml.doc ""]

type nonrec datatype = {
  label : generic_limited_string; [@ocaml.doc "A label assigned to the datatype.\n"]
  id : generic_limited_string; [@ocaml.doc "The datatype of the value.\n"]
}
[@@ocaml.doc "A structure representing the datatype of the value.\n"]

type nonrec null_value_field = {
  datatype : datatype; [@ocaml.doc "The datatype of the value.\n"]
  value : enclosed_in_string_property; [@ocaml.doc "The value of the null placeholder.\n"]
}
[@@ocaml.doc
  "Represents a custom null value such as a zeros or other value being used as a null placeholder \
   unique to the dataset.\n"]

type nonrec null_value_fields = null_value_field list [@@ocaml.doc ""]

type nonrec drop_null_fields = {
  null_text_list : null_value_fields option;
      [@ocaml.doc
        "A structure that specifies a list of NullValueField structures that represent a custom \
         null value such as zero or other value being used as a null placeholder unique to the \
         dataset.\n\n\
        \ The [DropNullFields] transform removes custom null values only if both the value of the \
         null placeholder and the datatype match the data.\n\
        \ "]
  null_check_box_list : null_check_box_list option;
      [@ocaml.doc
        "A structure that represents whether certain values are recognized as null values for \
         removal.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that removes columns from the dataset if all values in the column are \
   'null'. By default, Glue Studio will recognize null objects, but some values such as empty \
   strings, strings that are \"null\", -1 integers or other placeholders such as zeros, are not \
   automatically recognized as nulls.\n"]

type nonrec merge = {
  primary_keys : glue_studio_path_list;
      [@ocaml.doc
        "The list of primary key fields to match records from the source and staging dynamic frames.\n"]
  source : node_id;
      [@ocaml.doc "The source [DynamicFrame] that will be merged with a staging [DynamicFrame].\n"]
  inputs : two_inputs; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that merges a [DynamicFrame] with a staging [DynamicFrame] based on the \
   specified primary keys to identify records. Duplicate records (records with the same primary \
   keys) are not de-duplicated. \n"]

type nonrec union_type = DISTINCT [@ocaml.doc ""] | ALL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec union = {
  union_type : union_type;
      [@ocaml.doc
        "Indicates the type of Union transform. \n\n\
        \ Specify [ALL] to join all rows from data sources to the resulting DynamicFrame. The \
         resulting union does not remove duplicate rows.\n\
        \ \n\
        \  Specify [DISTINCT] to remove duplicate rows in the resulting DynamicFrame.\n\
        \  "]
  inputs : two_inputs; [@ocaml.doc "The node ID inputs to the transform.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that combines the rows from two or more datasets into a single result.\n"]

type nonrec pii_type =
  | ColumnMasking [@ocaml.doc ""]
  | ColumnHashing [@ocaml.doc ""]
  | ColumnAudit [@ocaml.doc ""]
  | RowPartialMasking [@ocaml.doc ""]
  | RowMasking [@ocaml.doc ""]
  | RowHashing [@ocaml.doc ""]
  | RowAudit [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boxed_double_fraction = float [@@ocaml.doc ""]

type nonrec mask_value = string [@@ocaml.doc ""]

type nonrec pii_detection = {
  detection_sensitivity : enclosed_in_string_property option;
      [@ocaml.doc
        "The sensitivity level for PII detection. Higher sensitivity levels detect more potential \
         PII but may result in more false positives.\n"]
  detection_parameters : enclosed_in_string_property option;
      [@ocaml.doc
        "Additional parameters for configuring PII detection behavior and sensitivity settings.\n"]
  num_right_chars_to_exclude : boxed_positive_int option;
      [@ocaml.doc
        "The number of characters to exclude from redaction on the right side of detected PII \
         content. This allows preserving context around the sensitive data.\n"]
  num_left_chars_to_exclude : boxed_positive_int option;
      [@ocaml.doc
        "The number of characters to exclude from redaction on the left side of detected PII \
         content. This allows preserving context around the sensitive data.\n"]
  match_pattern : enclosed_in_string_property option;
      [@ocaml.doc
        "A regular expression pattern used to identify additional PII content beyond the standard \
         detection algorithms.\n"]
  redact_char : enclosed_in_string_property option;
      [@ocaml.doc
        "The character used to replace detected PII content when redaction is enabled. The default \
         redaction character is [*].\n"]
  redact_text : enclosed_in_string_property option;
      [@ocaml.doc
        "Specifies whether to redact the detected PII text. When set to [true], PII content is \
         replaced with redaction characters.\n"]
  mask_value : mask_value option;
      [@ocaml.doc "Indicates the value that will replace the detected entity. \n"]
  threshold_fraction : boxed_double_fraction option;
      [@ocaml.doc
        "Indicates the fraction of the data that must be met in order for a column to be \
         identified as PII data. \n"]
  sample_fraction : boxed_double_fraction option;
      [@ocaml.doc "Indicates the fraction of the data to sample when scanning for PII entities. \n"]
  output_column_name : enclosed_in_string_property option;
      [@ocaml.doc
        "Indicates the output column name that will contain any entity type detected in that row. \n"]
  entity_types_to_detect : enclosed_in_string_properties;
      [@ocaml.doc
        "Indicates the types of entities the PIIDetection transform will identify as PII data. \n\n\
        \  PII type entities include: PERSON_NAME, DATE, USA_SNN, EMAIL, USA_ITIN, \
         USA_PASSPORT_NUMBER, PHONE_NUMBER, BANK_ACCOUNT, IP_ADDRESS, MAC_ADDRESS, USA_CPT_CODE, \
         USA_HCPCS_CODE, USA_NATIONAL_DRUG_CODE, USA_MEDICARE_BENEFICIARY_IDENTIFIER, \
         USA_HEALTH_INSURANCE_CLAIM_NUMBER,CREDIT_CARD,USA_NATIONAL_PROVIDER_IDENTIFIER,USA_DEA_NUMBER,USA_DRIVING_LICENSE \n\
        \ "]
  pii_type : pii_type; [@ocaml.doc "Indicates the type of PIIDetection transform. \n"]
  inputs : one_input; [@ocaml.doc "The node ID inputs to the transform.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that identifies, removes or masks PII data.\n"]

type nonrec agg_function =
  | Var_pop [@ocaml.doc ""]
  | Var_samp [@ocaml.doc ""]
  | SumDistinct [@ocaml.doc ""]
  | Sum [@ocaml.doc ""]
  | Stddev_pop [@ocaml.doc ""]
  | Stddev_samp [@ocaml.doc ""]
  | Skewness [@ocaml.doc ""]
  | Min [@ocaml.doc ""]
  | Max [@ocaml.doc ""]
  | Kurtosis [@ocaml.doc ""]
  | Last [@ocaml.doc ""]
  | First [@ocaml.doc ""]
  | Count [@ocaml.doc ""]
  | CountDistinct [@ocaml.doc ""]
  | Avg [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aggregate_operation = {
  agg_func : agg_function;
      [@ocaml.doc
        "Specifies the aggregation function to apply.\n\n\
        \ Possible aggregation functions include: avg countDistinct, count, first, last, kurtosis, \
         max, min, skewness, stddev_samp, stddev_pop, sum, sumDistinct, var_samp, var_pop\n\
        \ "]
  column : enclosed_in_string_properties;
      [@ocaml.doc
        "Specifies the column on the data set on which the aggregation function will be applied.\n"]
}
[@@ocaml.doc
  "Specifies the set of parameters needed to perform aggregation in the aggregate transform.\n"]

type nonrec aggregate_operations = aggregate_operation list [@@ocaml.doc ""]

type nonrec aggregate = {
  aggs : aggregate_operations;
      [@ocaml.doc "Specifies the aggregate functions to be performed on specified fields. \n"]
  groups : glue_studio_path_list; [@ocaml.doc "Specifies the fields to group by.\n"]
  inputs : one_input;
      [@ocaml.doc "Specifies the fields and rows to use as inputs for the aggregate transform.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc
  "Specifies a transform that groups rows by chosen fields and computes the aggregated value by \
   specified function.\n"]

type nonrec limited_string_list = generic_limited_string list [@@ocaml.doc ""]

type nonrec limited_path_list = limited_string_list list [@@ocaml.doc ""]

type nonrec drop_duplicates = {
  columns : limited_path_list option;
      [@ocaml.doc "The name of the columns to be merged or removed if repeating.\n"]
  inputs : one_input; [@ocaml.doc "The data inputs identified by their node names.\n"]
  name : node_name; [@ocaml.doc "The name of the transform node.\n"]
}
[@@ocaml.doc "Specifies a transform that removes rows of repeating data from a data set. \n"]

type nonrec governed_catalog_target = {
  schema_change_policy : catalog_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the governed catalog.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a data target that writes to Amazon S3 using the Glue Data Catalog.\n"]

type nonrec governed_catalog_source = {
  additional_options : s3_source_additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  partition_predicate : enclosed_in_string_property option;
      [@ocaml.doc
        "Partitions satisfying this predicate are deleted. Files within the retention period in \
         these partitions are not deleted. Set to [\"\"] \226\128\147 empty by default.\n"]
  table : enclosed_in_string_property; [@ocaml.doc "The database table to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data store.\n"]
}
[@@ocaml.doc "Specifies the data store in the governed Glue Data Catalog.\n"]

type nonrec microsoft_sql_server_catalog_source = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a Microsoft SQL server data source in the Glue Data Catalog.\n"]

type nonrec my_sql_catalog_source = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a MySQL data source in the Glue Data Catalog.\n"]

type nonrec oracle_sql_catalog_source = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies an Oracle data source in the Glue Data Catalog.\n"]

type nonrec postgre_sql_catalog_source = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the data source.\n"]
}
[@@ocaml.doc "Specifies a PostgresSQL data source in the Glue Data Catalog.\n"]

type nonrec microsoft_sql_server_catalog_target = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses Microsoft SQL.\n"]

type nonrec my_sql_catalog_target = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses MySQL.\n"]

type nonrec oracle_sql_catalog_target = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses Oracle SQL.\n"]

type nonrec postgre_sql_catalog_target = {
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that uses Postgres SQL.\n"]

type nonrec group_filters = {
  logical_operator : filter_logical_operator;
      [@ocaml.doc
        "The logical operator used to combine the filters in this group. Determines whether all \
         filters must match (AND) or any filter can match (OR).\n"]
  filters : filter_expressions;
      [@ocaml.doc "A list of filter expressions that define the conditions for this group.\n"]
  group_name : generic_limited_string; [@ocaml.doc "The name of the filter group.\n"]
}
[@@ocaml.doc
  "Specifies a group of filters with a logical operator that determines how the filters are \
   combined to evaluate routing conditions.\n"]

type nonrec group_filters_list = group_filters list [@@ocaml.doc ""]

type nonrec route = {
  group_filters_list : group_filters_list;
      [@ocaml.doc
        "A list of group filters that define the routing conditions and criteria for directing \
         data to different output paths.\n"]
  inputs : one_input; [@ocaml.doc "The input connection for the route node.\n"]
  name : node_name; [@ocaml.doc "The name of the route node.\n"]
}
[@@ocaml.doc
  "Specifies a route node that directs data to different output paths based on defined filtering \
   conditions.\n"]

type nonrec param_type =
  | NULL [@ocaml.doc ""]
  | LIST [@ocaml.doc ""]
  | BOOL [@ocaml.doc ""]
  | COMPLEX [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | INT [@ocaml.doc ""]
  | STR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transform_config_parameter = {
  is_optional : boxed_boolean option;
      [@ocaml.doc
        "Specifies whether the parameter is optional or not in the config file of the dynamic \
         transform.\n"]
  list_type : param_type option;
      [@ocaml.doc
        "Specifies the list type of the parameter in the config file of the dynamic transform.\n"]
  value : enclosed_in_string_properties option;
      [@ocaml.doc
        "Specifies the value of the parameter in the config file of the dynamic transform.\n"]
  validation_message : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the validation message in the config file of the dynamic transform.\n"]
  validation_rule : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the validation rule in the config file of the dynamic transform.\n"]
  type_ : param_type;
      [@ocaml.doc "Specifies the parameter type in the config file of the dynamic transform.\n"]
  name : enclosed_in_string_property;
      [@ocaml.doc
        "Specifies the name of the parameter in the config file of the dynamic transform.\n"]
}
[@@ocaml.doc "Specifies the parameters in the config file of the dynamic transform.\n"]

type nonrec transform_config_parameter_list = transform_config_parameter list [@@ocaml.doc ""]

type nonrec dynamic_transform = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the dynamic transform.\n"]
  version : enclosed_in_string_property option;
      [@ocaml.doc "This field is not used and will be deprecated in future release.\n"]
  path : enclosed_in_string_property;
      [@ocaml.doc "Specifies the path of the dynamic transform source and config files.\n"]
  function_name : enclosed_in_string_property;
      [@ocaml.doc "Specifies the name of the function of the dynamic transform.\n"]
  parameters : transform_config_parameter_list option;
      [@ocaml.doc "Specifies the parameters of the dynamic transform.\n"]
  inputs : one_input;
      [@ocaml.doc "Specifies the inputs for the dynamic transform that are required.\n"]
  transform_name : enclosed_in_string_property;
      [@ocaml.doc
        "Specifies the name of the dynamic transform as it appears in the Glue Studio visual editor.\n"]
  name : enclosed_in_string_property; [@ocaml.doc "Specifies the name of the dynamic transform.\n"]
}
[@@ocaml.doc "Specifies the set of parameters needed to perform the dynamic transform.\n"]

type nonrec dqdl_string = string [@@ocaml.doc ""]

type nonrec dq_transform_output = EvaluationResults [@ocaml.doc ""] | PrimaryInput [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dq_results_publishing_options = {
  results_publishing_enabled : boxed_boolean option;
      [@ocaml.doc "Enable publishing for your data quality results.\n"]
  cloud_watch_metrics_enabled : boxed_boolean option;
      [@ocaml.doc "Enable metrics for your data quality results.\n"]
  results_s3_prefix : enclosed_in_string_property option;
      [@ocaml.doc "The Amazon S3 prefix prepended to the results.\n"]
  evaluation_context : generic_limited_string option; [@ocaml.doc "The context of the evaluation.\n"]
}
[@@ocaml.doc "Options to configure how your data quality evaluation results are published.\n"]

type nonrec dq_stop_job_on_failure_timing =
  | AfterDataLoad [@ocaml.doc ""]
  | Immediate [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dq_stop_job_on_failure_options = {
  stop_job_on_failure_timing : dq_stop_job_on_failure_timing option;
      [@ocaml.doc
        "When to stop job if your data quality evaluation fails. Options are Immediate or \
         AfterDataLoad.\n"]
}
[@@ocaml.doc "Options to configure how your job will stop if your data quality evaluation fails.\n"]

type nonrec evaluate_data_quality = {
  stop_job_on_failure_options : dq_stop_job_on_failure_options option;
      [@ocaml.doc
        "Options to configure how your job will stop if your data quality evaluation fails.\n"]
  publishing_options : dq_results_publishing_options option;
      [@ocaml.doc "Options to configure how your results are published.\n"]
  output : dq_transform_output option; [@ocaml.doc "The output of your data quality evaluation.\n"]
  ruleset : dqdl_string; [@ocaml.doc "The ruleset for your data quality evaluation.\n"]
  inputs : one_input; [@ocaml.doc "The inputs of your data quality evaluation.\n"]
  name : node_name; [@ocaml.doc "The name of the data quality evaluation.\n"]
}
[@@ocaml.doc "Specifies your data quality evaluation criteria.\n"]

type nonrec s3_catalog_hudi_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Hudi source.\n"]
  additional_hudi_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Hudi data source.\n"]
}
[@@ocaml.doc
  "Specifies a Hudi data source that is registered in the Glue Data Catalog. The Hudi data source \
   must be stored in Amazon S3.\n"]

type nonrec catalog_hudi_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Hudi source.\n"]
  additional_hudi_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Hudi data source.\n"]
}
[@@ocaml.doc "Specifies a Hudi data source that is registered in the Glue Data Catalog.\n"]

type nonrec s3_hudi_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Hudi source.\n"]
  additional_options : s3_direct_source_additional_options option;
      [@ocaml.doc "Specifies additional options for the connector.\n"]
  additional_hudi_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  paths : enclosed_in_string_properties;
      [@ocaml.doc "A list of the Amazon S3 paths to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Hudi source.\n"]
}
[@@ocaml.doc "Specifies a Hudi data source stored in Amazon S3.\n"]

type nonrec s3_hudi_catalog_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 Hudi catalog target.\n"]
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Hudi catalog \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : catalog_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  additional_options : additional_options;
      [@ocaml.doc "Specifies additional connection options for the connector.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that writes to a Hudi data source in the Glue Data Catalog.\n"]

type nonrec hudi_target_compression_type =
  | SNAPPY [@ocaml.doc ""]
  | UNCOMPRESSED [@ocaml.doc ""]
  | LZO [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_hudi_direct_target = {
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Hudi direct \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : direct_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  additional_options : additional_options;
      [@ocaml.doc "Specifies additional connection options for the connector.\n"]
  format : target_format; [@ocaml.doc "Specifies the data output format for the target.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  number_target_partitions : number_target_partitions_string option;
      [@ocaml.doc
        "Specifies the number of target partitions for distributing Hudi dataset files across \
         Amazon S3.\n"]
  compression : hudi_target_compression_type;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  path : enclosed_in_string_property;
      [@ocaml.doc "The Amazon S3 path of your Hudi data source to write to.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that writes to a Hudi data source in Amazon S3.\n"]

type nonrec jdbc_connection_type =
  | Redshift [@ocaml.doc ""]
  | Postgresql [@ocaml.doc ""]
  | Oracle [@ocaml.doc ""]
  | Mysql [@ocaml.doc ""]
  | Sqlserver [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec direct_jdbc_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the direct JDBC source.\n"]
  redshift_tmp_dir : enclosed_in_string_property option;
      [@ocaml.doc "The temp directory of the JDBC Redshift source.\n"]
  connection_type : jdbc_connection_type; [@ocaml.doc "The connection type of the JDBC source.\n"]
  connection_name : enclosed_in_string_property;
      [@ocaml.doc "The connection name of the JDBC source.\n"]
  table : enclosed_in_string_property; [@ocaml.doc "The table of the JDBC source connection.\n"]
  database : enclosed_in_string_property;
      [@ocaml.doc "The database of the JDBC source connection.\n"]
  name : node_name; [@ocaml.doc "The name of the JDBC source connection.\n"]
}
[@@ocaml.doc "Specifies the direct JDBC source connection.\n"]

type nonrec s3_catalog_delta_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Delta Lake source.\n"]
  additional_delta_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Delta Lake data source.\n"]
}
[@@ocaml.doc
  "Specifies a Delta Lake data source that is registered in the Glue Data Catalog. The data source \
   must be stored in Amazon S3.\n"]

type nonrec catalog_delta_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Delta Lake source.\n"]
  additional_delta_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Delta Lake data source.\n"]
}
[@@ocaml.doc "Specifies a Delta Lake data source that is registered in the Glue Data Catalog.\n"]

type nonrec s3_delta_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Delta Lake source.\n"]
  additional_options : s3_direct_source_additional_options option;
      [@ocaml.doc "Specifies additional options for the connector.\n"]
  additional_delta_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options.\n"]
  paths : enclosed_in_string_properties;
      [@ocaml.doc "A list of the Amazon S3 paths to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Delta Lake source.\n"]
}
[@@ocaml.doc "Specifies a Delta Lake data source stored in Amazon S3.\n"]

type nonrec s3_delta_catalog_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 Delta catalog target.\n"]
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Delta \
         catalog target. When set to [true], data quality checks are performed automatically \
         during the write operation.\n"]
  schema_change_policy : catalog_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  additional_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options for the connector.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc
  "Specifies a target that writes to a Delta Lake data source in the Glue Data Catalog.\n"]

type nonrec delta_target_compression_type = SNAPPY [@ocaml.doc ""] | UNCOMPRESSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_delta_direct_target = {
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Delta direct \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : direct_schema_change_policy option;
      [@ocaml.doc "A policy that specifies update behavior for the crawler.\n"]
  additional_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options for the connector.\n"]
  format : target_format; [@ocaml.doc "Specifies the data output format for the target.\n"]
  number_target_partitions : number_target_partitions_string option;
      [@ocaml.doc
        "Specifies the number of target partitions for distributing Delta Lake dataset files \
         across Amazon S3.\n"]
  compression : delta_target_compression_type;
      [@ocaml.doc
        "Specifies how the data is compressed. This is generally not necessary if the data has a \
         standard file extension. Possible values are [\"gzip\"] and [\"bzip\"]).\n"]
  path : enclosed_in_string_property;
      [@ocaml.doc "The Amazon S3 path of your Delta Lake data source to write to.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies native partitioning using a sequence of keys.\n"]
  inputs : one_input; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  name : node_name; [@ocaml.doc "The name of the data target.\n"]
}
[@@ocaml.doc "Specifies a target that writes to a Delta Lake data source in Amazon S3.\n"]

type nonrec option_ = {
  description : enclosed_in_string_property option;
      [@ocaml.doc "Specifies the description of the option.\n"]
  label : enclosed_in_string_property option; [@ocaml.doc "Specifies the label of the option.\n"]
  value : enclosed_in_string_property option; [@ocaml.doc "Specifies the value of the option.\n"]
}
[@@ocaml.doc "Specifies an option value.\n"]

type nonrec amazon_redshift_advanced_option = {
  value : generic_string option; [@ocaml.doc "The value for the additional connection option.\n"]
  key : generic_string option; [@ocaml.doc "The key for the additional connection option.\n"]
}
[@@ocaml.doc "Specifies an optional value when connecting to the Redshift cluster.\n"]

type nonrec amazon_redshift_advanced_options = amazon_redshift_advanced_option list [@@ocaml.doc ""]

type nonrec option_list = option_ list [@@ocaml.doc ""]

type nonrec amazon_redshift_node_data = {
  selected_columns : option_list option;
      [@ocaml.doc
        "The list of column names used to determine a matching record when doing a MERGE or APPEND \
         with upsert.\n"]
  staging_table : generic_string option;
      [@ocaml.doc
        "The name of the temporary staging table that is used when doing a MERGE or APPEND with \
         upsert.\n"]
  table_schema : option_list option; [@ocaml.doc "The array of schema output for a given node.\n"]
  crawler_connection : generic_string option;
      [@ocaml.doc
        "Specifies the name of the connection that is associated with the catalog table used.\n"]
  merge_clause : generic_string option;
      [@ocaml.doc "The SQL used in a custom merge to deal with matching records.\n"]
  merge_when_not_matched : generic_limited_string option;
      [@ocaml.doc
        "The action used when to detemine how a MERGE in a Redshift sink will be handled when an \
         existing record doesn't match a new record.\n"]
  merge_when_matched : generic_limited_string option;
      [@ocaml.doc
        "The action used when to detemine how a MERGE in a Redshift sink will be handled when an \
         existing record matches a new record.\n"]
  merge_action : generic_limited_string option;
      [@ocaml.doc
        "The action used when to detemine how a MERGE in a Redshift sink will be handled.\n"]
  upsert : boolean_value option;
      [@ocaml.doc "The action used on Redshift sinks when doing an APPEND.\n"]
  table_prefix : generic_limited_string option; [@ocaml.doc "Specifies the prefix to a table.\n"]
  action : generic_string option;
      [@ocaml.doc "Specifies how writing to a Redshift cluser will occur.\n"]
  post_action : generic_string option;
      [@ocaml.doc "The SQL used before a MERGE or APPEND with upsert is run.\n"]
  pre_action : generic_string option;
      [@ocaml.doc "The SQL used before a MERGE or APPEND with upsert is run.\n"]
  sample_query : generic_string option;
      [@ocaml.doc
        "The SQL used to fetch the data from a Redshift sources when the SourceType is 'query'.\n"]
  advanced_options : amazon_redshift_advanced_options option;
      [@ocaml.doc "Optional values when connecting to the Redshift cluster.\n"]
  iam_role : option_ option;
      [@ocaml.doc
        "Optional. The role name use when connection to S3. The IAM role ill default to the role \
         on the job when left blank.\n"]
  temp_dir : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon S3 path where temporary data can be staged when copying out of the database.\n"]
  catalog_redshift_table : generic_string option; [@ocaml.doc "The database table to read from.\n"]
  catalog_redshift_schema : generic_string option;
      [@ocaml.doc "The Redshift schema name when working with a data catalog.\n"]
  catalog_table : option_ option;
      [@ocaml.doc "The Glue Data Catalog table name when working with a data catalog.\n"]
  catalog_database : option_ option;
      [@ocaml.doc "The name of the Glue Data Catalog database when working with a data catalog.\n"]
  table : option_ option;
      [@ocaml.doc "The Redshift table name when working with a direct connection.\n"]
  schema : option_ option;
      [@ocaml.doc "The Redshift schema name when working with a direct connection.\n"]
  connection : option_ option; [@ocaml.doc "The Glue connection to the Redshift cluster.\n"]
  source_type : generic_limited_string option;
      [@ocaml.doc
        "The source type to specify whether a specific table is the source or a custom query.\n"]
  access_type : generic_limited_string option;
      [@ocaml.doc
        "The access type for the Redshift connection. Can be a direct connection or catalog \
         connections.\n"]
}
[@@ocaml.doc "Specifies an Amazon Redshift node.\n"]

type nonrec amazon_redshift_source = {
  data : amazon_redshift_node_data option;
      [@ocaml.doc "Specifies the data of the Amazon Reshift source node.\n"]
  name : node_name option; [@ocaml.doc "The name of the Amazon Redshift source.\n"]
}
[@@ocaml.doc "Specifies an Amazon Redshift source.\n"]

type nonrec amazon_redshift_target = {
  inputs : one_input option; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  data : amazon_redshift_node_data option;
      [@ocaml.doc "Specifies the data of the Amazon Redshift target node.\n"]
  name : node_name option; [@ocaml.doc "The name of the Amazon Redshift target.\n"]
}
[@@ocaml.doc "Specifies an Amazon Redshift target.\n"]

type nonrec dqdl_aliases = (node_name * enclosed_in_string_property) list [@@ocaml.doc ""]

type nonrec additional_option_keys =
  | CompositeOption [@ocaml.doc ""]
  | ObservationsOption [@ocaml.doc ""]
  | CacheOption [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dq_additional_options = (additional_option_keys * generic_string) list [@@ocaml.doc ""]

type nonrec evaluate_data_quality_multi_frame = {
  stop_job_on_failure_options : dq_stop_job_on_failure_options option;
      [@ocaml.doc
        "Options to configure how your job will stop if your data quality evaluation fails.\n"]
  additional_options : dq_additional_options option;
      [@ocaml.doc "Options to configure runtime behavior of the transform.\n"]
  publishing_options : dq_results_publishing_options option;
      [@ocaml.doc "Options to configure how your results are published.\n"]
  ruleset : dqdl_string; [@ocaml.doc "The ruleset for your data quality evaluation.\n"]
  additional_data_sources : dqdl_aliases option;
      [@ocaml.doc "The aliases of all data sources except primary.\n"]
  inputs : many_inputs;
      [@ocaml.doc
        "The inputs of your data quality evaluation. The first input in this list is the primary \
         data source.\n"]
  name : node_name; [@ocaml.doc "The name of the data quality evaluation.\n"]
}
[@@ocaml.doc "Specifies your data quality evaluation criteria.\n"]

type nonrec recipe_version = string [@@ocaml.doc ""]

type nonrec recipe_reference = {
  recipe_version : recipe_version; [@ocaml.doc "The RecipeVersion of the DataBrew recipe.\n"]
  recipe_arn : enclosed_in_string_property; [@ocaml.doc "The ARN of the DataBrew recipe.\n"]
}
[@@ocaml.doc "A reference to a Glue DataBrew recipe.\n"]

type nonrec operation = string [@@ocaml.doc ""]

type nonrec parameter_value = string [@@ocaml.doc ""]

type nonrec parameter_name = string [@@ocaml.doc ""]

type nonrec parameter_map = (parameter_name * parameter_value) list [@@ocaml.doc ""]

type nonrec recipe_action = {
  parameters : parameter_map option; [@ocaml.doc "The parameters of the recipe action.\n"]
  operation : operation; [@ocaml.doc "The operation of the recipe action.\n"]
}
[@@ocaml.doc "Actions defined in the Glue Studio data preparation recipe node.\n"]

type nonrec databrew_condition = string [@@ocaml.doc ""]

type nonrec databrew_condition_value = string [@@ocaml.doc ""]

type nonrec target_column = string [@@ocaml.doc ""]

type nonrec condition_expression = {
  target_column : target_column; [@ocaml.doc "The target column of the condition expressions.\n"]
  value : databrew_condition_value option; [@ocaml.doc "The value of the condition expression.\n"]
  condition : databrew_condition; [@ocaml.doc "The condition of the condition expression.\n"]
}
[@@ocaml.doc "Condition expression defined in the Glue Studio data preparation recipe node.\n"]

type nonrec condition_expression_list = condition_expression list [@@ocaml.doc ""]

type nonrec recipe_step = {
  condition_expressions : condition_expression_list option;
      [@ocaml.doc "The condition expressions for the recipe step.\n"]
  action : recipe_action; [@ocaml.doc "The transformation action of the recipe step.\n"]
}
[@@ocaml.doc "A recipe step used in a Glue Studio data preparation recipe node.\n"]

type nonrec recipe_steps = recipe_step list [@@ocaml.doc ""]

type nonrec recipe = {
  recipe_steps : recipe_steps option; [@ocaml.doc "Transform steps used in the recipe node.\n"]
  recipe_reference : recipe_reference option;
      [@ocaml.doc "A reference to the DataBrew recipe used by the node.\n"]
  inputs : one_input;
      [@ocaml.doc "The nodes that are inputs to the recipe node, identified by id.\n"]
  name : node_name; [@ocaml.doc "The name of the Glue Studio node.\n"]
}
[@@ocaml.doc "A Glue Studio node that uses a Glue DataBrew recipe in Glue jobs.\n"]

type nonrec snowflake_node_data = {
  table_schema : option_list option;
      [@ocaml.doc
        "Manually defines the target schema for the node. A list of structures with [value] , \
         [label] and [description] keys. Each structure defines a column.\n"]
  auto_pushdown : boolean_value option;
      [@ocaml.doc
        "Specifies whether automatic query pushdown is enabled. If pushdown is enabled, then when \
         a query is run on Spark, if part of the query can be \"pushed down\" to the Snowflake \
         server, it is pushed down. This improves performance of some queries.\n"]
  selected_columns : option_list option;
      [@ocaml.doc
        "Specifies the columns combined to identify a record when detecting matches for merges and \
         upserts. A list of structures with [value], [label] and [\n\
        \      description] keys. Each structure describes a column.\n"]
  staging_table : generic_string option;
      [@ocaml.doc
        "The name of a staging table used when performing [merge] or upsert [append] actions. Data \
         is written to this table, then moved to [table] by a generated postaction.\n"]
  merge_clause : generic_string option;
      [@ocaml.doc "A SQL statement that specifies a custom merge behavior.\n"]
  merge_when_not_matched : generic_limited_string option;
      [@ocaml.doc
        "Specifies how to process records that do not match preexisting data when merging. Valid \
         values: [insert], [none].\n"]
  merge_when_matched : generic_limited_string option;
      [@ocaml.doc
        "Specifies how to resolve records that match preexisting data when merging. Valid values: [\n\
        \      update], [delete].\n"]
  merge_action : generic_limited_string option;
      [@ocaml.doc
        "Specifies a merge action. Valid values: [simple], [custom]. If simple, merge behavior is \
         defined by [MergeWhenMatched] and [\n\
        \      MergeWhenNotMatched]. If custom, defined by [MergeClause].\n"]
  upsert : boolean_value option;
      [@ocaml.doc
        "Used when Action is [append]. Specifies the resolution behavior when a row already \
         exists. If true, preexisting rows will be updated. If false, those rows will be inserted.\n"]
  action : generic_string option;
      [@ocaml.doc
        "Specifies what action to take when writing to a table with preexisting data. Valid \
         values: [\n\
        \      append], [merge], [truncate], [drop].\n"]
  post_action : generic_string option;
      [@ocaml.doc "A SQL string run after the Snowflake connector performs its standard actions.\n"]
  pre_action : generic_string option;
      [@ocaml.doc
        "A SQL string run before the Snowflake connector performs its standard actions.\n"]
  sample_query : generic_string option;
      [@ocaml.doc "A SQL string used to retrieve data with the [query] sourcetype.\n"]
  additional_options : additional_options option;
      [@ocaml.doc
        "Specifies additional options passed to the Snowflake connector. If options are specified \
         elsewhere in this node, this will take precedence.\n"]
  iam_role : option_ option; [@ocaml.doc "Not currently used.\n"]
  temp_dir : enclosed_in_string_property option; [@ocaml.doc "Not currently used.\n"]
  database : generic_string option;
      [@ocaml.doc "Specifies a Snowflake database for your node to use.\n"]
  table : generic_string option; [@ocaml.doc "Specifies a Snowflake table for your node to use.\n"]
  schema : generic_string option;
      [@ocaml.doc "Specifies a Snowflake database schema for your node to use.\n"]
  connection : option_ option;
      [@ocaml.doc "Specifies a Glue Data Catalog Connection to a Snowflake endpoint.\n"]
  source_type : generic_limited_string option;
      [@ocaml.doc
        "Specifies how retrieved data is specified. Valid values: [\"table\"], [\n\
        \      \"query\"].\n"]
}
[@@ocaml.doc "Specifies configuration for Snowflake nodes in Glue Studio.\n"]

type nonrec snowflake_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies user-defined schemas for your output data.\n"]
  data : snowflake_node_data; [@ocaml.doc "Configuration for the Snowflake data source.\n"]
  name : node_name; [@ocaml.doc "The name of the Snowflake data source.\n"]
}
[@@ocaml.doc "Specifies a Snowflake data source.\n"]

type nonrec snowflake_target = {
  inputs : one_input option; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  data : snowflake_node_data; [@ocaml.doc "Specifies the data of the Snowflake target node.\n"]
  name : node_name; [@ocaml.doc "The name of the Snowflake target.\n"]
}
[@@ocaml.doc "Specifies a Snowflake target.\n"]

type nonrec connector_options = (generic_string * generic_string) list [@@ocaml.doc ""]

type nonrec connector_data_source = {
  output_schemas : glue_schemas option; [@ocaml.doc "Specifies the data schema for this source.\n"]
  data : connector_options;
      [@ocaml.doc
        "A map specifying connection options for the node. You can find standard connection \
         options for the corresponding connection type in the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-connect.html} \
         Connection parameters} section of the Glue documentation.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The [connectionType], as provided to the underlying Glue library. This node type supports \
         the following connection types: \n\n\
        \ {ul\n\
        \       {-   [opensearch] \n\
        \           \n\
        \            }\n\
        \       {-   [azuresql] \n\
        \           \n\
        \            }\n\
        \       {-   [azurecosmos] \n\
        \           \n\
        \            }\n\
        \       {-   [bigquery] \n\
        \           \n\
        \            }\n\
        \       {-   [saphana] \n\
        \           \n\
        \            }\n\
        \       {-   [teradata] \n\
        \           \n\
        \            }\n\
        \       {-   [vertica] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : node_name; [@ocaml.doc "The name of this source node.\n"]
}
[@@ocaml.doc "Specifies a source generated with standard connection options.\n"]

type nonrec connector_data_target = {
  inputs : one_input option; [@ocaml.doc "The nodes that are inputs to the data target.\n"]
  data : connector_options;
      [@ocaml.doc
        "A map specifying connection options for the node. You can find standard connection \
         options for the corresponding connection type in the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-connect.html} \
         Connection parameters} section of the Glue documentation.\n"]
  connection_type : enclosed_in_string_property;
      [@ocaml.doc
        "The [connectionType], as provided to the underlying Glue library. This node type supports \
         the following connection types: \n\n\
        \ {ul\n\
        \       {-   [opensearch] \n\
        \           \n\
        \            }\n\
        \       {-   [azuresql] \n\
        \           \n\
        \            }\n\
        \       {-   [azurecosmos] \n\
        \           \n\
        \            }\n\
        \       {-   [bigquery] \n\
        \           \n\
        \            }\n\
        \       {-   [saphana] \n\
        \           \n\
        \            }\n\
        \       {-   [teradata] \n\
        \           \n\
        \            }\n\
        \       {-   [vertica] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : node_name; [@ocaml.doc "The name of this target node.\n"]
}
[@@ocaml.doc "Specifies a target generated with standard connection options.\n"]

type nonrec s3_catalog_iceberg_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Iceberg source.\n"]
  additional_iceberg_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options for the Iceberg data source.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Iceberg data source.\n"]
}
[@@ocaml.doc
  "Specifies an Apache Iceberg data source that is registered in the Glue Data Catalog. The \
   Iceberg data source must be stored in Amazon S3.\n"]

type nonrec catalog_iceberg_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the Iceberg source.\n"]
  additional_iceberg_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options for the Iceberg data source.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table in the database to read from.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to read from.\n"]
  name : node_name; [@ocaml.doc "The name of the Iceberg data source.\n"]
}
[@@ocaml.doc
  "Specifies an Apache Iceberg data source that is registered in the Glue Data Catalog.\n"]

type nonrec s3_iceberg_catalog_target = {
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Iceberg \
         catalog target. When set to [true], data quality checks are performed automatically \
         during the write operation.\n"]
  schema_change_policy : catalog_schema_change_policy option;
      [@ocaml.doc "The policy for handling schema changes in the catalog target.\n"]
  additional_options : additional_options option;
      [@ocaml.doc "Specifies additional connection options for the Iceberg catalog target.\n"]
  database : enclosed_in_string_property; [@ocaml.doc "The name of the database to write to.\n"]
  table : enclosed_in_string_property;
      [@ocaml.doc "The name of the table to write to in the catalog.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "A list of partition keys for the Iceberg table.\n"]
  inputs : one_input; [@ocaml.doc "The input connection for the Iceberg catalog target.\n"]
  name : node_name; [@ocaml.doc "The name of the Iceberg catalog target.\n"]
}
[@@ocaml.doc
  "Specifies an Apache Iceberg catalog target that writes data to Amazon S3 and registers the \
   table in the Glue Data Catalog.\n"]

type nonrec iceberg_target_compression_type =
  | SNAPPY [@ocaml.doc ""]
  | UNCOMPRESSED [@ocaml.doc ""]
  | LZO [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_iceberg_direct_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 Iceberg direct target.\n"]
  number_target_partitions : number_target_partitions_string option;
      [@ocaml.doc
        "Sets the number of target partitions for distributing Iceberg table files across S3.\n"]
  compression : iceberg_target_compression_type;
      [@ocaml.doc "Specifies the compression codec used for Iceberg table files in S3.\n"]
  auto_data_quality : auto_data_quality option; [@ocaml.doc ""]
  schema_change_policy : direct_schema_change_policy option;
      [@ocaml.doc
        "Defines how schema changes are handled when writing data to the Iceberg table.\n"]
  additional_options : additional_options option;
      [@ocaml.doc
        "Provides additional configuration options for customizing the Iceberg table behavior.\n"]
  format : target_format;
      [@ocaml.doc
        "Specifies the file format used for storing Iceberg table data (e.g., Parquet, ORC).\n"]
  path : enclosed_in_string_property;
      [@ocaml.doc "Defines the S3 location where the Iceberg table data will be stored.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Specifies the columns used to partition the Iceberg table data in S3.\n"]
  inputs : one_input;
      [@ocaml.doc "Defines the single input source that provides data to this Iceberg target.\n"]
  name : node_name;
      [@ocaml.doc
        "Specifies the unique identifier for the Iceberg target node in your data pipeline.\n"]
}
[@@ocaml.doc "Specifies a target that writes to an Iceberg data source in Amazon S3.\n"]

type nonrec s3_excel_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "The Glue schemas to apply to the processed data.\n"]
  skip_footer : boxed_non_negative_int option;
      [@ocaml.doc "The number of rows to skip at the end of each Excel file.\n"]
  number_rows : boxed_long option;
      [@ocaml.doc "The number of rows to process from each Excel file.\n"]
  additional_options : s3_direct_source_additional_options option;
      [@ocaml.doc "Additional configuration options for S3 direct source processing.\n"]
  max_files_in_band : boxed_non_negative_int option;
      [@ocaml.doc "The maximum number of files to process in each band.\n"]
  max_band : boxed_non_negative_int option;
      [@ocaml.doc "The maximum number of processing bands to use.\n"]
  recurse : boxed_boolean option;
      [@ocaml.doc "Indicates whether to recursively process subdirectories.\n"]
  group_files : enclosed_in_string_property option;
      [@ocaml.doc "Specifies how files should be grouped for processing.\n"]
  group_size : enclosed_in_string_property option;
      [@ocaml.doc "Defines the size of file groups for batch processing.\n"]
  exclusions : enclosed_in_string_properties option;
      [@ocaml.doc "Patterns to exclude specific files or paths from processing.\n"]
  compression_type : parquet_compression_type option;
      [@ocaml.doc "The compression format used for the Excel files.\n"]
  paths : enclosed_in_string_properties;
      [@ocaml.doc "The S3 paths where the Excel files are located.\n"]
  name : node_name; [@ocaml.doc "The name of the S3 Excel data source.\n"]
}
[@@ocaml.doc "Specifies an S3 Excel data source.\n"]

type nonrec hyper_target_compression_type = UNCOMPRESSED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec s3_hyper_direct_target = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the S3 Hyper direct target.\n"]
  auto_data_quality : auto_data_quality option;
      [@ocaml.doc
        "Specifies whether to automatically enable data quality evaluation for the S3 Hyper direct \
         target. When set to [true], data quality checks are performed automatically during the \
         write operation.\n"]
  schema_change_policy : direct_schema_change_policy option;
      [@ocaml.doc "Defines how schema changes are handled during write operations.\n"]
  compression : hyper_target_compression_type option;
      [@ocaml.doc "The compression type to apply to the output data.\n"]
  path : enclosed_in_string_property;
      [@ocaml.doc "The S3 location where the output data will be written.\n"]
  partition_keys : glue_studio_path_list option;
      [@ocaml.doc "Defines the partitioning strategy for the output data.\n"]
  format : target_format option;
      [@ocaml.doc "Specifies the data output format for the HyperDirect target.\n"]
  inputs : one_input; [@ocaml.doc "Specifies the input source for the HyperDirect target.\n"]
  name : node_name; [@ocaml.doc "The unique identifier for the HyperDirect target node.\n"]
}
[@@ocaml.doc "Specifies a HyperDirect data target that writes to Amazon S3.\n"]

type nonrec ddb_export_type = S3 [@ocaml.doc ""] | Ddb [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ddbelt_connection_options = {
  dynamodb_sts_role_arn : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Security Token Service (STS) \
         role to assume for accessing DynamoDB and S3 resources during the ELT operation. This \
         role must have the necessary permissions to read from the DynamoDB table and write to the \
         intermediate S3 bucket. \n"]
  dynamodb_s3_bucket_owner : enclosed_in_string_property option;
      [@ocaml.doc
        "The Amazon Web Services account ID of the owner of the S3 bucket specified in \
         [DynamodbS3Bucket]. This parameter is required when the S3 bucket is owned by a different \
         Amazon Web Services account than the one running the ELT job, enabling cross-account \
         access to the intermediate storage bucket.\n"]
  dynamodb_s3_prefix : enclosed_in_string_property option;
      [@ocaml.doc
        "The S3 object key prefix for files stored in the intermediate S3 bucket during the \
         DynamoDB ELT process. This prefix helps organize and identify the temporary files created \
         during data extraction.\n"]
  dynamodb_s3_bucket : enclosed_in_string_property option;
      [@ocaml.doc
        "The name of the Amazon S3 bucket used for intermediate storage during the DynamoDB ELT \
         process. This bucket is used to temporarily store exported DynamoDB data before it is \
         processed by the ELT job.\n"]
  dynamodb_table_arn : enclosed_in_string_property;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the DynamoDB table to extract data from. This parameter \
         specifies the source table for the ELT operation. \n"]
  dynamodb_unnest_ddb_json : boolean_value option;
      [@ocaml.doc
        "A boolean value that specifies whether to unnest DynamoDB JSON format during data \
         extraction. When set to [true], the connector will flatten nested JSON structures from \
         DynamoDB items. When set to [false], the original DynamoDB JSON structure is preserved.\n"]
  dynamodb_export : ddb_export_type option;
      [@ocaml.doc
        "Specifies the export type for DynamoDB data extraction. This parameter determines how \
         data is exported from the DynamoDB table during the ELT process.\n"]
}
[@@ocaml.doc
  "Specifies connection options for DynamoDB ELT (Extract, Load, Transform) operations. This \
   structure contains configuration parameters for connecting to and extracting data from DynamoDB \
   tables using the ELT connector.\n"]

type nonrec dynamo_dbelt_connector_source = {
  output_schemas : glue_schemas option;
      [@ocaml.doc "Specifies the data schema for the DynamoDB ELT connector source.\n"]
  connection_options : ddbelt_connection_options option;
      [@ocaml.doc "The connection options for the DynamoDB ELT connector source.\n"]
  name : node_name; [@ocaml.doc "The name of the DynamoDB ELT connector source.\n"]
}
[@@ocaml.doc
  "Specifies a DynamoDB ELT connector source for extracting data from DynamoDB tables.\n"]

type nonrec code_gen_configuration_node = {
  dynamo_dbelt_connector_source : dynamo_dbelt_connector_source option;
      [@ocaml.doc
        "Specifies a DynamoDB ELT connector source for extracting data from DynamoDB tables.\n"]
  s3_hyper_direct_target : s3_hyper_direct_target option;
      [@ocaml.doc
        "Defines configuration parameters for writing data to Amazon S3 using HyperDirect \
         optimization.\n"]
  s3_excel_source : s3_excel_source option;
      [@ocaml.doc "Defines configuration parameters for reading Excel files from Amazon S3.\n"]
  s3_iceberg_direct_target : s3_iceberg_direct_target option;
      [@ocaml.doc
        "Defines configuration parameters for writing data to Amazon S3 as an Apache Iceberg table.\n"]
  s3_iceberg_catalog_target : s3_iceberg_catalog_target option;
      [@ocaml.doc
        "Specifies an Apache Iceberg catalog target that writes data to Amazon S3 and registers \
         the table in the Glue Data Catalog.\n"]
  catalog_iceberg_source : catalog_iceberg_source option;
      [@ocaml.doc
        "Specifies an Apache Iceberg data source that is registered in the Glue Data Catalog.\n"]
  s3_catalog_iceberg_source : s3_catalog_iceberg_source option;
      [@ocaml.doc
        "Specifies an Apache Iceberg data source that is registered in the Glue Data Catalog. The \
         Iceberg data source must be stored in Amazon S3.\n"]
  connector_data_target : connector_data_target option;
      [@ocaml.doc "Specifies a target generated with standard connection options.\n"]
  connector_data_source : connector_data_source option;
      [@ocaml.doc "Specifies a source generated with standard connection options.\n"]
  snowflake_target : snowflake_target option;
      [@ocaml.doc "Specifies a target that writes to a Snowflake data source.\n"]
  snowflake_source : snowflake_source option; [@ocaml.doc "Specifies a Snowflake data source.\n"]
  recipe : recipe option; [@ocaml.doc "Specifies a Glue DataBrew recipe node.\n"]
  evaluate_data_quality_multi_frame : evaluate_data_quality_multi_frame option;
      [@ocaml.doc
        "Specifies your data quality evaluation criteria. Allows multiple input data and returns a \
         collection of Dynamic Frames.\n"]
  amazon_redshift_target : amazon_redshift_target option;
      [@ocaml.doc "Specifies a target that writes to a data target in Amazon Redshift.\n"]
  amazon_redshift_source : amazon_redshift_source option;
      [@ocaml.doc "Specifies a target that writes to a data source in Amazon Redshift.\n"]
  s3_delta_direct_target : s3_delta_direct_target option;
      [@ocaml.doc "Specifies a target that writes to a Delta Lake data source in Amazon S3.\n"]
  s3_delta_catalog_target : s3_delta_catalog_target option;
      [@ocaml.doc
        "Specifies a target that writes to a Delta Lake data source in the Glue Data Catalog.\n"]
  s3_delta_source : s3_delta_source option;
      [@ocaml.doc "Specifies a Delta Lake data source stored in Amazon S3.\n"]
  catalog_delta_source : catalog_delta_source option;
      [@ocaml.doc
        "Specifies a Delta Lake data source that is registered in the Glue Data Catalog.\n"]
  s3_catalog_delta_source : s3_catalog_delta_source option;
      [@ocaml.doc
        "Specifies a Delta Lake data source that is registered in the Glue Data Catalog. The data \
         source must be stored in Amazon S3.\n"]
  direct_jdbc_source : direct_jdbc_source option; [@ocaml.doc ""]
  s3_hudi_direct_target : s3_hudi_direct_target option;
      [@ocaml.doc "Specifies a target that writes to a Hudi data source in Amazon S3.\n"]
  s3_hudi_catalog_target : s3_hudi_catalog_target option;
      [@ocaml.doc
        "Specifies a target that writes to a Hudi data source in the Glue Data Catalog.\n"]
  s3_hudi_source : s3_hudi_source option;
      [@ocaml.doc "Specifies a Hudi data source stored in Amazon S3.\n"]
  catalog_hudi_source : catalog_hudi_source option;
      [@ocaml.doc "Specifies a Hudi data source that is registered in the Glue Data Catalog.\n"]
  s3_catalog_hudi_source : s3_catalog_hudi_source option;
      [@ocaml.doc
        "Specifies a Hudi data source that is registered in the Glue Data Catalog. The data source \
         must be stored in Amazon S3.\n"]
  evaluate_data_quality : evaluate_data_quality option;
      [@ocaml.doc "Specifies your data quality evaluation criteria.\n"]
  dynamic_transform : dynamic_transform option;
      [@ocaml.doc "Specifies a custom visual transform created by a user.\n"]
  route : route option;
      [@ocaml.doc
        "Specifies a route node that directs data to different output paths based on defined \
         filtering conditions.\n"]
  postgre_sql_catalog_target : postgre_sql_catalog_target option;
      [@ocaml.doc "Specifies a target that uses Postgres SQL.\n"]
  oracle_sql_catalog_target : oracle_sql_catalog_target option;
      [@ocaml.doc "Specifies a target that uses Oracle SQL.\n"]
  my_sql_catalog_target : my_sql_catalog_target option;
      [@ocaml.doc "Specifies a target that uses MySQL.\n"]
  microsoft_sql_server_catalog_target : microsoft_sql_server_catalog_target option;
      [@ocaml.doc "Specifies a target that uses Microsoft SQL.\n"]
  postgre_sql_catalog_source : postgre_sql_catalog_source option;
      [@ocaml.doc "Specifies a PostgresSQL data source in the Glue Data Catalog.\n"]
  oracle_sql_catalog_source : oracle_sql_catalog_source option;
      [@ocaml.doc "Specifies an Oracle data source in the Glue Data Catalog.\n"]
  my_sql_catalog_source : my_sql_catalog_source option;
      [@ocaml.doc "Specifies a MySQL data source in the Glue Data Catalog.\n"]
  microsoft_sql_server_catalog_source : microsoft_sql_server_catalog_source option;
      [@ocaml.doc "Specifies a Microsoft SQL server data source in the Glue Data Catalog.\n"]
  governed_catalog_source : governed_catalog_source option;
      [@ocaml.doc "Specifies a data source in a goverened Data Catalog.\n"]
  governed_catalog_target : governed_catalog_target option;
      [@ocaml.doc "Specifies a data target that writes to a goverened catalog.\n"]
  drop_duplicates : drop_duplicates option;
      [@ocaml.doc "Specifies a transform that removes rows of repeating data from a data set.\n"]
  aggregate : aggregate option;
      [@ocaml.doc
        "Specifies a transform that groups rows by chosen fields and computes the aggregated value \
         by specified function.\n"]
  pii_detection : pii_detection option;
      [@ocaml.doc "Specifies a transform that identifies, removes or masks PII data.\n"]
  union : union option;
      [@ocaml.doc
        "Specifies a transform that combines the rows from two or more datasets into a single \
         result.\n"]
  merge : merge option;
      [@ocaml.doc
        "Specifies a transform that merges a [DynamicFrame] with a staging [DynamicFrame] based on \
         the specified primary keys to identify records. Duplicate records (records with the same \
         primary keys) are not de-duplicated. \n"]
  drop_null_fields : drop_null_fields option;
      [@ocaml.doc
        "Specifies a transform that removes columns from the dataset if all values in the column \
         are 'null'. By default, Glue Studio will recognize null objects, but some values such as \
         empty strings, strings that are \"null\", -1 integers or other placeholders such as \
         zeros, are not automatically recognized as nulls.\n"]
  catalog_kafka_source : catalog_kafka_source option;
      [@ocaml.doc "Specifies an Apache Kafka data store in the Data Catalog.\n"]
  catalog_kinesis_source : catalog_kinesis_source option;
      [@ocaml.doc "Specifies a Kinesis data source in the Glue Data Catalog.\n"]
  direct_kafka_source : direct_kafka_source option;
      [@ocaml.doc "Specifies an Apache Kafka data store.\n"]
  direct_kinesis_source : direct_kinesis_source option;
      [@ocaml.doc "Specifies a direct Amazon Kinesis data source.\n"]
  spark_sq_l : spark_sq_l option;
      [@ocaml.doc
        "Specifies a transform where you enter a SQL query using Spark SQL syntax to transform the \
         data. The output is a single [DynamicFrame].\n"]
  custom_code : custom_code option;
      [@ocaml.doc
        "Specifies a transform that uses custom code you provide to perform the data \
         transformation. The output is a collection of DynamicFrames.\n"]
  filter : filter option;
      [@ocaml.doc
        "Specifies a transform that splits a dataset into two, based on a filter condition.\n"]
  fill_missing_values : fill_missing_values option;
      [@ocaml.doc
        "Specifies a transform that locates records in the dataset that have missing values and \
         adds a new field with a value determined by imputation. The input data set is used to \
         train the machine learning model that determines what the missing value should be.\n"]
  select_from_collection : select_from_collection option;
      [@ocaml.doc
        "Specifies a transform that chooses one [DynamicFrame] from a collection of \
         [DynamicFrames]. The output is the selected [DynamicFrame] \n"]
  split_fields : split_fields option;
      [@ocaml.doc
        "Specifies a transform that splits data property keys into two [DynamicFrames]. The output \
         is a collection of [DynamicFrames]: one with selected data property keys, and one with \
         the remaining data property keys.\n"]
  join : join option;
      [@ocaml.doc
        "Specifies a transform that joins two datasets into one dataset using a comparison phrase \
         on the specified data property keys. You can use inner, outer, left, right, left semi, \
         and left anti joins.\n"]
  spigot : spigot option;
      [@ocaml.doc "Specifies a transform that writes samples of the data to an Amazon S3 bucket.\n"]
  rename_field : rename_field option;
      [@ocaml.doc "Specifies a transform that renames a single data property key.\n"]
  drop_fields : drop_fields option;
      [@ocaml.doc
        "Specifies a transform that chooses the data property keys that you want to drop.\n"]
  select_fields : select_fields option;
      [@ocaml.doc
        "Specifies a transform that chooses the data property keys that you want to keep.\n"]
  apply_mapping : apply_mapping option;
      [@ocaml.doc
        "Specifies a transform that maps data property keys in the data source to data property \
         keys in the data target. You can rename keys, modify the data types for keys, and choose \
         which keys to drop from the dataset.\n"]
  s3_direct_target : s3_direct_target option;
      [@ocaml.doc "Specifies a data target that writes to Amazon S3.\n"]
  s3_glue_parquet_target : s3_glue_parquet_target option;
      [@ocaml.doc
        "Specifies a data target that writes to Amazon S3 in Apache Parquet columnar storage.\n"]
  s3_catalog_target : s3_catalog_target option;
      [@ocaml.doc "Specifies a data target that writes to Amazon S3 using the Glue Data Catalog.\n"]
  redshift_target : redshift_target option;
      [@ocaml.doc "Specifies a target that uses Amazon Redshift.\n"]
  catalog_target : basic_catalog_target option;
      [@ocaml.doc "Specifies a target that uses a Glue Data Catalog table.\n"]
  spark_connector_target : spark_connector_target option;
      [@ocaml.doc "Specifies a target that uses an Apache Spark connector.\n"]
  jdbc_connector_target : jdbc_connector_target option;
      [@ocaml.doc
        "Specifies a data target that writes to Amazon S3 in Apache Parquet columnar storage.\n"]
  dynamo_db_catalog_source : dynamo_db_catalog_source option;
      [@ocaml.doc "Specifies a DynamoDBC Catalog data store in the Glue Data Catalog.\n"]
  relational_catalog_source : relational_catalog_source option;
      [@ocaml.doc "Specifies a relational catalog data store in the Glue Data Catalog.\n"]
  s3_parquet_source : s3_parquet_source option;
      [@ocaml.doc "Specifies an Apache Parquet data store stored in Amazon S3.\n"]
  s3_json_source : s3_json_source option;
      [@ocaml.doc "Specifies a JSON data store stored in Amazon S3.\n"]
  s3_csv_source : s3_csv_source option;
      [@ocaml.doc "Specifies a command-separated value (CSV) data store stored in Amazon S3.\n"]
  s3_catalog_source : s3_catalog_source option;
      [@ocaml.doc "Specifies an Amazon S3 data store in the Glue Data Catalog.\n"]
  redshift_source : redshift_source option;
      [@ocaml.doc "Specifies an Amazon Redshift data store.\n"]
  catalog_source : catalog_source option;
      [@ocaml.doc "Specifies a data store in the Glue Data Catalog.\n"]
  spark_connector_source : spark_connector_source option;
      [@ocaml.doc "Specifies a connector to an Apache Spark data source.\n"]
  jdbc_connector_source : jdbc_connector_source option;
      [@ocaml.doc "Specifies a connector to a JDBC data source.\n"]
  athena_connector_source : athena_connector_source option;
      [@ocaml.doc "Specifies a connector to an Amazon Athena data source.\n"]
}
[@@ocaml.doc
  " [CodeGenConfigurationNode] enumerates all valid Node types. One and only one of its member \
   variables can be populated.\n"]

type nonrec code_gen_configuration_nodes = (node_id * code_gen_configuration_node) list
[@@ocaml.doc ""]

type nonrec generic512_char_string = string [@@ocaml.doc ""]

type nonrec source_control_details = {
  auth_token : generic512_char_string option; [@ocaml.doc "The value of an authorization token.\n"]
  auth_strategy : source_control_auth_strategy option;
      [@ocaml.doc
        "The type of authentication, which can be an authentication token stored in Amazon Web \
         Services Secrets Manager, or a personal access token.\n"]
  last_commit_id : generic512_char_string option;
      [@ocaml.doc "The last commit ID for a commit in the remote repository.\n"]
  folder : generic512_char_string option;
      [@ocaml.doc "An optional folder in the remote repository.\n"]
  branch : generic512_char_string option;
      [@ocaml.doc "An optional branch in the remote repository.\n"]
  owner : generic512_char_string option;
      [@ocaml.doc "The owner of the remote repository that contains the job artifacts.\n"]
  repository : generic512_char_string option;
      [@ocaml.doc "The name of the remote repository that contains the job artifacts.\n"]
  provider : source_control_provider option; [@ocaml.doc "The provider for the remote repository.\n"]
}
[@@ocaml.doc
  "The details for a source control configuration for a job, allowing synchronization of job \
   artifacts to or from a remote repository.\n"]

type nonrec job_update = {
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "This field specifies a day of the week and hour for a maintenance window for streaming \
         jobs. Glue periodically performs maintenance activities. During these maintenance \
         windows, Glue will need to restart your streaming jobs.\n\n\
        \ Glue will restart the job within 3 hours of the specified maintenance window. For \
         instance, if you set up the maintenance window for Monday at 10:00AM GMT, your jobs will \
         be restarted between 10:00AM GMT to 1:00PM GMT.\n\
        \ "]
  source_control_details : source_control_details option;
      [@ocaml.doc
        "The details for a source control configuration for a job, allowing synchronization of job \
         artifacts to or from a remote repository.\n"]
  execution_class : execution_class option;
      [@ocaml.doc
        "Indicates whether the job is run with a standard or flexible execution class. The \
         standard execution-class is ideal for time-sensitive workloads that require fast job \
         startup and dedicated resources.\n\n\
        \ The flexible execution class is appropriate for time-insensitive jobs whose start and \
         completion times may vary. \n\
        \ \n\
        \  Only jobs with Glue version 3.0 and above and command type [glueetl] will be allowed to \
         set [ExecutionClass] to [FLEX]. The flexible execution class is available for Spark jobs.\n\
        \  "]
  code_gen_configuration_nodes : code_gen_configuration_nodes option;
      [@ocaml.doc
        "The representation of a directed acyclic graph on which both the Glue Studio visual \
         component and Glue Studio code generation is based.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "In Spark jobs, [GlueVersion] determines the versions of Apache Spark and Python that Glue \
         available in a job. The Python version indicates the version supported for jobs of type \
         Spark. \n\n\
        \ Ray jobs should set [GlueVersion] to [4.0] or greater. However, the versions of Ray, \
         Python and additional libraries available in your Ray job are determined by the [Runtime] \
         parameter of the Job command.\n\
        \ \n\
        \  For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \  \n\
        \   If not provided in the update request, the Glue version retains the value from the \
         existing job definition.\n\
        \   "]
  notification_property : notification_property option;
      [@ocaml.doc "Specifies the configuration properties of a job notification.\n"]
  security_configuration : name_string option;
      [@ocaml.doc "The name of the [SecurityConfiguration] structure to be used with this job.\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when a job runs.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a job runs. Accepts a value of G.1X, \
         G.2X, G.4X, G.8X or G.025X for Spark jobs. Accepts the value Z.2X for Ray jobs. For more \
         information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html#create-job}Defining job \
         properties for Spark jobs } \n"]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "For Glue version 1.0 or earlier jobs, using the standard worker type, the number of Glue \
         data processing units (DPUs) that can be allocated when this job runs. A DPU is a \
         relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 \
         GB of memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/} Glue \
         pricing page}.\n\n\
        \ For Glue version 2.0+ jobs, you cannot specify a [Maximum capacity]. Instead, you should \
         specify a [Worker type] and the [Number of workers].\n\
        \ \n\
        \  Do not set [MaxCapacity] if using [WorkerType] and [NumberOfWorkers].\n\
        \  \n\
        \   The value that can be allocated for [MaxCapacity] depends on whether you are running a \
         Python shell job, an Apache Spark ETL job, or an Apache Spark streaming ETL job:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you specify a Python shell job ([JobCommand.Name]=\"pythonshell\"), \
         you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.\n\
        \              \n\
        \               }\n\
        \          {-  When you specify an Apache Spark ETL job ([JobCommand.Name]=\"glueetl\") or \
         Apache Spark streaming ETL job ([JobCommand.Name]=\"gluestreaming\"), you can allocate \
         from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU \
         allocation.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  timeout : timeout option;
      [@ocaml.doc
        "The job timeout in minutes. This is the maximum time that a job run can consume resources \
         before it is terminated and enters [TIMEOUT] status.\n\n\
        \ Jobs must have timeout values less than 7 days or 10080 minutes. Otherwise, the jobs \
         will throw an exception.\n\
        \ \n\
        \  When the value is left blank, the timeout is defaulted to 2,880 minutes for Glue \
         version 4.0 and earlier, or 480 minutes for Glue version 5.0 and later.\n\
        \  \n\
        \   Any existing Glue jobs that had a timeout value greater than 7 days will be defaulted \
         to 7 days. For instance if you have specified a timeout of 20 days for a batch job, it \
         will be stopped on the 7th day.\n\
        \   \n\
        \    For streaming jobs, if you have set up a maintenance window, it will be restarted \
         during the maintenance window after 7 days.\n\
        \    "]
  allocated_capacity : integer_value option;
      [@ocaml.doc
        "This field is deprecated. Use [MaxCapacity] instead.\n\n\
        \ The number of Glue data processing units (DPUs) to allocate to this job. You can \
         allocate a minimum of 2 DPUs; the default is 10. A DPU is a relative measure of \
         processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For \
         more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue pricing page}.\n\
        \ "]
  max_retries : max_retries option;
      [@ocaml.doc "The maximum number of times to retry this job if it fails.\n"]
  connections : connections_list option; [@ocaml.doc "The connections used for this job.\n"]
  non_overridable_arguments : generic_map option;
      [@ocaml.doc
        "Arguments for this job that are not overridden when providing job arguments in a job run, \
         specified as name-value pairs.\n"]
  default_arguments : generic_map option;
      [@ocaml.doc
        "The default arguments for every run of this job, specified as name-value pairs.\n\n\
        \ You can specify arguments here that your own job-execution script consumes, as well as \
         arguments that Glue itself consumes.\n\
        \ \n\
        \  Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve \
         secrets from a Glue Connection, Secrets Manager or other secret management mechanism if \
         you intend to keep them within the Job. \n\
        \  \n\
        \   For information about how to specify and consume your own Job arguments, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html}Calling \
         Glue APIs in Python} topic in the developer guide.\n\
        \   \n\
        \    For information about the arguments you can provide to this field when configuring \
         Spark jobs, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Special \
         Parameters Used by Glue} topic in the developer guide.\n\
        \    \n\
        \     For information about the arguments you can provide to this field when configuring \
         Ray jobs, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/author-job-ray-job-parameters.html}Using \
         job parameters in Ray jobs} in the developer guide.\n\
        \     "]
  command : job_command option; [@ocaml.doc "The [JobCommand] that runs this job (required).\n"]
  execution_property : execution_property option;
      [@ocaml.doc
        "An [ExecutionProperty] specifying the maximum number of concurrent runs allowed for this \
         job.\n"]
  role : role_string option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role associated with this job (required).\n"]
  log_uri : uri_string option; [@ocaml.doc "This field is reserved for future use.\n"]
  description : description_string option; [@ocaml.doc "Description of the job being defined.\n"]
  job_run_queuing_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether job run queuing is enabled for the job runs for this job.\n\n\
        \ A value of true means job run queuing is enabled for the job runs. If false or not \
         populated, the job runs will not be considered for queueing.\n\
        \ \n\
        \  If this field does not match the value set in the job run, then the value from the job \
         run field will be used.\n\
        \  "]
  job_mode : job_mode option;
      [@ocaml.doc
        "A mode that describes how a job was created. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [SCRIPT] - The job was created using the Glue Studio script editor.\n\
        \           \n\
        \            }\n\
        \       {-   [VISUAL] - The job was created using the Glue Studio visual editor.\n\
        \           \n\
        \            }\n\
        \       {-   [NOTEBOOK] - The job was created using an interactive sessions notebook.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When the [JobMode] field is missing or null, [SCRIPT] is assigned as the default value.\n\
        \   "]
}
[@@ocaml.doc
  "Specifies information used to update an existing job definition. The previous job definition is \
   completely overwritten by this information.\n"]

type nonrec update_job_request = {
  job_update : job_update;
      [@ocaml.doc
        "Specifies the values with which to update the job definition. Unspecified configuration \
         is removed or reset to default values.\n"]
  job_name : name_string; [@ocaml.doc "The name of the job definition to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_job_from_source_control_response = {
  job_name : name_string option; [@ocaml.doc "The name of the Glue job.\n"]
}
[@@ocaml.doc ""]

type nonrec update_job_from_source_control_request = {
  auth_token : auth_token_string option; [@ocaml.doc "The value of the authorization token.\n"]
  auth_strategy : source_control_auth_strategy option;
      [@ocaml.doc
        "The type of authentication, which can be an authentication token stored in Amazon Web \
         Services Secrets Manager, or a personal access token.\n"]
  commit_id : commit_id_string option;
      [@ocaml.doc "A commit ID for a commit in the remote repository.\n"]
  folder : name_string option; [@ocaml.doc "An optional folder in the remote repository.\n"]
  branch_name : name_string option; [@ocaml.doc "An optional branch in the remote repository.\n"]
  repository_owner : name_string option;
      [@ocaml.doc "The owner of the remote repository that contains the job artifacts.\n"]
  repository_name : name_string option;
      [@ocaml.doc
        "The name of the remote repository that contains the job artifacts. For BitBucket \
         providers, [RepositoryName] should include [WorkspaceName]. Use the format \n\
         {[\n\
         /\n\
         ]}\n\
         . \n"]
  provider : source_control_provider option;
      [@ocaml.doc
        " The provider for the remote repository. Possible values: GITHUB, AWS_CODE_COMMIT, \
         GITLAB, BITBUCKET. \n"]
  job_name : name_string option;
      [@ocaml.doc "The name of the Glue job to be synchronized to or from the remote repository.\n"]
}
[@@ocaml.doc ""]

type nonrec update_integration_table_properties_response = unit [@@ocaml.doc ""]

type nonrec string512 = string [@@ocaml.doc ""]

type nonrec string128 = string [@@ocaml.doc ""]

type nonrec source_table_fields_list = string128 list [@@ocaml.doc ""]

type nonrec primary_key_list = string128 list [@@ocaml.doc ""]

type nonrec source_table_config = {
  record_update_field : string128 option;
      [@ocaml.doc "Incremental pull timestamp-based field. Currently unsupported.\n"]
  primary_key : primary_key_list option;
      [@ocaml.doc
        "Provide the primary key set for this table. Currently supported specifically for SAP \
         [EntityOf] entities upon request. Contact Amazon Web Services Support to make this \
         feature available.\n"]
  filter_predicate : string128 option;
      [@ocaml.doc "A condition clause used for row-level filtering. Currently unsupported.\n"]
  fields : source_table_fields_list option;
      [@ocaml.doc "A list of fields used for column-level filtering. Currently unsupported.\n"]
}
[@@ocaml.doc "Properties used by the source leg to process data from the source.\n"]

type nonrec unnest_spec =
  | NOUNNEST [@ocaml.doc ""]
  | FULL [@ocaml.doc ""]
  | TOPLEVEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integration_partition = {
  conversion_spec : string128 option;
      [@ocaml.doc
        "Specifies the timestamp format of the source data. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [epoch_sec] - Unix epoch timestamp in seconds\n\
        \           \n\
        \            }\n\
        \       {-   [epoch_milli] - Unix epoch timestamp in milliseconds\n\
        \           \n\
        \            }\n\
        \       {-   [iso] - ISO 8601 formatted timestamp\n\
        \           \n\
        \            }\n\
        \       }\n\
        \     Only specify [ConversionSpec] when using timestamp-based partition functions (year, \
         month, day, or hour). Glue Zero-ETL uses this parameter to correctly transform source \
         data into timestamp format before partitioning. \n\
        \    \n\
        \      Do not use high-cardinality columns with the [identity] partition function. \
         High-cardinality columns include: \n\
        \     \n\
        \      {ul\n\
        \            {-  Primary keys\n\
        \                \n\
        \                 }\n\
        \            {-  Timestamp fields (such as [LastModifiedTimestamp], [CreatedDate])\n\
        \                \n\
        \                 }\n\
        \            {-  System-generated timestamps\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    Using high-cardinality columns with identity partitioning creates many small \
         partitions, which can significantly degrade ingestion performance. \n\
        \   \n\
        \    "]
  function_spec : string128 option;
      [@ocaml.doc
        "Specifies the function used to partition data on the target. The accepted values for this \
         parameter are:\n\n\
        \ {ul\n\
        \       {-   [identity] - Uses source values directly without transformation\n\
        \           \n\
        \            }\n\
        \       {-   [year] - Extracts the year from timestamp values (e.g., 2023)\n\
        \           \n\
        \            }\n\
        \       {-   [month] - Extracts the month from timestamp values (e.g., 2023-01)\n\
        \           \n\
        \            }\n\
        \       {-   [day] - Extracts the day from timestamp values (e.g., 2023-01-15)\n\
        \           \n\
        \            }\n\
        \       {-   [hour] - Extracts the hour from timestamp values (e.g., 2023-01-15-14)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  field_name : string128 option;
      [@ocaml.doc
        "The field name used to partition data on the target. Avoid using columns that have unique \
         values for each row (for example, `LastModifiedTimestamp`, `SystemModTimeStamp`) as the \
         partition column. These columns are not suitable for partitioning because they create a \
         large number of small partitions, which can lead to performance issues.\n"]
}
[@@ocaml.doc "A structure that describes how data is partitioned on the target.\n"]

type nonrec integration_partition_spec_list = integration_partition list [@@ocaml.doc ""]

type nonrec target_table_config = {
  target_table_name : string128 option; [@ocaml.doc "The optional name of a target table.\n"]
  partition_spec : integration_partition_spec_list option;
      [@ocaml.doc "Determines the file layout on the target.\n"]
  unnest_spec : unnest_spec option;
      [@ocaml.doc
        "Specifies how nested objects are flattened to top-level elements. Valid values are: \
         \"TOPLEVEL\", \"FULL\", or \"NOUNNEST\".\n"]
}
[@@ocaml.doc "Properties used by the target leg to partition the data on the target.\n"]

type nonrec update_integration_table_properties_request = {
  target_table_config : target_table_config option;
      [@ocaml.doc "A structure for the target table configuration.\n"]
  source_table_config : source_table_config option;
      [@ocaml.doc "A structure for the source table configuration.\n"]
  table_name : string128; [@ocaml.doc "The name of the table to be replicated.\n"]
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The resource could not be found.\n"]

type nonrec internal_server_exception = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "An internal server error occurred.\n"]

type nonrec source_processing_properties = {
  role_arn : string128 option; [@ocaml.doc "The IAM role to access the Glue connection.\n"]
}
[@@ocaml.doc "The resource properties associated with the integration source.\n"]

type nonrec string2048 = string [@@ocaml.doc ""]

type nonrec target_processing_properties = {
  event_bus_arn : string2048 option;
      [@ocaml.doc
        "The ARN of an Eventbridge event bus to receive the integration status notification.\n"]
  connection_name : string128 option;
      [@ocaml.doc
        "The Glue network connection to configure the Glue job running in the customer VPC.\n"]
  kms_arn : string2048 option; [@ocaml.doc "The ARN of the KMS key used for encryption.\n"]
  role_arn : string128 option; [@ocaml.doc "The IAM role to access the Glue database.\n"]
}
[@@ocaml.doc "The resource properties associated with the integration target.\n"]

type nonrec update_integration_resource_property_response = {
  target_processing_properties : target_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration target.\n"]
  source_processing_properties : source_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration source.\n"]
  resource_property_arn : string512 option;
      [@ocaml.doc
        "The resource ARN created through this create API. The format is something like \
         arn:aws:glue:::integrationresourceproperty/*\n"]
  resource_arn : string512 option;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec update_integration_resource_property_request = {
  target_processing_properties : target_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration target.\n"]
  source_processing_properties : source_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration source.\n"]
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec grok_pattern = string [@@ocaml.doc ""]

type nonrec custom_patterns = string [@@ocaml.doc ""]

type nonrec update_grok_classifier_request = {
  custom_patterns : custom_patterns option;
      [@ocaml.doc "Optional custom grok patterns used by this classifier.\n"]
  grok_pattern : grok_pattern option; [@ocaml.doc "The grok pattern used by this classifier.\n"]
  classification : classification option;
      [@ocaml.doc
        "An identifier of the data format that the classifier matches, such as Twitter, JSON, \
         Omniture logs, Amazon CloudWatch Logs, and so on.\n"]
  name : name_string; [@ocaml.doc "The name of the [GrokClassifier].\n"]
}
[@@ocaml.doc "Specifies a grok classifier to update when passed to [UpdateClassifier].\n"]

type nonrec update_glue_identity_center_configuration_response = unit [@@ocaml.doc ""]

type nonrec identity_center_scope = string [@@ocaml.doc ""]

type nonrec identity_center_scopes_list = identity_center_scope list [@@ocaml.doc ""]

type nonrec update_glue_identity_center_configuration_request = {
  user_background_sessions_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether users can run background sessions when using Identity Center \
         authentication with Glue services.\n"]
  scopes : identity_center_scopes_list option;
      [@ocaml.doc
        "A list of Identity Center scopes that define the updated permissions and access levels \
         for the Glue configuration.\n"]
}
[@@ocaml.doc "Request to update an existing Glue Identity Center configuration.\n"]

type nonrec glossary_term_id = string [@@ocaml.doc ""]

type nonrec glossary_id = string [@@ocaml.doc ""]

type nonrec glossary_term_name = string [@@ocaml.doc ""]

type nonrec glossary_short_description = string [@@ocaml.doc ""]

type nonrec glossary_long_description = string [@@ocaml.doc ""]

type nonrec update_glossary_term_response = {
  long_description : glossary_long_description option;
      [@ocaml.doc "The long description of the glossary term.\n"]
  short_description : glossary_short_description option;
      [@ocaml.doc "The short description of the glossary term.\n"]
  name : glossary_term_name option; [@ocaml.doc "The name of the glossary term.\n"]
  glossary_id : glossary_id option;
      [@ocaml.doc "The unique identifier of the glossary containing this term.\n"]
  id : glossary_term_id option; [@ocaml.doc "The unique identifier of the glossary term.\n"]
}
[@@ocaml.doc ""]

type nonrec update_glossary_term_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  long_description : glossary_long_description option;
      [@ocaml.doc "The updated long description of the glossary term.\n"]
  short_description : glossary_short_description option;
      [@ocaml.doc "The updated short description of the glossary term.\n"]
  name : glossary_term_name option; [@ocaml.doc "The updated name of the glossary term.\n"]
  identifier : glossary_term_id;
      [@ocaml.doc "The unique identifier of the glossary term to update.\n"]
}
[@@ocaml.doc ""]

type nonrec glossary_name = string [@@ocaml.doc ""]

type nonrec metadata_description = string [@@ocaml.doc ""]

type nonrec update_glossary_response = {
  description : metadata_description option; [@ocaml.doc "The description of the glossary.\n"]
  name : glossary_name option; [@ocaml.doc "The name of the glossary.\n"]
  id : glossary_id option; [@ocaml.doc "The unique identifier of the glossary.\n"]
}
[@@ocaml.doc ""]

type nonrec update_glossary_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  description : metadata_description option;
      [@ocaml.doc "The updated description of the glossary.\n"]
  name : glossary_name option; [@ocaml.doc "The updated name of the glossary.\n"]
  identifier : glossary_id; [@ocaml.doc "The unique identifier of the glossary to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_dev_endpoint_response = unit [@@ocaml.doc ""]

type nonrec public_keys_list = generic_string list [@@ocaml.doc ""]

type nonrec dev_endpoint_custom_libraries = {
  extra_jars_s3_path : generic_string option;
      [@ocaml.doc
        "The path to one or more Java [.jar] files in an S3 bucket that should be loaded in your \
         [DevEndpoint].\n\n\
        \  You can only use pure Java/Scala libraries with a [DevEndpoint].\n\
        \  \n\
        \   "]
  extra_python_libs_s3_path : generic_string option;
      [@ocaml.doc
        "The paths to one or more Python libraries in an Amazon Simple Storage Service (Amazon S3) \
         bucket that should be loaded in your [DevEndpoint]. Multiple values must be complete \
         paths separated by a comma.\n\n\
        \  You can only use pure Python libraries with a [DevEndpoint]. Libraries that rely on C \
         extensions, such as the {{:http://pandas.pydata.org/}pandas} Python data analysis \
         library, are not currently supported.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Custom libraries to be loaded into a development endpoint.\n"]

type nonrec string_list = generic_string list [@@ocaml.doc ""]

type nonrec map_value = (generic_string * generic_string) list [@@ocaml.doc ""]

type nonrec update_dev_endpoint_request = {
  add_arguments : map_value option;
      [@ocaml.doc
        "The map of arguments to add the map of arguments used to configure the [DevEndpoint].\n\n\
        \ Valid arguments are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [\"--enable-glue-datacatalog\": \"\"] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can specify a version of Python support for development endpoints by using the \
         [Arguments] parameter in the [CreateDevEndpoint] or [UpdateDevEndpoint] APIs. If no \
         arguments are provided, the version defaults to Python 2.\n\
        \   "]
  delete_arguments : string_list option;
      [@ocaml.doc
        "The list of argument keys to be deleted from the map of arguments used to configure the \
         [DevEndpoint].\n"]
  update_etl_libraries : boolean_value option;
      [@ocaml.doc
        " [True] if the list of custom libraries to be loaded in the development endpoint needs to \
         be updated, or [False] if otherwise.\n"]
  custom_libraries : dev_endpoint_custom_libraries option;
      [@ocaml.doc "Custom Python or Java libraries to be loaded in the [DevEndpoint].\n"]
  delete_public_keys : public_keys_list option;
      [@ocaml.doc "The list of public keys to be deleted from the [DevEndpoint].\n"]
  add_public_keys : public_keys_list option;
      [@ocaml.doc "The list of public keys for the [DevEndpoint] to use.\n"]
  public_key : generic_string option; [@ocaml.doc "The public key for the [DevEndpoint] to use.\n"]
  endpoint_name : generic_string; [@ocaml.doc "The name of the [DevEndpoint] to be updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_database_response = unit [@@ocaml.doc ""]

type nonrec data_lake_principal_string = string [@@ocaml.doc ""]

type nonrec data_lake_principal = {
  data_lake_principal_identifier : data_lake_principal_string option;
      [@ocaml.doc "An identifier for the Lake Formation principal.\n"]
}
[@@ocaml.doc "The Lake Formation principal.\n"]

type nonrec permission =
  | DATA_LOCATION_ACCESS [@ocaml.doc ""]
  | CREATE_TABLE [@ocaml.doc ""]
  | CREATE_DATABASE [@ocaml.doc ""]
  | INSERT [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | DROP [@ocaml.doc ""]
  | ALTER [@ocaml.doc ""]
  | SELECT [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec permission_list = permission list [@@ocaml.doc ""]

type nonrec principal_permissions = {
  permissions : permission_list option;
      [@ocaml.doc "The permissions that are granted to the principal.\n"]
  principal : data_lake_principal option; [@ocaml.doc "The principal who is granted permissions.\n"]
}
[@@ocaml.doc "Permissions granted to a principal.\n"]

type nonrec principal_permissions_list = principal_permissions list [@@ocaml.doc ""]

type nonrec database_identifier = {
  region : name_string option; [@ocaml.doc "Region of the target database.\n"]
  database_name : name_string option; [@ocaml.doc "The name of the catalog database.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the database resides.\n"]
}
[@@ocaml.doc "A structure that describes a target database for resource linking.\n"]

type nonrec federation_identifier = string [@@ocaml.doc ""]

type nonrec federated_database = {
  connection_type : name_string option;
      [@ocaml.doc
        "The type of connection used to access the federated database, such as JDBC, ODBC, or \
         other supported connection protocols.\n"]
  connection_name : name_string option;
      [@ocaml.doc "The name of the connection to the external metastore.\n"]
  identifier : federation_identifier option;
      [@ocaml.doc "A unique identifier for the federated database.\n"]
}
[@@ocaml.doc "A database that points to an entity outside the Glue Data Catalog.\n"]

type nonrec database_input = {
  federated_database : federated_database option;
      [@ocaml.doc
        "A [FederatedDatabase] structure that references an entity outside the Glue Data Catalog.\n"]
  target_database : database_identifier option;
      [@ocaml.doc
        "A [DatabaseIdentifier] structure that describes a target database for resource linking.\n"]
  create_table_default_permissions : principal_permissions_list option;
      [@ocaml.doc
        "Creates a set of default permissions on the table for principals. Used by Lake Formation. \
         Not used in the normal course of Glue operations.\n"]
  parameters : parameters_map option;
      [@ocaml.doc
        "These key-value pairs define parameters and properties of the database.\n\n\
        \ These key-value pairs define parameters and properties of the database.\n\
        \ "]
  location_uri : ur_i option;
      [@ocaml.doc "The location of the database (for example, an HDFS path). \n"]
  description : description_string option; [@ocaml.doc "A description of the database.\n"]
  name : name_string;
      [@ocaml.doc
        "The name of the database. For Hive compatibility, this is folded to lowercase when it is \
         stored.\n"]
}
[@@ocaml.doc "The structure used to create or update a database.\n"]

type nonrec update_database_request = {
  database_input : database_input;
      [@ocaml.doc
        "A [DatabaseInput] object specifying the new definition of the metadata database in the \
         catalog.\n"]
  name : name_string;
      [@ocaml.doc
        "The name of the database to update in the catalog. For Hive compatibility, this is folded \
         to lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the metadata database resides. If none is provided, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_ruleset_string = string [@@ocaml.doc ""]

type nonrec update_data_quality_ruleset_response = {
  ruleset : data_quality_ruleset_string option;
      [@ocaml.doc
        "A Data Quality Definition Language (DQDL) ruleset. For more information, see the Glue \
         developer guide.\n"]
  description : description_string option; [@ocaml.doc "A description of the ruleset.\n"]
  name : name_string option; [@ocaml.doc "The name of the data quality ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec update_data_quality_ruleset_request = {
  ruleset : data_quality_ruleset_string option;
      [@ocaml.doc
        "A Data Quality Definition Language (DQDL) ruleset. For more information, see the Glue \
         developer guide.\n"]
  description : description_string option; [@ocaml.doc "A description of the ruleset.\n"]
  name : name_string; [@ocaml.doc "The name of the data quality ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec idempotent_parameter_mismatch_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The same unique identifier was associated with two different records.\n"]

type nonrec csv_column_delimiter = string [@@ocaml.doc ""]

type nonrec csv_quote_symbol = string [@@ocaml.doc ""]

type nonrec csv_header_option =
  | ABSENT [@ocaml.doc ""]
  | PRESENT [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec csv_header = name_string list [@@ocaml.doc ""]

type nonrec custom_datatypes = name_string list [@@ocaml.doc ""]

type nonrec csv_serde_option =
  | None_ [@ocaml.doc ""]
  | LazySimpleSerDe [@ocaml.doc ""]
  | OpenCSVSerDe [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_csv_classifier_request = {
  serde : csv_serde_option option;
      [@ocaml.doc
        "Sets the SerDe for processing CSV in the classifier, which will be applied in the Data \
         Catalog. Valid values are [OpenCSVSerDe], [LazySimpleSerDe], and [None]. You can specify \
         the [None] value when you want the crawler to do the detection.\n"]
  custom_datatypes : custom_datatypes option;
      [@ocaml.doc "Specifies a list of supported custom datatypes.\n"]
  custom_datatype_configured : nullable_boolean option;
      [@ocaml.doc "Specifies the configuration of custom datatypes.\n"]
  allow_single_column : nullable_boolean option;
      [@ocaml.doc "Enables the processing of files that contain only one column.\n"]
  disable_value_trimming : nullable_boolean option;
      [@ocaml.doc
        "Specifies not to trim values before identifying the type of column values. The default \
         value is true.\n"]
  header : csv_header option; [@ocaml.doc "A list of strings representing column names.\n"]
  contains_header : csv_header_option option;
      [@ocaml.doc "Indicates whether the CSV file contains a header.\n"]
  quote_symbol : csv_quote_symbol option;
      [@ocaml.doc
        "A custom symbol to denote what combines content into a single column value. It must be \
         different from the column delimiter.\n"]
  delimiter : csv_column_delimiter option;
      [@ocaml.doc "A custom symbol to denote what separates each column entry in the row.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "Specifies a custom CSV classifier to be updated.\n"]

type nonrec update_crawler_schedule_response = unit [@@ocaml.doc ""]

type nonrec cron_expression = string [@@ocaml.doc ""]

type nonrec update_crawler_schedule_request = {
  schedule : cron_expression option;
      [@ocaml.doc
        "The updated [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n"]
  crawler_name : name_string; [@ocaml.doc "The name of the crawler whose schedule to update.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduler_transitioning_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The specified scheduler is transitioning.\n"]

type nonrec update_crawler_response = unit [@@ocaml.doc ""]

type nonrec role = string [@@ocaml.doc ""]

type nonrec database_name = string [@@ocaml.doc ""]

type nonrec description_string_removable = string [@@ocaml.doc ""]

type nonrec path = string [@@ocaml.doc ""]

type nonrec path_list = path list [@@ocaml.doc ""]

type nonrec connection_name = string [@@ocaml.doc ""]

type nonrec event_queue_arn = string [@@ocaml.doc ""]

type nonrec s3_target = {
  dlq_event_queue_arn : event_queue_arn option;
      [@ocaml.doc
        "A valid Amazon dead-letter SQS ARN. For example, \
         [arn:aws:sqs:region:account:deadLetterQueue].\n"]
  event_queue_arn : event_queue_arn option;
      [@ocaml.doc "A valid Amazon SQS ARN. For example, [arn:aws:sqs:region:account:sqs].\n"]
  sample_size : nullable_integer option;
      [@ocaml.doc
        "Sets the number of files in each leaf folder to be crawled when crawling sample files in \
         a dataset. If not set, all the files are crawled. A valid value is an integer between 1 \
         and 249.\n"]
  connection_name : connection_name option;
      [@ocaml.doc
        "The name of a connection which allows a job or crawler to access data in Amazon S3 within \
         an Amazon Virtual Private Cloud environment (Amazon VPC).\n"]
  exclusions : path_list option;
      [@ocaml.doc
        "A list of glob patterns used to exclude from the crawl. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html}Catalog Tables with a \
         Crawler}.\n"]
  path : path option; [@ocaml.doc "The path to the Amazon S3 target.\n"]
}
[@@ocaml.doc "Specifies a data store in Amazon Simple Storage Service (Amazon S3).\n"]

type nonrec s3_target_list = s3_target list [@@ocaml.doc ""]

type nonrec jdbc_metadata_entry = RAWTYPES [@ocaml.doc ""] | COMMENTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec enable_additional_metadata = jdbc_metadata_entry list [@@ocaml.doc ""]

type nonrec jdbc_target = {
  enable_additional_metadata : enable_additional_metadata option;
      [@ocaml.doc
        "Specify a value of [RAWTYPES] or [COMMENTS] to enable additional metadata in table \
         responses. [RAWTYPES] provides the native-level datatype. [COMMENTS] provides comments \
         associated with a column or table in the database.\n\n\
        \ If you do not need additional metadata, keep the field empty.\n\
        \ "]
  exclusions : path_list option;
      [@ocaml.doc
        "A list of glob patterns used to exclude from the crawl. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html}Catalog Tables with a \
         Crawler}.\n"]
  path : path option; [@ocaml.doc "The path of the JDBC target.\n"]
  connection_name : connection_name option;
      [@ocaml.doc "The name of the connection to use to connect to the JDBC target.\n"]
}
[@@ocaml.doc "Specifies a JDBC data store to crawl.\n"]

type nonrec jdbc_target_list = jdbc_target list [@@ocaml.doc ""]

type nonrec mongo_db_target = {
  scan_all : nullable_boolean option;
      [@ocaml.doc
        "Indicates whether to scan all the records, or to sample rows from the table. Scanning all \
         the records can take a long time when the table is not a high throughput table.\n\n\
        \ A value of [true] means to scan all records, while a value of [false] means to sample \
         the records. If no value is specified, the value defaults to [true].\n\
        \ "]
  path : path option;
      [@ocaml.doc "The path of the Amazon DocumentDB or MongoDB target (database/collection).\n"]
  connection_name : connection_name option;
      [@ocaml.doc
        "The name of the connection to use to connect to the Amazon DocumentDB or MongoDB target.\n"]
}
[@@ocaml.doc "Specifies an Amazon DocumentDB or MongoDB data store to crawl.\n"]

type nonrec mongo_db_target_list = mongo_db_target list [@@ocaml.doc ""]

type nonrec dynamo_db_target = {
  scan_rate : nullable_double option;
      [@ocaml.doc
        "The percentage of the configured read capacity units to use by the Glue crawler. Read \
         capacity units is a term defined by DynamoDB, and is a numeric value that acts as rate \
         limiter for the number of reads that can be performed on that table per second.\n\n\
        \ The valid values are null or a value between 0.1 to 1.5. A null value is used when user \
         does not provide a value, and defaults to 0.5 of the configured Read Capacity Unit (for \
         provisioned tables), or 0.25 of the max configured Read Capacity Unit (for tables using \
         on-demand mode).\n\
        \ "]
  scan_all : nullable_boolean option;
      [@ocaml.doc
        "Indicates whether to scan all the records, or to sample rows from the table. Scanning all \
         the records can take a long time when the table is not a high throughput table.\n\n\
        \ A value of [true] means to scan all records, while a value of [false] means to sample \
         the records. If no value is specified, the value defaults to [true].\n\
        \ "]
  path : path option; [@ocaml.doc "The name of the DynamoDB table to crawl.\n"]
}
[@@ocaml.doc "Specifies an Amazon DynamoDB table to crawl.\n"]

type nonrec dynamo_db_target_list = dynamo_db_target list [@@ocaml.doc ""]

type nonrec catalog_tables_list = name_string list [@@ocaml.doc ""]

type nonrec catalog_target = {
  dlq_event_queue_arn : event_queue_arn option;
      [@ocaml.doc
        "A valid Amazon dead-letter SQS ARN. For example, \
         [arn:aws:sqs:region:account:deadLetterQueue].\n"]
  event_queue_arn : event_queue_arn option;
      [@ocaml.doc "A valid Amazon SQS ARN. For example, [arn:aws:sqs:region:account:sqs].\n"]
  connection_name : connection_name option;
      [@ocaml.doc
        "The name of the connection for an Amazon S3-backed Data Catalog table to be a target of \
         the crawl when using a [Catalog] connection type paired with a [NETWORK] Connection type.\n"]
  tables : catalog_tables_list; [@ocaml.doc "A list of the tables to be synchronized.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database to be synchronized.\n"]
}
[@@ocaml.doc "Specifies an Glue Data Catalog target.\n"]

type nonrec catalog_target_list = catalog_target list [@@ocaml.doc ""]

type nonrec delta_target = {
  create_native_delta_table : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether the crawler will create native tables, to allow integration with query \
         engines that support querying of the Delta transaction log directly.\n"]
  write_manifest : nullable_boolean option;
      [@ocaml.doc "Specifies whether to write the manifest files to the Delta table path.\n"]
  connection_name : connection_name option;
      [@ocaml.doc "The name of the connection to use to connect to the Delta table target.\n"]
  delta_tables : path_list option;
      [@ocaml.doc "A list of the Amazon S3 paths to the Delta tables.\n"]
}
[@@ocaml.doc "Specifies a Delta data store to crawl one or more Delta tables.\n"]

type nonrec delta_target_list = delta_target list [@@ocaml.doc ""]

type nonrec iceberg_target = {
  maximum_traversal_depth : nullable_integer option;
      [@ocaml.doc
        "The maximum depth of Amazon S3 paths that the crawler can traverse to discover the \
         Iceberg metadata folder in your Amazon S3 path. Used to limit the crawler run time.\n"]
  exclusions : path_list option;
      [@ocaml.doc
        "A list of glob patterns used to exclude from the crawl. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html}Catalog Tables with a \
         Crawler}.\n"]
  connection_name : connection_name option;
      [@ocaml.doc "The name of the connection to use to connect to the Iceberg target.\n"]
  paths : path_list option;
      [@ocaml.doc
        "One or more Amazon S3 paths that contains Iceberg metadata folders as [s3://bucket/prefix].\n"]
}
[@@ocaml.doc
  "Specifies an Apache Iceberg data source where Iceberg tables are stored in Amazon S3.\n"]

type nonrec iceberg_target_list = iceberg_target list [@@ocaml.doc ""]

type nonrec hudi_target = {
  maximum_traversal_depth : nullable_integer option;
      [@ocaml.doc
        "The maximum depth of Amazon S3 paths that the crawler can traverse to discover the Hudi \
         metadata folder in your Amazon S3 path. Used to limit the crawler run time.\n"]
  exclusions : path_list option;
      [@ocaml.doc
        "A list of glob patterns used to exclude from the crawl. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html}Catalog Tables with a \
         Crawler}.\n"]
  connection_name : connection_name option;
      [@ocaml.doc
        "The name of the connection to use to connect to the Hudi target. If your Hudi files are \
         stored in buckets that require VPC authorization, you can set their connection properties \
         here.\n"]
  paths : path_list option;
      [@ocaml.doc
        "An array of Amazon S3 location strings for Hudi, each indicating the root folder with \
         which the metadata files for a Hudi table resides. The Hudi folder may be located in a \
         child folder of the root folder.\n\n\
        \ The crawler will scan all folders underneath a path for a Hudi folder.\n\
        \ "]
}
[@@ocaml.doc "Specifies an Apache Hudi data source.\n"]

type nonrec hudi_target_list = hudi_target list [@@ocaml.doc ""]

type nonrec crawler_targets = {
  hudi_targets : hudi_target_list option; [@ocaml.doc "Specifies Apache Hudi data store targets.\n"]
  iceberg_targets : iceberg_target_list option;
      [@ocaml.doc "Specifies Apache Iceberg data store targets.\n"]
  delta_targets : delta_target_list option; [@ocaml.doc "Specifies Delta data store targets.\n"]
  catalog_targets : catalog_target_list option;
      [@ocaml.doc "Specifies Glue Data Catalog targets.\n"]
  dynamo_db_targets : dynamo_db_target_list option;
      [@ocaml.doc "Specifies Amazon DynamoDB targets.\n"]
  mongo_db_targets : mongo_db_target_list option;
      [@ocaml.doc "Specifies Amazon DocumentDB or MongoDB targets.\n"]
  jdbc_targets : jdbc_target_list option; [@ocaml.doc "Specifies JDBC targets.\n"]
  s3_targets : s3_target_list option;
      [@ocaml.doc "Specifies Amazon Simple Storage Service (Amazon S3) targets.\n"]
}
[@@ocaml.doc "Specifies data stores to crawl.\n"]

type nonrec classifier_name_list = name_string list [@@ocaml.doc ""]

type nonrec table_prefix = string [@@ocaml.doc ""]

type nonrec update_behavior = UPDATE_IN_DATABASE [@ocaml.doc ""] | LOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_behavior =
  | DEPRECATE_IN_DATABASE [@ocaml.doc ""]
  | DELETE_FROM_DATABASE [@ocaml.doc ""]
  | LOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schema_change_policy = {
  delete_behavior : delete_behavior option;
      [@ocaml.doc "The deletion behavior when the crawler finds a deleted object.\n"]
  update_behavior : update_behavior option;
      [@ocaml.doc "The update behavior when the crawler finds a changed schema.\n"]
}
[@@ocaml.doc "A policy that specifies update and deletion behaviors for the crawler.\n"]

type nonrec recrawl_behavior =
  | CRAWL_EVENT_MODE [@ocaml.doc ""]
  | CRAWL_NEW_FOLDERS_ONLY [@ocaml.doc ""]
  | CRAWL_EVERYTHING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recrawl_policy = {
  recrawl_behavior : recrawl_behavior option;
      [@ocaml.doc
        "Specifies whether to crawl the entire dataset again or to crawl only folders that were \
         added since the last crawler run.\n\n\
        \ A value of [CRAWL_EVERYTHING] specifies crawling the entire dataset again.\n\
        \ \n\
        \  A value of [CRAWL_NEW_FOLDERS_ONLY] specifies crawling only folders that were added \
         since the last crawler run.\n\
        \  \n\
        \   A value of [CRAWL_EVENT_MODE] specifies crawling only the changes identified by Amazon \
         S3 events.\n\
        \   "]
}
[@@ocaml.doc
  "When crawling an Amazon S3 data source after the first crawl is complete, specifies whether to \
   crawl the entire dataset again or to crawl only folders that were added since the last crawler \
   run. For more information, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/incremental-crawls.html}Incremental Crawls in \
   Glue} in the developer guide.\n"]

type nonrec crawler_lineage_settings = DISABLE [@ocaml.doc ""] | ENABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lineage_configuration = {
  crawler_lineage_settings : crawler_lineage_settings option;
      [@ocaml.doc
        "Specifies whether data lineage is enabled for the crawler. Valid values are:\n\n\
        \ {ul\n\
        \       {-  ENABLE: enables data lineage for the crawler\n\
        \           \n\
        \            }\n\
        \       {-  DISABLE: disables data lineage for the crawler\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Specifies data lineage configuration settings for the crawler.\n"]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec lake_formation_configuration = {
  account_id : account_id option;
      [@ocaml.doc
        "Required for cross account crawls. For same account crawls as the target data, this can \
         be left as null.\n"]
  use_lake_formation_credentials : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether to use Lake Formation credentials for the crawler instead of the IAM \
         role credentials.\n"]
}
[@@ocaml.doc "Specifies Lake Formation configuration settings for the crawler.\n"]

type nonrec crawler_configuration = string [@@ocaml.doc ""]

type nonrec crawler_security_configuration = string [@@ocaml.doc ""]

type nonrec update_crawler_request = {
  crawler_security_configuration : crawler_security_configuration option;
      [@ocaml.doc "The name of the [SecurityConfiguration] structure to be used by this crawler.\n"]
  configuration : crawler_configuration option;
      [@ocaml.doc
        "Crawler configuration information. This versioned JSON string allows users to specify \
         aspects of a crawler's behavior. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html}Setting crawler \
         configuration options}.\n"]
  lake_formation_configuration : lake_formation_configuration option;
      [@ocaml.doc "Specifies Lake Formation configuration settings for the crawler.\n"]
  lineage_configuration : lineage_configuration option;
      [@ocaml.doc "Specifies data lineage configuration settings for the crawler.\n"]
  recrawl_policy : recrawl_policy option;
      [@ocaml.doc
        "A policy that specifies whether to crawl the entire dataset again, or to crawl only \
         folders that were added since the last crawler run.\n"]
  schema_change_policy : schema_change_policy option;
      [@ocaml.doc "The policy for the crawler's update and deletion behavior.\n"]
  table_prefix : table_prefix option;
      [@ocaml.doc "The table prefix used for catalog tables that are created.\n"]
  classifiers : classifier_name_list option;
      [@ocaml.doc
        "A list of custom classifiers that the user has registered. By default, all built-in \
         classifiers are included in a crawl, but these custom classifiers always override the \
         default classifiers for a given classification.\n"]
  schedule : cron_expression option;
      [@ocaml.doc
        "A [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n"]
  targets : crawler_targets option; [@ocaml.doc "A list of targets to crawl.\n"]
  description : description_string_removable option;
      [@ocaml.doc "A description of the new crawler.\n"]
  database_name : database_name option;
      [@ocaml.doc
        "The Glue database where results are stored, such as: \
         [arn:aws:daylight:us-east-1::database/sometable/*].\n"]
  role : role option;
      [@ocaml.doc
        "The IAM role or Amazon Resource Name (ARN) of an IAM role that is used by the new crawler \
         to access customer resources.\n"]
  name : name_string; [@ocaml.doc "Name of the new crawler.\n"]
}
[@@ocaml.doc ""]

type nonrec crawler_running_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The operation cannot be performed because the crawler is already running.\n"]

type nonrec update_connection_response = unit [@@ocaml.doc ""]

type nonrec connection_type =
  | VERTICA [@ocaml.doc ""]
  | TPCDS [@ocaml.doc ""]
  | TIMESTREAM [@ocaml.doc ""]
  | TERADATANOS [@ocaml.doc ""]
  | TERADATA [@ocaml.doc ""]
  | SYNAPSE [@ocaml.doc ""]
  | SQLSERVER [@ocaml.doc ""]
  | SAPHANA [@ocaml.doc ""]
  | POSTGRESQL [@ocaml.doc ""]
  | PIPEDRIVE [@ocaml.doc ""]
  | ORACLE [@ocaml.doc ""]
  | OPENSEARCH [@ocaml.doc ""]
  | OKTA [@ocaml.doc ""]
  | MYSQL [@ocaml.doc ""]
  | MONDAY [@ocaml.doc ""]
  | MICROSOFTDYNAMICS365CRM [@ocaml.doc ""]
  | KUSTOMER [@ocaml.doc ""]
  | HBASE [@ocaml.doc ""]
  | GOOGLECLOUDSTORAGE [@ocaml.doc ""]
  | DYNAMODB [@ocaml.doc ""]
  | DOMO [@ocaml.doc ""]
  | DOCUMENTDB [@ocaml.doc ""]
  | DB2AS400 [@ocaml.doc ""]
  | DB2 [@ocaml.doc ""]
  | DATALAKEGEN2 [@ocaml.doc ""]
  | CMDB [@ocaml.doc ""]
  | CLOUDWATCHMETRICS [@ocaml.doc ""]
  | CLOUDWATCH [@ocaml.doc ""]
  | CLOUDERAIMPALA [@ocaml.doc ""]
  | CLOUDERAHIVE [@ocaml.doc ""]
  | BLACKBAUD [@ocaml.doc ""]
  | BIGQUERY [@ocaml.doc ""]
  | AZURESQL [@ocaml.doc ""]
  | AZURECOSMOS [@ocaml.doc ""]
  | SENDGRID [@ocaml.doc ""]
  | PIPEDIVE [@ocaml.doc ""]
  | CIRCLECI [@ocaml.doc ""]
  | PRODUCTBOARD [@ocaml.doc ""]
  | PENDO [@ocaml.doc ""]
  | GITLAB [@ocaml.doc ""]
  | MAILCHIMP [@ocaml.doc ""]
  | BLACKBAUDRAISEREDGENXT [@ocaml.doc ""]
  | MICROSOFTTEAMS [@ocaml.doc ""]
  | MICROSOFTDYNAMIC365FINANCEANDOPS [@ocaml.doc ""]
  | DYNATRACE [@ocaml.doc ""]
  | SAPCONCUR [@ocaml.doc ""]
  | SALESFORCECOMMERCECLOUD [@ocaml.doc ""]
  | GOOGLESEARCHCONSOLE [@ocaml.doc ""]
  | ZOOM [@ocaml.doc ""]
  | FRESHSALES [@ocaml.doc ""]
  | DOCUSIGNMONITOR [@ocaml.doc ""]
  | TWILIO [@ocaml.doc ""]
  | FRESHDESK [@ocaml.doc ""]
  | FACEBOOKPAGEINSIGHTS [@ocaml.doc ""]
  | QUICKBOOKS [@ocaml.doc ""]
  | PAYPAL [@ocaml.doc ""]
  | SNAPCHATADS [@ocaml.doc ""]
  | INTERCOM [@ocaml.doc ""]
  | WOOCOMMERCE [@ocaml.doc ""]
  | DATADOG [@ocaml.doc ""]
  | SMARTSHEET [@ocaml.doc ""]
  | STRIPE [@ocaml.doc ""]
  | ASANA [@ocaml.doc ""]
  | MIXPANEL [@ocaml.doc ""]
  | LINKEDIN [@ocaml.doc ""]
  | SLACK [@ocaml.doc ""]
  | ADOBEANALYTICS [@ocaml.doc ""]
  | SALESFORCEMARKETINGCLOUD [@ocaml.doc ""]
  | SALESFORCEPARDOT [@ocaml.doc ""]
  | ZOHOCRM [@ocaml.doc ""]
  | INSTAGRAMADS [@ocaml.doc ""]
  | FACEBOOKADS [@ocaml.doc ""]
  | HUBSPOT [@ocaml.doc ""]
  | NETSUITEERP [@ocaml.doc ""]
  | JIRACLOUD [@ocaml.doc ""]
  | ZENDESK [@ocaml.doc ""]
  | SAPODATA [@ocaml.doc ""]
  | MARKETO [@ocaml.doc ""]
  | SERVICENOW [@ocaml.doc ""]
  | GOOGLEANALYTICS4 [@ocaml.doc ""]
  | GOOGLESHEETS [@ocaml.doc ""]
  | GOOGLEADS [@ocaml.doc ""]
  | VIEW_VALIDATION_ATHENA [@ocaml.doc ""]
  | VIEW_VALIDATION_REDSHIFT [@ocaml.doc ""]
  | SALESFORCE [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
  | MARKETPLACE [@ocaml.doc ""]
  | NETWORK [@ocaml.doc ""]
  | KAFKA [@ocaml.doc ""]
  | MONGODB [@ocaml.doc ""]
  | SFTP [@ocaml.doc ""]
  | JDBC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_criteria = name_string list [@@ocaml.doc ""]

type nonrec connection_property_key =
  | DATABASE [@ocaml.doc ""]
  | CLUSTER_IDENTIFIER [@ocaml.doc ""]
  | WORKGROUP_NAME [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | ROLE_ARN [@ocaml.doc ""]
  | ENDPOINT_TYPE [@ocaml.doc ""]
  | ENDPOINT [@ocaml.doc ""]
  | CONNECTOR_CLASS_NAME [@ocaml.doc ""]
  | CONNECTOR_TYPE [@ocaml.doc ""]
  | CONNECTOR_URL [@ocaml.doc ""]
  | SECRET_ID [@ocaml.doc ""]
  | KAFKA_SASL_GSSAPI_PRINCIPAL [@ocaml.doc ""]
  | KAFKA_SASL_GSSAPI_SERVICE [@ocaml.doc ""]
  | KAFKA_SASL_GSSAPI_KRB5_CONF [@ocaml.doc ""]
  | KAFKA_SASL_GSSAPI_KEYTAB [@ocaml.doc ""]
  | ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD [@ocaml.doc ""]
  | KAFKA_SASL_SCRAM_SECRETS_ARN [@ocaml.doc ""]
  | KAFKA_SASL_SCRAM_PASSWORD [@ocaml.doc ""]
  | KAFKA_SASL_SCRAM_USERNAME [@ocaml.doc ""]
  | ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD [@ocaml.doc ""]
  | KAFKA_SASL_PLAIN_PASSWORD [@ocaml.doc ""]
  | KAFKA_SASL_PLAIN_USERNAME [@ocaml.doc ""]
  | KAFKA_SASL_MECHANISM [@ocaml.doc ""]
  | ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD [@ocaml.doc ""]
  | ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD [@ocaml.doc ""]
  | KAFKA_CLIENT_KEY_PASSWORD [@ocaml.doc ""]
  | KAFKA_CLIENT_KEYSTORE_PASSWORD [@ocaml.doc ""]
  | KAFKA_CLIENT_KEYSTORE [@ocaml.doc ""]
  | KAFKA_SKIP_CUSTOM_CERT_VALIDATION [@ocaml.doc ""]
  | KAFKA_CUSTOM_CERT [@ocaml.doc ""]
  | KAFKA_SSL_ENABLED [@ocaml.doc ""]
  | KAFKA_BOOTSTRAP_SERVERS [@ocaml.doc ""]
  | CONNECTION_URL [@ocaml.doc ""]
  | CUSTOM_JDBC_CERT_STRING [@ocaml.doc ""]
  | SKIP_CUSTOM_JDBC_CERT_VALIDATION [@ocaml.doc ""]
  | CUSTOM_JDBC_CERT [@ocaml.doc ""]
  | JDBC_ENFORCE_SSL [@ocaml.doc ""]
  | JDBC_CONNECTION_URL [@ocaml.doc ""]
  | INSTANCE_ID [@ocaml.doc ""]
  | CONFIG_FILES [@ocaml.doc ""]
  | JDBC_ENGINE_VERSION [@ocaml.doc ""]
  | JDBC_ENGINE [@ocaml.doc ""]
  | JDBC_DRIVER_CLASS_NAME [@ocaml.doc ""]
  | JDBC_DRIVER_JAR_URI [@ocaml.doc ""]
  | ENCRYPTED_PASSWORD [@ocaml.doc ""]
  | PASSWORD [@ocaml.doc ""]
  | USER_NAME [@ocaml.doc ""]
  | PORT [@ocaml.doc ""]
  | HOST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_properties = (connection_property_key * value_string) list [@@ocaml.doc ""]

type nonrec property_value = string [@@ocaml.doc ""]

type nonrec property_key = string [@@ocaml.doc ""]

type nonrec property_map = (property_key * property_value) list [@@ocaml.doc ""]

type nonrec security_group_id_list = name_string list [@@ocaml.doc ""]

type nonrec physical_connection_requirements = {
  availability_zone : name_string option; [@ocaml.doc "The connection's Availability Zone.\n"]
  security_group_id_list : security_group_id_list option;
      [@ocaml.doc "The security group ID list used by the connection.\n"]
  subnet_id : name_string option; [@ocaml.doc "The subnet ID used by the connection.\n"]
}
[@@ocaml.doc "The OAuth client app in GetConnection response.\n"]

type nonrec authentication_type =
  | IAM [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
  | OAUTH2 [@ocaml.doc ""]
  | BASIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec o_auth2_grant_type =
  | JWT_BEARER [@ocaml.doc ""]
  | CLIENT_CREDENTIALS [@ocaml.doc ""]
  | AUTHORIZATION_CODE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_managed_client_application_reference = string [@@ocaml.doc ""]

type nonrec o_auth2_client_application = {
  aws_managed_client_application_reference : aws_managed_client_application_reference option;
      [@ocaml.doc
        "The reference to the SaaS-side client app that is Amazon Web Services managed.\n"]
  user_managed_client_application_client_id : user_managed_client_application_client_id option;
      [@ocaml.doc "The client application clientID if the ClientAppType is [USER_MANAGED].\n"]
}
[@@ocaml.doc "The OAuth2 client app used for the connection.\n"]

type nonrec token_url = string [@@ocaml.doc ""]

type nonrec token_url_parameter_value = string [@@ocaml.doc ""]

type nonrec token_url_parameter_key = string [@@ocaml.doc ""]

type nonrec token_url_parameters_map = (token_url_parameter_key * token_url_parameter_value) list
[@@ocaml.doc ""]

type nonrec authorization_code = string [@@ocaml.doc ""]

type nonrec redirect_uri = string [@@ocaml.doc ""]

type nonrec authorization_code_properties = {
  redirect_uri : redirect_uri option;
      [@ocaml.doc
        "The redirect URI where the user gets redirected to by authorization server when issuing \
         an authorization code. The URI is subsequently used when the authorization code is \
         exchanged for an access token.\n"]
  authorization_code : authorization_code option;
      [@ocaml.doc
        "An authorization code to be used in the third leg of the [AUTHORIZATION_CODE] grant \
         workflow. This is a single-use code which becomes invalid once exchanged for an access \
         token, thus it is acceptable to have this value as a request parameter.\n"]
}
[@@ocaml.doc
  "The set of properties required for the the OAuth2 [AUTHORIZATION_CODE] grant type workflow.\n"]

type nonrec access_token = string [@@ocaml.doc ""]

type nonrec refresh_token = string [@@ocaml.doc ""]

type nonrec jwt_token = string [@@ocaml.doc ""]

type nonrec o_auth2_credentials = {
  jwt_token : jwt_token option;
      [@ocaml.doc "The JSON Web Token (JWT) used when the authentication type is OAuth2.\n"]
  refresh_token : refresh_token option;
      [@ocaml.doc "The refresh token used when the authentication type is OAuth2.\n"]
  access_token : access_token option;
      [@ocaml.doc "The access token used when the authentication type is OAuth2.\n"]
  user_managed_client_application_client_secret :
    user_managed_client_application_client_secret option;
      [@ocaml.doc
        "The client application client secret if the client application is user managed.\n"]
}
[@@ocaml.doc "The credentials used when the authentication type is OAuth2 authentication.\n"]

type nonrec o_auth2_properties_input = {
  o_auth2_credentials : o_auth2_credentials option;
      [@ocaml.doc "The credentials used when the authentication type is OAuth2 authentication.\n"]
  authorization_code_properties : authorization_code_properties option;
      [@ocaml.doc
        "The set of properties required for the the OAuth2 [AUTHORIZATION_CODE] grant type.\n"]
  token_url_parameters_map : token_url_parameters_map option;
      [@ocaml.doc "A map of parameters that are added to the token [GET] request.\n"]
  token_url : token_url option;
      [@ocaml.doc
        "The URL of the provider's authentication server, to exchange an authorization code for an \
         access token.\n"]
  o_auth2_client_application : o_auth2_client_application option;
      [@ocaml.doc
        "The client application type in the CreateConnection request. For example, [AWS_MANAGED] \
         or [USER_MANAGED].\n"]
  o_auth2_grant_type : o_auth2_grant_type option;
      [@ocaml.doc
        "The OAuth2 grant type in the CreateConnection request. For example, [AUTHORIZATION_CODE], \
         [JWT_BEARER], or [CLIENT_CREDENTIALS].\n"]
}
[@@ocaml.doc "A structure containing properties for OAuth2 in the CreateConnection request.\n"]

type nonrec secret_arn = string [@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec password = string [@@ocaml.doc ""]

type nonrec basic_authentication_credentials = {
  password : password option; [@ocaml.doc "The password to connect to the data source.\n"]
  username : username option; [@ocaml.doc "The username to connect to the data source.\n"]
}
[@@ocaml.doc "For supplying basic auth credentials when not providing a [SecretArn] value.\n"]

type nonrec credential_value = string [@@ocaml.doc ""]

type nonrec credential_key = string [@@ocaml.doc ""]

type nonrec credential_map = (credential_key * credential_value) list [@@ocaml.doc ""]

type nonrec authentication_configuration_input = {
  custom_authentication_credentials : credential_map option;
      [@ocaml.doc "The credentials used when the authentication type is custom authentication.\n"]
  basic_authentication_credentials : basic_authentication_credentials option;
      [@ocaml.doc "The credentials used when the authentication type is basic authentication.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The ARN of the KMS key used to encrypt the connection. Only taken an as input in the \
         request and stored in the Secret Manager.\n"]
  secret_arn : secret_arn option;
      [@ocaml.doc "The secret manager ARN to store credentials in the CreateConnection request.\n"]
  o_auth2_properties : o_auth2_properties_input option;
      [@ocaml.doc "The properties for OAuth2 authentication in the CreateConnection request.\n"]
  authentication_type : authentication_type option;
      [@ocaml.doc
        "A structure containing the authentication configuration in the CreateConnection request.\n"]
}
[@@ocaml.doc
  "A structure containing the authentication configuration in the CreateConnection request.\n"]

type nonrec compute_environment =
  | PYTHON [@ocaml.doc ""]
  | ATHENA [@ocaml.doc ""]
  | SPARK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compute_environment_list = compute_environment list [@@ocaml.doc ""]

type nonrec connection_input = {
  validate_for_compute_environments : compute_environment_list option;
      [@ocaml.doc
        "The compute environments that the specified connection properties are validated against.\n"]
  validate_credentials : boolean_ option;
      [@ocaml.doc
        "A flag to validate the credentials during create connection. Default is true. \n"]
  authentication_configuration : authentication_configuration_input option;
      [@ocaml.doc "The authentication properties of the connection.\n"]
  physical_connection_requirements : physical_connection_requirements option;
      [@ocaml.doc
        "The physical connection requirements, such as virtual private cloud (VPC) and \
         [SecurityGroup], that are needed to successfully make this connection.\n"]
  python_properties : property_map option;
      [@ocaml.doc "Connection properties specific to the Python compute environment.\n"]
  athena_properties : property_map option;
      [@ocaml.doc "Connection properties specific to the Athena compute environment.\n"]
  spark_properties : property_map option;
      [@ocaml.doc "Connection properties specific to the Spark compute environment.\n"]
  connection_properties : connection_properties;
      [@ocaml.doc "These key-value pairs define parameters for the connection.\n"]
  match_criteria : match_criteria option;
      [@ocaml.doc "A list of criteria that can be used in selecting this connection.\n"]
  connection_type : connection_type;
      [@ocaml.doc
        "The type of the connection. Currently, these types are supported:\n\n\
        \ {ul\n\
        \       {-   [JDBC] - Designates a connection to a database through Java Database \
         Connectivity (JDBC).\n\
        \           \n\
        \             [JDBC] Connections use the following ConnectionParameters.\n\
        \            \n\
        \             {ul\n\
        \                   {-  Required: All of ([HOST], [PORT], [JDBC_ENGINE]) or \
         [JDBC_CONNECTION_URL].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Required: All of ([USERNAME], [PASSWORD]) or [SECRET_ID].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Optional: [JDBC_ENFORCE_SSL], [CUSTOM_JDBC_CERT], \
         [CUSTOM_JDBC_CERT_STRING], [SKIP_CUSTOM_JDBC_CERT_VALIDATION]. These parameters are used \
         to configure SSL with JDBC.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-   [KAFKA] - Designates a connection to an Apache Kafka streaming platform.\n\
        \           \n\
        \             [KAFKA] Connections use the following ConnectionParameters.\n\
        \            \n\
        \             {ul\n\
        \                   {-  Required: [KAFKA_BOOTSTRAP_SERVERS].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Optional: [KAFKA_SSL_ENABLED], [KAFKA_CUSTOM_CERT], \
         [KAFKA_SKIP_CUSTOM_CERT_VALIDATION]. These parameters are used to configure SSL with \
         [KAFKA].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Optional: [KAFKA_CLIENT_KEYSTORE], \
         [KAFKA_CLIENT_KEYSTORE_PASSWORD], [KAFKA_CLIENT_KEY_PASSWORD], \
         [ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD], [ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD]. These \
         parameters are used to configure TLS client configuration with SSL in [KAFKA].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Optional: [KAFKA_SASL_MECHANISM]. Can be specified as \
         [SCRAM-SHA-512], [GSSAPI], or [AWS_MSK_IAM].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Optional: [KAFKA_SASL_SCRAM_USERNAME], \
         [KAFKA_SASL_SCRAM_PASSWORD], [ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD]. These parameters are \
         used to configure SASL/SCRAM-SHA-512 authentication with [KAFKA].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Optional: [KAFKA_SASL_GSSAPI_KEYTAB], \
         [KAFKA_SASL_GSSAPI_KRB5_CONF], [KAFKA_SASL_GSSAPI_SERVICE], \
         [KAFKA_SASL_GSSAPI_PRINCIPAL]. These parameters are used to configure SASL/GSSAPI \
         authentication with [KAFKA].\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-   [MONGODB] - Designates a connection to a MongoDB document database.\n\
        \           \n\
        \             [MONGODB] Connections use the following ConnectionParameters.\n\
        \            \n\
        \             {ul\n\
        \                   {-  Required: [CONNECTION_URL].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Required: All of ([USERNAME], [PASSWORD]) or [SECRET_ID].\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-   [VIEW_VALIDATION_REDSHIFT] - Designates a connection used for view validation \
         by Amazon Redshift.\n\
        \           \n\
        \            }\n\
        \       {-   [VIEW_VALIDATION_ATHENA] - Designates a connection used for view validation \
         by Amazon Athena.\n\
        \           \n\
        \            }\n\
        \       {-   [NETWORK] - Designates a network connection to a data source within an Amazon \
         Virtual Private Cloud environment (Amazon VPC).\n\
        \           \n\
        \             [NETWORK] Connections do not require ConnectionParameters. Instead, provide \
         a PhysicalConnectionRequirements.\n\
        \            \n\
        \             }\n\
        \       {-   [MARKETPLACE] - Uses configuration settings contained in a connector \
         purchased from Amazon Web Services Marketplace to read from and write to data stores that \
         are not natively supported by Glue.\n\
        \           \n\
        \             [MARKETPLACE] Connections use the following ConnectionParameters.\n\
        \            \n\
        \             {ul\n\
        \                   {-  Required: [CONNECTOR_TYPE], [CONNECTOR_URL], \
         [CONNECTOR_CLASS_NAME], [CONNECTION_URL].\n\
        \                       \n\
        \                        }\n\
        \                   {-  Required for [JDBC] [CONNECTOR_TYPE] connections: All of \
         ([USERNAME], [PASSWORD]) or [SECRET_ID].\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-   [CUSTOM] - Uses configuration settings contained in a custom connector to \
         read from and write to data stores that are not natively supported by Glue.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information on the connection parameters needed for a particular connector, \
         see the documentation for the connector in \
         {{:https://docs.aws.amazon.com/glue/latest/dg/console-connections.html}Adding an Glue \
         connection}in the Glue User Guide.\n\
        \   \n\
        \     [SFTP] is not supported.\n\
        \    \n\
        \     For more information about how optional ConnectionProperties are used to configure \
         features in Glue, consult \
         {{:https://docs.aws.amazon.com/glue/latest/dg/connection-defining.html}Glue connection \
         properties}.\n\
        \     \n\
        \      For more information about how optional ConnectionProperties are used to configure \
         features in Glue Studio, consult \
         {{:https://docs.aws.amazon.com/glue/latest/ug/connectors-chapter.html}Using connectors \
         and connections}.\n\
        \      "]
  description : description_string option; [@ocaml.doc "The description of the connection.\n"]
  name : name_string; [@ocaml.doc "The name of the connection.\n"]
}
[@@ocaml.doc "A structure that is used to specify a connection to create or update.\n"]

type nonrec update_connection_request = {
  connection_input : connection_input;
      [@ocaml.doc "A [ConnectionInput] object that redefines the connection in question.\n"]
  name : name_string; [@ocaml.doc "The name of the connection definition to update.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the connection resides. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec update_column_statistics_task_settings_response = unit [@@ocaml.doc ""]

type nonrec column_name_list = name_string list [@@ocaml.doc ""]

type nonrec sample_size_percentage = float [@@ocaml.doc ""]

type nonrec update_column_statistics_task_settings_request = {
  security_configuration : name_string option;
      [@ocaml.doc "Name of the security configuration that is used to encrypt CloudWatch logs.\n"]
  catalog_i_d : name_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the database resides.\n"]
  sample_size : sample_size_percentage option; [@ocaml.doc "The percentage of data to sample.\n"]
  column_name_list : column_name_list option;
      [@ocaml.doc "A list of column names for which to run statistics.\n"]
  schedule : cron_expression option;
      [@ocaml.doc "A schedule for running the column statistics, specified in CRON syntax.\n"]
  role : name_string option; [@ocaml.doc "The role used for running the column statistics.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the table for which to generate column statistics.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec type_string = string [@@ocaml.doc ""]

type nonrec column_statistics_type =
  | BINARY [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
  | LONG [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | DECIMAL [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec non_negative_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec boolean_column_statistics_data = {
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  number_of_falses : non_negative_long; [@ocaml.doc "The number of false values in the column.\n"]
  number_of_trues : non_negative_long; [@ocaml.doc "The number of true values in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for Boolean data columns.\n"]

type nonrec date_column_statistics_data = {
  number_of_distinct_values : non_negative_long;
      [@ocaml.doc "The number of distinct values in a column.\n"]
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  maximum_value : timestamp option; [@ocaml.doc "The highest value in the column.\n"]
  minimum_value : timestamp option; [@ocaml.doc "The lowest value in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for timestamp data columns.\n"]

type nonrec blob = bytes [@@ocaml.doc ""]

type nonrec decimal_number = {
  scale : integer;
      [@ocaml.doc
        "The scale that determines where the decimal point falls in the unscaled value.\n"]
  unscaled_value : blob; [@ocaml.doc "The unscaled numeric value.\n"]
}
[@@ocaml.doc "Contains a numeric value in decimal format.\n"]

type nonrec decimal_column_statistics_data = {
  number_of_distinct_values : non_negative_long;
      [@ocaml.doc "The number of distinct values in a column.\n"]
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  maximum_value : decimal_number option; [@ocaml.doc "The highest value in the column.\n"]
  minimum_value : decimal_number option; [@ocaml.doc "The lowest value in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for fixed-point number data columns.\n"]

type nonrec double = float [@@ocaml.doc ""]

type nonrec double_column_statistics_data = {
  number_of_distinct_values : non_negative_long;
      [@ocaml.doc "The number of distinct values in a column.\n"]
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  maximum_value : double option; [@ocaml.doc "The highest value in the column.\n"]
  minimum_value : double option; [@ocaml.doc "The lowest value in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for floating-point number data columns.\n"]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec long_column_statistics_data = {
  number_of_distinct_values : non_negative_long;
      [@ocaml.doc "The number of distinct values in a column.\n"]
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  maximum_value : long option; [@ocaml.doc "The highest value in the column.\n"]
  minimum_value : long option; [@ocaml.doc "The lowest value in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for integer data columns.\n"]

type nonrec non_negative_double = float [@@ocaml.doc ""]

type nonrec string_column_statistics_data = {
  number_of_distinct_values : non_negative_long;
      [@ocaml.doc "The number of distinct values in a column.\n"]
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  average_length : non_negative_double; [@ocaml.doc "The average string length in the column.\n"]
  maximum_length : non_negative_long; [@ocaml.doc "The size of the longest string in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for character sequence data values.\n"]

type nonrec binary_column_statistics_data = {
  number_of_nulls : non_negative_long; [@ocaml.doc "The number of null values in the column.\n"]
  average_length : non_negative_double;
      [@ocaml.doc "The average bit sequence length in the column.\n"]
  maximum_length : non_negative_long;
      [@ocaml.doc "The size of the longest bit sequence in the column.\n"]
}
[@@ocaml.doc "Defines column statistics supported for bit sequence data values.\n"]

type nonrec column_statistics_data = {
  binary_column_statistics_data : binary_column_statistics_data option;
      [@ocaml.doc "Binary column statistics data.\n"]
  string_column_statistics_data : string_column_statistics_data option;
      [@ocaml.doc "String column statistics data.\n"]
  long_column_statistics_data : long_column_statistics_data option;
      [@ocaml.doc "Long column statistics data.\n"]
  double_column_statistics_data : double_column_statistics_data option;
      [@ocaml.doc "Double column statistics data.\n"]
  decimal_column_statistics_data : decimal_column_statistics_data option;
      [@ocaml.doc
        " Decimal column statistics data. UnscaledValues within are Base64-encoded binary objects \
         storing big-endian, two's complement representations of the decimal's unscaled value. \n"]
  date_column_statistics_data : date_column_statistics_data option;
      [@ocaml.doc "Date column statistics data.\n"]
  boolean_column_statistics_data : boolean_column_statistics_data option;
      [@ocaml.doc "Boolean column statistics data.\n"]
  type_ : column_statistics_type; [@ocaml.doc "The type of column statistics data.\n"]
}
[@@ocaml.doc
  "Contains the individual types of column statistics data. Only one data object should be set and \
   indicated by the [Type] attribute.\n"]

type nonrec column_statistics = {
  statistics_data : column_statistics_data;
      [@ocaml.doc "A [ColumnStatisticData] object that contains the statistics data values.\n"]
  analyzed_time : timestamp;
      [@ocaml.doc "The timestamp of when column statistics were generated.\n"]
  column_type : type_string; [@ocaml.doc "The data type of the column.\n"]
  column_name : name_string; [@ocaml.doc "Name of column which statistics belong to.\n"]
}
[@@ocaml.doc "Represents the generated column-level statistics for a table or partition.\n"]

type nonrec update_column_statistics_list = column_statistics list [@@ocaml.doc ""]

type nonrec column_statistics_error = {
  error : error_detail option;
      [@ocaml.doc "An error message with the reason for the failure of an operation.\n"]
  column_statistics : column_statistics option;
      [@ocaml.doc "The [ColumnStatistics] of the column.\n"]
}
[@@ocaml.doc "Encapsulates a [ColumnStatistics] object that failed and the reason for failure.\n"]

type nonrec column_statistics_errors = column_statistics_error list [@@ocaml.doc ""]

type nonrec update_column_statistics_for_table_response = {
  errors : column_statistics_errors option; [@ocaml.doc "List of ColumnStatisticsErrors.\n"]
}
[@@ocaml.doc ""]

type nonrec update_column_statistics_for_table_request = {
  column_statistics_list : update_column_statistics_list;
      [@ocaml.doc "A list of the column statistics.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec update_column_statistics_for_partition_response = {
  errors : column_statistics_errors option;
      [@ocaml.doc "Error occurred during updating column statistics data.\n"]
}
[@@ocaml.doc ""]

type nonrec update_column_statistics_for_partition_request = {
  column_statistics_list : update_column_statistics_list;
      [@ocaml.doc "A list of the column statistics.\n"]
  partition_values : value_string_list;
      [@ocaml.doc "A list of partition values identifying the partition.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec update_classifier_response = unit [@@ocaml.doc ""]

type nonrec update_classifier_request = {
  csv_classifier : update_csv_classifier_request option;
      [@ocaml.doc "A [CsvClassifier] object with updated fields.\n"]
  json_classifier : update_json_classifier_request option;
      [@ocaml.doc "A [JsonClassifier] object with updated fields.\n"]
  xml_classifier : update_xml_classifier_request option;
      [@ocaml.doc "An [XMLClassifier] object with updated fields.\n"]
  grok_classifier : update_grok_classifier_request option;
      [@ocaml.doc "A [GrokClassifier] object with updated fields.\n"]
}
[@@ocaml.doc ""]

type nonrec update_catalog_response = unit [@@ocaml.doc ""]

type nonrec federated_catalog = {
  connection_type : name_string option;
      [@ocaml.doc
        "The type of connection used to access the federated catalog, specifying the protocol or \
         method for connection to the external data source.\n"]
  connection_name : name_string option;
      [@ocaml.doc
        "The name of the connection to an external data source, for example a Redshift-federated \
         catalog.\n"]
  identifier : federation_identifier option;
      [@ocaml.doc "A unique identifier for the federated catalog.\n"]
}
[@@ocaml.doc "A catalog that points to an entity outside the Glue Data Catalog.\n"]

type nonrec resource_arn_string = string [@@ocaml.doc ""]

type nonrec target_redshift_catalog = {
  catalog_arn : resource_arn_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the catalog resource.\n"]
}
[@@ocaml.doc "A structure that describes a target catalog for resource linking.\n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec data_lake_access_properties = {
  catalog_type : name_string option;
      [@ocaml.doc
        "Specifies a federated catalog type for the native catalog resource. The currently \
         supported type is [aws:redshift].\n"]
  kms_key : resource_arn_string option;
      [@ocaml.doc
        "An encryption key that will be used for the staging bucket that will be created along \
         with the catalog.\n"]
  data_transfer_role : iam_role_arn option;
      [@ocaml.doc
        "A role that will be assumed by Glue for transferring data into/out of the staging bucket \
         during a query.\n"]
  data_lake_access : boolean_ option;
      [@ocaml.doc
        "Turns on or off data lake access for Apache Spark applications that access Amazon \
         Redshift databases in the Data Catalog from any non-Redshift engine, such as Amazon \
         Athena, Amazon EMR, or Glue ETL.\n"]
}
[@@ocaml.doc
  "Input properties to configure data lake access for your catalog resource in the Glue Data \
   Catalog.\n"]

type nonrec iceberg_optimization_properties = {
  orphan_file_deletion : parameters_map option;
      [@ocaml.doc
        "A map of key-value pairs that specify configuration parameters for Iceberg orphan file \
         deletion operations, which identify and remove files that are no longer referenced by the \
         table metadata.\n"]
  retention : parameters_map option;
      [@ocaml.doc
        "A map of key-value pairs that specify configuration parameters for Iceberg table \
         retention operations, which manage the lifecycle of table snapshots to control storage \
         costs.\n"]
  compaction : parameters_map option;
      [@ocaml.doc
        "A map of key-value pairs that specify configuration parameters for Iceberg table \
         compaction operations, which optimize the layout of data files to improve query \
         performance.\n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that will be assumed to perform Iceberg \
         table optimization operations.\n"]
}
[@@ocaml.doc
  "A structure that specifies Iceberg table optimization properties for the catalog, including \
   configurations for compaction, retention, and orphan file deletion operations.\n"]

type nonrec catalog_properties = {
  custom_properties : parameters_map option;
      [@ocaml.doc
        "Additional key-value properties for the catalog, such as column statistics optimizations.\n"]
  iceberg_optimization_properties : iceberg_optimization_properties option;
      [@ocaml.doc
        "A structure that specifies Iceberg table optimization properties for the catalog. This \
         includes configuration for compaction, retention, and orphan file deletion operations \
         that can be applied to Iceberg tables in this catalog.\n"]
  data_lake_access_properties : data_lake_access_properties option;
      [@ocaml.doc
        "A [DataLakeAccessProperties] object that specifies properties to configure data lake \
         access for your catalog resource in the Glue Data Catalog.\n"]
}
[@@ocaml.doc
  "A structure that specifies data lake access properties and other custom properties.\n"]

type nonrec allow_full_table_external_data_access_enum =
  | False [@ocaml.doc ""]
  | True [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec overwrite_child_resource_permissions_with_default_enum =
  | Deny [@ocaml.doc ""]
  | Accept [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec catalog_input = {
  overwrite_child_resource_permissions_with_default :
    overwrite_child_resource_permissions_with_default_enum option;
      [@ocaml.doc
        " Overwrites existing Amazon Web Services Lake Formation permissions with \
         [CatalogInput$CreateTableDefaultPermissions] and \
         [CatalogInput$CreateDatabaseDefaultPermissions] for all child resources. \n"]
  allow_full_table_external_data_access : allow_full_table_external_data_access_enum option;
      [@ocaml.doc
        " Allows third-party engines to access data in Amazon S3 locations that are registered \
         with Lake Formation. \n"]
  create_database_default_permissions : principal_permissions_list option;
      [@ocaml.doc
        "An array of [PrincipalPermissions] objects. Creates a set of default permissions on the \
         database(s) for principals. Used by Amazon Web Services Lake Formation. Typically should \
         be explicitly set as an empty list.\n"]
  create_table_default_permissions : principal_permissions_list option;
      [@ocaml.doc
        "An array of [PrincipalPermissions] objects. Creates a set of default permissions on the \
         table(s) for principals. Used by Amazon Web Services Lake Formation. Typically should be \
         explicitly set as an empty list.\n"]
  catalog_properties : catalog_properties option;
      [@ocaml.doc
        "A [CatalogProperties] object that specifies data lake access properties and other custom \
         properties.\n"]
  target_redshift_catalog : target_redshift_catalog option;
      [@ocaml.doc
        "A [TargetRedshiftCatalog] object that describes a target catalog for resource linking.\n"]
  parameters : parameters_map option;
      [@ocaml.doc
        "A map array of key-value pairs that define the parameters and properties of the catalog.\n"]
  federated_catalog : federated_catalog option;
      [@ocaml.doc
        "A [FederatedCatalog] object. A [FederatedCatalog] structure that references an entity \
         outside the Glue Data Catalog, for example a Redshift database.\n"]
  description : description_string option;
      [@ocaml.doc
        "Description string, not more than 2048 bytes long, matching the URI address multi-line \
         string pattern. A description of the catalog.\n"]
}
[@@ocaml.doc "A structure that describes catalog properties.\n"]

type nonrec update_catalog_request = {
  catalog_input : catalog_input;
      [@ocaml.doc "A [CatalogInput] object specifying the new properties of an existing catalog.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The ID of the catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec update_blueprint_response = {
  name : name_string option; [@ocaml.doc "Returns the name of the blueprint that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec orchestration_s3_location = string [@@ocaml.doc ""]

type nonrec update_blueprint_request = {
  blueprint_location : orchestration_s3_location;
      [@ocaml.doc "Specifies a path in Amazon S3 where the blueprint is published.\n"]
  description : generic512_char_string option; [@ocaml.doc "A description of the blueprint.\n"]
  name : orchestration_name_string; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc ""]

type nonrec illegal_blueprint_state_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The blueprint is in an invalid state to perform a requested operation.\n"]

type nonrec asset_id = string [@@ocaml.doc ""]

type nonrec asset_name = string [@@ocaml.doc ""]

type nonrec asset_description = string [@@ocaml.doc ""]

type nonrec update_asset_response = {
  updated_at : updated_at option;
      [@ocaml.doc "The timestamp at which the asset was last updated.\n"]
  description : asset_description option; [@ocaml.doc "The description of the asset.\n"]
  name : asset_name option; [@ocaml.doc "The name of the asset.\n"]
  id : asset_id; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec update_asset_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  description : asset_description option; [@ocaml.doc "The new description of the asset.\n"]
  name : asset_name option; [@ocaml.doc "The new name of the asset.\n"]
  identifier : asset_id; [@ocaml.doc "The unique identifier of the asset to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tags_to_remove : tag_keys_list; [@ocaml.doc "Tags to remove from this resource.\n"]
  resource_arn : glue_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource from which to remove the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec partition = {
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the partition resides.\n"]
  last_analyzed_time : timestamp option;
      [@ocaml.doc "The last time at which column statistics were computed for this partition.\n"]
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define partition parameters.\n"]
  storage_descriptor : storage_descriptor option;
      [@ocaml.doc
        "Provides information about the physical location where the partition is stored.\n"]
  last_access_time : timestamp option;
      [@ocaml.doc "The last time at which the partition was accessed.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time at which the partition was created.\n"]
  table_name : name_string option;
      [@ocaml.doc "The name of the database table in which to create the partition.\n"]
  database_name : name_string option;
      [@ocaml.doc "The name of the catalog database in which to create the partition.\n"]
  values : value_string_list option; [@ocaml.doc "The values of the partition.\n"]
}
[@@ocaml.doc "Represents a slice of table data.\n"]

type nonrec unfiltered_partition = {
  is_registered_with_lake_formation : boolean_ option;
      [@ocaml.doc
        "A Boolean value indicating that the partition location is registered with Lake Formation.\n"]
  authorized_columns : name_string_list option;
      [@ocaml.doc "The list of columns the user has permissions to access.\n"]
  partition : partition option; [@ocaml.doc "The partition object.\n"]
}
[@@ocaml.doc "A partition that contains unfiltered metadata.\n"]

type nonrec unfiltered_partition_list = unfiltered_partition list [@@ocaml.doc ""]

type nonrec uui_dv4 = string [@@ocaml.doc ""]

type nonrec trigger_name_list = name_string list [@@ocaml.doc ""]

type nonrec trigger_list = trigger list [@@ocaml.doc ""]

type nonrec transform_status_type =
  | DELETING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | NOT_READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transform_sort_column_type =
  | LAST_MODIFIED [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | TRANSFORM_TYPE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_direction_type = ASCENDING [@ocaml.doc ""] | DESCENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transform_sort_criteria = {
  sort_direction : sort_direction_type;
      [@ocaml.doc
        "The sort direction to be used in the sorting criteria that are associated with the \
         machine learning transform.\n"]
  column : transform_sort_column_type;
      [@ocaml.doc
        "The column to be used in the sorting criteria that are associated with the machine \
         learning transform.\n"]
}
[@@ocaml.doc "The sorting criteria that are associated with the machine learning transform.\n"]

type nonrec schema_column = {
  data_type : column_type_string option; [@ocaml.doc "The type of data in the column.\n"]
  name : column_name_string option; [@ocaml.doc "The name of the column.\n"]
}
[@@ocaml.doc
  "A key-value pair representing a column and data type that this transform can run against. The \
   [Schema] parameter of the [MLTransform] may contain up to 100 of these structures.\n"]

type nonrec transform_schema = schema_column list [@@ocaml.doc ""]

type nonrec glue_table_additional_options = (name_string * description_string) list [@@ocaml.doc ""]

type nonrec glue_table = {
  additional_options : glue_table_additional_options option;
      [@ocaml.doc
        "Additional options for the table. Currently there are two keys supported:\n\n\
        \ {ul\n\
        \       {-   [pushDownPredicate]: to filter on partitions without having to list and read \
         all the files in your dataset.\n\
        \           \n\
        \            }\n\
        \       {-   [catalogPartitionPredicate]: to use server-side partition pruning using \
         partition indexes in the Glue Data Catalog.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  connection_name : name_string option;
      [@ocaml.doc "The name of the connection to the Glue Data Catalog.\n"]
  catalog_id : name_string option; [@ocaml.doc "A unique identifier for the Glue Data Catalog.\n"]
  table_name : name_string; [@ocaml.doc "A table name in the Glue Data Catalog.\n"]
  database_name : name_string; [@ocaml.doc "A database name in the Glue Data Catalog.\n"]
}
[@@ocaml.doc
  "The database and table in the Glue Data Catalog that is used for input or output data.\n"]

type nonrec glue_tables = glue_table list [@@ocaml.doc ""]

type nonrec records_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec confusion_matrix = {
  num_false_negatives : records_count option;
      [@ocaml.doc
        "The number of matches in the data that the transform didn't find, in the confusion matrix \
         for your transform.\n"]
  num_true_negatives : records_count option;
      [@ocaml.doc
        "The number of nonmatches in the data that the transform correctly rejected, in the \
         confusion matrix for your transform.\n"]
  num_false_positives : records_count option;
      [@ocaml.doc
        "The number of nonmatches in the data that the transform incorrectly classified as a \
         match, in the confusion matrix for your transform.\n"]
  num_true_positives : records_count option;
      [@ocaml.doc
        "The number of matches in the data that the transform correctly found, in the confusion \
         matrix for your transform.\n"]
}
[@@ocaml.doc
  "The confusion matrix shows you what your transform is predicting accurately and what types of \
   errors it is making.\n\n\
  \ For more information, see {{:https://en.wikipedia.org/wiki/Confusion_matrix}Confusion matrix} \
   in Wikipedia.\n\
  \ "]

type nonrec column_importance = {
  importance : generic_bounded_double option;
      [@ocaml.doc "The column importance score for the column, as a decimal.\n"]
  column_name : name_string option; [@ocaml.doc "The name of a column.\n"]
}
[@@ocaml.doc
  "A structure containing the column name and column importance score for a column. \n\n\
  \ Column importance helps you understand how columns contribute to your model, by identifying \
   which columns in your records are more important than others.\n\
  \ "]

type nonrec column_importance_list = column_importance list [@@ocaml.doc ""]

type nonrec find_matches_metrics = {
  column_importances : column_importance_list option;
      [@ocaml.doc
        "A list of [ColumnImportance] structures containing column importance metrics, sorted in \
         order of descending importance.\n"]
  confusion_matrix : confusion_matrix option;
      [@ocaml.doc
        "The confusion matrix shows you what your transform is predicting accurately and what \
         types of errors it is making.\n\n\
        \ For more information, see {{:https://en.wikipedia.org/wiki/Confusion_matrix}Confusion \
         matrix} in Wikipedia.\n\
        \ "]
  f1 : generic_bounded_double option;
      [@ocaml.doc
        "The maximum F1 metric indicates the transform's accuracy between 0 and 1, where 1 is the \
         best accuracy.\n\n\
        \ For more information, see {{:https://en.wikipedia.org/wiki/F1_score}F1 score} in \
         Wikipedia.\n\
        \ "]
  recall : generic_bounded_double option;
      [@ocaml.doc
        "The recall metric indicates that for an actual match, how often your transform predicts \
         the match. Specifically, it measures how well the transform finds true positives from the \
         total records in the source data.\n\n\
        \ For more information, see \
         {{:https://en.wikipedia.org/wiki/Precision_and_recall}Precision and recall} in Wikipedia.\n\
        \ "]
  precision : generic_bounded_double option;
      [@ocaml.doc
        "The precision metric indicates when often your transform is correct when it predicts a \
         match. Specifically, it measures how well the transform finds true positives from the \
         total true positives possible.\n\n\
        \ For more information, see \
         {{:https://en.wikipedia.org/wiki/Precision_and_recall}Precision and recall} in Wikipedia.\n\
        \ "]
  area_under_pr_curve : generic_bounded_double option;
      [@ocaml.doc
        "The area under the precision/recall curve (AUPRC) is a single number measuring the \
         overall quality of the transform, that is independent of the choice made for precision \
         vs. recall. Higher values indicate that you have a more attractive precision vs. recall \
         tradeoff.\n\n\
        \ For more information, see \
         {{:https://en.wikipedia.org/wiki/Precision_and_recall}Precision and recall} in Wikipedia.\n\
        \ "]
}
[@@ocaml.doc
  "The evaluation metrics for the find matches algorithm. The quality of your machine learning \
   transform is measured by getting your transform to predict some matches and comparing the \
   results to known matches from the same dataset. The quality metrics are based on a subset of \
   your data, so they are not precise.\n"]

type nonrec evaluation_metrics = {
  find_matches_metrics : find_matches_metrics option;
      [@ocaml.doc "The evaluation metrics for the find matches algorithm.\n"]
  transform_type : transform_type; [@ocaml.doc "The type of machine learning transform.\n"]
}
[@@ocaml.doc
  "Evaluation metrics provide an estimate of the quality of your machine learning transform.\n"]

type nonrec label_count = int [@@ocaml.doc ""]

type nonrec ml_user_data_encryption_mode_string =
  | SSEKMS [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ml_user_data_encryption = {
  kms_key_id : name_string option; [@ocaml.doc "The ID for the customer-provided KMS key.\n"]
  ml_user_data_encryption_mode : ml_user_data_encryption_mode_string;
      [@ocaml.doc
        "The encryption mode applied to user data. Valid values are:\n\n\
        \ {ul\n\
        \       {-  DISABLED: encryption is disabled\n\
        \           \n\
        \            }\n\
        \       {-  SSEKMS: use of server-side encryption with Key Management Service (SSE-KMS) \
         for user data stored in Amazon S3.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The encryption-at-rest settings of the transform that apply to accessing user data.\n"]

type nonrec transform_encryption = {
  task_run_security_configuration_name : name_string option;
      [@ocaml.doc "The name of the security configuration.\n"]
  ml_user_data_encryption : ml_user_data_encryption option;
      [@ocaml.doc
        "An [MLUserDataEncryption] object containing the encryption mode and customer-provided KMS \
         key ID.\n"]
}
[@@ocaml.doc
  "The encryption-at-rest settings of the transform that apply to accessing user data. Machine \
   learning transforms can access user data encrypted in Amazon S3 using KMS.\n\n\
  \ Additionally, imported labels and trained transforms can now be encrypted using a customer \
   provided KMS key.\n\
  \ "]

type nonrec ml_transform = {
  transform_encryption : transform_encryption option;
      [@ocaml.doc
        "The encryption-at-rest settings of the transform that apply to accessing user data. \
         Machine learning transforms can access user data encrypted in Amazon S3 using KMS.\n"]
  max_retries : nullable_integer option;
      [@ocaml.doc
        "The maximum number of times to retry after an [MLTaskRun] of the machine learning \
         transform fails.\n"]
  timeout : timeout option;
      [@ocaml.doc "The timeout in minutes of the machine learning transform.\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when a task of the \
         transform runs.\n\n\
        \ If [WorkerType] is set, then [NumberOfWorkers] is required (and vice versa).\n\
        \ "]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a task of this transform runs. \
         Accepts a value of Standard, G.1X, or G.2X.\n\n\
        \ {ul\n\
        \       {-  For the [Standard] worker type, each worker provides 4 vCPU, 16 GB of memory \
         and a 50GB disk, and 2 executors per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.1X] worker type, each worker provides 4 vCPU, 16 GB of memory and a \
         64GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker provides 8 vCPU, 32 GB of memory and a \
         128GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [MaxCapacity] is a mutually exclusive option with [NumberOfWorkers] and [WorkerType].\n\
        \   \n\
        \    {ul\n\
        \          {-  If either [NumberOfWorkers] or [WorkerType] is set, then [MaxCapacity] \
         cannot be set.\n\
        \              \n\
        \               }\n\
        \          {-  If [MaxCapacity] is set then neither [NumberOfWorkers] or [WorkerType] can \
         be set.\n\
        \              \n\
        \               }\n\
        \          {-  If [WorkerType] is set, then [NumberOfWorkers] is required (and vice versa).\n\
        \              \n\
        \               }\n\
        \          {-   [MaxCapacity] and [NumberOfWorkers] must both be at least 1.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "The number of Glue data processing units (DPUs) that are allocated to task runs for this \
         transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative \
         measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of \
         memory. For more information, see the {{:http://aws.amazon.com/glue/pricing/}Glue pricing \
         page}. \n\n\
        \  [MaxCapacity] is a mutually exclusive option with [NumberOfWorkers] and [WorkerType].\n\
        \ \n\
        \  {ul\n\
        \        {-  If either [NumberOfWorkers] or [WorkerType] is set, then [MaxCapacity] cannot \
         be set.\n\
        \            \n\
        \             }\n\
        \        {-  If [MaxCapacity] is set then neither [NumberOfWorkers] or [WorkerType] can be \
         set.\n\
        \            \n\
        \             }\n\
        \        {-  If [WorkerType] is set, then [NumberOfWorkers] is required (and vice versa).\n\
        \            \n\
        \             }\n\
        \        {-   [MaxCapacity] and [NumberOfWorkers] must both be at least 1.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   When the [WorkerType] field is set to a value other than [Standard], the [MaxCapacity] \
         field is set automatically and becomes read-only.\n\
        \   "]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "This value determines which version of Glue this machine learning transform is compatible \
         with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue \
         compatibility defaults to Glue 0.9. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions}Glue \
         Versions} in the developer guide.\n"]
  role : role_string option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role with the required permissions. The \
         required permissions include both Glue service role permissions to Glue resources, and \
         Amazon S3 permissions required by the transform. \n\n\
        \ {ul\n\
        \       {-  This role needs Glue service role permissions to allow access to resources in \
         Glue. See \
         {{:https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html}Attach a Policy \
         to IAM Users That Access Glue}.\n\
        \           \n\
        \            }\n\
        \       {-  This role needs permission to your Amazon Simple Storage Service (Amazon S3) \
         sources, targets, temporary directory, scripts, and any libraries used by the task run \
         for this transform.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  schema : transform_schema option;
      [@ocaml.doc
        "A map of key-value pairs representing the columns and data types that this transform can \
         run against. Has an upper bound of 100 columns.\n"]
  label_count : label_count option;
      [@ocaml.doc
        "A count identifier for the labeling files generated by Glue for this transform. As you \
         create a better transform, you can iteratively download, label, and upload the labeling \
         file.\n"]
  evaluation_metrics : evaluation_metrics option;
      [@ocaml.doc
        "An [EvaluationMetrics] object. Evaluation metrics provide an estimate of the quality of \
         your machine learning transform.\n"]
  parameters : transform_parameters option;
      [@ocaml.doc
        "A [TransformParameters] object. You can use parameters to tune (customize) the behavior \
         of the machine learning transform by specifying what data it learns from and your \
         preference on various tradeoffs (such as precious vs. recall, or accuracy vs. cost).\n"]
  input_record_tables : glue_tables option;
      [@ocaml.doc "A list of Glue table definitions used by the transform.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc
        "A timestamp. The last point in time when this machine learning transform was modified.\n"]
  created_on : timestamp option;
      [@ocaml.doc
        "A timestamp. The time and date that this machine learning transform was created.\n"]
  status : transform_status_type option;
      [@ocaml.doc "The current status of the machine learning transform.\n"]
  description : description_string option;
      [@ocaml.doc
        "A user-defined, long-form description text for the machine learning transform. \
         Descriptions are not guaranteed to be unique and can be changed at any time.\n"]
  name : name_string option;
      [@ocaml.doc
        "A user-defined name for the machine learning transform. Names are not guaranteed unique \
         and can be changed at any time.\n"]
  transform_id : hash_string option;
      [@ocaml.doc
        "The unique transform ID that is generated for the machine learning transform. The ID is \
         guaranteed to be unique and does not change.\n"]
}
[@@ocaml.doc "A structure for a machine learning transform.\n"]

type nonrec transform_list = ml_transform list [@@ocaml.doc ""]

type nonrec transform_id_list = hash_string list [@@ocaml.doc ""]

type nonrec transform_filter_criteria = {
  schema : transform_schema option;
      [@ocaml.doc
        "Filters on datasets with a specific schema. The \n\
         {[\n\
         Map\n\
         ]}\n\
        \ object is an array of key-value pairs representing the schema this transform accepts, \
         where [Column] is the name of a column, and [Type] is the type of the data such as an \
         integer or string. Has an upper bound of 100 columns.\n"]
  last_modified_after : timestamp option;
      [@ocaml.doc "Filter on transforms last modified after this date.\n"]
  last_modified_before : timestamp option;
      [@ocaml.doc "Filter on transforms last modified before this date.\n"]
  created_after : timestamp option;
      [@ocaml.doc "The time and date after which the transforms were created.\n"]
  created_before : timestamp option;
      [@ocaml.doc "The time and date before which the transforms were created.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "This value determines which version of Glue this machine learning transform is compatible \
         with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue \
         compatibility defaults to Glue 0.9. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions}Glue \
         Versions} in the developer guide.\n"]
  status : transform_status_type option;
      [@ocaml.doc
        "Filters the list of machine learning transforms by the last known status of the \
         transforms (to indicate whether a transform can be used or not). One of \"NOT_READY\", \
         \"READY\", or \"DELETING\".\n"]
  transform_type : transform_type option;
      [@ocaml.doc
        "The type of machine learning transform that is used to filter the machine learning \
         transforms.\n"]
  name : name_string option;
      [@ocaml.doc
        "A unique transform name that is used to filter the machine learning transforms.\n"]
}
[@@ocaml.doc "The criteria used to filter the machine learning transforms.\n"]

type nonrec total_segments_integer = int [@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec inclusion_annotation_value = EXCLUDE [@ocaml.doc ""] | INCLUDE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamped_inclusion_annotation = {
  last_modified_on : timestamp option;
      [@ocaml.doc "The timestamp when the inclusion annotation was last modified.\n"]
  value : inclusion_annotation_value option; [@ocaml.doc "The inclusion annotation value.\n"]
}
[@@ocaml.doc "A timestamped inclusion annotation.\n"]

type nonrec timestamp_filter = {
  recorded_after : timestamp option;
      [@ocaml.doc "The timestamp after which statistics should be included in the results.\n"]
  recorded_before : timestamp option;
      [@ocaml.doc "The timestamp before which statistics should be included in the results.\n"]
}
[@@ocaml.doc "A timestamp filter.\n"]

type nonrec test_connection_response = unit [@@ocaml.doc ""]

type nonrec test_connection_input = {
  authentication_configuration : authentication_configuration_input option;
      [@ocaml.doc
        "A structure containing the authentication configuration in the TestConnection request. \
         Required for a connection to Salesforce using OAuth authentication.\n"]
  connection_properties : connection_properties;
      [@ocaml.doc
        "The key-value pairs that define parameters for the connection.\n\n\
        \ JDBC connections use the following connection properties:\n\
        \ \n\
        \  {ul\n\
        \        {-  Required: All of ([HOST], [PORT], [JDBC_ENGINE]) or [JDBC_CONNECTION_URL].\n\
        \            \n\
        \             }\n\
        \        {-  Required: All of ([USERNAME], [PASSWORD]) or [SECRET_ID].\n\
        \            \n\
        \             }\n\
        \        {-  Optional: [JDBC_ENFORCE_SSL], [CUSTOM_JDBC_CERT], [CUSTOM_JDBC_CERT_STRING], \
         [SKIP_CUSTOM_JDBC_CERT_VALIDATION]. These parameters are used to configure SSL with JDBC.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   SALESFORCE connections require the [AuthenticationConfiguration] member to be \
         configured.\n\
        \   "]
  connection_type : connection_type;
      [@ocaml.doc
        "The type of connection to test. This operation is only available for the [JDBC] or \
         [SALESFORCE] connection types.\n"]
}
[@@ocaml.doc "A structure that is used to specify testing a connection to a service.\n"]

type nonrec test_connection_request = {
  test_connection_input : test_connection_input option;
      [@ocaml.doc "A structure that is used to specify testing a connection to a service.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The catalog ID where the connection resides.\n"]
  connection_name : name_string option;
      [@ocaml.doc
        "Optional. The name of the connection to test. If only name is provided, the operation \
         will get the connection and use that for testing.\n"]
}
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The [CreatePartitions] API was called on a table that has indexes enabled. \n"]

type nonrec task_type =
  | FIND_MATCHES [@ocaml.doc ""]
  | EXPORT_LABELS [@ocaml.doc ""]
  | IMPORT_LABELS [@ocaml.doc ""]
  | LABELING_SET_GENERATION [@ocaml.doc ""]
  | EVALUATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_status_type =
  | TIMEOUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_run_sort_column_type =
  | STARTED [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | TASK_RUN_TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_run_sort_criteria = {
  sort_direction : sort_direction_type;
      [@ocaml.doc
        "The sort direction to be used to sort the list of task runs for the machine learning \
         transform.\n"]
  column : task_run_sort_column_type;
      [@ocaml.doc
        "The column to be used to sort the list of task runs for the machine learning transform.\n"]
}
[@@ocaml.doc
  "The sorting criteria that are used to sort the list of task runs for the machine learning \
   transform.\n"]

type nonrec replace_boolean = bool [@@ocaml.doc ""]

type nonrec import_labels_task_run_properties = {
  replace : replace_boolean option;
      [@ocaml.doc "Indicates whether to overwrite your existing labels.\n"]
  input_s3_path : uri_string option;
      [@ocaml.doc
        "The Amazon Simple Storage Service (Amazon S3) path from where you will import the labels.\n"]
}
[@@ocaml.doc "Specifies configuration properties for an importing labels task run.\n"]

type nonrec export_labels_task_run_properties = {
  output_s3_path : uri_string option;
      [@ocaml.doc
        "The Amazon Simple Storage Service (Amazon S3) path where you will export the labels.\n"]
}
[@@ocaml.doc "Specifies configuration properties for an exporting labels task run.\n"]

type nonrec labeling_set_generation_task_run_properties = {
  output_s3_path : uri_string option;
      [@ocaml.doc
        "The Amazon Simple Storage Service (Amazon S3) path where you will generate the labeling \
         set.\n"]
}
[@@ocaml.doc "Specifies configuration properties for a labeling set generation task run.\n"]

type nonrec find_matches_task_run_properties = {
  job_run_id : hash_string option; [@ocaml.doc "The job run ID for the Find Matches task run.\n"]
  job_name : name_string option;
      [@ocaml.doc "The name assigned to the job for the Find Matches task run.\n"]
  job_id : hash_string option; [@ocaml.doc "The job ID for the Find Matches task run.\n"]
}
[@@ocaml.doc "Specifies configuration properties for a Find Matches task run.\n"]

type nonrec task_run_properties = {
  find_matches_task_run_properties : find_matches_task_run_properties option;
      [@ocaml.doc "The configuration properties for a find matches task run.\n"]
  labeling_set_generation_task_run_properties : labeling_set_generation_task_run_properties option;
      [@ocaml.doc "The configuration properties for a labeling set generation task run.\n"]
  export_labels_task_run_properties : export_labels_task_run_properties option;
      [@ocaml.doc "The configuration properties for an exporting labels task run.\n"]
  import_labels_task_run_properties : import_labels_task_run_properties option;
      [@ocaml.doc "The configuration properties for an importing labels task run.\n"]
  task_type : task_type option; [@ocaml.doc "The type of task run.\n"]
}
[@@ocaml.doc "The configuration properties for the task run.\n"]

type nonrec task_run = {
  execution_time : execution_time option;
      [@ocaml.doc "The amount of time (in seconds) that the task run consumed resources.\n"]
  completed_on : timestamp option;
      [@ocaml.doc "The last point in time that the requested task run was completed.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc "The last point in time that the requested task run was updated.\n"]
  started_on : timestamp option; [@ocaml.doc "The date and time that this task run started.\n"]
  error_string : generic_string option;
      [@ocaml.doc "The list of error strings associated with this task run.\n"]
  properties : task_run_properties option;
      [@ocaml.doc "Specifies configuration properties associated with this task run.\n"]
  log_group_name : generic_string option;
      [@ocaml.doc "The names of the log group for secure logging, associated with this task run.\n"]
  status : task_status_type option; [@ocaml.doc "The current status of the requested task run.\n"]
  task_run_id : hash_string option; [@ocaml.doc "The unique identifier for this task run.\n"]
  transform_id : hash_string option; [@ocaml.doc "The unique identifier for the transform.\n"]
}
[@@ocaml.doc "The sampling parameters that are associated with the machine learning transform.\n"]

type nonrec task_run_list = task_run list [@@ocaml.doc ""]

type nonrec task_run_filter_criteria = {
  started_after : timestamp option; [@ocaml.doc "Filter on task runs started after this date.\n"]
  started_before : timestamp option; [@ocaml.doc "Filter on task runs started before this date.\n"]
  status : task_status_type option; [@ocaml.doc "The current status of the task run.\n"]
  task_run_type : task_type option; [@ocaml.doc "The type of task run.\n"]
}
[@@ocaml.doc
  "The criteria that are used to filter the task runs for the machine learning transform.\n"]

type nonrec target_resource_not_found = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The target resource could not be found.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tags_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags_to_add : tags_map; [@ocaml.doc "Tags to add to this resource.\n"]
  resource_arn : glue_resource_arn;
      [@ocaml.doc
        "The ARN of the Glue resource to which to add the tags. For more information about Glue \
         resource ARNs, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html#aws-glue-api-regex-aws-glue-arn-id}Glue \
         ARN string pattern}.\n"]
}
[@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option;
      [@ocaml.doc
        "The tag value. The value is optional when you create a tag on an object. The value is \
         case-sensitive, and must not contain the prefix aws.\n"]
  key : tag_key option;
      [@ocaml.doc
        "The tag key. The key is required when you create a tag on an object. The key is \
         case-sensitive, and must not contain the prefix aws.\n"]
}
[@@ocaml.doc
  "The [Tag] object represents a label that you can assign to an Amazon Web Services resource. \
   Each tag consists of a key and an optional value, both of which you define.\n\n\
  \ For more information about tags, and controlling access to resources in Glue, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags in \
   Glue} and \
   {{:https://docs.aws.amazon.com/glue/latest/dg/glue-specifying-resource-arns.html}Specifying \
   Glue Resource ARNs} in the developer guide.\n\
  \ "]

type nonrec table_version_error = {
  error_detail : error_detail option; [@ocaml.doc "The details about the error.\n"]
  version_id : version_string option;
      [@ocaml.doc
        "The ID value of the version in question. A [VersionID] is a string representation of an \
         integer. Each version is incremented by 1.\n"]
  table_name : name_string option; [@ocaml.doc "The name of the table in question.\n"]
}
[@@ocaml.doc "An error record for table-version operations.\n"]

type nonrec table_version_errors = table_version_error list [@@ocaml.doc ""]

type nonrec federated_table = {
  connection_type : name_string option;
      [@ocaml.doc
        "The type of connection used to access the federated table, specifying the protocol or \
         method for connecting to the external data source.\n"]
  connection_name : name_string option;
      [@ocaml.doc "The name of the connection to the external metastore.\n"]
  database_identifier : federation_identifier option;
      [@ocaml.doc "A unique identifier for the federated database.\n"]
  identifier : federation_identifier option;
      [@ocaml.doc "A unique identifier for the federated table.\n"]
}
[@@ocaml.doc "A table that points to an entity outside the Glue Data Catalog.\n"]

type nonrec table_id_string = string [@@ocaml.doc ""]

type nonrec iceberg_schema_list = iceberg_schema list [@@ocaml.doc ""]

type nonrec iceberg_partition_spec_list = iceberg_partition_spec list [@@ocaml.doc ""]

type nonrec iceberg_sort_order_list = iceberg_sort_order list [@@ocaml.doc ""]

type nonrec iceberg_table_metadata = {
  default_sort_order_id : integer option;
      [@ocaml.doc
        "The identifier of the sort order that is currently used by default when writing new data \
         to the Iceberg table.\n"]
  sort_orders : iceberg_sort_order_list option;
      [@ocaml.doc
        "The list of sort order specifications that have been associated with the Iceberg table \
         over its history.\n"]
  last_partition_id : integer option;
      [@ocaml.doc
        "The highest partition field identifier that has been assigned across the table's \
         partition specifications.\n"]
  default_spec_id : integer option;
      [@ocaml.doc
        "The identifier of the partition specification that is currently used by default when \
         writing new data to the Iceberg table.\n"]
  partition_specs : iceberg_partition_spec_list option;
      [@ocaml.doc
        "The list of partition specifications that have been associated with the Iceberg table \
         over its history, supporting partition evolution.\n"]
  last_column_id : integer option;
      [@ocaml.doc
        "The highest column identifier that has been assigned in the Iceberg table's schema, used \
         to ensure unique IDs as new columns are added.\n"]
  current_schema_id : integer option;
      [@ocaml.doc
        "The identifier of the schema that is currently active for the Iceberg table. Matches an \
         entry in [Schemas].\n"]
  schemas : iceberg_schema_list option;
      [@ocaml.doc
        "The list of schemas that have been associated with the Iceberg table over its history, \
         supporting schema evolution.\n"]
  properties : string_to_string_map option;
      [@ocaml.doc
        "A map of key-value pairs that define table-level properties and configuration settings \
         for the Iceberg table.\n"]
  location : location_string option;
      [@ocaml.doc
        "The base S3 location where the Iceberg table's data and metadata files are stored.\n"]
  table_uuid : table_id_string option;
      [@ocaml.doc
        "The unique identifier (UUID) for the Iceberg table, assigned when the table is created \
         and used to track the table across metadata updates.\n"]
  format_version : version_string option;
      [@ocaml.doc
        "The Apache Iceberg table format version, such as [1] or [2]. Determines the set of \
         features and on-disk layout supported by the table.\n"]
}
[@@ocaml.doc
  "The Apache Iceberg table metadata, including format version, table identifier, schemas, \
   partition specifications, sort orders, and table properties. This structure captures the \
   current state of an Iceberg table's metadata as managed by the Glue Data Catalog.\n"]

type nonrec resource_action = CREATE [@ocaml.doc ""] | UPDATE [@ocaml.doc ""] [@@ocaml.doc ""]

type status_details = {
  view_validations : view_validation_list option;
      [@ocaml.doc
        "A list of [ViewValidation] objects that contain information for an analytical engine to \
         validate a view.\n"]
  requested_change : table option;
      [@ocaml.doc "A [Table] object representing the requested changes.\n"]
}
[@@ocaml.doc "A structure containing information about an asynchronous change to a table.\n"]

and table = {
  status : table_status option;
      [@ocaml.doc "Indicates the the state of an asynchronous change to a table.\n"]
  iceberg_table_metadata : iceberg_table_metadata option;
      [@ocaml.doc
        "The latest Apache Iceberg table metadata for the table, including format version, \
         schemas, partition specifications, and sort orders. This field is populated for Iceberg \
         tables and reflects the current state of the table's Iceberg metadata.\n"]
  is_materialized_view : nullable_boolean option;
      [@ocaml.doc "Indicates a table is a [MaterializedView].\n"]
  is_multi_dialect_view : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether the view supports the SQL dialects of one or more different query \
         engines and can therefore be read by those engines.\n"]
  view_definition : view_definition option;
      [@ocaml.doc
        "A structure that contains all the information that defines the view, including the \
         dialect or dialects for the view, and the query.\n"]
  federated_table : federated_table option;
      [@ocaml.doc
        "A [FederatedTable] structure that references an entity outside the Glue Data Catalog.\n"]
  version_id : version_string option; [@ocaml.doc "The ID of the table version.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the table resides.\n"]
  target_table : table_identifier option;
      [@ocaml.doc
        "A [TableIdentifier] structure that describes a target table for resource linking.\n"]
  is_registered_with_lake_formation : boolean_ option;
      [@ocaml.doc "Indicates whether the table has been registered with Lake Formation.\n"]
  created_by : name_string option; [@ocaml.doc "The person or entity who created the table.\n"]
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define properties associated with the table.\n"]
  table_type : table_type_string option;
      [@ocaml.doc
        "The type of this table. Glue will create tables with the [EXTERNAL_TABLE] type. Other \
         services, such as Athena, may create tables with additional table types. \n\n\
        \ Glue related table types:\n\
        \ \n\
        \   EXTERNAL_TABLE  Hive compatible attribute - indicates a non-Hive managed table.\n\
        \                   \n\
        \                     GOVERNED  Used by Lake Formation. The Glue Data Catalog understands \
         [GOVERNED].\n\
        \                               \n\
        \                                 "]
  view_expanded_text : view_text_string option;
      [@ocaml.doc
        "Included for Apache Hive compatibility. Not used in the normal course of Glue operations.\n"]
  view_original_text : view_text_string option;
      [@ocaml.doc
        "Included for Apache Hive compatibility. Not used in the normal course of Glue operations. \
         If the table is a [VIRTUAL_VIEW], certain Athena configuration encoded in base64.\n"]
  partition_keys : column_list option;
      [@ocaml.doc
        "A list of columns by which the table is partitioned. Only primitive types are supported \
         as partition keys.\n\n\
        \ When you create a table used by Amazon Athena, and you do not specify any \
         [partitionKeys], you must at least set the value of [partitionKeys] to an empty list. For \
         example:\n\
        \ \n\
        \   [\"PartitionKeys\": \\[\\]] \n\
        \  "]
  storage_descriptor : storage_descriptor option;
      [@ocaml.doc
        "A storage descriptor containing information about the physical storage of this table.\n"]
  retention : non_negative_integer option; [@ocaml.doc "The retention time for this table.\n"]
  last_analyzed_time : timestamp option;
      [@ocaml.doc "The last time that column statistics were computed for this table.\n"]
  last_access_time : timestamp option;
      [@ocaml.doc
        "The last time that the table was accessed. This is usually taken from HDFS, and might not \
         be reliable.\n"]
  update_time : timestamp option; [@ocaml.doc "The last time that the table was updated.\n"]
  create_time : timestamp option;
      [@ocaml.doc "The time when the table definition was created in the Data Catalog.\n"]
  owner : name_string option; [@ocaml.doc "The owner of the table.\n"]
  description : description_string option; [@ocaml.doc "A description of the table.\n"]
  database_name : name_string option;
      [@ocaml.doc
        "The name of the database where the table metadata resides. For Hive compatibility, this \
         must be all lowercase.\n"]
  name : name_string;
      [@ocaml.doc "The table name. For Hive compatibility, this must be entirely lowercase.\n"]
}
[@@ocaml.doc "Represents a collection of related data organized in columns and rows.\n"]

and table_status = {
  details : status_details option;
      [@ocaml.doc "A [StatusDetails] object with information about the requested change.\n"]
  error : error_detail option;
      [@ocaml.doc
        "An error that will only appear when the state is \"FAILED\". This is a parent level \
         exception message, there may be different [Error]s for each dialect.\n"]
  state : resource_state option;
      [@ocaml.doc
        "A generic status for the change in progress, such as QUEUED, IN_PROGRESS, SUCCESS, or \
         FAILED.\n"]
  action : resource_action option;
      [@ocaml.doc
        "Indicates which action was called on the table, currently only [CREATE] or [UPDATE].\n"]
  update_time : timestamp option;
      [@ocaml.doc
        "An ISO 8601 formatted date string indicating the time that the state was last updated.\n"]
  request_time : timestamp option;
      [@ocaml.doc
        "An ISO 8601 formatted date string indicating the time that the change was initiated.\n"]
  updated_by : name_string option;
      [@ocaml.doc
        "The ARN of the user to last manually alter the asynchronous change (requesting \
         cancellation, etc).\n"]
  requested_by : name_string option;
      [@ocaml.doc "The ARN of the user who requested the asynchronous change.\n"]
}
[@@ocaml.doc
  "A structure containing information about the state of an asynchronous change to a table.\n"]

type nonrec table_version = {
  version_id : version_string option;
      [@ocaml.doc
        "The ID value that identifies this table version. A [VersionId] is a string representation \
         of an integer. Each version is incremented by 1.\n"]
  table : table option; [@ocaml.doc "The table in question.\n"]
}
[@@ocaml.doc "Specifies a version of a table.\n"]

type nonrec table_optimizer_event_type =
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_optimizer_run_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec run_metrics = {
  job_duration_in_hour : message_string option; [@ocaml.doc "The duration of the job in hours.\n"]
  number_of_dpus : message_string option;
      [@ocaml.doc
        "The number of DPUs consumed by the job, rounded up to the nearest whole number.\n"]
  number_of_files_compacted : message_string option;
      [@ocaml.doc "The number of files removed by the compaction job run.\n"]
  number_of_bytes_compacted : message_string option;
      [@ocaml.doc "The number of bytes removed by the compaction job run.\n"]
}
[@@ocaml.doc
  "Metrics for the optimizer run.\n\n\
  \ This structure is deprecated. See the individual metric members for compaction, retention, and \
   orphan file deletion.\n\
  \ "]

type nonrec iceberg_compaction_metrics = {
  job_duration_in_hour : dpu_duration_in_hour option;
      [@ocaml.doc "The duration of the job in hours.\n"]
  number_of_dpus : dpu_counts option;
      [@ocaml.doc
        "The number of DPUs consumed by the job, rounded up to the nearest whole number.\n"]
  dpu_hours : dpu_hours option; [@ocaml.doc "The number of DPU hours consumed by the job.\n"]
  number_of_files_compacted : metric_counts option;
      [@ocaml.doc "The number of files removed by the compaction job run.\n"]
  number_of_bytes_compacted : metric_counts option;
      [@ocaml.doc "The number of bytes removed by the compaction job run.\n"]
}
[@@ocaml.doc "Compaction metrics for Iceberg for the optimizer run.\n"]

type nonrec compaction_metrics = {
  iceberg_metrics : iceberg_compaction_metrics option;
      [@ocaml.doc "A structure containing the Iceberg compaction metrics for the optimizer run.\n"]
}
[@@ocaml.doc "A structure that contains compaction metrics for the optimizer run.\n"]

type nonrec iceberg_retention_metrics = {
  job_duration_in_hour : dpu_duration_in_hour option;
      [@ocaml.doc "The duration of the job in hours.\n"]
  number_of_dpus : dpu_counts option;
      [@ocaml.doc
        "The number of DPUs consumed by the job, rounded up to the nearest whole number.\n"]
  dpu_hours : dpu_hours option; [@ocaml.doc "The number of DPU hours consumed by the job.\n"]
  number_of_manifest_lists_deleted : metric_counts option;
      [@ocaml.doc "The number of manifest lists deleted by the retention job run.\n"]
  number_of_manifest_files_deleted : metric_counts option;
      [@ocaml.doc "The number of manifest files deleted by the retention job run.\n"]
  number_of_data_files_deleted : metric_counts option;
      [@ocaml.doc "The number of data files deleted by the retention job run.\n"]
}
[@@ocaml.doc "Snapshot retention metrics for Iceberg for the optimizer run.\n"]

type nonrec retention_metrics = {
  iceberg_metrics : iceberg_retention_metrics option;
      [@ocaml.doc "A structure containing the Iceberg retention metrics for the optimizer run.\n"]
}
[@@ocaml.doc "A structure that contains retention metrics for the optimizer run.\n"]

type nonrec iceberg_orphan_file_deletion_metrics = {
  job_duration_in_hour : dpu_duration_in_hour option;
      [@ocaml.doc "The duration of the job in hours.\n"]
  number_of_dpus : dpu_counts option;
      [@ocaml.doc
        "The number of DPUs consumed by the job, rounded up to the nearest whole number.\n"]
  dpu_hours : dpu_hours option; [@ocaml.doc "The number of DPU hours consumed by the job.\n"]
  number_of_orphan_files_deleted : metric_counts option;
      [@ocaml.doc "The number of orphan files deleted by the orphan file deletion job run.\n"]
}
[@@ocaml.doc "Orphan file deletion metrics for Iceberg for the optimizer run.\n"]

type nonrec orphan_file_deletion_metrics = {
  iceberg_metrics : iceberg_orphan_file_deletion_metrics option;
      [@ocaml.doc
        "A structure containing the Iceberg orphan file deletion metrics for the optimizer run.\n"]
}
[@@ocaml.doc "A structure that contains orphan file deletion metrics for the optimizer run.\n"]

type nonrec table_optimizer_run = {
  orphan_file_deletion_metrics : orphan_file_deletion_metrics option;
      [@ocaml.doc
        "An [OrphanFileDeletionMetrics] object containing metrics for the optimizer run.\n"]
  retention_metrics : retention_metrics option;
      [@ocaml.doc "A [RetentionMetrics] object containing metrics for the optimizer run.\n"]
  compaction_strategy : compaction_strategy option;
      [@ocaml.doc
        "The strategy used for the compaction run. Indicates which algorithm was applied to \
         determine how files were selected and combined during the compaction process. Valid \
         values are:\n\n\
        \ {ul\n\
        \       {-   [binpack]: Combines small files into larger files, typically targeting sizes \
         over 100MB, while applying any pending deletes. This is the recommended compaction \
         strategy for most use cases. \n\
        \           \n\
        \            }\n\
        \       {-   [sort]: Organizes data based on specified columns which are sorted \
         hierarchically during compaction, improving query performance for filtered operations. \
         This strategy is recommended when your queries frequently filter on specific columns. To \
         use this strategy, you must first define a sort order in your Iceberg table properties \
         using the [sort_order] table property.\n\
        \           \n\
        \            }\n\
        \       {-   [z-order]: Optimizes data organization by blending multiple attributes into a \
         single scalar value that can be used for sorting, allowing efficient querying across \
         multiple dimensions. This strategy is recommended when you need to query data across \
         multiple dimensions simultaneously. To use this strategy, you must first define a sort \
         order in your Iceberg table properties using the [sort_order] table property. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  compaction_metrics : compaction_metrics option;
      [@ocaml.doc "A [CompactionMetrics] object containing metrics for the optimizer run.\n"]
  error : message_string option; [@ocaml.doc "An error that occured during the optimizer run.\n"]
  metrics : run_metrics option;
      [@ocaml.doc
        "A [RunMetrics] object containing metrics for the optimizer run.\n\n\
        \ This member is deprecated. See the individual metric members for compaction, retention, \
         and orphan file deletion.\n\
        \ "]
  end_timestamp : table_optimizer_run_timestamp option;
      [@ocaml.doc "Represents the epoch timestamp at which the compaction job ended.\n"]
  start_timestamp : table_optimizer_run_timestamp option;
      [@ocaml.doc
        "Represents the epoch timestamp at which the compaction job was started within Lake \
         Formation.\n"]
  event_type : table_optimizer_event_type option;
      [@ocaml.doc "An event type representing the status of the table optimizer run.\n"]
}
[@@ocaml.doc "Contains details for a table optimizer run.\n"]

type nonrec table_optimizer_runs = table_optimizer_run list [@@ocaml.doc ""]

type nonrec configuration_source = TABLE [@ocaml.doc ""] | CATALOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_optimizer = {
  configuration_source : configuration_source option;
      [@ocaml.doc
        " Specifies the source of the optimizer configuration. This indicates how the table \
         optimizer was configured and which entity or service initiated the configuration. \n"]
  last_run : table_optimizer_run option;
      [@ocaml.doc
        "A [TableOptimizerRun] object representing the last run of the table optimizer.\n"]
  configuration : table_optimizer_configuration option;
      [@ocaml.doc
        "A [TableOptimizerConfiguration] object that was specified when creating or updating a \
         table optimizer.\n"]
  type_ : table_optimizer_type option;
      [@ocaml.doc
        "The type of table optimizer. The valid values are:\n\n\
        \ {ul\n\
        \       {-   [compaction]: for managing compaction with a table optimizer.\n\
        \           \n\
        \            }\n\
        \       {-   [retention]: for managing the retention of snapshot with a table optimizer.\n\
        \           \n\
        \            }\n\
        \       {-   [orphan_file_deletion]: for managing the deletion of orphan files with a \
         table optimizer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Contains details about an optimizer associated with a table.\n"]

type nonrec table_name = string [@@ocaml.doc ""]

type nonrec table_list = table list [@@ocaml.doc ""]

type nonrec table_error = {
  error_detail : error_detail option; [@ocaml.doc "The details about the error.\n"]
  table_name : name_string option;
      [@ocaml.doc
        "The name of the table. For Hive compatibility, this must be entirely lowercase.\n"]
}
[@@ocaml.doc "An error record for table operations.\n"]

type nonrec table_errors = table_error list [@@ocaml.doc ""]

type nonrec table_attributes =
  | LATEST_ICEBERG_METADATA [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
  | TABLE_TYPE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_attributes_list = table_attributes list [@@ocaml.doc ""]

type nonrec supported_dialect = {
  dialect_version : view_dialect_version_string option;
      [@ocaml.doc "The version of the dialect of the query engine. For example, 3.0.0.\n"]
  dialect : view_dialect option; [@ocaml.doc "The dialect of the query engine.\n"]
}
[@@ocaml.doc "A structure specifying the dialect and dialect version used by the query engine.\n"]

type nonrec string1024 = string [@@ocaml.doc ""]

type nonrec stop_workflow_run_response = unit [@@ocaml.doc ""]

type nonrec stop_workflow_run_request = {
  run_id : id_string; [@ocaml.doc "The ID of the workflow run to stop.\n"]
  name : name_string; [@ocaml.doc "The name of the workflow to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec illegal_workflow_state_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The workflow is in an invalid state to perform a requested operation.\n"]

type nonrec stop_trigger_response = {
  name : name_string option; [@ocaml.doc "The name of the trigger that was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_trigger_request = {
  name : name_string; [@ocaml.doc "The name of the trigger to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_session_response = {
  id : name_string option; [@ocaml.doc "Returns the Id of the stopped session.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_session_request = {
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request.\n"]
  id : name_string; [@ocaml.doc "The ID of the session to be stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec illegal_session_state_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The session is in an invalid state to perform a requested operation.\n"]

type nonrec stop_materialized_view_refresh_task_run_response = unit [@@ocaml.doc ""]

type nonrec stop_materialized_view_refresh_task_run_request = {
  table_name : name_string; [@ocaml.doc "The name of the table to generate statistics.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
  catalog_id : name_string;
      [@ocaml.doc
        "The ID of the Data Catalog where the table reside. If none is supplied, the account ID is \
         used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec materialized_view_refresh_task_stopping_exception = {
  message : message_string option; [@ocaml.doc ""]
}
[@@ocaml.doc "Exception thrown when a task is already in stopping state.\n"]

type nonrec materialized_view_refresh_task_not_running_exception = {
  message : message_string option; [@ocaml.doc ""]
}
[@@ocaml.doc "Exception thrown when stopping a task that is not in running state.\n"]

type nonrec stop_crawler_schedule_response = unit [@@ocaml.doc ""]

type nonrec stop_crawler_schedule_request = {
  crawler_name : name_string; [@ocaml.doc "Name of the crawler whose schedule state to set.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduler_not_running_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The specified scheduler is not running.\n"]

type nonrec stop_crawler_response = unit [@@ocaml.doc ""]

type nonrec stop_crawler_request = {
  name : name_string; [@ocaml.doc "Name of the crawler to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec crawler_stopping_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The specified crawler is stopping.\n"]

type nonrec crawler_not_running_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The specified crawler is not running.\n"]

type nonrec stop_column_statistics_task_run_schedule_response = unit [@@ocaml.doc ""]

type nonrec stop_column_statistics_task_run_schedule_request = {
  table_name : name_string;
      [@ocaml.doc "The name of the table for which to stop a column statistic task run schedule.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_column_statistics_task_run_response = unit [@@ocaml.doc ""]

type nonrec stop_column_statistics_task_run_request = {
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : database_name; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec column_statistics_task_stopping_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "An exception thrown when you try to stop a task run.\n"]

type nonrec column_statistics_task_not_running_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "An exception thrown when you try to stop a task run when there is no task running.\n"]

type nonrec run_identifier = {
  job_run_id : hash_string option; [@ocaml.doc "The Job Run ID.\n"]
  run_id : hash_string option; [@ocaml.doc "The Run ID.\n"]
}
[@@ocaml.doc "A run identifier.\n"]

type nonrec statistic_name_string = string [@@ocaml.doc ""]

type nonrec statistic_evaluation_level =
  | MULTICOLUMN [@ocaml.doc ""]
  | COLUMN [@ocaml.doc ""]
  | DATASET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reference_datasets_list = name_string list [@@ocaml.doc ""]

type nonrec statistic_properties_map = (name_string * description_string) list [@@ocaml.doc ""]

type nonrec statistic_summary = {
  inclusion_annotation : timestamped_inclusion_annotation option;
      [@ocaml.doc "The inclusion annotation for the statistic.\n"]
  recorded_on : timestamp option; [@ocaml.doc "The timestamp when the statistic was recorded.\n"]
  statistic_properties : statistic_properties_map option;
      [@ocaml.doc
        "A [StatisticPropertiesMap], which contains a [NameString] and [DescriptionString] \n"]
  referenced_datasets : reference_datasets_list option;
      [@ocaml.doc "The list of datasets referenced by the statistic.\n"]
  columns_referenced : column_name_list option;
      [@ocaml.doc "The list of columns referenced by the statistic.\n"]
  evaluation_level : statistic_evaluation_level option;
      [@ocaml.doc
        "The evaluation level of the statistic. Possible values: [Dataset], [Column], [Multicolumn].\n"]
  double_value : double option; [@ocaml.doc "The value of the statistic.\n"]
  statistic_name : statistic_name_string option; [@ocaml.doc "The name of the statistic.\n"]
  run_identifier : run_identifier option; [@ocaml.doc "The Run Identifier\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
}
[@@ocaml.doc "Summary information about a statistic.\n"]

type nonrec statistic_summary_list = statistic_summary list [@@ocaml.doc ""]

type nonrec statistic_model_result = {
  inclusion_annotation : inclusion_annotation_value option;
      [@ocaml.doc "The inclusion annotation.\n"]
  date : timestamp option; [@ocaml.doc "The date.\n"]
  actual_value : nullable_double option; [@ocaml.doc "The actual value.\n"]
  predicted_value : nullable_double option; [@ocaml.doc "The predicted value.\n"]
  upper_bound : nullable_double option; [@ocaml.doc "The upper bound.\n"]
  lower_bound : nullable_double option; [@ocaml.doc "The lower bound.\n"]
}
[@@ocaml.doc "The statistic model result.\n"]

type nonrec statistic_model_results = statistic_model_result list [@@ocaml.doc ""]

type nonrec statistic_annotation = {
  inclusion_annotation : timestamped_inclusion_annotation option;
      [@ocaml.doc "The inclusion annotation applied to the statistic.\n"]
  statistic_recorded_on : timestamp option;
      [@ocaml.doc "The timestamp when the annotated statistic was recorded.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID.\n"]
}
[@@ocaml.doc "A Statistic Annotation.\n"]

type nonrec statement_state =
  | ERROR [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | WAITING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec statement_output_data = {
  text_plain : generic_string option; [@ocaml.doc "The code execution output in text format.\n"]
}
[@@ocaml.doc "The code execution output in JSON format.\n"]

type nonrec orchestration_string_list = generic_string list [@@ocaml.doc ""]

type nonrec statement_output = {
  traceback : orchestration_string_list option; [@ocaml.doc "The traceback of the output.\n"]
  error_value : generic_string option; [@ocaml.doc "The error value of the output.\n"]
  error_name : generic_string option; [@ocaml.doc "The name of the error in the output.\n"]
  status : statement_state option; [@ocaml.doc "The status of the code execution output.\n"]
  execution_count : integer_value option; [@ocaml.doc "The execution count of the output.\n"]
  data : statement_output_data option; [@ocaml.doc "The code execution output.\n"]
}
[@@ocaml.doc "The code execution output in JSON format.\n"]

type nonrec double_value = float [@@ocaml.doc ""]

type nonrec long_value = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec statement = {
  completed_on : long_value option;
      [@ocaml.doc "The unix time and date that the job definition was completed.\n"]
  started_on : long_value option;
      [@ocaml.doc "The unix time and date that the job definition was started.\n"]
  progress : double_value option; [@ocaml.doc "The code execution progress.\n"]
  output : statement_output option; [@ocaml.doc "The output in JSON.\n"]
  state : statement_state option; [@ocaml.doc "The state while request is actioned.\n"]
  code : generic_string option; [@ocaml.doc "The execution code of the statement.\n"]
  id : integer_value option; [@ocaml.doc "The ID of the statement.\n"]
}
[@@ocaml.doc "The statement or request for a particular action to occur in a session.\n"]

type nonrec statement_list = statement list [@@ocaml.doc ""]

type nonrec start_workflow_run_response = {
  run_id : id_string option; [@ocaml.doc "An Id for the new run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_workflow_run_request = {
  run_properties : workflow_run_properties option;
      [@ocaml.doc
        "The workflow run properties for the new workflow run.\n\n\
        \ Run properties may be logged. Do not pass plaintext secrets as properties. Retrieve \
         secrets from a Glue Connection, Amazon Web Services Secrets Manager or other secret \
         management mechanism if you intend to use them within the workflow run.\n\
        \ "]
  name : name_string; [@ocaml.doc "The name of the workflow to start.\n"]
}
[@@ocaml.doc ""]

type nonrec concurrent_runs_exceeded_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "Too many jobs are being run concurrently.\n"]

type nonrec start_trigger_response = {
  name : name_string option; [@ocaml.doc "The name of the trigger that was started.\n"]
}
[@@ocaml.doc ""]

type nonrec start_trigger_request = {
  name : name_string; [@ocaml.doc "The name of the trigger to start.\n"]
}
[@@ocaml.doc ""]

type nonrec start_materialized_view_refresh_task_run_response = {
  materialized_view_refresh_task_run_id : uui_dv4 option;
      [@ocaml.doc "The identifier for the materialized view refresh task run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_materialized_view_refresh_task_run_request = {
  full_refresh : nullable_boolean option;
      [@ocaml.doc "Specifies whether this is a full refresh of the task run.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the table to generate run the materialized view refresh task.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
  catalog_id : name_string;
      [@ocaml.doc
        "The ID of the Data Catalog where the table reside. If none is supplied, the account ID is \
         used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec materialized_view_refresh_task_running_exception = {
  message : message_string option; [@ocaml.doc ""]
}
[@@ocaml.doc "Exception thrown when a task is already in running state.\n"]

type nonrec start_ml_labeling_set_generation_task_run_response = {
  task_run_id : hash_string option;
      [@ocaml.doc "The unique run identifier that is associated with this task run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_ml_labeling_set_generation_task_run_request = {
  output_s3_path : uri_string;
      [@ocaml.doc
        "The Amazon Simple Storage Service (Amazon S3) path where you generate the labeling set.\n"]
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec start_ml_evaluation_task_run_response = {
  task_run_id : hash_string option; [@ocaml.doc "The unique identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_ml_evaluation_task_run_request = {
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec ml_transform_not_ready_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The machine learning transform is not ready to run.\n"]

type nonrec start_job_run_response = {
  job_run_id : id_string option; [@ocaml.doc "The ID assigned to this job run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_job_run_request = {
  execution_role_session_policy : orchestration_policy_json_string option;
      [@ocaml.doc
        "This inline session policy to the StartJobRun API allows you to dynamically restrict the \
         permissions of the specified execution role for the scope of the job, without requiring \
         the creation of additional IAM roles.\n"]
  execution_class : execution_class option;
      [@ocaml.doc
        "Indicates whether the job is run with a standard or flexible execution class. The \
         standard execution-class is ideal for time-sensitive workloads that require fast job \
         startup and dedicated resources.\n\n\
        \ The flexible execution class is appropriate for time-insensitive jobs whose start and \
         completion times may vary. \n\
        \ \n\
        \  Only jobs with Glue version 3.0 and above and command type [glueetl] will be allowed to \
         set [ExecutionClass] to [FLEX]. The flexible execution class is available for Spark jobs.\n\
        \  "]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when a job runs.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a job runs. Accepts a value of G.1X, \
         G.2X, G.4X, G.8X or G.025X for Spark jobs. Accepts the value Z.2X for Ray jobs.\n\n\
        \ {ul\n\
        \       {-  For the [G.1X] worker type, each worker maps to 1 DPU (4 vCPUs, 16 GB of \
         memory) with 94GB disk, and provides 1 executor per worker. We recommend this worker type \
         for workloads such as data transforms, joins, and queries, to offers a scalable and cost \
         effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker maps to 2 DPU (8 vCPUs, 32 GB of \
         memory) with 138GB disk, and provides 1 executor per worker. We recommend this worker \
         type for workloads such as data transforms, joins, and queries, to offers a scalable and \
         cost effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.4X] worker type, each worker maps to 4 DPU (16 vCPUs, 64 GB of \
         memory) with 256GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs in the following Amazon Web Services Regions: US East (Ohio), US East (N. \
         Virginia), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia \
         Pacific (Tokyo), Canada (Central), Europe (Frankfurt), Europe (Ireland), and Europe \
         (Stockholm).\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.8X] worker type, each worker maps to 8 DPU (32 vCPUs, 128 GB of \
         memory) with 512GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs, in the same Amazon Web Services Regions as supported for the [G.4X] \
         worker type.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.025X] worker type, each worker maps to 0.25 DPU (2 vCPUs, 4 GB of \
         memory) with 84GB disk, and provides 1 executor per worker. We recommend this worker type \
         for low volume streaming jobs. This worker type is only available for Glue version 3.0 or \
         later streaming jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [Z.2X] worker type, each worker maps to 2 M-DPU (8vCPUs, 64 GB of \
         memory) with 128 GB disk, and provides up to 8 Ray workers based on the autoscaler.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  notification_property : notification_property option;
      [@ocaml.doc "Specifies configuration properties of a job run notification.\n"]
  security_configuration : name_string option;
      [@ocaml.doc
        "The name of the [SecurityConfiguration] structure to be used with this job run.\n"]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "For Glue version 1.0 or earlier jobs, using the standard worker type, the number of Glue \
         data processing units (DPUs) that can be allocated when this job runs. A DPU is a \
         relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 \
         GB of memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/} Glue \
         pricing page}.\n\n\
        \ For Glue version 2.0+ jobs, you cannot specify a [Maximum capacity]. Instead, you should \
         specify a [Worker type] and the [Number of workers].\n\
        \ \n\
        \  Do not set [MaxCapacity] if using [WorkerType] and [NumberOfWorkers].\n\
        \  \n\
        \   The value that can be allocated for [MaxCapacity] depends on whether you are running a \
         Python shell job, an Apache Spark ETL job, or an Apache Spark streaming ETL job:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you specify a Python shell job ([JobCommand.Name]=\"pythonshell\"), \
         you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.\n\
        \              \n\
        \               }\n\
        \          {-  When you specify an Apache Spark ETL job ([JobCommand.Name]=\"glueetl\") or \
         Apache Spark streaming ETL job ([JobCommand.Name]=\"gluestreaming\"), you can allocate \
         from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU \
         allocation.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  timeout : timeout option;
      [@ocaml.doc
        "The [JobRun] timeout in minutes. This is the maximum time that a job run can consume \
         resources before it is terminated and enters [TIMEOUT] status. This value overrides the \
         timeout value set in the parent job. \n\n\
        \ Jobs must have timeout values less than 7 days or 10080 minutes. Otherwise, the jobs \
         will throw an exception.\n\
        \ \n\
        \  When the value is left blank, the timeout is defaulted to 2,880 minutes for Glue \
         version 4.0 and earlier, or 480 minutes for Glue version 5.0 and later.\n\
        \  \n\
        \   Any existing Glue jobs that had a timeout value greater than 7 days will be defaulted \
         to 7 days. For instance if you have specified a timeout of 20 days for a batch job, it \
         will be stopped on the 7th day.\n\
        \   \n\
        \    For streaming jobs, if you have set up a maintenance window, it will be restarted \
         during the maintenance window after 7 days.\n\
        \    "]
  allocated_capacity : integer_value option;
      [@ocaml.doc
        "This field is deprecated. Use [MaxCapacity] instead.\n\n\
        \ The number of Glue data processing units (DPUs) to allocate to this JobRun. You can \
         allocate a minimum of 2 DPUs; the default is 10. A DPU is a relative measure of \
         processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For \
         more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue pricing page}.\n\
        \ "]
  arguments : generic_map option;
      [@ocaml.doc
        "The job arguments associated with this run. For this job run, they replace the default \
         arguments set in the job definition itself.\n\n\
        \ You can specify arguments here that your own job-execution script consumes, as well as \
         arguments that Glue itself consumes.\n\
        \ \n\
        \  Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve \
         secrets from a Glue Connection, Secrets Manager or other secret management mechanism if \
         you intend to keep them within the Job. \n\
        \  \n\
        \   For information about how to specify and consume your own Job arguments, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html}Calling \
         Glue APIs in Python} topic in the developer guide.\n\
        \   \n\
        \    For information about the arguments you can provide to this field when configuring \
         Spark jobs, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Special \
         Parameters Used by Glue} topic in the developer guide.\n\
        \    \n\
        \     For information about the arguments you can provide to this field when configuring \
         Ray jobs, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/author-job-ray-job-parameters.html}Using \
         job parameters in Ray jobs} in the developer guide.\n\
        \     "]
  job_run_id : id_string option; [@ocaml.doc "The ID of a previous [JobRun] to retry.\n"]
  job_run_queuing_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether job run queuing is enabled for the job run.\n\n\
        \ A value of true means job run queuing is enabled for the job run. If false or not \
         populated, the job run will not be considered for queueing.\n\
        \ "]
  job_name : name_string; [@ocaml.doc "The name of the job definition to use.\n"]
}
[@@ocaml.doc ""]

type nonrec start_import_labels_task_run_response = {
  task_run_id : hash_string option; [@ocaml.doc "The unique identifier for the task run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_import_labels_task_run_request = {
  replace_all_labels : replace_boolean option;
      [@ocaml.doc "Indicates whether to overwrite your existing labels.\n"]
  input_s3_path : uri_string;
      [@ocaml.doc
        "The Amazon Simple Storage Service (Amazon S3) path from where you import the labels.\n"]
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec start_export_labels_task_run_response = {
  task_run_id : hash_string option; [@ocaml.doc "The unique identifier for the task run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_export_labels_task_run_request = {
  output_s3_path : uri_string; [@ocaml.doc "The Amazon S3 path where you export the labels.\n"]
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec start_data_quality_ruleset_evaluation_run_response = {
  run_id : hash_string option; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec pre_processing_query_string = string [@@ocaml.doc ""]

type nonrec data_quality_glue_table = {
  pre_processing_query : pre_processing_query_string option;
      [@ocaml.doc
        "SQL Query of SparkSQL format that can be used to pre-process the data for the table in \
         Glue Data Catalog, before running the Data Quality Operation.\n"]
  additional_options : glue_table_additional_options option;
      [@ocaml.doc
        "Additional options for the table. Currently there are two keys supported:\n\n\
        \ {ul\n\
        \       {-   [pushDownPredicate]: to filter on partitions without having to list and read \
         all the files in your dataset.\n\
        \           \n\
        \            }\n\
        \       {-   [catalogPartitionPredicate]: to use server-side partition pruning using \
         partition indexes in the Glue Data Catalog.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  connection_name : name_string option;
      [@ocaml.doc "The name of the connection to the Glue Data Catalog.\n"]
  catalog_id : name_string option; [@ocaml.doc "A unique identifier for the Glue Data Catalog.\n"]
  table_name : name_string; [@ocaml.doc "A table name in the Glue Data Catalog.\n"]
  database_name : name_string; [@ocaml.doc "A database name in the Glue Data Catalog.\n"]
}
[@@ocaml.doc
  "The database and table in the Glue Data Catalog that is used for input or output data for Data \
   Quality Operations.\n"]

type nonrec data_source = {
  data_quality_glue_table : data_quality_glue_table option;
      [@ocaml.doc "An Glue table for Data Quality Operations.\n"]
  glue_table : glue_table option; [@ocaml.doc "An Glue table.\n"]
}
[@@ocaml.doc "A data source (an Glue table) for which you want data quality results.\n"]

type nonrec dq_composite_rule_evaluation_method = ROW [@ocaml.doc ""] | COLUMN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_quality_evaluation_run_additional_run_options = {
  custom_log_group_prefix : generic_string option;
      [@ocaml.doc
        "A custom prefix for the CloudWatch log group names. When specified, evaluation run logs \
         are written to \n\
         {[\n\
         /error\n\
         ]}\n\
        \ and \n\
         {[\n\
         /output\n\
         ]}\n\
        \ instead of the default [/aws-glue/data-quality/error] and \
         [/aws-glue/data-quality/output] log groups.\n"]
  composite_rule_evaluation_method : dq_composite_rule_evaluation_method option;
      [@ocaml.doc "Set the evaluation method for composite rules in the ruleset to ROW/COLUMN\n"]
  results_s3_prefix : uri_string option; [@ocaml.doc "Prefix for Amazon S3 to store results.\n"]
  cloud_watch_metrics_enabled : nullable_boolean option;
      [@ocaml.doc "Whether or not to enable CloudWatch metrics.\n"]
}
[@@ocaml.doc "Additional run options you can specify for an evaluation run.\n"]

type nonrec ruleset_names = name_string list [@@ocaml.doc ""]

type nonrec data_source_map = (name_string * data_source) list [@@ocaml.doc ""]

type nonrec start_data_quality_ruleset_evaluation_run_request = {
  additional_data_sources : data_source_map option;
      [@ocaml.doc
        "A map of reference strings to additional data sources you can specify for an evaluation \
         run.\n"]
  ruleset_names : ruleset_names; [@ocaml.doc "A list of ruleset names.\n"]
  additional_run_options : data_quality_evaluation_run_additional_run_options option;
      [@ocaml.doc "Additional run options you can specify for an evaluation run.\n"]
  client_token : hash_string option;
      [@ocaml.doc
        "Used for idempotency and is recommended to be set to a random ID (such as a UUID) to \
         avoid creating or starting multiple instances of the same resource.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout for a run in minutes. This is the maximum time that a run can consume \
         resources before it is terminated and enters [TIMEOUT] status. The default is 2,880 \
         minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc "The number of [G.1X] workers to be used in the run. The default is 5.\n"]
  role : role_string; [@ocaml.doc "An IAM role supplied to encrypt the results of the run.\n"]
  data_source : data_source; [@ocaml.doc "The data source (Glue table) associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_data_quality_rule_recommendation_run_response = {
  run_id : hash_string option; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_data_quality_rule_recommendation_run_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "Used for idempotency and is recommended to be set to a random ID (such as a UUID) to \
         avoid creating or starting multiple instances of the same resource.\n"]
  data_quality_security_configuration : name_string option;
      [@ocaml.doc
        "The name of the security configuration created with the data quality encryption option.\n"]
  created_ruleset_name : name_string option; [@ocaml.doc "A name for the ruleset.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout for a run in minutes. This is the maximum time that a run can consume \
         resources before it is terminated and enters [TIMEOUT] status. The default is 2,880 \
         minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc "The number of [G.1X] workers to be used in the run. The default is 5.\n"]
  role : role_string; [@ocaml.doc "An IAM role supplied to encrypt the results of the run.\n"]
  data_source : data_source; [@ocaml.doc "The data source (Glue table) associated with this run.\n"]
}
[@@ocaml.doc "The request of the Data Quality rule recommendation request.\n"]

type nonrec start_crawler_schedule_response = unit [@@ocaml.doc ""]

type nonrec start_crawler_schedule_request = {
  crawler_name : name_string; [@ocaml.doc "Name of the crawler to schedule.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduler_running_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The specified scheduler is already running.\n"]

type nonrec no_schedule_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "There is no applicable schedule.\n"]

type nonrec start_crawler_response = unit [@@ocaml.doc ""]

type nonrec start_crawler_request = {
  name : name_string; [@ocaml.doc "Name of the crawler to start.\n"]
}
[@@ocaml.doc ""]

type nonrec start_column_statistics_task_run_schedule_response = unit [@@ocaml.doc ""]

type nonrec start_column_statistics_task_run_schedule_request = {
  table_name : name_string;
      [@ocaml.doc
        "The name of the table for which to start a column statistic task run schedule.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec start_column_statistics_task_run_response = {
  column_statistics_task_run_id : hash_string option;
      [@ocaml.doc "The identifier for the column statistics task run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_column_statistics_task_run_request = {
  security_configuration : name_string option;
      [@ocaml.doc
        "Name of the security configuration that is used to encrypt CloudWatch logs for the column \
         stats task run.\n"]
  catalog_i_d : name_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table reside. If none is supplied, the Amazon Web \
         Services account ID is used by default.\n"]
  sample_size : sample_size_percentage option;
      [@ocaml.doc
        "The percentage of rows used to generate statistics. If none is supplied, the entire table \
         will be used to generate stats.\n"]
  role : name_string; [@ocaml.doc "The IAM role that the service assumes to generate statistics.\n"]
  column_name_list : column_name_list option;
      [@ocaml.doc
        "A list of the column names to generate statistics. If none is supplied, all column names \
         for the table will be used by default.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table to generate statistics.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec column_statistics_task_running_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc
  "An exception thrown when you try to start another job while running a column stats generation \
   job.\n"]

type nonrec start_blueprint_run_response = {
  run_id : id_string option; [@ocaml.doc "The run ID for this blueprint run.\n"]
}
[@@ocaml.doc ""]

type nonrec blueprint_parameters = string [@@ocaml.doc ""]

type nonrec orchestration_iam_role_arn = string [@@ocaml.doc ""]

type nonrec start_blueprint_run_request = {
  role_arn : orchestration_iam_role_arn;
      [@ocaml.doc "Specifies the IAM role used to create the workflow.\n"]
  parameters : blueprint_parameters option;
      [@ocaml.doc "Specifies the parameters as a [BlueprintParameters] object.\n"]
  blueprint_name : orchestration_name_string; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc ""]

type nonrec spark_connect_endpoint_url = string [@@ocaml.doc ""]

type nonrec http_method = POST [@ocaml.doc ""] | GET [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec path_string = string [@@ocaml.doc ""]

type nonrec property_name = string [@@ocaml.doc ""]

type nonrec connector_property_key = string [@@ocaml.doc ""]

type nonrec bool_ = bool [@@ocaml.doc ""]

type nonrec list_of_string = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec property_location =
  | PATH [@ocaml.doc ""]
  | QUERY_PARAM [@ocaml.doc ""]
  | BODY [@ocaml.doc ""]
  | HEADER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec property_type =
  | SECRET_OR_USER_INPUT [@ocaml.doc ""]
  | UNUSED [@ocaml.doc ""]
  | READ_ONLY [@ocaml.doc ""]
  | SECRET [@ocaml.doc ""]
  | USER_INPUT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connector_property = {
  property_type : property_type; [@ocaml.doc "The data type of this property\n"]
  property_location : property_location option;
      [@ocaml.doc
        "Specifies where this property should be included in REST requests, such as in headers, \
         query parameters, or request body.\n"]
  allowed_values : list_of_string option;
      [@ocaml.doc
        "A list of [AllowedValue] objects representing the values allowed for the property.\n"]
  default_value : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The default value for the property.\n"]
  required : bool_; [@ocaml.doc "Indicates whether the property is required.\n"]
  key_override : connector_property_key option;
      [@ocaml.doc
        "A key name to use when sending this property in API requests, if different from the \
         display name.\n"]
  name : property_name; [@ocaml.doc "The name of the property.\n"]
}
[@@ocaml.doc
  "Defines a property configuration for connection types, default values, and where the property \
   should be used in requests.\n"]

type nonrec connector_property_list = connector_property list [@@ocaml.doc ""]

type nonrec json_path_string = string [@@ocaml.doc ""]

type nonrec response_configuration = {
  error_path : json_path_string option;
      [@ocaml.doc
        "The JSON path expression that identifies where error information is located within API \
         responses when requests fail.\n"]
  result_path : json_path_string;
      [@ocaml.doc
        "The JSON path expression that identifies where the actual result data is located within \
         the API response.\n"]
}
[@@ocaml.doc
  "Configuration that defines how to parse JSON responses from REST API calls, including paths to \
   result data and error information.\n"]

type nonrec default_value = string [@@ocaml.doc ""]

type nonrec response_extraction_mapping = {
  header_key : connector_property_key option;
      [@ocaml.doc "The name of an HTTP response header from which to extract the value.\n"]
  content_path : json_path_string option;
      [@ocaml.doc
        "A JSON path expression that specifies how to extract a value from the response body \
         content.\n"]
}
[@@ocaml.doc
  "Configuration that defines how to extract values from HTTP response content or headers for use \
   in subsequent requests or parameter mapping.\n"]

type nonrec extracted_parameter = {
  value : response_extraction_mapping option;
      [@ocaml.doc
        "The JSON path or extraction mapping that defines how to extract the parameter value from \
         API responses.\n"]
  property_location : property_location option;
      [@ocaml.doc
        "Specifies where this extracted parameter should be placed in subsequent requests, such as \
         in headers, query parameters, or request body.\n"]
  default_value : default_value option;
      [@ocaml.doc
        "The default value to use if the parameter cannot be extracted from the response.\n"]
  key : connector_property_key option;
      [@ocaml.doc "The parameter key name that will be used in subsequent requests.\n"]
}
[@@ocaml.doc
  "Parameter extraction configuration that defines how to extract and map values from API \
   responses to request parameters.\n"]

type nonrec cursor_configuration = {
  limit_parameter : extracted_parameter option;
      [@ocaml.doc
        "The parameter name used to specify the maximum number of results to return per page.\n"]
  next_page : extracted_parameter;
      [@ocaml.doc
        "The parameter name or JSON path that contains the cursor or token for retrieving the next \
         page of results.\n"]
}
[@@ocaml.doc
  "Cursor-based pagination configuration that defines how to handle pagination using cursor tokens \
   or next page identifiers.\n"]

type nonrec offset_configuration = {
  limit_parameter : extracted_parameter;
      [@ocaml.doc
        "The parameter name used to specify the maximum number of results to return per page.\n"]
  offset_parameter : extracted_parameter;
      [@ocaml.doc
        "The parameter name used to specify the starting position or offset for retrieving results.\n"]
}
[@@ocaml.doc
  "Offset-based pagination configuration that defines how to handle pagination using numeric \
   offsets and limits.\n"]

type nonrec pagination_configuration = {
  offset_configuration : offset_configuration option;
      [@ocaml.doc
        "Configuration for offset-based pagination, where the API uses numeric offsets and limits \
         to control which results are returned.\n"]
  cursor_configuration : cursor_configuration option;
      [@ocaml.doc
        "Configuration for cursor-based pagination, where the API provides a cursor or token to \
         retrieve the next page of results.\n"]
}
[@@ocaml.doc
  "Configuration that defines how to handle paginated responses from REST APIs, supporting \
   different pagination strategies used by various services.\n"]

type nonrec source_configuration = {
  pagination_configuration : pagination_configuration option;
      [@ocaml.doc
        "Configuration for handling paginated responses from the REST API, supporting both \
         cursor-based and offset-based pagination strategies.\n"]
  response_configuration : response_configuration option;
      [@ocaml.doc
        "Configuration that defines how to parse and extract data from API responses, including \
         success and error handling.\n"]
  request_parameters : connector_property_list option;
      [@ocaml.doc
        "Configuration for request parameters that should be included in API calls, such as query \
         parameters, headers, or body content.\n"]
  request_path : path_string option;
      [@ocaml.doc
        "The URL path for the REST endpoint, which may include parameter placeholders that will be \
         replaced with actual values during requests.\n"]
  request_method : http_method option;
      [@ocaml.doc "The HTTP method to use for requests to this endpoint, such as GET, POST.\n"]
}
[@@ocaml.doc
  "Configuration that defines how to make requests to endpoints, including request methods, paths, \
   parameters, and response handling.\n"]

type nonrec sort = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_criterion = {
  sort : sort option; [@ocaml.doc "An ascending or descending sort.\n"]
  field_name : value_string option; [@ocaml.doc "The name of the field on which to sort.\n"]
}
[@@ocaml.doc "Specifies a field to sort by and a sort order.\n"]

type nonrec sort_criteria = sort_criterion list [@@ocaml.doc ""]

type nonrec setting_source = TABLE [@ocaml.doc ""] | CATALOG [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec session_type = SPARK_CONNECT [@ocaml.doc ""] | LIVY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec session_status =
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec orchestration_role_arn = string [@@ocaml.doc ""]

type nonrec session_command = {
  python_version : python_version_string option;
      [@ocaml.doc
        "Specifies the Python version. The Python version indicates the version supported for jobs \
         of type Spark.\n"]
  name : name_string option;
      [@ocaml.doc
        "Specifies the name of the SessionCommand. Can be 'glueetl' or 'gluestreaming'.\n"]
}
[@@ocaml.doc "The [SessionCommand] that runs the job.\n"]

type nonrec orchestration_arguments_value = string [@@ocaml.doc ""]

type nonrec orchestration_arguments_map =
  (orchestration_name_string * orchestration_arguments_value) list
[@@ocaml.doc ""]

type nonrec idle_timeout = int [@@ocaml.doc ""]

type nonrec session = {
  session_type : session_type option; [@ocaml.doc "The type of the session.\n"]
  profile_name : name_string option;
      [@ocaml.doc "The name of an Glue usage profile associated with the session.\n"]
  idle_timeout : idle_timeout option;
      [@ocaml.doc "The number of minutes when idle before the session times out.\n"]
  dpu_seconds : nullable_double option;
      [@ocaml.doc "The DPUs consumed by the session (formula: ExecutionTime * MaxCapacity).\n"]
  execution_time : nullable_double option; [@ocaml.doc "The total time the session ran for.\n"]
  completed_on : timestamp_value option;
      [@ocaml.doc "The date and time that this session is completed.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a session runs. Accepts a value of \
         [G.1X], [G.2X], [G.4X], or [G.8X] for Spark sessions. Accepts the value [Z.2X] for Ray \
         sessions.\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc "The number of workers of a defined [WorkerType] to use for the session.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "The Glue version determines the versions of Apache Spark and Python that Glue supports. \
         The GlueVersion must be greater than 2.0.\n"]
  security_configuration : name_string option;
      [@ocaml.doc "The name of the SecurityConfiguration structure to be used with the session.\n"]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "The number of Glue data processing units (DPUs) that can be allocated when the job runs. \
         A DPU is a relative measure of processing power that consists of 4 vCPUs of compute \
         capacity and 16 GB memory. \n"]
  progress : double_value option; [@ocaml.doc "The code execution progress of the session.\n"]
  connections : connections_list option;
      [@ocaml.doc "The number of connections used for the session.\n"]
  default_arguments : orchestration_arguments_map option;
      [@ocaml.doc "A map array of key-value pairs. Max is 75 pairs. \n"]
  command : session_command option; [@ocaml.doc "The command object.See SessionCommand.\n"]
  role : orchestration_role_arn option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role associated with the Session.\n"]
  description : description_string option; [@ocaml.doc "The description of the session.\n"]
  error_message : description_string option;
      [@ocaml.doc "The error message displayed during the session.\n"]
  status : session_status option; [@ocaml.doc "The session status. \n"]
  created_on : timestamp_value option;
      [@ocaml.doc "The time and date when the session was created.\n"]
  id : name_string option; [@ocaml.doc "The ID of the session.\n"]
}
[@@ocaml.doc "The period in which a remote Spark runtime environment is running.\n"]

type nonrec session_list = session list [@@ocaml.doc ""]

type nonrec session_id_list = name_string list [@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec session_endpoint = {
  auth_token_expiration_time : timestamp_value;
      [@ocaml.doc "The time at which the authentication token expires.\n"]
  auth_token : sensitive_string;
      [@ocaml.doc
        "The authentication token to include in requests to the Spark Connect endpoint.\n"]
  url : spark_connect_endpoint_url; [@ocaml.doc "The Spark Connect endpoint URL for the session.\n"]
}
[@@ocaml.doc
  "Contains the Spark Connect endpoint details for an interactive session, including the URL and \
   authentication credentials.\n"]

type nonrec session_busy_exception = {
  message : orchestration_message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc
  "The session is currently busy processing another request and cannot accept new operations.\n"]

type nonrec sensitive_url = string [@@ocaml.doc ""]

type nonrec entity_field_name = string [@@ocaml.doc ""]

type nonrec selected_fields = entity_field_name list [@@ocaml.doc ""]

type nonrec segment = {
  total_segments : total_segments_integer; [@ocaml.doc "The total number of segments.\n"]
  segment_number : non_negative_integer;
      [@ocaml.doc
        "The zero-based index number of the segment. For example, if the total number of segments \
         is 4, [SegmentNumber] values range from 0 through 3.\n"]
}
[@@ocaml.doc
  "Defines a non-overlapping region of a table's partitions, allowing multiple requests to be run \
   in parallel.\n"]

type nonrec s3_encryption_mode =
  | SSES3 [@ocaml.doc ""]
  | SSEKMS [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_encryption = {
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.\n"]
  s3_encryption_mode : s3_encryption_mode option;
      [@ocaml.doc "The encryption mode to use for Amazon S3 data.\n"]
}
[@@ocaml.doc "Specifies how Amazon Simple Storage Service (Amazon S3) data should be encrypted.\n"]

type nonrec s3_encryption_list = s3_encryption list [@@ocaml.doc ""]

type nonrec cloud_watch_encryption_mode = SSEKMS [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cloud_watch_encryption = {
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.\n"]
  cloud_watch_encryption_mode : cloud_watch_encryption_mode option;
      [@ocaml.doc "The encryption mode to use for CloudWatch data.\n"]
}
[@@ocaml.doc "Specifies how Amazon CloudWatch data should be encrypted.\n"]

type nonrec job_bookmarks_encryption_mode = CSEKMS [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec job_bookmarks_encryption = {
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.\n"]
  job_bookmarks_encryption_mode : job_bookmarks_encryption_mode option;
      [@ocaml.doc "The encryption mode to use for job bookmarks data.\n"]
}
[@@ocaml.doc "Specifies how job bookmark data should be encrypted.\n"]

type nonrec data_quality_encryption_mode = SSEKMS [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_quality_encryption = {
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.\n"]
  data_quality_encryption_mode : data_quality_encryption_mode option;
      [@ocaml.doc
        "The encryption mode to use for encrypting Data Quality assets. These assets include data \
         quality rulesets, results, statistics, anomaly detection models and observations.\n\n\
        \ Valid values are [SSEKMS] for encryption using a customer-managed KMS key, or [DISABLED].\n\
        \ "]
}
[@@ocaml.doc "Specifies how Data Quality assets in your account should be encrypted.\n"]

type nonrec encryption_configuration = {
  data_quality_encryption : data_quality_encryption option;
      [@ocaml.doc "The encryption configuration for Glue Data Quality assets.\n"]
  job_bookmarks_encryption : job_bookmarks_encryption option;
      [@ocaml.doc "The encryption configuration for job bookmarks.\n"]
  cloud_watch_encryption : cloud_watch_encryption option;
      [@ocaml.doc "The encryption configuration for Amazon CloudWatch.\n"]
  s3_encryption : s3_encryption_list option;
      [@ocaml.doc
        "The encryption configuration for Amazon Simple Storage Service (Amazon S3) data.\n"]
}
[@@ocaml.doc "Specifies an encryption configuration.\n"]

type nonrec security_configuration = {
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc "The encryption configuration associated with this security configuration.\n"]
  created_time_stamp : timestamp_value option;
      [@ocaml.doc "The time at which this security configuration was created.\n"]
  name : name_string option; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc "Specifies a security configuration.\n"]

type nonrec security_configuration_list = security_configuration list [@@ocaml.doc ""]

type nonrec search_text = string [@@ocaml.doc ""]

type nonrec search_tables_response = {
  table_list : table_list option;
      [@ocaml.doc
        "A list of the requested [Table] objects. The [SearchTables] response returns only the \
         tables that you have access to.\n"]
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current list segment is not the last.\n"]
}
[@@ocaml.doc ""]

type nonrec comparator =
  | LESS_THAN_EQUALS [@ocaml.doc ""]
  | GREATER_THAN_EQUALS [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec property_predicate = {
  comparator : comparator option;
      [@ocaml.doc "The comparator used to compare this property to others.\n"]
  value : value_string option; [@ocaml.doc "The value of the property.\n"]
  key : value_string option; [@ocaml.doc "The key of the property.\n"]
}
[@@ocaml.doc "Defines a property predicate.\n"]

type nonrec search_property_predicates = property_predicate list [@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec resource_share_type =
  | FEDERATED [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | FOREIGN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_tables_request = {
  include_status_details : boolean_nullable option;
      [@ocaml.doc
        "Specifies whether to include status details related to a request to create or update an \
         Glue Data Catalog view.\n"]
  resource_share_type : resource_share_type option;
      [@ocaml.doc
        "Allows you to specify that you want to search the tables shared with your account. The \
         allowable values are [FOREIGN] or [ALL]. \n\n\
        \ {ul\n\
        \       {-  If set to [FOREIGN], will search the tables shared with your account. \n\
        \           \n\
        \            }\n\
        \       {-  If set to [ALL], will search the tables shared with your account, as well as \
         the tables in yor local account. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of tables to return in a single response.\n"]
  sort_criteria : sort_criteria option;
      [@ocaml.doc
        "A list of criteria for sorting the results by a field name, in an ascending or descending \
         order.\n"]
  search_text : value_string option;
      [@ocaml.doc
        "A string used for a text search.\n\n\
        \ Specifying a value in quotes filters based on an exact match to the value.\n\
        \ "]
  filters : search_property_predicates option;
      [@ocaml.doc
        "A list of key-value pairs, and a comparator used to filter the search results. Returns \
         all entities matching the predicate.\n\n\
        \ The [Comparator] member of the [PropertyPredicate] struct is used only for time fields, \
         and can be omitted for other field types. Also, when comparing string values, such as \
         when [Key=Name], a fuzzy match algorithm is used. The [Key] field (for example, the value \
         of the [Name] field) is split on certain punctuation characters, for example, -, :, #, \
         etc. into tokens. Then each token is exact-match compared with the [Value] member of \
         [PropertyPredicate]. For example, if [Key=Name] and [Value=link], tables named \
         [customer-link] and [xx-link-yy] are returned, but [xxlinkyy] is not returned.\n\
        \ "]
  next_token : token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc "A unique identifier, consisting of \n{[\n {i account_id} \n]}\n.\n"]
}
[@@ocaml.doc ""]

type nonrec search_sort_order = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_attribute = string [@@ocaml.doc ""]

type nonrec search_sort = {
  order : search_sort_order option;
      [@ocaml.doc "The sort order. Valid values are [ASCENDING] and [DESCENDING].\n"]
  attribute : search_attribute; [@ocaml.doc "The attribute to sort by.\n"]
}
[@@ocaml.doc "The sort criteria for search results.\n"]

type nonrec search_result_name = string [@@ocaml.doc ""]

type nonrec asset_type_id = string [@@ocaml.doc ""]

type nonrec search_result_item = {
  asset_type_id : asset_type_id option;
      [@ocaml.doc "The identifier of the asset type for the matched asset.\n"]
  updated_at : updated_at option;
      [@ocaml.doc "The timestamp at which the matched asset was last updated.\n"]
  asset_description : asset_description option;
      [@ocaml.doc "The description of the matched asset.\n"]
  asset_name : search_result_name option; [@ocaml.doc "The name of the matched asset.\n"]
  id : asset_id option; [@ocaml.doc "The unique identifier of the matched asset.\n"]
}
[@@ocaml.doc "A single search result item representing a matched asset.\n"]

type nonrec search_result_item_list = search_result_item list [@@ocaml.doc ""]

type nonrec search_next_token = string [@@ocaml.doc ""]

type nonrec search_max_results = int [@@ocaml.doc ""]

type nonrec search_map_key = string [@@ocaml.doc ""]

type nonrec search_filter_string_value = string [@@ocaml.doc ""]

type nonrec search_map_filter_value =
  | StringValue of search_filter_string_value [@ocaml.doc "A string filter value.\n"]
[@@ocaml.doc "A map filter value. Currently supports string comparison only.\n"]

type nonrec search_map_filter = {
  value : search_map_filter_value; [@ocaml.doc "The value to compare against.\n"]
  key : search_map_key; [@ocaml.doc "The key within the map attribute to filter on.\n"]
  attribute : search_attribute; [@ocaml.doc "The map attribute name to filter on.\n"]
}
[@@ocaml.doc "A filter on a map attribute's key-value pair.\n"]

type nonrec search_filter_long_value = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec search_filter_value =
  | LongValue of search_filter_long_value [@ocaml.doc "A long integer filter value.\n"]
  | StringValue of search_filter_string_value [@ocaml.doc "A string filter value.\n"]
[@@ocaml.doc "A filter value. Exactly one of [stringValue] or [longValue] must be specified.\n"]

type nonrec search_filter_operator =
  | NotExists [@ocaml.doc ""]
  | LessThanOrEquals [@ocaml.doc ""]
  | LessThan [@ocaml.doc ""]
  | GreaterThanOrEquals [@ocaml.doc ""]
  | GreaterThan [@ocaml.doc ""]
  | Equals [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_attribute_filter = {
  value : search_filter_value option; [@ocaml.doc "The value to compare against.\n"]
  operator : search_filter_operator;
      [@ocaml.doc
        "The comparison operator. Valid values are [equals], [greaterThan], [greaterThanOrEquals], \
         [lessThan], [lessThanOrEquals], and [notExists].\n"]
  attribute : search_attribute; [@ocaml.doc "The attribute name to filter on.\n"]
}
[@@ocaml.doc "A filter that compares an attribute value using an operator.\n"]

type search_filter_clause =
  | MapFilter of search_map_filter [@ocaml.doc "A filter on a map attribute's key-value pair.\n"]
  | AttributeFilter of search_attribute_filter
      [@ocaml.doc "A filter on a single attribute value.\n"]
  | OrAnyFilters of search_filter_clause_list
      [@ocaml.doc "A list of filter clauses where at least one must match (logical OR).\n"]
  | AndAllFilters of search_filter_clause_list
      [@ocaml.doc "A list of filter clauses that must all match (logical AND).\n"]
[@@ocaml.doc
  "A filter clause that supports nested boolean logic. Exactly one of [andAllFilters], \
   [orAnyFilters], [attributeFilter], or [mapFilter] must be specified.\n"]

and search_filter_clause_list = search_filter_clause list [@@ocaml.doc ""]

type nonrec search_assets_output = {
  next_token : search_next_token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  items : search_result_item_list option;
      [@ocaml.doc "The list of assets matching the search criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec search_assets_input = {
  filter_clause : search_filter_clause option;
      [@ocaml.doc
        "The filter clause to apply to the search. Supports nested AND/OR logic with \
         attribute-level and map-level filters.\n"]
  sort : search_sort option; [@ocaml.doc "The sort criteria for the search results.\n"]
  next_token : search_next_token option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : search_max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  search_text : search_text option;
      [@ocaml.doc
        "The text to search for. At least one of [searchText] or [filterClause] must be provided.\n"]
}
[@@ocaml.doc ""]

type nonrec schema_version_status =
  | DELETING [@ocaml.doc ""]
  | FAILURE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec created_timestamp = string [@@ocaml.doc ""]

type nonrec schema_version_list_item = {
  created_time : created_timestamp option;
      [@ocaml.doc "The date and time the schema version was created.\n"]
  status : schema_version_status option; [@ocaml.doc "The status of the schema version.\n"]
  version_number : version_long_number option; [@ocaml.doc "The version number of the schema.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique identifier of the schema version.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
}
[@@ocaml.doc "An object containing the details about a schema version.\n"]

type nonrec schema_version_list = schema_version_list_item list [@@ocaml.doc ""]

type nonrec error_code_string = string [@@ocaml.doc ""]

type nonrec error_message_string = string [@@ocaml.doc ""]

type nonrec error_details = {
  error_message : error_message_string option; [@ocaml.doc "The error message for an error.\n"]
  error_code : error_code_string option; [@ocaml.doc "The error code for an error.\n"]
}
[@@ocaml.doc "An object containing error details.\n"]

type nonrec schema_version_error_item = {
  error_details : error_details option;
      [@ocaml.doc "The details of the error for the schema version.\n"]
  version_number : version_long_number option; [@ocaml.doc "The version number of the schema.\n"]
}
[@@ocaml.doc "An object that contains the error details for an operation on a schema version.\n"]

type nonrec schema_version_error_list = schema_version_error_item list [@@ocaml.doc ""]

type nonrec schema_validation_error = string [@@ocaml.doc ""]

type nonrec schema_status =
  | DELETING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schema_registry_token_string = string [@@ocaml.doc ""]

type nonrec schema_path_string = string [@@ocaml.doc ""]

type nonrec schema_list_item = {
  updated_time : updated_timestamp option;
      [@ocaml.doc "The date and time that a schema was updated.\n"]
  created_time : created_timestamp option;
      [@ocaml.doc "The date and time that a schema was created.\n"]
  schema_status : schema_status option; [@ocaml.doc "The status of the schema.\n"]
  description : description_string option; [@ocaml.doc "A description for the schema.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the schema.\n"]
  schema_name : schema_registry_name_string option; [@ocaml.doc "The name of the schema.\n"]
  registry_name : schema_registry_name_string option;
      [@ocaml.doc "the name of the registry where the schema resides.\n"]
}
[@@ocaml.doc "An object that contains minimal details for a schema.\n"]

type nonrec schema_list_definition = schema_list_item list [@@ocaml.doc ""]

type nonrec schema_diff_type = SYNTAX_DIFF [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec schema_definition_string = string [@@ocaml.doc ""]

type nonrec schema_definition_diff = string [@@ocaml.doc ""]

type nonrec schema_checkpoint_number = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec schedule_type = AUTO [@ocaml.doc ""] | CRON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec schedule_state =
  | TRANSITIONING [@ocaml.doc ""]
  | NOT_SCHEDULED [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schedule = {
  state : schedule_state option; [@ocaml.doc "The state of the schedule.\n"]
  schedule_expression : cron_expression option;
      [@ocaml.doc
        "A [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n"]
}
[@@ocaml.doc "A scheduling object using a [cron] statement to schedule an event.\n"]

type nonrec scala_code = string [@@ocaml.doc ""]

type nonrec run_statement_response = {
  id : integer_value option; [@ocaml.doc "Returns the Id of the statement that was run.\n"]
}
[@@ocaml.doc ""]

type nonrec orchestration_statement_code_string = string [@@ocaml.doc ""]

type nonrec run_statement_request = {
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request.\n"]
  code : orchestration_statement_code_string; [@ocaml.doc "The statement code to be run.\n"]
  session_id : name_string; [@ocaml.doc "The Session Id of the statement to be run.\n"]
}
[@@ocaml.doc ""]

type nonrec run_id = string [@@ocaml.doc ""]

type nonrec rule_metrics_map = (name_string * nullable_double) list [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec node_id_list = name_string list [@@ocaml.doc ""]

type nonrec resume_workflow_run_response = {
  node_ids : node_id_list option;
      [@ocaml.doc "A list of the node IDs for the nodes that were actually restarted.\n"]
  run_id : id_string option;
      [@ocaml.doc
        "The new ID assigned to the resumed workflow run. Each resume of a workflow run will have \
         a new run ID.\n"]
}
[@@ocaml.doc ""]

type nonrec resume_workflow_run_request = {
  node_ids : node_id_list;
      [@ocaml.doc
        "A list of the node IDs for the nodes you want to restart. The nodes that are to be \
         restarted must have a run attempt in the original run.\n"]
  run_id : id_string; [@ocaml.doc "The ID of the workflow run to resume.\n"]
  name : name_string; [@ocaml.doc "The name of the workflow to resume.\n"]
}
[@@ocaml.doc ""]

type nonrec field_data_type =
  | UNION [@ocaml.doc ""]
  | BINARY [@ocaml.doc ""]
  | STRUCT [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | SHORT [@ocaml.doc ""]
  | BYTE [@ocaml.doc ""]
  | DECIMAL [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
  | ARRAY [@ocaml.doc ""]
  | MAP [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | LONG [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | BIGINT [@ocaml.doc ""]
  | SMALLINT [@ocaml.doc ""]
  | INT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_definition = {
  field_data_type : field_data_type; [@ocaml.doc "The data type of the field.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the field in the entity schema.\n"]
}
[@@ocaml.doc
  "Defines a field in an entity schema for REST connector data sources, specifying the field name \
   and data type.\n"]

type nonrec field_definition_map_key_string = string [@@ocaml.doc ""]

type nonrec field_definition_map = (field_definition_map_key_string * field_definition) list
[@@ocaml.doc
  "A map of field definitions that define the schema structure for an entity in a REST connector \
   data source.\n"]

type nonrec entity_configuration = {
  schema : field_definition_map option;
      [@ocaml.doc
        "The schema definition for this entity, including field names, types, and other metadata \
         that describes the structure of the data.\n"]
  source_configuration : source_configuration option;
      [@ocaml.doc
        "The source configuration that defines how to make requests to access this entity's data \
         through the REST API.\n"]
}
[@@ocaml.doc
  "Configuration that defines how to interact with a specific data entity through the REST API, \
   including its access patterns and schema definition.\n"]

type nonrec entity_configuration_map_key_string = string [@@ocaml.doc ""]

type nonrec entity_configuration_map =
  (entity_configuration_map_key_string * entity_configuration) list
[@@ocaml.doc
  "A map of entity configurations that associates entity names with their corresponding \
   configuration settings for REST API interactions.\n"]

type nonrec rest_configuration = {
  entity_configurations : entity_configuration_map option;
      [@ocaml.doc
        "A map of entity configurations that define how to interact with different data entities \
         available through the REST API, including their schemas and access patterns.\n"]
  validation_endpoint_configuration : source_configuration option;
      [@ocaml.doc
        "Configuration for the endpoint used to validate connection credentials and test \
         connectivity during connection creation.\n"]
  global_source_configuration : source_configuration option;
      [@ocaml.doc
        "Global configuration settings that apply to all REST API requests for this connection \
         type, including common request methods, paths, and parameters.\n"]
}
[@@ocaml.doc
  "Configuration that defines HTTP request and response handling, validation endpoints, and entity \
   configurations for REST API interactions.\n"]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec json_value = string [@@ocaml.doc ""]

type nonrec job_bookmark_entry = {
  job_bookmark : json_value option; [@ocaml.doc "The bookmark itself.\n"]
  run_id : run_id option; [@ocaml.doc "The run ID number.\n"]
  previous_run_id : run_id option;
      [@ocaml.doc "The unique run identifier associated with the previous job run.\n"]
  attempt : integer_value option; [@ocaml.doc "The attempt ID number.\n"]
  run : integer_value option; [@ocaml.doc "The run ID number.\n"]
  version : integer_value option; [@ocaml.doc "The version of the job.\n"]
  job_name : job_name option; [@ocaml.doc "The name of the job in question.\n"]
}
[@@ocaml.doc "Defines a point that a job can resume processing.\n"]

type nonrec reset_job_bookmark_response = {
  job_bookmark_entry : job_bookmark_entry option; [@ocaml.doc "The reset bookmark entry.\n"]
}
[@@ocaml.doc ""]

type nonrec reset_job_bookmark_request = {
  run_id : run_id option; [@ocaml.doc "The unique run identifier associated with this job run.\n"]
  job_name : job_name; [@ocaml.doc "The name of the job in question.\n"]
}
[@@ocaml.doc ""]

type nonrec metadata_key_string = string [@@ocaml.doc ""]

type nonrec metadata_value_string = string [@@ocaml.doc ""]

type nonrec remove_schema_version_metadata_response = {
  metadata_value : metadata_value_string option; [@ocaml.doc "The value of the metadata key.\n"]
  metadata_key : metadata_key_string option; [@ocaml.doc "The metadata key.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The version ID for the schema version.\n"]
  version_number : version_long_number option; [@ocaml.doc "The version number of the schema.\n"]
  latest_version : latest_schema_version_boolean option;
      [@ocaml.doc "The latest version of the schema.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name of the registry.\n"]
  schema_name : schema_registry_name_string option; [@ocaml.doc "The name of the schema.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec metadata_key_value_pair = {
  metadata_value : metadata_value_string option;
      [@ocaml.doc "A metadata key\226\128\153s corresponding value.\n"]
  metadata_key : metadata_key_string option; [@ocaml.doc "A metadata key.\n"]
}
[@@ocaml.doc "A structure containing a key value pair for metadata.\n"]

type nonrec remove_schema_version_metadata_input = {
  metadata_key_value : metadata_key_value_pair; [@ocaml.doc "The value of the metadata key.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique version ID of the schema version.\n"]
  schema_version_number : schema_version_number option;
      [@ocaml.doc "The version number of the schema.\n"]
  schema_id : schema_id option;
      [@ocaml.doc
        "A wrapper structure that may contain the schema name and Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec registry_status = DELETING [@ocaml.doc ""] | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registry_list_item = {
  updated_time : updated_timestamp option; [@ocaml.doc "The date the registry was updated.\n"]
  created_time : created_timestamp option; [@ocaml.doc "The data the registry was created.\n"]
  status : registry_status option; [@ocaml.doc "The status of the registry.\n"]
  description : description_string option; [@ocaml.doc "A description of the registry.\n"]
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the registry.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name of the registry.\n"]
}
[@@ocaml.doc "A structure containing the details for a registry.\n"]

type nonrec registry_list_definition = registry_list_item list [@@ocaml.doc ""]

type nonrec register_schema_version_response = {
  status : schema_version_status option; [@ocaml.doc "The status of the schema version.\n"]
  version_number : version_long_number option;
      [@ocaml.doc
        "The version of this schema (for sync flow only, in case this is the first version).\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique ID that represents the version of this schema.\n"]
}
[@@ocaml.doc ""]

type nonrec register_schema_version_input = {
  schema_definition : schema_definition_string;
      [@ocaml.doc "The schema definition using the [DataFormat] setting for the [SchemaName].\n"]
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either \
         [SchemaArn] or [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. Either [SchemaArn] or \
         [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec register_connection_type_response = {
  connection_type_arn : glue_resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the registered connection type. This unique identifier \
         can be used to reference the connection type in other Glue operations.\n"]
}
[@@ocaml.doc "Contains the Amazon Resource Name (ARN) of the newly registered connection type.\n"]

type nonrec integration_type = REST [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec connection_properties_configuration = {
  additional_request_parameters : connector_property_list option;
      [@ocaml.doc
        "Key-value pairs of additional request parameters that may be needed during connection \
         creation, such as API versions or service-specific configuration options.\n"]
  url : connector_property option;
      [@ocaml.doc
        "The base instance URL for the endpoint that this connection type will connect to.\n"]
}
[@@ocaml.doc
  "Configuration that defines the base URL and additional request parameters needed during \
   connection creation.\n"]

type nonrec authentication_types = authentication_type list [@@ocaml.doc ""]

type nonrec connector_o_auth2_grant_type =
  | AUTHORIZATION_CODE [@ocaml.doc ""]
  | JWT_BEARER [@ocaml.doc ""]
  | CLIENT_CREDENTIALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec content_type = URL_ENCODED [@ocaml.doc ""] | APPLICATION_JSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec client_credentials_properties = {
  token_url_parameters : connector_property_list option;
      [@ocaml.doc "Additional parameters to include in token URL requests as key-value pairs.\n"]
  scope : connector_property option;
      [@ocaml.doc
        "The OAuth2 scope that defines the level of access requested for the client credentials \
         flow.\n"]
  client_secret : connector_property option;
      [@ocaml.doc "The OAuth2 client secret provided by the authorization server.\n"]
  client_id : connector_property option;
      [@ocaml.doc "The OAuth2 client identifier provided by the authorization server.\n"]
  content_type : content_type option;
      [@ocaml.doc
        "The content type to use for token requests, such as application/x-www-form-urlencoded or \
         application/json.\n"]
  request_method : http_method option;
      [@ocaml.doc "The HTTP method to use when making token requests, typically POST.\n"]
  token_url : connector_property option;
      [@ocaml.doc
        "The token endpoint URL where the client will request access tokens using client \
         credentials.\n"]
}
[@@ocaml.doc
  "OAuth2 client credentials configuration that defines the properties needed for the Client \
   Credentials grant type flow.\n"]

type nonrec jwt_bearer_properties = {
  token_url_parameters : connector_property_list option;
      [@ocaml.doc "Additional parameters to include in token URL requests as key-value pairs.\n"]
  jwt_token : connector_property option;
      [@ocaml.doc "The JWT token to be used in the bearer token grant flow for authentication.\n"]
  content_type : content_type option;
      [@ocaml.doc
        "The content type to use for JWT bearer token requests, such as \
         application/x-www-form-urlencoded or application/json.\n"]
  request_method : http_method option;
      [@ocaml.doc "The HTTP method to use when making JWT bearer token requests, typically POST.\n"]
  token_url : connector_property option;
      [@ocaml.doc
        "The token endpoint URL where the JWT bearer token will be exchanged for an access token.\n"]
}
[@@ocaml.doc
  "JWT bearer token configuration that defines the properties needed for the JWT Bearer grant type \
   flow.\n"]

type nonrec connector_authorization_code_properties = {
  token_url_parameters : connector_property_list option;
      [@ocaml.doc "Additional parameters to include in token URL requests as key-value pairs.\n"]
  prompt : connector_property option;
      [@ocaml.doc
        "The OAuth2 prompt parameter that controls the authorization server's behavior during user \
         authentication.\n"]
  scope : connector_property option;
      [@ocaml.doc
        "The OAuth2 scope that defines the level of access requested for the authorization code \
         flow.\n"]
  client_secret : connector_property option;
      [@ocaml.doc "The OAuth2 client secret provided by the authorization server.\n"]
  client_id : connector_property option;
      [@ocaml.doc "The OAuth2 client identifier provided by the authorization server.\n"]
  content_type : content_type option;
      [@ocaml.doc
        "The content type to use for token exchange requests, such as \
         application/x-www-form-urlencoded or application/json.\n"]
  request_method : http_method option;
      [@ocaml.doc "The HTTP method to use when making token exchange requests, typically POST.\n"]
  token_url : connector_property option;
      [@ocaml.doc
        "The token endpoint URL where the authorization code will be exchanged for an access token.\n"]
  redirect_uri : connector_property option;
      [@ocaml.doc
        "The redirect URI that must match the URI registered with the authorization server.\n"]
  authorization_code : connector_property option;
      [@ocaml.doc
        "The authorization code received from the authorization server after user consent.\n"]
  authorization_code_url : connector_property option;
      [@ocaml.doc
        "The authorization endpoint URL where users will be redirected to grant authorization.\n"]
}
[@@ocaml.doc
  "OAuth2 authorization code configuration that defines the properties needed for the \
   Authorization Code grant type flow.\n"]

type nonrec connector_o_auth2_properties = {
  authorization_code_properties : connector_authorization_code_properties option;
      [@ocaml.doc
        "Configuration properties specific to the OAuth2 Authorization Code grant type flow.\n"]
  jwt_bearer_properties : jwt_bearer_properties option;
      [@ocaml.doc "Configuration properties specific to the OAuth2 JWT Bearer grant type flow.\n"]
  client_credentials_properties : client_credentials_properties option;
      [@ocaml.doc
        "Configuration properties specific to the OAuth2 Client Credentials grant type flow.\n"]
  o_auth2_grant_type : connector_o_auth2_grant_type;
      [@ocaml.doc
        "The OAuth2 grant type to use for authentication, such as CLIENT_CREDENTIALS, JWT_BEARER, \
         or AUTHORIZATION_CODE.\n"]
}
[@@ocaml.doc
  "OAuth2 configuration container that defines the authentication properties and flow-specific \
   configurations for OAuth2-based connections.\n"]

type nonrec basic_authentication_properties = {
  password : connector_property option;
      [@ocaml.doc "The password property name to use for Basic authentication credentials.\n"]
  username : connector_property option;
      [@ocaml.doc "The username property name to use for Basic authentication credentials.\n"]
}
[@@ocaml.doc
  "Basic authentication configuration that defines the username and password properties for HTTP \
   Basic authentication.\n"]

type nonrec custom_authentication_properties = {
  authentication_parameters : connector_property_list;
      [@ocaml.doc
        "A map of custom authentication parameters that define the specific authentication \
         mechanism and required properties.\n"]
}
[@@ocaml.doc
  "Custom authentication configuration that allows for flexible authentication mechanisms beyond \
   standard Basic and OAuth2 flows.\n"]

type nonrec connector_authentication_configuration = {
  custom_authentication_properties : custom_authentication_properties option; [@ocaml.doc ""]
  basic_authentication_properties : basic_authentication_properties option; [@ocaml.doc ""]
  o_auth2_properties : connector_o_auth2_properties option; [@ocaml.doc ""]
  authentication_types : authentication_types;
      [@ocaml.doc
        "A list of authentication types supported by this connection type, such as Basic, OAuth2, \
         or Custom authentication methods.\n"]
}
[@@ocaml.doc
  "Configuration that defines the supported authentication types and required properties for the \
   connection type.\n"]

type nonrec register_connection_type_request = {
  tags : tags_map option; [@ocaml.doc "The tags you assign to the connection type.\n"]
  rest_configuration : rest_configuration;
      [@ocaml.doc
        "Defines the HTTP request and response configuration, validation endpoint, and entity \
         configurations for REST API interactions.\n"]
  connector_authentication_configuration : connector_authentication_configuration;
      [@ocaml.doc
        "Defines the supported authentication types and required properties for this connection \
         type, including Basic, OAuth2, and Custom authentication methods.\n"]
  connection_properties : connection_properties_configuration;
      [@ocaml.doc
        "Defines the base URL and additional request parameters needed during connection creation \
         for this connection type.\n"]
  description : description option;
      [@ocaml.doc
        "A description of the connection type. Can be up to 2048 characters and provides details \
         about the purpose and functionality of the connection type.\n"]
  integration_type : integration_type;
      [@ocaml.doc
        "The integration type for the connection. Currently only \"REST\" protocol is supported.\n"]
  connection_type : name_string;
      [@ocaml.doc
        "The name of the connection type. Must be between 1 and 255 characters and must be \
         prefixed with \"REST-\" to indicate it is a REST-based connector.\n"]
}
[@@ocaml.doc ""]

type nonrec record = Smaws_Lib.CoreTypes.Document.t [@@ocaml.doc ""]

type nonrec records = record list [@@ocaml.doc ""]

type nonrec context_value = string [@@ocaml.doc ""]

type nonrec context_key = string [@@ocaml.doc ""]

type nonrec additional_context_map = (context_key * context_value) list [@@ocaml.doc ""]

type nonrec query_session_context = {
  additional_context : additional_context_map option;
      [@ocaml.doc "An opaque string-string map passed by the query engine.\n"]
  query_authorization_id : hash_string option;
      [@ocaml.doc
        "A cryptographically generated query identifier generated by Glue or Lake Formation.\n"]
  cluster_id : nullable_string option;
      [@ocaml.doc "An identifier string for the consumer cluster.\n"]
  query_start_time : timestamp option;
      [@ocaml.doc "A timestamp provided by the query engine for when the query started.\n"]
  query_id : hash_string option;
      [@ocaml.doc "A unique identifier generated by the query engine for the query.\n"]
}
[@@ocaml.doc
  "A structure used as a protocol between query engines and Lake Formation or Glue. Contains both \
   a Lake Formation generated authorization identifier and information from the request's \
   authorization context.\n"]

type nonrec other_metadata_value_list_item = {
  created_time : created_timestamp option; [@ocaml.doc "The time at which the entry was created.\n"]
  metadata_value : metadata_value_string option;
      [@ocaml.doc
        "The metadata key\226\128\153s corresponding value for the other metadata belonging to the \
         same metadata key.\n"]
}
[@@ocaml.doc
  "A structure containing other metadata for a schema version belonging to the same metadata key.\n"]

type nonrec other_metadata_value_list = other_metadata_value_list_item list [@@ocaml.doc ""]

type nonrec metadata_info = {
  other_metadata_value_list : other_metadata_value_list option;
      [@ocaml.doc "Other metadata belonging to the same metadata key.\n"]
  created_time : created_timestamp option; [@ocaml.doc "The time at which the entry was created.\n"]
  metadata_value : metadata_value_string option;
      [@ocaml.doc "The metadata key\226\128\153s corresponding value.\n"]
}
[@@ocaml.doc "A structure containing metadata information for a schema version.\n"]

type nonrec metadata_info_map = (metadata_key_string * metadata_info) list [@@ocaml.doc ""]

type nonrec query_schema_version_metadata_response = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique version ID of the schema version.\n"]
  metadata_info_map : metadata_info_map option;
      [@ocaml.doc "A map of a metadata key and associated values.\n"]
}
[@@ocaml.doc ""]

type nonrec query_schema_version_metadata_max_results = int [@@ocaml.doc ""]

type nonrec metadata_list = metadata_key_value_pair list [@@ocaml.doc ""]

type nonrec query_schema_version_metadata_input = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : query_schema_version_metadata_max_results option;
      [@ocaml.doc
        "Maximum number of results required per page. If the value is not supplied, this will be \
         defaulted to 25 per page.\n"]
  metadata_list : metadata_list option;
      [@ocaml.doc
        "Search key-value pairs for metadata, if they are not provided all the metadata \
         information will be fetched.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique version ID of the schema version.\n"]
  schema_version_number : schema_version_number option;
      [@ocaml.doc "The version number of the schema.\n"]
  schema_id : schema_id option;
      [@ocaml.doc
        "A wrapper structure that may contain the schema name and Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec python_script = string [@@ocaml.doc ""]

type nonrec put_workflow_run_properties_response = unit [@@ocaml.doc ""]

type nonrec put_workflow_run_properties_request = {
  run_properties : workflow_run_properties;
      [@ocaml.doc
        "The properties to put for the specified run.\n\n\
        \ Run properties may be logged. Do not pass plaintext secrets as properties. Retrieve \
         secrets from a Glue Connection, Amazon Web Services Secrets Manager or other secret \
         management mechanism if you intend to use them within the workflow run.\n\
        \ "]
  run_id : id_string;
      [@ocaml.doc "The ID of the workflow run for which the run properties should be updated.\n"]
  name : name_string; [@ocaml.doc "Name of the workflow which was run.\n"]
}
[@@ocaml.doc ""]

type nonrec put_schema_version_metadata_response = {
  metadata_value : metadata_value_string option; [@ocaml.doc "The value of the metadata key.\n"]
  metadata_key : metadata_key_string option; [@ocaml.doc "The metadata key.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique version ID of the schema version.\n"]
  version_number : version_long_number option; [@ocaml.doc "The version number of the schema.\n"]
  latest_version : latest_schema_version_boolean option;
      [@ocaml.doc "The latest version of the schema.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name for the registry.\n"]
  schema_name : schema_registry_name_string option; [@ocaml.doc "The name for the schema.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec put_schema_version_metadata_input = {
  metadata_key_value : metadata_key_value_pair;
      [@ocaml.doc "The metadata key's corresponding value.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique version ID of the schema version.\n"]
  schema_version_number : schema_version_number option;
      [@ocaml.doc "The version number of the schema.\n"]
  schema_id : schema_id option; [@ocaml.doc "The unique ID for the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_response = {
  policy_hash : hash_string option;
      [@ocaml.doc
        "A hash of the policy that has just been set. This must be included in a subsequent call \
         that overwrites or updates this policy.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_json_string = string [@@ocaml.doc ""]

type nonrec exist_condition =
  | NONE [@ocaml.doc ""]
  | NOT_EXIST [@ocaml.doc ""]
  | MUST_EXIST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec enable_hybrid_values = FALSE [@ocaml.doc ""] | TRUE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  enable_hybrid : enable_hybrid_values option;
      [@ocaml.doc
        "If ['TRUE'], indicates that you are using both methods to grant cross-account access to \
         Data Catalog resources:\n\n\
        \ {ul\n\
        \       {-  By directly updating the resource policy with [PutResourePolicy] \n\
        \           \n\
        \            }\n\
        \       {-  By using the {b Grant permissions} command on the Amazon Web Services \
         Management Console.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Must be set to ['TRUE'] if you have already used the Management Console to grant \
         cross-account access, otherwise the call fails. Default is 'FALSE'.\n\
        \   "]
  policy_exists_condition : exist_condition option;
      [@ocaml.doc
        "A value of [MUST_EXIST] is used to update a policy. A value of [NOT_EXIST] is used to \
         create a new policy. If a value of [NONE] or a null value is used, the call does not \
         depend on the existence of a policy.\n"]
  policy_hash_condition : hash_string option;
      [@ocaml.doc
        "The hash value returned when the previous policy was set using [PutResourcePolicy]. Its \
         purpose is to prevent concurrent modifications of a policy. Do not use this parameter if \
         no previous policy has been set.\n"]
  resource_arn : glue_resource_arn option; [@ocaml.doc "Do not use. For internal use only.\n"]
  policy_in_json : policy_json_string;
      [@ocaml.doc "Contains the policy document to set, in JSON format.\n"]
}
[@@ocaml.doc ""]

type nonrec condition_check_failure_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "A specified condition was not satisfied.\n"]

type nonrec form_type_id = string [@@ocaml.doc ""]

type nonrec form_type_name = string [@@ocaml.doc ""]

type nonrec form_type_schema = string [@@ocaml.doc ""]

type nonrec put_form_type_response = {
  schema : form_type_schema option; [@ocaml.doc "The Smithy IDL schema of the form type.\n"]
  name : form_type_name option; [@ocaml.doc "The name of the form type.\n"]
  id : form_type_id option; [@ocaml.doc "The identifier of the form type.\n"]
}
[@@ocaml.doc ""]

type nonrec put_form_type_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  schema : form_type_schema; [@ocaml.doc "The Smithy IDL schema definition for the form type.\n"]
  name : form_type_name;
      [@ocaml.doc "The name of the form type. Must start with an uppercase letter.\n"]
}
[@@ocaml.doc ""]

type nonrec put_data_quality_profile_annotation_response = unit [@@ocaml.doc ""]

type nonrec put_data_quality_profile_annotation_request = {
  inclusion_annotation : inclusion_annotation_value;
      [@ocaml.doc "The inclusion annotation value to apply to the profile.\n"]
  profile_id : hash_string;
      [@ocaml.doc "The ID of the data quality monitoring profile to annotate.\n"]
}
[@@ocaml.doc ""]

type nonrec put_data_catalog_encryption_settings_response = unit [@@ocaml.doc ""]

type nonrec catalog_encryption_mode =
  | SSEKMSWITHSERVICEROLE [@ocaml.doc ""]
  | SSEKMS [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_at_rest = {
  catalog_encryption_service_role : iam_role_arn option;
      [@ocaml.doc
        "The role that Glue assumes to encrypt and decrypt the Data Catalog objects on the \
         caller's behalf.\n"]
  sse_aws_kms_key_id : name_string option;
      [@ocaml.doc "The ID of the KMS key to use for encryption at rest.\n"]
  catalog_encryption_mode : catalog_encryption_mode;
      [@ocaml.doc "The encryption-at-rest mode for encrypting Data Catalog data.\n"]
}
[@@ocaml.doc "Specifies the encryption-at-rest configuration for the Data Catalog.\n"]

type nonrec connection_password_encryption = {
  aws_kms_key_id : name_string option;
      [@ocaml.doc
        "An KMS key that is used to encrypt the connection password. \n\n\
        \ If connection password protection is enabled, the caller of [CreateConnection] and \
         [UpdateConnection] needs at least [kms:Encrypt] permission on the specified KMS key, to \
         encrypt passwords before storing them in the Data Catalog. \n\
        \ \n\
        \  You can set the decrypt permission to enable or restrict access on the password key \
         according to your security requirements.\n\
        \  "]
  return_connection_password_encrypted : boolean_;
      [@ocaml.doc
        "When the [ReturnConnectionPasswordEncrypted] flag is set to \"true\", passwords remain \
         encrypted in the responses of [GetConnection] and [GetConnections]. This encryption takes \
         effect independently from catalog encryption. \n"]
}
[@@ocaml.doc
  "The data structure used by the Data Catalog to encrypt the password as part of \
   [CreateConnection] or [UpdateConnection] and store it in the [ENCRYPTED_PASSWORD] field in the \
   connection properties. You can enable catalog encryption or only password encryption.\n\n\
  \ When a [CreationConnection] request arrives containing a password, the Data Catalog first \
   encrypts the password using your KMS key. It then encrypts the whole connection object again if \
   catalog encryption is also enabled.\n\
  \ \n\
  \  This encryption requires that you set KMS key permissions to enable or restrict access on the \
   password key according to your security requirements. For example, you might want only \
   administrators to have decrypt permission on the password key.\n\
  \  "]

type nonrec data_catalog_encryption_settings = {
  connection_password_encryption : connection_password_encryption option;
      [@ocaml.doc
        "When connection password protection is enabled, the Data Catalog uses a customer-provided \
         key to encrypt the password as part of [CreateConnection] or [UpdateConnection] and store \
         it in the [ENCRYPTED_PASSWORD] field in the connection properties. You can enable catalog \
         encryption or only password encryption.\n"]
  encryption_at_rest : encryption_at_rest option;
      [@ocaml.doc "Specifies the encryption-at-rest configuration for the Data Catalog.\n"]
}
[@@ocaml.doc "Contains configuration information for maintaining Data Catalog security.\n"]

type nonrec put_data_catalog_encryption_settings_request = {
  data_catalog_encryption_settings : data_catalog_encryption_settings;
      [@ocaml.doc "The security configuration to set.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog to set the security configuration for. If none is provided, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec iterable_form_name = string [@@ocaml.doc ""]

type nonrec item_identifier = string [@@ocaml.doc ""]

type nonrec attachment_name = string [@@ocaml.doc ""]

type nonrec put_attachment_response = {
  form_type_id : form_type_id option;
      [@ocaml.doc "The identifier of the form type for this attachment.\n"]
  attachment_name : attachment_name option; [@ocaml.doc "The name of the attachment.\n"]
  item_identifier : item_identifier option;
      [@ocaml.doc "The identifier of the item within the iterable form, if applicable.\n"]
  iterable_form_name : iterable_form_name option;
      [@ocaml.doc "The name of the iterable form, if the attachment targets an item.\n"]
  asset_identifier : asset_id option; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec form_content = string [@@ocaml.doc ""]

type nonrec put_attachment_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  form_type_id : form_type_id; [@ocaml.doc "The identifier of the form type for this attachment.\n"]
  content : form_content;
      [@ocaml.doc
        "The JSON content of the form, conforming to the schema of the specified form type.\n"]
  attachment_name : attachment_name; [@ocaml.doc "The name of the attachment.\n"]
  item_identifier : item_identifier option;
      [@ocaml.doc
        "The identifier of the item within the iterable form. Required when [iterableFormName] is \
         specified.\n"]
  iterable_form_name : iterable_form_name option;
      [@ocaml.doc
        "The name of the iterable form. When specified along with [itemIdentifier], the attachment \
         targets an item within the iterable form rather than the asset itself.\n"]
  asset_identifier : asset_id;
      [@ocaml.doc "The unique identifier of the asset to attach the form to.\n"]
}
[@@ocaml.doc ""]

type nonrec asset_type_name = string [@@ocaml.doc ""]

type nonrec asset_type_form_reference = {
  form_type_identifier : form_type_id; [@ocaml.doc "The identifier of the referenced form type.\n"]
}
[@@ocaml.doc "A reference to a form type that is included in an asset type.\n"]

type nonrec asset_type_form_key = string [@@ocaml.doc ""]

type nonrec asset_type_forms_map = (asset_type_form_key * asset_type_form_reference) list
[@@ocaml.doc ""]

type nonrec put_asset_type_response = {
  forms : asset_type_forms_map option;
      [@ocaml.doc "The forms that make up the asset type, keyed by form name.\n"]
  name : asset_type_name option; [@ocaml.doc "The name of the asset type.\n"]
  id : asset_type_id option; [@ocaml.doc "The identifier of the asset type.\n"]
}
[@@ocaml.doc ""]

type nonrec put_asset_type_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  forms : asset_type_forms_map;
      [@ocaml.doc
        "The forms that make up the asset type, keyed by form name. Each entry references the form \
         type that defines the form's schema.\n"]
  name : asset_type_name; [@ocaml.doc "The name of the asset type.\n"]
}
[@@ocaml.doc ""]

type nonrec created_at = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec asset_form_entry = {
  content : form_content option;
      [@ocaml.doc
        "The JSON content of the form, conforming to the schema of the specified form type.\n"]
  form_type_id : form_type_id option;
      [@ocaml.doc "The identifier of the form type that defines this form's schema.\n"]
}
[@@ocaml.doc "A form on an asset, consisting of the form type identifier and its JSON content.\n"]

type nonrec asset_form_key = string [@@ocaml.doc ""]

type nonrec asset_form_map = (asset_form_key * asset_form_entry) list [@@ocaml.doc ""]

type nonrec put_asset_response = {
  forms : asset_form_map option;
      [@ocaml.doc "The forms attached to the asset, keyed by form name.\n"]
  created_at : created_at option; [@ocaml.doc "The timestamp at which the asset was created.\n"]
  description : asset_description option; [@ocaml.doc "The description of the asset.\n"]
  name : asset_name; [@ocaml.doc "The name of the asset.\n"]
  id : asset_id; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec put_asset_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  forms : asset_form_map;
      [@ocaml.doc
        "The forms to set on the asset, keyed by form name. Each entry specifies the form type and \
         its JSON content.\n"]
  description : asset_description option; [@ocaml.doc "The description of the asset.\n"]
  name : asset_name; [@ocaml.doc "The name of the asset.\n"]
  identifier : asset_id;
      [@ocaml.doc
        "The unique identifier of the asset. If an asset with this identifier already exists, it \
         is updated.\n"]
  asset_type_id : asset_type_id; [@ocaml.doc "The identifier of the asset type for the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec property_types = property_type list [@@ocaml.doc ""]

type nonrec property_name_overrides = (property_name * property_name) list [@@ocaml.doc ""]

type nonrec property_description_string = string [@@ocaml.doc ""]

type nonrec allowed_value_description_string = string [@@ocaml.doc ""]

type nonrec allowed_value_value_string = string [@@ocaml.doc ""]

type nonrec allowed_value = {
  value : allowed_value_value_string; [@ocaml.doc "The value allowed for the property.\n"]
  description : allowed_value_description_string option;
      [@ocaml.doc "A description of the allowed value.\n"]
}
[@@ocaml.doc "An object representing a value allowed for a property.\n"]

type nonrec allowed_values = allowed_value list [@@ocaml.doc ""]

type nonrec data_operation = WRITE [@ocaml.doc ""] | READ [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec data_operations = data_operation list [@@ocaml.doc ""]

type nonrec property = {
  property_location : property_location option;
      [@ocaml.doc
        "Specifies where this property should be included in REST requests, such as in headers, \
         query parameters, or request body.\n"]
  key_override : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A key name to use when sending this property in API requests, if different from the \
         display name.\n"]
  data_operation_scopes : data_operations option;
      [@ocaml.doc "Indicates which data operations are applicable to the property.\n"]
  allowed_values : allowed_values option;
      [@ocaml.doc
        "A list of [AllowedValue] objects representing the values allowed for the property.\n"]
  property_types : property_types; [@ocaml.doc "Describes the type of property.\n"]
  default_value : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The default value for the property.\n"]
  required : bool_; [@ocaml.doc "Indicates whether the property is required.\n"]
  description : property_description_string; [@ocaml.doc "A description of the property.\n"]
  name : property_name; [@ocaml.doc "The name of the property.\n"]
}
[@@ocaml.doc "An object that defines a connection type for a compute environment.\n"]

type nonrec properties_map = (property_name * property) list [@@ocaml.doc ""]

type nonrec predicate_string = string [@@ocaml.doc ""]

type nonrec positive_integer = int [@@ocaml.doc ""]

type nonrec permission_type_mismatch_exception = {
  message : message_string option;
      [@ocaml.doc
        "There is a mismatch between the SupportedPermissionType used in the query request and the \
         permissions defined on the target table.\n"]
}
[@@ocaml.doc "The operation timed out.\n"]

type nonrec permission_type =
  | NESTED_CELL_PERMISSION [@ocaml.doc ""]
  | NESTED_PERMISSION [@ocaml.doc ""]
  | CELL_FILTER_PERMISSION [@ocaml.doc ""]
  | COLUMN_PERMISSION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec permission_type_list = permission_type list [@@ocaml.doc ""]

type nonrec partition_value_list = {
  values : value_string_list; [@ocaml.doc "The list of values.\n"]
}
[@@ocaml.doc "Contains a list of values defining partitions.\n"]

type nonrec partition_list = partition list [@@ocaml.doc ""]

type nonrec partition_input_list = partition_input list [@@ocaml.doc ""]

type nonrec partition_index_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_list = name_string list [@@ocaml.doc ""]

type nonrec partition_index = {
  index_name : name_string; [@ocaml.doc "The name of the partition index.\n"]
  keys : key_list; [@ocaml.doc "The keys for the partition index.\n"]
}
[@@ocaml.doc "A structure for a partition index.\n"]

type nonrec partition_index_list = partition_index list [@@ocaml.doc ""]

type nonrec key_schema_element = {
  type_ : column_type_string; [@ocaml.doc "The type of a partition key.\n"]
  name : name_string; [@ocaml.doc "The name of a partition key.\n"]
}
[@@ocaml.doc "A partition key pair consisting of a name and a type.\n"]

type nonrec key_schema_element_list = key_schema_element list [@@ocaml.doc ""]

type nonrec backfill_error_code =
  | UNSUPPORTED_PARTITION_CHARACTER_ERROR [@ocaml.doc ""]
  | MISSING_PARTITION_VALUE_ERROR [@ocaml.doc ""]
  | INVALID_PARTITION_TYPE_DATA_ERROR [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
  | ENCRYPTED_PARTITION_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec backfill_errored_partitions_list = partition_value_list list [@@ocaml.doc ""]

type nonrec backfill_error = {
  partitions : backfill_errored_partitions_list option;
      [@ocaml.doc "A list of a limited number of partitions in the response.\n"]
  code : backfill_error_code option;
      [@ocaml.doc
        "The error code for an error that occurred when registering partition indexes for an \
         existing table.\n"]
}
[@@ocaml.doc
  "A list of errors that can occur when registering partition indexes for an existing table.\n\n\
  \ These errors give the details about why an index registration failed and provide a limited \
   number of partitions in the response, so that you can fix the partitions at fault and try \
   registering the index again. The most common set of errors that can occur are categorized as \
   follows:\n\
  \ \n\
  \  {ul\n\
  \        {-  EncryptedPartitionError: The partitions are encrypted.\n\
  \            \n\
  \             }\n\
  \        {-  InvalidPartitionTypeDataError: The partition value doesn't match the data type for \
   that partition column.\n\
  \            \n\
  \             }\n\
  \        {-  MissingPartitionValueError: The partitions are encrypted.\n\
  \            \n\
  \             }\n\
  \        {-  UnsupportedPartitionCharacterError: Characters inside the partition value are not \
   supported. For example: U+0000 , U+0001, U+0002.\n\
  \            \n\
  \             }\n\
  \        {-  InternalError: Any error which does not belong to other error codes.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec backfill_errors = backfill_error list [@@ocaml.doc ""]

type nonrec partition_index_descriptor = {
  backfill_errors : backfill_errors option;
      [@ocaml.doc
        "A list of errors that can occur when registering partition indexes for an existing table.\n"]
  index_status : partition_index_status;
      [@ocaml.doc
        "The status of the partition index. \n\n\
        \ The possible statuses are:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATING: The index is being created. When an index is in a CREATING state, \
         the index or its table cannot be deleted.\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE: The index creation succeeds.\n\
        \            \n\
        \             }\n\
        \        {-  FAILED: The index creation fails. \n\
        \            \n\
        \             }\n\
        \        {-  DELETING: The index is deleted from the list of indexes.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  keys : key_schema_element_list;
      [@ocaml.doc
        "A list of one or more keys, as [KeySchemaElement] structures, for the partition index.\n"]
  index_name : name_string; [@ocaml.doc "The name of the partition index.\n"]
}
[@@ocaml.doc "A descriptor for a partition index in a table.\n"]

type nonrec partition_index_descriptor_list = partition_index_descriptor list [@@ocaml.doc ""]

type nonrec partition_error = {
  error_detail : error_detail option; [@ocaml.doc "The details about the partition error.\n"]
  partition_values : value_string_list option; [@ocaml.doc "The values that define the partition.\n"]
}
[@@ocaml.doc "Contains information about a partition error.\n"]

type nonrec partition_errors = partition_error list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec orchestration_token = string [@@ocaml.doc ""]

type nonrec orchestration_page_size25 = int [@@ocaml.doc ""]

type nonrec orchestration_page_size200 = int [@@ocaml.doc ""]

type nonrec option_value = string [@@ocaml.doc ""]

type nonrec option_key = string [@@ocaml.doc ""]

type nonrec metadata_operation = CREATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_iceberg_table_input = {
  properties : string_to_string_map option;
      [@ocaml.doc
        "Key-value pairs of additional table properties and configuration settings for the Iceberg \
         table.\n"]
  write_order : iceberg_sort_order option;
      [@ocaml.doc
        "The sort order specification that defines how data should be ordered within each \
         partition to optimize query performance.\n"]
  partition_spec : iceberg_partition_spec option;
      [@ocaml.doc
        "The partitioning specification that defines how the Iceberg table data will be organized \
         and partitioned for optimal query performance.\n"]
  schema : iceberg_schema;
      [@ocaml.doc
        "The schema definition that specifies the structure, field types, and metadata for the \
         Iceberg table.\n"]
  location : location_string;
      [@ocaml.doc "The S3 location where the Iceberg table data will be stored.\n"]
}
[@@ocaml.doc
  "The configuration parameters required to create a new Iceberg table in the Glue Data Catalog, \
   including table properties and metadata specifications.\n"]

type nonrec iceberg_input = {
  create_iceberg_table_input : create_iceberg_table_input option;
      [@ocaml.doc
        "The configuration parameters required to create a new Iceberg table in the Glue Data \
         Catalog, including table properties and metadata specifications.\n"]
  version : version_string option;
      [@ocaml.doc "The table version for the Iceberg table. Defaults to 2.\n"]
  metadata_operation : metadata_operation;
      [@ocaml.doc "A required metadata operation. Can only be set to [CREATE].\n"]
}
[@@ocaml.doc
  "A structure that defines an Apache Iceberg metadata table to create in the catalog.\n"]

type nonrec open_table_format_input = {
  iceberg_input : iceberg_input option;
      [@ocaml.doc
        "Specifies an [IcebergInput] structure that defines an Apache Iceberg metadata table.\n"]
}
[@@ocaml.doc "A structure representing an open format table.\n"]

type nonrec o_auth2_properties = {
  token_url_parameters_map : token_url_parameters_map option;
      [@ocaml.doc "A map of parameters that are added to the token [GET] request.\n"]
  token_url : token_url option;
      [@ocaml.doc
        "The URL of the provider's authentication server, to exchange an authorization code for an \
         access token.\n"]
  o_auth2_client_application : o_auth2_client_application option;
      [@ocaml.doc "The client application type. For example, AWS_MANAGED or USER_MANAGED.\n"]
  o_auth2_grant_type : o_auth2_grant_type option;
      [@ocaml.doc
        "The OAuth2 grant type. For example, [AUTHORIZATION_CODE], [JWT_BEARER], or \
         [CLIENT_CREDENTIALS].\n"]
}
[@@ocaml.doc "A structure containing properties for OAuth2 authentication.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec new_rules = name_string list [@@ocaml.doc ""]

type nonrec integration_description = string [@@ocaml.doc ""]

type nonrec integration_string = string [@@ocaml.doc ""]

type nonrec integration_additional_encryption_context_map =
  (integration_string * integration_string) list
[@@ocaml.doc ""]

type nonrec integration_tags_list = tag list [@@ocaml.doc ""]

type nonrec integration_status =
  | NEEDS_ATTENTION [@ocaml.doc ""]
  | SYNCING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integration_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec integration_error = {
  error_message : string2048 option; [@ocaml.doc "A message describing the error.\n"]
  error_code : string128 option; [@ocaml.doc "The code associated with this error.\n"]
}
[@@ocaml.doc "An error associated with a zero-ETL integration.\n"]

type nonrec integration_error_list = integration_error list [@@ocaml.doc ""]

type nonrec integration_source_properties_map = (integration_string * integration_string) list
[@@ocaml.doc ""]

type nonrec continuous_sync = bool [@@ocaml.doc ""]

type nonrec integration_config = {
  continuous_sync : continuous_sync option;
      [@ocaml.doc
        "Enables continuous synchronization for on-demand data extractions from SaaS applications \
         to Amazon Web Services data services like Amazon Redshift and Amazon S3.\n"]
  source_properties : integration_source_properties_map option;
      [@ocaml.doc
        " A collection of key-value pairs that specify additional properties for the integration \
         source. These properties provide configuration options that can be used to customize the \
         behavior of the ODB source during data integration operations. \n"]
  refresh_interval : string128 option;
      [@ocaml.doc
        "Specifies the frequency at which CDC (Change Data Capture) pulls or incremental loads \
         should occur. This parameter provides flexibility to align the refresh rate with your \
         specific data update patterns, system load considerations, and performance optimization \
         goals. Time increment can be set from 15 minutes to 8640 minutes (six days).\n"]
}
[@@ocaml.doc "Properties associated with the integration.\n"]

type nonrec modify_integration_response = {
  integration_config : integration_config option;
      [@ocaml.doc "The updated configuration settings for the integration.\n"]
  data_filter : string2048 option;
      [@ocaml.doc "Selects source tables for the integration using Maxwell filter syntax.\n"]
  errors : integration_error_list option;
      [@ocaml.doc "A list of errors associated with the integration modification.\n"]
  create_time : integration_timestamp;
      [@ocaml.doc "The time when the integration was created, in UTC.\n"]
  status : integration_status;
      [@ocaml.doc
        "The status of the integration being modified.\n\n\
        \ The possible statuses are:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATING: The integration is being created.\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE: The integration creation succeeds.\n\
        \            \n\
        \             }\n\
        \        {-  MODIFYING: The integration is being modified.\n\
        \            \n\
        \             }\n\
        \        {-  FAILED: The integration creation fails. \n\
        \            \n\
        \             }\n\
        \        {-  DELETING: The integration is deleted.\n\
        \            \n\
        \             }\n\
        \        {-  SYNCING: The integration is synchronizing.\n\
        \            \n\
        \             }\n\
        \        {-  NEEDS_ATTENTION: The integration needs attention, such as synchronization.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tags : integration_tags_list option;
      [@ocaml.doc "Metadata assigned to the resource consisting of a list of key-value pairs.\n"]
  additional_encryption_context : integration_additional_encryption_context_map option;
      [@ocaml.doc
        "An optional set of non-secret key\226\128\147value pairs that contains additional \
         contextual information for encryption.\n"]
  kms_key_id : string2048 option;
      [@ocaml.doc "The ARN of a KMS key used for encrypting the channel.\n"]
  integration_arn : string128; [@ocaml.doc "The Amazon Resource Name (ARN) for the integration.\n"]
  description : integration_description option; [@ocaml.doc "A description of the integration.\n"]
  integration_name : string128; [@ocaml.doc "A unique name for an integration in Glue.\n"]
  target_arn : string512; [@ocaml.doc "The ARN of the target for the integration.\n"]
  source_arn : string512; [@ocaml.doc "The ARN of the source for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_integration_request = {
  integration_name : string128 option; [@ocaml.doc "A unique name for an integration in Glue.\n"]
  integration_config : integration_config option;
      [@ocaml.doc
        "The configuration settings for the integration. Currently, only the RefreshInterval can \
         be modified. \n"]
  data_filter : string2048 option;
      [@ocaml.doc "Selects source tables for the integration using Maxwell filter syntax.\n"]
  description : integration_description option; [@ocaml.doc "A description of the integration.\n"]
  integration_identifier : string128;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_state_exception = {
  message : message_string option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "An error that indicates your data is in an invalid state.\n"]

type nonrec invalid_integration_state_fault = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The integration is in an invalid state.\n"]

type nonrec integration_not_found_fault = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The specified integration could not be found.\n"]

type nonrec integration_conflict_operation_fault = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The requested operation conflicts with another operation.\n"]

type nonrec milliseconds_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec data_quality_metric_values = {
  upper_limit : nullable_double option;
      [@ocaml.doc
        "The upper limit of the data quality metric value according to the analysis of historical \
         data.\n"]
  lower_limit : nullable_double option;
      [@ocaml.doc
        "The lower limit of the data quality metric value according to the analysis of historical \
         data.\n"]
  expected_value : nullable_double option;
      [@ocaml.doc
        "The expected value of the data quality metric according to the analysis of historical data.\n"]
  actual_value : nullable_double option;
      [@ocaml.doc "The actual value of the data quality metric.\n"]
}
[@@ocaml.doc
  "Describes the data quality metric value according to the analysis of historical data.\n"]

type nonrec metric_based_observation = {
  new_rules : new_rules option;
      [@ocaml.doc
        "A list of new data quality rules generated as part of the observation based on the data \
         quality metric value.\n"]
  metric_values : data_quality_metric_values option;
      [@ocaml.doc
        "An object of type [DataQualityMetricValues] representing the analysis of the data quality \
         metric value.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
  metric_name : name_string option;
      [@ocaml.doc "The name of the data quality metric used for generating the observation.\n"]
}
[@@ocaml.doc
  "Describes the metric based observation generated based on evaluated data quality metrics.\n"]

type nonrec message_prefix = string [@@ocaml.doc ""]

type nonrec max_results_number = int [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec max_list_table_optimizer_runs_token_results = int [@@ocaml.doc ""]

type nonrec materialized_view_refresh_type = INCREMENTAL [@ocaml.doc ""] | FULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec materialized_view_refresh_state =
  | STOPPED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec byte_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec materialized_view_refresh_task_run = {
  processed_bytes : byte_count option;
      [@ocaml.doc
        "The number of bytes the refresh task run has scanned to refresh the materialized view.\n"]
  refresh_type : materialized_view_refresh_type option;
      [@ocaml.doc "The type of the refresh task run. Either FULL or INCREMENTAL.\n"]
  dpu_seconds : non_negative_double option;
      [@ocaml.doc "The calculated DPU usage in seconds for all autoscaled workers.\n"]
  error_message : description_string option; [@ocaml.doc "The error message for the job.\n"]
  end_time : timestamp option; [@ocaml.doc "The end time of the task.\n"]
  start_time : timestamp option; [@ocaml.doc "The start time of the task.\n"]
  last_updated : timestamp option;
      [@ocaml.doc "The last point in time when this task was modified.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that this task was created.\n"]
  status : materialized_view_refresh_state option; [@ocaml.doc "The status of the task run.\n"]
  role : role option; [@ocaml.doc "The IAM role that the service assumes to generate statistics.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is supplied, the account ID \
         is used by default.\n"]
  table_name : table_name option;
      [@ocaml.doc "The name of the table for which statistics is generated.\n"]
  database_name : database_name option; [@ocaml.doc "The database where the table resides.\n"]
  materialized_view_refresh_task_run_id : uui_dv4 option;
      [@ocaml.doc "The identifier of the materialized view refresh task run.\n"]
  customer_id : account_id option; [@ocaml.doc "The Amazon Web Services account ID.\n"]
}
[@@ocaml.doc "The object that shows the details of the materialized view refresh task run.\n"]

type nonrec materialized_view_refresh_task_runs_list = materialized_view_refresh_task_run list
[@@ocaml.doc ""]

type nonrec field_type = string [@@ocaml.doc ""]

type nonrec mapping_entry = {
  target_type : field_type option; [@ocaml.doc "The target type.\n"]
  target_path : schema_path_string option; [@ocaml.doc "The target path.\n"]
  target_table : table_name option; [@ocaml.doc "The target table.\n"]
  source_type : field_type option; [@ocaml.doc "The source type.\n"]
  source_path : schema_path_string option; [@ocaml.doc "The source path.\n"]
  source_table : table_name option; [@ocaml.doc "The name of the source table.\n"]
}
[@@ocaml.doc "Defines a mapping.\n"]

type nonrec mapping_list = mapping_entry list [@@ocaml.doc ""]

type nonrec long_value_string = string [@@ocaml.doc ""]

type nonrec code_gen_arg_name = string [@@ocaml.doc ""]

type nonrec code_gen_arg_value = string [@@ocaml.doc ""]

type nonrec code_gen_node_arg = {
  param : boolean_ option; [@ocaml.doc "True if the value is used as a parameter.\n"]
  value : code_gen_arg_value; [@ocaml.doc "The value of the argument or property.\n"]
  name : code_gen_arg_name; [@ocaml.doc "The name of the argument or property.\n"]
}
[@@ocaml.doc "An argument or property of a node.\n"]

type nonrec code_gen_node_args = code_gen_node_arg list [@@ocaml.doc ""]

type nonrec location = {
  dynamo_d_b : code_gen_node_args option; [@ocaml.doc "An Amazon DynamoDB table location.\n"]
  s3 : code_gen_node_args option;
      [@ocaml.doc "An Amazon Simple Storage Service (Amazon S3) location.\n"]
  jdbc : code_gen_node_args option; [@ocaml.doc "A JDBC location.\n"]
}
[@@ocaml.doc "The location of resources.\n"]

type nonrec list_workflows_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if not all workflow names have been returned.\n"]
  workflows : workflow_names option; [@ocaml.doc "List of names of workflows in the account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflows_request = {
  max_results : orchestration_page_size25 option;
      [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_usage_profiles_response = {
  next_token : orchestration_token option;
      [@ocaml.doc "A continuation token, present if the current list segment is not the last.\n"]
  profiles : usage_profile_definition_list option;
      [@ocaml.doc "A list of usage profile ([UsageProfileDefinition]) objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_usage_profiles_request = {
  max_results : orchestration_page_size200 option;
      [@ocaml.doc "The maximum number of usage profiles to return in a single response.\n"]
  next_token : orchestration_token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_triggers_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last metric available.\n"]
  trigger_names : trigger_name_list option;
      [@ocaml.doc
        "The names of all triggers in the account, or the triggers with the specified tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_triggers_request = {
  tags : tags_map option; [@ocaml.doc "Specifies to return only these tagged resources.\n"]
  max_results : orchestration_page_size200 option;
      [@ocaml.doc "The maximum size of a list to return.\n"]
  dependent_job_name : name_string option;
      [@ocaml.doc
        " The name of the job for which to retrieve triggers. The trigger that can start this job \
         is returned. If there is no such trigger, all triggers are returned.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_table_optimizer_runs_token = string [@@ocaml.doc ""]

type nonrec list_table_optimizer_runs_response = {
  table_optimizer_runs : table_optimizer_runs option;
      [@ocaml.doc "A list of the optimizer runs associated with a table.\n"]
  next_token : list_table_optimizer_runs_token option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of optimizer runs, returned if the \
         current segment of the list is not the last.\n"]
  table_name : name_string option; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string option;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec list_table_optimizer_runs_request = {
  next_token : list_table_optimizer_runs_token option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : max_list_table_optimizer_runs_token_results option;
      [@ocaml.doc "The maximum number of optimizer runs to return on each call.\n"]
  type_ : table_optimizer_type; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec list_statements_response = {
  next_token : orchestration_token option;
      [@ocaml.doc "A continuation token, if not all statements have yet been returned.\n"]
  statements : statement_list option; [@ocaml.doc "Returns the list of statements.\n"]
}
[@@ocaml.doc ""]

type nonrec list_statements_request = {
  next_token : orchestration_token option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  request_origin : orchestration_name_string option;
      [@ocaml.doc "The origin of the request to list statements.\n"]
  session_id : name_string; [@ocaml.doc "The Session ID of the statements.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sessions_response = {
  next_token : orchestration_token option;
      [@ocaml.doc "The token for the next set of results, or null if there are no more result. \n"]
  sessions : session_list option; [@ocaml.doc "Returns the session object. \n"]
  ids : session_id_list option; [@ocaml.doc "Returns the ID of the session. \n"]
}
[@@ocaml.doc ""]

type nonrec list_sessions_request = {
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request. \n"]
  tags : tags_map option; [@ocaml.doc "Tags belonging to the session. \n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results. \n"]
  next_token : orchestration_token option;
      [@ocaml.doc "The token for the next set of results, or null if there are no more result. \n"]
}
[@@ocaml.doc ""]

type nonrec list_schemas_response = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  schemas : schema_list_definition option;
      [@ocaml.doc "An array of [SchemaListItem] objects containing details of each schema.\n"]
}
[@@ocaml.doc ""]

type nonrec list_schemas_input = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : max_results_number option;
      [@ocaml.doc
        "Maximum number of results required per page. If the value is not supplied, this will be \
         defaulted to 25 per page.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "A wrapper structure that may contain the registry name and Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec list_schema_versions_response = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  schemas : schema_version_list option;
      [@ocaml.doc
        "An array of [SchemaVersionList] objects containing details of each schema version.\n"]
}
[@@ocaml.doc ""]

type nonrec list_schema_versions_input = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : max_results_number option;
      [@ocaml.doc
        "Maximum number of results required per page. If the value is not supplied, this will be \
         defaulted to 25 per page.\n"]
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either \
         [SchemaArn] or [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. Either [SchemaArn] or \
         [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_registries_response = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  registries : registry_list_definition option;
      [@ocaml.doc
        "An array of [RegistryDetailedListItem] objects containing minimal details of each registry.\n"]
}
[@@ocaml.doc ""]

type nonrec list_registries_input = {
  next_token : schema_registry_token_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : max_results_number option;
      [@ocaml.doc
        "Maximum number of results required per page. If the value is not supplied, this will be \
         defaulted to 25 per page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_materialized_view_refresh_task_runs_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, if not all task run IDs have yet been returned.\n"]
  materialized_view_refresh_task_runs : materialized_view_refresh_task_runs_list option;
      [@ocaml.doc "The results of the ListMaterializedViewRefreshTaskRuns action. \n"]
}
[@@ocaml.doc ""]

type nonrec list_materialized_view_refresh_task_runs_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of the response.\n"]
  table_name : name_string option;
      [@ocaml.doc "The name of the table for which statistics is generated.\n"]
  database_name : name_string option; [@ocaml.doc "The database where the table resides.\n"]
  catalog_id : name_string;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is supplied, the account ID \
         is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec list_ml_transforms_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last metric available.\n"]
  transform_ids : transform_id_list;
      [@ocaml.doc
        "The identifiers of all the machine learning transforms in the account, or the machine \
         learning transforms with the specified tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_ml_transforms_request = {
  tags : tags_map option; [@ocaml.doc "Specifies to return only these tagged resources.\n"]
  sort : transform_sort_criteria option;
      [@ocaml.doc "A [TransformSortCriteria] used to sort the machine learning transforms.\n"]
  filter : transform_filter_criteria option;
      [@ocaml.doc "A [TransformFilterCriteria] used to filter the machine learning transforms.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec job_name_list = name_string list [@@ocaml.doc ""]

type nonrec list_jobs_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last metric available.\n"]
  job_names : job_name_list option;
      [@ocaml.doc "The names of all jobs in the account, or the jobs with the specified tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_jobs_request = {
  tags : tags_map option; [@ocaml.doc "Specifies to return only these tagged resources.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec item_id = string [@@ocaml.doc ""]

type nonrec item_name = string [@@ocaml.doc ""]

type nonrec item_description = string [@@ocaml.doc ""]

type nonrec glossary_term_id_list = glossary_term_id list [@@ocaml.doc ""]

type nonrec iterable_form_list_item = {
  glossary_terms : glossary_term_id_list option;
      [@ocaml.doc "The identifiers of the glossary terms associated with the item.\n"]
  description : item_description option; [@ocaml.doc "The description of the item.\n"]
  item_name : item_name option; [@ocaml.doc "The name of the item.\n"]
  item_id : item_id option; [@ocaml.doc "The unique identifier of the item.\n"]
}
[@@ocaml.doc "A summary of an item in an iterable form.\n"]

type nonrec iterable_form_list_item_list = iterable_form_list_item list [@@ocaml.doc ""]

type nonrec list_iterable_forms_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  items : iterable_form_list_item_list option; [@ocaml.doc "The list of iterable form items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_iterable_forms_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  iterable_form_name : iterable_form_name;
      [@ocaml.doc "The name of the iterable form to list items from.\n"]
  asset_identifier : asset_id; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_resource_property = {
  target_processing_properties : target_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration target.\n"]
  source_processing_properties : source_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration source.\n"]
  resource_property_arn : string512 option;
      [@ocaml.doc
        "The resource ARN created through this create API. The format is something like \
         arn:aws:glue:::integrationresourceproperty/*\n"]
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc "A structure representing an integration resource property.\n"]

type nonrec integration_resource_property_list = integration_resource_property list [@@ocaml.doc ""]

type nonrec list_integration_resource_properties_response = {
  marker : string1024 option; [@ocaml.doc "This is the pagination token for the next page.\n"]
  integration_resource_property_list : integration_resource_property_list option;
      [@ocaml.doc "A list of integration resource property meeting the filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_resource_property_filter_values = string128 list [@@ocaml.doc ""]

type nonrec integration_resource_property_filter = {
  values : integration_resource_property_filter_values option;
      [@ocaml.doc "A list of filter values.\n"]
  name : string128 option;
      [@ocaml.doc
        "The name of the filter. Supported filter keys are [SourceArn] and [TargetArn].\n"]
}
[@@ocaml.doc "A filter for integration resource properties.\n"]

type nonrec integration_resource_property_filter_list = integration_resource_property_filter list
[@@ocaml.doc ""]

type nonrec integration_integer = int [@@ocaml.doc ""]

type nonrec list_integration_resource_properties_request = {
  max_records : integration_integer option;
      [@ocaml.doc "This is total number of items to be evaluated.\n"]
  filters : integration_resource_property_filter_list option;
      [@ocaml.doc "A list of filters, supported filter Key is [SourceArn] and [TargetArn].\n"]
  marker : string1024 option;
      [@ocaml.doc "This is the pagination token for next page, initial value is [null].\n"]
}
[@@ocaml.doc ""]

type nonrec glossary_term_item = {
  short_description : glossary_short_description option;
      [@ocaml.doc "The short description of the glossary term.\n"]
  name : glossary_term_name option; [@ocaml.doc "The name of the glossary term.\n"]
  id : glossary_term_id option; [@ocaml.doc "The unique identifier of the glossary term.\n"]
}
[@@ocaml.doc "A summary of a glossary term.\n"]

type nonrec glossary_term_item_list = glossary_term_item list [@@ocaml.doc ""]

type nonrec list_glossary_terms_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  items : glossary_term_item_list option; [@ocaml.doc "The list of glossary term items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_glossary_terms_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  glossary_identifier : glossary_id;
      [@ocaml.doc "The unique identifier of the glossary whose terms to list.\n"]
}
[@@ocaml.doc ""]

type nonrec glossary_item = {
  description : metadata_description option; [@ocaml.doc "The description of the glossary.\n"]
  name : glossary_name option; [@ocaml.doc "The name of the glossary.\n"]
  id : glossary_id option; [@ocaml.doc "The unique identifier of the glossary.\n"]
}
[@@ocaml.doc "A summary of a business glossary.\n"]

type nonrec glossary_item_list = glossary_item list [@@ocaml.doc ""]

type nonrec list_glossaries_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  items : glossary_item_list option; [@ocaml.doc "The list of glossary items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_glossaries_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec form_type_item = {
  name : form_type_name option; [@ocaml.doc "The name of the form type.\n"]
  id : form_type_id option; [@ocaml.doc "The identifier of the form type.\n"]
}
[@@ocaml.doc "A summary of a form type.\n"]

type nonrec form_type_item_list = form_type_item list [@@ocaml.doc ""]

type nonrec list_form_types_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  items : form_type_item_list; [@ocaml.doc "The list of form type items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_form_types_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_name = string [@@ocaml.doc ""]

type nonrec entity_label = string [@@ocaml.doc ""]

type nonrec is_parent_entity = bool [@@ocaml.doc ""]

type nonrec entity_description = string [@@ocaml.doc ""]

type nonrec category = string [@@ocaml.doc ""]

type nonrec custom_properties =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec entity = {
  custom_properties : custom_properties option;
      [@ocaml.doc "An optional map of keys which may be returned for an entity by a connector.\n"]
  category : category option;
      [@ocaml.doc
        "The type of entities that are present in the response. This value depends on the source \
         connection. For example this is [SObjects] for Salesforce and [databases] or [schemas] or \
         [tables] for sources like Amazon Redshift.\n"]
  description : entity_description option; [@ocaml.doc "A description of the entity.\n"]
  is_parent_entity : is_parent_entity option;
      [@ocaml.doc
        "A Boolean value which helps to determine whether there are sub objects that can be listed.\n"]
  label : entity_label option; [@ocaml.doc "Label used for the entity.\n"]
  entity_name : entity_name option; [@ocaml.doc "The name of the entity.\n"]
}
[@@ocaml.doc "An entity supported by a given [ConnectionType].\n"]

type nonrec entity_list = entity list [@@ocaml.doc ""]

type nonrec list_entities_response = {
  next_token : next_token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  entities : entity_list option; [@ocaml.doc "A list of [Entity] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec api_version = string [@@ocaml.doc ""]

type nonrec list_entities_request = {
  data_store_api_version : api_version option;
      [@ocaml.doc "The API version of the SaaS connector.\n"]
  next_token : next_token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
  parent_entity_name : entity_name option;
      [@ocaml.doc
        "Name of the parent entity for which you want to list the children. This parameter takes a \
         fully-qualified path of the entity in order to list the child entities.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The catalog ID of the catalog that contains the connection. This can be null, By default, \
         the Amazon Web Services Account ID is the catalog ID.\n"]
  connection_name : name_string option;
      [@ocaml.doc
        "A name for the connection that has required credentials to query any connection type.\n"]
}
[@@ocaml.doc ""]

type nonrec dev_endpoint_name_list = name_string list [@@ocaml.doc ""]

type nonrec list_dev_endpoints_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last metric available.\n"]
  dev_endpoint_names : dev_endpoint_name_list option;
      [@ocaml.doc
        "The names of all the [DevEndpoint]s in the account, or the [DevEndpoint]s with the \
         specified tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dev_endpoints_request = {
  tags : tags_map option; [@ocaml.doc "Specifies to return only these tagged resources.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_data_quality_statistics_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token to request the next page of results.\n"]
  statistics : statistic_summary_list option; [@ocaml.doc "A [StatisticSummaryList].\n"]
}
[@@ocaml.doc ""]

type nonrec list_data_quality_statistics_request = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token to request the next page of results.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in this request.\n"]
  timestamp_filter : timestamp_filter option; [@ocaml.doc "A timestamp filter.\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
}
[@@ocaml.doc ""]

type nonrec annotation_list = statistic_annotation list [@@ocaml.doc ""]

type nonrec list_data_quality_statistic_annotations_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token to retrieve the next set of results.\n"]
  annotations : annotation_list option;
      [@ocaml.doc "A list of [StatisticAnnotation] applied to the Statistic\n"]
}
[@@ocaml.doc ""]

type nonrec list_data_quality_statistic_annotations_request = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token to retrieve the next set of results.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in this request.\n"]
  timestamp_filter : timestamp_filter option; [@ocaml.doc "A timestamp filter.\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_target_table = {
  catalog_id : name_string option; [@ocaml.doc "The catalog id where the Glue table exists.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database where the Glue table exists.\n"]
  table_name : name_string; [@ocaml.doc "The name of the Glue table.\n"]
}
[@@ocaml.doc "An object representing an Glue table.\n"]

type nonrec data_quality_ruleset_list_details = {
  rule_count : nullable_integer option; [@ocaml.doc "The number of rules in the ruleset.\n"]
  recommendation_run_id : hash_string option;
      [@ocaml.doc
        "When a ruleset was created from a recommendation run, this run ID is generated to link \
         the two together.\n"]
  target_table : data_quality_target_table option;
      [@ocaml.doc "An object representing an Glue table.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc "The date and time the data quality ruleset was last modified.\n"]
  created_on : timestamp option;
      [@ocaml.doc "The date and time the data quality ruleset was created.\n"]
  description : description_string option;
      [@ocaml.doc "A description of the data quality ruleset.\n"]
  name : name_string option; [@ocaml.doc "The name of the data quality ruleset.\n"]
}
[@@ocaml.doc "Describes a data quality ruleset returned by [GetDataQualityRuleset].\n"]

type nonrec data_quality_ruleset_list = data_quality_ruleset_list_details list [@@ocaml.doc ""]

type nonrec list_data_quality_rulesets_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  rulesets : data_quality_ruleset_list option;
      [@ocaml.doc "A paginated list of rulesets for the specified list of Glue tables.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_ruleset_filter_criteria = {
  target_table : data_quality_target_table option;
      [@ocaml.doc "The name and database name of the target table.\n"]
  last_modified_after : timestamp option;
      [@ocaml.doc "Filter on rulesets last modified after this date.\n"]
  last_modified_before : timestamp option;
      [@ocaml.doc "Filter on rulesets last modified before this date.\n"]
  created_after : timestamp option; [@ocaml.doc "Filter on rulesets created after this date.\n"]
  created_before : timestamp option; [@ocaml.doc "Filter on rulesets created before this date.\n"]
  description : description_string option;
      [@ocaml.doc "The description of the ruleset filter criteria.\n"]
  name : name_string option; [@ocaml.doc "The name of the ruleset filter criteria.\n"]
}
[@@ocaml.doc "The criteria used to filter data quality rulesets.\n"]

type nonrec list_data_quality_rulesets_request = {
  tags : tags_map option; [@ocaml.doc "A list of key-value pair tags.\n"]
  filter : data_quality_ruleset_filter_criteria option; [@ocaml.doc "The filter criteria. \n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : pagination_token option; [@ocaml.doc "A paginated token to offset the results.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_ruleset_evaluation_run_description = {
  data_source : data_source option;
      [@ocaml.doc "The data source (an Glue table) associated with the run.\n"]
  started_on : timestamp option; [@ocaml.doc "The date and time when the run started.\n"]
  status : task_status_type option; [@ocaml.doc "The status for this run.\n"]
  run_id : hash_string option; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc "Describes the result of a data quality ruleset evaluation run.\n"]

type nonrec data_quality_ruleset_evaluation_run_list =
  data_quality_ruleset_evaluation_run_description list
[@@ocaml.doc ""]

type nonrec list_data_quality_ruleset_evaluation_runs_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  runs : data_quality_ruleset_evaluation_run_list option;
      [@ocaml.doc
        "A list of [DataQualityRulesetEvaluationRunDescription] objects representing data quality \
         ruleset runs.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_ruleset_evaluation_run_filter = {
  ruleset_name : name_string option; [@ocaml.doc "Filter results by the name of the ruleset.\n"]
  started_after : timestamp option;
      [@ocaml.doc "Filter results by runs that started after this time.\n"]
  started_before : timestamp option;
      [@ocaml.doc "Filter results by runs that started before this time.\n"]
  data_source : data_source;
      [@ocaml.doc "Filter based on a data source (an Glue table) associated with the run.\n"]
}
[@@ocaml.doc "The filter criteria.\n"]

type nonrec list_data_quality_ruleset_evaluation_runs_request = {
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : pagination_token option; [@ocaml.doc "A paginated token to offset the results.\n"]
  filter : data_quality_ruleset_evaluation_run_filter option; [@ocaml.doc "The filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_rule_recommendation_run_description = {
  data_source : data_source option;
      [@ocaml.doc "The data source (Glue table) associated with the recommendation run.\n"]
  started_on : timestamp option; [@ocaml.doc "The date and time when this run started.\n"]
  status : task_status_type option; [@ocaml.doc "The status for this run.\n"]
  run_id : hash_string option; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc "Describes the result of a data quality rule recommendation run.\n"]

type nonrec data_quality_rule_recommendation_run_list =
  data_quality_rule_recommendation_run_description list
[@@ocaml.doc ""]

type nonrec list_data_quality_rule_recommendation_runs_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  runs : data_quality_rule_recommendation_run_list option;
      [@ocaml.doc "A list of [DataQualityRuleRecommendationRunDescription] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_rule_recommendation_run_filter = {
  started_after : timestamp option;
      [@ocaml.doc "Filter based on time for results started after provided time.\n"]
  started_before : timestamp option;
      [@ocaml.doc "Filter based on time for results started before provided time.\n"]
  data_source : data_source; [@ocaml.doc "Filter based on a specified data source (Glue table).\n"]
}
[@@ocaml.doc "A filter for listing data quality recommendation runs.\n"]

type nonrec list_data_quality_rule_recommendation_runs_request = {
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : pagination_token option; [@ocaml.doc "A paginated token to offset the results.\n"]
  filter : data_quality_rule_recommendation_run_filter option; [@ocaml.doc "The filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_result_description = {
  started_on : timestamp option;
      [@ocaml.doc "The time that the run started for this data quality result.\n"]
  job_run_id : hash_string option;
      [@ocaml.doc "The job run ID associated with the data quality result.\n"]
  job_name : name_string option;
      [@ocaml.doc "The job name associated with the data quality result.\n"]
  data_source : data_source option;
      [@ocaml.doc "The table name associated with the data quality result.\n"]
  result_id : hash_string option; [@ocaml.doc "The unique result ID for this data quality result.\n"]
}
[@@ocaml.doc "Describes a data quality result.\n"]

type nonrec data_quality_result_description_list = data_quality_result_description list
[@@ocaml.doc ""]

type nonrec list_data_quality_results_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  results : data_quality_result_description_list;
      [@ocaml.doc "A list of [DataQualityResultDescription] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_result_filter_criteria = {
  started_before : timestamp option;
      [@ocaml.doc "Filter results by runs that started before this time.\n"]
  started_after : timestamp option;
      [@ocaml.doc "Filter results by runs that started after this time.\n"]
  job_run_id : hash_string option; [@ocaml.doc "Filter results by the specified job run ID.\n"]
  job_name : name_string option; [@ocaml.doc "Filter results by the specified job name.\n"]
  data_source : data_source option;
      [@ocaml.doc
        "Filter results by the specified data source. For example, retrieving all results for an \
         Glue table.\n"]
}
[@@ocaml.doc "Criteria used to return data quality results.\n"]

type nonrec list_data_quality_results_request = {
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : pagination_token option; [@ocaml.doc "A paginated token to offset the results.\n"]
  filter : data_quality_result_filter_criteria option; [@ocaml.doc "The filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec context_words = name_string list [@@ocaml.doc ""]

type nonrec custom_entity_type = {
  context_words : context_words option;
      [@ocaml.doc
        "A list of context words. If none of these context words are found within the vicinity of \
         the regular expression the data will not be detected as sensitive data.\n\n\
        \ If no context words are passed only a regular expression is checked.\n\
        \ "]
  regex_string : name_string;
      [@ocaml.doc
        "A regular expression string that is used for detecting sensitive data in a custom pattern.\n"]
  name : name_string;
      [@ocaml.doc
        "A name for the custom pattern that allows it to be retrieved or deleted later. This name \
         must be unique per Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "An object representing a custom pattern for detecting sensitive data across the columns and \
   rows of your structured data.\n"]

type nonrec custom_entity_types = custom_entity_type list [@@ocaml.doc ""]

type nonrec list_custom_entity_types_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  custom_entity_types : custom_entity_types option;
      [@ocaml.doc "A list of [CustomEntityType] objects representing custom patterns.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_entity_types_request = {
  tags : tags_map option; [@ocaml.doc "A list of key-value pair tags.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : pagination_token option; [@ocaml.doc "A paginated token to offset the results.\n"]
}
[@@ocaml.doc ""]

type nonrec crawl_id = string [@@ocaml.doc ""]

type nonrec crawler_history_state =
  | STOPPED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec crawler_history = {
  dpu_hour : non_negative_double option;
      [@ocaml.doc "The number of data processing units (DPU) used in hours for the crawl.\n"]
  message_prefix : message_prefix option;
      [@ocaml.doc "The prefix for a CloudWatch message about this crawl.\n"]
  log_stream : log_stream option; [@ocaml.doc "The log stream associated with the crawl.\n"]
  log_group : log_group option; [@ocaml.doc "The log group associated with the crawl.\n"]
  error_message : description_string option;
      [@ocaml.doc "If an error occurred, the error message associated with the crawl.\n"]
  summary : name_string option;
      [@ocaml.doc
        "A run summary for the specific crawl in JSON. Contains the catalog tables and partitions \
         that were added, updated, or deleted.\n"]
  end_time : timestamp option; [@ocaml.doc "The date and time on which the crawl ended.\n"]
  start_time : timestamp option; [@ocaml.doc "The date and time on which the crawl started.\n"]
  state : crawler_history_state option; [@ocaml.doc "The state of the crawl.\n"]
  crawl_id : crawl_id option; [@ocaml.doc "A UUID identifier for each crawl.\n"]
}
[@@ocaml.doc "Contains the information for a run of a crawler.\n"]

type nonrec crawler_history_list = crawler_history list [@@ocaml.doc ""]

type nonrec list_crawls_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  crawls : crawler_history_list option;
      [@ocaml.doc
        "A list of [CrawlerHistory] objects representing the crawl runs that meet your criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec field_name =
  | DPU_HOUR [@ocaml.doc ""]
  | END_TIME [@ocaml.doc ""]
  | START_TIME [@ocaml.doc ""]
  | STATE [@ocaml.doc ""]
  | CRAWL_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_operator =
  | NE [@ocaml.doc ""]
  | EQ [@ocaml.doc ""]
  | LE [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec crawls_filter = {
  field_value : generic_string option;
      [@ocaml.doc "The value provided for comparison on the crawl field. \n"]
  filter_operator : filter_operator option;
      [@ocaml.doc
        "A defined comparator that operates on the value. The available operators are:\n\n\
        \ {ul\n\
        \       {-   [GT]: Greater than.\n\
        \           \n\
        \            }\n\
        \       {-   [GE]: Greater than or equal to.\n\
        \           \n\
        \            }\n\
        \       {-   [LT]: Less than.\n\
        \           \n\
        \            }\n\
        \       {-   [LE]: Less than or equal to.\n\
        \           \n\
        \            }\n\
        \       {-   [EQ]: Equal to.\n\
        \           \n\
        \            }\n\
        \       {-   [NE]: Not equal to.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  field_name : field_name option;
      [@ocaml.doc
        "A key used to filter the crawler runs for a specified crawler. Valid values for each of \
         the field names are:\n\n\
        \ {ul\n\
        \       {-   [CRAWL_ID]: A string representing the UUID identifier for a crawl.\n\
        \           \n\
        \            }\n\
        \       {-   [STATE]: A string representing the state of the crawl.\n\
        \           \n\
        \            }\n\
        \       {-   [START_TIME] and [END_TIME]: The epoch timestamp in milliseconds.\n\
        \           \n\
        \            }\n\
        \       {-   [DPU_HOUR]: The number of data processing unit (DPU) hours used for the crawl.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A list of fields, comparators and value that you can use to filter the crawler runs for a \
   specified crawler.\n"]

type nonrec crawls_filter_list = crawls_filter list [@@ocaml.doc ""]

type nonrec list_crawls_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  filters : crawls_filter_list option;
      [@ocaml.doc
        "Filters the crawls by the criteria you specify in a list of [CrawlsFilter] objects.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "The maximum number of results to return. The default is 20, and maximum is 100.\n"]
  crawler_name : name_string;
      [@ocaml.doc "The name of the crawler whose runs you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec crawler_name_list = name_string list [@@ocaml.doc ""]

type nonrec list_crawlers_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last metric available.\n"]
  crawler_names : crawler_name_list option;
      [@ocaml.doc
        "The names of all crawlers in the account, or the crawlers with the specified tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_crawlers_request = {
  tags : tags_map option; [@ocaml.doc "Specifies to return only these tagged resources.\n"]
  next_token : token option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
}
[@@ocaml.doc ""]

type nonrec display_name = string [@@ocaml.doc ""]

type nonrec compute_environments = compute_environment list [@@ocaml.doc ""]

type nonrec capabilities = {
  supported_compute_environments : compute_environments;
      [@ocaml.doc "A list of supported compute environments.\n"]
  supported_data_operations : data_operations; [@ocaml.doc "A list of supported data operations.\n"]
  supported_authentication_types : authentication_types;
      [@ocaml.doc "A list of supported authentication types.\n"]
}
[@@ocaml.doc
  "Specifies the supported authentication types returned by the [DescribeConnectionType] API.\n"]

type nonrec connection_type_variant = {
  logo_url : url_string option;
      [@ocaml.doc "The URL of the logo associated with a connection type variant.\n"]
  description : description option;
      [@ocaml.doc
        "A detailed description of the connection type variant, including its purpose, use cases, \
         and any specific configuration requirements.\n"]
  display_name : display_name option;
      [@ocaml.doc
        "The human-readable name for the connection type variant that is displayed in the Glue \
         console.\n"]
  connection_type_variant_name : display_name option;
      [@ocaml.doc
        "The unique identifier for the connection type variant. This name is used internally to \
         identify the specific variant of a connection type. \n"]
}
[@@ocaml.doc
  "Represents a variant of a connection type in Glue. Connection type variants provide specific \
   configurations and behaviors for different implementations of the same general connection type.\n"]

type nonrec connection_type_variant_list = connection_type_variant list [@@ocaml.doc ""]

type nonrec connection_type_brief = {
  connection_type_variants : connection_type_variant_list option;
      [@ocaml.doc
        "A list of variants available for this connection type. Different variants may provide \
         specialized configurations for specific use cases or implementations of the same general \
         connection type.\n"]
  logo_url : url_string option;
      [@ocaml.doc "The URL of the logo associated with a connection type.\n"]
  capabilities : capabilities option;
      [@ocaml.doc
        "The supported authentication types, data interface types (compute environments), and data \
         operations of the connector.\n"]
  categories : list_of_string option;
      [@ocaml.doc
        "A list of categories that this connection type belongs to. Categories help users filter \
         and find appropriate connection types based on their use cases.\n"]
  description : description option; [@ocaml.doc "A description of the connection type.\n"]
  vendor : vendor option;
      [@ocaml.doc
        "The name of the vendor or provider that created or maintains this connection type.\n"]
  display_name : display_name option;
      [@ocaml.doc
        "The human-readable name for the connection type that is displayed in the Glue console.\n"]
  connection_type : connection_type option; [@ocaml.doc "The name of the connection type.\n"]
}
[@@ocaml.doc
  "Brief information about a supported connection type returned by the [ListConnectionTypes] API.\n"]

type nonrec connection_type_list = connection_type_brief list [@@ocaml.doc ""]

type nonrec list_connection_types_response = {
  next_token : next_token option;
      [@ocaml.doc "A continuation token, if the current list segment is not the last.\n"]
  connection_types : connection_type_list option;
      [@ocaml.doc
        "A list of [ConnectionTypeBrief] objects containing brief information about the supported \
         connection types.\n"]
}
[@@ocaml.doc ""]

type nonrec list_connection_types_request = {
  next_token : next_token option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : max_results option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec column_statistics_task_run_id_list = hash_string list [@@ocaml.doc ""]

type nonrec list_column_statistics_task_runs_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, if not all task run IDs have yet been returned.\n"]
  column_statistics_task_run_ids : column_statistics_task_run_id_list option;
      [@ocaml.doc "A list of column statistics task run IDs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_column_statistics_task_runs_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of the response.\n"]
}
[@@ocaml.doc ""]

type nonrec blueprint_names = orchestration_name_string list [@@ocaml.doc ""]

type nonrec list_blueprints_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if not all blueprint names have been returned.\n"]
  blueprints : blueprint_names option; [@ocaml.doc "List of names of blueprints in the account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_blueprints_request = {
  tags : tags_map option; [@ocaml.doc "Filters the list by an Amazon Web Services resource tag.\n"]
  max_results : orchestration_page_size25 option;
      [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec asset_type_item = {
  name : asset_type_name option; [@ocaml.doc "The name of the asset type.\n"]
  id : asset_type_id option; [@ocaml.doc "The identifier of the asset type.\n"]
}
[@@ocaml.doc "A summary of an asset type.\n"]

type nonrec asset_type_item_list = asset_type_item list [@@ocaml.doc ""]

type nonrec list_asset_types_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  items : asset_type_item_list option; [@ocaml.doc "The list of asset type items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_asset_types_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec limit = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec last_crawl_status =
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec last_crawl_info = {
  start_time : timestamp option; [@ocaml.doc "The time at which the crawl started.\n"]
  message_prefix : message_prefix option;
      [@ocaml.doc "The prefix for a message about this crawl.\n"]
  log_stream : log_stream option; [@ocaml.doc "The log stream for the last crawl.\n"]
  log_group : log_group option; [@ocaml.doc "The log group for the last crawl.\n"]
  error_message : description_string option;
      [@ocaml.doc "If an error occurred, the error information about the last crawl.\n"]
  status : last_crawl_status option; [@ocaml.doc "Status of the last crawl.\n"]
}
[@@ocaml.doc "Status and error information about the most recent crawl.\n"]

type nonrec blueprint_parameter_spec = string [@@ocaml.doc ""]

type nonrec last_active_definition = {
  blueprint_service_location : generic_string option;
      [@ocaml.doc
        "Specifies a path in Amazon S3 where the blueprint is copied when you create or update the \
         blueprint.\n"]
  blueprint_location : generic_string option;
      [@ocaml.doc
        "Specifies a path in Amazon S3 where the blueprint is published by the Glue developer.\n"]
  parameter_spec : blueprint_parameter_spec option;
      [@ocaml.doc "A JSON string specifying the parameters for the blueprint.\n"]
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The date and time the blueprint was last modified.\n"]
  description : generic512_char_string option; [@ocaml.doc "The description of the blueprint.\n"]
}
[@@ocaml.doc
  "When there are multiple versions of a blueprint and the latest version has some errors, this \
   attribute indicates the last successful blueprint definition that is available with the service.\n"]

type nonrec language = SCALA [@ocaml.doc ""] | PYTHON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec labels = (name_string * name_string) list [@@ocaml.doc ""]

type nonrec kms_key_not_accessible_fault = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The KMS key specified is not accessible.\n"]

type nonrec json_classifier = {
  json_path : json_path;
      [@ocaml.doc
        "A [JsonPath] string defining the JSON data for the classifier to classify. Glue supports \
         a subset of JsonPath, as described in \
         {{:https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json}Writing \
         JsonPath Custom Classifiers}.\n"]
  version : version_id option; [@ocaml.doc "The version of this classifier.\n"]
  last_updated : timestamp option; [@ocaml.doc "The time that this classifier was last updated.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that this classifier was registered.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "A classifier for [JSON] content.\n"]

type nonrec job = {
  profile_name : name_string option;
      [@ocaml.doc "The name of an Glue usage profile associated with the job.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "This field specifies a day of the week and hour for a maintenance window for streaming \
         jobs. Glue periodically performs maintenance activities. During these maintenance \
         windows, Glue will need to restart your streaming jobs.\n\n\
        \ Glue will restart the job within 3 hours of the specified maintenance window. For \
         instance, if you set up the maintenance window for Monday at 10:00AM GMT, your jobs will \
         be restarted between 10:00AM GMT to 1:00PM GMT.\n\
        \ "]
  source_control_details : source_control_details option;
      [@ocaml.doc
        "The details for a source control configuration for a job, allowing synchronization of job \
         artifacts to or from a remote repository.\n"]
  execution_class : execution_class option;
      [@ocaml.doc
        "Indicates whether the job is run with a standard or flexible execution class. The \
         standard execution class is ideal for time-sensitive workloads that require fast job \
         startup and dedicated resources.\n\n\
        \ The flexible execution class is appropriate for time-insensitive jobs whose start and \
         completion times may vary. \n\
        \ \n\
        \  Only jobs with Glue version 3.0 and above and command type [glueetl] will be allowed to \
         set [ExecutionClass] to [FLEX]. The flexible execution class is available for Spark jobs.\n\
        \  "]
  code_gen_configuration_nodes : code_gen_configuration_nodes option;
      [@ocaml.doc
        "The representation of a directed acyclic graph on which both the Glue Studio visual \
         component and Glue Studio code generation is based.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "In Spark jobs, [GlueVersion] determines the versions of Apache Spark and Python that Glue \
         available in a job. The Python version indicates the version supported for jobs of type \
         Spark. \n\n\
        \ Ray jobs should set [GlueVersion] to [4.0] or greater. However, the versions of Ray, \
         Python and additional libraries available in your Ray job are determined by the [Runtime] \
         parameter of the Job command.\n\
        \ \n\
        \  For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \  \n\
        \   Jobs that are created without specifying a Glue version default to Glue 5.1.\n\
        \   "]
  notification_property : notification_property option;
      [@ocaml.doc "Specifies configuration properties of a job notification.\n"]
  security_configuration : name_string option;
      [@ocaml.doc "The name of the [SecurityConfiguration] structure to be used with this job.\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when a job runs.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a job runs.\n\n\
        \ Glue provides multiple worker types to accommodate different workload requirements:\n\
        \ \n\
        \  G Worker Types (General-purpose compute workers):\n\
        \  \n\
        \   {ul\n\
        \         {-  G.1X: 1 DPU (4 vCPUs, 16 GB memory, 94GB disk)\n\
        \             \n\
        \              }\n\
        \         {-  G.2X: 2 DPU (8 vCPUs, 32 GB memory, 138GB disk)\n\
        \             \n\
        \              }\n\
        \         {-  G.4X: 4 DPU (16 vCPUs, 64 GB memory, 256GB disk)\n\
        \             \n\
        \              }\n\
        \         {-  G.8X: 8 DPU (32 vCPUs, 128 GB memory, 512GB disk)\n\
        \             \n\
        \              }\n\
        \         {-  G.12X: 12 DPU (48 vCPUs, 192 GB memory, 768GB disk)\n\
        \             \n\
        \              }\n\
        \         {-  G.16X: 16 DPU (64 vCPUs, 256 GB memory, 1024GB disk)\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   R Worker Types (Memory-optimized workers):\n\
        \   \n\
        \    {ul\n\
        \          {-  R.1X: 1 M-DPU (4 vCPUs, 32 GB memory)\n\
        \              \n\
        \               }\n\
        \          {-  R.2X: 2 M-DPU (8 vCPUs, 64 GB memory)\n\
        \              \n\
        \               }\n\
        \          {-  R.4X: 4 M-DPU (16 vCPUs, 128 GB memory)\n\
        \              \n\
        \               }\n\
        \          {-  R.8X: 8 M-DPU (32 vCPUs, 256 GB memory)\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "For Glue version 1.0 or earlier jobs, using the standard worker type, the number of Glue \
         data processing units (DPUs) that can be allocated when this job runs. A DPU is a \
         relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 \
         GB of memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/} Glue \
         pricing page}.\n\n\
        \ For Glue version 2.0 or later jobs, you cannot specify a [Maximum capacity]. Instead, \
         you should specify a [Worker type] and the [Number of workers].\n\
        \ \n\
        \  Do not set [MaxCapacity] if using [WorkerType] and [NumberOfWorkers].\n\
        \  \n\
        \   The value that can be allocated for [MaxCapacity] depends on whether you are running a \
         Python shell job, an Apache Spark ETL job, or an Apache Spark streaming ETL job:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you specify a Python shell job ([JobCommand.Name]=\"pythonshell\"), \
         you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.\n\
        \              \n\
        \               }\n\
        \          {-  When you specify an Apache Spark ETL job ([JobCommand.Name]=\"glueetl\") or \
         Apache Spark streaming ETL job ([JobCommand.Name]=\"gluestreaming\"), you can allocate \
         from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU \
         allocation.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  timeout : timeout option;
      [@ocaml.doc
        "The job timeout in minutes. This is the maximum time that a job run can consume resources \
         before it is terminated and enters [TIMEOUT] status.\n\n\
        \ Jobs must have timeout values less than 7 days or 10080 minutes. Otherwise, the jobs \
         will throw an exception.\n\
        \ \n\
        \  When the value is left blank, the timeout is defaulted to 2,880 minutes for Glue \
         version 4.0 and earlier, or 480 minutes for Glue version 5.0 and later.\n\
        \  \n\
        \   Any existing Glue jobs that had a timeout value greater than 7 days will be defaulted \
         to 7 days. For instance if you have specified a timeout of 20 days for a batch job, it \
         will be stopped on the 7th day.\n\
        \   \n\
        \    For streaming jobs, if you have set up a maintenance window, it will be restarted \
         during the maintenance window after 7 days.\n\
        \    "]
  allocated_capacity : integer_value option;
      [@ocaml.doc
        "This field is deprecated. Use [MaxCapacity] instead.\n\n\
        \ The number of Glue data processing units (DPUs) allocated to runs of this job. You can \
         allocate a minimum of 2 DPUs; the default is 10. A DPU is a relative measure of \
         processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For \
         more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue pricing page}.\n\
        \ \n\
        \  \n\
        \  "]
  max_retries : max_retries option;
      [@ocaml.doc "The maximum number of times to retry this job after a JobRun fails.\n"]
  connections : connections_list option; [@ocaml.doc "The connections used for this job.\n"]
  non_overridable_arguments : generic_map option;
      [@ocaml.doc
        "Arguments for this job that are not overridden when providing job arguments in a job run, \
         specified as name-value pairs.\n"]
  default_arguments : generic_map option;
      [@ocaml.doc
        "The default arguments for every run of this job, specified as name-value pairs.\n\n\
        \ You can specify arguments here that your own job-execution script consumes, as well as \
         arguments that Glue itself consumes.\n\
        \ \n\
        \  Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve \
         secrets from a Glue Connection, Secrets Manager or other secret management mechanism if \
         you intend to keep them within the Job. \n\
        \  \n\
        \   For information about how to specify and consume your own Job arguments, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html}Calling \
         Glue APIs in Python} topic in the developer guide.\n\
        \   \n\
        \    For information about the arguments you can provide to this field when configuring \
         Spark jobs, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Special \
         Parameters Used by Glue} topic in the developer guide.\n\
        \    \n\
        \     For information about the arguments you can provide to this field when configuring \
         Ray jobs, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/author-job-ray-job-parameters.html}Using \
         job parameters in Ray jobs} in the developer guide.\n\
        \     "]
  command : job_command option; [@ocaml.doc "The [JobCommand] that runs this job.\n"]
  execution_property : execution_property option;
      [@ocaml.doc
        "An [ExecutionProperty] specifying the maximum number of concurrent runs allowed for this \
         job.\n"]
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The last point in time when this job definition was modified.\n"]
  created_on : timestamp_value option;
      [@ocaml.doc "The time and date that this job definition was created.\n"]
  role : role_string option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role associated with this job.\n"]
  log_uri : uri_string option; [@ocaml.doc "This field is reserved for future use.\n"]
  description : description_string option; [@ocaml.doc "A description of the job.\n"]
  job_run_queuing_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether job run queuing is enabled for the job runs for this job.\n\n\
        \ A value of true means job run queuing is enabled for the job runs. If false or not \
         populated, the job runs will not be considered for queueing.\n\
        \ \n\
        \  If this field does not match the value set in the job run, then the value from the job \
         run field will be used.\n\
        \  "]
  job_mode : job_mode option;
      [@ocaml.doc
        "A mode that describes how a job was created. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [SCRIPT] - The job was created using the Glue Studio script editor.\n\
        \           \n\
        \            }\n\
        \       {-   [VISUAL] - The job was created using the Glue Studio visual editor.\n\
        \           \n\
        \            }\n\
        \       {-   [NOTEBOOK] - The job was created using an interactive sessions notebook.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When the [JobMode] field is missing or null, [SCRIPT] is assigned as the default value.\n\
        \   "]
  name : name_string option; [@ocaml.doc "The name you assign to this job definition.\n"]
}
[@@ocaml.doc "Specifies a job definition.\n"]

type nonrec job_list = job list [@@ocaml.doc ""]

type nonrec iterable_form_entry = {
  form_type_id : form_type_id option;
      [@ocaml.doc
        "The form type identifier of the iterable form (for example, [columns]), used to retrieve \
         its items via [ListIterableForms] or [BatchGetIterableForms].\n"]
}
[@@ocaml.doc "An iterable form available on an asset, identified by its form type.\n"]

type nonrec iterable_form_key = string [@@ocaml.doc ""]

type nonrec iterable_form_map = (iterable_form_key * iterable_form_entry) list [@@ocaml.doc ""]

type nonrec iterable_form_item = {
  attachments : asset_form_map option;
      [@ocaml.doc
        "Additional attachments on the item for more context, keyed by attachment name.\n"]
  forms : asset_form_map option; [@ocaml.doc "The forms on the item, keyed by form name.\n"]
  glossary_terms : glossary_term_id_list option;
      [@ocaml.doc "The identifiers of the glossary terms associated with the item.\n"]
  item_name : item_name option; [@ocaml.doc "The name of the item.\n"]
  item_id : item_id option; [@ocaml.doc "The unique identifier of the item.\n"]
}
[@@ocaml.doc "A full iterable form item with its forms.\n"]

type nonrec iterable_form_item_list = iterable_form_item list [@@ocaml.doc ""]

type nonrec item_identifier_list = item_identifier list [@@ocaml.doc ""]

type nonrec item_error_message = string [@@ocaml.doc ""]

type nonrec item_error_code = string [@@ocaml.doc ""]

type nonrec item_error = {
  message : item_error_message option; [@ocaml.doc "The error message.\n"]
  code : item_error_code option; [@ocaml.doc "The error code.\n"]
  item_identifier : item_identifier option;
      [@ocaml.doc "The identifier of the item that caused the error.\n"]
}
[@@ocaml.doc "An error that occurred when retrieving an iterable form item.\n"]

type nonrec item_error_list = item_error list [@@ocaml.doc ""]

type nonrec is_version_valid = bool [@@ocaml.doc ""]

type nonrec integration = {
  data_filter : string2048 option;
      [@ocaml.doc "Selects source tables for the integration using Maxwell filter syntax.\n"]
  errors : integration_error_list option;
      [@ocaml.doc "A list of errors associated with the integration.\n"]
  integration_config : integration_config option;
      [@ocaml.doc "Properties associated with the integration.\n"]
  create_time : integration_timestamp;
      [@ocaml.doc "The time that the integration was created, in UTC.\n"]
  status : integration_status;
      [@ocaml.doc
        "The possible statuses are:\n\n\
        \ {ul\n\
        \       {-  CREATING: The integration is being created.\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE: The integration creation succeeds.\n\
        \           \n\
        \            }\n\
        \       {-  MODIFYING: The integration is being modified.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED: The integration creation fails. \n\
        \           \n\
        \            }\n\
        \       {-  DELETING: The integration is deleted.\n\
        \           \n\
        \            }\n\
        \       {-  SYNCING: The integration is synchronizing.\n\
        \           \n\
        \            }\n\
        \       {-  NEEDS_ATTENTION: The integration needs attention, such as synchronization.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : integration_tags_list option;
      [@ocaml.doc "Metadata assigned to the resource consisting of a list of key-value pairs.\n"]
  additional_encryption_context : integration_additional_encryption_context_map option;
      [@ocaml.doc
        "An optional set of non-secret key\226\128\147value pairs that contains additional \
         contextual information for encryption. This can only be provided if [KMSKeyId] is \
         provided.\n"]
  kms_key_id : string2048 option;
      [@ocaml.doc "The ARN of a KMS key used for encrypting the channel.\n"]
  integration_arn : string128; [@ocaml.doc "The Amazon Resource Name (ARN) for the integration.\n"]
  integration_name : string128; [@ocaml.doc "A unique name for the integration.\n"]
  description : integration_description option; [@ocaml.doc "A description for the integration.\n"]
  target_arn : string512; [@ocaml.doc "The ARN for the target of the integration.\n"]
  source_arn : string512; [@ocaml.doc "The ARN for the source of the integration.\n"]
}
[@@ocaml.doc "Describes a zero-ETL integration.\n"]

type nonrec integrations_list = integration list [@@ocaml.doc ""]

type nonrec integration_quota_exceeded_fault = {
  message : integration_error_message option; [@ocaml.doc "A message describing the problem.\n"]
}
[@@ocaml.doc "The data processed through your integration exceeded your quota.\n"]

type nonrec integration_filter_values = string128 list [@@ocaml.doc ""]

type nonrec integration_filter = {
  values : integration_filter_values option; [@ocaml.doc "A list of filter values.\n"]
  name : string128 option; [@ocaml.doc "The name of the filter.\n"]
}
[@@ocaml.doc "A filter that can be used when invoking a [DescribeIntegrations] request.\n"]

type nonrec integration_filter_list = integration_filter list [@@ocaml.doc ""]

type nonrec datapoint_inclusion_annotation = {
  inclusion_annotation : inclusion_annotation_value option;
      [@ocaml.doc "The inclusion annotation value to apply to the statistic.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
  profile_id : hash_string option;
      [@ocaml.doc "The ID of the data quality profile the statistic belongs to.\n"]
}
[@@ocaml.doc "An Inclusion Annotation.\n"]

type nonrec inclusion_annotation_list = datapoint_inclusion_annotation list [@@ocaml.doc ""]

type nonrec inbound_integration = {
  errors : integration_error_list option;
      [@ocaml.doc "A list of errors associated with the integration.\n"]
  integration_config : integration_config option;
      [@ocaml.doc "Properties associated with the integration.\n"]
  create_time : integration_timestamp;
      [@ocaml.doc "The time that the integration was created, in UTC.\n"]
  status : integration_status;
      [@ocaml.doc
        "The possible statuses are:\n\n\
        \ {ul\n\
        \       {-  CREATING: The integration is being created.\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE: The integration creation succeeds.\n\
        \           \n\
        \            }\n\
        \       {-  MODIFYING: The integration is being modified.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED: The integration creation fails. \n\
        \           \n\
        \            }\n\
        \       {-  DELETING: The integration is deleted.\n\
        \           \n\
        \            }\n\
        \       {-  SYNCING: The integration is synchronizing.\n\
        \           \n\
        \            }\n\
        \       {-  NEEDS_ATTENTION: The integration needs attention, such as synchronization.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  integration_arn : string128; [@ocaml.doc "The ARN of the zero-ETL integration.\n"]
  target_arn : string512; [@ocaml.doc "The ARN of the target resource for the integration.\n"]
  source_arn : string512; [@ocaml.doc "The ARN of the source resource for the integration.\n"]
}
[@@ocaml.doc "A structure for an integration that writes data into a resource.\n"]

type nonrec inbound_integrations_list = inbound_integration list [@@ocaml.doc ""]

type nonrec import_catalog_to_glue_response = unit [@@ocaml.doc ""]

type nonrec import_catalog_to_glue_request = {
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the catalog to import. Currently, this should be the Amazon Web Services \
         account ID.\n"]
}
[@@ocaml.doc ""]

type nonrec identity_center_instance_arn = string [@@ocaml.doc ""]

type nonrec iceberg_optimization_properties_output = {
  last_updated_time : timestamp option;
      [@ocaml.doc "The timestamp when the Iceberg optimization properties were last updated.\n"]
  orphan_file_deletion : parameters_map option;
      [@ocaml.doc
        "A map of key-value pairs that specify configuration parameters for Iceberg orphan file \
         deletion operations, which identify and remove files that are no longer referenced by the \
         table metadata.\n"]
  retention : parameters_map option;
      [@ocaml.doc
        "A map of key-value pairs that specify configuration parameters for Iceberg table \
         retention operations, which manage the lifecycle of table snapshots to control storage \
         costs.\n"]
  compaction : parameters_map option;
      [@ocaml.doc
        "A map of key-value pairs that specify configuration parameters for Iceberg table \
         compaction operations, which optimize the layout of data files to improve query \
         performance.\n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that is used to perform Iceberg table \
         optimization operations.\n"]
}
[@@ocaml.doc
  "A structure that contains the output properties of Iceberg table optimization configuration for \
   your catalog resource in the Glue Data Catalog.\n"]

type nonrec grok_classifier = {
  custom_patterns : custom_patterns option;
      [@ocaml.doc
        "Optional custom grok patterns defined by this classifier. For more information, see \
         custom patterns in \
         {{:https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html}Writing Custom \
         Classifiers}.\n"]
  grok_pattern : grok_pattern;
      [@ocaml.doc
        "The grok pattern applied to a data store by this classifier. For more information, see \
         built-in patterns in \
         {{:https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html}Writing Custom \
         Classifiers}.\n"]
  version : version_id option; [@ocaml.doc "The version of this classifier.\n"]
  last_updated : timestamp option; [@ocaml.doc "The time that this classifier was last updated.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that this classifier was registered.\n"]
  classification : classification;
      [@ocaml.doc
        "An identifier of the data format that the classifier matches, such as Twitter, JSON, \
         Omniture logs, and so on.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "A classifier that uses [grok] patterns.\n"]

type nonrec glue_resource_type = SESSION [@ocaml.doc ""] | JOB [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec glue_policy = {
  update_time : timestamp option;
      [@ocaml.doc "The date and time at which the policy was last updated.\n"]
  create_time : timestamp option;
      [@ocaml.doc "The date and time at which the policy was created.\n"]
  policy_hash : hash_string option;
      [@ocaml.doc "Contains the hash value associated with this policy.\n"]
  policy_in_json : policy_json_string option;
      [@ocaml.doc "Contains the requested policy document, in JSON format.\n"]
}
[@@ocaml.doc "A structure for returning a resource policy.\n"]

type nonrec get_workflow_runs_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if not all requested workflow runs have been returned.\n"]
  runs : workflow_runs option; [@ocaml.doc "A list of workflow run metadata objects.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_runs_request = {
  max_results : page_size option;
      [@ocaml.doc "The maximum number of workflow runs to be included in the response.\n"]
  next_token : generic_string option; [@ocaml.doc "The maximum size of the response.\n"]
  include_graph : nullable_boolean option;
      [@ocaml.doc "Specifies whether to include the workflow graph in response or not.\n"]
  name : name_string;
      [@ocaml.doc "Name of the workflow whose metadata of runs should be returned.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_run_response = {
  run : workflow_run option; [@ocaml.doc "The requested workflow run metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_run_request = {
  include_graph : nullable_boolean option;
      [@ocaml.doc "Specifies whether to include the workflow graph in response or not.\n"]
  run_id : id_string; [@ocaml.doc "The ID of the workflow run.\n"]
  name : name_string; [@ocaml.doc "Name of the workflow being run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_run_properties_response = {
  run_properties : workflow_run_properties option;
      [@ocaml.doc "The workflow run properties which were set during the specified run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_run_properties_request = {
  run_id : id_string;
      [@ocaml.doc "The ID of the workflow run whose run properties should be returned.\n"]
  name : name_string; [@ocaml.doc "Name of the workflow which was run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_response = {
  workflow : workflow option; [@ocaml.doc "The resource metadata for the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workflow_request = {
  include_graph : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether to include a graph when returning the workflow resource metadata.\n"]
  name : name_string; [@ocaml.doc "The name of the workflow to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_user_defined_functions_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the list of functions returned does not include the last \
         requested function.\n"]
  user_defined_functions : user_defined_function_list option;
      [@ocaml.doc "A list of requested function definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_getter_page_size = int [@@ocaml.doc ""]

type nonrec get_user_defined_functions_request = {
  max_results : catalog_getter_page_size option;
      [@ocaml.doc "The maximum number of functions to return in one response.\n"]
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  function_type : function_type option;
      [@ocaml.doc
        "An optional function-type pattern string that filters the function definitions returned \
         from Amazon Redshift Federated Permissions Catalog.\n\n\
        \ Specify a value of [REGULAR_FUNCTION] or [STORED_PROCEDURE]. The [STORED_PROCEDURE] \
         function type is only compatible with Amazon Redshift Federated Permissions Catalog. \n\
        \ "]
  pattern : name_string;
      [@ocaml.doc
        "An optional function-name pattern string that filters the function definitions returned.\n"]
  database_name : name_string option;
      [@ocaml.doc
        "The name of the catalog database where the functions are located. If none is provided, \
         functions from all the databases across the catalog will be returned.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the functions to be retrieved are located. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_user_defined_function_response = {
  user_defined_function : user_defined_function option;
      [@ocaml.doc "The requested function definition.\n"]
}
[@@ocaml.doc ""]

type nonrec get_user_defined_function_request = {
  function_name : name_string; [@ocaml.doc "The name of the function.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the function is located.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the function to be retrieved is located. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_usage_profile_response = {
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The date and time when the usage profile was last modified.\n"]
  created_on : timestamp_value option;
      [@ocaml.doc "The date and time when the usage profile was created.\n"]
  configuration : profile_configuration option;
      [@ocaml.doc
        "A [ProfileConfiguration] object specifying the job and session values for the profile.\n"]
  description : description_string option; [@ocaml.doc "A description of the usage profile.\n"]
  name : name_string option; [@ocaml.doc "The name of the usage profile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_usage_profile_request = {
  name : name_string; [@ocaml.doc "The name of the usage profile to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec column_row_filter = {
  row_filter_expression : predicate_string option;
      [@ocaml.doc "A string containing the row-level filter expression.\n"]
  column_name : name_string option; [@ocaml.doc "A string containing the name of the column.\n"]
}
[@@ocaml.doc "A filter that uses both column-level and row-level filtering.\n"]

type nonrec column_row_filter_list = column_row_filter list [@@ocaml.doc ""]

type nonrec get_unfiltered_table_metadata_response = {
  row_filter : predicate_string option;
      [@ocaml.doc
        "The filter that applies to the table. For example when applying the filter in SQL, it \
         would go in the [WHERE] clause and can be evaluated by using an [AND] operator with any \
         other predicates applied by the user querying the table.\n"]
  permissions : permission_list option;
      [@ocaml.doc
        "The Lake Formation data permissions of the caller on the table. Used to authorize the \
         call when no view context is found.\n"]
  is_protected : boolean_ option;
      [@ocaml.doc
        "A flag that instructs the engine not to push user-provided operations into the logical \
         plan of the view during query planning. However, if set this flag does not guarantee that \
         the engine will comply. Refer to the engine's documentation to understand the guarantees \
         provided, if any.\n"]
  resource_arn : arn_string option;
      [@ocaml.doc "The resource ARN of the parent resource extracted from the request.\n"]
  is_materialized_view : boolean_ option;
      [@ocaml.doc "Indicates if a table is a materialized view.\n"]
  is_multi_dialect_view : boolean_ option;
      [@ocaml.doc
        "Specifies whether the view supports the SQL dialects of one or more different query \
         engines and can therefore be read by those engines.\n"]
  query_authorization_id : hash_string option;
      [@ocaml.doc
        "A cryptographically generated query identifier generated by Glue or Lake Formation.\n"]
  cell_filters : column_row_filter_list option; [@ocaml.doc "A list of column row filters.\n"]
  is_registered_with_lake_formation : boolean_ option;
      [@ocaml.doc
        "A Boolean value that indicates whether the partition location is registered with Lake \
         Formation.\n"]
  authorized_columns : name_string_list option;
      [@ocaml.doc "A list of column names that the user has been granted access to.\n"]
  table : table option; [@ocaml.doc "A Table object containing the table metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec audit_context_string = string [@@ocaml.doc ""]

type nonrec audit_column_names_list = column_name_string list [@@ocaml.doc ""]

type nonrec audit_context = {
  all_columns_requested : nullable_boolean option; [@ocaml.doc "All columns request for audit.\n"]
  requested_columns : audit_column_names_list option;
      [@ocaml.doc "The requested columns for audit.\n"]
  additional_audit_context : audit_context_string option;
      [@ocaml.doc "A string containing the additional audit context information.\n"]
}
[@@ocaml.doc "A structure containing the Lake Formation audit context.\n"]

type nonrec get_unfiltered_table_metadata_request = {
  query_session_context : query_session_context option;
      [@ocaml.doc
        "A structure used as a protocol between query engines and Lake Formation or Glue. Contains \
         both a Lake Formation generated authorization identifier and information from the \
         request's authorization context.\n"]
  permissions : permission_list option;
      [@ocaml.doc
        "The Lake Formation data permissions of the caller on the table. Used to authorize the \
         call when no view context is found.\n"]
  supported_dialect : supported_dialect option;
      [@ocaml.doc
        "A structure specifying the dialect and dialect version used by the query engine.\n"]
  root_resource_arn : arn_string option;
      [@ocaml.doc "The resource ARN of the root view in a chain of nested views.\n"]
  parent_resource_arn : arn_string option; [@ocaml.doc "The resource ARN of the view.\n"]
  supported_permission_types : permission_type_list;
      [@ocaml.doc
        "Indicates the level of filtering a third-party analytical engine is capable of enforcing \
         when calling the [GetUnfilteredTableMetadata] API operation. Accepted values are:\n\n\
        \ {ul\n\
        \       {-   [COLUMN_PERMISSION] - Column permissions ensure that users can access only \
         specific columns in the table. If there are particular columns contain sensitive data, \
         data lake administrators can define column filters that exclude access to specific \
         columns.\n\
        \           \n\
        \            }\n\
        \       {-   [CELL_FILTER_PERMISSION] - Cell-level filtering combines column filtering \
         (include or exclude columns) and row filter expressions to restrict access to individual \
         elements in the table.\n\
        \           \n\
        \            }\n\
        \       {-   [NESTED_PERMISSION] - Nested permissions combines cell-level filtering and \
         nested column filtering to restrict access to columns and/or nested columns in specific \
         rows based on row filter expressions.\n\
        \           \n\
        \            }\n\
        \       {-   [NESTED_CELL_PERMISSION] - Nested cell permissions combines nested permission \
         with nested cell-level filtering. This allows different subsets of nested columns to be \
         restricted based on an array of row filter expressions. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Note: Each of these permission types follows a hierarchical order where each \
         subsequent permission type includes all permission of the previous type.\n\
        \   \n\
        \    Important: If you provide a supported permission type that doesn't match the user's \
         level of permissions on the table, then Lake Formation raises an exception. For example, \
         if the third-party engine calling the [GetUnfilteredTableMetadata] operation can enforce \
         only column-level filtering, and the user has nested cell filtering applied on the table, \
         Lake Formation throws an exception, and will not return unfiltered table metadata and \
         data access credentials.\n\
        \    "]
  audit_context : audit_context option;
      [@ocaml.doc "A structure containing Lake Formation audit context information.\n"]
  name : name_string;
      [@ocaml.doc
        "(Required) Specifies the name of a table for which you are requesting metadata.\n"]
  database_name : name_string;
      [@ocaml.doc "(Required) Specifies the name of a database that contains the table.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The catalog ID where the table resides.\n"]
  region : value_string option;
      [@ocaml.doc
        "Specified only if the base tables belong to a different Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec get_unfiltered_partitions_metadata_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the returned list of partitions does not include the last one.\n"]
  unfiltered_partitions : unfiltered_partition_list option;
      [@ocaml.doc "A list of requested partitions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_unfiltered_partitions_metadata_request = {
  query_session_context : query_session_context option;
      [@ocaml.doc
        "A structure used as a protocol between query engines and Lake Formation or Glue. Contains \
         both a Lake Formation generated authorization identifier and information from the \
         request's authorization context.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of partitions to return in a single response.\n"]
  segment : segment option;
      [@ocaml.doc "The segment of the table's partitions to scan in this request.\n"]
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if this is not the first call to retrieve these partitions.\n"]
  supported_permission_types : permission_type_list;
      [@ocaml.doc "A list of supported permission types. \n"]
  audit_context : audit_context option;
      [@ocaml.doc "A structure containing Lake Formation audit context information.\n"]
  expression : predicate_string option;
      [@ocaml.doc
        "An expression that filters the partitions to be returned.\n\n\
        \ The expression uses SQL syntax similar to the SQL [WHERE] filter clause. The SQL \
         statement parser {{:http://jsqlparser.sourceforge.net/home.php}JSQLParser} parses the \
         expression. \n\
        \ \n\
        \   {i Operators}: The following are the operators that you can use in the [Expression] \
         API call:\n\
        \  \n\
        \    =  Checks whether the values of the two operands are equal; if yes, then the \
         condition becomes true.\n\
        \       \n\
        \        Example: Assume 'variable a' holds 10 and 'variable b' holds 20. \n\
        \        \n\
        \         (a = b) is not true.\n\
        \         \n\
        \           < >  Checks whether the values of two operands are equal; if the values are \
         not equal, then the condition becomes true.\n\
        \                \n\
        \                 Example: (a < > b) is true.\n\
        \                 \n\
        \                   >  Checks whether the value of the left operand is greater than the \
         value of the right operand; if yes, then the condition becomes true.\n\
        \                      \n\
        \                       Example: (a > b) is not true.\n\
        \                       \n\
        \                         <  Checks whether the value of the left operand is less than the \
         value of the right operand; if yes, then the condition becomes true.\n\
        \                            \n\
        \                             Example: (a < b) is true.\n\
        \                             \n\
        \                               >=  Checks whether the value of the left operand is \
         greater than or equal to the value of the right operand; if yes, then the condition \
         becomes true.\n\
        \                                   \n\
        \                                    Example: (a >= b) is not true.\n\
        \                                    \n\
        \                                      <=  Checks whether the value of the left operand is \
         less than or equal to the value of the right operand; if yes, then the condition becomes \
         true.\n\
        \                                          \n\
        \                                           Example: (a <= b) is true.\n\
        \                                           \n\
        \                                             AND, OR, IN, BETWEEN, LIKE, NOT, IS NULL  \n\
         Logical operators.\n\n\
        \    {i Supported Partition Key Types}: The following are the supported partition keys.\n\
        \   \n\
        \    {ul\n\
        \          {-   [string] \n\
        \              \n\
        \               }\n\
        \          {-   [date] \n\
        \              \n\
        \               }\n\
        \          {-   [timestamp] \n\
        \              \n\
        \               }\n\
        \          {-   [int] \n\
        \              \n\
        \               }\n\
        \          {-   [bigint] \n\
        \              \n\
        \               }\n\
        \          {-   [long] \n\
        \              \n\
        \               }\n\
        \          {-   [tinyint] \n\
        \              \n\
        \               }\n\
        \          {-   [smallint] \n\
        \              \n\
        \               }\n\
        \          {-   [decimal] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If an type is encountered that is not valid, an exception is thrown. \n\
        \   "]
  table_name : name_string; [@ocaml.doc "The name of the table that contains the partition.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is provided, \
         the AWS account ID is used by default. \n"]
  region : value_string option;
      [@ocaml.doc
        "Specified only if the base tables belong to a different Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec get_unfiltered_partition_metadata_response = {
  is_registered_with_lake_formation : boolean_ option;
      [@ocaml.doc
        "A Boolean value that indicates whether the partition location is registered with Lake \
         Formation.\n"]
  authorized_columns : name_string_list option;
      [@ocaml.doc "A list of column names that the user has been granted access to.\n"]
  partition : partition option;
      [@ocaml.doc "A Partition object containing the partition metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec get_unfiltered_partition_metadata_request = {
  query_session_context : query_session_context option;
      [@ocaml.doc
        "A structure used as a protocol between query engines and Lake Formation or Glue. Contains \
         both a Lake Formation generated authorization identifier and information from the \
         request's authorization context.\n"]
  supported_permission_types : permission_type_list;
      [@ocaml.doc "(Required) A list of supported permission types. \n"]
  audit_context : audit_context option;
      [@ocaml.doc "A structure containing Lake Formation audit context information.\n"]
  partition_values : value_string_list; [@ocaml.doc "(Required) A list of partition key values.\n"]
  table_name : name_string;
      [@ocaml.doc "(Required) Specifies the name of a table that contains the partition.\n"]
  database_name : name_string;
      [@ocaml.doc "(Required) Specifies the name of a database that contains the partition.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The catalog ID where the partition resides.\n"]
  region : value_string option;
      [@ocaml.doc
        "Specified only if the base tables belong to a different Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec get_triggers_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "A continuation token, if not all the requested triggers have yet been returned.\n"]
  triggers : trigger_list option; [@ocaml.doc "A list of triggers for the specified job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_triggers_request = {
  max_results : orchestration_page_size200 option;
      [@ocaml.doc "The maximum size of the response.\n"]
  dependent_job_name : name_string option;
      [@ocaml.doc
        "The name of the job to retrieve triggers for. The trigger that can start this job is \
         returned, and if there is no such trigger, all triggers are returned.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
}
[@@ocaml.doc ""]

type nonrec get_trigger_response = {
  trigger : trigger option; [@ocaml.doc "The requested trigger definition.\n"]
}
[@@ocaml.doc ""]

type nonrec get_trigger_request = {
  name : name_string; [@ocaml.doc "The name of the trigger to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_tags_response = { tags : tags_map option [@ocaml.doc "The requested tags.\n"] }
[@@ocaml.doc ""]

type nonrec get_tags_request = {
  resource_arn : glue_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource for which to retrieve tags.\n"]
}
[@@ocaml.doc ""]

type nonrec get_tables_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current list segment is not the last.\n"]
  table_list : table_list option; [@ocaml.doc "A list of the requested [Table] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_string = string [@@ocaml.doc ""]

type nonrec get_tables_request = {
  attributes_to_get : table_attributes_list option;
      [@ocaml.doc
        " Specifies the table fields returned by the [GetTables] call. This parameter \
         doesn\226\128\153t accept an empty list. The request must include [NAME].\n\n\
        \ The following are the valid combinations of values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [NAME] - Names of all tables in the database.\n\
        \            \n\
        \             }\n\
        \        {-   [NAME], [TABLE_TYPE] - Names of all tables and the table types.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  include_status_details : boolean_nullable option;
      [@ocaml.doc
        "Specifies whether to include status details related to a request to create or update an \
         Glue Data Catalog view.\n"]
  audit_context : audit_context option;
      [@ocaml.doc
        "A structure containing the Lake Formation \
         {{:https://docs.aws.amazon.com/glue/latest/webapi/API_AuditContext.html}audit context}.\n"]
  query_as_of_time : timestamp option;
      [@ocaml.doc
        "The time as of when to read the table contents. If not set, the most recent transaction \
         commit time will be used. Cannot be specified along with [TransactionId].\n"]
  transaction_id : transaction_id_string option;
      [@ocaml.doc "The transaction ID at which to read the table contents.\n"]
  max_results : catalog_getter_page_size option;
      [@ocaml.doc "The maximum number of tables to return in a single response.\n"]
  next_token : token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
  expression : filter_string option;
      [@ocaml.doc
        "A regular expression pattern. If present, only those tables whose names match the pattern \
         are returned.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The database in the catalog whose tables to list. For Hive compatibility, this name is \
         entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the tables reside. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_versions_list = table_version list [@@ocaml.doc ""]

type nonrec get_table_versions_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the list of available versions does not include the last one.\n"]
  table_versions : get_table_versions_list option;
      [@ocaml.doc "A list of strings identifying available versions of the specified table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_versions_request = {
  audit_context : audit_context option; [@ocaml.doc ""]
  max_results : catalog_getter_page_size option;
      [@ocaml.doc "The maximum number of table versions to return in one response.\n"]
  next_token : token option; [@ocaml.doc "A continuation token, if this is not the first call.\n"]
  table_name : name_string;
      [@ocaml.doc
        "The name of the table. For Hive compatibility, this name is entirely lowercase.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The database in the catalog in which the table resides. For Hive compatibility, this name \
         is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the tables reside. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_version_response = {
  table_version : table_version option; [@ocaml.doc "The requested table version.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_version_request = {
  audit_context : audit_context option; [@ocaml.doc ""]
  version_id : version_string option;
      [@ocaml.doc
        "The ID value of the table version to be retrieved. A [VersionID] is a string \
         representation of an integer. Each version is incremented by 1. \n"]
  table_name : name_string;
      [@ocaml.doc
        "The name of the table. For Hive compatibility, this name is entirely lowercase.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The database in the catalog in which the table resides. For Hive compatibility, this name \
         is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the tables reside. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_response = {
  table : table option; [@ocaml.doc "The [Table] object that defines the specified table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_request = {
  attributes_to_get : table_attributes_list option;
      [@ocaml.doc
        "Specifies the table fields returned by the [GetTable] call. This parameter doesn't accept \
         an empty list.\n\n\
        \ The following are the valid combinations of values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DEFAULT] - Returns the Hive-style table definition only.\n\
        \            \n\
        \             }\n\
        \        {-   [LATEST_ICEBERG_METADATA] - Returns only the latest Apache Iceberg table \
         metadata.\n\
        \            \n\
        \             }\n\
        \        {-   [DEFAULT], [LATEST_ICEBERG_METADATA] - Returns both the Hive-style table \
         definition and the latest Apache Iceberg table metadata.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  include_status_details : boolean_nullable option;
      [@ocaml.doc
        "Specifies whether to include status details related to a request to create or update an \
         Glue Data Catalog view.\n"]
  audit_context : audit_context option;
      [@ocaml.doc
        "A structure containing the Lake Formation \
         {{:https://docs.aws.amazon.com/glue/latest/webapi/API_AuditContext.html}audit context}.\n"]
  query_as_of_time : timestamp option;
      [@ocaml.doc
        "The time as of when to read the table contents. If not set, the most recent transaction \
         commit time will be used. Cannot be specified along with [TransactionId].\n"]
  transaction_id : transaction_id_string option;
      [@ocaml.doc "The transaction ID at which to read the table contents. \n"]
  name : name_string;
      [@ocaml.doc
        "The name of the table for which to retrieve the definition. For Hive compatibility, this \
         name is entirely lowercase.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The name of the database in the catalog in which the table resides. For Hive \
         compatibility, this name is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_optimizer_response = {
  table_optimizer : table_optimizer option;
      [@ocaml.doc "The optimizer associated with the specified table.\n"]
  table_name : name_string option; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string option;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_optimizer_request = {
  type_ : table_optimizer_type; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_statement_response = {
  statement : statement option; [@ocaml.doc "Returns the statement.\n"]
}
[@@ocaml.doc ""]

type nonrec get_statement_request = {
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request.\n"]
  id : integer_value; [@ocaml.doc "The Id of the statement.\n"]
  session_id : name_string; [@ocaml.doc "The Session ID of the statement.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_response = {
  session : session option; [@ocaml.doc "The session object is returned in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_request = {
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request. \n"]
  id : name_string; [@ocaml.doc "The ID of the session. \n"]
}
[@@ocaml.doc ""]

type nonrec get_session_endpoint_response = {
  spark_connect : session_endpoint;
      [@ocaml.doc "The Spark Connect endpoint details for the session.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_endpoint_request = {
  session_id : name_string; [@ocaml.doc "The unique identifier of the interactive session.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_configurations_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if there are more security configurations to return.\n"]
  security_configurations : security_configuration_list option;
      [@ocaml.doc "A list of security configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_configurations_request = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_configuration_response = {
  security_configuration : security_configuration option;
      [@ocaml.doc "The requested security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_configuration_request = {
  name : name_string; [@ocaml.doc "The name of the security configuration to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_schema_versions_diff_response = {
  diff : schema_definition_diff option;
      [@ocaml.doc "The difference between schemas as a string in JsonPatch format.\n"]
}
[@@ocaml.doc ""]

type nonrec get_schema_versions_diff_input = {
  schema_diff_type : schema_diff_type;
      [@ocaml.doc "Refers to [SYNTAX_DIFF], which is the currently supported diff type.\n"]
  second_schema_version_number : schema_version_number;
      [@ocaml.doc "The second of the two schema versions to be compared.\n"]
  first_schema_version_number : schema_version_number;
      [@ocaml.doc "The first of the two schema versions to be compared.\n"]
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. One of \
         [SchemaArn] or [SchemaName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. One of [SchemaArn] or \
         [SchemaName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec data_format = PROTOBUF [@ocaml.doc ""] | JSON [@ocaml.doc ""] | AVRO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_schema_version_response = {
  created_time : created_timestamp option;
      [@ocaml.doc "The date and time the schema version was created.\n"]
  status : schema_version_status option; [@ocaml.doc "The status of the schema version. \n"]
  version_number : version_long_number option; [@ocaml.doc "The version number of the schema.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
  data_format : data_format option;
      [@ocaml.doc
        "The data format of the schema definition. Currently [AVRO], [JSON] and [PROTOBUF] are \
         supported.\n"]
  schema_definition : schema_definition_string option;
      [@ocaml.doc "The schema definition for the schema ID.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The [SchemaVersionId] of the schema version.\n"]
}
[@@ocaml.doc ""]

type nonrec get_schema_version_input = {
  schema_version_number : schema_version_number option;
      [@ocaml.doc "The version number of the schema.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc
        "The [SchemaVersionId] of the schema version. This field is required for fetching by \
         schema ID. Either this or the [SchemaId] wrapper has to be provided.\n"]
  schema_id : schema_id option;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either \
         [SchemaArn] or [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. Either [SchemaArn] or \
         [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_schema_response = {
  updated_time : updated_timestamp option;
      [@ocaml.doc "The date and time the schema was updated.\n"]
  created_time : created_timestamp option;
      [@ocaml.doc "The date and time the schema was created.\n"]
  schema_status : schema_status option; [@ocaml.doc "The status of the schema.\n"]
  next_schema_version : version_long_number option;
      [@ocaml.doc
        "The next version of the schema associated with the returned schema definition.\n"]
  latest_schema_version : version_long_number option;
      [@ocaml.doc
        "The latest version of the schema associated with the returned schema definition.\n"]
  schema_checkpoint : schema_checkpoint_number option;
      [@ocaml.doc
        "The version number of the checkpoint (the last time the compatibility mode was changed).\n"]
  compatibility : compatibility option; [@ocaml.doc "The compatibility mode of the schema.\n"]
  data_format : data_format option;
      [@ocaml.doc
        "The data format of the schema definition. Currently [AVRO], [JSON] and [PROTOBUF] are \
         supported.\n"]
  description : description_string option;
      [@ocaml.doc "A description of schema if specified when created\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
  schema_name : schema_registry_name_string option; [@ocaml.doc "The name of the schema.\n"]
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the registry.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name of the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec get_schema_input = {
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either \
         [SchemaArn] or [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. Either [SchemaArn] or \
         [SchemaName] and [RegistryName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_schema_by_definition_response = {
  created_time : created_timestamp option;
      [@ocaml.doc "The date and time the schema was created.\n"]
  status : schema_version_status option; [@ocaml.doc "The status of the schema version.\n"]
  data_format : data_format option;
      [@ocaml.doc
        "The data format of the schema definition. Currently [AVRO], [JSON] and [PROTOBUF] are \
         supported.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The schema ID of the schema version.\n"]
}
[@@ocaml.doc ""]

type nonrec get_schema_by_definition_input = {
  schema_definition : schema_definition_string;
      [@ocaml.doc "The definition of the schema for which schema details are required.\n"]
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure to contain schema identity fields. The structure contains:\n\n\
        \ {ul\n\
        \       {-  SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. One of \
         [SchemaArn] or [SchemaName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       {-  SchemaId$SchemaName: The name of the schema. One of [SchemaArn] or \
         [SchemaName] has to be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_response = {
  update_time : timestamp option;
      [@ocaml.doc "The date and time at which the policy was last updated.\n"]
  create_time : timestamp option;
      [@ocaml.doc "The date and time at which the policy was created.\n"]
  policy_hash : hash_string option;
      [@ocaml.doc "Contains the hash value associated with this policy.\n"]
  policy_in_json : policy_json_string option;
      [@ocaml.doc "Contains the requested policy document, in JSON format.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  resource_arn : glue_resource_arn option;
      [@ocaml.doc
        "The ARN of the Glue resource for which to retrieve the resource policy. If not supplied, \
         the Data Catalog resource policy is returned. Use [GetResourcePolicies] to view all \
         existing resource policies. For more information see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/glue-specifying-resource-arns.html}Specifying \
         Glue Resource ARNs}. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policies_response_list = glue_policy list [@@ocaml.doc ""]

type nonrec get_resource_policies_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last resource policy \
         available.\n"]
  get_resource_policies_response_list : get_resource_policies_response_list option;
      [@ocaml.doc
        "A list of the individual resource policies and the account-level resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policies_request = {
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : token option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_registry_response = {
  updated_time : updated_timestamp option;
      [@ocaml.doc "The date and time the registry was updated.\n"]
  created_time : created_timestamp option;
      [@ocaml.doc "The date and time the registry was created.\n"]
  status : registry_status option; [@ocaml.doc "The status of the registry.\n"]
  description : description_string option; [@ocaml.doc "A description of the registry.\n"]
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the registry.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name of the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec get_registry_input = {
  registry_id : registry_id;
      [@ocaml.doc
        "This is a wrapper structure that may contain the registry name and Amazon Resource Name \
         (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_response = {
  scala_code : scala_code option; [@ocaml.doc "The Scala code to perform the mapping.\n"]
  python_script : python_script option; [@ocaml.doc "A Python script to perform the mapping.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_entry = {
  table_name : name_string; [@ocaml.doc "The name of the table in question.\n"]
  database_name : name_string; [@ocaml.doc "The database in which the table metadata resides.\n"]
}
[@@ocaml.doc "Specifies a table definition in the Glue Data Catalog.\n"]

type nonrec catalog_entries = catalog_entry list [@@ocaml.doc ""]

type nonrec additional_plan_options_map = (generic_string * generic_string) list [@@ocaml.doc ""]

type nonrec get_plan_request = {
  additional_plan_options_map : additional_plan_options_map option;
      [@ocaml.doc
        "A map to hold additional optional key-value parameters.\n\n\
        \ Currently, these key-value pairs are supported:\n\
        \ \n\
        \  {ul\n\
        \        {-   [inferSchema]\194\160 \226\128\148 \194\160Specifies whether to set \
         [inferSchema] to true or false for the default script generated by an Glue job. For \
         example, to set [inferSchema] to true, pass the following key value pair:\n\
        \            \n\
        \              [--additional-plan-options-map '{\"inferSchema\":\"true\"}'] \n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  language : language option;
      [@ocaml.doc "The programming language of the code to perform the mapping.\n"]
  location : location option; [@ocaml.doc "The parameters for the mapping.\n"]
  sinks : catalog_entries option; [@ocaml.doc "The target tables.\n"]
  source : catalog_entry; [@ocaml.doc "The source table.\n"]
  mapping : mapping_list; [@ocaml.doc "The list of mappings from a source table to target tables.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partitions_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the returned list of partitions does not include the last one.\n"]
  partitions : partition_list option; [@ocaml.doc "A list of requested partitions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partitions_request = {
  audit_context : audit_context option; [@ocaml.doc ""]
  query_as_of_time : timestamp option;
      [@ocaml.doc
        "The time as of when to read the partition contents. If not set, the most recent \
         transaction commit time will be used. Cannot be specified along with [TransactionId].\n"]
  transaction_id : transaction_id_string option;
      [@ocaml.doc "The transaction ID at which to read the partition contents.\n"]
  exclude_column_schema : boolean_nullable option;
      [@ocaml.doc
        "When true, specifies not returning the partition column schema. Useful when you are \
         interested only in other partition attributes such as partition values or location. This \
         approach avoids the problem of a large response by not returning duplicate data.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of partitions to return in a single response.\n"]
  segment : segment option;
      [@ocaml.doc "The segment of the table's partitions to scan in this request.\n"]
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if this is not the first call to retrieve these partitions.\n"]
  expression : predicate_string option;
      [@ocaml.doc
        "An expression that filters the partitions to be returned.\n\n\
        \ The expression uses SQL syntax similar to the SQL [WHERE] filter clause. The SQL \
         statement parser {{:http://jsqlparser.sourceforge.net/home.php}JSQLParser} parses the \
         expression. \n\
        \ \n\
        \   {i Operators}: The following are the operators that you can use in the [Expression] \
         API call:\n\
        \  \n\
        \    =  Checks whether the values of the two operands are equal; if yes, then the \
         condition becomes true.\n\
        \       \n\
        \        Example: Assume 'variable a' holds 10 and 'variable b' holds 20. \n\
        \        \n\
        \         (a = b) is not true.\n\
        \         \n\
        \           < >  Checks whether the values of two operands are equal; if the values are \
         not equal, then the condition becomes true.\n\
        \                \n\
        \                 Example: (a < > b) is true.\n\
        \                 \n\
        \                   >  Checks whether the value of the left operand is greater than the \
         value of the right operand; if yes, then the condition becomes true.\n\
        \                      \n\
        \                       Example: (a > b) is not true.\n\
        \                       \n\
        \                         <  Checks whether the value of the left operand is less than the \
         value of the right operand; if yes, then the condition becomes true.\n\
        \                            \n\
        \                             Example: (a < b) is true.\n\
        \                             \n\
        \                               >=  Checks whether the value of the left operand is \
         greater than or equal to the value of the right operand; if yes, then the condition \
         becomes true.\n\
        \                                   \n\
        \                                    Example: (a >= b) is not true.\n\
        \                                    \n\
        \                                      <=  Checks whether the value of the left operand is \
         less than or equal to the value of the right operand; if yes, then the condition becomes \
         true.\n\
        \                                          \n\
        \                                           Example: (a <= b) is true.\n\
        \                                           \n\
        \                                             AND, OR, IN, BETWEEN, LIKE, NOT, IS NULL  \n\
         Logical operators.\n\n\
        \    {i Supported Partition Key Types}: The following are the supported partition keys.\n\
        \   \n\
        \    {ul\n\
        \          {-   [string] \n\
        \              \n\
        \               }\n\
        \          {-   [date] \n\
        \              \n\
        \               }\n\
        \          {-   [timestamp] \n\
        \              \n\
        \               }\n\
        \          {-   [int] \n\
        \              \n\
        \               }\n\
        \          {-   [bigint] \n\
        \              \n\
        \               }\n\
        \          {-   [long] \n\
        \              \n\
        \               }\n\
        \          {-   [tinyint] \n\
        \              \n\
        \               }\n\
        \          {-   [smallint] \n\
        \              \n\
        \               }\n\
        \          {-   [decimal] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If an type is encountered that is not valid, an exception is thrown. \n\
        \   \n\
        \    The following list shows the valid operators on each type. When you define a crawler, \
         the [partitionKey] type is created as a [STRING], to be compatible with the catalog \
         partitions. \n\
        \    \n\
        \      {i Sample API Call}: \n\
        \     "]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is provided, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partition_response = {
  partition : partition option;
      [@ocaml.doc "The requested information, in the form of a [Partition] object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partition_request = {
  audit_context : audit_context option; [@ocaml.doc ""]
  partition_values : value_string_list; [@ocaml.doc "The values that define the partition.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partition's table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partition resides.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partition in question resides. If none is provided, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partition_indexes_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, present if the current list segment is not the last.\n"]
  partition_index_descriptor_list : partition_index_descriptor_list option;
      [@ocaml.doc "A list of index descriptors.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partition_indexes_request = {
  next_token : token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
  table_name : name_string;
      [@ocaml.doc
        "Specifies the name of a table for which you want to retrieve the partition indexes.\n"]
  database_name : name_string;
      [@ocaml.doc
        "Specifies the name of a database from which you want to retrieve partition indexes.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The catalog ID where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec get_materialized_view_refresh_task_run_response = {
  materialized_view_refresh_task_run : materialized_view_refresh_task_run option;
      [@ocaml.doc
        "A MaterializedViewRefreshTaskRun object representing the details of the task run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_materialized_view_refresh_task_run_request = {
  materialized_view_refresh_task_run_id : uui_dv4;
      [@ocaml.doc "The identifier for the particular materialized view refresh task run.\n"]
  catalog_id : name_string;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is supplied, the account ID \
         is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mapping_response = {
  mapping : mapping_list; [@ocaml.doc "A list of mappings to the specified targets.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mapping_request = {
  location : location option; [@ocaml.doc "Parameters for the mapping.\n"]
  sinks : catalog_entries option; [@ocaml.doc "A list of target tables.\n"]
  source : catalog_entry; [@ocaml.doc "Specifies the source table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_transforms_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  transforms : transform_list; [@ocaml.doc "A list of machine learning transforms.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_transforms_request = {
  sort : transform_sort_criteria option; [@ocaml.doc "The sorting criteria.\n"]
  filter : transform_filter_criteria option; [@ocaml.doc "The filter transformation criteria.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : pagination_token option; [@ocaml.doc "A paginated token to offset the results.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_transform_response = {
  transform_encryption : transform_encryption option;
      [@ocaml.doc
        "The encryption-at-rest settings of the transform that apply to accessing user data. \
         Machine learning transforms can access user data encrypted in Amazon S3 using KMS.\n"]
  max_retries : nullable_integer option;
      [@ocaml.doc
        "The maximum number of times to retry a task for this transform after a task run fails.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout for a task run for this transform in minutes. This is the maximum time that a \
         task run for this transform can consume resources before it is terminated and enters \
         [TIMEOUT] status. The default is 2,880 minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when this task runs.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when this task runs. Accepts a value of \
         Standard, G.1X, or G.2X.\n\n\
        \ {ul\n\
        \       {-  For the [Standard] worker type, each worker provides 4 vCPU, 16 GB of memory \
         and a 50GB disk, and 2 executors per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.1X] worker type, each worker provides 4 vCPU, 16 GB of memory and a \
         64GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker provides 8 vCPU, 32 GB of memory and a \
         128GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "The number of Glue data processing units (DPUs) that are allocated to task runs for this \
         transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative \
         measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of \
         memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue \
         pricing page}. \n\n\
        \ When the [WorkerType] field is set to a value other than [Standard], the [MaxCapacity] \
         field is set automatically and becomes read-only.\n\
        \ "]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "This value determines which version of Glue this machine learning transform is compatible \
         with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue \
         compatibility defaults to Glue 0.9. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions}Glue \
         Versions} in the developer guide.\n"]
  role : role_string option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role with the required permissions.\n"]
  schema : transform_schema option;
      [@ocaml.doc
        "The \n\
         {[\n\
         Map\n\
         ]}\n\
        \ object that represents the schema that this transform accepts. Has an upper bound of 100 \
         columns.\n"]
  label_count : label_count option;
      [@ocaml.doc "The number of labels available for this transform.\n"]
  evaluation_metrics : evaluation_metrics option; [@ocaml.doc "The latest evaluation metrics.\n"]
  parameters : transform_parameters option;
      [@ocaml.doc "The configuration parameters that are specific to the algorithm used.\n"]
  input_record_tables : glue_tables option;
      [@ocaml.doc "A list of Glue table definitions used by the transform.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc "The date and time when the transform was last modified.\n"]
  created_on : timestamp option; [@ocaml.doc "The date and time when the transform was created.\n"]
  status : transform_status_type option;
      [@ocaml.doc
        "The last known status of the transform (to indicate whether it can be used or not). One \
         of \"NOT_READY\", \"READY\", or \"DELETING\".\n"]
  description : description_string option; [@ocaml.doc "A description of the transform.\n"]
  name : name_string option;
      [@ocaml.doc "The unique name given to the transform when it was created.\n"]
  transform_id : hash_string option;
      [@ocaml.doc
        "The unique identifier of the transform, generated at the time that the transform was \
         created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_transform_request = {
  transform_id : hash_string;
      [@ocaml.doc
        "The unique identifier of the transform, generated at the time that the transform was \
         created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_task_runs_response = {
  next_token : pagination_token option;
      [@ocaml.doc "A pagination token, if more results are available.\n"]
  task_runs : task_run_list option;
      [@ocaml.doc "A list of task runs that are associated with the transform.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_task_runs_request = {
  sort : task_run_sort_criteria option;
      [@ocaml.doc
        "The sorting criteria, in the [TaskRunSortCriteria] structure, for the task run.\n"]
  filter : task_run_filter_criteria option;
      [@ocaml.doc
        "The filter criteria, in the [TaskRunFilterCriteria] structure, for the task run.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return. \n"]
  next_token : pagination_token option;
      [@ocaml.doc "A token for pagination of the results. The default is empty.\n"]
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_task_run_response = {
  execution_time : execution_time option;
      [@ocaml.doc "The amount of time (in seconds) that the task run consumed resources.\n"]
  completed_on : timestamp option;
      [@ocaml.doc "The date and time when this task run was completed.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc "The date and time when this task run was last modified.\n"]
  started_on : timestamp option; [@ocaml.doc "The date and time when this task run started.\n"]
  error_string : generic_string option;
      [@ocaml.doc "The error strings that are associated with the task run.\n"]
  properties : task_run_properties option;
      [@ocaml.doc "The list of properties that are associated with the task run.\n"]
  log_group_name : generic_string option;
      [@ocaml.doc "The names of the log groups that are associated with the task run.\n"]
  status : task_status_type option; [@ocaml.doc "The status for this task run.\n"]
  task_run_id : hash_string option;
      [@ocaml.doc "The unique run identifier associated with this run.\n"]
  transform_id : hash_string option; [@ocaml.doc "The unique identifier of the task run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ml_task_run_request = {
  task_run_id : hash_string; [@ocaml.doc "The unique identifier of the task run.\n"]
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec get_jobs_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if not all job definitions have yet been returned.\n"]
  jobs : job_list option; [@ocaml.doc "A list of job definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_jobs_request = {
  max_results : page_size option; [@ocaml.doc "The maximum size of the response.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_runs_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if not all requested job runs have been returned.\n"]
  job_runs : job_run_list option; [@ocaml.doc "A list of job-run metadata objects.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_runs_request = {
  max_results : orchestration_page_size200 option;
      [@ocaml.doc "The maximum size of the response.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  job_name : name_string;
      [@ocaml.doc "The name of the job definition for which to retrieve all job runs.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_run_response = {
  job_run : job_run option; [@ocaml.doc "The requested job-run metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_run_request = {
  predecessors_included : boolean_value option;
      [@ocaml.doc "True if a list of predecessor runs should be returned.\n"]
  run_id : id_string; [@ocaml.doc "The ID of the job run.\n"]
  job_name : name_string; [@ocaml.doc "Name of the job definition being run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_response = { job : job option [@ocaml.doc "The requested job definition.\n"] }
[@@ocaml.doc ""]

type nonrec get_job_request = {
  job_name : name_string; [@ocaml.doc "The name of the job definition to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_bookmark_response = {
  job_bookmark_entry : job_bookmark_entry option;
      [@ocaml.doc "A structure that defines a point that a job can resume processing.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_bookmark_request = {
  run_id : run_id option; [@ocaml.doc "The unique run identifier associated with this job run.\n"]
  job_name : job_name; [@ocaml.doc "The name of the job in question.\n"]
}
[@@ocaml.doc ""]

type nonrec get_integration_table_properties_response = {
  target_table_config : target_table_config option;
      [@ocaml.doc "A structure for the target table configuration.\n"]
  source_table_config : source_table_config option;
      [@ocaml.doc "A structure for the source table configuration.\n"]
  table_name : string128 option; [@ocaml.doc "The name of the table to be replicated.\n"]
  resource_arn : string512 option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target table for which to retrieve integration \
         table properties. Currently, this API only supports retrieving properties for target \
         tables, and the provided ARN should be the ARN of the target table in the Glue Data \
         Catalog. Support for retrieving integration table properties for source connections \
         (using the connection ARN) is not yet implemented and will be added in a future release. \n"]
}
[@@ocaml.doc ""]

type nonrec get_integration_table_properties_request = {
  table_name : string128; [@ocaml.doc "The name of the table to be replicated.\n"]
  resource_arn : string512;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target table for which to retrieve integration \
         table properties. Currently, this API only supports retrieving properties for target \
         tables, and the provided ARN should be the ARN of the target table in the Glue Data \
         Catalog. Support for retrieving integration table properties for source connections \
         (using the connection ARN) is not yet implemented and will be added in a future release. \n"]
}
[@@ocaml.doc ""]

type nonrec get_integration_resource_property_response = {
  target_processing_properties : target_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration target.\n"]
  source_processing_properties : source_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration source.\n"]
  resource_property_arn : string512 option;
      [@ocaml.doc
        "The resource ARN created through this create API. The format is something like \
         arn:aws:glue:::integrationresourceproperty/*\n"]
  resource_arn : string512 option;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec get_integration_resource_property_request = {
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec application_arn = string [@@ocaml.doc ""]

type nonrec get_glue_identity_center_configuration_response = {
  user_background_sessions_enabled : nullable_boolean option;
      [@ocaml.doc
        "Indicates whether users can run background sessions when using Identity Center \
         authentication with Glue services.\n"]
  scopes : orchestration_string_list option;
      [@ocaml.doc
        "A list of Identity Center scopes that define the permissions and access levels for the \
         Glue configuration.\n"]
  instance_arn : identity_center_instance_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity Center instance associated with the Glue \
         configuration.\n"]
  application_arn : application_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity Center application associated with the \
         Glue configuration.\n"]
}
[@@ocaml.doc "Response containing the Glue Identity Center configuration details.\n"]

type nonrec get_glue_identity_center_configuration_request = unit [@@ocaml.doc ""]

type nonrec get_glossary_term_response = {
  long_description : glossary_long_description option;
      [@ocaml.doc "The long description of the glossary term.\n"]
  short_description : glossary_short_description option;
      [@ocaml.doc "The short description of the glossary term.\n"]
  name : glossary_term_name option; [@ocaml.doc "The name of the glossary term.\n"]
  glossary_id : glossary_id option;
      [@ocaml.doc "The unique identifier of the glossary containing this term.\n"]
  id : glossary_term_id option; [@ocaml.doc "The unique identifier of the glossary term.\n"]
}
[@@ocaml.doc ""]

type nonrec get_glossary_term_request = {
  identifier : glossary_term_id;
      [@ocaml.doc "The unique identifier of the glossary term to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_glossary_response = {
  description : metadata_description option; [@ocaml.doc "The description of the glossary.\n"]
  name : glossary_name option; [@ocaml.doc "The name of the glossary.\n"]
  id : glossary_id option; [@ocaml.doc "The unique identifier of the glossary.\n"]
}
[@@ocaml.doc ""]

type nonrec get_glossary_request = {
  identifier : glossary_id; [@ocaml.doc "The unique identifier of the glossary to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_form_type_response = {
  schema : form_type_schema option; [@ocaml.doc "The Smithy IDL schema of the form type.\n"]
  name : form_type_name option; [@ocaml.doc "The name of the form type.\n"]
  id : form_type_id option; [@ocaml.doc "The identifier of the form type.\n"]
}
[@@ocaml.doc ""]

type nonrec get_form_type_request = {
  identifier : form_type_id; [@ocaml.doc "The identifier of the form type to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_entity_records_response = {
  next_token : next_token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  records : records option; [@ocaml.doc "A list of the requested objects.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_options = (option_key * option_value) list [@@ocaml.doc ""]

type nonrec filter_predicate = string [@@ocaml.doc ""]

type nonrec get_entity_records_request = {
  selected_fields : selected_fields option;
      [@ocaml.doc " List of fields that we want to fetch as part of preview data.\n"]
  order_by : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A parameter that orders the response preview data.\n"]
  limit : limit; [@ocaml.doc "Limits the number of records fetched with the request.\n"]
  filter_predicate : filter_predicate option;
      [@ocaml.doc "A filter predicate that you can apply in the query request.\n"]
  connection_options : connection_options option;
      [@ocaml.doc "Connector options that are required to query the data.\n"]
  data_store_api_version : api_version option;
      [@ocaml.doc "The API version of the SaaS connector.\n"]
  next_token : next_token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
  entity_name : entity_name;
      [@ocaml.doc
        "Name of the entity that we want to query the preview data from the given connection type.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The catalog ID of the catalog that contains the connection. This can be null, By default, \
         the Amazon Web Services Account ID is the catalog ID.\n"]
  connection_name : name_string option;
      [@ocaml.doc "The name of the connection that contains the connection type credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec dev_endpoint = {
  arguments : map_value option;
      [@ocaml.doc
        "A map of arguments used to configure the [DevEndpoint].\n\n\
        \ Valid arguments are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [\"--enable-glue-datacatalog\": \"\"] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can specify a version of Python support for development endpoints by using the \
         [Arguments] parameter in the [CreateDevEndpoint] or [UpdateDevEndpoint] APIs. If no \
         arguments are provided, the version defaults to Python 2.\n\
        \   "]
  security_configuration : name_string option;
      [@ocaml.doc
        "The name of the [SecurityConfiguration] structure to be used with this [DevEndpoint].\n"]
  public_keys : public_keys_list option;
      [@ocaml.doc
        "A list of public keys to be used by the [DevEndpoints] for authentication. Using this \
         attribute is preferred over a single public key because the public keys allow you to have \
         a different private key per client.\n\n\
        \  If you previously created an endpoint with a public key, you must remove that key to be \
         able to set a list of public keys. Call the [UpdateDevEndpoint] API operation with the \
         public key content in the [deletePublicKeys] attribute, and the list of new keys in the \
         [addPublicKeys] attribute.\n\
        \  \n\
        \   "]
  public_key : generic_string option;
      [@ocaml.doc
        "The public key to be used by this [DevEndpoint] for authentication. This attribute is \
         provided for backward compatibility because the recommended attribute to use is public \
         keys.\n"]
  last_modified_timestamp : timestamp_value option;
      [@ocaml.doc "The point in time at which this [DevEndpoint] was last modified.\n"]
  created_timestamp : timestamp_value option;
      [@ocaml.doc "The point in time at which this DevEndpoint was created.\n"]
  last_update_status : generic_string option; [@ocaml.doc "The status of the last update.\n"]
  failure_reason : generic_string option;
      [@ocaml.doc "The reason for a current failure in this [DevEndpoint].\n"]
  extra_jars_s3_path : generic_string option;
      [@ocaml.doc
        "The path to one or more Java [.jar] files in an S3 bucket that should be loaded in your \
         [DevEndpoint].\n\n\
        \  You can only use pure Java/Scala libraries with a [DevEndpoint].\n\
        \  \n\
        \   "]
  extra_python_libs_s3_path : generic_string option;
      [@ocaml.doc
        "The paths to one or more Python libraries in an Amazon S3 bucket that should be loaded in \
         your [DevEndpoint]. Multiple values must be complete paths separated by a comma.\n\n\
        \  You can only use pure Python libraries with a [DevEndpoint]. Libraries that rely on C \
         extensions, such as the {{:http://pandas.pydata.org/}pandas} Python data analysis \
         library, are not currently supported.\n\
        \  \n\
        \   "]
  vpc_id : generic_string option;
      [@ocaml.doc "The ID of the virtual private cloud (VPC) used by this [DevEndpoint].\n"]
  availability_zone : generic_string option;
      [@ocaml.doc
        "The Amazon Web Services Availability Zone where this [DevEndpoint] is located.\n"]
  number_of_nodes : integer_value option;
      [@ocaml.doc
        "The number of Glue Data Processing Units (DPUs) allocated to this [DevEndpoint].\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated to the development \
         endpoint.\n\n\
        \ The maximum number of workers you can define are 299 for [G.1X], and 149 for [G.2X]. \n\
        \ "]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "Glue version determines the versions of Apache Spark and Python that Glue supports. The \
         Python version indicates the version supported for running your ETL scripts on \
         development endpoints. \n\n\
        \ For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \ \n\
        \  Development endpoints that are created without specifying a Glue version default to \
         Glue 0.9.\n\
        \  \n\
        \   You can specify a version of Python support for development endpoints by using the \
         [Arguments] parameter in the [CreateDevEndpoint] or [UpdateDevEndpoint] APIs. If no \
         arguments are provided, the version defaults to Python 2.\n\
        \   "]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated to the development endpoint. Accepts a \
         value of Standard, G.1X, or G.2X.\n\n\
        \ {ul\n\
        \       {-  For the [Standard] worker type, each worker provides 4 vCPU, 16 GB of memory \
         and a 50GB disk, and 2 executors per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.1X] worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of \
         memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type \
         for memory-intensive jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of \
         memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type \
         for memory-intensive jobs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Known issue: when a development endpoint is created with the [G.2X] [WorkerType] \
         configuration, the Spark drivers for the development endpoint will run on 4 vCPU, 16 GB \
         of memory, and a 64 GB disk. \n\
        \   "]
  status : generic_string option; [@ocaml.doc "The current status of this [DevEndpoint].\n"]
  public_address : generic_string option;
      [@ocaml.doc
        "The public IP address used by this [DevEndpoint]. The [PublicAddress] field is present \
         only when you create a non-virtual private cloud (VPC) [DevEndpoint].\n"]
  zeppelin_remote_spark_interpreter_port : integer_value option;
      [@ocaml.doc "The Apache Zeppelin port for the remote Apache Spark interpreter.\n"]
  private_address : generic_string option;
      [@ocaml.doc
        "A private IP address to access the [DevEndpoint] within a VPC if the [DevEndpoint] is \
         created within one. The [PrivateAddress] field is present only when you create the \
         [DevEndpoint] within your VPC.\n"]
  yarn_endpoint_address : generic_string option;
      [@ocaml.doc "The YARN endpoint address used by this [DevEndpoint].\n"]
  subnet_id : generic_string option; [@ocaml.doc "The subnet ID for this [DevEndpoint].\n"]
  security_group_ids : string_list option;
      [@ocaml.doc "A list of security group identifiers used in this [DevEndpoint].\n"]
  role_arn : role_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role used in this [DevEndpoint].\n"]
  endpoint_name : generic_string option; [@ocaml.doc "The name of the [DevEndpoint].\n"]
}
[@@ocaml.doc
  "A development endpoint where a developer can remotely debug extract, transform, and load (ETL) \
   scripts.\n"]

type nonrec dev_endpoint_list = dev_endpoint list [@@ocaml.doc ""]

type nonrec get_dev_endpoints_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "A continuation token, if not all [DevEndpoint] definitions have yet been returned.\n"]
  dev_endpoints : dev_endpoint_list option; [@ocaml.doc "A list of [DevEndpoint] definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dev_endpoints_request = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of information to return.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dev_endpoint_response = {
  dev_endpoint : dev_endpoint option; [@ocaml.doc "A [DevEndpoint] definition.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dev_endpoint_request = {
  endpoint_name : generic_string;
      [@ocaml.doc "Name of the [DevEndpoint] to retrieve information for.\n"]
}
[@@ocaml.doc ""]

type nonrec code_gen_identifier = string [@@ocaml.doc ""]

type nonrec code_gen_node_type = string [@@ocaml.doc ""]

type nonrec code_gen_node = {
  line_number : integer option; [@ocaml.doc "The line number of the node.\n"]
  args : code_gen_node_args;
      [@ocaml.doc "Properties of the node, in the form of name-value pairs.\n"]
  node_type : code_gen_node_type; [@ocaml.doc "The type of node that this is.\n"]
  id : code_gen_identifier;
      [@ocaml.doc "A node identifier that is unique within the node's graph.\n"]
}
[@@ocaml.doc "Represents a node in a directed acyclic graph (DAG)\n"]

type nonrec dag_nodes = code_gen_node list [@@ocaml.doc ""]

type nonrec code_gen_edge = {
  target_parameter : code_gen_arg_name option; [@ocaml.doc "The target of the edge.\n"]
  target : code_gen_identifier; [@ocaml.doc "The ID of the node at which the edge ends.\n"]
  source : code_gen_identifier; [@ocaml.doc "The ID of the node at which the edge starts.\n"]
}
[@@ocaml.doc "Represents a directional edge in a directed acyclic graph (DAG).\n"]

type nonrec dag_edges = code_gen_edge list [@@ocaml.doc ""]

type nonrec get_dataflow_graph_response = {
  dag_edges : dag_edges option; [@ocaml.doc "A list of the edges in the resulting DAG.\n"]
  dag_nodes : dag_nodes option; [@ocaml.doc "A list of the nodes in the resulting DAG.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dataflow_graph_request = {
  python_script : python_script option; [@ocaml.doc "The Python script to transform.\n"]
}
[@@ocaml.doc ""]

type nonrec database = {
  federated_database : federated_database option;
      [@ocaml.doc
        "A [FederatedDatabase] structure that references an entity outside the Glue Data Catalog.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the database resides.\n"]
  target_database : database_identifier option;
      [@ocaml.doc
        "A [DatabaseIdentifier] structure that describes a target database for resource linking.\n"]
  create_table_default_permissions : principal_permissions_list option;
      [@ocaml.doc
        "Creates a set of default permissions on the table for principals. Used by Lake Formation. \
         Not used in the normal course of Glue operations.\n"]
  create_time : timestamp option;
      [@ocaml.doc "The time at which the metadata database was created in the catalog.\n"]
  parameters : parameters_map option;
      [@ocaml.doc "These key-value pairs define parameters and properties of the database.\n"]
  location_uri : ur_i option;
      [@ocaml.doc "The location of the database (for example, an HDFS path).\n"]
  description : description_string option; [@ocaml.doc "A description of the database.\n"]
  name : name_string;
      [@ocaml.doc
        "The name of the database. For Hive compatibility, this is folded to lowercase when it is \
         stored.\n"]
}
[@@ocaml.doc
  "The [Database] object represents a logical grouping of tables that might reside in a Hive \
   metastore or an RDBMS.\n"]

type nonrec database_list = database list [@@ocaml.doc ""]

type nonrec get_databases_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  database_list : database_list;
      [@ocaml.doc "A list of [Database] objects from the specified catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec database_attributes = TARGET_DATABASE [@ocaml.doc ""] | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec database_attributes_list = database_attributes list [@@ocaml.doc ""]

type nonrec get_databases_request = {
  attributes_to_get : database_attributes_list option;
      [@ocaml.doc
        "Specifies the database fields returned by the [GetDatabases] call. This parameter \
         doesn\226\128\153t accept an empty list. The request must include the [NAME].\n"]
  resource_share_type : resource_share_type option;
      [@ocaml.doc
        "Allows you to specify that you want to list the databases shared with your account. The \
         allowable values are [FEDERATED], [FOREIGN] or [ALL]. \n\n\
        \ {ul\n\
        \       {-  If set to [FEDERATED], will list the federated databases (referencing an \
         external entity) shared with your account.\n\
        \           \n\
        \            }\n\
        \       {-  If set to [FOREIGN], will list the databases shared with your account. \n\
        \           \n\
        \            }\n\
        \       {-  If set to [ALL], will list the databases shared with your account, as well as \
         the databases in yor local account. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_results : catalog_getter_page_size option;
      [@ocaml.doc "The maximum number of databases to return in one response.\n"]
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog from which to retrieve [Databases]. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_database_response = {
  database : database option;
      [@ocaml.doc "The definition of the specified database in the Data Catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec get_database_request = {
  name : name_string;
      [@ocaml.doc
        "The name of the database to retrieve. For Hive compatibility, this should be all lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the database resides. If none is provided, the Amazon \
         Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_quality_ruleset_response = {
  data_quality_security_configuration : name_string option;
      [@ocaml.doc
        "The name of the security configuration created with the data quality encryption option.\n"]
  recommendation_run_id : hash_string option;
      [@ocaml.doc
        "When a ruleset was created from a recommendation run, this run ID is generated to link \
         the two together.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc
        "A timestamp. The last point in time when this data quality ruleset was modified.\n"]
  created_on : timestamp option;
      [@ocaml.doc "A timestamp. The time and date that this data quality ruleset was created.\n"]
  target_table : data_quality_target_table option;
      [@ocaml.doc "The name and database name of the target table.\n"]
  ruleset : data_quality_ruleset_string option;
      [@ocaml.doc
        "A Data Quality Definition Language (DQDL) ruleset. For more information, see the Glue \
         developer guide.\n"]
  description : description_string option; [@ocaml.doc "A description of the ruleset.\n"]
  name : name_string option; [@ocaml.doc "The name of the ruleset.\n"]
}
[@@ocaml.doc "Returns the data quality ruleset response.\n"]

type nonrec get_data_quality_ruleset_request = {
  name : name_string; [@ocaml.doc "The name of the ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_result_id_list = hash_string list [@@ocaml.doc ""]

type nonrec get_data_quality_ruleset_evaluation_run_response = {
  additional_data_sources : data_source_map option;
      [@ocaml.doc
        "A map of reference strings to additional data sources you can specify for an evaluation \
         run.\n"]
  result_ids : data_quality_result_id_list option;
      [@ocaml.doc "A list of result IDs for the data quality results for the run.\n"]
  ruleset_names : ruleset_names option;
      [@ocaml.doc
        "A list of ruleset names for the run. Currently, this parameter takes only one Ruleset name.\n"]
  execution_time : execution_time option;
      [@ocaml.doc "The amount of time (in seconds) that the run consumed resources.\n"]
  completed_on : timestamp option; [@ocaml.doc "The date and time when this run was completed.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc
        "A timestamp. The last point in time when this data quality rule recommendation run was \
         modified.\n"]
  started_on : timestamp option; [@ocaml.doc "The date and time when this run started.\n"]
  error_string : generic_string option;
      [@ocaml.doc "The error strings that are associated with the run.\n"]
  status : task_status_type option; [@ocaml.doc "The status for this run.\n"]
  additional_run_options : data_quality_evaluation_run_additional_run_options option;
      [@ocaml.doc "Additional run options you can specify for an evaluation run.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout for a run in minutes. This is the maximum time that a run can consume \
         resources before it is terminated and enters [TIMEOUT] status. The default is 2,880 \
         minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc "The number of [G.1X] workers to be used in the run. The default is 5.\n"]
  role : role_string option;
      [@ocaml.doc "An IAM role supplied to encrypt the results of the run.\n"]
  data_source : data_source option;
      [@ocaml.doc "The data source (an Glue table) associated with this evaluation run.\n"]
  run_id : hash_string option; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_quality_ruleset_evaluation_run_request = {
  run_id : hash_string; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_quality_rule_recommendation_run_response = {
  data_quality_security_configuration : name_string option;
      [@ocaml.doc
        "The name of the security configuration created with the data quality encryption option.\n"]
  created_ruleset_name : name_string option;
      [@ocaml.doc "The name of the ruleset that was created by the run.\n"]
  recommended_ruleset : data_quality_ruleset_string option;
      [@ocaml.doc
        "When a start rule recommendation run completes, it creates a recommended ruleset (a set \
         of rules). This member has those rules in Data Quality Definition Language (DQDL) format.\n"]
  execution_time : execution_time option;
      [@ocaml.doc "The amount of time (in seconds) that the run consumed resources.\n"]
  completed_on : timestamp option; [@ocaml.doc "The date and time when this run was completed.\n"]
  last_modified_on : timestamp option;
      [@ocaml.doc
        "A timestamp. The last point in time when this data quality rule recommendation run was \
         modified.\n"]
  started_on : timestamp option; [@ocaml.doc "The date and time when this run started.\n"]
  error_string : generic_string option;
      [@ocaml.doc "The error strings that are associated with the run.\n"]
  status : task_status_type option; [@ocaml.doc "The status for this run.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout for a run in minutes. This is the maximum time that a run can consume \
         resources before it is terminated and enters [TIMEOUT] status. The default is 2,880 \
         minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc "The number of [G.1X] workers to be used in the run. The default is 5.\n"]
  role : role_string option;
      [@ocaml.doc "An IAM role supplied to encrypt the results of the run.\n"]
  data_source : data_source option;
      [@ocaml.doc "The data source (an Glue table) associated with this run.\n"]
  run_id : hash_string option; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc "The response for the Data Quality rule recommendation run.\n"]

type nonrec get_data_quality_rule_recommendation_run_request = {
  run_id : hash_string; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_rule_result_description = string [@@ocaml.doc ""]

type nonrec data_quality_rule_result_status =
  | ERROR [@ocaml.doc ""]
  | FAIL [@ocaml.doc ""]
  | PASS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec evaluated_metrics_map = (name_string * nullable_double) list [@@ocaml.doc ""]

type nonrec data_quality_rule_result = {
  labels : labels option;
      [@ocaml.doc "A map containing labels assigned to the data quality rule. \n"]
  rule_metrics : rule_metrics_map option;
      [@ocaml.doc
        "A map containing metrics associated with the evaluation of the rule based on row-level \
         results. \n"]
  evaluated_rule : data_quality_rule_result_description option; [@ocaml.doc "The evaluated rule.\n"]
  evaluated_metrics : evaluated_metrics_map option;
      [@ocaml.doc "A map of metrics associated with the evaluation of the rule.\n"]
  result_ : data_quality_rule_result_status option;
      [@ocaml.doc "A pass or fail status for the rule.\n"]
  evaluation_message : data_quality_rule_result_description option;
      [@ocaml.doc "An evaluation message.\n"]
  description : data_quality_rule_result_description option;
      [@ocaml.doc "A description of the data quality rule.\n"]
  name : name_string option; [@ocaml.doc "The name of the data quality rule.\n"]
}
[@@ocaml.doc "Describes the result of the evaluation of a data quality rule.\n"]

type nonrec data_quality_rule_results = data_quality_rule_result list [@@ocaml.doc ""]

type nonrec data_quality_analyzer_result = {
  evaluated_metrics : evaluated_metrics_map option;
      [@ocaml.doc "A map of metrics associated with the evaluation of the analyzer.\n"]
  evaluation_message : data_quality_rule_result_description option;
      [@ocaml.doc "An evaluation message.\n"]
  description : data_quality_rule_result_description option;
      [@ocaml.doc "A description of the data quality analyzer.\n"]
  name : name_string option; [@ocaml.doc "The name of the data quality analyzer.\n"]
}
[@@ocaml.doc "Describes the result of the evaluation of a data quality analyzer.\n"]

type nonrec data_quality_analyzer_results = data_quality_analyzer_result list [@@ocaml.doc ""]

type nonrec data_quality_observation_description = string [@@ocaml.doc ""]

type nonrec data_quality_observation = {
  metric_based_observation : metric_based_observation option;
      [@ocaml.doc
        "An object of type [MetricBasedObservation] representing the observation that is based on \
         evaluated data quality metrics.\n"]
  description : data_quality_observation_description option;
      [@ocaml.doc "A description of the data quality observation.\n"]
}
[@@ocaml.doc "Describes the observation generated after evaluating the rules and analyzers.\n"]

type nonrec data_quality_observations = data_quality_observation list [@@ocaml.doc ""]

type nonrec data_quality_aggregated_metrics = {
  total_rules_failed : nullable_double option;
      [@ocaml.doc "The total number of data quality rules that failed their evaluation criteria.\n"]
  total_rules_passed : nullable_double option;
      [@ocaml.doc "The total number of data quality rules that passed their evaluation criteria.\n"]
  total_rules_processed : nullable_double option;
      [@ocaml.doc "The total number of data quality rules that were evaluated.\n"]
  total_rows_failed : nullable_double option;
      [@ocaml.doc "The total number of rows that failed one or more data quality rules.\n"]
  total_rows_passed : nullable_double option;
      [@ocaml.doc "The total number of rows that passed all applicable data quality rules.\n"]
  total_rows_processed : nullable_double option;
      [@ocaml.doc
        "The total number of rows that were processed during the data quality evaluation.\n"]
}
[@@ocaml.doc
  "A summary of metrics showing the total counts of processed rows and rules, including their \
   pass/fail statistics based on row-level results.\n"]

type nonrec get_data_quality_result_response = {
  aggregated_metrics : data_quality_aggregated_metrics option;
      [@ocaml.doc
        " A summary of [DataQualityAggregatedMetrics] objects showing the total counts of \
         processed rows and rules, including their pass/fail statistics based on row-level \
         results. \n"]
  observations : data_quality_observations option;
      [@ocaml.doc
        "A list of [DataQualityObservation] objects representing the observations generated after \
         evaluating the rules and analyzers. \n"]
  analyzer_results : data_quality_analyzer_results option;
      [@ocaml.doc
        "A list of [DataQualityAnalyzerResult] objects representing the results for each analyzer. \n"]
  rule_results : data_quality_rule_results option;
      [@ocaml.doc
        "A list of [DataQualityRuleResult] objects representing the results for each rule. \n"]
  ruleset_evaluation_run_id : hash_string option;
      [@ocaml.doc "The unique run ID associated with the ruleset evaluation.\n"]
  job_run_id : hash_string option;
      [@ocaml.doc "The job run ID associated with the data quality result, if any.\n"]
  job_name : name_string option;
      [@ocaml.doc "The job name associated with the data quality result, if any.\n"]
  completed_on : timestamp option;
      [@ocaml.doc "The date and time when the run for this data quality result was completed.\n"]
  started_on : timestamp option;
      [@ocaml.doc "The date and time when the run for this data quality result started.\n"]
  evaluation_context : generic_string option;
      [@ocaml.doc
        "In the context of a job in Glue Studio, each node in the canvas is typically assigned \
         some sort of name and data quality nodes will have names. In the case of multiple nodes, \
         the [evaluationContext] can differentiate the nodes.\n"]
  ruleset_name : name_string option;
      [@ocaml.doc "The name of the ruleset associated with the data quality result.\n"]
  data_source : data_source option;
      [@ocaml.doc "The table associated with the data quality result, if any.\n"]
  score : generic_bounded_double option;
      [@ocaml.doc
        "An aggregate data quality score. Represents the ratio of rules that passed to the total \
         number of rules.\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID for the data quality result.\n"]
  result_id : hash_string option; [@ocaml.doc "A unique result ID for the data quality result.\n"]
}
[@@ocaml.doc "The response for the data quality result.\n"]

type nonrec get_data_quality_result_request = {
  result_id : hash_string; [@ocaml.doc "A unique result ID for the data quality result.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_quality_model_result_response = {
  model : statistic_model_results option; [@ocaml.doc "A list of [StatisticModelResult] \n"]
  completed_on : timestamp option;
      [@ocaml.doc "The timestamp when the data quality model training completed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_quality_model_result_request = {
  profile_id : hash_string; [@ocaml.doc "The Profile ID.\n"]
  statistic_id : hash_string; [@ocaml.doc "The Statistic ID.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_model_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_data_quality_model_response = {
  failure_reason : hash_string option; [@ocaml.doc "The training failure reason.\n"]
  completed_on : timestamp option;
      [@ocaml.doc "The timestamp when the data quality model training completed.\n"]
  started_on : timestamp option;
      [@ocaml.doc "The timestamp when the data quality model training started.\n"]
  status : data_quality_model_status option;
      [@ocaml.doc "The training status of the data quality model.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_quality_model_request = {
  profile_id : hash_string; [@ocaml.doc "The Profile ID.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_catalog_encryption_settings_response = {
  data_catalog_encryption_settings : data_catalog_encryption_settings option;
      [@ocaml.doc "The requested security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_catalog_encryption_settings_request = {
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog to retrieve the security configuration for. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dashboard_url_response = {
  url : sensitive_url; [@ocaml.doc "The URL for the Spark monitoring dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dashboard_url_request = {
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request. \n"]
  resource_type : glue_resource_type;
      [@ocaml.doc "The type of the resource. Valid values are [SESSION] and [JOB].\n"]
  resource_id : name_string;
      [@ocaml.doc
        "The unique identifier of the resource for which to retrieve the dashboard URL.\n"]
}
[@@ocaml.doc ""]

type nonrec get_custom_entity_type_response = {
  context_words : context_words option;
      [@ocaml.doc
        "A list of context words if specified when you created the custom pattern. If none of \
         these context words are found within the vicinity of the regular expression the data will \
         not be detected as sensitive data.\n"]
  regex_string : name_string option;
      [@ocaml.doc
        "A regular expression string that is used for detecting sensitive data in a custom pattern.\n"]
  name : name_string option; [@ocaml.doc "The name of the custom pattern that you retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_custom_entity_type_request = {
  name : name_string; [@ocaml.doc "The name of the custom pattern that you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec crawler_state =
  | STOPPING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec crawler = {
  lake_formation_configuration : lake_formation_configuration option;
      [@ocaml.doc
        "Specifies whether the crawler should use Lake Formation credentials for the crawler \
         instead of the IAM role credentials.\n"]
  crawler_security_configuration : crawler_security_configuration option;
      [@ocaml.doc "The name of the [SecurityConfiguration] structure to be used by this crawler.\n"]
  configuration : crawler_configuration option;
      [@ocaml.doc
        "Crawler configuration information. This versioned JSON string allows users to specify \
         aspects of a crawler's behavior. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html}Setting crawler \
         configuration options}.\n"]
  version : version_id option; [@ocaml.doc "The version of the crawler.\n"]
  last_crawl : last_crawl_info option;
      [@ocaml.doc
        "The status of the last crawl, and potentially error information if an error occurred.\n"]
  last_updated : timestamp option; [@ocaml.doc "The time that the crawler was last updated.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that the crawler was created.\n"]
  crawl_elapsed_time : milliseconds_count option;
      [@ocaml.doc
        "If the crawler is running, contains the total time elapsed since the last crawl began.\n"]
  schedule : schedule option;
      [@ocaml.doc "For scheduled crawlers, the schedule when the crawler runs.\n"]
  table_prefix : table_prefix option;
      [@ocaml.doc "The prefix added to the names of tables that are created.\n"]
  state : crawler_state option;
      [@ocaml.doc "Indicates whether the crawler is running, or whether a run is pending.\n"]
  lineage_configuration : lineage_configuration option;
      [@ocaml.doc
        "A configuration that specifies whether data lineage is enabled for the crawler.\n"]
  schema_change_policy : schema_change_policy option;
      [@ocaml.doc "The policy that specifies update and delete behaviors for the crawler.\n"]
  recrawl_policy : recrawl_policy option;
      [@ocaml.doc
        "A policy that specifies whether to crawl the entire dataset again, or to crawl only \
         folders that were added since the last crawler run.\n"]
  classifiers : classifier_name_list option;
      [@ocaml.doc
        "A list of UTF-8 strings that specify the custom classifiers that are associated with the \
         crawler.\n"]
  description : description_string option; [@ocaml.doc "A description of the crawler.\n"]
  database_name : database_name option;
      [@ocaml.doc "The name of the database in which the crawler's output is stored.\n"]
  targets : crawler_targets option; [@ocaml.doc "A collection of targets to crawl.\n"]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that's used to access customer resources, \
         such as Amazon Simple Storage Service (Amazon S3) data.\n"]
  name : name_string option; [@ocaml.doc "The name of the crawler.\n"]
}
[@@ocaml.doc
  "Specifies a crawler program that examines a data source and uses classifiers to try to \
   determine its schema. If successful, the crawler records metadata concerning the data source in \
   the Glue Data Catalog.\n"]

type nonrec crawler_list = crawler list [@@ocaml.doc ""]

type nonrec get_crawlers_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the returned list has not reached the end of those defined in \
         this customer account.\n"]
  crawlers : crawler_list option; [@ocaml.doc "A list of crawler metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec get_crawlers_request = {
  next_token : token option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
  max_results : page_size option; [@ocaml.doc "The number of crawlers to return on each call.\n"]
}
[@@ocaml.doc ""]

type nonrec get_crawler_response = {
  crawler : crawler option; [@ocaml.doc "The metadata for the specified crawler.\n"]
}
[@@ocaml.doc ""]

type nonrec get_crawler_request = {
  name : name_string; [@ocaml.doc "The name of the crawler to retrieve metadata for.\n"]
}
[@@ocaml.doc ""]

type nonrec crawler_metrics = {
  tables_deleted : non_negative_integer option;
      [@ocaml.doc "The number of tables deleted by this crawler.\n"]
  tables_updated : non_negative_integer option;
      [@ocaml.doc "The number of tables updated by this crawler.\n"]
  tables_created : non_negative_integer option;
      [@ocaml.doc "The number of tables created by this crawler.\n"]
  median_runtime_seconds : non_negative_double option;
      [@ocaml.doc "The median duration of this crawler's runs, in seconds.\n"]
  last_runtime_seconds : non_negative_double option;
      [@ocaml.doc "The duration of the crawler's most recent run, in seconds.\n"]
  still_estimating : boolean_ option;
      [@ocaml.doc
        "True if the crawler is still estimating how long it will take to complete this run.\n"]
  time_left_seconds : non_negative_double option;
      [@ocaml.doc "The estimated time left to complete a running crawl.\n"]
  crawler_name : name_string option; [@ocaml.doc "The name of the crawler.\n"]
}
[@@ocaml.doc "Metrics for a specified crawler.\n"]

type nonrec crawler_metrics_list = crawler_metrics list [@@ocaml.doc ""]

type nonrec get_crawler_metrics_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the returned list does not contain the last metric available.\n"]
  crawler_metrics_list : crawler_metrics_list option;
      [@ocaml.doc "A list of metrics for the specified crawler.\n"]
}
[@@ocaml.doc ""]

type nonrec get_crawler_metrics_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
  crawler_name_list : crawler_name_list option;
      [@ocaml.doc "A list of the names of crawlers about which to retrieve metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_status =
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authentication_configuration = {
  o_auth2_properties : o_auth2_properties option;
      [@ocaml.doc "The properties for OAuth2 authentication.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key used to encrypt sensitive authentication \
         information. This key is used to protect credentials and other sensitive data stored \
         within the authentication configuration.\n"]
  secret_arn : secret_arn option; [@ocaml.doc "The secret manager ARN to store credentials.\n"]
  authentication_type : authentication_type option;
      [@ocaml.doc "A structure containing the authentication configuration.\n"]
}
[@@ocaml.doc "A structure containing the authentication configuration.\n"]

type nonrec connection_schema_version = int [@@ocaml.doc ""]

type nonrec connection = {
  compatible_compute_environments : compute_environment_list option;
      [@ocaml.doc "A list of compute environments compatible with the connection.\n"]
  connection_schema_version : connection_schema_version option;
      [@ocaml.doc
        "The version of the connection schema for this connection. Version 2 supports properties \
         for specific compute environments.\n"]
  authentication_configuration : authentication_configuration option;
      [@ocaml.doc "The authentication properties of the connection.\n"]
  last_connection_validation_time : timestamp option;
      [@ocaml.doc "A timestamp of the time this connection was last validated.\n"]
  status_reason : long_value_string option; [@ocaml.doc "The reason for the connection status.\n"]
  status : connection_status option;
      [@ocaml.doc
        "The status of the connection. Can be one of: [READY], [IN_PROGRESS], or [FAILED].\n"]
  last_updated_by : name_string option;
      [@ocaml.doc "The user, group, or role that last updated this connection definition.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The timestamp of the last time the connection definition was updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The timestamp of the time that this connection definition was created.\n"]
  physical_connection_requirements : physical_connection_requirements option;
      [@ocaml.doc
        "The physical connection requirements, such as virtual private cloud (VPC) and \
         [SecurityGroup], that are needed to make this connection successfully.\n"]
  python_properties : property_map option;
      [@ocaml.doc "Connection properties specific to the Python compute environment.\n"]
  athena_properties : property_map option;
      [@ocaml.doc "Connection properties specific to the Athena compute environment.\n"]
  spark_properties : property_map option;
      [@ocaml.doc "Connection properties specific to the Spark compute environment.\n"]
  connection_properties : connection_properties option;
      [@ocaml.doc
        "These key-value pairs define parameters for the connection when using the version 1 \
         Connection schema:\n\n\
        \ {ul\n\
        \       {-   [HOST] - The host URI: either the fully qualified domain name (FQDN) or the \
         IPv4 address of the database host.\n\
        \           \n\
        \            }\n\
        \       {-   [PORT] - The port number, between 1024 and 65535, of the port on which the \
         database host is listening for database connections.\n\
        \           \n\
        \            }\n\
        \       {-   [USER_NAME] - The name under which to log in to the database. The value \
         string for [USER_NAME] is \"[USERNAME]\".\n\
        \           \n\
        \            }\n\
        \       {-   [PASSWORD] - A password, if one is used, for the user name.\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTED_PASSWORD] - When you enable connection password protection by \
         setting [ConnectionPasswordEncryption] in the Data Catalog encryption settings, this \
         field stores the encrypted password.\n\
        \           \n\
        \            }\n\
        \       {-   [JDBC_DRIVER_JAR_URI] - The Amazon Simple Storage Service (Amazon S3) path of \
         the JAR file that contains the JDBC driver to use.\n\
        \           \n\
        \            }\n\
        \       {-   [JDBC_DRIVER_CLASS_NAME] - The class name of the JDBC driver to use.\n\
        \           \n\
        \            }\n\
        \       {-   [JDBC_ENGINE] - The name of the JDBC engine to use.\n\
        \           \n\
        \            }\n\
        \       {-   [JDBC_ENGINE_VERSION] - The version of the JDBC engine to use.\n\
        \           \n\
        \            }\n\
        \       {-   [CONFIG_FILES] - (Reserved for future use.)\n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_ID] - The instance ID to use.\n\
        \           \n\
        \            }\n\
        \       {-   [JDBC_CONNECTION_URL] - The URL for connecting to a JDBC data source.\n\
        \           \n\
        \            }\n\
        \       {-   [JDBC_ENFORCE_SSL] - A case-insensitive Boolean string (true, false) \
         specifying whether Secure Sockets Layer (SSL) with hostname matching is enforced for the \
         JDBC connection on the client. The default is false.\n\
        \           \n\
        \            }\n\
        \       {-   [CUSTOM_JDBC_CERT] - An Amazon S3 location specifying the customer's root \
         certificate. Glue uses this root certificate to validate the customer\226\128\153s \
         certificate when connecting to the customer database. Glue only handles X.509 \
         certificates. The certificate provided must be DER-encoded and supplied in Base64 \
         encoding PEM format.\n\
        \           \n\
        \            }\n\
        \       {-   [SKIP_CUSTOM_JDBC_CERT_VALIDATION] - By default, this is [false]. Glue \
         validates the Signature algorithm and Subject Public Key Algorithm for the customer \
         certificate. The only permitted algorithms for the Signature algorithm are SHA256withRSA, \
         SHA384withRSA or SHA512withRSA. For the Subject Public Key Algorithm, the key length must \
         be at least 2048. You can set the value of this property to [true] to skip \
         Glue\226\128\153s validation of the customer certificate.\n\
        \           \n\
        \            }\n\
        \       {-   [CUSTOM_JDBC_CERT_STRING] - A custom JDBC certificate string which is used \
         for domain match or distinguished name match to prevent a man-in-the-middle attack. In \
         Oracle database, this is used as the [SSL_SERVER_CERT_DN]; in Microsoft SQL Server, this \
         is used as the [hostNameInCertificate].\n\
        \           \n\
        \            }\n\
        \       {-   [CONNECTION_URL] - The URL for connecting to a general (non-JDBC) data source.\n\
        \           \n\
        \            }\n\
        \       {-   [SECRET_ID] - The secret ID used for the secret manager of credentials.\n\
        \           \n\
        \            }\n\
        \       {-   [CONNECTOR_URL] - The connector URL for a MARKETPLACE or CUSTOM connection.\n\
        \           \n\
        \            }\n\
        \       {-   [CONNECTOR_TYPE] - The connector type for a MARKETPLACE or CUSTOM connection.\n\
        \           \n\
        \            }\n\
        \       {-   [CONNECTOR_CLASS_NAME] - The connector class name for a MARKETPLACE or CUSTOM \
         connection.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_BOOTSTRAP_SERVERS] - A comma-separated list of host and port pairs \
         that are the addresses of the Apache Kafka brokers in a Kafka cluster to which a Kafka \
         client will connect to and bootstrap itself.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SSL_ENABLED] - Whether to enable or disable SSL on an Apache Kafka \
         connection. Default value is \"true\".\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_CUSTOM_CERT] - The Amazon S3 URL for the private CA cert file (.pem \
         format). The default is an empty string.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SKIP_CUSTOM_CERT_VALIDATION] - Whether to skip the validation of the \
         CA cert file or not. Glue validates for three algorithms: SHA256withRSA, SHA384withRSA \
         and SHA512withRSA. Default value is \"false\".\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_CLIENT_KEYSTORE] - The Amazon S3 location of the client keystore file \
         for Kafka client side authentication (Optional).\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_CLIENT_KEYSTORE_PASSWORD] - The password to access the provided \
         keystore (Optional).\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_CLIENT_KEY_PASSWORD] - A keystore can consist of multiple keys, so \
         this is the password to access the client key to be used with the Kafka server side key \
         (Optional).\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD] - The encrypted version of the \
         Kafka client keystore password (if the user has the Glue encrypt passwords setting \
         selected).\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD] - The encrypted version of the Kafka \
         client key password (if the user has the Glue encrypt passwords setting selected).\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_MECHANISM] - [\"SCRAM-SHA-512\"], [\"GSSAPI\"], \
         [\"AWS_MSK_IAM\"], or [\"PLAIN\"]. These are the supported \
         {{:https://www.iana.org/assignments/sasl-mechanisms/sasl-mechanisms.xhtml}SASL \
         Mechanisms}.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_PLAIN_USERNAME] - A plaintext username used to authenticate with \
         the \"PLAIN\" mechanism.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_PLAIN_PASSWORD] - A plaintext password used to authenticate with \
         the \"PLAIN\" mechanism.\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD] - The encrypted version of the Kafka \
         SASL PLAIN password (if the user has the Glue encrypt passwords setting selected).\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_SCRAM_USERNAME] - A plaintext username used to authenticate with \
         the \"SCRAM-SHA-512\" mechanism.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_SCRAM_PASSWORD] - A plaintext password used to authenticate with \
         the \"SCRAM-SHA-512\" mechanism.\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD] - The encrypted version of the Kafka \
         SASL SCRAM password (if the user has the Glue encrypt passwords setting selected).\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_SCRAM_SECRETS_ARN] - The Amazon Resource Name of a secret in \
         Amazon Web Services Secrets Manager.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_GSSAPI_KEYTAB] - The S3 location of a Kerberos [keytab] file. A \
         keytab stores long-term keys for one or more principals. For more information, see \
         {{:https://web.mit.edu/kerberos/krb5-latest/doc/basic/keytab_def.html}MIT Kerberos \
         Documentation: Keytab}.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_GSSAPI_KRB5_CONF] - The S3 location of a Kerberos [krb5.conf] \
         file. A krb5.conf stores Kerberos configuration information, such as the location of the \
         KDC server. For more information, see \
         {{:https://web.mit.edu/kerberos/krb5-1.12/doc/admin/conf_files/krb5_conf.html}MIT \
         Kerberos Documentation: krb5.conf}.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_GSSAPI_SERVICE] - The Kerberos service name, as set with \
         [sasl.kerberos.service.name] in your \
         {{:https://kafka.apache.org/documentation/#brokerconfigs_sasl.kerberos.service.name}Kafka \
         Configuration}.\n\
        \           \n\
        \            }\n\
        \       {-   [KAFKA_SASL_GSSAPI_PRINCIPAL] - The name of the Kerberos princial used by \
         Glue. For more information, see \
         {{:https://kafka.apache.org/documentation/#security_sasl_kerberos_clientconfig}Kafka \
         Documentation: Configuring Kafka Brokers}.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLE_ARN] - The role to be used for running queries.\n\
        \           \n\
        \            }\n\
        \       {-   [REGION] - The Amazon Web Services Region where queries will be run.\n\
        \           \n\
        \            }\n\
        \       {-   [WORKGROUP_NAME] - The name of an Amazon Redshift serverless workgroup or \
         Amazon Athena workgroup in which queries will run.\n\
        \           \n\
        \            }\n\
        \       {-   [CLUSTER_IDENTIFIER] - The cluster identifier of an Amazon Redshift cluster \
         in which queries will run.\n\
        \           \n\
        \            }\n\
        \       {-   [DATABASE] - The Amazon Redshift database that you are connecting to.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  match_criteria : match_criteria option;
      [@ocaml.doc "A list of criteria that can be used in selecting this connection.\n"]
  connection_type : connection_type option;
      [@ocaml.doc "The type of the connection. Currently, SFTP is not supported.\n"]
  description : description_string option; [@ocaml.doc "The description of the connection.\n"]
  name : name_string option; [@ocaml.doc "The name of the connection definition.\n"]
}
[@@ocaml.doc "Defines a connection to a data source.\n"]

type nonrec connection_list = connection list [@@ocaml.doc ""]

type nonrec get_connections_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token, if the list of connections returned does not include the last of \
         the filtered connections.\n"]
  connection_list : connection_list option;
      [@ocaml.doc "A list of requested connection definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connections_filter = {
  connection_schema_version : connection_schema_version option;
      [@ocaml.doc "Denotes if the connection was created with schema version 1 or 2.\n"]
  connection_type : connection_type option;
      [@ocaml.doc "The type of connections to return. Currently, SFTP is not supported.\n"]
  match_criteria : match_criteria option;
      [@ocaml.doc
        "A criteria string that must match the criteria recorded in the connection definition for \
         that connection definition to be returned.\n"]
}
[@@ocaml.doc
  "Filters the connection definitions that are returned by the [GetConnections] API operation.\n"]

type nonrec get_connections_request = {
  max_results : page_size option;
      [@ocaml.doc "The maximum number of connections to return in one response.\n"]
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  hide_password : boolean_ option;
      [@ocaml.doc
        "Allows you to retrieve the connection metadata without returning the password. For \
         instance, the Glue console uses this flag to retrieve the connection, and does not \
         display the password. Set this parameter when the caller might not have permission to use \
         the KMS key to decrypt the password, but it does have permission to access the rest of \
         the connection properties.\n"]
  filter : get_connections_filter option;
      [@ocaml.doc "A filter that controls which connections are returned.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the connections reside. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_response = {
  connection : connection option; [@ocaml.doc "The requested connection definition.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_request = {
  apply_override_for_compute_environment : compute_environment option;
      [@ocaml.doc
        "For connections that may be used in multiple services, specifies returning properties for \
         the specified compute environment.\n"]
  hide_password : boolean_ option;
      [@ocaml.doc
        "Allows you to retrieve the connection metadata without returning the password. For \
         instance, the Glue console uses this flag to retrieve the connection, and does not \
         display the password. Set this parameter when the caller might not have permission to use \
         the KMS key to decrypt the password, but it does have permission to access the rest of \
         the connection properties.\n"]
  name : name_string; [@ocaml.doc "The name of the connection definition to retrieve.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the connection resides. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_status = STARTED [@ocaml.doc ""] | FAILED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec execution_attempt = {
  error_message : description_string option;
      [@ocaml.doc "An error message associated with the last column statistics task run.\n"]
  execution_timestamp : timestamp option;
      [@ocaml.doc "A timestamp when the last column statistics task run occurred.\n"]
  column_statistics_task_run_id : hash_string option;
      [@ocaml.doc "A task run ID for the last column statistics task run.\n"]
  status : execution_status option;
      [@ocaml.doc "The status of the last column statistics task run.\n"]
}
[@@ocaml.doc "A run attempt for a column statistics task run.\n"]

type nonrec column_statistics_task_settings = {
  last_execution_attempt : execution_attempt option;
      [@ocaml.doc "The last [ExecutionAttempt] for the column statistics task run.\n"]
  setting_source : setting_source option;
      [@ocaml.doc
        "The source of setting the column statistics task. Possible values may be [CATALOG] or \
         [TABLE].\n"]
  schedule_type : schedule_type option;
      [@ocaml.doc
        "The type of schedule for a column statistics task. Possible values may be [CRON] or [AUTO].\n"]
  security_configuration : crawler_security_configuration option;
      [@ocaml.doc "Name of the security configuration that is used to encrypt CloudWatch logs.\n"]
  sample_size : sample_size_percentage option; [@ocaml.doc "The percentage of data to sample.\n"]
  role : role option; [@ocaml.doc "The role used for running the column statistics.\n"]
  catalog_i_d : catalog_id_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the database resides.\n"]
  column_name_list : column_name_list option;
      [@ocaml.doc "A list of column names for which to run statistics.\n"]
  schedule : schedule option;
      [@ocaml.doc "A schedule for running the column statistics, specified in CRON syntax.\n"]
  table_name : table_name option;
      [@ocaml.doc "The name of the table for which to generate column statistics.\n"]
  database_name : database_name option;
      [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc "The settings for a column statistics task.\n"]

type nonrec get_column_statistics_task_settings_response = {
  column_statistics_task_settings : column_statistics_task_settings option;
      [@ocaml.doc
        "A [ColumnStatisticsTaskSettings] object representing the settings for the column \
         statistics task.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_statistics_task_settings_request = {
  table_name : name_string;
      [@ocaml.doc "The name of the table for which to retrieve column statistics.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec computation_type = INCREMENTAL [@ocaml.doc ""] | FULL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec column_statistics_state =
  | STOPPED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec column_statistics_task_run = {
  dpu_seconds : non_negative_double option;
      [@ocaml.doc "The calculated DPU usage in seconds for all autoscaled workers.\n"]
  error_message : description_string option; [@ocaml.doc "The error message for the job.\n"]
  end_time : timestamp option; [@ocaml.doc "The end time of the task.\n"]
  start_time : timestamp option; [@ocaml.doc "The start time of the task.\n"]
  last_updated : timestamp option;
      [@ocaml.doc "The last point in time when this task was modified.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that this task was created.\n"]
  status : column_statistics_state option; [@ocaml.doc "The status of the task run.\n"]
  computation_type : computation_type option;
      [@ocaml.doc "The type of column statistics computation.\n"]
  worker_type : name_string option;
      [@ocaml.doc "The type of workers being used for generating stats. The default is [g.1x].\n"]
  number_of_workers : positive_integer option;
      [@ocaml.doc
        "The number of workers used to generate column statistics. The job is preconfigured to \
         autoscale up to 25 instances.\n"]
  security_configuration : crawler_security_configuration option;
      [@ocaml.doc
        "Name of the security configuration that is used to encrypt CloudWatch logs for the column \
         stats task run.\n"]
  sample_size : sample_size_percentage option;
      [@ocaml.doc
        "The percentage of rows used to generate statistics. If none is supplied, the entire table \
         will be used to generate stats.\n"]
  role : role option; [@ocaml.doc "The IAM role that the service assumes to generate statistics.\n"]
  catalog_i_d : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is supplied, the Amazon Web \
         Services account ID is used by default.\n"]
  column_name_list : column_name_list option;
      [@ocaml.doc
        "A list of the column names. If none is supplied, all column names for the table will be \
         used by default.\n"]
  table_name : table_name option;
      [@ocaml.doc "The name of the table for which column statistics is generated.\n"]
  database_name : database_name option; [@ocaml.doc "The database where the table resides.\n"]
  column_statistics_task_run_id : hash_string option;
      [@ocaml.doc "The identifier for the particular column statistics task run.\n"]
  customer_id : account_id option; [@ocaml.doc "The Amazon Web Services account ID.\n"]
}
[@@ocaml.doc "The object that shows the details of the column stats run.\n"]

type nonrec column_statistics_task_runs_list = column_statistics_task_run list [@@ocaml.doc ""]

type nonrec get_column_statistics_task_runs_response = {
  next_token : token option;
      [@ocaml.doc "A continuation token, if not all task runs have yet been returned.\n"]
  column_statistics_task_runs : column_statistics_task_runs_list option;
      [@ocaml.doc "A list of column statistics task runs.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_statistics_task_runs_request = {
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum size of the response.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : database_name; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_statistics_task_run_response = {
  column_statistics_task_run : column_statistics_task_run option;
      [@ocaml.doc
        "A [ColumnStatisticsTaskRun] object representing the details of the column stats run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_statistics_task_run_request = {
  column_statistics_task_run_id : hash_string;
      [@ocaml.doc "The identifier for the particular column statistics task run.\n"]
}
[@@ocaml.doc ""]

type nonrec column_statistics_list = column_statistics list [@@ocaml.doc ""]

type nonrec column_error = {
  error : error_detail option;
      [@ocaml.doc "An error message with the reason for the failure of an operation.\n"]
  column_name : name_string option; [@ocaml.doc "The name of the column that failed.\n"]
}
[@@ocaml.doc "Encapsulates a column name that failed and the reason for failure.\n"]

type nonrec column_errors = column_error list [@@ocaml.doc ""]

type nonrec get_column_statistics_for_table_response = {
  errors : column_errors option;
      [@ocaml.doc "List of ColumnStatistics that failed to be retrieved.\n"]
  column_statistics_list : column_statistics_list option; [@ocaml.doc "List of ColumnStatistics.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_names_list = name_string list [@@ocaml.doc ""]

type nonrec get_column_statistics_for_table_request = {
  column_names : get_column_names_list; [@ocaml.doc "A list of the column names.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_statistics_for_partition_response = {
  errors : column_errors option;
      [@ocaml.doc "Error occurred during retrieving column statistics data.\n"]
  column_statistics_list : column_statistics_list option;
      [@ocaml.doc "List of ColumnStatistics that failed to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_column_statistics_for_partition_request = {
  column_names : get_column_names_list; [@ocaml.doc "A list of the column names.\n"]
  partition_values : value_string_list;
      [@ocaml.doc "A list of partition values identifying the partition.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec csv_classifier = {
  serde : csv_serde_option option;
      [@ocaml.doc
        "Sets the SerDe for processing CSV in the classifier, which will be applied in the Data \
         Catalog. Valid values are [OpenCSVSerDe], [LazySimpleSerDe], and [None]. You can specify \
         the [None] value when you want the crawler to do the detection.\n"]
  custom_datatypes : custom_datatypes option;
      [@ocaml.doc
        "A list of custom datatypes including \"BINARY\", \"BOOLEAN\", \"DATE\", \"DECIMAL\", \
         \"DOUBLE\", \"FLOAT\", \"INT\", \"LONG\", \"SHORT\", \"STRING\", \"TIMESTAMP\".\n"]
  custom_datatype_configured : nullable_boolean option;
      [@ocaml.doc "Enables the custom datatype to be configured.\n"]
  allow_single_column : nullable_boolean option;
      [@ocaml.doc "Enables the processing of files that contain only one column.\n"]
  disable_value_trimming : nullable_boolean option;
      [@ocaml.doc
        "Specifies not to trim values before identifying the type of column values. The default \
         value is [true].\n"]
  header : csv_header option; [@ocaml.doc "A list of strings representing column names.\n"]
  contains_header : csv_header_option option;
      [@ocaml.doc "Indicates whether the CSV file contains a header.\n"]
  quote_symbol : csv_quote_symbol option;
      [@ocaml.doc
        "A custom symbol to denote what combines content into a single column value. It must be \
         different from the column delimiter.\n"]
  delimiter : csv_column_delimiter option;
      [@ocaml.doc "A custom symbol to denote what separates each column entry in the row.\n"]
  version : version_id option; [@ocaml.doc "The version of this classifier.\n"]
  last_updated : timestamp option; [@ocaml.doc "The time that this classifier was last updated.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time that this classifier was registered.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "A classifier for custom [CSV] content.\n"]

type nonrec classifier = {
  csv_classifier : csv_classifier option;
      [@ocaml.doc "A classifier for comma-separated values (CSV).\n"]
  json_classifier : json_classifier option; [@ocaml.doc "A classifier for JSON content.\n"]
  xml_classifier : xml_classifier option; [@ocaml.doc "A classifier for XML content.\n"]
  grok_classifier : grok_classifier option; [@ocaml.doc "A classifier that uses [grok].\n"]
}
[@@ocaml.doc
  "Classifiers are triggered during a crawl task. A classifier checks whether a given file is in a \
   format it can handle. If it is, the classifier creates a schema in the form of a [StructType] \
   object that matches that data format.\n\n\
  \ You can use the standard classifiers that Glue provides, or you can write your own classifiers \
   to best categorize your data sources and specify the appropriate schemas to use for them. A \
   classifier can be a [grok] classifier, an [XML] classifier, a [JSON] classifier, or a custom \
   [CSV] classifier, as specified in one of the fields in the [Classifier] object.\n\
  \ "]

type nonrec classifier_list = classifier list [@@ocaml.doc ""]

type nonrec get_classifiers_response = {
  next_token : token option; [@ocaml.doc "A continuation token.\n"]
  classifiers : classifier_list option; [@ocaml.doc "The requested list of classifier objects.\n"]
}
[@@ocaml.doc ""]

type nonrec get_classifiers_request = {
  next_token : token option; [@ocaml.doc "An optional continuation token.\n"]
  max_results : page_size option; [@ocaml.doc "The size of the list to return (optional).\n"]
}
[@@ocaml.doc ""]

type nonrec get_classifier_response = {
  classifier : classifier option; [@ocaml.doc "The requested classifier.\n"]
}
[@@ocaml.doc ""]

type nonrec get_classifier_request = {
  name : name_string; [@ocaml.doc "Name of the classifier to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_name_string = string [@@ocaml.doc ""]

type nonrec data_lake_access_properties_output = {
  catalog_type : name_string option;
      [@ocaml.doc
        "Specifies a federated catalog type for the native catalog resource. The currently \
         supported type is [aws:redshift].\n"]
  status_message : name_string option;
      [@ocaml.doc
        "A message that gives more detailed information about the managed workgroup status.\n"]
  redshift_database_name : name_string option;
      [@ocaml.doc "The default Redshift database resource name in the managed compute.\n"]
  managed_workgroup_status : name_string option;
      [@ocaml.doc "The managed Redshift Serverless compute status.\n"]
  managed_workgroup_name : name_string option;
      [@ocaml.doc
        "The managed Redshift Serverless compute name that is created for your catalog resource.\n"]
  kms_key : resource_arn_string option;
      [@ocaml.doc
        "An encryption key that will be used for the staging bucket that will be created along \
         with the catalog.\n"]
  data_transfer_role : iam_role_arn option;
      [@ocaml.doc
        "A role that will be assumed by Glue for transferring data into/out of the staging bucket \
         during a query.\n"]
  data_lake_access : boolean_ option;
      [@ocaml.doc
        "Turns on or off data lake access for Apache Spark applications that access Amazon \
         Redshift databases in the Data Catalog.\n"]
}
[@@ocaml.doc
  "The output properties of the data lake access configuration for your catalog resource in the \
   Glue Data Catalog.\n"]

type nonrec catalog_properties_output = {
  custom_properties : parameters_map option;
      [@ocaml.doc
        "Additional key-value properties for the catalog, such as column statistics optimizations.\n"]
  iceberg_optimization_properties : iceberg_optimization_properties_output option;
      [@ocaml.doc
        "An [IcebergOptimizationPropertiesOutput] object that specifies Iceberg table optimization \
         settings for the catalog, including configurations for compaction, retention, and orphan \
         file deletion operations.\n"]
  data_lake_access_properties : data_lake_access_properties_output option;
      [@ocaml.doc
        "A [DataLakeAccessProperties] object with input properties to configure data lake access \
         for your catalog resource in the Glue Data Catalog.\n"]
}
[@@ocaml.doc
  "Property attributes that include configuration properties for the catalog resource.\n"]

type nonrec catalog = {
  allow_full_table_external_data_access : allow_full_table_external_data_access_enum option;
      [@ocaml.doc
        " Allows third-party engines to access data in Amazon S3 locations that are registered \
         with Lake Formation. \n"]
  create_database_default_permissions : principal_permissions_list option;
      [@ocaml.doc
        "An array of [PrincipalPermissions] objects. Creates a set of default permissions on the \
         database(s) for principals. Used by Amazon Web Services Lake Formation. Not used in the \
         normal course of Glue operations.\n"]
  create_table_default_permissions : principal_permissions_list option;
      [@ocaml.doc
        "An array of [PrincipalPermissions] objects. Creates a set of default permissions on the \
         table(s) for principals. Used by Amazon Web Services Lake Formation. Not used in the \
         normal course of Glue operations.\n"]
  catalog_properties : catalog_properties_output option;
      [@ocaml.doc
        "A [CatalogProperties] object that specifies data lake access properties and other custom \
         properties.\n"]
  federated_catalog : federated_catalog option;
      [@ocaml.doc
        "A [FederatedCatalog] object that points to an entity outside the Glue Data Catalog.\n"]
  target_redshift_catalog : target_redshift_catalog option;
      [@ocaml.doc
        "A [TargetRedshiftCatalog] object that describes a target catalog for database resource \
         linking.\n"]
  update_time : timestamp option; [@ocaml.doc "The time at which the catalog was last updated.\n"]
  create_time : timestamp option; [@ocaml.doc "The time at which the catalog was created.\n"]
  parameters : parameters_map option;
      [@ocaml.doc
        " A map array of key-value pairs that define parameters and properties of the catalog.\n"]
  description : description_string option;
      [@ocaml.doc
        "Description string, not more than 2048 bytes long, matching the URI address multi-line \
         string pattern. A description of the catalog.\n"]
  resource_arn : resource_arn_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) assigned to the catalog resource.\n"]
  name : catalog_name_string;
      [@ocaml.doc "The name of the catalog. Cannot be the same as the account ID.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the catalog. To grant access to the default catalog, this field should not be \
         provided.\n"]
}
[@@ocaml.doc
  "The catalog object represents a logical grouping of databases in the Glue Data Catalog or a \
   federated source. You can now create a Redshift-federated catalog or a catalog containing \
   resource links to Redshift databases in another account or region.\n"]

type nonrec catalog_list = catalog list [@@ocaml.doc ""]

type nonrec get_catalogs_response = {
  next_token : token option;
      [@ocaml.doc
        "A continuation token for paginating the returned list of tokens, returned if the current \
         segment of the list is not the last.\n"]
  catalog_list : catalog_list;
      [@ocaml.doc
        "An array of [Catalog] objects. A list of [Catalog] objects from the specified parent \
         catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec get_catalogs_request = {
  has_databases : nullable_boolean option;
      [@ocaml.doc
        "When [true], the response only includes catalogs that can contain databases. Some \
         catalogs are organizational containers that hold only other catalogs, not databases. When \
         this parameter is set to [true], those container-only catalogs are excluded, and only \
         catalogs capable of containing databases are returned. Defaults to [false].\n"]
  include_root : nullable_boolean option;
      [@ocaml.doc
        "Whether to list the default catalog in the account and region in the response. Defaults \
         to [false]. When [true] and [ParentCatalogId = NULL | Amazon Web Services Account ID], \
         all catalogs and the default catalog are enumerated in the response.\n\n\
        \ When the [ParentCatalogId] is not equal to null, and this attribute is passed as [false] \
         or [true], an [InvalidInputException] is thrown.\n\
        \ "]
  recursive : boolean_ option;
      [@ocaml.doc
        "Whether to list all catalogs across the catalog hierarchy, starting from the \
         [ParentCatalogId]. Defaults to [false] . When [true], all catalog objects in the \
         [ParentCatalogID] hierarchy are enumerated in the response.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of catalogs to return in one response.\n"]
  next_token : token option; [@ocaml.doc "A continuation token, if this is a continuation call.\n"]
  parent_catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the parent catalog in which the catalog resides. If none is provided, the \
         Amazon Web Services Account Number is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec get_catalog_response = {
  catalog : catalog option;
      [@ocaml.doc
        "A [Catalog] object. The definition of the specified catalog in the Glue Data Catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec get_catalog_request = {
  catalog_id : catalog_id_string;
      [@ocaml.doc
        "The ID of the parent catalog in which the catalog resides. If none is provided, the \
         Amazon Web Services Account Number is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_import_status = {
  imported_by : name_string option;
      [@ocaml.doc "The name of the person who initiated the migration.\n"]
  import_time : timestamp option; [@ocaml.doc "The time that the migration was started.\n"]
  import_completed : boolean_ option;
      [@ocaml.doc " [True] if the migration has completed, or [False] otherwise.\n"]
}
[@@ocaml.doc "A structure containing migration status information.\n"]

type nonrec get_catalog_import_status_response = {
  import_status : catalog_import_status option;
      [@ocaml.doc "The status of the specified catalog migration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_catalog_import_status_request = {
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the catalog to migrate. Currently, this should be the Amazon Web Services \
         account ID.\n"]
}
[@@ocaml.doc ""]

type nonrec blueprint_run_state =
  | ROLLING_BACK [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec blueprint_run = {
  role_arn : orchestration_iam_role_arn option;
      [@ocaml.doc
        "The role ARN. This role will be assumed by the Glue service and will be used to create \
         the workflow and other entities of a workflow.\n"]
  parameters : blueprint_parameters option;
      [@ocaml.doc
        "The blueprint parameters as a string. You will have to provide a value for each key that \
         is required from the parameter spec that is defined in the [Blueprint$ParameterSpec].\n"]
  rollback_error_message : message_string option;
      [@ocaml.doc
        "If there are any errors while creating the entities of a workflow, we try to roll back \
         the created entities until that point and delete them. This attribute indicates the \
         errors seen while trying to delete the entities that are created.\n"]
  error_message : message_string option;
      [@ocaml.doc "Indicates any errors that are seen while running the blueprint.\n"]
  completed_on : timestamp_value option;
      [@ocaml.doc "The date and time that the blueprint run completed.\n"]
  started_on : timestamp_value option;
      [@ocaml.doc "The date and time that the blueprint run started.\n"]
  state : blueprint_run_state option;
      [@ocaml.doc
        "The state of the blueprint run. Possible values are:\n\n\
        \ {ul\n\
        \       {-  Running \226\128\148 The blueprint run is in progress.\n\
        \           \n\
        \            }\n\
        \       {-  Succeeded \226\128\148 The blueprint run completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-  Failed \226\128\148 The blueprint run failed and rollback is complete.\n\
        \           \n\
        \            }\n\
        \       {-  Rolling Back \226\128\148 The blueprint run failed and rollback is in progress.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  workflow_name : name_string option;
      [@ocaml.doc
        "The name of a workflow that is created as a result of a successful blueprint run. If a \
         blueprint run has an error, there will not be a workflow created.\n"]
  run_id : id_string option; [@ocaml.doc "The run ID for this blueprint run.\n"]
  blueprint_name : orchestration_name_string option; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc "The details of a blueprint run.\n"]

type nonrec blueprint_runs = blueprint_run list [@@ocaml.doc ""]

type nonrec get_blueprint_runs_response = {
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if not all blueprint runs have been returned.\n"]
  blueprint_runs : blueprint_runs option; [@ocaml.doc "Returns a list of [BlueprintRun] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec get_blueprint_runs_request = {
  max_results : page_size option; [@ocaml.doc "The maximum size of a list to return.\n"]
  next_token : generic_string option;
      [@ocaml.doc "A continuation token, if this is a continuation request.\n"]
  blueprint_name : name_string; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc ""]

type nonrec get_blueprint_run_response = {
  blueprint_run : blueprint_run option; [@ocaml.doc "Returns a [BlueprintRun] object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_blueprint_run_request = {
  run_id : id_string; [@ocaml.doc "The run ID for the blueprint run you want to retrieve.\n"]
  blueprint_name : orchestration_name_string; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc ""]

type nonrec blueprint_status =
  | FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec blueprint = {
  last_active_definition : last_active_definition option;
      [@ocaml.doc
        "When there are multiple versions of a blueprint and the latest version has some errors, \
         this attribute indicates the last successful blueprint definition that is available with \
         the service.\n"]
  error_message : error_string option; [@ocaml.doc "An error message.\n"]
  status : blueprint_status option;
      [@ocaml.doc
        "The status of the blueprint registration.\n\n\
        \ {ul\n\
        \       {-  Creating \226\128\148 The blueprint registration is in progress.\n\
        \           \n\
        \            }\n\
        \       {-  Active \226\128\148 The blueprint has been successfully registered.\n\
        \           \n\
        \            }\n\
        \       {-  Updating \226\128\148 An update to the blueprint registration is in progress.\n\
        \           \n\
        \            }\n\
        \       {-  Failed \226\128\148 The blueprint registration failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  blueprint_service_location : generic_string option;
      [@ocaml.doc
        "Specifies a path in Amazon S3 where the blueprint is copied when you call \
         [CreateBlueprint/UpdateBlueprint] to register the blueprint in Glue.\n"]
  blueprint_location : generic_string option;
      [@ocaml.doc "Specifies the path in Amazon S3 where the blueprint is published.\n"]
  parameter_spec : blueprint_parameter_spec option;
      [@ocaml.doc
        "A JSON string that indicates the list of parameter specifications for the blueprint.\n"]
  last_modified_on : timestamp_value option;
      [@ocaml.doc "The date and time the blueprint was last modified.\n"]
  created_on : timestamp_value option;
      [@ocaml.doc "The date and time the blueprint was registered.\n"]
  description : generic512_char_string option; [@ocaml.doc "The description of the blueprint.\n"]
  name : orchestration_name_string option; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc "The details of a blueprint.\n"]

type nonrec get_blueprint_response = {
  blueprint : blueprint option; [@ocaml.doc "Returns a [Blueprint] object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_blueprint_request = {
  include_parameter_spec : nullable_boolean option;
      [@ocaml.doc "Specifies whether or not to include the parameter specification.\n"]
  include_blueprint : nullable_boolean option;
      [@ocaml.doc "Specifies whether or not to include the blueprint in the response.\n"]
  name : name_string; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc ""]

type nonrec get_asset_type_response = {
  forms : asset_type_forms_map option;
      [@ocaml.doc "The forms that make up the asset type, keyed by form name.\n"]
  name : asset_type_name option; [@ocaml.doc "The name of the asset type.\n"]
  id : asset_type_id option; [@ocaml.doc "The identifier of the asset type.\n"]
}
[@@ocaml.doc ""]

type nonrec get_asset_type_request = {
  identifier : asset_type_id; [@ocaml.doc "The identifier of the asset type to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_asset_output = {
  iterable_forms : iterable_form_map option;
      [@ocaml.doc
        "The iterable forms available on the asset, keyed by form name (for example, [columns]). \
         Use the form name with [ListIterableForms] or [BatchGetIterableForms] to retrieve the \
         form's items.\n"]
  attachments : asset_form_map option;
      [@ocaml.doc
        "Additional attachments on the asset for more context, keyed by attachment name.\n"]
  forms : asset_form_map option; [@ocaml.doc "The forms on the asset, keyed by form name.\n"]
  glossary_terms : glossary_term_id_list option;
      [@ocaml.doc "The identifiers of the glossary terms associated with the asset.\n"]
  asset_type_id : asset_type_id; [@ocaml.doc "The identifier of the asset type for this asset.\n"]
  updated_at : updated_at option;
      [@ocaml.doc "The timestamp at which the asset was last updated.\n"]
  created_at : created_at option; [@ocaml.doc "The timestamp at which the asset was created.\n"]
  description : asset_description option; [@ocaml.doc "The description of the asset.\n"]
  name : asset_name option; [@ocaml.doc "The name of the asset.\n"]
  id : asset_id; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec get_asset_input = {
  identifier : asset_id; [@ocaml.doc "The unique identifier of the asset to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec field_label = string [@@ocaml.doc ""]

type nonrec field_description = string [@@ocaml.doc ""]

type nonrec field_filter_operator =
  | ORDER_BY [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | LESS_THAN_OR_EQUAL_TO [@ocaml.doc ""]
  | GREATER_THAN_OR_EQUAL_TO [@ocaml.doc ""]
  | NOT_EQUAL_TO [@ocaml.doc ""]
  | EQUAL_TO [@ocaml.doc ""]
  | BETWEEN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_filter_operators_list = field_filter_operator list [@@ocaml.doc ""]

type nonrec field = {
  custom_properties : custom_properties option;
      [@ocaml.doc "Optional map of keys which may be returned.\n"]
  native_data_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The data type returned by the SaaS API, such as \226\128\156picklist\226\128\157 or \
         \226\128\156textarea\226\128\157 from Salesforce.\n"]
  parent_field : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A parent field name for a nested field.\n"]
  supported_filter_operators : field_filter_operators_list option;
      [@ocaml.doc "Indicates the support filter operators for this field.\n"]
  supported_values : list_of_string option;
      [@ocaml.doc "A list of supported values for the field.\n"]
  is_default_on_create : bool_ option;
      [@ocaml.doc
        "Indicates whether this field is populated automatically when the object is created, such \
         as a created at timestamp.\n"]
  is_upsertable : bool_ option;
      [@ocaml.doc "Indicates whether this field can be upserted as part of a destination write.\n"]
  is_updateable : bool_ option;
      [@ocaml.doc "Indicates whether this field can be updated as part of a destination write.\n"]
  is_createable : bool_ option;
      [@ocaml.doc "Indicates whether this field can be created as part of a destination write.\n"]
  is_partitionable : bool_ option;
      [@ocaml.doc
        "Indicates whether a given field can be used in partitioning the query made to SaaS.\n"]
  is_filterable : bool_ option;
      [@ocaml.doc
        " Indicates whether this field can used in a filter clause ([WHERE] clause) of a SQL \
         statement when querying data. \n"]
  is_retrievable : bool_ option;
      [@ocaml.doc
        "Indicates whether this field can be added in Select clause of SQL query or whether it is \
         retrievable or not.\n"]
  is_nullable : bool_ option; [@ocaml.doc "Indicates whether this field can be nullable or not.\n"]
  is_primary_key : bool_ option;
      [@ocaml.doc "Indicates whether this field can used as a primary key for the given entity.\n"]
  field_type : field_data_type option; [@ocaml.doc "The type of data in the field.\n"]
  description : field_description option; [@ocaml.doc "A description of the field.\n"]
  label : field_label option; [@ocaml.doc "A readable label used for the field.\n"]
  field_name : entity_field_name option; [@ocaml.doc "A unique identifier for the field.\n"]
}
[@@ocaml.doc
  "The [Field] object has information about the different properties associated with a field in \
   the connector.\n"]

type nonrec fields_list = field list [@@ocaml.doc ""]

type nonrec federated_resource_already_exists_exception = {
  associated_glue_resource : glue_resource_arn option;
      [@ocaml.doc "The associated Glue resource already exists.\n"]
  message : message_string option; [@ocaml.doc "The message describing the problem.\n"]
}
[@@ocaml.doc "A federated resource already exists.\n"]

type nonrec error_by_name = (name_string * error_detail) list [@@ocaml.doc ""]

type nonrec disassociate_glossary_terms_response = {
  glossary_terms : glossary_term_id_list option;
      [@ocaml.doc "The remaining glossary terms associated with the asset.\n"]
  asset_identifier : asset_id option; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_glossary_terms_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  glossary_term_identifiers : glossary_term_id_list;
      [@ocaml.doc "The list of glossary term identifiers to disassociate from the asset.\n"]
  asset_identifier : asset_id;
      [@ocaml.doc "The unique identifier of the asset to disassociate glossary terms from.\n"]
}
[@@ocaml.doc ""]

type nonrec dev_endpoint_names = generic_string list [@@ocaml.doc ""]

type nonrec describe_integrations_response = {
  marker : string128 option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request.\n"]
  integrations : integrations_list option; [@ocaml.doc "A list of zero-ETL integrations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_integrations_request = {
  filters : integration_filter_list option;
      [@ocaml.doc
        "A list of key and values, to filter down the results. Supported keys are \"Status\", \
         \"IntegrationName\", and \"SourceArn\". IntegrationName is limited to only one value.\n"]
  max_records : integration_integer option;
      [@ocaml.doc "The total number of items to return in the output.\n"]
  marker : string128 option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request.\n"]
  integration_identifier : string128 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_inbound_integrations_response = {
  marker : string128 option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request.\n"]
  inbound_integrations : inbound_integrations_list option;
      [@ocaml.doc "A list of inbound integrations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_inbound_integrations_request = {
  target_arn : string512 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target resource in the integration.\n"]
  max_records : integration_integer option;
      [@ocaml.doc "The total number of items to return in the output.\n"]
  marker : string128 option;
      [@ocaml.doc
        "A token to specify where to start paginating. This is the marker from a previously \
         truncated response.\n"]
  integration_arn : string128 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entity_response = {
  next_token : next_token option;
      [@ocaml.doc "A continuation token, present if the current segment is not the last.\n"]
  fields : fields_list option;
      [@ocaml.doc
        "Describes the fields for that connector entity. This is the list of [Field] objects. \
         [Field] is very similar to column in a database. The [Field] object has information about \
         different properties associated with fields in the connector.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entity_request = {
  data_store_api_version : api_version option;
      [@ocaml.doc "The version of the API used for the data store.\n"]
  next_token : next_token option;
      [@ocaml.doc "A continuation token, included if this is a continuation call.\n"]
  entity_name : entity_name;
      [@ocaml.doc "The name of the entity that you want to describe from the connection type.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The catalog ID of the catalog that contains the connection. This can be null, By default, \
         the Amazon Web Services Account ID is the catalog ID.\n"]
  connection_name : name_string;
      [@ocaml.doc "The name of the connection that contains the connection type credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec auth_configuration = {
  custom_authentication_properties : properties_map option;
      [@ocaml.doc
        "A map of key-value pairs for the custom authentication properties. Each value is a a \
         [Property] object.\n"]
  basic_authentication_properties : properties_map option;
      [@ocaml.doc
        "A map of key-value pairs for the OAuth2 properties. Each value is a a [Property] object.\n"]
  o_auth2_properties : properties_map option;
      [@ocaml.doc
        "A map of key-value pairs for the OAuth2 properties. Each value is a a [Property] object.\n"]
  secret_arn : property option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the Secrets Manager.\n"]
  authentication_type : property; [@ocaml.doc "The type of authentication for a connection.\n"]
}
[@@ocaml.doc
  "The authentication configuration for a connection returned by the [DescribeConnectionType] API.\n"]

type nonrec compute_environment_name = string [@@ocaml.doc ""]

type nonrec compute_environment_configuration_description_string = string [@@ocaml.doc ""]

type nonrec compute_environment_configuration = {
  physical_connection_properties_required : bool_ option;
      [@ocaml.doc
        "Indicates whether [PhysicalConnectionProperties] are required for the compute environment.\n"]
  connection_properties_required_overrides : list_of_string;
      [@ocaml.doc
        "The connection properties that are required as overrides for the compute environment.\n"]
  connection_option_name_overrides : property_name_overrides;
      [@ocaml.doc "The connection option name overrides for the compute environment.\n"]
  connection_property_name_overrides : property_name_overrides;
      [@ocaml.doc "The connection property name overrides for the compute environment.\n"]
  connection_options : properties_map;
      [@ocaml.doc "The parameters used as connection options for the compute environment.\n"]
  supported_authentication_types : authentication_types;
      [@ocaml.doc "The supported authentication types for the compute environment.\n"]
  compute_environment : compute_environment; [@ocaml.doc "The type of compute environment.\n"]
  description : compute_environment_configuration_description_string;
      [@ocaml.doc "A description of the compute environment.\n"]
  name : compute_environment_name; [@ocaml.doc "A name for the compute environment configuration.\n"]
}
[@@ocaml.doc
  "An object containing configuration for a compute environment (such as Spark, Python or Athena) \
   returned by the [DescribeConnectionType] API.\n"]

type nonrec compute_environment_configuration_map =
  (compute_environment_name * compute_environment_configuration) list
[@@ocaml.doc ""]

type nonrec describe_connection_type_response = {
  rest_configuration : rest_configuration option;
      [@ocaml.doc
        "HTTP request and response configuration, validation endpoint, and entity configurations \
         for REST based data source.\n"]
  spark_connection_properties : properties_map option;
      [@ocaml.doc "Connection properties specific to the Spark compute environment.\n"]
  python_connection_properties : properties_map option;
      [@ocaml.doc "Connection properties specific to the Python compute environment.\n"]
  athena_connection_properties : properties_map option;
      [@ocaml.doc "Connection properties specific to the Athena compute environment.\n"]
  physical_connection_requirements : properties_map option;
      [@ocaml.doc
        "Physical requirements for a connection, such as VPC, Subnet and Security Group \
         specifications.\n"]
  compute_environment_configurations : compute_environment_configuration_map option;
      [@ocaml.doc "The compute environments that are supported by the connection.\n"]
  authentication_configuration : auth_configuration option;
      [@ocaml.doc "The type of authentication used for the connection.\n"]
  connection_options : properties_map option;
      [@ocaml.doc
        "Returns properties that can be set when creating a connection in the \
         [ConnectionInput.ConnectionProperties]. [ConnectionOptions] defines parameters that can \
         be set in a Spark ETL script in the connection options map passed to a dataframe.\n"]
  connection_properties : properties_map option;
      [@ocaml.doc "Connection properties which are common across compute environments.\n"]
  capabilities : capabilities option;
      [@ocaml.doc
        "The supported authentication types, data interface types (compute environments), and data \
         operations of the connector.\n"]
  description : description option; [@ocaml.doc "A description of the connection type.\n"]
  connection_type : name_string option; [@ocaml.doc "The name of the connection type.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_type_request = {
  connection_type : name_string; [@ocaml.doc "The name of the connection type to be described.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workflow_response = {
  name : name_string option; [@ocaml.doc "Name of the workflow specified in input.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workflow_request = {
  name : name_string; [@ocaml.doc "Name of the workflow to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_defined_function_response = unit [@@ocaml.doc ""]

type nonrec delete_user_defined_function_request = {
  function_name : name_string; [@ocaml.doc "The name of the function definition to be deleted.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the function is located.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the function to be deleted is located. If none is \
         supplied, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_usage_profile_response = unit [@@ocaml.doc ""]

type nonrec delete_usage_profile_request = {
  name : name_string; [@ocaml.doc "The name of the usage profile to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_trigger_response = {
  name : name_string option; [@ocaml.doc "The name of the trigger that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_trigger_request = {
  name : name_string; [@ocaml.doc "The name of the trigger to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_table_version_response = unit [@@ocaml.doc ""]

type nonrec delete_table_version_request = {
  version_id : version_string;
      [@ocaml.doc
        "The ID of the table version to be deleted. A [VersionID] is a string representation of an \
         integer. Each version is incremented by 1.\n"]
  table_name : name_string;
      [@ocaml.doc
        "The name of the table. For Hive compatibility, this name is entirely lowercase.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The database in the catalog in which the table resides. For Hive compatibility, this name \
         is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the tables reside. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_table_response = unit [@@ocaml.doc ""]

type nonrec delete_table_request = {
  transaction_id : transaction_id_string option;
      [@ocaml.doc "The transaction ID at which to delete the table contents.\n"]
  name : name_string;
      [@ocaml.doc
        "The name of the table to be deleted. For Hive compatibility, this name is entirely \
         lowercase.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The name of the catalog database in which the table resides. For Hive compatibility, this \
         name is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_table_optimizer_response = unit [@@ocaml.doc ""]

type nonrec delete_table_optimizer_request = {
  type_ : table_optimizer_type; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_session_response = {
  id : name_string option; [@ocaml.doc "Returns the ID of the deleted session.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_session_request = {
  request_origin : orchestration_name_string option;
      [@ocaml.doc "The name of the origin of the delete session request.\n"]
  id : name_string; [@ocaml.doc "The ID of the session to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_security_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_security_configuration_request = {
  name : name_string; [@ocaml.doc "The name of the security configuration to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_schema_versions_response = {
  schema_version_errors : schema_version_error_list option;
      [@ocaml.doc
        "A list of [SchemaVersionErrorItem] objects, each containing an error and schema version.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_schema_versions_input = {
  versions : versions_string;
      [@ocaml.doc
        "A version range may be supplied which may be of the format:\n\n\
        \ {ul\n\
        \       {-  a single version number, 5\n\
        \           \n\
        \            }\n\
        \       {-  a range, 5-8 : deletes versions 5, 6, 7, 8\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure that may contain the schema name and Amazon Resource Name \
         (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_schema_response = {
  status : schema_status option; [@ocaml.doc "The status of the schema.\n"]
  schema_name : schema_registry_name_string option;
      [@ocaml.doc "The name of the schema being deleted.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_schema_input = {
  schema_id : schema_id;
      [@ocaml.doc
        "This is a wrapper structure that may contain the schema name and Amazon Resource Name \
         (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  resource_arn : glue_resource_arn option;
      [@ocaml.doc "The ARN of the Glue resource for the resource policy to be deleted.\n"]
  policy_hash_condition : hash_string option;
      [@ocaml.doc "The hash value returned when this policy was set.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registry_response = {
  status : registry_status option;
      [@ocaml.doc
        "The status of the registry. A successful operation will return the [Deleting] status.\n"]
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the registry being deleted.\n"]
  registry_name : schema_registry_name_string option;
      [@ocaml.doc "The name of the registry being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registry_input = {
  registry_id : registry_id;
      [@ocaml.doc
        "This is a wrapper structure that may contain the registry name and Amazon Resource Name \
         (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_partition_response = unit [@@ocaml.doc ""]

type nonrec delete_partition_request = {
  partition_values : value_string_list; [@ocaml.doc "The values that define the partition.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the table that contains the partition to be deleted.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database in which the table in question resides.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partition to be deleted resides. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_partition_index_response = unit [@@ocaml.doc ""]

type nonrec delete_partition_index_request = {
  index_name : name_string; [@ocaml.doc "The name of the partition index to be deleted.\n"]
  table_name : name_string;
      [@ocaml.doc
        "Specifies the name of a table from which you want to delete a partition index.\n"]
  database_name : name_string;
      [@ocaml.doc
        "Specifies the name of a database from which you want to delete a partition index.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The catalog ID where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_ml_transform_response = {
  transform_id : hash_string option;
      [@ocaml.doc "The unique identifier of the transform that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_ml_transform_request = {
  transform_id : hash_string; [@ocaml.doc "The unique identifier of the transform to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_job_response = {
  job_name : name_string option; [@ocaml.doc "The name of the job definition that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_job_request = {
  job_name : name_string; [@ocaml.doc "The name of the job definition to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_integration_table_properties_response = unit [@@ocaml.doc ""]

type nonrec delete_integration_table_properties_request = {
  table_name : string128; [@ocaml.doc "The name of the table to be replicated.\n"]
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_integration_response = {
  data_filter : string2048 option;
      [@ocaml.doc "Selects source tables for the integration using Maxwell filter syntax.\n"]
  errors : integration_error_list option;
      [@ocaml.doc "A list of errors associated with the integration.\n"]
  create_time : integration_timestamp;
      [@ocaml.doc "The time when the integration was created, in UTC.\n"]
  status : integration_status;
      [@ocaml.doc
        "The status of the integration being deleted.\n\n\
        \ The possible statuses are:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATING: The integration is being created.\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE: The integration creation succeeds.\n\
        \            \n\
        \             }\n\
        \        {-  MODIFYING: The integration is being modified.\n\
        \            \n\
        \             }\n\
        \        {-  FAILED: The integration creation fails. \n\
        \            \n\
        \             }\n\
        \        {-  DELETING: The integration is deleted.\n\
        \            \n\
        \             }\n\
        \        {-  SYNCING: The integration is synchronizing.\n\
        \            \n\
        \             }\n\
        \        {-  NEEDS_ATTENTION: The integration needs attention, such as synchronization.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tags : integration_tags_list option;
      [@ocaml.doc "Metadata assigned to the resource consisting of a list of key-value pairs.\n"]
  additional_encryption_context : integration_additional_encryption_context_map option;
      [@ocaml.doc
        "An optional set of non-secret key\226\128\147value pairs that contains additional \
         contextual information for encryption.\n"]
  kms_key_id : string2048 option;
      [@ocaml.doc "The ARN of a KMS key used for encrypting the channel.\n"]
  integration_arn : string128; [@ocaml.doc "The Amazon Resource Name (ARN) for the integration.\n"]
  description : integration_description option; [@ocaml.doc "A description of the integration.\n"]
  integration_name : string128; [@ocaml.doc "A unique name for an integration in Glue.\n"]
  target_arn : string512; [@ocaml.doc "The ARN of the target for the integration.\n"]
  source_arn : string512; [@ocaml.doc "The ARN of the source for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_integration_resource_property_response = unit [@@ocaml.doc ""]

type nonrec delete_integration_resource_property_request = {
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_integration_request = {
  integration_identifier : string128;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_glue_identity_center_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_glue_identity_center_configuration_request = unit [@@ocaml.doc ""]

type nonrec delete_glossary_term_response = unit [@@ocaml.doc ""]

type nonrec delete_glossary_term_request = {
  identifier : glossary_term_id;
      [@ocaml.doc "The unique identifier of the glossary term to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_glossary_response = unit [@@ocaml.doc ""]

type nonrec delete_glossary_request = {
  identifier : glossary_id; [@ocaml.doc "The unique identifier of the glossary to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_form_type_response = unit [@@ocaml.doc ""]

type nonrec delete_form_type_request = {
  identifier : form_type_id; [@ocaml.doc "The identifier of the form type to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dev_endpoint_response = unit [@@ocaml.doc ""]

type nonrec delete_dev_endpoint_request = {
  endpoint_name : generic_string; [@ocaml.doc "The name of the [DevEndpoint].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_database_response = unit [@@ocaml.doc ""]

type nonrec delete_database_request = {
  name : name_string;
      [@ocaml.doc
        "The name of the database to delete. For Hive compatibility, this must be all lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the database resides. If none is provided, the Amazon \
         Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_quality_ruleset_response = unit [@@ocaml.doc ""]

type nonrec delete_data_quality_ruleset_request = {
  name : name_string; [@ocaml.doc "A name for the data quality ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_custom_entity_type_response = {
  name : name_string option; [@ocaml.doc "The name of the custom pattern you deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_custom_entity_type_request = {
  name : name_string; [@ocaml.doc "The name of the custom pattern that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_crawler_response = unit [@@ocaml.doc ""]

type nonrec delete_crawler_request = {
  name : name_string; [@ocaml.doc "The name of the crawler to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_type_response = unit [@@ocaml.doc ""]

type nonrec delete_connection_type_request = {
  connection_type : name_string;
      [@ocaml.doc
        "The name of the connection type to delete. Must reference an existing registered \
         connection type.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_response = unit [@@ocaml.doc ""]

type nonrec delete_connection_request = {
  connection_name : name_string; [@ocaml.doc "The name of the connection to delete.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the connection resides. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_name_list = name_string list [@@ocaml.doc ""]

type nonrec delete_column_statistics_task_settings_response = unit [@@ocaml.doc ""]

type nonrec delete_column_statistics_task_settings_request = {
  table_name : name_string;
      [@ocaml.doc "The name of the table for which to delete column statistics.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_column_statistics_for_table_response = unit [@@ocaml.doc ""]

type nonrec delete_column_statistics_for_table_request = {
  column_name : name_string; [@ocaml.doc "The name of the column.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_column_statistics_for_partition_response = unit [@@ocaml.doc ""]

type nonrec delete_column_statistics_for_partition_request = {
  column_name : name_string; [@ocaml.doc "Name of the column.\n"]
  partition_values : value_string_list;
      [@ocaml.doc "A list of partition values identifying the partition.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_classifier_response = unit [@@ocaml.doc ""]

type nonrec delete_classifier_request = {
  name : name_string; [@ocaml.doc "Name of the classifier to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_catalog_response = unit [@@ocaml.doc ""]

type nonrec delete_catalog_request = {
  catalog_id : catalog_id_string; [@ocaml.doc "The ID of the catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_blueprint_response = {
  name : name_string option; [@ocaml.doc "Returns the name of the blueprint that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_blueprint_request = {
  name : name_string; [@ocaml.doc "The name of the blueprint to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_attachment_response = {
  asset_identifier : asset_id option; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_attachment_request = {
  attachment_name : attachment_name; [@ocaml.doc "The name of the attachment to delete.\n"]
  item_identifier : item_identifier option;
      [@ocaml.doc
        "The identifier of the item within the iterable form. Required when [iterableFormName] is \
         specified.\n"]
  iterable_form_name : iterable_form_name option;
      [@ocaml.doc
        "The name of the iterable form. When specified along with [itemIdentifier], the attachment \
         is deleted from an item within the iterable form rather than from the asset itself.\n"]
  asset_identifier : asset_id;
      [@ocaml.doc "The unique identifier of the asset from which to delete the attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_asset_type_response = unit [@@ocaml.doc ""]

type nonrec delete_asset_type_request = {
  identifier : asset_type_id; [@ocaml.doc "The identifier of the asset type to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_asset_response = unit [@@ocaml.doc ""]

type nonrec delete_asset_request = {
  identifier : asset_id; [@ocaml.doc "The unique identifier of the asset to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_result = {
  aggregated_metrics : data_quality_aggregated_metrics option;
      [@ocaml.doc
        " A summary of [DataQualityAggregatedMetrics] objects showing the total counts of \
         processed rows and rules, including their pass/fail statistics based on row-level \
         results. \n"]
  observations : data_quality_observations option;
      [@ocaml.doc
        "A list of [DataQualityObservation] objects representing the observations generated after \
         evaluating the rules and analyzers. \n"]
  analyzer_results : data_quality_analyzer_results option;
      [@ocaml.doc
        "A list of [DataQualityAnalyzerResult] objects representing the results for each analyzer. \n"]
  rule_results : data_quality_rule_results option;
      [@ocaml.doc
        "A list of [DataQualityRuleResult] objects representing the results for each rule. \n"]
  ruleset_evaluation_run_id : hash_string option;
      [@ocaml.doc "The unique run ID for the ruleset evaluation for this data quality result.\n"]
  job_run_id : hash_string option;
      [@ocaml.doc "The job run ID associated with the data quality result, if any.\n"]
  job_name : name_string option;
      [@ocaml.doc "The job name associated with the data quality result, if any.\n"]
  completed_on : timestamp option;
      [@ocaml.doc "The date and time when this data quality run completed.\n"]
  started_on : timestamp option;
      [@ocaml.doc "The date and time when this data quality run started.\n"]
  evaluation_context : generic_string option;
      [@ocaml.doc
        "In the context of a job in Glue Studio, each node in the canvas is typically assigned \
         some sort of name and data quality nodes will have names. In the case of multiple nodes, \
         the [evaluationContext] can differentiate the nodes.\n"]
  ruleset_name : name_string option;
      [@ocaml.doc "The name of the ruleset associated with the data quality result.\n"]
  data_source : data_source option;
      [@ocaml.doc "The table associated with the data quality result, if any.\n"]
  score : generic_bounded_double option;
      [@ocaml.doc
        "An aggregate data quality score. Represents the ratio of rules that passed to the total \
         number of rules.\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID for the data quality result.\n"]
  result_id : hash_string option; [@ocaml.doc "A unique result ID for the data quality result.\n"]
}
[@@ocaml.doc "Describes a data quality result.\n"]

type nonrec data_quality_results_list = data_quality_result list [@@ocaml.doc ""]

type nonrec data_quality_result_ids = hash_string list [@@ocaml.doc ""]

type nonrec custom_entity_type_names = name_string list [@@ocaml.doc ""]

type nonrec create_xml_classifier_request = {
  row_tag : row_tag option;
      [@ocaml.doc
        "The XML tag designating the element that contains each record in an XML document being \
         parsed. This can't identify a self-closing element (closed by [/>]). An empty row element \
         that contains only attributes can be parsed as long as it ends with a closing tag (for \
         example, \n\
         {[\n\n\
         ]}\n\
        \ is okay, but \n\
         {[\n\n\
         ]}\n\
        \ is not).\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
  classification : classification;
      [@ocaml.doc "An identifier of the data format that the classifier matches.\n"]
}
[@@ocaml.doc "Specifies an XML classifier for [CreateClassifier] to create.\n"]

type nonrec create_workflow_response = {
  name : name_string option;
      [@ocaml.doc "The name of the workflow which was provided as part of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workflow_request = {
  max_concurrent_runs : nullable_integer option;
      [@ocaml.doc
        "You can use this parameter to prevent unwanted multiple updates to data, to control \
         costs, or in some cases, to prevent exceeding the maximum number of concurrent runs of \
         any of the component jobs. If you leave this parameter blank, there is no limit to the \
         number of concurrent workflow runs.\n"]
  tags : tags_map option; [@ocaml.doc "The tags to be used with this workflow.\n"]
  default_run_properties : workflow_run_properties option;
      [@ocaml.doc
        "A collection of properties to be used as part of each execution of the workflow.\n\n\
        \ Run properties may be logged. Do not pass plaintext secrets as properties. Retrieve \
         secrets from a Glue Connection, Amazon Web Services Secrets Manager or other secret \
         management mechanism if you intend to use them within the workflow run.\n\
        \ "]
  description : workflow_description_string option; [@ocaml.doc "A description of the workflow.\n"]
  name : name_string;
      [@ocaml.doc
        "The name to be assigned to the workflow. It should be unique within your account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_defined_function_response = unit [@@ocaml.doc ""]

type nonrec create_user_defined_function_request = {
  function_input : user_defined_function_input;
      [@ocaml.doc
        "A [FunctionInput] object that defines the function to create in the Data Catalog.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database in which to create the function.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which to create the function. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec create_usage_profile_response = {
  name : name_string option; [@ocaml.doc "The name of the usage profile that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_usage_profile_request = {
  tags : tags_map option; [@ocaml.doc "A list of tags applied to the usage profile.\n"]
  configuration : profile_configuration;
      [@ocaml.doc
        "A [ProfileConfiguration] object specifying the job and session values for the profile.\n"]
  description : description_string option; [@ocaml.doc "A description of the usage profile.\n"]
  name : name_string; [@ocaml.doc "The name of the usage profile.\n"]
}
[@@ocaml.doc ""]

type nonrec create_trigger_response = {
  name : name_string option; [@ocaml.doc "The name of the trigger.\n"]
}
[@@ocaml.doc ""]

type nonrec create_trigger_request = {
  event_batching_condition : event_batching_condition option;
      [@ocaml.doc
        "Batch condition that must be met (specified number of events received or batch time \
         window expired) before EventBridge event trigger fires.\n"]
  tags : tags_map option;
      [@ocaml.doc
        "The tags to use with this trigger. You may use tags to limit access to the trigger. For \
         more information about tags in Glue, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags \
         in Glue} in the developer guide. \n"]
  start_on_creation : boolean_value option;
      [@ocaml.doc
        "Set to [true] to start [SCHEDULED] and [CONDITIONAL] triggers when created. True is not \
         supported for [ON_DEMAND] triggers.\n"]
  description : description_string option; [@ocaml.doc "A description of the new trigger.\n"]
  actions : action_list; [@ocaml.doc "The actions initiated by this trigger when it fires.\n"]
  predicate : predicate option;
      [@ocaml.doc
        "A predicate to specify when the new trigger should fire.\n\n\
        \ This field is required when the trigger type is [CONDITIONAL].\n\
        \ "]
  schedule : generic_string option;
      [@ocaml.doc
        "A [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n\n\
        \ This field is required when the trigger type is SCHEDULED.\n\
        \ "]
  type_ : trigger_type; [@ocaml.doc "The type of the new trigger.\n"]
  workflow_name : name_string option;
      [@ocaml.doc "The name of the workflow associated with the trigger.\n"]
  name : name_string; [@ocaml.doc "The name of the trigger.\n"]
}
[@@ocaml.doc ""]

type nonrec create_table_response = unit [@@ocaml.doc ""]

type nonrec create_table_request = {
  open_table_format_input : open_table_format_input option;
      [@ocaml.doc
        "Specifies an [OpenTableFormatInput] structure when creating an open format table.\n"]
  transaction_id : transaction_id_string option; [@ocaml.doc "The ID of the transaction.\n"]
  partition_indexes : partition_index_list option;
      [@ocaml.doc
        "A list of partition indexes, [PartitionIndex] structures, to create in the table.\n"]
  table_input : table_input option;
      [@ocaml.doc
        "The [TableInput] object that defines the metadata table to create in the catalog.\n"]
  name : name_string option;
      [@ocaml.doc
        "The unique identifier for the table within the specified database that will be created in \
         the Glue Data Catalog.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The catalog database in which to create the new table. For Hive compatibility, this name \
         is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which to create the [Table]. If none is supplied, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec create_table_optimizer_response = unit [@@ocaml.doc ""]

type nonrec create_table_optimizer_request = {
  table_optimizer_configuration : table_optimizer_configuration;
      [@ocaml.doc
        "A [TableOptimizerConfiguration] object representing the configuration of a table optimizer.\n"]
  type_ : table_optimizer_type; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec create_session_response = {
  session : session option; [@ocaml.doc "Returns the session object in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec create_session_request = {
  session_type : session_type option; [@ocaml.doc "The type of session to create.\n"]
  request_origin : orchestration_name_string option; [@ocaml.doc "The origin of the request. \n"]
  tags : tags_map option;
      [@ocaml.doc "The map of key value pairs (tags) belonging to the session.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "The Glue version determines the versions of Apache Spark and Python that Glue supports. \
         The GlueVersion must be greater than 2.0. \n"]
  security_configuration : name_string option;
      [@ocaml.doc "The name of the SecurityConfiguration structure to be used with the session \n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a job runs. Accepts a value of G.1X, \
         G.2X, G.4X, or G.8X for Spark jobs. Accepts the value Z.2X for Ray notebooks.\n\n\
        \ {ul\n\
        \       {-  For the [G.1X] worker type, each worker maps to 1 DPU (4 vCPUs, 16 GB of \
         memory) with 94GB disk, and provides 1 executor per worker. We recommend this worker type \
         for workloads such as data transforms, joins, and queries, to offers a scalable and cost \
         effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker maps to 2 DPU (8 vCPUs, 32 GB of \
         memory) with 138GB disk, and provides 1 executor per worker. We recommend this worker \
         type for workloads such as data transforms, joins, and queries, to offers a scalable and \
         cost effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.4X] worker type, each worker maps to 4 DPU (16 vCPUs, 64 GB of \
         memory) with 256GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs in the following Amazon Web Services Regions: US East (Ohio), US East (N. \
         Virginia), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia \
         Pacific (Tokyo), Canada (Central), Europe (Frankfurt), Europe (Ireland), and Europe \
         (Stockholm).\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.8X] worker type, each worker maps to 8 DPU (32 vCPUs, 128 GB of \
         memory) with 512GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs, in the same Amazon Web Services Regions as supported for the [G.4X] \
         worker type.\n\
        \           \n\
        \            }\n\
        \       {-  For the [Z.2X] worker type, each worker maps to 2 M-DPU (8vCPUs, 64 GB of \
         memory) with 128 GB disk, and provides up to 8 Ray workers based on the autoscaler.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  number_of_workers : nullable_integer option;
      [@ocaml.doc "The number of workers of a defined [WorkerType] to use for the session. \n"]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "The number of Glue data processing units (DPUs) that can be allocated when the job runs. \
         A DPU is a relative measure of processing power that consists of 4 vCPUs of compute \
         capacity and 16 GB memory. \n"]
  connections : connections_list option;
      [@ocaml.doc "The number of connections to use for the session. \n"]
  default_arguments : orchestration_arguments_map option;
      [@ocaml.doc "A map array of key-value pairs. Max is 75 pairs. \n"]
  idle_timeout : timeout option;
      [@ocaml.doc
        " The number of minutes when idle before session times out. Default for Spark ETL jobs is \
         value of Timeout. Consult the documentation for other job types. \n"]
  timeout : timeout option;
      [@ocaml.doc
        " The number of minutes before session times out. Default for Spark ETL jobs is 48 hours \
         (2880 minutes). Consult the documentation for other job types. \n"]
  command : session_command; [@ocaml.doc "The [SessionCommand] that runs the job. \n"]
  role : orchestration_role_arn; [@ocaml.doc "The IAM Role ARN \n"]
  description : description_string option; [@ocaml.doc "The description of the session. \n"]
  id : name_string; [@ocaml.doc "The ID of the session request. \n"]
}
[@@ocaml.doc "Request to create a new session.\n"]

type nonrec create_security_configuration_response = {
  created_timestamp : timestamp_value option;
      [@ocaml.doc "The time at which the new security configuration was created.\n"]
  name : name_string option; [@ocaml.doc "The name assigned to the new security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_security_configuration_request = {
  encryption_configuration : encryption_configuration;
      [@ocaml.doc "The encryption configuration for the new security configuration.\n"]
  name : name_string; [@ocaml.doc "The name for the new security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_script_response = {
  scala_code : scala_code option; [@ocaml.doc "The Scala code generated from the DAG.\n"]
  python_script : python_script option; [@ocaml.doc "The Python script generated from the DAG.\n"]
}
[@@ocaml.doc ""]

type nonrec create_script_request = {
  language : language option;
      [@ocaml.doc "The programming language of the resulting code from the DAG.\n"]
  dag_edges : dag_edges option; [@ocaml.doc "A list of the edges in the DAG.\n"]
  dag_nodes : dag_nodes option; [@ocaml.doc "A list of the nodes in the DAG.\n"]
}
[@@ocaml.doc ""]

type nonrec create_schema_response = {
  schema_version_status : schema_version_status option;
      [@ocaml.doc "The status of the first schema version created.\n"]
  schema_version_id : schema_version_id_string option;
      [@ocaml.doc "The unique identifier of the first schema version.\n"]
  tags : tags_map option; [@ocaml.doc "The tags for the schema.\n"]
  schema_status : schema_status option; [@ocaml.doc "The status of the schema. \n"]
  next_schema_version : version_long_number option;
      [@ocaml.doc
        "The next version of the schema associated with the returned schema definition.\n"]
  latest_schema_version : version_long_number option;
      [@ocaml.doc
        "The latest version of the schema associated with the returned schema definition.\n"]
  schema_checkpoint : schema_checkpoint_number option;
      [@ocaml.doc
        "The version number of the checkpoint (the last time the compatibility mode was changed).\n"]
  compatibility : compatibility option; [@ocaml.doc "The schema compatibility mode.\n"]
  data_format : data_format option;
      [@ocaml.doc
        "The data format of the schema definition. Currently [AVRO], [JSON] and [PROTOBUF] are \
         supported.\n"]
  description : description_string option;
      [@ocaml.doc "A description of the schema if specified when created.\n"]
  schema_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
  schema_name : schema_registry_name_string option; [@ocaml.doc "The name of the schema.\n"]
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the registry.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name of the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec create_schema_input = {
  schema_definition : schema_definition_string option;
      [@ocaml.doc "The schema definition using the [DataFormat] setting for [SchemaName].\n"]
  tags : tags_map option;
      [@ocaml.doc
        "Amazon Web Services tags that contain a key value pair and may be searched by console, \
         command line, or API. If specified, follows the Amazon Web Services tags-on-create \
         pattern.\n"]
  description : description_string option;
      [@ocaml.doc
        "An optional description of the schema. If description is not provided, there will not be \
         any automatic default value for this.\n"]
  compatibility : compatibility option;
      [@ocaml.doc
        "The compatibility mode of the schema. The possible values are:\n\n\
        \ {ul\n\
        \       {-   {i NONE}: No compatibility mode applies. You can use this choice in \
         development scenarios or if you do not know the compatibility mode that you want to apply \
         to schemas. Any new version added will be accepted without undergoing a compatibility \
         check.\n\
        \           \n\
        \            }\n\
        \       {-   {i DISABLED}: This compatibility choice prevents versioning for a particular \
         schema. You can use this choice to prevent future versioning of a schema.\n\
        \           \n\
        \            }\n\
        \       {-   {i BACKWARD}: This compatibility choice is recommended as it allows data \
         receivers to read both the current and one previous schema version. This means that for \
         instance, a new schema version cannot drop data fields or change the type of these \
         fields, so they can't be read by readers using the previous version.\n\
        \           \n\
        \            }\n\
        \       {-   {i BACKWARD_ALL}: This compatibility choice allows data receivers to read \
         both the current and all previous schema versions. You can use this choice when you need \
         to delete fields or add optional fields, and check compatibility against all previous \
         schema versions. \n\
        \           \n\
        \            }\n\
        \       {-   {i FORWARD}: This compatibility choice allows data receivers to read both the \
         current and one next schema version, but not necessarily later versions. You can use this \
         choice when you need to add fields or delete optional fields, but only check \
         compatibility against the last schema version.\n\
        \           \n\
        \            }\n\
        \       {-   {i FORWARD_ALL}: This compatibility choice allows data receivers to read \
         written by producers of any new registered schema. You can use this choice when you need \
         to add fields or delete optional fields, and check compatibility against all previous \
         schema versions.\n\
        \           \n\
        \            }\n\
        \       {-   {i FULL}: This compatibility choice allows data receivers to read data \
         written by producers using the previous or next version of the schema, but not \
         necessarily earlier or later versions. You can use this choice when you need to add or \
         remove optional fields, but only check compatibility against the last schema version.\n\
        \           \n\
        \            }\n\
        \       {-   {i FULL_ALL}: This compatibility choice allows data receivers to read data \
         written by producers using all previous schema versions. You can use this choice when you \
         need to add or remove optional fields, and check compatibility against all previous \
         schema versions.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_format : data_format;
      [@ocaml.doc
        "The data format of the schema definition. Currently [AVRO], [JSON] and [PROTOBUF] are \
         supported.\n"]
  schema_name : schema_registry_name_string;
      [@ocaml.doc
        "Name of the schema to be created of max length of 255, and may only contain letters, \
         numbers, hyphen, underscore, dollar sign, or hash mark. No whitespace.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        " This is a wrapper shape to contain the registry identity fields. If this is not \
         provided, the default registry will be used. The ARN format for the same will be: \n\
         {[\n\
         arn:aws:glue:us-east-2::registry/default-registry:random-5-letter-id\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec create_registry_response = {
  tags : tags_map option; [@ocaml.doc "The tags for the registry.\n"]
  description : description_string option; [@ocaml.doc "A description of the registry.\n"]
  registry_name : schema_registry_name_string option; [@ocaml.doc "The name of the registry.\n"]
  registry_arn : glue_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the newly created registry.\n"]
}
[@@ocaml.doc ""]

type nonrec create_registry_input = {
  tags : tags_map option;
      [@ocaml.doc
        "Amazon Web Services tags that contain a key value pair and may be searched by console, \
         command line, or API.\n"]
  description : description_string option;
      [@ocaml.doc
        "A description of the registry. If description is not provided, there will not be any \
         default value for this.\n"]
  registry_name : schema_registry_name_string;
      [@ocaml.doc
        "Name of the registry to be created of max length of 255, and may only contain letters, \
         numbers, hyphen, underscore, dollar sign, or hash mark. No whitespace.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partition_response = unit [@@ocaml.doc ""]

type nonrec create_partition_request = {
  partition_input : partition_input;
      [@ocaml.doc "A [PartitionInput] structure defining the partition to be created.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the metadata table in which the partition is to be created.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the metadata database in which the partition is to be created.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The Amazon Web Services account ID of the catalog in which the partition is to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partition_index_response = unit [@@ocaml.doc ""]

type nonrec create_partition_index_request = {
  partition_index : partition_index;
      [@ocaml.doc
        "Specifies a [PartitionIndex] structure to create a partition index in an existing table.\n"]
  table_name : name_string;
      [@ocaml.doc "Specifies the name of a table in which you want to create a partition index.\n"]
  database_name : name_string;
      [@ocaml.doc
        "Specifies the name of a database in which you want to create a partition index.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The catalog ID where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec create_ml_transform_response = {
  transform_id : hash_string option;
      [@ocaml.doc "A unique identifier that is generated for the transform.\n"]
}
[@@ocaml.doc ""]

type nonrec create_ml_transform_request = {
  transform_encryption : transform_encryption option;
      [@ocaml.doc
        "The encryption-at-rest settings of the transform that apply to accessing user data. \
         Machine learning transforms can access user data encrypted in Amazon S3 using KMS.\n"]
  tags : tags_map option;
      [@ocaml.doc
        "The tags to use with this machine learning transform. You may use tags to limit access to \
         the machine learning transform. For more information about tags in Glue, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags \
         in Glue} in the developer guide.\n"]
  max_retries : nullable_integer option;
      [@ocaml.doc
        "The maximum number of times to retry a task for this transform after a task run fails.\n"]
  timeout : timeout option;
      [@ocaml.doc
        "The timeout of the task run for this transform in minutes. This is the maximum time that \
         a task run for this transform can consume resources before it is terminated and enters \
         [TIMEOUT] status. The default is 2,880 minutes (48 hours).\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when this task runs.\n\n\
        \ If [WorkerType] is set, then [NumberOfWorkers] is required (and vice versa).\n\
        \ "]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when this task runs. Accepts a value of \
         Standard, G.1X, or G.2X.\n\n\
        \ {ul\n\
        \       {-  For the [Standard] worker type, each worker provides 4 vCPU, 16 GB of memory \
         and a 50GB disk, and 2 executors per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.1X] worker type, each worker provides 4 vCPU, 16 GB of memory and a \
         64GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker provides 8 vCPU, 32 GB of memory and a \
         128GB disk, and 1 executor per worker.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [MaxCapacity] is a mutually exclusive option with [NumberOfWorkers] and [WorkerType].\n\
        \   \n\
        \    {ul\n\
        \          {-  If either [NumberOfWorkers] or [WorkerType] is set, then [MaxCapacity] \
         cannot be set.\n\
        \              \n\
        \               }\n\
        \          {-  If [MaxCapacity] is set then neither [NumberOfWorkers] or [WorkerType] can \
         be set.\n\
        \              \n\
        \               }\n\
        \          {-  If [WorkerType] is set, then [NumberOfWorkers] is required (and vice versa).\n\
        \              \n\
        \               }\n\
        \          {-   [MaxCapacity] and [NumberOfWorkers] must both be at least 1.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "The number of Glue data processing units (DPUs) that are allocated to task runs for this \
         transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative \
         measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of \
         memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue \
         pricing page}. \n\n\
        \  [MaxCapacity] is a mutually exclusive option with [NumberOfWorkers] and [WorkerType].\n\
        \ \n\
        \  {ul\n\
        \        {-  If either [NumberOfWorkers] or [WorkerType] is set, then [MaxCapacity] cannot \
         be set.\n\
        \            \n\
        \             }\n\
        \        {-  If [MaxCapacity] is set then neither [NumberOfWorkers] or [WorkerType] can be \
         set.\n\
        \            \n\
        \             }\n\
        \        {-  If [WorkerType] is set, then [NumberOfWorkers] is required (and vice versa).\n\
        \            \n\
        \             }\n\
        \        {-   [MaxCapacity] and [NumberOfWorkers] must both be at least 1.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   When the [WorkerType] field is set to a value other than [Standard], the [MaxCapacity] \
         field is set automatically and becomes read-only.\n\
        \   \n\
        \    When the [WorkerType] field is set to a value other than [Standard], the \
         [MaxCapacity] field is set automatically and becomes read-only.\n\
        \    "]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "This value determines which version of Glue this machine learning transform is compatible \
         with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue \
         compatibility defaults to Glue 0.9. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions}Glue \
         Versions} in the developer guide.\n"]
  role : role_string;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role with the required permissions. The \
         required permissions include both Glue service role permissions to Glue resources, and \
         Amazon S3 permissions required by the transform. \n\n\
        \ {ul\n\
        \       {-  This role needs Glue service role permissions to allow access to resources in \
         Glue. See \
         {{:https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html}Attach a Policy \
         to IAM Users That Access Glue}.\n\
        \           \n\
        \            }\n\
        \       {-  This role needs permission to your Amazon Simple Storage Service (Amazon S3) \
         sources, targets, temporary directory, scripts, and any libraries used by the task run \
         for this transform.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  parameters : transform_parameters;
      [@ocaml.doc
        "The algorithmic parameters that are specific to the transform type used. Conditionally \
         dependent on the transform type.\n"]
  input_record_tables : glue_tables;
      [@ocaml.doc "A list of Glue table definitions used by the transform.\n"]
  description : description_string option;
      [@ocaml.doc
        "A description of the machine learning transform that is being defined. The default is an \
         empty string.\n"]
  name : name_string;
      [@ocaml.doc "The unique name that you give the transform when you create it.\n"]
}
[@@ocaml.doc ""]

type nonrec create_json_classifier_request = {
  json_path : json_path;
      [@ocaml.doc
        "A [JsonPath] string defining the JSON data for the classifier to classify. Glue supports \
         a subset of JsonPath, as described in \
         {{:https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json}Writing \
         JsonPath Custom Classifiers}.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "Specifies a JSON classifier for [CreateClassifier] to create.\n"]

type nonrec create_job_response = {
  name : name_string option;
      [@ocaml.doc "The unique name that was provided for this job definition.\n"]
}
[@@ocaml.doc ""]

type nonrec create_job_request = {
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "This field specifies a day of the week and hour for a maintenance window for streaming \
         jobs. Glue periodically performs maintenance activities. During these maintenance \
         windows, Glue will need to restart your streaming jobs.\n\n\
        \ Glue will restart the job within 3 hours of the specified maintenance window. For \
         instance, if you set up the maintenance window for Monday at 10:00AM GMT, your jobs will \
         be restarted between 10:00AM GMT to 1:00PM GMT.\n\
        \ "]
  source_control_details : source_control_details option;
      [@ocaml.doc
        "The details for a source control configuration for a job, allowing synchronization of job \
         artifacts to or from a remote repository.\n"]
  execution_class : execution_class option;
      [@ocaml.doc
        "Indicates whether the job is run with a standard or flexible execution class. The \
         standard execution-class is ideal for time-sensitive workloads that require fast job \
         startup and dedicated resources.\n\n\
        \ The flexible execution class is appropriate for time-insensitive jobs whose start and \
         completion times may vary. \n\
        \ \n\
        \  Only jobs with Glue version 3.0 and above and command type [glueetl] will be allowed to \
         set [ExecutionClass] to [FLEX]. The flexible execution class is available for Spark jobs.\n\
        \  "]
  code_gen_configuration_nodes : code_gen_configuration_nodes option;
      [@ocaml.doc
        "The representation of a directed acyclic graph on which both the Glue Studio visual \
         component and Glue Studio code generation is based.\n"]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated when a job runs. Accepts a value of G.1X, \
         G.2X, G.4X, G.8X or G.025X for Spark jobs. Accepts the value Z.2X for Ray jobs.\n\n\
        \ {ul\n\
        \       {-  For the [G.1X] worker type, each worker maps to 1 DPU (4 vCPUs, 16 GB of \
         memory) with 94GB disk, and provides 1 executor per worker. We recommend this worker type \
         for workloads such as data transforms, joins, and queries, to offers a scalable and cost \
         effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker maps to 2 DPU (8 vCPUs, 32 GB of \
         memory) with 138GB disk, and provides 1 executor per worker. We recommend this worker \
         type for workloads such as data transforms, joins, and queries, to offers a scalable and \
         cost effective way to run most jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.4X] worker type, each worker maps to 4 DPU (16 vCPUs, 64 GB of \
         memory) with 256GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs in the following Amazon Web Services Regions: US East (Ohio), US East (N. \
         Virginia), US West (N. California), US West (Oregon), Asia Pacific (Mumbai), Asia Pacific \
         (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Canada \
         (Central), Europe (Frankfurt), Europe (Ireland), Europe (London), Europe (Spain), Europe \
         (Stockholm), and South America (S\195\163o Paulo).\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.8X] worker type, each worker maps to 8 DPU (32 vCPUs, 128 GB of \
         memory) with 512GB disk, and provides 1 executor per worker. We recommend this worker \
         type for jobs whose workloads contain your most demanding transforms, aggregations, \
         joins, and queries. This worker type is available only for Glue version 3.0 or later \
         Spark ETL jobs, in the same Amazon Web Services Regions as supported for the [G.4X] \
         worker type.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.025X] worker type, each worker maps to 0.25 DPU (2 vCPUs, 4 GB of \
         memory) with 84GB disk, and provides 1 executor per worker. We recommend this worker type \
         for low volume streaming jobs. This worker type is only available for Glue version 3.0 or \
         later streaming jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [Z.2X] worker type, each worker maps to 2 M-DPU (8vCPUs, 64 GB of \
         memory) with 128 GB disk, and provides up to 8 Ray workers based on the autoscaler.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated when a job runs.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "In Spark jobs, [GlueVersion] determines the versions of Apache Spark and Python that Glue \
         available in a job. The Python version indicates the version supported for jobs of type \
         Spark. \n\n\
        \ Ray jobs should set [GlueVersion] to [4.0] or greater. However, the versions of Ray, \
         Python and additional libraries available in your Ray job are determined by the [Runtime] \
         parameter of the Job command.\n\
        \ \n\
        \  For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \  \n\
        \   Jobs that are created without specifying a Glue version default to Glue 5.1.\n\
        \   "]
  notification_property : notification_property option;
      [@ocaml.doc "Specifies configuration properties of a job notification.\n"]
  tags : tags_map option;
      [@ocaml.doc
        "The tags to use with this job. You may use tags to limit access to the job. For more \
         information about tags in Glue, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags \
         in Glue} in the developer guide.\n"]
  security_configuration : name_string option;
      [@ocaml.doc "The name of the [SecurityConfiguration] structure to be used with this job.\n"]
  max_capacity : nullable_double option;
      [@ocaml.doc
        "For Glue version 1.0 or earlier jobs, using the standard worker type, the number of Glue \
         data processing units (DPUs) that can be allocated when this job runs. A DPU is a \
         relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 \
         GB of memory. For more information, see the {{:https://aws.amazon.com/glue/pricing/} Glue \
         pricing page}.\n\n\
        \ For Glue version 2.0+ jobs, you cannot specify a [Maximum capacity]. Instead, you should \
         specify a [Worker type] and the [Number of workers].\n\
        \ \n\
        \  Do not set [MaxCapacity] if using [WorkerType] and [NumberOfWorkers].\n\
        \  \n\
        \   The value that can be allocated for [MaxCapacity] depends on whether you are running a \
         Python shell job, an Apache Spark ETL job, or an Apache Spark streaming ETL job:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you specify a Python shell job ([JobCommand.Name]=\"pythonshell\"), \
         you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.\n\
        \              \n\
        \               }\n\
        \          {-  When you specify an Apache Spark ETL job ([JobCommand.Name]=\"glueetl\") or \
         Apache Spark streaming ETL job ([JobCommand.Name]=\"gluestreaming\"), you can allocate \
         from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU \
         allocation.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  timeout : timeout option;
      [@ocaml.doc
        "The job timeout in minutes. This is the maximum time that a job run can consume resources \
         before it is terminated and enters [TIMEOUT] status.\n\n\
        \ Jobs must have timeout values less than 7 days or 10080 minutes. Otherwise, the jobs \
         will throw an exception.\n\
        \ \n\
        \  When the value is left blank, the timeout is defaulted to 2,880 minutes for Glue \
         version 4.0 and earlier, or 480 minutes for Glue version 5.0 and later.\n\
        \  \n\
        \   Any existing Glue jobs that had a timeout value greater than 7 days will be defaulted \
         to 7 days. For instance if you have specified a timeout of 20 days for a batch job, it \
         will be stopped on the 7th day.\n\
        \   \n\
        \    For streaming jobs, if you have set up a maintenance window, it will be restarted \
         during the maintenance window after 7 days.\n\
        \    "]
  allocated_capacity : integer_value option;
      [@ocaml.doc
        "This parameter is deprecated. Use [MaxCapacity] instead.\n\n\
        \ The number of Glue data processing units (DPUs) to allocate to this Job. You can \
         allocate a minimum of 2 DPUs; the default is 10. A DPU is a relative measure of \
         processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For \
         more information, see the {{:https://aws.amazon.com/glue/pricing/}Glue pricing page}.\n\
        \ "]
  max_retries : max_retries option;
      [@ocaml.doc "The maximum number of times to retry this job if it fails.\n"]
  connections : connections_list option; [@ocaml.doc "The connections used for this job.\n"]
  non_overridable_arguments : generic_map option;
      [@ocaml.doc
        "Arguments for this job that are not overridden when providing job arguments in a job run, \
         specified as name-value pairs.\n"]
  default_arguments : generic_map option;
      [@ocaml.doc
        "The default arguments for every run of this job, specified as name-value pairs.\n\n\
        \ You can specify arguments here that your own job-execution script consumes, as well as \
         arguments that Glue itself consumes.\n\
        \ \n\
        \  Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve \
         secrets from a Glue Connection, Secrets Manager or other secret management mechanism if \
         you intend to keep them within the Job. \n\
        \  \n\
        \   For information about how to specify and consume your own Job arguments, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html}Calling \
         Glue APIs in Python} topic in the developer guide.\n\
        \   \n\
        \    For information about the arguments you can provide to this field when configuring \
         Spark jobs, see the \
         {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Special \
         Parameters Used by Glue} topic in the developer guide.\n\
        \    \n\
        \     For information about the arguments you can provide to this field when configuring \
         Ray jobs, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/author-job-ray-job-parameters.html}Using \
         job parameters in Ray jobs} in the developer guide.\n\
        \     "]
  command : job_command; [@ocaml.doc "The [JobCommand] that runs this job.\n"]
  execution_property : execution_property option;
      [@ocaml.doc
        "An [ExecutionProperty] specifying the maximum number of concurrent runs allowed for this \
         job.\n"]
  role : role_string;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the IAM role associated with this job.\n"]
  log_uri : uri_string option; [@ocaml.doc "This field is reserved for future use.\n"]
  description : description_string option; [@ocaml.doc "Description of the job being defined.\n"]
  job_run_queuing_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether job run queuing is enabled for the job runs for this job.\n\n\
        \ A value of true means job run queuing is enabled for the job runs. If false or not \
         populated, the job runs will not be considered for queueing.\n\
        \ \n\
        \  If this field does not match the value set in the job run, then the value from the job \
         run field will be used.\n\
        \  "]
  job_mode : job_mode option;
      [@ocaml.doc
        "A mode that describes how a job was created. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [SCRIPT] - The job was created using the Glue Studio script editor.\n\
        \           \n\
        \            }\n\
        \       {-   [VISUAL] - The job was created using the Glue Studio visual editor.\n\
        \           \n\
        \            }\n\
        \       {-   [NOTEBOOK] - The job was created using an interactive sessions notebook.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When the [JobMode] field is missing or null, [SCRIPT] is assigned as the default value.\n\
        \   "]
  name : name_string;
      [@ocaml.doc
        "The name you assign to this job definition. It must be unique in your account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_integration_table_properties_response = unit [@@ocaml.doc ""]

type nonrec create_integration_table_properties_request = {
  target_table_config : target_table_config option;
      [@ocaml.doc "A structure for the target table configuration.\n"]
  source_table_config : source_table_config option;
      [@ocaml.doc
        "A structure for the source table configuration. See the [SourceTableConfig] structure to \
         see list of supported source properties.\n"]
  table_name : string128; [@ocaml.doc "The name of the table to be replicated.\n"]
  resource_arn : string512;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target table for which to create integration table \
         properties. Currently, this API only supports creating integration table properties for \
         target tables, and the provided ARN should be the ARN of the target table in the Glue \
         Data Catalog. Support for creating integration table properties for source connections \
         (using the connection ARN) is not yet implemented and will be added in a future release. \n"]
}
[@@ocaml.doc ""]

type nonrec create_integration_response = {
  integration_config : integration_config option; [@ocaml.doc "The configuration settings.\n"]
  data_filter : string2048 option;
      [@ocaml.doc "Selects source tables for the integration using Maxwell filter syntax.\n"]
  errors : integration_error_list option;
      [@ocaml.doc "A list of errors associated with the integration creation.\n"]
  create_time : integration_timestamp;
      [@ocaml.doc "The time when the integration was created, in UTC.\n"]
  status : integration_status;
      [@ocaml.doc
        "The status of the integration being created.\n\n\
        \ The possible statuses are:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATING: The integration is being created.\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE: The integration creation succeeds.\n\
        \            \n\
        \             }\n\
        \        {-  MODIFYING: The integration is being modified.\n\
        \            \n\
        \             }\n\
        \        {-  FAILED: The integration creation fails. \n\
        \            \n\
        \             }\n\
        \        {-  DELETING: The integration is deleted.\n\
        \            \n\
        \             }\n\
        \        {-  SYNCING: The integration is synchronizing.\n\
        \            \n\
        \             }\n\
        \        {-  NEEDS_ATTENTION: The integration needs attention, such as synchronization.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tags : integration_tags_list option;
      [@ocaml.doc "Metadata assigned to the resource consisting of a list of key-value pairs.\n"]
  additional_encryption_context : integration_additional_encryption_context_map option;
      [@ocaml.doc
        "An optional set of non-secret key\226\128\147value pairs that contains additional \
         contextual information for encryption.\n"]
  kms_key_id : string2048 option;
      [@ocaml.doc "The ARN of a KMS key used for encrypting the channel.\n"]
  integration_arn : string128;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the created integration.\n"]
  description : integration_description option; [@ocaml.doc "A description of the integration.\n"]
  integration_name : string128; [@ocaml.doc "A unique name for an integration in Glue.\n"]
  target_arn : string512; [@ocaml.doc "The ARN of the target resource for the integration.\n"]
  source_arn : string512; [@ocaml.doc "The ARN of the source resource for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_integration_resource_property_response = {
  target_processing_properties : target_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration target.\n"]
  source_processing_properties : source_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration source.\n"]
  resource_property_arn : string512 option;
      [@ocaml.doc
        "The resource ARN created through this create API. The format is something like \
         arn:aws:glue:::integrationresourceproperty/*\n"]
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec create_integration_resource_property_request = {
  tags : integration_tags_list option;
      [@ocaml.doc "Metadata assigned to the resource consisting of a list of key-value pairs.\n"]
  target_processing_properties : target_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration target.\n"]
  source_processing_properties : source_processing_properties option;
      [@ocaml.doc "The resource properties associated with the integration source.\n"]
  resource_arn : string512;
      [@ocaml.doc "The connection ARN of the source, or the database ARN of the target.\n"]
}
[@@ocaml.doc ""]

type nonrec create_integration_request = {
  integration_config : integration_config option; [@ocaml.doc "The configuration settings.\n"]
  tags : integration_tags_list option;
      [@ocaml.doc "Metadata assigned to the resource consisting of a list of key-value pairs.\n"]
  additional_encryption_context : integration_additional_encryption_context_map option;
      [@ocaml.doc
        "An optional set of non-secret key\226\128\147value pairs that contains additional \
         contextual information for encryption. This can only be provided if [KMSKeyId] is \
         provided.\n"]
  kms_key_id : string2048 option;
      [@ocaml.doc "The ARN of a KMS key used for encrypting the channel.\n"]
  data_filter : string2048 option;
      [@ocaml.doc "Selects source tables for the integration using Maxwell filter syntax.\n"]
  description : integration_description option; [@ocaml.doc "A description of the integration.\n"]
  target_arn : string512; [@ocaml.doc "The ARN of the target resource for the integration.\n"]
  source_arn : string512; [@ocaml.doc "The ARN of the source resource for the integration.\n"]
  integration_name : string128; [@ocaml.doc "A unique name for an integration in Glue.\n"]
}
[@@ocaml.doc ""]

type nonrec create_grok_classifier_request = {
  custom_patterns : custom_patterns option;
      [@ocaml.doc "Optional custom grok patterns used by this classifier.\n"]
  grok_pattern : grok_pattern; [@ocaml.doc "The grok pattern used by this classifier.\n"]
  name : name_string; [@ocaml.doc "The name of the new classifier.\n"]
  classification : classification;
      [@ocaml.doc
        "An identifier of the data format that the classifier matches, such as Twitter, JSON, \
         Omniture logs, Amazon CloudWatch Logs, and so on.\n"]
}
[@@ocaml.doc "Specifies a [grok] classifier for [CreateClassifier] to create.\n"]

type nonrec create_glue_identity_center_configuration_response = {
  application_arn : application_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity Center application that was created for \
         the Glue configuration.\n"]
}
[@@ocaml.doc "Response from creating a new Glue Identity Center configuration.\n"]

type nonrec create_glue_identity_center_configuration_request = {
  user_background_sessions_enabled : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether users can run background sessions when using Identity Center \
         authentication with Glue services.\n"]
  scopes : identity_center_scopes_list option;
      [@ocaml.doc
        "A list of Identity Center scopes that define the permissions and access levels for the \
         Glue configuration.\n"]
  instance_arn : identity_center_instance_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity Center instance to be associated with the \
         Glue configuration.\n"]
}
[@@ocaml.doc "Request to create a new Glue Identity Center configuration.\n"]

type nonrec create_glossary_term_response = {
  long_description : glossary_long_description option;
      [@ocaml.doc "The long description of the glossary term.\n"]
  short_description : glossary_short_description option;
      [@ocaml.doc "The short description of the glossary term.\n"]
  name : glossary_term_name option; [@ocaml.doc "The name of the glossary term.\n"]
  glossary_id : glossary_id option;
      [@ocaml.doc "The unique identifier of the glossary containing this term.\n"]
  id : glossary_term_id option; [@ocaml.doc "The unique identifier of the glossary term.\n"]
}
[@@ocaml.doc ""]

type nonrec create_glossary_term_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  long_description : glossary_long_description option;
      [@ocaml.doc "A long description of the glossary term.\n"]
  short_description : glossary_short_description option;
      [@ocaml.doc "A short description of the glossary term.\n"]
  name : glossary_term_name; [@ocaml.doc "The name of the glossary term.\n"]
  glossary_identifier : glossary_id;
      [@ocaml.doc "The unique identifier of the glossary in which to create the term.\n"]
}
[@@ocaml.doc ""]

type nonrec create_glossary_response = {
  description : metadata_description option; [@ocaml.doc "The description of the glossary.\n"]
  name : glossary_name option; [@ocaml.doc "The name of the glossary.\n"]
  id : glossary_id option; [@ocaml.doc "The unique identifier of the glossary.\n"]
}
[@@ocaml.doc ""]

type nonrec create_glossary_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  description : metadata_description option; [@ocaml.doc "The description of the glossary.\n"]
  name : glossary_name; [@ocaml.doc "The name of the glossary.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dev_endpoint_response = {
  arguments : map_value option;
      [@ocaml.doc
        "The map of arguments used to configure this [DevEndpoint].\n\n\
        \ Valid arguments are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [\"--enable-glue-datacatalog\": \"\"] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can specify a version of Python support for development endpoints by using the \
         [Arguments] parameter in the [CreateDevEndpoint] or [UpdateDevEndpoint] APIs. If no \
         arguments are provided, the version defaults to Python 2.\n\
        \   "]
  created_timestamp : timestamp_value option;
      [@ocaml.doc "The point in time at which this [DevEndpoint] was created.\n"]
  security_configuration : name_string option;
      [@ocaml.doc
        "The name of the [SecurityConfiguration] structure being used with this [DevEndpoint].\n"]
  failure_reason : generic_string option;
      [@ocaml.doc "The reason for a current failure in this [DevEndpoint].\n"]
  extra_jars_s3_path : generic_string option;
      [@ocaml.doc
        "Path to one or more Java [.jar] files in an S3 bucket that will be loaded in your \
         [DevEndpoint].\n"]
  extra_python_libs_s3_path : generic_string option;
      [@ocaml.doc
        "The paths to one or more Python libraries in an S3 bucket that will be loaded in your \
         [DevEndpoint].\n"]
  vpc_id : generic_string option;
      [@ocaml.doc "The ID of the virtual private cloud (VPC) used by this [DevEndpoint].\n"]
  availability_zone : generic_string option;
      [@ocaml.doc
        "The Amazon Web Services Availability Zone where this [DevEndpoint] is located.\n"]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated to the development \
         endpoint.\n"]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "Glue version determines the versions of Apache Spark and Python that Glue supports. The \
         Python version indicates the version supported for running your ETL scripts on \
         development endpoints. \n\n\
        \ For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \ "]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated to the development endpoint. May be a \
         value of Standard, G.1X, or G.2X.\n"]
  number_of_nodes : integer_value option;
      [@ocaml.doc
        "The number of Glue Data Processing Units (DPUs) allocated to this DevEndpoint.\n"]
  zeppelin_remote_spark_interpreter_port : integer_value option;
      [@ocaml.doc "The Apache Zeppelin port for the remote Apache Spark interpreter.\n"]
  yarn_endpoint_address : generic_string option;
      [@ocaml.doc "The address of the YARN endpoint used by this [DevEndpoint].\n"]
  role_arn : role_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the role assigned to the new [DevEndpoint].\n"]
  subnet_id : generic_string option;
      [@ocaml.doc "The subnet ID assigned to the new [DevEndpoint].\n"]
  security_group_ids : string_list option;
      [@ocaml.doc "The security groups assigned to the new [DevEndpoint].\n"]
  status : generic_string option; [@ocaml.doc "The current status of the new [DevEndpoint].\n"]
  endpoint_name : generic_string option; [@ocaml.doc "The name assigned to the new [DevEndpoint].\n"]
}
[@@ocaml.doc ""]

type nonrec create_dev_endpoint_request = {
  arguments : map_value option;
      [@ocaml.doc "A map of arguments used to configure the [DevEndpoint].\n"]
  tags : tags_map option;
      [@ocaml.doc
        "The tags to use with this DevEndpoint. You may use tags to limit access to the \
         DevEndpoint. For more information about tags in Glue, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags \
         in Glue} in the developer guide.\n"]
  security_configuration : name_string option;
      [@ocaml.doc
        "The name of the [SecurityConfiguration] structure to be used with this [DevEndpoint].\n"]
  extra_jars_s3_path : generic_string option;
      [@ocaml.doc
        "The path to one or more Java [.jar] files in an S3 bucket that should be loaded in your \
         [DevEndpoint].\n"]
  extra_python_libs_s3_path : generic_string option;
      [@ocaml.doc
        "The paths to one or more Python libraries in an Amazon S3 bucket that should be loaded in \
         your [DevEndpoint]. Multiple values must be complete paths separated by a comma.\n\n\
        \  You can only use pure Python libraries with a [DevEndpoint]. Libraries that rely on C \
         extensions, such as the {{:http://pandas.pydata.org/}pandas} Python data analysis \
         library, are not yet supported.\n\
        \  \n\
        \   "]
  number_of_workers : nullable_integer option;
      [@ocaml.doc
        "The number of workers of a defined [workerType] that are allocated to the development \
         endpoint.\n\n\
        \ The maximum number of workers you can define are 299 for [G.1X], and 149 for [G.2X]. \n\
        \ "]
  glue_version : glue_version_string option;
      [@ocaml.doc
        "Glue version determines the versions of Apache Spark and Python that Glue supports. The \
         Python version indicates the version supported for running your ETL scripts on \
         development endpoints. \n\n\
        \ For more information about the available Glue versions and corresponding Spark and \
         Python versions, see {{:https://docs.aws.amazon.com/glue/latest/dg/add-job.html}Glue \
         version} in the developer guide.\n\
        \ \n\
        \  Development endpoints that are created without specifying a Glue version default to \
         Glue 0.9.\n\
        \  \n\
        \   You can specify a version of Python support for development endpoints by using the \
         [Arguments] parameter in the [CreateDevEndpoint] or [UpdateDevEndpoint] APIs. If no \
         arguments are provided, the version defaults to Python 2.\n\
        \   "]
  worker_type : worker_type option;
      [@ocaml.doc
        "The type of predefined worker that is allocated to the development endpoint. Accepts a \
         value of Standard, G.1X, or G.2X.\n\n\
        \ {ul\n\
        \       {-  For the [Standard] worker type, each worker provides 4 vCPU, 16 GB of memory \
         and a 50GB disk, and 2 executors per worker.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.1X] worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of \
         memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type \
         for memory-intensive jobs.\n\
        \           \n\
        \            }\n\
        \       {-  For the [G.2X] worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of \
         memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type \
         for memory-intensive jobs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Known issue: when a development endpoint is created with the [G.2X] [WorkerType] \
         configuration, the Spark drivers for the development endpoint will run on 4 vCPU, 16 GB \
         of memory, and a 64 GB disk. \n\
        \   "]
  number_of_nodes : integer_value option;
      [@ocaml.doc
        "The number of Glue Data Processing Units (DPUs) to allocate to this [DevEndpoint].\n"]
  public_keys : public_keys_list option;
      [@ocaml.doc
        "A list of public keys to be used by the development endpoints for authentication. The use \
         of this attribute is preferred over a single public key because the public keys allow you \
         to have a different private key per client.\n\n\
        \  If you previously created an endpoint with a public key, you must remove that key to be \
         able to set a list of public keys. Call the [UpdateDevEndpoint] API with the public key \
         content in the [deletePublicKeys] attribute, and the list of new keys in the \
         [addPublicKeys] attribute.\n\
        \  \n\
        \   "]
  public_key : generic_string option;
      [@ocaml.doc
        "The public key to be used by this [DevEndpoint] for authentication. This attribute is \
         provided for backward compatibility because the recommended attribute to use is public \
         keys.\n"]
  subnet_id : generic_string option;
      [@ocaml.doc "The subnet ID for the new [DevEndpoint] to use.\n"]
  security_group_ids : string_list option;
      [@ocaml.doc
        "Security group IDs for the security groups to be used by the new [DevEndpoint].\n"]
  role_arn : role_arn; [@ocaml.doc "The IAM role for the [DevEndpoint].\n"]
  endpoint_name : generic_string; [@ocaml.doc "The name to be assigned to the new [DevEndpoint].\n"]
}
[@@ocaml.doc ""]

type nonrec create_database_response = unit [@@ocaml.doc ""]

type nonrec create_database_request = {
  tags : tags_map option; [@ocaml.doc "The tags you assign to the database.\n"]
  database_input : database_input; [@ocaml.doc "The metadata for the database.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which to create the database. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_quality_ruleset_response = {
  name : name_string option; [@ocaml.doc "A unique name for the data quality ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_quality_ruleset_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "Used for idempotency and is recommended to be set to a random ID (such as a UUID) to \
         avoid creating or starting multiple instances of the same resource.\n"]
  data_quality_security_configuration : name_string option;
      [@ocaml.doc
        "The name of the security configuration created with the data quality encryption option.\n"]
  target_table : data_quality_target_table option;
      [@ocaml.doc "A target table associated with the data quality ruleset.\n"]
  tags : tags_map option; [@ocaml.doc "A list of tags applied to the data quality ruleset.\n"]
  ruleset : data_quality_ruleset_string;
      [@ocaml.doc
        "A Data Quality Definition Language (DQDL) ruleset. For more information, see the Glue \
         developer guide.\n"]
  description : description_string option;
      [@ocaml.doc "A description of the data quality ruleset.\n"]
  name : name_string; [@ocaml.doc "A unique name for the data quality ruleset.\n"]
}
[@@ocaml.doc "A request to create a data quality ruleset.\n"]

type nonrec create_custom_entity_type_response = {
  name : name_string option; [@ocaml.doc "The name of the custom pattern you created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_entity_type_request = {
  tags : tags_map option; [@ocaml.doc "A list of tags applied to the custom entity type.\n"]
  context_words : context_words option;
      [@ocaml.doc
        "A list of context words. If none of these context words are found within the vicinity of \
         the regular expression the data will not be detected as sensitive data.\n\n\
        \ If no context words are passed only a regular expression is checked.\n\
        \ "]
  regex_string : name_string;
      [@ocaml.doc
        "A regular expression string that is used for detecting sensitive data in a custom pattern.\n"]
  name : name_string;
      [@ocaml.doc
        "A name for the custom pattern that allows it to be retrieved or deleted later. This name \
         must be unique per Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_csv_classifier_request = {
  serde : csv_serde_option option;
      [@ocaml.doc
        "Sets the SerDe for processing CSV in the classifier, which will be applied in the Data \
         Catalog. Valid values are [OpenCSVSerDe], [LazySimpleSerDe], and [None]. You can specify \
         the [None] value when you want the crawler to do the detection.\n"]
  custom_datatypes : custom_datatypes option;
      [@ocaml.doc "Creates a list of supported custom datatypes.\n"]
  custom_datatype_configured : nullable_boolean option;
      [@ocaml.doc "Enables the configuration of custom datatypes.\n"]
  allow_single_column : nullable_boolean option;
      [@ocaml.doc "Enables the processing of files that contain only one column.\n"]
  disable_value_trimming : nullable_boolean option;
      [@ocaml.doc
        "Specifies not to trim values before identifying the type of column values. The default \
         value is true.\n"]
  header : csv_header option; [@ocaml.doc "A list of strings representing column names.\n"]
  contains_header : csv_header_option option;
      [@ocaml.doc "Indicates whether the CSV file contains a header.\n"]
  quote_symbol : csv_quote_symbol option;
      [@ocaml.doc
        "A custom symbol to denote what combines content into a single column value. Must be \
         different from the column delimiter.\n"]
  delimiter : csv_column_delimiter option;
      [@ocaml.doc "A custom symbol to denote what separates each column entry in the row.\n"]
  name : name_string; [@ocaml.doc "The name of the classifier.\n"]
}
[@@ocaml.doc "Specifies a custom CSV classifier for [CreateClassifier] to create.\n"]

type nonrec create_crawler_response = unit [@@ocaml.doc ""]

type nonrec create_crawler_request = {
  tags : tags_map option;
      [@ocaml.doc
        "The tags to use with this crawler request. You may use tags to limit access to the \
         crawler. For more information about tags in Glue, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags \
         in Glue} in the developer guide.\n"]
  crawler_security_configuration : crawler_security_configuration option;
      [@ocaml.doc "The name of the [SecurityConfiguration] structure to be used by this crawler.\n"]
  configuration : crawler_configuration option;
      [@ocaml.doc
        "Crawler configuration information. This versioned JSON string allows users to specify \
         aspects of a crawler's behavior. For more information, see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html}Setting crawler \
         configuration options}.\n"]
  lake_formation_configuration : lake_formation_configuration option;
      [@ocaml.doc "Specifies Lake Formation configuration settings for the crawler.\n"]
  lineage_configuration : lineage_configuration option;
      [@ocaml.doc "Specifies data lineage configuration settings for the crawler.\n"]
  recrawl_policy : recrawl_policy option;
      [@ocaml.doc
        "A policy that specifies whether to crawl the entire dataset again, or to crawl only \
         folders that were added since the last crawler run.\n"]
  schema_change_policy : schema_change_policy option;
      [@ocaml.doc "The policy for the crawler's update and deletion behavior.\n"]
  table_prefix : table_prefix option;
      [@ocaml.doc "The table prefix used for catalog tables that are created.\n"]
  classifiers : classifier_name_list option;
      [@ocaml.doc
        "A list of custom classifiers that the user has registered. By default, all built-in \
         classifiers are included in a crawl, but these custom classifiers always override the \
         default classifiers for a given classification.\n"]
  schedule : cron_expression option;
      [@ocaml.doc
        "A [cron] expression used to specify the schedule (see \
         {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html}Time-Based \
         Schedules for Jobs and Crawlers}. For example, to run something every day at 12:15 UTC, \
         you would specify: [cron(15 12 * * ? *)].\n"]
  targets : crawler_targets; [@ocaml.doc "A list of collection of targets to crawl.\n"]
  description : description_string option; [@ocaml.doc "A description of the new crawler.\n"]
  database_name : database_name option;
      [@ocaml.doc
        "The Glue database where results are written, such as: \
         [arn:aws:daylight:us-east-1::database/sometable/*].\n"]
  role : role;
      [@ocaml.doc
        "The IAM role or Amazon Resource Name (ARN) of an IAM role used by the new crawler to \
         access customer resources.\n"]
  name : name_string; [@ocaml.doc "Name of the new crawler.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_response = {
  create_connection_status : connection_status option;
      [@ocaml.doc
        "The status of the connection creation request. The request can take some time for certain \
         authentication types, for example when creating an OAuth connection with token exchange \
         over VPC.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_request = {
  tags : tags_map option; [@ocaml.doc "The tags you assign to the connection.\n"]
  connection_input : connection_input;
      [@ocaml.doc "A [ConnectionInput] object defining the connection to create.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which to create the connection. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec create_column_statistics_task_settings_response = unit [@@ocaml.doc ""]

type nonrec create_column_statistics_task_settings_request = {
  tags : tags_map option; [@ocaml.doc "A map of tags.\n"]
  security_configuration : name_string option;
      [@ocaml.doc "Name of the security configuration that is used to encrypt CloudWatch logs.\n"]
  catalog_i_d : name_string option;
      [@ocaml.doc "The ID of the Data Catalog in which the database resides.\n"]
  sample_size : sample_size_percentage option; [@ocaml.doc "The percentage of data to sample.\n"]
  column_name_list : column_name_list option;
      [@ocaml.doc "A list of column names for which to run statistics.\n"]
  schedule : cron_expression option;
      [@ocaml.doc "A schedule for running the column statistics, specified in CRON syntax.\n"]
  role : name_string; [@ocaml.doc "The role used for running the column statistics.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the table for which to generate column statistics.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database where the table resides.\n"]
}
[@@ocaml.doc ""]

type nonrec create_classifier_response = unit [@@ocaml.doc ""]

type nonrec create_classifier_request = {
  csv_classifier : create_csv_classifier_request option;
      [@ocaml.doc "A [CsvClassifier] object specifying the classifier to create.\n"]
  json_classifier : create_json_classifier_request option;
      [@ocaml.doc "A [JsonClassifier] object specifying the classifier to create.\n"]
  xml_classifier : create_xml_classifier_request option;
      [@ocaml.doc "An [XMLClassifier] object specifying the classifier to create.\n"]
  grok_classifier : create_grok_classifier_request option;
      [@ocaml.doc "A [GrokClassifier] object specifying the classifier to create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_catalog_response = unit [@@ocaml.doc ""]

type nonrec create_catalog_request = {
  tags : tags_map option;
      [@ocaml.doc
        "A map array of key-value pairs, not more than 50 pairs. Each key is a UTF-8 string, not \
         less than 1 or more than 128 bytes long. Each value is a UTF-8 string, not more than 256 \
         bytes long. The tags you assign to the catalog.\n"]
  catalog_input : catalog_input;
      [@ocaml.doc "A [CatalogInput] object that defines the metadata for the catalog.\n"]
  name : catalog_name_string; [@ocaml.doc "The name of the catalog to create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_blueprint_response = {
  name : name_string option; [@ocaml.doc "Returns the name of the blueprint that was registered.\n"]
}
[@@ocaml.doc ""]

type nonrec create_blueprint_request = {
  tags : tags_map option; [@ocaml.doc "The tags to be applied to this blueprint.\n"]
  blueprint_location : orchestration_s3_location;
      [@ocaml.doc "Specifies a path in Amazon S3 where the blueprint is published.\n"]
  description : generic512_char_string option; [@ocaml.doc "A description of the blueprint.\n"]
  name : orchestration_name_string; [@ocaml.doc "The name of the blueprint.\n"]
}
[@@ocaml.doc ""]

type nonrec check_schema_version_validity_response = {
  error : schema_validation_error option; [@ocaml.doc "A validation failure error message.\n"]
  valid : is_version_valid option;
      [@ocaml.doc "Return true, if the schema is valid and false otherwise.\n"]
}
[@@ocaml.doc ""]

type nonrec check_schema_version_validity_input = {
  schema_definition : schema_definition_string;
      [@ocaml.doc "The definition of the schema that has to be validated.\n"]
  data_format : data_format;
      [@ocaml.doc
        "The data format of the schema definition. Currently [AVRO], [JSON] and [PROTOBUF] are \
         supported.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_statement_response = unit [@@ocaml.doc ""]

type nonrec cancel_statement_request = {
  request_origin : orchestration_name_string option;
      [@ocaml.doc "The origin of the request to cancel the statement.\n"]
  id : integer_value; [@ocaml.doc "The ID of the statement to be cancelled.\n"]
  session_id : name_string; [@ocaml.doc "The Session ID of the statement to be cancelled.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_ml_task_run_response = {
  status : task_status_type option; [@ocaml.doc "The status for this run.\n"]
  task_run_id : hash_string option; [@ocaml.doc "The unique identifier for the task run.\n"]
  transform_id : hash_string option;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_ml_task_run_request = {
  task_run_id : hash_string; [@ocaml.doc "A unique identifier for the task run.\n"]
  transform_id : hash_string;
      [@ocaml.doc "The unique identifier of the machine learning transform.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_data_quality_ruleset_evaluation_run_response = unit [@@ocaml.doc ""]

type nonrec cancel_data_quality_ruleset_evaluation_run_request = {
  run_id : hash_string; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_data_quality_rule_recommendation_run_response = unit [@@ocaml.doc ""]

type nonrec cancel_data_quality_rule_recommendation_run_request = {
  run_id : hash_string; [@ocaml.doc "The unique run identifier associated with this run.\n"]
}
[@@ocaml.doc ""]

type nonrec blueprints = blueprint list [@@ocaml.doc ""]

type nonrec batch_update_partition_failure_entry = {
  error_detail : error_detail option;
      [@ocaml.doc "The details about the batch update partition error.\n"]
  partition_value_list : bounded_partition_value_list option;
      [@ocaml.doc "A list of values defining the partitions.\n"]
}
[@@ocaml.doc "Contains information about a batch update partition error.\n"]

type nonrec batch_update_partition_failure_list = batch_update_partition_failure_entry list
[@@ocaml.doc ""]

type nonrec batch_update_partition_response = {
  errors : batch_update_partition_failure_list option;
      [@ocaml.doc
        "The errors encountered when trying to update the requested partitions. A list of \
         [BatchUpdatePartitionFailureEntry] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_partition_request_entry = {
  partition_input : partition_input; [@ocaml.doc "The structure used to update a partition.\n"]
  partition_value_list : bounded_partition_value_list;
      [@ocaml.doc "A list of values defining the partitions.\n"]
}
[@@ocaml.doc "A structure that contains the values and structure used to update a partition.\n"]

type nonrec batch_update_partition_request_entry_list = batch_update_partition_request_entry list
[@@ocaml.doc ""]

type nonrec batch_update_partition_request = {
  entries : batch_update_partition_request_entry_list;
      [@ocaml.doc "A list of up to 100 [BatchUpdatePartitionRequestEntry] objects to update.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the metadata table in which the partition is to be updated.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the metadata database in which the partition is to be updated.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the catalog in which the partition is to be updated. Currently, this should be \
         the Amazon Web Services account ID.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_table_optimizer = {
  table_optimizer : table_optimizer option;
      [@ocaml.doc
        "A [TableOptimizer] object that contains details on the configuration and last run of a \
         table optimizer.\n"]
  table_name : table_name_string option; [@ocaml.doc "The name of the table.\n"]
  database_name : database_name_string option;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc
  "Contains details for one of the table optimizers returned by the [BatchGetTableOptimizer] \
   operation.\n"]

type nonrec batch_table_optimizers = batch_table_optimizer list [@@ocaml.doc ""]

type nonrec batch_stop_job_run_successful_submission = {
  job_run_id : id_string option; [@ocaml.doc "The [JobRunId] of the job run that was stopped.\n"]
  job_name : name_string option;
      [@ocaml.doc "The name of the job definition used in the job run that was stopped.\n"]
}
[@@ocaml.doc "Records a successful request to stop a specified [JobRun].\n"]

type nonrec batch_stop_job_run_successful_submission_list =
  batch_stop_job_run_successful_submission list
[@@ocaml.doc ""]

type nonrec batch_stop_job_run_error = {
  error_detail : error_detail option;
      [@ocaml.doc "Specifies details about the error that was encountered.\n"]
  job_run_id : id_string option; [@ocaml.doc "The [JobRunId] of the job run in question.\n"]
  job_name : name_string option;
      [@ocaml.doc "The name of the job definition that is used in the job run in question.\n"]
}
[@@ocaml.doc "Records an error that occurred when attempting to stop a specified job run.\n"]

type nonrec batch_stop_job_run_error_list = batch_stop_job_run_error list [@@ocaml.doc ""]

type nonrec batch_stop_job_run_response = {
  errors : batch_stop_job_run_error_list option;
      [@ocaml.doc
        "A list of the errors that were encountered in trying to stop [JobRuns], including the \
         [JobRunId] for which each error was encountered and details about the error.\n"]
  successful_submissions : batch_stop_job_run_successful_submission_list option;
      [@ocaml.doc "A list of the JobRuns that were successfully submitted for stopping.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_stop_job_run_job_run_id_list = id_string list [@@ocaml.doc ""]

type nonrec batch_stop_job_run_request = {
  job_run_ids : batch_stop_job_run_job_run_id_list;
      [@ocaml.doc "A list of the [JobRunIds] that should be stopped for that job definition.\n"]
  job_name : name_string; [@ocaml.doc "The name of the job definition for which to stop job runs.\n"]
}
[@@ocaml.doc ""]

type nonrec annotation_error = {
  failure_reason : description_string option; [@ocaml.doc "The reason why the annotation failed.\n"]
  statistic_id : hash_string option; [@ocaml.doc "The Statistic ID for the failed annotation.\n"]
  profile_id : hash_string option; [@ocaml.doc "The Profile ID for the failed annotation.\n"]
}
[@@ocaml.doc "A failed annotation.\n"]

type nonrec annotation_error_list = annotation_error list [@@ocaml.doc ""]

type nonrec batch_put_data_quality_statistic_annotation_response = {
  failed_inclusion_annotations : annotation_error_list option;
      [@ocaml.doc "A list of [AnnotationError]'s.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_put_data_quality_statistic_annotation_request = {
  client_token : hash_string option; [@ocaml.doc "Client Token.\n"]
  inclusion_annotations : inclusion_annotation_list;
      [@ocaml.doc
        "A list of [DatapointInclusionAnnotation]'s. The InclusionAnnotations must contain a \
         profileId and statisticId. If there are multiple InclusionAnnotations, the list must \
         refer to a single statisticId across multiple profileIds.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_workflows_response = {
  missing_workflows : workflow_names option;
      [@ocaml.doc "A list of names of workflows not found.\n"]
  workflows : workflows option; [@ocaml.doc "A list of workflow resource metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_workflows_request = {
  include_graph : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether to include a graph when returning the workflow resource metadata.\n"]
  names : workflow_names;
      [@ocaml.doc
        "A list of workflow names, which may be the names returned from the [ListWorkflows] \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_triggers_response = {
  triggers_not_found : trigger_name_list option;
      [@ocaml.doc "A list of names of triggers not found.\n"]
  triggers : trigger_list option; [@ocaml.doc "A list of trigger definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_triggers_request = {
  trigger_names : trigger_name_list;
      [@ocaml.doc
        "A list of trigger names, which may be the names returned from the [ListTriggers] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_table_optimizer_error = {
  type_ : table_optimizer_type option; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : table_name_string option; [@ocaml.doc "The name of the table.\n"]
  database_name : database_name_string option;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The Catalog ID of the table.\n"]
  error : error_detail option;
      [@ocaml.doc "An [ErrorDetail] object containing code and message details about the error.\n"]
}
[@@ocaml.doc
  "Contains details on one of the errors in the error list returned by the \
   [BatchGetTableOptimizer] operation.\n"]

type nonrec batch_get_table_optimizer_errors = batch_get_table_optimizer_error list [@@ocaml.doc ""]

type nonrec batch_get_table_optimizer_response = {
  failures : batch_get_table_optimizer_errors option;
      [@ocaml.doc "A list of errors from the operation.\n"]
  table_optimizers : batch_table_optimizers option;
      [@ocaml.doc "A list of [BatchTableOptimizer] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_table_optimizer_entry = {
  type_ : table_optimizer_type option; [@ocaml.doc "The type of table optimizer.\n"]
  table_name : table_name_string option; [@ocaml.doc "The name of the table.\n"]
  database_name : database_name_string option;
      [@ocaml.doc "The name of the database in the catalog in which the table resides.\n"]
  catalog_id : catalog_id_string option; [@ocaml.doc "The Catalog ID of the table.\n"]
}
[@@ocaml.doc
  "Represents a table optimizer to retrieve in the [BatchGetTableOptimizer] operation.\n"]

type nonrec batch_get_table_optimizer_entries = batch_get_table_optimizer_entry list
[@@ocaml.doc ""]

type nonrec batch_get_table_optimizer_request = {
  entries : batch_get_table_optimizer_entries;
      [@ocaml.doc
        "A list of [BatchGetTableOptimizerEntry] objects specifying the table optimizers to \
         retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_partition_value_list = partition_value_list list [@@ocaml.doc ""]

type nonrec batch_get_partition_response = {
  unprocessed_keys : batch_get_partition_value_list option;
      [@ocaml.doc
        "A list of the partition values in the request for which partitions were not returned.\n"]
  partitions : partition_list option; [@ocaml.doc "A list of the requested partitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_partition_request = {
  query_session_context : query_session_context option; [@ocaml.doc ""]
  audit_context : audit_context option; [@ocaml.doc ""]
  partitions_to_get : batch_get_partition_value_list;
      [@ocaml.doc "A list of partition values identifying the partitions to retrieve.\n"]
  table_name : name_string; [@ocaml.doc "The name of the partitions' table.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database where the partitions reside.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partitions in question reside. If none is supplied, \
         the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_jobs_response = {
  jobs_not_found : job_name_list option; [@ocaml.doc "A list of names of jobs not found.\n"]
  jobs : job_list option; [@ocaml.doc "A list of job definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_jobs_request = {
  job_names : job_name_list;
      [@ocaml.doc
        "A list of job names, which might be the names returned from the [ListJobs] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_iterable_forms_response = {
  errors : item_error_list option;
      [@ocaml.doc "The list of errors for items that could not be retrieved.\n"]
  items : iterable_form_item_list option; [@ocaml.doc "The list of retrieved iterable form items.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_iterable_forms_request = {
  item_identifiers : item_identifier_list;
      [@ocaml.doc
        "The list of item identifiers to retrieve. Each identifier can be an item ID or item name.\n"]
  iterable_form_name : iterable_form_name;
      [@ocaml.doc "The name of the iterable form to retrieve items from.\n"]
  asset_identifier : asset_id; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_dev_endpoints_response = {
  dev_endpoints_not_found : dev_endpoint_names option;
      [@ocaml.doc "A list of [DevEndpoints] not found.\n"]
  dev_endpoints : dev_endpoint_list option; [@ocaml.doc "A list of [DevEndpoint] definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_dev_endpoints_request = {
  dev_endpoint_names : dev_endpoint_names;
      [@ocaml.doc
        "The list of [DevEndpoint] names, which might be the names returned from the \
         [ListDevEndpoint] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_data_quality_result_response = {
  results_not_found : data_quality_result_ids option;
      [@ocaml.doc "A list of result IDs for which results were not found.\n"]
  results : data_quality_results_list;
      [@ocaml.doc "A list of [DataQualityResult] objects representing the data quality results.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_data_quality_result_request = {
  result_ids : data_quality_result_ids;
      [@ocaml.doc "A list of unique result IDs for the data quality results.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_custom_entity_types_response = {
  custom_entity_types_not_found : custom_entity_type_names option;
      [@ocaml.doc "A list of the names of custom patterns that were not found.\n"]
  custom_entity_types : custom_entity_types option;
      [@ocaml.doc
        "A list of [CustomEntityType] objects representing the custom patterns that have been \
         created.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_custom_entity_types_request = {
  names : custom_entity_type_names;
      [@ocaml.doc "A list of names of the custom patterns that you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_crawlers_response = {
  crawlers_not_found : crawler_name_list option;
      [@ocaml.doc "A list of names of crawlers that were not found.\n"]
  crawlers : crawler_list option; [@ocaml.doc "A list of crawler definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_crawlers_request = {
  crawler_names : crawler_name_list;
      [@ocaml.doc
        "A list of crawler names, which might be the names returned from the [ListCrawlers] \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_blueprints_response = {
  missing_blueprints : blueprint_names option;
      [@ocaml.doc "Returns a list of [BlueprintNames] that were not found.\n"]
  blueprints : blueprints option;
      [@ocaml.doc "Returns a list of blueprint as a [Blueprints] object.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_blueprint_names = orchestration_name_string list [@@ocaml.doc ""]

type nonrec batch_get_blueprints_request = {
  include_parameter_spec : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether or not to include the parameters, as a JSON string, for the blueprint \
         in the response.\n"]
  include_blueprint : nullable_boolean option;
      [@ocaml.doc "Specifies whether or not to include the blueprint in the response.\n"]
  names : batch_get_blueprint_names; [@ocaml.doc "A list of blueprint names.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_table_version_response = {
  errors : table_version_errors option;
      [@ocaml.doc
        "A list of errors encountered while trying to delete the specified table versions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_table_version_list = version_string list [@@ocaml.doc ""]

type nonrec batch_delete_table_version_request = {
  version_ids : batch_delete_table_version_list;
      [@ocaml.doc
        "A list of the IDs of versions to be deleted. A [VersionId] is a string representation of \
         an integer. Each version is incremented by 1.\n"]
  table_name : name_string;
      [@ocaml.doc
        "The name of the table. For Hive compatibility, this name is entirely lowercase.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The database in the catalog in which the table resides. For Hive compatibility, this name \
         is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the tables reside. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_table_response = {
  errors : table_errors option;
      [@ocaml.doc "A list of errors encountered in attempting to delete the specified tables.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_table_name_list = name_string list [@@ocaml.doc ""]

type nonrec batch_delete_table_request = {
  transaction_id : transaction_id_string option;
      [@ocaml.doc "The transaction ID at which to delete the table contents.\n"]
  tables_to_delete : batch_delete_table_name_list; [@ocaml.doc "A list of the table to delete.\n"]
  database_name : name_string;
      [@ocaml.doc
        "The name of the catalog database in which the tables to delete reside. For Hive \
         compatibility, this name is entirely lowercase.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the table resides. If none is provided, the Amazon Web \
         Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_partition_value_list = partition_value_list list [@@ocaml.doc ""]

type nonrec batch_delete_partition_response = {
  errors : partition_errors option;
      [@ocaml.doc "The errors encountered when trying to delete the requested partitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_partition_request = {
  partitions_to_delete : batch_delete_partition_value_list;
      [@ocaml.doc
        "A list of [PartitionInput] structures that define the partitions to be deleted.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the table that contains the partitions to be deleted.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the catalog database in which the table in question resides.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog where the partition to be deleted resides. If none is \
         provided, the Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_connection_response = {
  errors : error_by_name option;
      [@ocaml.doc
        "A map of the names of connections that were not successfully deleted to error details.\n"]
  succeeded : name_string_list option;
      [@ocaml.doc "A list of names of the connection definitions that were successfully deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_connection_request = {
  connection_name_list : delete_connection_name_list;
      [@ocaml.doc "A list of names of the connections to delete.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the Data Catalog in which the connections reside. If none is provided, the \
         Amazon Web Services account ID is used by default.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_partition_response = {
  errors : partition_errors option;
      [@ocaml.doc "The errors encountered when trying to create the requested partitions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_partition_request = {
  partition_input_list : partition_input_list;
      [@ocaml.doc
        "A list of [PartitionInput] structures that define the partitions to be created.\n"]
  table_name : name_string;
      [@ocaml.doc "The name of the metadata table in which the partition is to be created.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the metadata database in which the partition is to be created.\n"]
  catalog_id : catalog_id_string option;
      [@ocaml.doc
        "The ID of the catalog in which the partition is to be created. Currently, this should be \
         the Amazon Web Services account ID.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_glossary_terms_response = {
  glossary_terms : glossary_term_id_list option;
      [@ocaml.doc "The glossary terms now associated with the asset.\n"]
  asset_identifier : asset_id option; [@ocaml.doc "The unique identifier of the asset.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_glossary_terms_request = {
  client_token : hash_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  glossary_term_identifiers : glossary_term_id_list;
      [@ocaml.doc "The list of glossary term identifiers to associate with the asset.\n"]
  asset_identifier : asset_id;
      [@ocaml.doc "The unique identifier of the asset to associate glossary terms with.\n"]
}
[@@ocaml.doc ""]
