type nonrec error_message = string [@@ocaml.doc ""]

type nonrec pipeline_not_found_exception = {
  message : error_message option; [@ocaml.doc "Description of the error message.\n"]
}
[@@ocaml.doc
  "The specified pipeline was not found. Verify that you used the correct user and account \
   identifiers.\n"]

type nonrec pipeline_deleted_exception = {
  message : error_message option; [@ocaml.doc "Description of the error message.\n"]
}
[@@ocaml.doc "The specified pipeline has been deleted.\n"]

type nonrec invalid_request_exception = {
  message : error_message option; [@ocaml.doc "Description of the error message.\n"]
}
[@@ocaml.doc
  "The request was not valid. Verify that your request was properly formatted, that the signature \
   was generated with the correct credentials, and that you haven't exceeded any of the service \
   limits for your account.\n"]

type nonrec internal_service_error = {
  message : error_message option; [@ocaml.doc "Description of the error message.\n"]
}
[@@ocaml.doc "An internal service error occurred.\n"]

type nonrec activate_pipeline_output = unit [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec field_string_value = string [@@ocaml.doc ""]

type nonrec field_name_string = string [@@ocaml.doc ""]

type nonrec parameter_value = {
  id : field_name_string; [@ocaml.doc "The ID of the parameter value.\n"]
  string_value : field_string_value; [@ocaml.doc "The field value, expressed as a String.\n"]
}
[@@ocaml.doc "A value or list of parameter values. \n"]

type nonrec parameter_value_list = parameter_value list [@@ocaml.doc ""]

type nonrec id = string [@@ocaml.doc ""]

type nonrec activate_pipeline_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  parameter_values : parameter_value_list option;
      [@ocaml.doc "A list of parameter values to pass to the pipeline at activation.\n"]
  start_timestamp : timestamp option;
      [@ocaml.doc
        "The date and time to resume the pipeline. By default, the pipeline resumes from the last \
         completed execution.\n"]
}
[@@ocaml.doc "Contains the parameters for ActivatePipeline.\n"]

type nonrec add_tags_output = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "The key name of a tag defined by a user. For more information, see \
         {{:http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html}Controlling \
         User Access to Pipelines} in the {i AWS Data Pipeline Developer Guide}.\n"]
  value : tag_value;
      [@ocaml.doc
        "The optional value portion of a tag defined by a user. For more information, see \
         {{:http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html}Controlling \
         User Access to Pipelines} in the {i AWS Data Pipeline Developer Guide}.\n"]
}
[@@ocaml.doc
  "Tags are key/value pairs defined by a user and associated with a pipeline to control access. \
   AWS Data Pipeline allows you to associate ten tags per pipeline. For more information, see \
   {{:http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html}Controlling \
   User Access to Pipelines} in the {i AWS Data Pipeline Developer Guide}.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec add_tags_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  tags : tag_list; [@ocaml.doc "The tags to add, as key/value pairs.\n"]
}
[@@ocaml.doc "Contains the parameters for AddTags.\n"]

type nonrec create_pipeline_output = {
  pipeline_id : id;
      [@ocaml.doc
        "The ID that AWS Data Pipeline assigns the newly created pipeline. For example, \
         [df-06372391ZG65EXAMPLE].\n"]
}
[@@ocaml.doc "Contains the output of CreatePipeline.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec create_pipeline_input = {
  name : id;
      [@ocaml.doc
        "The name for the pipeline. You can use the same name for multiple pipelines associated \
         with your AWS account, because AWS Data Pipeline assigns each pipeline a unique pipeline \
         identifier.\n"]
  unique_id : id;
      [@ocaml.doc
        "A unique identifier. This identifier is not the same as the pipeline identifier assigned \
         by AWS Data Pipeline. You are responsible for defining the format and ensuring the \
         uniqueness of this identifier. You use this parameter to ensure idempotency during \
         repeated calls to [CreatePipeline]. For example, if the first call to [CreatePipeline] \
         does not succeed, you can pass in the same unique identifier and pipeline name \
         combination on a subsequent call to [CreatePipeline]. [CreatePipeline] ensures that if a \
         pipeline already exists with the same name and unique identifier, a new pipeline is not \
         created. Instead, you'll receive the pipeline identifier from the previous attempt. The \
         uniqueness of the name and unique identifier combination is scoped to the AWS account or \
         IAM user credentials.\n"]
  description : string_ option; [@ocaml.doc "The description for the pipeline.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to associate with the pipeline at creation. Tags let you control access to \
         pipelines. For more information, see \
         {{:http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html}Controlling \
         User Access to Pipelines} in the {i AWS Data Pipeline Developer Guide}.\n"]
}
[@@ocaml.doc "Contains the parameters for CreatePipeline.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec validation_message = string [@@ocaml.doc ""]

type nonrec validation_messages = validation_message list [@@ocaml.doc ""]

type nonrec validation_warning = {
  id : id option;
      [@ocaml.doc "The identifier of the object that contains the validation warning.\n"]
  warnings : validation_messages option; [@ocaml.doc "A description of the validation warning.\n"]
}
[@@ocaml.doc
  "Defines a validation warning. Validation warnings do not prevent pipeline activation. The set \
   of validation warnings that can be returned are defined by AWS Data Pipeline.\n"]

type nonrec validation_warnings = validation_warning list [@@ocaml.doc ""]

type nonrec validation_error = {
  id : id option; [@ocaml.doc "The identifier of the object that contains the validation error.\n"]
  errors : validation_messages option; [@ocaml.doc "A description of the validation error.\n"]
}
[@@ocaml.doc
  "Defines a validation error. Validation errors prevent pipeline activation. The set of \
   validation errors that can be returned are defined by AWS Data Pipeline.\n"]

type nonrec validation_errors = validation_error list [@@ocaml.doc ""]

type nonrec validate_pipeline_definition_output = {
  validation_errors : validation_errors option;
      [@ocaml.doc "Any validation errors that were found.\n"]
  validation_warnings : validation_warnings option;
      [@ocaml.doc "Any validation warnings that were found.\n"]
  errored : boolean_; [@ocaml.doc "Indicates whether there were validation errors.\n"]
}
[@@ocaml.doc "Contains the output of ValidatePipelineDefinition.\n"]

type nonrec attribute_value_string = string [@@ocaml.doc ""]

type nonrec attribute_name_string = string [@@ocaml.doc ""]

type nonrec parameter_attribute = {
  key : attribute_name_string; [@ocaml.doc "The field identifier.\n"]
  string_value : attribute_value_string; [@ocaml.doc "The field value, expressed as a String.\n"]
}
[@@ocaml.doc "The attributes allowed or specified with a parameter object.\n"]

type nonrec parameter_attribute_list = parameter_attribute list [@@ocaml.doc ""]

type nonrec parameter_object = {
  id : field_name_string; [@ocaml.doc "The ID of the parameter object. \n"]
  attributes : parameter_attribute_list; [@ocaml.doc "The attributes of the parameter object.\n"]
}
[@@ocaml.doc "Contains information about a parameter object.\n"]

type nonrec parameter_object_list = parameter_object list [@@ocaml.doc ""]

type nonrec field = {
  key : field_name_string; [@ocaml.doc "The field identifier.\n"]
  string_value : field_string_value option; [@ocaml.doc "The field value, expressed as a String.\n"]
  ref_value : field_name_string option;
      [@ocaml.doc "The field value, expressed as the identifier of another object.\n"]
}
[@@ocaml.doc
  "A key-value pair that describes a property of a pipeline object. The value is specified as \
   either a string value ([StringValue]) or a reference to another object ([RefValue]) but not as \
   both.\n"]

type nonrec field_list = field list [@@ocaml.doc ""]

type nonrec pipeline_object = {
  id : id; [@ocaml.doc "The ID of the object.\n"]
  name : id; [@ocaml.doc "The name of the object.\n"]
  fields : field_list; [@ocaml.doc "Key-value pairs that define the properties of the object.\n"]
}
[@@ocaml.doc
  "Contains information about a pipeline object. This can be a logical, physical, or physical \
   attempt pipeline object. The complete set of components of a pipeline defines the pipeline.\n"]

type nonrec pipeline_object_list = pipeline_object list [@@ocaml.doc ""]

type nonrec validate_pipeline_definition_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  pipeline_objects : pipeline_object_list;
      [@ocaml.doc
        "The objects that define the pipeline changes to validate against the pipeline.\n"]
  parameter_objects : parameter_object_list option;
      [@ocaml.doc "The parameter objects used with the pipeline.\n"]
  parameter_values : parameter_value_list option;
      [@ocaml.doc "The parameter values used with the pipeline.\n"]
}
[@@ocaml.doc "Contains the parameters for ValidatePipelineDefinition.\n"]

type nonrec task_not_found_exception = {
  message : error_message option; [@ocaml.doc "Description of the error message.\n"]
}
[@@ocaml.doc "The specified task was not found. \n"]

type nonrec set_task_status_output = unit [@@ocaml.doc ""]

type nonrec task_status =
  | FINISHED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | FALSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_id = string [@@ocaml.doc ""]

type nonrec set_task_status_input = {
  task_id : task_id;
      [@ocaml.doc
        "The ID of the task assigned to the task runner. This value is provided in the response \
         for [PollForTask].\n"]
  task_status : task_status;
      [@ocaml.doc
        "If [FINISHED], the task successfully completed. If [FAILED], the task ended \
         unsuccessfully. Preconditions use false.\n"]
  error_id : string_ option;
      [@ocaml.doc
        "If an error occurred during the task, this value specifies the error code. This value is \
         set on the physical attempt object. It is used to display error information to the user. \
         It should not start with string \"Service_\" which is reserved by the system.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "If an error occurred during the task, this value specifies a text description of the \
         error. This value is set on the physical attempt object. It is used to display error \
         information to the user. The web service does not parse this value.\n"]
  error_stack_trace : string_ option;
      [@ocaml.doc
        "If an error occurred during the task, this value specifies the stack trace associated \
         with the error. This value is set on the physical attempt object. It is used to display \
         error information to the user. The web service does not parse this value.\n"]
}
[@@ocaml.doc "Contains the parameters for SetTaskStatus.\n"]

type nonrec id_list = id list [@@ocaml.doc ""]

type nonrec set_status_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline that contains the objects.\n"]
  object_ids : id_list;
      [@ocaml.doc
        "The IDs of the objects. The corresponding objects can be either physical or components, \
         but not a mix of both types.\n"]
  status : string_;
      [@ocaml.doc
        "The status to be set on all the objects specified in [objectIds]. For components, use \
         [PAUSE] or [RESUME]. For instances, use [TRY_CANCEL], [RERUN], or [MARK_FINISHED].\n"]
}
[@@ocaml.doc "Contains the parameters for SetStatus.\n"]

type nonrec report_task_runner_heartbeat_output = {
  terminate : boolean_; [@ocaml.doc "Indicates whether the calling task runner should terminate.\n"]
}
[@@ocaml.doc "Contains the output of ReportTaskRunnerHeartbeat.\n"]

type nonrec report_task_runner_heartbeat_input = {
  taskrunner_id : id;
      [@ocaml.doc
        "The ID of the task runner. This value should be unique across your AWS account. In the \
         case of AWS Data Pipeline Task Runner launched on a resource managed by AWS Data \
         Pipeline, the web service provides a unique identifier when it launches the application. \
         If you have written a custom task runner, you should assign a unique identifier for the \
         task runner.\n"]
  worker_group : string_ option;
      [@ocaml.doc
        "The type of task the task runner is configured to accept and process. The worker group is \
         set as a field on objects in the pipeline when they are created. You can only specify a \
         single value for [workerGroup]. There are no wildcard values permitted in [workerGroup]; \
         the string must be an exact, case-sensitive, match.\n"]
  hostname : id option; [@ocaml.doc "The public DNS name of the task runner.\n"]
}
[@@ocaml.doc "Contains the parameters for ReportTaskRunnerHeartbeat.\n"]

type nonrec report_task_progress_output = {
  canceled : boolean_;
      [@ocaml.doc
        "If true, the calling task runner should cancel processing of the task. The task runner \
         does not need to call [SetTaskStatus] for canceled tasks.\n"]
}
[@@ocaml.doc "Contains the output of ReportTaskProgress.\n"]

type nonrec report_task_progress_input = {
  task_id : task_id;
      [@ocaml.doc
        "The ID of the task assigned to the task runner. This value is provided in the response \
         for [PollForTask].\n"]
  fields : field_list option;
      [@ocaml.doc
        "Key-value pairs that define the properties of the ReportTaskProgressInput object.\n"]
}
[@@ocaml.doc "Contains the parameters for ReportTaskProgress.\n"]

type nonrec remove_tags_output = unit [@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec remove_tags_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  tag_keys : string_list; [@ocaml.doc "The keys of the tags to remove.\n"]
}
[@@ocaml.doc "Contains the parameters for RemoveTags.\n"]

type nonrec query_objects_output = {
  ids : id_list option; [@ocaml.doc "The identifiers that match the query selectors.\n"]
  marker : string_ option;
      [@ocaml.doc
        "The starting point for the next page of results. To view the next page of results, call \
         [QueryObjects] again with this marker value. If the value is null, there are no more \
         results.\n"]
  has_more_results : boolean_ option;
      [@ocaml.doc
        "Indicates whether there are more results that can be obtained by a subsequent call.\n"]
}
[@@ocaml.doc "Contains the output of QueryObjects.\n"]

type nonrec int_ = int [@@ocaml.doc ""]

type nonrec operator_type =
  | Equal [@ocaml.doc ""]
  | ReferenceEqual [@ocaml.doc ""]
  | LessThanOrEqual [@ocaml.doc ""]
  | GreaterThanOrEqual [@ocaml.doc ""]
  | Between [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operator = {
  type_ : operator_type option;
      [@ocaml.doc
        " The logical operation to be performed: equal ([EQ]), equal reference ([REF_EQ]), less \
         than or equal ([LE]), greater than or equal ([GE]), or between ([BETWEEN]). Equal \
         reference ([REF_EQ]) can be used only with reference fields. The other comparison types \
         can be used only with String fields. The comparison types you can use apply only to \
         certain object fields, as detailed below. \n\n\
        \  The comparison operators EQ and REF_EQ act on the following fields: \n\
        \ \n\
        \  {ul\n\
        \        {- name}\n\
        \        {- \\@sphere}\n\
        \        {- parent}\n\
        \        {- \\@componentParent}\n\
        \        {- \\@instanceParent}\n\
        \        {- \\@status}\n\
        \        {- \\@scheduledStartTime}\n\
        \        {- \\@scheduledEndTime}\n\
        \        {- \\@actualStartTime}\n\
        \        {- \\@actualEndTime}\n\
        \        }\n\
        \    The comparison operators [GE], [LE], and [BETWEEN] act on the following fields: \n\
        \   \n\
        \    {ul\n\
        \          {- \\@scheduledStartTime}\n\
        \          {- \\@scheduledEndTime}\n\
        \          {- \\@actualStartTime}\n\
        \          {- \\@actualEndTime}\n\
        \          }\n\
        \   Note that fields beginning with the at sign (\\@) are read-only and set by the web \
         service. When you name fields, you should choose names containing only alpha-numeric \
         values, as symbols may be reserved by AWS Data Pipeline. User-defined fields that you add \
         to a pipeline should prefix their name with the string \"my\".\n\
        \   "]
  values : string_list option;
      [@ocaml.doc "The value that the actual field value will be compared with.\n"]
}
[@@ocaml.doc
  "Contains a logical operation for comparing the value of a field with a specified value.\n"]

type nonrec selector = {
  field_name : string_ option;
      [@ocaml.doc
        "The name of the field that the operator will be applied to. The field name is the \"key\" \
         portion of the field definition in the pipeline definition syntax that is used by the AWS \
         Data Pipeline API. If the field is not set on the object, the condition fails.\n"]
  operator : operator option; [@ocaml.doc ""]
}
[@@ocaml.doc "A comparision that is used to determine whether a query should return this object.\n"]

type nonrec selector_list = selector list [@@ocaml.doc ""]

type nonrec query = {
  selectors : selector_list option;
      [@ocaml.doc
        "List of selectors that define the query. An object must satisfy all of the selectors to \
         match the query.\n"]
}
[@@ocaml.doc "Defines the query to run against an object.\n"]

type nonrec query_objects_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  query : query option;
      [@ocaml.doc
        "The query that defines the objects to be returned. The [Query] object can contain a \
         maximum of ten selectors. The conditions in the query are limited to top-level String \
         fields in the object. These filters can be applied to components, instances, and attempts.\n"]
  sphere : string_;
      [@ocaml.doc
        "Indicates whether the query applies to components or instances. The possible values are: \
         [COMPONENT], [INSTANCE], and [ATTEMPT].\n"]
  marker : string_ option;
      [@ocaml.doc
        "The starting point for the results to be returned. For the first call, this value should \
         be empty. As long as there are more results, continue to call [QueryObjects] with the \
         marker value from the previous call to retrieve the next set of results.\n"]
  limit : int_ option;
      [@ocaml.doc
        "The maximum number of object names that [QueryObjects] will return in a single call. The \
         default value is 100. \n"]
}
[@@ocaml.doc "Contains the parameters for QueryObjects.\n"]

type nonrec put_pipeline_definition_output = {
  validation_errors : validation_errors option;
      [@ocaml.doc
        "The validation errors that are associated with the objects defined in [pipelineObjects].\n"]
  validation_warnings : validation_warnings option;
      [@ocaml.doc
        "The validation warnings that are associated with the objects defined in [pipelineObjects].\n"]
  errored : boolean_;
      [@ocaml.doc
        "Indicates whether there were validation errors, and the pipeline definition is stored but \
         cannot be activated until you correct the pipeline and call [PutPipelineDefinition] to \
         commit the corrected pipeline.\n"]
}
[@@ocaml.doc "Contains the output of PutPipelineDefinition.\n"]

type nonrec put_pipeline_definition_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  pipeline_objects : pipeline_object_list;
      [@ocaml.doc
        "The objects that define the pipeline. These objects overwrite the existing pipeline \
         definition.\n"]
  parameter_objects : parameter_object_list option;
      [@ocaml.doc "The parameter objects used with the pipeline.\n"]
  parameter_values : parameter_value_list option;
      [@ocaml.doc "The parameter values used with the pipeline.\n"]
}
[@@ocaml.doc "Contains the parameters for PutPipelineDefinition.\n"]

type nonrec pipeline_object_map = (id * pipeline_object) list [@@ocaml.doc ""]

type nonrec task_object = {
  task_id : task_id option;
      [@ocaml.doc
        "An internal identifier for the task. This ID is passed to the [SetTaskStatus] and \
         [ReportTaskProgress] actions.\n"]
  pipeline_id : id option; [@ocaml.doc "The ID of the pipeline that provided the task.\n"]
  attempt_id : id option;
      [@ocaml.doc
        "The ID of the pipeline task attempt object. AWS Data Pipeline uses this value to track \
         how many times a task is attempted.\n"]
  objects : pipeline_object_map option;
      [@ocaml.doc
        "Connection information for the location where the task runner will publish the output of \
         the task.\n"]
}
[@@ocaml.doc "Contains information about a pipeline task that is assigned to a task runner.\n"]

type nonrec poll_for_task_output = {
  task_object : task_object option;
      [@ocaml.doc
        "The information needed to complete the task that is being assigned to the task runner. \
         One of the fields returned in this object is [taskId], which contains an identifier for \
         the task being assigned. The calling task runner uses [taskId] in subsequent calls to \
         [ReportTaskProgress] and [SetTaskStatus].\n"]
}
[@@ocaml.doc "Contains the output of PollForTask.\n"]

type nonrec instance_identity = {
  document : string_ option;
      [@ocaml.doc
        "A description of an EC2 instance that is generated when the instance is launched and \
         exposed to the instance via the instance metadata service in the form of a JSON \
         representation of an object.\n"]
  signature : string_ option;
      [@ocaml.doc
        "A signature which can be used to verify the accuracy and authenticity of the information \
         provided in the instance identity document.\n"]
}
[@@ocaml.doc
  "\n\n\
   Identity information for the EC2 instance that is hosting the task runner. You can get this \
   value by calling a metadata URI from the EC2 instance. For more information, see \
   {{:http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html}Instance \
   Metadata} in the {i Amazon Elastic Compute Cloud User Guide.} Passing in this value proves that \
   your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline \
   service charges are applied to your pipeline.\n\n\n"]

type nonrec poll_for_task_input = {
  worker_group : string_;
      [@ocaml.doc
        "The type of task the task runner is configured to accept and process. The worker group is \
         set as a field on objects in the pipeline when they are created. You can only specify a \
         single value for [workerGroup] in the call to [PollForTask]. There are no wildcard values \
         permitted in [workerGroup]; the string must be an exact, case-sensitive, match.\n"]
  hostname : id option; [@ocaml.doc "The public DNS name of the calling task runner.\n"]
  instance_identity : instance_identity option;
      [@ocaml.doc
        "Identity information for the EC2 instance that is hosting the task runner. You can get \
         this value from the instance using [http://169.254.169.254/latest/meta-data/instance-id]. \
         For more information, see \
         {{:http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html}Instance \
         Metadata} in the {i Amazon Elastic Compute Cloud User Guide.} Passing in this value \
         proves that your task runner is running on an EC2 instance, and ensures the proper AWS \
         Data Pipeline service charges are applied to your pipeline.\n"]
}
[@@ocaml.doc "Contains the parameters for PollForTask.\n"]

type nonrec pipeline_id_name = {
  id : id option;
      [@ocaml.doc
        "The ID of the pipeline that was assigned by AWS Data Pipeline. This is a string of the \
         form [df-297EG78HU43EEXAMPLE].\n"]
  name : id option; [@ocaml.doc "The name of the pipeline.\n"]
}
[@@ocaml.doc "Contains the name and identifier of a pipeline.\n"]

type nonrec pipeline_list = pipeline_id_name list [@@ocaml.doc ""]

type nonrec list_pipelines_output = {
  pipeline_id_list : pipeline_list;
      [@ocaml.doc
        "The pipeline identifiers. If you require additional information about the pipelines, you \
         can use these identifiers to call [DescribePipelines] and [GetPipelineDefinition].\n"]
  marker : string_ option;
      [@ocaml.doc
        "The starting point for the next page of results. To view the next page of results, call \
         [ListPipelinesOutput] again with this marker value. If the value is null, there are no \
         more results.\n"]
  has_more_results : boolean_ option;
      [@ocaml.doc
        "Indicates whether there are more results that can be obtained by a subsequent call.\n"]
}
[@@ocaml.doc "Contains the output of ListPipelines.\n"]

type nonrec list_pipelines_input = {
  marker : string_ option;
      [@ocaml.doc
        "The starting point for the results to be returned. For the first call, this value should \
         be empty. As long as there are more results, continue to call [ListPipelines] with the \
         marker value from the previous call to retrieve the next set of results.\n"]
}
[@@ocaml.doc "Contains the parameters for ListPipelines.\n"]

type nonrec get_pipeline_definition_output = {
  pipeline_objects : pipeline_object_list option;
      [@ocaml.doc "The objects defined in the pipeline.\n"]
  parameter_objects : parameter_object_list option;
      [@ocaml.doc "The parameter objects used in the pipeline definition.\n"]
  parameter_values : parameter_value_list option;
      [@ocaml.doc "The parameter values used in the pipeline definition.\n"]
}
[@@ocaml.doc "Contains the output of GetPipelineDefinition.\n"]

type nonrec get_pipeline_definition_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  version : string_ option;
      [@ocaml.doc
        "The version of the pipeline definition to retrieve. Set this parameter to [latest] \
         (default) to use the last definition saved to the pipeline or [active] to use the last \
         definition that was activated.\n"]
}
[@@ocaml.doc "Contains the parameters for GetPipelineDefinition.\n"]

type nonrec long_string = string [@@ocaml.doc ""]

type nonrec evaluate_expression_output = {
  evaluated_expression : long_string; [@ocaml.doc "The evaluated expression.\n"]
}
[@@ocaml.doc "Contains the output of EvaluateExpression.\n"]

type nonrec evaluate_expression_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  object_id : id; [@ocaml.doc "The ID of the object.\n"]
  expression : long_string; [@ocaml.doc "The expression to evaluate.\n"]
}
[@@ocaml.doc "Contains the parameters for EvaluateExpression.\n"]

type nonrec pipeline_description = {
  pipeline_id : id;
      [@ocaml.doc
        "The pipeline identifier that was assigned by AWS Data Pipeline. This is a string of the \
         form [df-297EG78HU43EEXAMPLE].\n"]
  name : id; [@ocaml.doc "The name of the pipeline.\n"]
  fields : field_list;
      [@ocaml.doc
        "A list of read-only fields that contain metadata about the pipeline: \\@userId, \
         \\@accountId, and \\@pipelineState.\n"]
  description : string_ option; [@ocaml.doc "Description of the pipeline.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to associated with a pipeline. Tags let you control access to pipelines. \
         For more information, see \
         {{:http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html}Controlling \
         User Access to Pipelines} in the {i AWS Data Pipeline Developer Guide}.\n"]
}
[@@ocaml.doc "Contains pipeline metadata.\n"]

type nonrec pipeline_description_list = pipeline_description list [@@ocaml.doc ""]

type nonrec describe_pipelines_output = {
  pipeline_description_list : pipeline_description_list;
      [@ocaml.doc "An array of descriptions for the specified pipelines.\n"]
}
[@@ocaml.doc "Contains the output of DescribePipelines.\n"]

type nonrec describe_pipelines_input = {
  pipeline_ids : id_list;
      [@ocaml.doc
        "The IDs of the pipelines to describe. You can pass as many as 25 identifiers in a single \
         call. To obtain pipeline IDs, call [ListPipelines].\n"]
}
[@@ocaml.doc "Contains the parameters for DescribePipelines.\n"]

type nonrec describe_objects_output = {
  pipeline_objects : pipeline_object_list; [@ocaml.doc "An array of object definitions.\n"]
  marker : string_ option;
      [@ocaml.doc
        "The starting point for the next page of results. To view the next page of results, call \
         [DescribeObjects] again with this marker value. If the value is null, there are no more \
         results.\n"]
  has_more_results : boolean_ option;
      [@ocaml.doc "Indicates whether there are more results to return.\n"]
}
[@@ocaml.doc "Contains the output of DescribeObjects.\n"]

type nonrec describe_objects_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline that contains the object definitions.\n"]
  object_ids : id_list;
      [@ocaml.doc
        "The IDs of the pipeline objects that contain the definitions to be described. You can \
         pass as many as 25 identifiers in a single call to [DescribeObjects].\n"]
  evaluate_expressions : boolean_ option;
      [@ocaml.doc
        "Indicates whether any expressions in the object should be evaluated when the object \
         descriptions are returned.\n"]
  marker : string_ option;
      [@ocaml.doc
        "The starting point for the results to be returned. For the first call, this value should \
         be empty. As long as there are more results, continue to call [DescribeObjects] with the \
         marker value from the previous call to retrieve the next set of results.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeObjects.\n"]

type nonrec delete_pipeline_input = { pipeline_id : id [@ocaml.doc "The ID of the pipeline.\n"] }
[@@ocaml.doc "Contains the parameters for DeletePipeline.\n"]

type nonrec deactivate_pipeline_output = unit [@@ocaml.doc ""]

type nonrec cancel_active = bool [@@ocaml.doc ""]

type nonrec deactivate_pipeline_input = {
  pipeline_id : id; [@ocaml.doc "The ID of the pipeline.\n"]
  cancel_active : cancel_active option;
      [@ocaml.doc
        "Indicates whether to cancel any running objects. The default is true, which sets the \
         state of any running objects to [CANCELED]. If this value is false, the pipeline is \
         deactivated after all running objects finish.\n"]
}
[@@ocaml.doc "Contains the parameters for DeactivatePipeline.\n"]
