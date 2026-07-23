type nonrec aws_region_name = string [@@ocaml.doc ""]

type nonrec session_token = string [@@ocaml.doc ""]

type nonrec secret_access_key = string [@@ocaml.doc ""]

type nonrec access_key_id = string [@@ocaml.doc ""]

type nonrec aws_session_credentials = {
  access_key_id : access_key_id; [@ocaml.doc "The access key for the session.\n"]
  secret_access_key : secret_access_key; [@ocaml.doc "The secret access key for the session.\n"]
  session_token : session_token; [@ocaml.doc "The token for the session.\n"]
}
[@@ocaml.doc
  "Represents an Amazon Web Services session credentials object. These credentials are temporary \
   credentials that are issued by Amazon Web Services Secure Token Service (STS). They can be used \
   to access input and output artifacts in the S3 bucket used to store artifact for the pipeline \
   in CodePipeline.\n"]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec validation_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The validation was specified in an invalid format.\n"]

type nonrec job_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The job was specified in an invalid format or cannot be found.\n"]

type nonrec invalid_nonce_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The nonce was specified in an invalid format.\n"]

type nonrec job_status =
  | Created [@ocaml.doc ""]
  | Queued [@ocaml.doc ""]
  | Dispatched [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | TimedOut [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec acknowledge_job_output = {
  status : job_status option; [@ocaml.doc "Whether the job worker has received the specified job.\n"]
}
[@@ocaml.doc "Represents the output of an AcknowledgeJob action.\n"]

type nonrec nonce = string [@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec acknowledge_job_input = {
  job_id : job_id;
      [@ocaml.doc
        "The unique system-generated ID of the job for which you want to confirm receipt.\n"]
  nonce : nonce;
      [@ocaml.doc
        "A system-generated random number that CodePipeline uses to ensure that the job is being \
         worked on by only one job worker. Get this number from the response of the [PollForJobs] \
         request that returned this job.\n"]
}
[@@ocaml.doc "Represents the input of an AcknowledgeJob action.\n"]

type nonrec invalid_client_token_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The client token was specified in an invalid format\n"]

type nonrec acknowledge_third_party_job_output = {
  status : job_status option;
      [@ocaml.doc "The status information for the third party job, if any.\n"]
}
[@@ocaml.doc "Represents the output of an AcknowledgeThirdPartyJob action.\n"]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec third_party_job_id = string [@@ocaml.doc ""]

type nonrec acknowledge_third_party_job_input = {
  job_id : third_party_job_id; [@ocaml.doc "The unique system-generated ID of the job.\n"]
  nonce : nonce;
      [@ocaml.doc
        "A system-generated random number that CodePipeline uses to ensure that the job is being \
         worked on by only one job worker. Get this number from the response to a \
         [GetThirdPartyJobDetails] request.\n"]
  client_token : client_token;
      [@ocaml.doc
        "The clientToken portion of the clientId and clientToken pair used to verify that the \
         calling entity is allowed access to the job and its details.\n"]
}
[@@ocaml.doc "Represents the input of an AcknowledgeThirdPartyJob action.\n"]

type nonrec action_category =
  | Source [@ocaml.doc ""]
  | Build [@ocaml.doc ""]
  | Deploy [@ocaml.doc ""]
  | Test [@ocaml.doc ""]
  | Invoke [@ocaml.doc ""]
  | Approval [@ocaml.doc ""]
  | Compute [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_configuration_value = string [@@ocaml.doc ""]

type nonrec action_configuration_key = string [@@ocaml.doc ""]

type nonrec action_configuration_map = (action_configuration_key * action_configuration_value) list
[@@ocaml.doc ""]

type nonrec action_configuration = {
  configuration : action_configuration_map option;
      [@ocaml.doc "The configuration data for the action.\n"]
}
[@@ocaml.doc "Represents information about an action configuration.\n"]

type nonrec action_configuration_property_type =
  | String [@ocaml.doc ""]
  | Number [@ocaml.doc ""]
  | Boolean [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec action_configuration_property = {
  name : action_configuration_key; [@ocaml.doc "The name of the action configuration property.\n"]
  required : boolean_; [@ocaml.doc "Whether the configuration property is a required value.\n"]
  key : boolean_; [@ocaml.doc "Whether the configuration property is a key.\n"]
  secret : boolean_;
      [@ocaml.doc
        "Whether the configuration property is secret. Secrets are hidden from all calls except \
         for [GetJobDetails], [GetThirdPartyJobDetails], [PollForJobs], and \
         [PollForThirdPartyJobs].\n\n\
        \ When updating a pipeline, passing * * * * * without changing any other values of the \
         action preserves the previous value of the secret.\n\
        \ "]
  queryable : boolean_ option;
      [@ocaml.doc
        "Indicates that the property is used with [PollForJobs]. When creating a custom action, an \
         action can have up to one queryable property. If it has one, that property must be both \
         required and not secret.\n\n\
        \ If you create a pipeline with a custom action type, and that custom action contains a \
         queryable property, the value for that configuration property is subject to other \
         restrictions. The value must be less than or equal to twenty (20) characters. The value \
         can contain only alphanumeric characters, underscores, and hyphens.\n\
        \ "]
  description : description option;
      [@ocaml.doc
        "The description of the action configuration property that is displayed to users.\n"]
  type_ : action_configuration_property_type option;
      [@ocaml.doc "The type of the configuration property.\n"]
}
[@@ocaml.doc "Represents information about an action configuration property.\n"]

type nonrec action_configuration_property_list = action_configuration_property list [@@ocaml.doc ""]

type nonrec action_configuration_queryable_value = string [@@ocaml.doc ""]

type nonrec action_execution_id = string [@@ocaml.doc ""]

type nonrec action_name = string [@@ocaml.doc ""]

type nonrec action_context = {
  name : action_name option; [@ocaml.doc "The name of the action in the context of a job.\n"]
  action_execution_id : action_execution_id option;
      [@ocaml.doc "The system-generated unique ID that corresponds to an action's execution.\n"]
}
[@@ocaml.doc "Represents the context of an action in the stage of a pipeline to a job worker.\n"]

type nonrec environment_variable_type =
  | PLAINTEXT [@ocaml.doc ""]
  | SECRETS_MANAGER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_variable_value = string [@@ocaml.doc ""]

type nonrec environment_variable_name = string [@@ocaml.doc ""]

type nonrec environment_variable = {
  name : environment_variable_name;
      [@ocaml.doc "The environment variable name in the key-value pair.\n"]
  value : environment_variable_value;
      [@ocaml.doc "The environment variable value in the key-value pair.\n"]
  type_ : environment_variable_type option;
      [@ocaml.doc
        "Specifies the type of use for the environment variable value. The value can be either \
         [PLAINTEXT] or [SECRETS_MANAGER]. If the value is [SECRETS_MANAGER], provide the Secrets \
         reference in the EnvironmentVariable value.\n"]
}
[@@ocaml.doc "The environment variables for the action.\n"]

type nonrec environment_variable_list = environment_variable list [@@ocaml.doc ""]

type nonrec action_timeout = int [@@ocaml.doc ""]

type nonrec action_namespace = string [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec output_variable = string [@@ocaml.doc ""]

type nonrec output_variable_list = output_variable list [@@ocaml.doc ""]

type nonrec artifact_name = string [@@ocaml.doc ""]

type nonrec input_artifact = {
  name : artifact_name;
      [@ocaml.doc
        "The name of the artifact to be worked on (for example, \"My App\").\n\n\
        \ Artifacts are the files that are worked on by actions in the pipeline. See the action \
         configuration for each action for details about artifact parameters. For example, the S3 \
         source action input artifact is a file name (or file path), and the files are generally \
         provided as a ZIP file. Example artifact name: SampleApp_Windows.zip\n\
        \ \n\
        \  The input artifact of an action must exactly match the output artifact declared in a \
         preceding action, but the input artifact does not have to be the next action in strict \
         sequence from the action that provided the output artifact. Actions in parallel can \
         declare different output artifacts, which are in turn consumed by different following \
         actions.\n\
        \  "]
}
[@@ocaml.doc
  "Represents information about an artifact to be worked on, such as a test or build artifact.\n"]

type nonrec input_artifact_list = input_artifact list [@@ocaml.doc ""]

type nonrec file_path = string [@@ocaml.doc ""]

type nonrec file_path_list = file_path list [@@ocaml.doc ""]

type nonrec output_artifact = {
  name : artifact_name;
      [@ocaml.doc
        "The name of the output of an artifact, such as \"My App\".\n\n\
        \ The input artifact of an action must exactly match the output artifact declared in a \
         preceding action, but the input artifact does not have to be the next action in strict \
         sequence from the action that provided the output artifact. Actions in parallel can \
         declare different output artifacts, which are in turn consumed by different following \
         actions.\n\
        \ \n\
        \  Output artifact names must be unique within a pipeline.\n\
        \  "]
  files : file_path_list option;
      [@ocaml.doc
        "The files that you want to associate with the output artifact that will be exported from \
         the compute action.\n"]
}
[@@ocaml.doc "Represents information about the output of an action.\n"]

type nonrec output_artifact_list = output_artifact list [@@ocaml.doc ""]

type nonrec command = string [@@ocaml.doc ""]

type nonrec command_list = command list [@@ocaml.doc ""]

type nonrec action_run_order = int [@@ocaml.doc ""]

type nonrec version = string [@@ocaml.doc ""]

type nonrec action_provider = string [@@ocaml.doc ""]

type nonrec action_owner =
  | AWS [@ocaml.doc ""]
  | ThirdParty [@ocaml.doc ""]
  | Custom [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_type_id = {
  category : action_category;
      [@ocaml.doc
        "A category defines what kind of action can be taken in the stage, and constrains the \
         provider type for the action. Valid categories are limited to one of the following \
         values. \n\n\
        \ {ul\n\
        \       {-  Source\n\
        \           \n\
        \            }\n\
        \       {-  Build\n\
        \           \n\
        \            }\n\
        \       {-  Test\n\
        \           \n\
        \            }\n\
        \       {-  Deploy\n\
        \           \n\
        \            }\n\
        \       {-  Invoke\n\
        \           \n\
        \            }\n\
        \       {-  Approval\n\
        \           \n\
        \            }\n\
        \       {-  Compute\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  owner : action_owner;
      [@ocaml.doc
        "The creator of the action being called. There are three valid values for the [Owner] \
         field in the action category section within your pipeline structure: [AWS], [ThirdParty], \
         and [Custom]. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#actions-valid-providers}Valid \
         Action Types and Providers in CodePipeline}.\n"]
  provider : action_provider;
      [@ocaml.doc
        "The provider of the service being called by the action. Valid providers are determined by \
         the action category. For example, an action in the Deploy category type might have a \
         provider of CodeDeploy, which would be specified as [CodeDeploy]. For more information, \
         see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#actions-valid-providers}Valid \
         Action Types and Providers in CodePipeline}.\n"]
  version : version; [@ocaml.doc "A string that describes the action version.\n"]
}
[@@ocaml.doc "Represents information about an action type.\n"]

type nonrec action_declaration = {
  name : action_name; [@ocaml.doc "The action declaration's name.\n"]
  action_type_id : action_type_id;
      [@ocaml.doc "Specifies the action type and the provider of the action.\n"]
  run_order : action_run_order option; [@ocaml.doc "The order in which actions are run.\n"]
  configuration : action_configuration_map option;
      [@ocaml.doc
        "The action's configuration. These are key-value pairs that specify input values for an \
         action. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#action-requirements}Action \
         Structure Requirements in CodePipeline}. For the list of configuration properties for the \
         CloudFormation action type in CodePipeline, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/continuous-delivery-codepipeline-action-reference.html}Configuration \
         Properties Reference} in the {i CloudFormation User Guide}. For template snippets with \
         examples, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/continuous-delivery-codepipeline-parameter-override-functions.html}Using \
         Parameter Override Functions with CodePipeline Pipelines} in the {i CloudFormation User \
         Guide}.\n\n\
        \ The values can be represented in either JSON or YAML format. For example, the JSON \
         configuration item format is as follows: \n\
        \ \n\
        \   {i JSON:} \n\
        \  \n\
        \    [\"Configuration\" : { Key : Value },] \n\
        \   "]
  commands : command_list option;
      [@ocaml.doc
        "The shell commands to run with your compute action in CodePipeline. All commands are \
         supported except multi-line formats. While CodeBuild logs and permissions are used, you \
         do not need to create any resources in CodeBuild.\n\n\
        \  Using compute time for this action will incur separate charges in CodeBuild.\n\
        \  \n\
        \   "]
  output_artifacts : output_artifact_list option;
      [@ocaml.doc
        "The name or ID of the result of the action declaration, such as a test or build artifact.\n"]
  input_artifacts : input_artifact_list option;
      [@ocaml.doc
        "The name or ID of the artifact consumed by the action, such as a test or build artifact.\n"]
  output_variables : output_variable_list option;
      [@ocaml.doc
        "The list of variables that are to be exported from the compute action. This is \
         specifically CodeBuild environment variables as used for that action.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the IAM service role that performs the declared action. This is assumed \
         through the roleArn for the pipeline.\n"]
  region : aws_region_name option;
      [@ocaml.doc "The action declaration's Amazon Web Services Region, such as us-east-1.\n"]
  namespace : action_namespace option;
      [@ocaml.doc
        "The variable namespace associated with the action. All variables produced as output by \
         this action fall under this namespace.\n"]
  timeout_in_minutes : action_timeout option;
      [@ocaml.doc
        "A timeout duration in minutes that can be applied against the ActionType\226\128\153s \
         default timeout value specified in \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/limits.html}Quotas for \
         CodePipeline }. This attribute is available only to the manual approval ActionType.\n"]
  environment_variables : environment_variable_list option;
      [@ocaml.doc "The environment variables for the action.\n"]
}
[@@ocaml.doc "Represents information about an action declaration.\n"]

type nonrec log_stream_ar_n = string [@@ocaml.doc ""]

type nonrec code = string [@@ocaml.doc ""]

type nonrec error_details = {
  code : code option; [@ocaml.doc "The system ID or number code of the error.\n"]
  message : message option; [@ocaml.doc "The text of the error message.\n"]
}
[@@ocaml.doc "Represents information about an error in CodePipeline.\n"]

type nonrec percentage = int [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec execution_id = string [@@ocaml.doc ""]

type nonrec last_updated_by = string [@@ocaml.doc ""]

type nonrec action_execution_token = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec execution_summary = string [@@ocaml.doc ""]

type nonrec action_execution_status =
  | InProgress [@ocaml.doc ""]
  | Abandoned [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_execution = {
  action_execution_id : action_execution_id option;
      [@ocaml.doc
        "ID of the workflow action execution in the current stage. Use the [GetPipelineState] \
         action to retrieve the current action execution details of the current stage.\n\n\
        \  For older executions, this field might be empty. The action execution ID is available \
         for executions run on or after March 2020.\n\
        \  \n\
        \   "]
  status : action_execution_status option;
      [@ocaml.doc
        "The status of the action, or for a completed action, the last status of the action.\n"]
  summary : execution_summary option; [@ocaml.doc "A summary of the run of the action.\n"]
  last_status_change : timestamp option; [@ocaml.doc "The last status change of the action.\n"]
  token : action_execution_token option;
      [@ocaml.doc
        "The system-generated token used to identify a unique approval request. The token for each \
         open approval request can be obtained using the [GetPipelineState] command. It is used to \
         validate that the approval request corresponding to this token is still valid.\n"]
  last_updated_by : last_updated_by option;
      [@ocaml.doc "The ARN of the user who last changed the pipeline.\n"]
  external_execution_id : execution_id option;
      [@ocaml.doc "The external ID of the run of the action.\n"]
  external_execution_url : url option;
      [@ocaml.doc
        "The URL of a resource external to Amazon Web Services that is used when running the \
         action (for example, an external repository URL).\n"]
  percent_complete : percentage option;
      [@ocaml.doc "A percentage of completeness of the action as it runs.\n"]
  error_details : error_details option;
      [@ocaml.doc "The details of an error returned by a URL external to Amazon Web Services.\n"]
  log_stream_ar_n : log_stream_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the log stream for the action compute.\n"]
}
[@@ocaml.doc "Represents information about the run of an action.\n"]

type nonrec output_variables_value = string [@@ocaml.doc ""]

type nonrec output_variables_key = string [@@ocaml.doc ""]

type nonrec output_variables_map = (output_variables_key * output_variables_value) list
[@@ocaml.doc ""]

type nonrec external_execution_summary = string [@@ocaml.doc ""]

type nonrec external_execution_id = string [@@ocaml.doc ""]

type nonrec action_execution_result = {
  external_execution_id : external_execution_id option;
      [@ocaml.doc "The action provider's external ID for the action execution.\n"]
  external_execution_summary : external_execution_summary option;
      [@ocaml.doc "The action provider's summary for the action execution.\n"]
  external_execution_url : url option;
      [@ocaml.doc
        "The deepest external link to the external resource (for example, a repository URL or \
         deployment endpoint) that is used when running the action.\n"]
  error_details : error_details option; [@ocaml.doc ""]
  log_stream_ar_n : log_stream_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the log stream for the action compute.\n"]
}
[@@ocaml.doc "Execution result information, such as the external execution ID.\n"]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_location = {
  bucket : s3_bucket option;
      [@ocaml.doc "The Amazon S3 artifact bucket for an action's artifacts.\n"]
  key : s3_key option; [@ocaml.doc "The artifact name.\n"]
}
[@@ocaml.doc "The Amazon S3 artifact location for an action's artifacts.\n"]

type nonrec artifact_detail = {
  name : artifact_name option; [@ocaml.doc "The artifact object name for the action execution.\n"]
  s3location : s3_location option;
      [@ocaml.doc "The Amazon S3 artifact location for the action execution.\n"]
}
[@@ocaml.doc "Artifact details for the action execution, such as the artifact location.\n"]

type nonrec artifact_detail_list = artifact_detail list [@@ocaml.doc ""]

type nonrec action_execution_output = {
  output_artifacts : artifact_detail_list option;
      [@ocaml.doc
        "Details of output artifacts of the action that correspond to the action execution.\n"]
  execution_result : action_execution_result option;
      [@ocaml.doc
        "Execution result information listed in the output details for an action execution.\n"]
  output_variables : output_variables_map option;
      [@ocaml.doc
        "The outputVariables field shows the key-value pairs that were output as part of that \
         execution.\n"]
}
[@@ocaml.doc
  "Output details listed for an action execution, such as the action execution result.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec resolved_action_configuration_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec action_execution_input = {
  action_type_id : action_type_id option; [@ocaml.doc ""]
  configuration : action_configuration_map option;
      [@ocaml.doc "Configuration data for an action execution.\n"]
  resolved_configuration : resolved_action_configuration_map option;
      [@ocaml.doc
        "Configuration data for an action execution with all variable references replaced with \
         their real values for the execution.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the IAM service role that performs the declared action. This is assumed \
         through the roleArn for the pipeline. \n"]
  region : aws_region_name option;
      [@ocaml.doc "The Amazon Web Services Region for the action, such as us-east-1.\n"]
  input_artifacts : artifact_detail_list option;
      [@ocaml.doc
        "Details of input artifacts of the action that correspond to the action execution.\n"]
  namespace : action_namespace option;
      [@ocaml.doc
        "The variable namespace associated with the action. All variables produced as output by \
         this action fall under this namespace.\n"]
}
[@@ocaml.doc "Input information used for an action execution.\n"]

type nonrec stage_name = string [@@ocaml.doc ""]

type nonrec pipeline_version = int [@@ocaml.doc ""]

type nonrec pipeline_execution_id = string [@@ocaml.doc ""]

type nonrec action_execution_detail = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The pipeline execution ID for the action execution.\n"]
  action_execution_id : action_execution_id option; [@ocaml.doc "The action execution ID.\n"]
  pipeline_version : pipeline_version option;
      [@ocaml.doc "The version of the pipeline where the action was run.\n"]
  stage_name : stage_name option; [@ocaml.doc "The name of the stage that contains the action.\n"]
  action_name : action_name option; [@ocaml.doc "The name of the action.\n"]
  start_time : timestamp option; [@ocaml.doc "The start time of the action execution.\n"]
  last_update_time : timestamp option;
      [@ocaml.doc "The last update time of the action execution.\n"]
  updated_by : last_updated_by option;
      [@ocaml.doc "The ARN of the user who changed the pipeline execution details.\n"]
  status : action_execution_status option;
      [@ocaml.doc
        " The status of the action execution. Status categories are [InProgress], [Succeeded], and \
         [Failed].\n"]
  input : action_execution_input option;
      [@ocaml.doc
        "Input details for the action execution, such as role ARN, Region, and input artifacts.\n"]
  output : action_execution_output option;
      [@ocaml.doc "Output details for the action execution, such as the action execution result.\n"]
}
[@@ocaml.doc
  "Returns information about an execution of an action, including the action execution ID, and the \
   name, version, and timing of the action. \n"]

type nonrec action_execution_detail_list = action_execution_detail list [@@ocaml.doc ""]

type nonrec start_time_range = Latest [@ocaml.doc ""] | All [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec latest_in_pipeline_execution_filter = {
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc "The execution ID for the latest execution in the pipeline.\n"]
  start_time_range : start_time_range;
      [@ocaml.doc
        "The start time to filter on for the latest execution in the pipeline. Valid options:\n\n\
        \ {ul\n\
        \       {-  All\n\
        \           \n\
        \            }\n\
        \       {-  Latest\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The field that specifies to filter on the latest execution in the pipeline.\n\n\
  \  Filtering on the latest execution is available for executions run on or after February 08, \
   2024.\n\
  \  \n\
  \   "]

type nonrec action_execution_filter = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The pipeline execution ID used to filter action execution history.\n"]
  latest_in_pipeline_execution : latest_in_pipeline_execution_filter option;
      [@ocaml.doc
        "The latest execution in the pipeline.\n\n\
        \  Filtering on the latest execution is available for executions run on or after February \
         08, 2024.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Filter values for the action execution.\n"]

type nonrec action_execution_not_found_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The action execution was not found.\n"]

type nonrec action_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The specified action cannot be found.\n"]

type nonrec revision_change_identifier = string [@@ocaml.doc ""]

type nonrec revision = string [@@ocaml.doc ""]

type nonrec action_revision = {
  revision_id : revision;
      [@ocaml.doc
        "The system-generated unique ID that identifies the revision number of the action.\n"]
  revision_change_id : revision_change_identifier;
      [@ocaml.doc
        "The unique identifier of the change that set the state to this revision (for example, a \
         deployment ID or timestamp).\n"]
  created : timestamp;
      [@ocaml.doc
        "The date and time when the most recent version of the action was created, in timestamp \
         format.\n"]
}
[@@ocaml.doc "Represents information about the version (or revision) of an action.\n"]

type nonrec action_state = {
  action_name : action_name option; [@ocaml.doc "The name of the action.\n"]
  current_revision : action_revision option;
      [@ocaml.doc "Represents information about the version (or revision) of an action.\n"]
  latest_execution : action_execution option;
      [@ocaml.doc "Represents information about the run of an action.\n"]
  entity_url : url option;
      [@ocaml.doc
        "A URL link for more information about the state of the action, such as a deployment group \
         details page.\n"]
  revision_url : url option;
      [@ocaml.doc
        "A URL link for more information about the revision, such as a commit details page.\n"]
}
[@@ocaml.doc "Represents information about the state of an action.\n"]

type nonrec action_state_list = action_state list [@@ocaml.doc ""]

type nonrec maximum_artifact_count = int [@@ocaml.doc ""]

type nonrec minimum_artifact_count = int [@@ocaml.doc ""]

type nonrec artifact_details = {
  minimum_count : minimum_artifact_count;
      [@ocaml.doc "The minimum number of artifacts allowed for the action type.\n"]
  maximum_count : maximum_artifact_count;
      [@ocaml.doc "The maximum number of artifacts allowed for the action type.\n"]
}
[@@ocaml.doc "Returns information about the details of an artifact.\n"]

type nonrec url_template = string [@@ocaml.doc ""]

type nonrec action_type_settings = {
  third_party_configuration_url : url option;
      [@ocaml.doc
        "The URL of a sign-up page where users can sign up for an external service and perform \
         initial configuration of the action provided by that service.\n"]
  entity_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that provides a deep link to the resources \
         of the external system, such as the configuration page for a CodeDeploy deployment group. \
         This link is provided as part of the action display in the pipeline.\n"]
  execution_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that contains a link to the top-level \
         landing page for the external system, such as the console page for CodeDeploy. This link \
         is shown on the pipeline view page in the CodePipeline console and provides a link to the \
         execution entity of the external action.\n"]
  revision_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that contains a link to the page where \
         customers can update or change the configuration of the external action.\n"]
}
[@@ocaml.doc "Returns information about the settings for an action type.\n"]

type nonrec action_type = {
  id : action_type_id; [@ocaml.doc "Represents information about an action type.\n"]
  settings : action_type_settings option; [@ocaml.doc "The settings for the action type.\n"]
  action_configuration_properties : action_configuration_property_list option;
      [@ocaml.doc "The configuration properties for the action type.\n"]
  input_artifact_details : artifact_details;
      [@ocaml.doc "The details of the input artifact for the action, such as its commit ID.\n"]
  output_artifact_details : artifact_details;
      [@ocaml.doc "The details of the output artifact of the action, such as its commit ID.\n"]
}
[@@ocaml.doc "Returns information about the details of an action type.\n"]

type nonrec maximum_action_type_artifact_count = int [@@ocaml.doc ""]

type nonrec minimum_action_type_artifact_count = int [@@ocaml.doc ""]

type nonrec action_type_artifact_details = {
  minimum_count : minimum_action_type_artifact_count;
      [@ocaml.doc
        "The minimum number of artifacts that can be used with the action type. For example, you \
         should specify a minimum and maximum of zero input artifacts for an action type with a \
         category of [source].\n"]
  maximum_count : maximum_action_type_artifact_count;
      [@ocaml.doc
        "The maximum number of artifacts that can be used with the actiontype. For example, you \
         should specify a minimum and maximum of zero input artifacts for an action type with a \
         category of [source].\n"]
}
[@@ocaml.doc
  "Information about parameters for artifacts associated with the action type, such as the minimum \
   and maximum artifacts allowed.\n"]

type nonrec action_type_urls = {
  configuration_url : url option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that contains a link to the page where \
         customers can configure the external action.\n"]
  entity_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that provides a deep link to the resources \
         of the external system, such as a status page. This link is provided as part of the \
         action display in the pipeline.\n"]
  execution_url_template : url_template option;
      [@ocaml.doc
        "The link to an execution page for the action type in progress. For example, for a \
         CodeDeploy action, this link is shown on the pipeline view page in the CodePipeline \
         console, and it links to a CodeDeploy status page.\n"]
  revision_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that contains a link to the page where \
         customers can update or change the configuration of the external action.\n"]
}
[@@ocaml.doc
  "Returns information about URLs for web pages that display to customers as links on the pipeline \
   view, such as an external configuration page for the action type.\n"]

type nonrec property_description = string [@@ocaml.doc ""]

type nonrec action_type_property = {
  name : action_configuration_key; [@ocaml.doc "The property name that is displayed to users.\n"]
  optional : boolean_; [@ocaml.doc "Whether the configuration property is an optional value.\n"]
  key : boolean_; [@ocaml.doc "Whether the configuration property is a key.\n"]
  no_echo : boolean_;
      [@ocaml.doc
        "Whether to omit the field value entered by the customer in the log. If [true], the value \
         is not saved in CloudTrail logs for the action execution.\n"]
  queryable : boolean_ option;
      [@ocaml.doc
        "Indicates that the property is used with polling. An action type can have up to one \
         queryable property. If it has one, that property must be both required and not secret.\n"]
  description : property_description option;
      [@ocaml.doc "The description of the property that is displayed to users.\n"]
}
[@@ocaml.doc
  "Represents information about each property specified in the action configuration, such as the \
   description and key name that display for the customer using the action type.\n"]

type nonrec action_type_properties = action_type_property list [@@ocaml.doc ""]

type nonrec allowed_account = string [@@ocaml.doc ""]

type nonrec allowed_accounts = allowed_account list [@@ocaml.doc ""]

type nonrec action_type_permissions = {
  allowed_accounts : allowed_accounts;
      [@ocaml.doc
        "A list of Amazon Web Services account IDs with access to use the action type in their \
         pipelines.\n"]
}
[@@ocaml.doc "Details identifying the users with permissions to use the action type.\n"]

type nonrec action_type_owner = string [@@ocaml.doc ""]

type nonrec action_type_identifier = {
  category : action_category;
      [@ocaml.doc
        "Defines what kind of action can be taken in the stage, one of the following:\n\n\
        \ {ul\n\
        \       {-   [Source] \n\
        \           \n\
        \            }\n\
        \       {-   [Build] \n\
        \           \n\
        \            }\n\
        \       {-   [Test] \n\
        \           \n\
        \            }\n\
        \       {-   [Deploy] \n\
        \           \n\
        \            }\n\
        \       {-   [Approval] \n\
        \           \n\
        \            }\n\
        \       {-   [Invoke] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  owner : action_type_owner;
      [@ocaml.doc "The creator of the action type being called: [AWS] or [ThirdParty].\n"]
  provider : action_provider;
      [@ocaml.doc
        "The provider of the action type being called. The provider name is supplied when the \
         action type is created.\n"]
  version : version; [@ocaml.doc "A string that describes the action type version.\n"]
}
[@@ocaml.doc "Specifies the category, owner, provider, and version of the action type.\n"]

type nonrec job_timeout = int [@@ocaml.doc ""]

type nonrec policy_statements_template = string [@@ocaml.doc ""]

type nonrec executor_type = JobWorker [@ocaml.doc ""] | Lambda [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec service_principal = string [@@ocaml.doc ""]

type nonrec polling_service_principal_list = service_principal list [@@ocaml.doc ""]

type nonrec polling_account_list = account_id list [@@ocaml.doc ""]

type nonrec job_worker_executor_configuration = {
  polling_accounts : polling_account_list option;
      [@ocaml.doc
        "The accounts in which the job worker is configured and might poll for jobs as part of the \
         action execution.\n"]
  polling_service_principals : polling_service_principal_list option;
      [@ocaml.doc
        "The service Principals in which the job worker is configured and might poll for jobs as \
         part of the action execution.\n"]
}
[@@ocaml.doc
  "Details about the polling configuration for the [JobWorker] action engine, or executor.\n"]

type nonrec lambda_function_arn = string [@@ocaml.doc ""]

type nonrec lambda_executor_configuration = {
  lambda_function_arn : lambda_function_arn;
      [@ocaml.doc "The ARN of the Lambda function used by the action engine.\n"]
}
[@@ocaml.doc "Details about the configuration for the [Lambda] action engine, or executor.\n"]

type nonrec executor_configuration = {
  lambda_executor_configuration : lambda_executor_configuration option;
      [@ocaml.doc "Details about the [Lambda] executor of the action type.\n"]
  job_worker_executor_configuration : job_worker_executor_configuration option;
      [@ocaml.doc "Details about the [JobWorker] executor of the action type.\n"]
}
[@@ocaml.doc
  "The action engine, or executor, related to the supported integration model used to create and \
   update the action type. The available executor types are [Lambda] and [JobWorker].\n"]

type nonrec action_type_executor = {
  configuration : executor_configuration;
      [@ocaml.doc
        "The action configuration properties for the action type. These properties are specified \
         in the action definition when the action type is created.\n"]
  type_ : executor_type;
      [@ocaml.doc
        "The integration model used to create and update the action type, [Lambda] or [JobWorker]. \n"]
  policy_statements_template : policy_statements_template option;
      [@ocaml.doc
        "The policy statement that specifies the permissions in the CodePipeline customer account \
         that are needed to successfully run an action.\n\n\
        \ To grant permission to another account, specify the account ID as the Principal, a \
         domain-style identifier defined by the service, for example [codepipeline.amazonaws.com].\n\
        \ \n\
        \   The size of the passed JSON policy document cannot exceed 2048 characters.\n\
        \   \n\
        \    "]
  job_timeout : job_timeout option;
      [@ocaml.doc
        "The timeout in seconds for the job. An action execution can have multiple jobs. This is \
         the timeout for a single job, not the entire action execution.\n"]
}
[@@ocaml.doc
  "The action engine, or executor, for an action type created for a provider, where the action is \
   to be used by customers of the provider. The action engine is associated with the model used to \
   create and update the action, such as the Lambda integration model.\n"]

type nonrec action_type_description = string [@@ocaml.doc ""]

type nonrec action_type_declaration = {
  description : action_type_description option;
      [@ocaml.doc "The description for the action type to be updated.\n"]
  executor : action_type_executor;
      [@ocaml.doc
        "Information about the executor for an action type that was created with any supported \
         integration model.\n"]
  id : action_type_identifier;
      [@ocaml.doc
        "The action category, owner, provider, and version of the action type to be updated.\n"]
  input_artifact_details : action_type_artifact_details;
      [@ocaml.doc
        "Details for the artifacts, such as application files, to be worked on by the action. For \
         example, the minimum and maximum number of input artifacts allowed.\n"]
  output_artifact_details : action_type_artifact_details;
      [@ocaml.doc
        "Details for the output artifacts, such as a built application, that are the result of the \
         action. For example, the minimum and maximum number of output artifacts allowed.\n"]
  permissions : action_type_permissions option;
      [@ocaml.doc "Details identifying the accounts with permissions to use the action type.\n"]
  properties : action_type_properties option;
      [@ocaml.doc "The properties of the action type to be updated.\n"]
  urls : action_type_urls option;
      [@ocaml.doc "The links associated with the action type to be updated.\n"]
}
[@@ocaml.doc
  "The parameters for the action type definition that are provided when the action type is created \
   or updated.\n"]

type nonrec action_type_list = action_type list [@@ocaml.doc ""]

type nonrec action_type_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The specified action type cannot be found.\n"]

type nonrec approval_already_completed_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The approval action has already been approved or rejected.\n"]

type nonrec approval_status = Approved [@ocaml.doc ""] | Rejected [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec approval_summary = string [@@ocaml.doc ""]

type nonrec approval_result = {
  summary : approval_summary;
      [@ocaml.doc "The summary of the current status of the approval request.\n"]
  status : approval_status;
      [@ocaml.doc "The response submitted by a reviewer assigned to an approval action request.\n"]
}
[@@ocaml.doc "Represents information about the result of an approval request.\n"]

type nonrec approval_token = string [@@ocaml.doc ""]

type nonrec s3_object_key = string [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec s3_artifact_location = {
  bucket_name : s3_bucket_name; [@ocaml.doc "The name of the S3 bucket.\n"]
  object_key : s3_object_key;
      [@ocaml.doc
        "The key of the object in the S3 bucket, which uniquely identifies the object in the bucket.\n"]
}
[@@ocaml.doc "The location of the S3 bucket that contains a revision.\n"]

type nonrec artifact_location_type = S3 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec artifact_location = {
  type_ : artifact_location_type option; [@ocaml.doc "The type of artifact in the location.\n"]
  s3_location : s3_artifact_location option;
      [@ocaml.doc "The S3 bucket that contains the artifact.\n"]
}
[@@ocaml.doc "Represents information about the location of an artifact.\n"]

type nonrec artifact = {
  name : artifact_name option; [@ocaml.doc "The artifact's name.\n"]
  revision : revision option;
      [@ocaml.doc
        "The artifact's revision ID. Depending on the type of object, this could be a commit ID \
         (GitHub) or a revision ID (Amazon S3).\n"]
  location : artifact_location option; [@ocaml.doc "The location of an artifact.\n"]
}
[@@ocaml.doc
  "Artifacts are the files that are worked on by actions in the pipeline. See the action \
   configuration for each action for details about artifact parameters. For example, the S3 source \
   action artifact is a file name (or file path), and the files are generally provided as a ZIP \
   file. Example artifact name: SampleApp_Windows.zip\n"]

type nonrec artifact_list = artifact list [@@ocaml.doc ""]

type nonrec revision_summary = string [@@ocaml.doc ""]

type nonrec artifact_revision = {
  name : artifact_name option;
      [@ocaml.doc
        "The name of an artifact. This name might be system-generated, such as \"MyApp\", or \
         defined by the user when an action is created.\n"]
  revision_id : revision option; [@ocaml.doc "The revision ID of the artifact.\n"]
  revision_change_identifier : revision_change_identifier option;
      [@ocaml.doc
        "An additional identifier for a revision, such as a commit date or, for artifacts stored \
         in Amazon S3 buckets, the ETag value.\n"]
  revision_summary : revision_summary option;
      [@ocaml.doc
        "Summary information about the most recent revision of the artifact. For GitHub and \
         CodeCommit repositories, the commit message. For Amazon S3 buckets or actions, the \
         user-provided content of a [codepipeline-artifact-revision-summary] key specified in the \
         object metadata.\n"]
  created : timestamp option;
      [@ocaml.doc
        "The date and time when the most recent revision of the artifact was created, in timestamp \
         format.\n"]
  revision_url : url option;
      [@ocaml.doc
        "The commit ID for the artifact revision. For artifacts stored in GitHub or CodeCommit \
         repositories, the commit ID is linked to a commit details page.\n"]
}
[@@ocaml.doc "Represents revision details of an artifact. \n"]

type nonrec artifact_revision_list = artifact_revision list [@@ocaml.doc ""]

type nonrec encryption_key_type = KMS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encryption_key_id = string [@@ocaml.doc ""]

type nonrec encryption_key = {
  id : encryption_key_id;
      [@ocaml.doc
        "The ID used to identify the key. For an Amazon Web Services KMS key, you can use the key \
         ID, the key ARN, or the alias ARN.\n\n\
        \  Aliases are recognized only in the account that created the KMS key. For cross-account \
         actions, you can only use the key ID or key ARN to identify the key. Cross-account \
         actions involve using the role from the other account (AccountB), so specifying the key \
         ID will use the key from the other account (AccountB).\n\
        \  \n\
        \   "]
  type_ : encryption_key_type;
      [@ocaml.doc
        "The type of encryption key, such as an Amazon Web Services KMS key. When creating or \
         updating a pipeline, the value must be set to 'KMS'.\n"]
}
[@@ocaml.doc
  "Represents information about the key used to encrypt data in the artifact store, such as an \
   Amazon Web Services Key Management Service (Key Management Service) key.\n"]

type nonrec artifact_store_location = string [@@ocaml.doc ""]

type nonrec artifact_store_type = S3 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec artifact_store = {
  type_ : artifact_store_type; [@ocaml.doc "The type of the artifact store, such as S3.\n"]
  location : artifact_store_location;
      [@ocaml.doc
        "The S3 bucket used for storing the artifacts for a pipeline. You can specify the name of \
         an S3 bucket but not a folder in the bucket. A folder to contain the pipeline artifacts \
         is created for you based on the name of the pipeline. You can use any S3 bucket in the \
         same Amazon Web Services Region as the pipeline to store your pipeline artifacts.\n"]
  encryption_key : encryption_key option;
      [@ocaml.doc
        "The encryption key used to encrypt the data in the artifact store, such as an Amazon Web \
         Services Key Management Service key. If this is undefined, the default key for Amazon S3 \
         is used.\n"]
}
[@@ocaml.doc
  "The S3 bucket where artifacts for the pipeline are stored.\n\n\
  \  You must include either [artifactStore] or [artifactStores] in your pipeline, but you cannot \
   use both. If you create a cross-region action in your pipeline, you must use [artifactStores].\n\
  \  \n\
  \   "]

type nonrec artifact_store_map = (aws_region_name * artifact_store) list [@@ocaml.doc ""]

type nonrec rule_timeout = int [@@ocaml.doc ""]

type nonrec rule_configuration_value = string [@@ocaml.doc ""]

type nonrec rule_configuration_key = string [@@ocaml.doc ""]

type nonrec rule_configuration_map = (rule_configuration_key * rule_configuration_value) list
[@@ocaml.doc ""]

type nonrec rule_provider = string [@@ocaml.doc ""]

type nonrec rule_owner = AWS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rule_category = Rule [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rule_type_id = {
  category : rule_category;
      [@ocaml.doc
        "A category defines what kind of rule can be run in the stage, and constrains the provider \
         type for the rule. The valid category is [Rule]. \n"]
  owner : rule_owner option;
      [@ocaml.doc
        "The creator of the rule being called. The valid value for the [Owner] field in the rule \
         category is [AWS]. \n"]
  provider : rule_provider;
      [@ocaml.doc
        "The rule provider, such as the [DeploymentWindow] rule. For a list of rule provider \
         names, see the rules listed in the \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
         rule reference}.\n"]
  version : version option; [@ocaml.doc "A string that describes the rule version.\n"]
}
[@@ocaml.doc
  "The ID for the rule type, which is made up of the combined values for category, owner, \
   provider, and version. For more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions}. For more information about rules, see the \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
   rule reference}.\n"]

type nonrec rule_name = string [@@ocaml.doc ""]

type nonrec rule_declaration = {
  name : rule_name;
      [@ocaml.doc
        "The name of the rule that is created for the condition, such as [VariableCheck].\n"]
  rule_type_id : rule_type_id;
      [@ocaml.doc
        "The ID for the rule type, which is made up of the combined values for category, owner, \
         provider, and version.\n"]
  configuration : rule_configuration_map option;
      [@ocaml.doc "The action configuration fields for the rule.\n"]
  commands : command_list option;
      [@ocaml.doc
        "The shell commands to run with your commands rule in CodePipeline. All commands are \
         supported except multi-line formats. While CodeBuild logs and permissions are used, you \
         do not need to create any resources in CodeBuild.\n\n\
        \  Using compute time for this action will incur separate charges in CodeBuild.\n\
        \  \n\
        \   "]
  input_artifacts : input_artifact_list option;
      [@ocaml.doc
        "The input artifacts fields for the rule, such as specifying an input file for the rule.\n"]
  role_arn : role_arn option; [@ocaml.doc "The pipeline role ARN associated with the rule.\n"]
  region : aws_region_name option;
      [@ocaml.doc "The Region for the condition associated with the rule.\n"]
  timeout_in_minutes : rule_timeout option; [@ocaml.doc "The action timeout for the rule.\n"]
}
[@@ocaml.doc
  "Represents information about the rule to be created for an associated condition. An example \
   would be creating a new rule for an entry condition, such as a rule that checks for a test \
   result before allowing the run to enter the deployment stage. For more information about \
   conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}. For more information about rules, see the \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
   rule reference}.\n"]

type nonrec rule_declaration_list = rule_declaration list [@@ocaml.doc ""]

type nonrec result_ =
  | ROLLBACK [@ocaml.doc ""]
  | FAIL [@ocaml.doc ""]
  | RETRY [@ocaml.doc ""]
  | SKIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec condition = {
  result_ : result_ option;
      [@ocaml.doc
        "The action to be done when the condition is met. For example, rolling back an execution \
         for a failure condition.\n"]
  rules : rule_declaration_list option; [@ocaml.doc "The rules that make up the condition.\n"]
}
[@@ocaml.doc
  "The condition for the stage. A condition is made up of the rules and the result for the \
   condition. For more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}.. For more information about rules, see the \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
   rule reference}.\n"]

type nonrec condition_list = condition list [@@ocaml.doc ""]

type nonrec before_entry_conditions = {
  conditions : condition_list;
      [@ocaml.doc "The conditions that are configured as entry conditions.\n"]
}
[@@ocaml.doc
  "The conditions for making checks for entry to a stage. For more information about conditions, \
   see {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}. \n"]

type nonrec blocker_type = Schedule [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec blocker_name = string [@@ocaml.doc ""]

type nonrec blocker_declaration = {
  name : blocker_name; [@ocaml.doc "Reserved for future use.\n"]
  type_ : blocker_type; [@ocaml.doc "Reserved for future use.\n"]
}
[@@ocaml.doc "Reserved for future use.\n"]

type nonrec client_id = string [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc
  "The number of pipelines associated with the Amazon Web Services account has exceeded the limit \
   allowed for the account.\n"]

type nonrec invalid_structure_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The structure was specified in an invalid format.\n"]

type nonrec invalid_stage_declaration_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The stage declaration was specified in an invalid format.\n"]

type nonrec invalid_blocker_declaration_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "Reserved for future use.\n"]

type nonrec invalid_action_declaration_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The action declaration was specified in an invalid format.\n"]

type nonrec git_file_path_pattern = string [@@ocaml.doc ""]

type nonrec git_file_path_pattern_list = git_file_path_pattern list [@@ocaml.doc ""]

type nonrec git_file_path_filter_criteria = {
  includes : git_file_path_pattern_list option;
      [@ocaml.doc
        "The list of patterns of Git repository file paths that, when a commit is pushed, are to \
         be included as criteria that starts the pipeline.\n"]
  excludes : git_file_path_pattern_list option;
      [@ocaml.doc
        "The list of patterns of Git repository file paths that, when a commit is pushed, are to \
         be excluded from starting the pipeline.\n"]
}
[@@ocaml.doc "The Git repository file paths specified as filter criteria to start the pipeline.\n"]

type nonrec git_branch_name_pattern = string [@@ocaml.doc ""]

type nonrec git_branch_pattern_list = git_branch_name_pattern list [@@ocaml.doc ""]

type nonrec git_branch_filter_criteria = {
  includes : git_branch_pattern_list option;
      [@ocaml.doc
        "The list of patterns of Git branches that, when a commit is pushed, are to be included as \
         criteria that starts the pipeline.\n"]
  excludes : git_branch_pattern_list option;
      [@ocaml.doc
        "The list of patterns of Git branches that, when a commit is pushed, are to be excluded \
         from starting the pipeline.\n"]
}
[@@ocaml.doc "The Git repository branches specified as filter criteria to start the pipeline.\n"]

type nonrec git_pull_request_event_type =
  | OPEN [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""]
  | CLOSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec git_pull_request_event_type_list = git_pull_request_event_type list [@@ocaml.doc ""]

type nonrec git_pull_request_filter = {
  events : git_pull_request_event_type_list option;
      [@ocaml.doc
        "The field that specifies which pull request events to filter on (OPEN, UPDATED, CLOSED) \
         for the trigger configuration.\n"]
  branches : git_branch_filter_criteria option;
      [@ocaml.doc
        "The field that specifies to filter on branches for the pull request trigger configuration.\n"]
  file_paths : git_file_path_filter_criteria option;
      [@ocaml.doc
        "The field that specifies to filter on file paths for the pull request trigger \
         configuration.\n"]
}
[@@ocaml.doc
  "The event criteria for the pull request trigger configuration, such as the lists of branches or \
   file paths to include and exclude.\n\n\
  \ The following are valid values for the events for this filter:\n\
  \ \n\
  \  {ul\n\
  \        {-  CLOSED\n\
  \            \n\
  \             }\n\
  \        {-  OPEN\n\
  \            \n\
  \             }\n\
  \        {-  UPDATED\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec git_pull_request_filter_list = git_pull_request_filter list [@@ocaml.doc ""]

type nonrec git_tag_name_pattern = string [@@ocaml.doc ""]

type nonrec git_tag_pattern_list = git_tag_name_pattern list [@@ocaml.doc ""]

type nonrec git_tag_filter_criteria = {
  includes : git_tag_pattern_list option;
      [@ocaml.doc
        "The list of patterns of Git tags that, when pushed, are to be included as criteria that \
         starts the pipeline.\n"]
  excludes : git_tag_pattern_list option;
      [@ocaml.doc
        "The list of patterns of Git tags that, when pushed, are to be excluded from starting the \
         pipeline.\n"]
}
[@@ocaml.doc
  "The Git tags specified as filter criteria for whether a Git tag repository event will start the \
   pipeline.\n"]

type nonrec git_push_filter = {
  tags : git_tag_filter_criteria option;
      [@ocaml.doc "The field that contains the details for the Git tags trigger configuration.\n"]
  branches : git_branch_filter_criteria option;
      [@ocaml.doc
        "The field that specifies to filter on branches for the push trigger configuration.\n"]
  file_paths : git_file_path_filter_criteria option;
      [@ocaml.doc
        "The field that specifies to filter on file paths for the push trigger configuration.\n"]
}
[@@ocaml.doc
  "The event criteria that specify when a specified repository event will start the pipeline for \
   the specified trigger configuration, such as the lists of Git tags to include and exclude.\n"]

type nonrec git_push_filter_list = git_push_filter list [@@ocaml.doc ""]

type nonrec git_configuration = {
  source_action_name : action_name;
      [@ocaml.doc
        "The name of the pipeline source action where the trigger configuration, such as Git tags, \
         is specified. The trigger configuration will start the pipeline upon the specified change \
         only.\n\n\
        \  You can only specify one trigger configuration per source action.\n\
        \  \n\
        \   "]
  push : git_push_filter_list option;
      [@ocaml.doc
        "The field where the repository event that will start the pipeline, such as pushing Git \
         tags, is specified with details.\n"]
  pull_request : git_pull_request_filter_list option;
      [@ocaml.doc
        "The field where the repository event that will start the pipeline is specified as pull \
         requests.\n"]
}
[@@ocaml.doc
  "A type of trigger configuration for Git-based source actions.\n\n\
  \  You can specify the Git configuration trigger type for all third-party Git-based source \
   actions that are supported by the [CodeStarSourceConnection] action type.\n\
  \  \n\
  \   "]

type nonrec pipeline_trigger_provider_type = CodeStarSourceConnection [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pipeline_trigger_declaration = {
  provider_type : pipeline_trigger_provider_type;
      [@ocaml.doc
        "The source provider for the event, such as connections configured for a repository with \
         Git tags, for the specified trigger configuration.\n"]
  git_configuration : git_configuration;
      [@ocaml.doc
        "Provides the filter criteria and the source stage for the repository event that starts \
         the pipeline, such as Git tags.\n"]
}
[@@ocaml.doc
  "Represents information about the specified trigger configuration, such as the filter criteria \
   and the source stage for the action that contains the trigger.\n\n\
  \  This is only supported for the [CodeStarSourceConnection] action type.\n\
  \  \n\
  \     When a trigger configuration is specified, default change detection for repository and \
   branch commits is disabled.\n\
  \     \n\
  \      "]

type nonrec pipeline_trigger_declaration_list = pipeline_trigger_declaration list [@@ocaml.doc ""]

type nonrec pipeline_variable_description = string [@@ocaml.doc ""]

type nonrec pipeline_variable_value = string [@@ocaml.doc ""]

type nonrec pipeline_variable_name = string [@@ocaml.doc ""]

type nonrec pipeline_variable_declaration = {
  name : pipeline_variable_name; [@ocaml.doc "The name of a pipeline-level variable.\n"]
  default_value : pipeline_variable_value option;
      [@ocaml.doc "The value of a pipeline-level variable.\n"]
  description : pipeline_variable_description option;
      [@ocaml.doc
        "The description of a pipeline-level variable. It's used to add additional context about \
         the variable, and not being used at time when pipeline executes.\n"]
}
[@@ocaml.doc "A variable declared at the pipeline level.\n"]

type nonrec pipeline_variable_declaration_list = pipeline_variable_declaration list [@@ocaml.doc ""]

type nonrec pipeline_type = V1 [@ocaml.doc ""] | V2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec execution_mode =
  | QUEUED [@ocaml.doc ""]
  | SUPERSEDED [@ocaml.doc ""]
  | PARALLEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec success_conditions = {
  conditions : condition_list; [@ocaml.doc "The conditions that are success conditions.\n"]
}
[@@ocaml.doc
  "The conditions for making checks that, if met, succeed a stage. For more information about \
   conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}.\n"]

type nonrec stage_retry_mode = FAILED_ACTIONS [@ocaml.doc ""] | ALL_ACTIONS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec retry_configuration = {
  retry_mode : stage_retry_mode option;
      [@ocaml.doc
        "The method that you want to configure for automatic stage retry on stage failure. You can \
         specify to retry only failed action in the stage or all actions in the stage.\n"]
}
[@@ocaml.doc
  "The retry configuration specifies automatic retry for a failed stage, along with the configured \
   retry mode.\n"]

type nonrec failure_conditions = {
  result_ : result_ option;
      [@ocaml.doc
        "The specified result for when the failure conditions are met, such as rolling back the \
         stage.\n"]
  retry_configuration : retry_configuration option;
      [@ocaml.doc
        "The retry configuration specifies automatic retry for a failed stage, along with the \
         configured retry mode.\n"]
  conditions : condition_list option;
      [@ocaml.doc
        "The conditions that are configured as failure conditions. For more information about \
         conditions, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
         conditions} and \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
         do stage conditions work?}.\n"]
}
[@@ocaml.doc
  "The configuration that specifies the result, such as rollback, to occur upon stage failure. For \
   more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}. \n"]

type nonrec stage_action_declaration_list = action_declaration list [@@ocaml.doc ""]

type nonrec stage_blocker_declaration_list = blocker_declaration list [@@ocaml.doc ""]

type nonrec stage_declaration = {
  name : stage_name; [@ocaml.doc "The name of the stage.\n"]
  blockers : stage_blocker_declaration_list option; [@ocaml.doc "Reserved for future use.\n"]
  actions : stage_action_declaration_list; [@ocaml.doc "The actions included in a stage.\n"]
  on_failure : failure_conditions option;
      [@ocaml.doc
        "The method to use when a stage has not completed successfully. For example, configuring \
         this field for rollback will roll back a failed stage automatically to the last \
         successful pipeline execution in the stage.\n"]
  on_success : success_conditions option;
      [@ocaml.doc
        "The method to use when a stage has succeeded. For example, configuring this field for \
         conditions will allow the stage to succeed when the conditions are met.\n"]
  before_entry : before_entry_conditions option;
      [@ocaml.doc
        "The method to use when a stage allows entry. For example, configuring this field for \
         conditions will allow entry to the stage when the conditions are met.\n"]
}
[@@ocaml.doc "Represents information about a stage and its definition.\n"]

type nonrec pipeline_stage_declaration_list = stage_declaration list [@@ocaml.doc ""]

type nonrec pipeline_name = string [@@ocaml.doc ""]

type nonrec pipeline_declaration = {
  name : pipeline_name; [@ocaml.doc "The name of the pipeline.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for CodePipeline to use to either perform actions with no \
         [actionRoleArn], or to use to assume roles for actions with an [actionRoleArn].\n"]
  artifact_store : artifact_store option;
      [@ocaml.doc
        "Represents information about the S3 bucket where artifacts are stored for the pipeline.\n\n\
        \  You must include either [artifactStore] or [artifactStores] in your pipeline, but you \
         cannot use both. If you create a cross-region action in your pipeline, you must use \
         [artifactStores].\n\
        \  \n\
        \   "]
  artifact_stores : artifact_store_map option;
      [@ocaml.doc
        "A mapping of [artifactStore] objects and their corresponding Amazon Web Services Regions. \
         There must be an artifact store for the pipeline Region and for each cross-region action \
         in the pipeline.\n\n\
        \  You must include either [artifactStore] or [artifactStores] in your pipeline, but you \
         cannot use both. If you create a cross-region action in your pipeline, you must use \
         [artifactStores].\n\
        \  \n\
        \   "]
  stages : pipeline_stage_declaration_list;
      [@ocaml.doc "The stage in which to perform the action.\n"]
  version : pipeline_version option;
      [@ocaml.doc
        "The version number of the pipeline. A new pipeline always has a version number of 1. This \
         number is incremented when a pipeline is updated.\n"]
  execution_mode : execution_mode option;
      [@ocaml.doc
        "The method that the pipeline will use to handle multiple executions. The default mode is \
         SUPERSEDED.\n"]
  pipeline_type : pipeline_type option;
      [@ocaml.doc
        "CodePipeline provides the following pipeline types, which differ in characteristics and \
         price, so that you can tailor your pipeline features and cost to the needs of your \
         applications.\n\n\
        \ {ul\n\
        \       {-  V1 type pipelines have a JSON structure that contains standard pipeline, \
         stage, and action-level parameters.\n\
        \           \n\
        \            }\n\
        \       {-  V2 type pipelines have the same structure as a V1 type, along with additional \
         parameters for release safety and trigger configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Including V2 parameters, such as triggers on Git tags, in the pipeline JSON when \
         creating or updating a pipeline will result in the pipeline having the V2 type of \
         pipeline and the associated costs.\n\
        \    \n\
        \      For information about pricing for CodePipeline, see \
         {{:http://aws.amazon.com/codepipeline/pricing/}Pricing}.\n\
        \      \n\
        \        For information about which type of pipeline to choose, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/pipeline-types-planning.html}What \
         type of pipeline is right for me?}.\n\
        \       "]
  variables : pipeline_variable_declaration_list option;
      [@ocaml.doc
        "A list that defines the pipeline variables for a pipeline resource. Variable names can \
         have alphanumeric and underscore characters, and the values must match \
         [\\[A-Za-z0-9@\\-_\\]+].\n"]
  triggers : pipeline_trigger_declaration_list option;
      [@ocaml.doc
        "The trigger configuration specifying a type of event, such as Git tags, that starts the \
         pipeline.\n\n\
        \  When a trigger configuration is specified, default change detection for repository and \
         branch commits is disabled.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the structure of actions and stages to be performed in the pipeline.\n"]

type nonrec update_pipeline_output = {
  pipeline : pipeline_declaration option; [@ocaml.doc "The structure of the updated pipeline.\n"]
}
[@@ocaml.doc "Represents the output of an [UpdatePipeline] action.\n"]

type nonrec update_pipeline_input = {
  pipeline : pipeline_declaration; [@ocaml.doc "The name of the pipeline to be updated.\n"]
}
[@@ocaml.doc "Represents the input of an [UpdatePipeline] action.\n"]

type nonrec request_failed_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The request failed because of an unknown error, exception, or failure.\n"]

type nonrec update_action_type_input = {
  action_type : action_type_declaration;
      [@ocaml.doc "The action type definition for the action type to be updated.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The resource was specified in an invalid format.\n"]

type nonrec invalid_tags_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource tags are invalid.\n"]

type nonrec invalid_arn_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource ARN is invalid.\n"]

type nonrec concurrent_modification_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Unable to modify the tag due to a simultaneous update request.\n"]

type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  resource_arn : resource_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc "The list of keys for the tags to be removed from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The tags limit for a resource has been exceeded.\n"]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The tag's key.\n"]
  value : tag_value; [@ocaml.doc "The tag's value.\n"]
}
[@@ocaml.doc "A tag is a key-value pair that is used to manage the resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource you want to add tags to.\n"]
  tags : tag_list; [@ocaml.doc "The tags you want to modify or add to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec pipeline_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The pipeline was specified in an invalid format or cannot be found.\n"]

type nonrec pipeline_execution_not_stoppable_exception = {
  message : message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Unable to stop the pipeline execution. The execution might already be in a [Stopped] state, or \
   it might no longer be in progress.\n"]

type nonrec duplicated_stop_request_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The pipeline execution is already in a [Stopping] state. If you already chose to stop and wait, \
   you cannot make that request again. You can choose to stop and abandon now, but be aware that \
   this option can lead to failed tasks or out of sequence tasks. If you already chose to stop and \
   abandon, you cannot make that request again.\n"]

type nonrec conflict_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Your request cannot be handled because the pipeline is busy handling ongoing activities. Try \
   again later.\n"]

type nonrec stop_pipeline_execution_output = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The unique system-generated ID of the pipeline execution that was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_pipeline_execution_reason = string [@@ocaml.doc ""]

type nonrec stop_pipeline_execution_input = {
  pipeline_name : pipeline_name; [@ocaml.doc "The name of the pipeline to stop.\n"]
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc
        "The ID of the pipeline execution to be stopped in the current stage. Use the \
         [GetPipelineState] action to retrieve the current pipelineExecutionId.\n"]
  abandon : boolean_ option;
      [@ocaml.doc
        "Use this option to stop the pipeline execution by abandoning, rather than finishing, \
         in-progress actions.\n\n\
        \  This option can lead to failed or out-of-sequence tasks.\n\
        \  \n\
        \   "]
  reason : stop_pipeline_execution_reason option;
      [@ocaml.doc
        "Use this option to enter comments, such as the reason the pipeline was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec concurrent_pipeline_executions_limit_exceeded_exception = {
  message : message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The pipeline has reached the limit for concurrent pipeline executions.\n"]

type nonrec start_pipeline_execution_output = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The unique system-generated ID of the pipeline execution that was started.\n"]
}
[@@ocaml.doc "Represents the output of a [StartPipelineExecution] action.\n"]

type nonrec source_revision_type =
  | COMMIT_ID [@ocaml.doc ""]
  | IMAGE_DIGEST [@ocaml.doc ""]
  | S3_OBJECT_VERSION_ID [@ocaml.doc ""]
  | S3_OBJECT_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_revision_override = {
  action_name : action_name;
      [@ocaml.doc "The name of the action where the override will be applied.\n"]
  revision_type : source_revision_type;
      [@ocaml.doc
        "The type of source revision, based on the source provider. For example, the revision type \
         for the CodeCommit action provider is the commit ID.\n"]
  revision_value : revision;
      [@ocaml.doc
        "The source revision, or version of your source artifact, with the changes that you want \
         to run in the pipeline execution.\n"]
}
[@@ocaml.doc
  "A list that allows you to specify, or override, the source revision for a pipeline execution \
   that's being started. A source revision is the version with all the changes to your application \
   code, or source artifact, for the pipeline execution.\n\n\
  \  For the [S3_OBJECT_VERSION_ID] and [S3_OBJECT_KEY] types of source revisions, either of the \
   types can be used independently, or they can be used together to override the source with a \
   specific ObjectKey and VersionID.\n\
  \  \n\
  \   "]

type nonrec source_revision_override_list = source_revision_override list [@@ocaml.doc ""]

type nonrec pipeline_variable = {
  name : pipeline_variable_name; [@ocaml.doc "The name of a pipeline-level variable.\n"]
  value : pipeline_variable_value; [@ocaml.doc "The value of a pipeline-level variable.\n"]
}
[@@ocaml.doc "A pipeline-level variable used for a pipeline execution.\n"]

type nonrec pipeline_variable_list = pipeline_variable list [@@ocaml.doc ""]

type nonrec start_pipeline_execution_input = {
  name : pipeline_name; [@ocaml.doc "The name of the pipeline to start.\n"]
  variables : pipeline_variable_list option;
      [@ocaml.doc
        "A list that overrides pipeline variables for a pipeline execution that's being started. \
         Variable names must match [\\[A-Za-z0-9@\\-_\\]+], and the values can be anything except \
         an empty string.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc "The system-generated unique ID used to identify a unique execution request.\n"]
  source_revisions : source_revision_override_list option;
      [@ocaml.doc
        "A list that allows you to specify, or override, the source revision for a pipeline \
         execution that's being started. A source revision is the version with all the changes to \
         your application code, or source artifact, for the pipeline execution.\n"]
}
[@@ocaml.doc "Represents the input of a [StartPipelineExecution] action.\n"]

type nonrec unable_to_rollback_stage_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Unable to roll back the stage. The cause might be if the pipeline version has changed since the \
   target pipeline execution was deployed, the stage is currently running, or an incorrect target \
   pipeline execution ID was provided.\n"]

type nonrec stage_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The stage was specified in an invalid format or cannot be found.\n"]

type nonrec pipeline_execution_outdated_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified pipeline execution is outdated and cannot be used as a target pipeline execution \
   for rollback.\n"]

type nonrec pipeline_execution_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc
  "The pipeline execution was specified in an invalid format or cannot be found, or an execution \
   ID does not belong to the specified pipeline. \n"]

type nonrec rollback_stage_output = {
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc
        "The execution ID of the pipeline execution for the stage that has been rolled back.\n"]
}
[@@ocaml.doc ""]

type nonrec rollback_stage_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc "The name of the pipeline for which the stage will be rolled back. \n"]
  stage_name : stage_name;
      [@ocaml.doc "The name of the stage in the pipeline to be rolled back. \n"]
  target_pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc "The pipeline execution ID for the stage to be rolled back to. \n"]
}
[@@ocaml.doc ""]

type nonrec stage_not_retryable_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc
  "Unable to retry. The pipeline structure or stage state might have changed while actions awaited \
   retry, or the stage contains no failed actions.\n"]

type nonrec not_latest_pipeline_execution_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc
  "The stage has failed in a later run of the pipeline and the [pipelineExecutionId] associated \
   with the request is out of date.\n"]

type nonrec retry_stage_execution_output = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The ID of the current workflow execution in the failed stage.\n"]
}
[@@ocaml.doc "Represents the output of a [RetryStageExecution] action.\n"]

type nonrec retry_stage_execution_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc "The name of the pipeline that contains the failed stage.\n"]
  stage_name : stage_name; [@ocaml.doc "The name of the failed stage to be retried.\n"]
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc
        "The ID of the pipeline execution in the failed stage to be retried. Use the \
         [GetPipelineState] action to retrieve the current pipelineExecutionId of the failed stage\n"]
  retry_mode : stage_retry_mode; [@ocaml.doc "The scope of the retry attempt.\n"]
}
[@@ocaml.doc "Represents the input of a [RetryStageExecution] action.\n"]

type nonrec webhook_not_found_exception = unit [@@ocaml.doc ""]

type nonrec register_webhook_with_third_party_output = unit [@@ocaml.doc ""]

type nonrec webhook_name = string [@@ocaml.doc ""]

type nonrec register_webhook_with_third_party_input = {
  webhook_name : webhook_name option;
      [@ocaml.doc
        "The name of an existing webhook created with PutWebhook to register with a supported \
         third party. \n"]
}
[@@ocaml.doc ""]

type nonrec invalid_webhook_filter_pattern_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The specified event filter rule is in an invalid format.\n"]

type nonrec invalid_webhook_authentication_parameters_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The specified authentication type is in an invalid format.\n"]

type nonrec webhook_arn = string [@@ocaml.doc ""]

type nonrec webhook_last_triggered = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec webhook_error_code = string [@@ocaml.doc ""]

type nonrec webhook_error_message = string [@@ocaml.doc ""]

type nonrec webhook_url = string [@@ocaml.doc ""]

type nonrec webhook_auth_configuration_secret_token = string [@@ocaml.doc ""]

type nonrec webhook_auth_configuration_allowed_ip_range = string [@@ocaml.doc ""]

type nonrec webhook_auth_configuration = {
  allowed_ip_range : webhook_auth_configuration_allowed_ip_range option;
      [@ocaml.doc
        "The property used to configure acceptance of webhooks in an IP address range. For IP, \
         only the [AllowedIPRange] property must be set. This property must be set to a valid CIDR \
         range.\n"]
  secret_token : webhook_auth_configuration_secret_token option;
      [@ocaml.doc
        "The property used to configure GitHub authentication. For GITHUB_HMAC, only the \
         [SecretToken] property must be set.\n\n\
        \  When creating CodePipeline webhooks, do not use your own credentials or reuse the same \
         secret token across multiple webhooks. For optimal security, generate a unique secret \
         token for each webhook you create. The secret token is an arbitrary string that you \
         provide, which GitHub uses to compute and sign the webhook payloads sent to CodePipeline, \
         for protecting the integrity and authenticity of the webhook payloads. Using your own \
         credentials or reusing the same token across multiple webhooks can lead to security \
         vulnerabilities.\n\
        \  \n\
        \     If a secret token was provided, it will be redacted in the response.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc "The authentication applied to incoming webhook trigger requests.\n"]

type nonrec webhook_authentication_type =
  | GITHUB_HMAC [@ocaml.doc ""]
  | IP [@ocaml.doc ""]
  | UNAUTHENTICATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_equals = string [@@ocaml.doc ""]

type nonrec json_path = string [@@ocaml.doc ""]

type nonrec webhook_filter_rule = {
  json_path : json_path;
      [@ocaml.doc
        "A JsonPath expression that is applied to the body/payload of the webhook. The value \
         selected by the JsonPath expression must match the value specified in the [MatchEquals] \
         field. Otherwise, the request is ignored. For more information, see \
         {{:https://github.com/json-path/JsonPath}Java JsonPath implementation} in GitHub.\n"]
  match_equals : match_equals option;
      [@ocaml.doc
        "The value selected by the [JsonPath] expression must match what is supplied in the \
         [MatchEquals] field. Otherwise, the request is ignored. Properties from the target action \
         configuration can be included as placeholders in this value by surrounding the action \
         configuration key with curly brackets. For example, if the value supplied here is \
         \"refs/heads/\\{Branch\\}\" and the target action has an action configuration property \
         called \"Branch\" with a value of \"main\", the [MatchEquals] value is evaluated as \
         \"refs/heads/main\". For a list of action configuration properties for built-in action \
         types, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#action-requirements}Pipeline \
         Structure Reference Action Requirements}.\n"]
}
[@@ocaml.doc "The event criteria that specify when a webhook notification is sent to your URL.\n"]

type nonrec webhook_filters = webhook_filter_rule list [@@ocaml.doc ""]

type nonrec webhook_definition = {
  name : webhook_name; [@ocaml.doc "The name of the webhook.\n"]
  target_pipeline : pipeline_name;
      [@ocaml.doc "The name of the pipeline you want to connect to the webhook.\n"]
  target_action : action_name;
      [@ocaml.doc
        "The name of the action in a pipeline you want to connect to the webhook. The action must \
         be from the source (first) stage of the pipeline.\n"]
  filters : webhook_filters;
      [@ocaml.doc
        "A list of rules applied to the body/payload sent in the POST request to a webhook URL. \
         All defined rules must pass for the request to be accepted and the pipeline started.\n"]
  authentication : webhook_authentication_type;
      [@ocaml.doc
        "Supported options are GITHUB_HMAC, IP, and UNAUTHENTICATED.\n\n\
        \  When creating CodePipeline webhooks, do not use your own credentials or reuse the same \
         secret token across multiple webhooks. For optimal security, generate a unique secret \
         token for each webhook you create. The secret token is an arbitrary string that you \
         provide, which GitHub uses to compute and sign the webhook payloads sent to CodePipeline, \
         for protecting the integrity and authenticity of the webhook payloads. Using your own \
         credentials or reusing the same token across multiple webhooks can lead to security \
         vulnerabilities.\n\
        \  \n\
        \     If a secret token was provided, it will be redacted in the response.\n\
        \     \n\
        \       {ul\n\
        \             {-  For information about the authentication scheme implemented by \
         GITHUB_HMAC, see {{:https://developer.github.com/webhooks/securing/}Securing your \
         webhooks} on the GitHub Developer website.\n\
        \                 \n\
        \                  }\n\
        \             {-   IP rejects webhooks trigger requests unless they originate from an IP \
         address in the IP range whitelisted in the authentication configuration.\n\
        \                 \n\
        \                  }\n\
        \             {-   UNAUTHENTICATED accepts all webhook trigger requests regardless of \
         origin.\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \  "]
  authentication_configuration : webhook_auth_configuration;
      [@ocaml.doc
        "Properties that configure the authentication applied to incoming webhook trigger \
         requests. The required properties depend on the authentication type. For GITHUB_HMAC, \
         only the [SecretToken ]property must be set. For IP, only the [AllowedIPRange ]property \
         must be set to a valid CIDR range. For UNAUTHENTICATED, no properties can be set.\n"]
}
[@@ocaml.doc "Represents information about a webhook and its definition.\n"]

type nonrec list_webhook_item = {
  definition : webhook_definition;
      [@ocaml.doc
        "The detail returned for each webhook, such as the webhook authentication type and filter \
         rules.\n"]
  url : webhook_url;
      [@ocaml.doc
        "A unique URL generated by CodePipeline. When a POST request is made to this URL, the \
         defined pipeline is started as long as the body of the post request satisfies the defined \
         authentication and filtering conditions. Deleting and re-creating a webhook makes the old \
         URL invalid and generates a new one.\n"]
  error_message : webhook_error_message option;
      [@ocaml.doc "The text of the error message about the webhook.\n"]
  error_code : webhook_error_code option; [@ocaml.doc "The number code of the error.\n"]
  last_triggered : webhook_last_triggered option;
      [@ocaml.doc
        "The date and time a webhook was last successfully triggered, in timestamp format.\n"]
  arn : webhook_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the webhook.\n"]
  tags : tag_list option; [@ocaml.doc "Specifies the tags applied to the webhook.\n"]
}
[@@ocaml.doc
  "The detail returned for each webhook after listing webhooks, such as the webhook URL, the \
   webhook name, and the webhook ARN.\n"]

type nonrec put_webhook_output = {
  webhook : list_webhook_item option;
      [@ocaml.doc
        "The detail returned from creating the webhook, such as the webhook name, webhook URL, and \
         webhook ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec put_webhook_input = {
  webhook : webhook_definition;
      [@ocaml.doc
        "The detail provided in an input file to create the webhook, such as the webhook name, the \
         pipeline name, and the action name. Give the webhook a unique name that helps you \
         identify it. You might name the webhook after the pipeline and action it targets so that \
         you can easily recognize what it's used for later.\n"]
  tags : tag_list option; [@ocaml.doc "The tags for the webhook.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_job_state_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The job state was specified in an invalid format.\n"]

type nonrec execution_details = {
  summary : execution_summary option;
      [@ocaml.doc "The summary of the current status of the actions.\n"]
  external_execution_id : execution_id option;
      [@ocaml.doc
        "The system-generated unique ID of this action used to identify this job worker in any \
         external systems, such as CodeDeploy.\n"]
  percent_complete : percentage option;
      [@ocaml.doc
        "The percentage of work completed on the action, represented on a scale of 0 to 100 percent.\n"]
}
[@@ocaml.doc
  "The details of the actions taken and results produced on an artifact as it passes through \
   stages in the pipeline.\n"]

type nonrec continuation_token = string [@@ocaml.doc ""]

type nonrec time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec current_revision = {
  revision : revision; [@ocaml.doc "The revision ID of the current version of an artifact.\n"]
  change_identifier : revision_change_identifier;
      [@ocaml.doc "The change identifier for the current revision.\n"]
  created : time option;
      [@ocaml.doc
        "The date and time when the most recent revision of the artifact was created, in timestamp \
         format.\n"]
  revision_summary : revision_summary option;
      [@ocaml.doc "The summary of the most recent revision of the artifact.\n"]
}
[@@ocaml.doc "Represents information about a current revision.\n"]

type nonrec put_third_party_job_success_result_input = {
  job_id : third_party_job_id;
      [@ocaml.doc
        "The ID of the job that successfully completed. This is the same ID returned from \
         [PollForThirdPartyJobs].\n"]
  client_token : client_token;
      [@ocaml.doc
        "The clientToken portion of the clientId and clientToken pair used to verify that the \
         calling entity is allowed access to the job and its details.\n"]
  current_revision : current_revision option;
      [@ocaml.doc "Represents information about a current revision.\n"]
  continuation_token : continuation_token option;
      [@ocaml.doc
        "A token generated by a job worker, such as a CodeDeploy deployment ID, that a successful \
         job provides to identify a partner action in progress. Future jobs use this token to \
         identify the running instance of the action. It can be reused to return more information \
         about the progress of the partner action. When the action is complete, no continuation \
         token should be supplied.\n"]
  execution_details : execution_details option;
      [@ocaml.doc
        "The details of the actions taken and results produced on an artifact as it passes through \
         stages in the pipeline. \n"]
}
[@@ocaml.doc "Represents the input of a [PutThirdPartyJobSuccessResult] action.\n"]

type nonrec failure_type =
  | JobFailed [@ocaml.doc ""]
  | ConfigurationError [@ocaml.doc ""]
  | PermissionError [@ocaml.doc ""]
  | RevisionOutOfSync [@ocaml.doc ""]
  | RevisionUnavailable [@ocaml.doc ""]
  | SystemUnavailable [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failure_details = {
  type_ : failure_type; [@ocaml.doc "The type of the failure.\n"]
  message : message; [@ocaml.doc "The message about the failure.\n"]
  external_execution_id : execution_id option;
      [@ocaml.doc "The external ID of the run of the action that failed.\n"]
}
[@@ocaml.doc "Represents information about failure details.\n"]

type nonrec put_third_party_job_failure_result_input = {
  job_id : third_party_job_id;
      [@ocaml.doc
        "The ID of the job that failed. This is the same ID returned from [PollForThirdPartyJobs].\n"]
  client_token : client_token;
      [@ocaml.doc
        "The clientToken portion of the clientId and clientToken pair used to verify that the \
         calling entity is allowed access to the job and its details.\n"]
  failure_details : failure_details; [@ocaml.doc "Represents information about failure details.\n"]
}
[@@ocaml.doc "Represents the input of a [PutThirdPartyJobFailureResult] action.\n"]

type nonrec output_variables_size_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Exceeded the total size limit for all variables in the pipeline.\n"]

type nonrec put_job_success_result_input = {
  job_id : job_id;
      [@ocaml.doc
        "The unique system-generated ID of the job that succeeded. This is the same ID returned \
         from [PollForJobs].\n"]
  current_revision : current_revision option;
      [@ocaml.doc
        "The ID of the current revision of the artifact successfully worked on by the job.\n"]
  continuation_token : continuation_token option;
      [@ocaml.doc
        "A token generated by a job worker, such as a CodeDeploy deployment ID, that a successful \
         job provides to identify a custom action in progress. Future jobs use this token to \
         identify the running instance of the action. It can be reused to return more information \
         about the progress of the custom action. When the action is complete, no continuation \
         token should be supplied.\n"]
  execution_details : execution_details option;
      [@ocaml.doc
        "The execution details of the successful job, such as the actions taken by the job worker.\n"]
  output_variables : output_variables_map option;
      [@ocaml.doc
        "Key-value pairs produced as output by a job worker that can be made available to a \
         downstream action configuration. [outputVariables] can be included only when there is no \
         continuation token on the request.\n"]
}
[@@ocaml.doc "Represents the input of a [PutJobSuccessResult] action.\n"]

type nonrec put_job_failure_result_input = {
  job_id : job_id;
      [@ocaml.doc
        "The unique system-generated ID of the job that failed. This is the same ID returned from \
         [PollForJobs].\n"]
  failure_details : failure_details; [@ocaml.doc "The details about the failure of a job.\n"]
}
[@@ocaml.doc "Represents the input of a [PutJobFailureResult] action.\n"]

type nonrec invalid_approval_token_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The approval request already received a response or has expired.\n"]

type nonrec put_approval_result_output = {
  approved_at : timestamp option;
      [@ocaml.doc "The timestamp showing when the approval or rejection was submitted.\n"]
}
[@@ocaml.doc "Represents the output of a [PutApprovalResult] action.\n"]

type nonrec put_approval_result_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc "The name of the pipeline that contains the action. \n"]
  stage_name : stage_name; [@ocaml.doc "The name of the stage that contains the action.\n"]
  action_name : action_name;
      [@ocaml.doc "The name of the action for which approval is requested.\n"]
  result_ : approval_result;
      [@ocaml.doc "Represents information about the result of the approval request.\n"]
  token : approval_token;
      [@ocaml.doc
        "The system-generated token used to identify a unique approval request. The token for each \
         open approval request can be obtained using the [GetPipelineState] action. It is used to \
         validate that the approval request corresponding to this token is still valid.\n\n\
        \  For a pipeline where the execution mode is set to PARALLEL, the token required to \
         approve/reject an approval request as detailed above is not available. Instead, use the \
         [externalExecutionId] in the response output from the [ListActionExecutions] action as \
         the token in the approval request.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the input of a [PutApprovalResult] action.\n"]

type nonrec put_action_revision_output = {
  new_revision : boolean_ option;
      [@ocaml.doc
        "Indicates whether the artifact revision was previously used in an execution of the \
         specified pipeline.\n"]
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The ID of the current workflow state of the pipeline.\n"]
}
[@@ocaml.doc "Represents the output of a [PutActionRevision] action.\n"]

type nonrec put_action_revision_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc "The name of the pipeline that starts processing the revision to the source.\n"]
  stage_name : stage_name;
      [@ocaml.doc "The name of the stage that contains the action that acts on the revision.\n"]
  action_name : action_name; [@ocaml.doc "The name of the action that processes the revision.\n"]
  action_revision : action_revision;
      [@ocaml.doc "Represents information about the version (or revision) of an action.\n"]
}
[@@ocaml.doc "Represents the input of a [PutActionRevision] action.\n"]

type nonrec third_party_job = {
  client_id : client_id option;
      [@ocaml.doc
        "The [clientToken] portion of the [clientId] and [clientToken] pair used to verify that \
         the calling entity is allowed access to the job and its details.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier used to identify the job in CodePipeline.\n"]
}
[@@ocaml.doc
  "A response to a [PollForThirdPartyJobs] request returned by CodePipeline when there is a job to \
   be worked on by a partner action.\n"]

type nonrec third_party_job_list = third_party_job list [@@ocaml.doc ""]

type nonrec poll_for_third_party_jobs_output = {
  jobs : third_party_job_list option; [@ocaml.doc "Information about the jobs to take action on.\n"]
}
[@@ocaml.doc "Represents the output of a [PollForThirdPartyJobs] action.\n"]

type nonrec max_batch_size = int [@@ocaml.doc ""]

type nonrec poll_for_third_party_jobs_input = {
  action_type_id : action_type_id; [@ocaml.doc "Represents information about an action type.\n"]
  max_batch_size : max_batch_size option;
      [@ocaml.doc "The maximum number of jobs to return in a poll for jobs call.\n"]
}
[@@ocaml.doc "Represents the input of a [PollForThirdPartyJobs] action.\n"]

type nonrec pipeline_arn = string [@@ocaml.doc ""]

type nonrec stage_context = { name : stage_name option [@ocaml.doc "The name of the stage.\n"] }
[@@ocaml.doc "Represents information about a stage to a job worker.\n"]

type nonrec pipeline_context = {
  pipeline_name : pipeline_name option;
      [@ocaml.doc
        "The name of the pipeline. This is a user-specified value. Pipeline names must be unique \
         across all pipeline names under an Amazon Web Services account.\n"]
  stage : stage_context option; [@ocaml.doc "The stage of the pipeline.\n"]
  action : action_context option;
      [@ocaml.doc "The context of an action to a job worker in the stage of a pipeline.\n"]
  pipeline_arn : pipeline_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the pipeline.\n"]
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The execution ID of the pipeline.\n"]
}
[@@ocaml.doc
  "Represents information about a pipeline to a job worker.\n\n\
  \  PipelineContext contains [pipelineArn] and [pipelineExecutionId] for custom action jobs. The \
   [pipelineArn] and [pipelineExecutionId] fields are not populated for ThirdParty action jobs.\n\
  \  \n\
  \   "]

type nonrec job_data = {
  action_type_id : action_type_id option;
      [@ocaml.doc "Represents information about an action type.\n"]
  action_configuration : action_configuration option;
      [@ocaml.doc "Represents information about an action configuration.\n"]
  pipeline_context : pipeline_context option;
      [@ocaml.doc
        "Represents information about a pipeline to a job worker.\n\n\
        \  Includes [pipelineArn] and [pipelineExecutionId] for custom jobs.\n\
        \  \n\
        \   "]
  input_artifacts : artifact_list option; [@ocaml.doc "The artifact supplied to the job.\n"]
  output_artifacts : artifact_list option; [@ocaml.doc "The output of the job.\n"]
  artifact_credentials : aws_session_credentials option;
      [@ocaml.doc
        "Represents an Amazon Web Services session credentials object. These credentials are \
         temporary credentials that are issued by Amazon Web Services Secure Token Service (STS). \
         They can be used to access input and output artifacts in the S3 bucket used to store \
         artifacts for the pipeline in CodePipeline.\n"]
  continuation_token : continuation_token option;
      [@ocaml.doc
        "A system-generated token, such as a deployment ID, required by a job to continue the job \
         asynchronously.\n"]
  encryption_key : encryption_key option;
      [@ocaml.doc
        "Represents information about the key used to encrypt data in the artifact store, such as \
         an KMS key. \n"]
}
[@@ocaml.doc
  "Represents other information about a job required for a job worker to complete the job.\n"]

type nonrec job = {
  id : job_id option; [@ocaml.doc "The unique system-generated ID of the job.\n"]
  data : job_data option; [@ocaml.doc "Other data about a job.\n"]
  nonce : nonce option;
      [@ocaml.doc
        "A system-generated random number that CodePipeline uses to ensure that the job is being \
         worked on by only one job worker. Use this number in an [AcknowledgeJob] request.\n"]
  account_id : account_id option;
      [@ocaml.doc "The ID of the Amazon Web Services account to use when performing the job.\n"]
}
[@@ocaml.doc "Represents information about a job.\n"]

type nonrec job_list = job list [@@ocaml.doc ""]

type nonrec poll_for_jobs_output = {
  jobs : job_list option; [@ocaml.doc "Information about the jobs to take action on.\n"]
}
[@@ocaml.doc "Represents the output of a [PollForJobs] action.\n"]

type nonrec query_param_map = (action_configuration_key * action_configuration_queryable_value) list
[@@ocaml.doc ""]

type nonrec poll_for_jobs_input = {
  action_type_id : action_type_id; [@ocaml.doc "Represents information about an action type.\n"]
  max_batch_size : max_batch_size option;
      [@ocaml.doc "The maximum number of jobs to return in a poll for jobs call.\n"]
  query_param : query_param_map option;
      [@ocaml.doc
        "A map of property names and values. For an action type with no queryable properties, this \
         value must be null or an empty map. For an action type with a queryable property, you \
         must supply that property as a key in the map. Only jobs whose action configuration \
         matches the mapped value are returned.\n"]
}
[@@ocaml.doc "Represents the input of a [PollForJobs] action.\n"]

type nonrec condition_not_overridable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Unable to override because the condition does not allow overrides.\n"]

type nonrec condition_type = BEFORE_ENTRY [@ocaml.doc ""] | ON_SUCCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec override_stage_condition_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc "The name of the pipeline with the stage that will override the condition.\n"]
  stage_name : stage_name; [@ocaml.doc "The name of the stage for the override.\n"]
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc "The ID of the pipeline execution for the override.\n"]
  condition_type : condition_type;
      [@ocaml.doc
        "The type of condition to override for the stage, such as entry conditions, failure \
         conditions, or success conditions.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc
  "The next token was specified in an invalid format. Make sure that the next token you provide is \
   the token returned by a previous call.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec webhook_list = list_webhook_item list [@@ocaml.doc ""]

type nonrec list_webhooks_output = {
  webhooks : webhook_list option;
      [@ocaml.doc
        "The JSON detail returned for each webhook in the list output for the ListWebhooks call.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the amount of returned information is significantly large, an identifier is also \
         returned and can be used in a subsequent ListWebhooks call to return the next set of \
         webhooks in the list. \n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_webhooks_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token that was returned from the previous ListWebhooks call, which can be used to \
         return the next set of webhooks in the list.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned nextToken value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  tags : tag_list option; [@ocaml.doc "The tags for the resource.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the amount of returned information is significantly large, an identifier is also \
         returned and can be used in a subsequent API call to return the next page of the list. \
         The ListTagsforResource call lists all available tags in one call and does not use \
         pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to get tags for.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token that was returned from the previous API call, which would be used to return the \
         next page of the list. The ListTagsforResource call lists all available tags in one call \
         and does not use pagination.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_configuration_property_type =
  | String [@ocaml.doc ""]
  | Number [@ocaml.doc ""]
  | Boolean [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_configuration_property = {
  name : rule_configuration_key; [@ocaml.doc "The name of the rule configuration property.\n"]
  required : boolean_; [@ocaml.doc "Whether the configuration property is a required value.\n"]
  key : boolean_; [@ocaml.doc "Whether the configuration property is a key.\n"]
  secret : boolean_;
      [@ocaml.doc
        "Whether the configuration property is secret.\n\n\
        \ When updating a pipeline, passing * * * * * without changing any other values of the \
         action preserves the previous value of the secret.\n\
        \ "]
  queryable : boolean_ option;
      [@ocaml.doc
        "Indicates whether the property can be queried.\n\n\
        \ If you create a pipeline with a condition and rule, and that rule contains a queryable \
         property, the value for that configuration property is subject to other restrictions. The \
         value must be less than or equal to twenty (20) characters. The value can contain only \
         alphanumeric characters, underscores, and hyphens.\n\
        \ "]
  description : description option;
      [@ocaml.doc
        "The description of the action configuration property that is displayed to users.\n"]
  type_ : rule_configuration_property_type option;
      [@ocaml.doc "The type of the configuration property.\n"]
}
[@@ocaml.doc "Represents information about a rule configuration property.\n"]

type nonrec rule_configuration_property_list = rule_configuration_property list [@@ocaml.doc ""]

type nonrec rule_type_settings = {
  third_party_configuration_url : url option;
      [@ocaml.doc
        "The URL of a sign-up page where users can sign up for an external service and perform \
         initial configuration of the action provided by that service.\n"]
  entity_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that provides a deep link to the resources \
         of the external system, such as the configuration page for a CodeDeploy deployment group. \
         This link is provided as part of the action display in the pipeline.\n"]
  execution_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that contains a link to the top-level \
         landing page for the external system, such as the console page for CodeDeploy. This link \
         is shown on the pipeline view page in the CodePipeline console and provides a link to the \
         execution entity of the external action.\n"]
  revision_url_template : url_template option;
      [@ocaml.doc
        "The URL returned to the CodePipeline console that contains a link to the page where \
         customers can update or change the configuration of the external action.\n"]
}
[@@ocaml.doc "Returns information about the settings for a rule type.\n"]

type nonrec rule_type = {
  id : rule_type_id; [@ocaml.doc "Represents information about a rule type.\n"]
  settings : rule_type_settings option;
      [@ocaml.doc "Returns information about the settings for a rule type.\n"]
  rule_configuration_properties : rule_configuration_property_list option;
      [@ocaml.doc "The configuration properties for the rule type.\n"]
  input_artifact_details : artifact_details; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The rule type, which is made up of the combined values for category, owner, provider, and \
   version.\n"]

type nonrec rule_type_list = rule_type list [@@ocaml.doc ""]

type nonrec list_rule_types_output = {
  rule_types : rule_type_list;
      [@ocaml.doc "Lists the rules that are configured for the condition.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rule_types_input = {
  rule_owner_filter : rule_owner option; [@ocaml.doc "The rule owner to filter on.\n"]
  region_filter : aws_region_name option; [@ocaml.doc "The rule Region to filter on.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_execution_result = {
  external_execution_id : external_execution_id option;
      [@ocaml.doc "The external ID for the rule execution.\n"]
  external_execution_summary : external_execution_summary option;
      [@ocaml.doc "The external provider summary for the rule execution.\n"]
  external_execution_url : url option;
      [@ocaml.doc
        "The deepest external link to the external resource (for example, a repository URL or \
         deployment endpoint) that is used when running the rule.\n"]
  error_details : error_details option; [@ocaml.doc ""]
}
[@@ocaml.doc "Execution result information, such as the external execution ID.\n"]

type nonrec rule_execution_output = {
  execution_result : rule_execution_result option;
      [@ocaml.doc
        "Execution result information listed in the output details for a rule execution.\n"]
}
[@@ocaml.doc "Output details listed for a rule execution, such as the rule execution result.\n"]

type nonrec resolved_rule_configuration_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec rule_execution_input = {
  rule_type_id : rule_type_id option;
      [@ocaml.doc
        "The ID for the rule type, which is made up of the combined values for category, owner, \
         provider, and version. For more information about conditions, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
         conditions}. For more information about rules, see the \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
         rule reference}.\n"]
  configuration : rule_configuration_map option;
      [@ocaml.doc
        "Configuration data for a rule execution, such as the resolved values for that run.\n"]
  resolved_configuration : resolved_rule_configuration_map option;
      [@ocaml.doc
        "Configuration data for a rule execution with all variable references replaced with their \
         real values for the execution.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the IAM service role that performs the declared rule. This is assumed through \
         the roleArn for the pipeline.\n"]
  region : aws_region_name option;
      [@ocaml.doc "The Amazon Web Services Region for the rule, such as us-east-1.\n"]
  input_artifacts : artifact_detail_list option;
      [@ocaml.doc "Details of input artifacts of the rule that correspond to the rule execution.\n"]
}
[@@ocaml.doc "Input information used for a rule execution.\n"]

type nonrec rule_execution_status =
  | InProgress [@ocaml.doc ""]
  | Abandoned [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_execution_id = string [@@ocaml.doc ""]

type nonrec rule_execution_detail = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc
        "The ID of the pipeline execution in the stage where the rule was run. Use the \
         [GetPipelineState] action to retrieve the current pipelineExecutionId of the stage.\n"]
  rule_execution_id : rule_execution_id option; [@ocaml.doc "The ID of the run for the rule.\n"]
  pipeline_version : pipeline_version option;
      [@ocaml.doc "The version number of the pipeline with the stage where the rule was run.\n"]
  stage_name : stage_name option; [@ocaml.doc "The name of the stage where the rule was run.\n"]
  rule_name : rule_name option; [@ocaml.doc "The name of the rule that was run in the stage.\n"]
  start_time : timestamp option; [@ocaml.doc "The start time of the rule execution.\n"]
  last_update_time : timestamp option;
      [@ocaml.doc
        "The date and time of the last change to the rule execution, in timestamp format.\n"]
  updated_by : last_updated_by option;
      [@ocaml.doc "The ARN of the user who changed the rule execution details.\n"]
  status : rule_execution_status option;
      [@ocaml.doc
        "The status of the rule execution. Status categories are [InProgress], [Succeeded], and \
         [Failed]. \n"]
  input : rule_execution_input option;
      [@ocaml.doc
        "Input details for the rule execution, such as role ARN, Region, and input artifacts.\n"]
  output : rule_execution_output option;
      [@ocaml.doc "Output details for the rule execution, such as the rule execution result.\n"]
}
[@@ocaml.doc
  "The details of the runs for a rule and the results produced on an artifact as it passes through \
   stages in the pipeline.\n"]

type nonrec rule_execution_detail_list = rule_execution_detail list [@@ocaml.doc ""]

type nonrec list_rule_executions_output = {
  rule_execution_details : rule_execution_detail_list option;
      [@ocaml.doc "Details about the output for listing rule executions.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token that can be used in the next [ListRuleExecutions] call. To view all items in the \
         list, continue to call this operation with each subsequent token until no more nextToken \
         values are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_execution_filter = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The pipeline execution ID used to filter rule execution history.\n"]
  latest_in_pipeline_execution : latest_in_pipeline_execution_filter option; [@ocaml.doc ""]
}
[@@ocaml.doc "Filter values for the rule execution.\n"]

type nonrec list_rule_executions_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc
        "The name of the pipeline for which you want to get execution summary information.\n"]
  filter : rule_execution_filter option;
      [@ocaml.doc "Input information used to filter rule execution history.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned nextToken value. Pipeline history is limited \
         to the most recent 12 months, based on pipeline execution start times. Default value is \
         100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token that was returned from the previous [ListRuleExecutions] call, which can be \
         used to return the next set of rule executions in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec pipeline_summary = {
  name : pipeline_name option; [@ocaml.doc "The name of the pipeline.\n"]
  version : pipeline_version option; [@ocaml.doc "The version number of the pipeline.\n"]
  pipeline_type : pipeline_type option;
      [@ocaml.doc
        "CodePipeline provides the following pipeline types, which differ in characteristics and \
         price, so that you can tailor your pipeline features and cost to the needs of your \
         applications.\n\n\
        \ {ul\n\
        \       {-  V1 type pipelines have a JSON structure that contains standard pipeline, \
         stage, and action-level parameters.\n\
        \           \n\
        \            }\n\
        \       {-  V2 type pipelines have the same structure as a V1 type, along with additional \
         parameters for release safety and trigger configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Including V2 parameters, such as triggers on Git tags, in the pipeline JSON when \
         creating or updating a pipeline will result in the pipeline having the V2 type of \
         pipeline and the associated costs.\n\
        \    \n\
        \      For information about pricing for CodePipeline, see \
         {{:http://aws.amazon.com/codepipeline/pricing/}Pricing}.\n\
        \      \n\
        \        For information about which type of pipeline to choose, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/pipeline-types-planning.html}What \
         type of pipeline is right for me?}.\n\
        \       "]
  execution_mode : execution_mode option;
      [@ocaml.doc
        "The method that the pipeline will use to handle multiple executions. The default mode is \
         SUPERSEDED.\n"]
  created : timestamp option;
      [@ocaml.doc "The date and time the pipeline was created, in timestamp format.\n"]
  updated : timestamp option;
      [@ocaml.doc "The date and time of the last update to the pipeline, in timestamp format.\n"]
}
[@@ocaml.doc "Returns a summary of a pipeline.\n"]

type nonrec pipeline_list = pipeline_summary list [@@ocaml.doc ""]

type nonrec list_pipelines_output = {
  pipelines : pipeline_list option; [@ocaml.doc "The list of pipelines.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the amount of returned information is significantly large, an identifier is also \
         returned. It can be used in a subsequent list pipelines call to return the next set of \
         pipelines in the list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListPipelines] action.\n"]

type nonrec max_pipelines = int [@@ocaml.doc ""]

type nonrec list_pipelines_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous list pipelines call. It can be used to \
         return the next set of pipelines in the list.\n"]
  max_results : max_pipelines option;
      [@ocaml.doc
        "The maximum number of pipelines to return in a single call. To retrieve the remaining \
         pipelines, make another call with the returned nextToken value. The minimum value you can \
         specify is 1. The maximum accepted value is 1000.\n"]
}
[@@ocaml.doc "Represents the input of a [ListPipelines] action.\n"]

type nonrec pipeline_rollback_metadata = {
  rollback_target_pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The pipeline execution ID to which the stage will be rolled back.\n"]
}
[@@ocaml.doc "The metadata for the stage execution to be rolled back.\n"]

type nonrec execution_type = STANDARD [@ocaml.doc ""] | ROLLBACK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec stop_execution_trigger = {
  reason : stop_pipeline_execution_reason option;
      [@ocaml.doc "The user-specified reason the pipeline was stopped.\n"]
}
[@@ocaml.doc "The interaction that stopped a pipeline execution.\n"]

type nonrec trigger_detail = string [@@ocaml.doc ""]

type nonrec trigger_type =
  | CreatePipeline [@ocaml.doc ""]
  | StartPipelineExecution [@ocaml.doc ""]
  | PollForSourceChanges [@ocaml.doc ""]
  | Webhook [@ocaml.doc ""]
  | CloudWatchEvent [@ocaml.doc ""]
  | PutActionRevision [@ocaml.doc ""]
  | WebhookV2 [@ocaml.doc ""]
  | ManualRollback [@ocaml.doc ""]
  | AutomatedRollback [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_trigger = {
  trigger_type : trigger_type option;
      [@ocaml.doc
        "The type of change-detection method, command, or user interaction that started a pipeline \
         execution.\n"]
  trigger_detail : trigger_detail option;
      [@ocaml.doc
        "Detail related to the event that started a pipeline execution, such as the webhook ARN of \
         the webhook that triggered the pipeline execution or the user ARN for a user-initiated \
         [start-pipeline-execution] CLI command.\n"]
}
[@@ocaml.doc "The interaction or event that started a pipeline execution.\n"]

type nonrec source_revision = {
  action_name : action_name;
      [@ocaml.doc "The name of the action that processed the revision to the source artifact.\n"]
  revision_id : revision option;
      [@ocaml.doc
        "The system-generated unique ID that identifies the revision number of the artifact.\n"]
  revision_summary : revision_summary option;
      [@ocaml.doc
        "Summary information about the most recent revision of the artifact. For GitHub and \
         CodeCommit repositories, the commit message. For Amazon S3 buckets or actions, the \
         user-provided content of a [codepipeline-artifact-revision-summary] key specified in the \
         object metadata.\n"]
  revision_url : url option;
      [@ocaml.doc
        "The commit ID for the artifact revision. For artifacts stored in GitHub or CodeCommit \
         repositories, the commit ID is linked to a commit details page.\n"]
}
[@@ocaml.doc
  "Information about the version (or revision) of a source artifact that initiated a pipeline \
   execution.\n"]

type nonrec source_revision_list = source_revision list [@@ocaml.doc ""]

type nonrec pipeline_execution_status_summary = string [@@ocaml.doc ""]

type nonrec pipeline_execution_status =
  | Cancelled [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | Stopped [@ocaml.doc ""]
  | Stopping [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Superseded [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pipeline_execution_summary = {
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The ID of the pipeline execution.\n"]
  status : pipeline_execution_status option;
      [@ocaml.doc
        "The status of the pipeline execution.\n\n\
        \ {ul\n\
        \       {-  InProgress: The pipeline execution is currently running.\n\
        \           \n\
        \            }\n\
        \       {-  Stopped: The pipeline execution was manually stopped. For more information, \
         see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped}Stopped \
         Executions}.\n\
        \           \n\
        \            }\n\
        \       {-  Stopping: The pipeline execution received a request to be manually stopped. \
         Depending on the selected stop mode, the execution is either completing or abandoning \
         in-progress actions. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped}Stopped \
         Executions}.\n\
        \           \n\
        \            }\n\
        \       {-  Succeeded: The pipeline execution was completed successfully. \n\
        \           \n\
        \            }\n\
        \       {-  Superseded: While this pipeline execution was waiting for the next stage to be \
         completed, a newer pipeline execution advanced and continued through the pipeline \
         instead. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-superseded}Superseded \
         Executions}.\n\
        \           \n\
        \            }\n\
        \       {-  Failed: The pipeline execution was not completed successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_summary : pipeline_execution_status_summary option;
      [@ocaml.doc "Status summary for the pipeline.\n"]
  start_time : timestamp option;
      [@ocaml.doc "The date and time when the pipeline execution began, in timestamp format.\n"]
  last_update_time : timestamp option;
      [@ocaml.doc
        "The date and time of the last change to the pipeline execution, in timestamp format.\n"]
  source_revisions : source_revision_list option;
      [@ocaml.doc "A list of the source artifact revisions that initiated a pipeline execution.\n"]
  trigger : execution_trigger option;
      [@ocaml.doc
        "The interaction or event that started a pipeline execution, such as automated change \
         detection or a [StartPipelineExecution] API call.\n"]
  stop_trigger : stop_execution_trigger option;
      [@ocaml.doc "The interaction that stopped a pipeline execution.\n"]
  execution_mode : execution_mode option;
      [@ocaml.doc
        "The method that the pipeline will use to handle multiple executions. The default mode is \
         SUPERSEDED.\n"]
  execution_type : execution_type option; [@ocaml.doc "Type of the pipeline execution.\n"]
  rollback_metadata : pipeline_rollback_metadata option;
      [@ocaml.doc "The metadata for the stage execution to be rolled back.\n"]
}
[@@ocaml.doc "Summary information about a pipeline execution.\n"]

type nonrec pipeline_execution_summary_list = pipeline_execution_summary list [@@ocaml.doc ""]

type nonrec list_pipeline_executions_output = {
  pipeline_execution_summaries : pipeline_execution_summary_list option;
      [@ocaml.doc "A list of executions in the history of a pipeline.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token that can be used in the next [ListPipelineExecutions] call. To view all items in \
         the list, continue to call this operation with each subsequent token until no more \
         nextToken values are returned.\n"]
}
[@@ocaml.doc "Represents the output of a [ListPipelineExecutions] action.\n"]

type nonrec succeeded_in_stage_filter = {
  stage_name : stage_name option;
      [@ocaml.doc
        "The name of the stage for filtering for pipeline executions where the stage was \
         successful in the current pipeline version.\n"]
}
[@@ocaml.doc
  "Filter for pipeline executions that have successfully completed the stage in the current \
   pipeline version.\n"]

type nonrec pipeline_execution_filter = {
  succeeded_in_stage : succeeded_in_stage_filter option;
      [@ocaml.doc
        "Filter for pipeline executions where the stage was successful in the current pipeline \
         version.\n"]
}
[@@ocaml.doc "The pipeline execution to filter on.\n"]

type nonrec list_pipeline_executions_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc
        "The name of the pipeline for which you want to get execution summary information.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned nextToken value. Pipeline history is limited \
         to the most recent 12 months, based on pipeline execution start times. Default value is \
         100.\n"]
  filter : pipeline_execution_filter option; [@ocaml.doc "The pipeline execution to filter on.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token that was returned from the previous [ListPipelineExecutions] call, which can be \
         used to return the next set of pipeline executions in the list.\n"]
}
[@@ocaml.doc "Represents the input of a [ListPipelineExecutions] action.\n"]

type nonrec deploy_target_event_context = {
  ssm_command_id : string_ option;
      [@ocaml.doc "The command ID for the event for the deploy action.\n"]
  message : string_ option; [@ocaml.doc "The context message for the event for the deploy action.\n"]
}
[@@ocaml.doc "The context for the event for the deploy action.\n"]

type nonrec deploy_target_event = {
  name : string_ option; [@ocaml.doc "The name of the event for the deploy action.\n"]
  status : string_ option; [@ocaml.doc "The status of the event for the deploy action.\n"]
  start_time : timestamp option;
      [@ocaml.doc "The start time for the event for the deploy action.\n"]
  end_time : timestamp option; [@ocaml.doc "The end time for the event for the deploy action.\n"]
  context : deploy_target_event_context option;
      [@ocaml.doc "The context for the event for the deploy action.\n"]
}
[@@ocaml.doc "A lifecycle event for the deploy action.\n"]

type nonrec deploy_target_event_list = deploy_target_event list [@@ocaml.doc ""]

type nonrec deploy_action_execution_target = {
  target_id : string_ option; [@ocaml.doc "The ID of the target for the deploy action.\n"]
  target_type : string_ option; [@ocaml.doc "The type of target for the deploy action.\n"]
  status : string_ option; [@ocaml.doc "The status of the deploy action.\n"]
  start_time : timestamp option; [@ocaml.doc "The start time for the deploy action.\n"]
  end_time : timestamp option; [@ocaml.doc "The end time for the deploy action.\n"]
  events : deploy_target_event_list option;
      [@ocaml.doc "The lifecycle events for the deploy action.\n"]
}
[@@ocaml.doc "The target for the deploy action.\n"]

type nonrec deploy_action_execution_target_list = deploy_action_execution_target list
[@@ocaml.doc ""]

type nonrec list_deploy_action_execution_targets_output = {
  targets : deploy_action_execution_target_list option;
      [@ocaml.doc "The targets for the deploy action.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous list action types call, which can be \
         used to return the next set of action types in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec target_filter_value = string [@@ocaml.doc ""]

type nonrec target_filter_value_list = target_filter_value list [@@ocaml.doc ""]

type nonrec target_filter_name = TARGET_STATUS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec target_filter = {
  name : target_filter_name option; [@ocaml.doc "The name on which to filter.\n"]
  values : target_filter_value_list option; [@ocaml.doc "The values on which to filter.\n"]
}
[@@ocaml.doc "Filters the list of targets.\n"]

type nonrec target_filter_list = target_filter list [@@ocaml.doc ""]

type nonrec list_deploy_action_execution_targets_input = {
  pipeline_name : pipeline_name option;
      [@ocaml.doc "The name of the pipeline with the deploy action.\n"]
  action_execution_id : action_execution_id;
      [@ocaml.doc "The execution ID for the deploy action.\n"]
  filters : target_filter_list option;
      [@ocaml.doc "Filters the targets for a specified deploy action.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned nextToken value.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous list action types call, which can be \
         used to return the next set of action types in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_action_types_output = {
  action_types : action_type_list; [@ocaml.doc "Provides details of the action types.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the amount of returned information is significantly large, an identifier is also \
         returned. It can be used in a subsequent list action types call to return the next set of \
         action types in the list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListActionTypes] action.\n"]

type nonrec list_action_types_input = {
  action_owner_filter : action_owner option;
      [@ocaml.doc "Filters the list of action types to those created by a specified entity.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous list action types call, which can be \
         used to return the next set of action types in the list.\n"]
  region_filter : aws_region_name option;
      [@ocaml.doc "The Region to filter on for the list of action types.\n"]
}
[@@ocaml.doc "Represents the input of a [ListActionTypes] action.\n"]

type nonrec list_action_executions_output = {
  action_execution_details : action_execution_detail_list option;
      [@ocaml.doc "The details for a list of recent executions, such as action execution ID.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the amount of returned information is significantly large, an identifier is also \
         returned and can be used in a subsequent [ListActionExecutions] call to return the next \
         set of action executions in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_action_executions_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc
        " The name of the pipeline for which you want to list action execution history.\n"]
  filter : action_execution_filter option;
      [@ocaml.doc "Input information used to filter action execution history.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned nextToken value. Action execution history is \
         retained for up to 12 months, based on action execution start times. Default value is \
         100. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token that was returned from the previous [ListActionExecutions] call, which can be \
         used to return the next set of action executions in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_job_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The job was specified in an invalid format or cannot be found.\n"]

type nonrec third_party_job_data = {
  action_type_id : action_type_id option;
      [@ocaml.doc "Represents information about an action type.\n"]
  action_configuration : action_configuration option;
      [@ocaml.doc "Represents information about an action configuration.\n"]
  pipeline_context : pipeline_context option;
      [@ocaml.doc
        "Represents information about a pipeline to a job worker.\n\n\
        \  Does not include [pipelineArn] and [pipelineExecutionId] for ThirdParty jobs.\n\
        \  \n\
        \   "]
  input_artifacts : artifact_list option;
      [@ocaml.doc
        "The name of the artifact that is worked on by the action, if any. This name might be \
         system-generated, such as \"MyApp\", or it might be defined by the user when the action \
         is created. The input artifact name must match the name of an output artifact generated \
         by an action in an earlier action or stage of the pipeline.\n"]
  output_artifacts : artifact_list option;
      [@ocaml.doc
        "The name of the artifact that is the result of the action, if any. This name might be \
         system-generated, such as \"MyBuiltApp\", or it might be defined by the user when the \
         action is created.\n"]
  artifact_credentials : aws_session_credentials option;
      [@ocaml.doc
        "Represents an Amazon Web Services session credentials object. These credentials are \
         temporary credentials that are issued by Amazon Web Services Secure Token Service (STS). \
         They can be used to access input and output artifacts in the S3 bucket used to store \
         artifact for the pipeline in CodePipeline. \n"]
  continuation_token : continuation_token option;
      [@ocaml.doc
        "A system-generated token, such as a CodeDeploy deployment ID, that a job requires to \
         continue the job asynchronously.\n"]
  encryption_key : encryption_key option;
      [@ocaml.doc
        "The encryption key used to encrypt and decrypt data in the artifact store for the \
         pipeline, such as an Amazon Web Services Key Management Service (Amazon Web Services KMS) \
         key. This is optional and might not be present.\n"]
}
[@@ocaml.doc "Represents information about the job data for a partner action.\n"]

type nonrec third_party_job_details = {
  id : third_party_job_id option;
      [@ocaml.doc "The identifier used to identify the job details in CodePipeline.\n"]
  data : third_party_job_data option;
      [@ocaml.doc "The data to be returned by the third party job worker.\n"]
  nonce : nonce option;
      [@ocaml.doc
        "A system-generated random number that CodePipeline uses to ensure that the job is being \
         worked on by only one job worker. Use this number in an [AcknowledgeThirdPartyJob] \
         request.\n"]
}
[@@ocaml.doc "The details of a job sent in response to a [GetThirdPartyJobDetails] request.\n"]

type nonrec get_third_party_job_details_output = {
  job_details : third_party_job_details option;
      [@ocaml.doc "The details of the job, including any protected values defined for the job.\n"]
}
[@@ocaml.doc "Represents the output of a [GetThirdPartyJobDetails] action.\n"]

type nonrec get_third_party_job_details_input = {
  job_id : third_party_job_id;
      [@ocaml.doc "The unique system-generated ID used for identifying the job.\n"]
  client_token : client_token;
      [@ocaml.doc
        "The clientToken portion of the clientId and clientToken pair used to verify that the \
         calling entity is allowed access to the job and its details.\n"]
}
[@@ocaml.doc "Represents the input of a [GetThirdPartyJobDetails] action.\n"]

type nonrec retry_trigger = AutomatedStageRetry [@ocaml.doc ""] | ManualStageRetry [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec retry_attempt = int [@@ocaml.doc ""]

type nonrec retry_stage_metadata = {
  auto_stage_retry_attempt : retry_attempt option;
      [@ocaml.doc
        "The number of attempts for a specific stage with automatic retry on stage failure. One \
         attempt is allowed for automatic stage retry on failure.\n"]
  manual_stage_retry_attempt : retry_attempt option;
      [@ocaml.doc
        "The number of attempts for a specific stage where manual retries have been made upon \
         stage failure.\n"]
  latest_retry_trigger : retry_trigger option;
      [@ocaml.doc
        "The latest trigger for a specific stage where manual or automatic retries have been made \
         upon stage failure.\n"]
}
[@@ocaml.doc
  "The details of a specific automatic retry on stage failure, including the attempt number and \
   trigger.\n"]

type nonrec rule_execution_token = string [@@ocaml.doc ""]

type nonrec rule_execution = {
  rule_execution_id : rule_execution_id option;
      [@ocaml.doc "The execution ID for the run of the rule.\n"]
  status : rule_execution_status option;
      [@ocaml.doc "The status of the run of the rule, such as FAILED.\n"]
  summary : execution_summary option; [@ocaml.doc "A summary of the run of the rule.\n"]
  last_status_change : timestamp option; [@ocaml.doc "The last status change of the rule.\n"]
  token : rule_execution_token option;
      [@ocaml.doc "The system-generated token used to identify a unique request.\n"]
  last_updated_by : last_updated_by option;
      [@ocaml.doc "The ARN of the user who last changed the rule.\n"]
  external_execution_id : execution_id option;
      [@ocaml.doc "The external ID of the run of the rule.\n"]
  external_execution_url : url option;
      [@ocaml.doc
        "The URL of a resource external to Amazon Web Services that is used when running the rule \
         (for example, an external repository URL).\n"]
  error_details : error_details option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Represents information about each time a rule is run as part of the pipeline execution for a \
   pipeline configured with conditions.\n"]

type nonrec rule_revision = {
  revision_id : revision;
      [@ocaml.doc
        "The system-generated unique ID that identifies the revision number of the rule.\n"]
  revision_change_id : revision_change_identifier;
      [@ocaml.doc
        "The unique identifier of the change that set the state to this revision (for example, a \
         deployment ID or timestamp).\n"]
  created : timestamp;
      [@ocaml.doc
        "The date and time when the most recent version of the rule was created, in timestamp \
         format.\n"]
}
[@@ocaml.doc "The change to a rule that creates a revision of the rule.\n"]

type nonrec rule_state = {
  rule_name : rule_name option; [@ocaml.doc "The name of the rule.\n"]
  current_revision : rule_revision option;
      [@ocaml.doc
        "The ID of the current revision of the artifact successfully worked on by the job.\n"]
  latest_execution : rule_execution option;
      [@ocaml.doc "Represents information about the latest run of an rule.\n"]
  entity_url : url option;
      [@ocaml.doc
        "A URL link for more information about the state of the action, such as a details page.\n"]
  revision_url : url option;
      [@ocaml.doc
        "A URL link for more information about the revision, such as a commit details page.\n"]
}
[@@ocaml.doc
  "Returns information about the state of a rule.\n\n\
  \  Values returned in the [revisionId] field indicate the rule revision information, such as the \
   commit ID, for the current state.\n\
  \  \n\
  \   "]

type nonrec rule_state_list = rule_state list [@@ocaml.doc ""]

type nonrec condition_execution_status =
  | InProgress [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Errored [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Cancelled [@ocaml.doc ""]
  | Abandoned [@ocaml.doc ""]
  | Overridden [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec condition_execution = {
  status : condition_execution_status option;
      [@ocaml.doc "The status of the run for a condition.\n"]
  summary : execution_summary option;
      [@ocaml.doc "The summary of information about a run for a condition.\n"]
  last_status_change : timestamp option; [@ocaml.doc "The last status change of the condition.\n"]
}
[@@ocaml.doc "The run of a condition.\n"]

type nonrec condition_state = {
  latest_execution : condition_execution option;
      [@ocaml.doc "The state of the latest run of the rule.\n"]
  rule_states : rule_state_list option; [@ocaml.doc "The state of the rules for the condition.\n"]
}
[@@ocaml.doc "Information about the state of the condition.\n"]

type nonrec condition_state_list = condition_state list [@@ocaml.doc ""]

type nonrec stage_conditions_execution = {
  status : condition_execution_status option;
      [@ocaml.doc "The status of a run of a condition for a stage.\n"]
  summary : execution_summary option;
      [@ocaml.doc "A summary of the run of the condition for a stage.\n"]
}
[@@ocaml.doc "Represents information about the run of a condition for a stage.\n"]

type nonrec stage_condition_state = {
  latest_execution : stage_conditions_execution option;
      [@ocaml.doc "Represents information about the latest run of a condition for a stage.\n"]
  condition_states : condition_state_list option;
      [@ocaml.doc "The states of the conditions for a run of a condition for a stage.\n"]
}
[@@ocaml.doc "The state of a run of a condition for a stage.\n"]

type nonrec stage_execution_status =
  | Cancelled [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Stopped [@ocaml.doc ""]
  | Stopping [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Skipped [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stage_execution = {
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc "The ID of the pipeline execution associated with the stage.\n"]
  status : stage_execution_status;
      [@ocaml.doc
        "The status of the stage, or for a completed stage, the last status of the stage.\n\n\
        \  A status of cancelled means that the pipeline\226\128\153s definition was updated \
         before the stage execution could be completed.\n\
        \  \n\
        \   "]
  type_ : execution_type option;
      [@ocaml.doc
        "The type of pipeline execution for the stage, such as a rollback pipeline execution.\n"]
}
[@@ocaml.doc "Represents information about the run of a stage.\n"]

type nonrec disabled_reason = string [@@ocaml.doc ""]

type nonrec last_changed_at = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_changed_by = string [@@ocaml.doc ""]

type nonrec enabled = bool [@@ocaml.doc ""]

type nonrec transition_state = {
  enabled : enabled option;
      [@ocaml.doc "Whether the transition between stages is enabled (true) or disabled (false).\n"]
  last_changed_by : last_changed_by option;
      [@ocaml.doc "The ID of the user who last changed the transition state.\n"]
  last_changed_at : last_changed_at option;
      [@ocaml.doc "The timestamp when the transition state was last changed.\n"]
  disabled_reason : disabled_reason option;
      [@ocaml.doc
        "The user-specified reason why the transition between two stages of a pipeline was disabled.\n"]
}
[@@ocaml.doc
  "Represents information about the state of transitions between one stage and another stage.\n"]

type nonrec stage_execution_list = stage_execution list [@@ocaml.doc ""]

type nonrec stage_state = {
  stage_name : stage_name option; [@ocaml.doc "The name of the stage.\n"]
  inbound_execution : stage_execution option; [@ocaml.doc ""]
  inbound_executions : stage_execution_list option;
      [@ocaml.doc "The inbound executions for a stage.\n"]
  inbound_transition_state : transition_state option;
      [@ocaml.doc "The state of the inbound transition, which is either enabled or disabled.\n"]
  action_states : action_state_list option; [@ocaml.doc "The state of the stage.\n"]
  latest_execution : stage_execution option;
      [@ocaml.doc
        "Information about the latest execution in the stage, including its ID and status.\n"]
  before_entry_condition_state : stage_condition_state option;
      [@ocaml.doc "The state of the entry conditions for a stage.\n"]
  on_success_condition_state : stage_condition_state option;
      [@ocaml.doc "The state of the success conditions for a stage.\n"]
  on_failure_condition_state : stage_condition_state option;
      [@ocaml.doc "The state of the failure conditions for a stage.\n"]
  retry_stage_metadata : retry_stage_metadata option;
      [@ocaml.doc
        "he details of a specific automatic retry on stage failure, including the attempt number \
         and trigger.\n"]
}
[@@ocaml.doc "Represents information about the state of the stage.\n"]

type nonrec stage_state_list = stage_state list [@@ocaml.doc ""]

type nonrec get_pipeline_state_output = {
  pipeline_name : pipeline_name option;
      [@ocaml.doc "The name of the pipeline for which you want to get the state.\n"]
  pipeline_version : pipeline_version option;
      [@ocaml.doc
        "The version number of the pipeline.\n\n\
        \  A newly created pipeline is always assigned a version number of [1].\n\
        \  \n\
        \   "]
  stage_states : stage_state_list option;
      [@ocaml.doc
        "A list of the pipeline stage output information, including stage name, state, most recent \
         run details, whether the stage is disabled, and other data.\n"]
  created : timestamp option;
      [@ocaml.doc "The date and time the pipeline was created, in timestamp format.\n"]
  updated : timestamp option;
      [@ocaml.doc "The date and time the pipeline was last updated, in timestamp format.\n"]
}
[@@ocaml.doc "Represents the output of a [GetPipelineState] action.\n"]

type nonrec get_pipeline_state_input = {
  name : pipeline_name;
      [@ocaml.doc "The name of the pipeline about which you want to get information.\n"]
}
[@@ocaml.doc "Represents the input of a [GetPipelineState] action.\n"]

type nonrec resolved_pipeline_variable = {
  name : string_ option; [@ocaml.doc "The name of a pipeline-level variable.\n"]
  resolved_value : string_ option; [@ocaml.doc "The resolved value of a pipeline-level variable.\n"]
}
[@@ocaml.doc "A pipeline-level variable used for a pipeline execution.\n"]

type nonrec resolved_pipeline_variable_list = resolved_pipeline_variable list [@@ocaml.doc ""]

type nonrec pipeline_execution = {
  pipeline_name : pipeline_name option;
      [@ocaml.doc "The name of the pipeline with the specified pipeline execution.\n"]
  pipeline_version : pipeline_version option;
      [@ocaml.doc "The version number of the pipeline with the specified pipeline execution.\n"]
  pipeline_execution_id : pipeline_execution_id option;
      [@ocaml.doc "The ID of the pipeline execution.\n"]
  status : pipeline_execution_status option;
      [@ocaml.doc
        "The status of the pipeline execution.\n\n\
        \ {ul\n\
        \       {-  Cancelled: The pipeline\226\128\153s definition was updated before the \
         pipeline execution could be completed.\n\
        \           \n\
        \            }\n\
        \       {-  InProgress: The pipeline execution is currently running.\n\
        \           \n\
        \            }\n\
        \       {-  Stopped: The pipeline execution was manually stopped. For more information, \
         see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped}Stopped \
         Executions}.\n\
        \           \n\
        \            }\n\
        \       {-  Stopping: The pipeline execution received a request to be manually stopped. \
         Depending on the selected stop mode, the execution is either completing or abandoning \
         in-progress actions. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped}Stopped \
         Executions}.\n\
        \           \n\
        \            }\n\
        \       {-  Succeeded: The pipeline execution was completed successfully. \n\
        \           \n\
        \            }\n\
        \       {-  Superseded: While this pipeline execution was waiting for the next stage to be \
         completed, a newer pipeline execution advanced and continued through the pipeline \
         instead. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-superseded}Superseded \
         Executions}.\n\
        \           \n\
        \            }\n\
        \       {-  Failed: The pipeline execution was not completed successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_summary : pipeline_execution_status_summary option;
      [@ocaml.doc "A summary that contains a description of the pipeline execution status.\n"]
  artifact_revisions : artifact_revision_list option;
      [@ocaml.doc "A list of [ArtifactRevision] objects included in a pipeline execution.\n"]
  variables : resolved_pipeline_variable_list option;
      [@ocaml.doc "A list of pipeline variables used for the pipeline execution.\n"]
  trigger : execution_trigger option; [@ocaml.doc ""]
  execution_mode : execution_mode option;
      [@ocaml.doc
        "The method that the pipeline will use to handle multiple executions. The default mode is \
         SUPERSEDED.\n"]
  execution_type : execution_type option; [@ocaml.doc "The type of the pipeline execution.\n"]
  rollback_metadata : pipeline_rollback_metadata option;
      [@ocaml.doc "The metadata about the execution pertaining to stage rollback.\n"]
}
[@@ocaml.doc "Represents information about an execution of a pipeline.\n"]

type nonrec get_pipeline_execution_output = {
  pipeline_execution : pipeline_execution option;
      [@ocaml.doc "Represents information about the execution of a pipeline.\n"]
}
[@@ocaml.doc "Represents the output of a [GetPipelineExecution] action.\n"]

type nonrec get_pipeline_execution_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc "The name of the pipeline about which you want to get execution details.\n"]
  pipeline_execution_id : pipeline_execution_id;
      [@ocaml.doc
        "The ID of the pipeline execution about which you want to get execution details.\n"]
}
[@@ocaml.doc "Represents the input of a [GetPipelineExecution] action.\n"]

type nonrec pipeline_version_not_found_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The pipeline version was specified in an invalid format or cannot be found.\n"]

type nonrec pipeline_metadata = {
  pipeline_arn : pipeline_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the pipeline.\n"]
  created : timestamp option;
      [@ocaml.doc "The date and time the pipeline was created, in timestamp format.\n"]
  updated : timestamp option;
      [@ocaml.doc "The date and time the pipeline was last updated, in timestamp format.\n"]
  polling_disabled_at : timestamp option;
      [@ocaml.doc
        "The date and time that polling for source changes (periodic checks) was stopped for the \
         pipeline, in timestamp format. \n\n\
        \  Pipelines that are inactive for longer than 30 days will have polling disabled for the \
         pipeline. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#metadata.pollingDisabledAt}pollingDisabledAt} \
         in the pipeline structure reference. For the steps to migrate your pipeline from polling \
         to event-based change detection, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/update-change-detection.html}Migrate \
         polling pipelines to use event-based change detection}.\n\
        \  \n\
        \    You can migrate (update) a polling pipeline to use event-based change detection. For \
         example, for a pipeline with a CodeCommit source, we recommend you migrate (update) your \
         pipeline to use CloudWatch Events. To learn more, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/update-change-detection.html}Migrate \
         polling pipelines to use event-based change detection} in the {i CodePipeline User Guide}.\n\
        \    "]
}
[@@ocaml.doc "Information about a pipeline.\n"]

type nonrec get_pipeline_output = {
  pipeline : pipeline_declaration option;
      [@ocaml.doc
        "Represents the structure of actions and stages to be performed in the pipeline. \n"]
  metadata : pipeline_metadata option;
      [@ocaml.doc
        "Represents the pipeline metadata information returned as part of the output of a \
         [GetPipeline] action.\n"]
}
[@@ocaml.doc "Represents the output of a [GetPipeline] action.\n"]

type nonrec get_pipeline_input = {
  name : pipeline_name;
      [@ocaml.doc
        "The name of the pipeline for which you want to get information. Pipeline names must be \
         unique in an Amazon Web Services account.\n"]
  version : pipeline_version option;
      [@ocaml.doc
        "The version number of the pipeline. If you do not specify a version, defaults to the \
         current version.\n"]
}
[@@ocaml.doc "Represents the input of a [GetPipeline] action.\n"]

type nonrec job_details = {
  id : job_id option; [@ocaml.doc "The unique system-generated ID of the job.\n"]
  data : job_data option;
      [@ocaml.doc
        "Represents other information about a job required for a job worker to complete the job. \n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the job.\n"]
}
[@@ocaml.doc "Represents information about the details of a job.\n"]

type nonrec get_job_details_output = {
  job_details : job_details option;
      [@ocaml.doc
        "The details of the job.\n\n\
        \  If AWSSessionCredentials is used, a long-running job can call [GetJobDetails] again to \
         obtain new credentials.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the output of a [GetJobDetails] action.\n"]

type nonrec get_job_details_input = {
  job_id : job_id; [@ocaml.doc "The unique system-generated ID for the job.\n"]
}
[@@ocaml.doc "Represents the input of a [GetJobDetails] action.\n"]

type nonrec get_action_type_output = {
  action_type : action_type_declaration option;
      [@ocaml.doc
        "The action type information for the requested action type, such as the action type ID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_action_type_input = {
  category : action_category;
      [@ocaml.doc
        "Defines what kind of action can be taken in the stage. The following are the valid \
         values:\n\n\
        \ {ul\n\
        \       {-   [Source] \n\
        \           \n\
        \            }\n\
        \       {-   [Build] \n\
        \           \n\
        \            }\n\
        \       {-   [Test] \n\
        \           \n\
        \            }\n\
        \       {-   [Deploy] \n\
        \           \n\
        \            }\n\
        \       {-   [Approval] \n\
        \           \n\
        \            }\n\
        \       {-   [Invoke] \n\
        \           \n\
        \            }\n\
        \       {-   [Compute] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  owner : action_type_owner;
      [@ocaml.doc
        "The creator of an action type that was created with any supported integration model. \
         There are two valid values: [AWS] and [ThirdParty].\n"]
  provider : action_provider;
      [@ocaml.doc
        "The provider of the action type being called. The provider name is specified when the \
         action type is created.\n"]
  version : version; [@ocaml.doc "A string that describes the action type version.\n"]
}
[@@ocaml.doc ""]

type nonrec stage_transition_type = Inbound [@ocaml.doc ""] | Outbound [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec enable_stage_transition_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc
        "The name of the pipeline in which you want to enable the flow of artifacts from one stage \
         to another.\n"]
  stage_name : stage_name;
      [@ocaml.doc
        "The name of the stage where you want to enable the transition of artifacts, either into \
         the stage (inbound) or from that stage to the next stage (outbound).\n"]
  transition_type : stage_transition_type;
      [@ocaml.doc
        "Specifies whether artifacts are allowed to enter the stage and be processed by the \
         actions in that stage (inbound) or whether already processed artifacts are allowed to \
         transition to the next stage (outbound).\n"]
}
[@@ocaml.doc "Represents the input of an [EnableStageTransition] action.\n"]

type nonrec disable_stage_transition_input = {
  pipeline_name : pipeline_name;
      [@ocaml.doc
        "The name of the pipeline in which you want to disable the flow of artifacts from one \
         stage to another.\n"]
  stage_name : stage_name;
      [@ocaml.doc
        "The name of the stage where you want to disable the inbound or outbound transition of \
         artifacts.\n"]
  transition_type : stage_transition_type;
      [@ocaml.doc
        "Specifies whether artifacts are prevented from transitioning into the stage and being \
         processed by the actions in that stage (inbound), or prevented from transitioning from \
         the stage after they have been processed by the actions in that stage (outbound).\n"]
  reason : disabled_reason;
      [@ocaml.doc
        "The reason given to the user that a stage is disabled, such as waiting for manual \
         approval or manual tests. This message is displayed in the pipeline console UI.\n"]
}
[@@ocaml.doc "Represents the input of a [DisableStageTransition] action.\n"]

type nonrec deregister_webhook_with_third_party_output = unit [@@ocaml.doc ""]

type nonrec deregister_webhook_with_third_party_input = {
  webhook_name : webhook_name option;
      [@ocaml.doc "The name of the webhook you want to deregister.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_webhook_output = unit [@@ocaml.doc ""]

type nonrec delete_webhook_input = {
  name : webhook_name; [@ocaml.doc "The name of the webhook you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_pipeline_input = {
  name : pipeline_name; [@ocaml.doc "The name of the pipeline to be deleted.\n"]
}
[@@ocaml.doc "Represents the input of a [DeletePipeline] action.\n"]

type nonrec delete_custom_action_type_input = {
  category : action_category;
      [@ocaml.doc
        "The category of the custom action that you want to delete, such as source or deploy.\n"]
  provider : action_provider;
      [@ocaml.doc "The provider of the service used in the custom action, such as CodeDeploy.\n"]
  version : version; [@ocaml.doc "The version of the custom action to delete.\n"]
}
[@@ocaml.doc
  "Represents the input of a [DeleteCustomActionType] operation. The custom action will be marked \
   as deleted.\n"]

type nonrec pipeline_name_in_use_exception = {
  message : message option;
      [@ocaml.doc "The message provided to the user in the event of an exception.\n"]
}
[@@ocaml.doc "The specified pipeline name is already in use.\n"]

type nonrec create_pipeline_output = {
  pipeline : pipeline_declaration option;
      [@ocaml.doc
        "Represents the structure of actions and stages to be performed in the pipeline. \n"]
  tags : tag_list option; [@ocaml.doc "Specifies the tags applied to the pipeline.\n"]
}
[@@ocaml.doc "Represents the output of a [CreatePipeline] action.\n"]

type nonrec create_pipeline_input = {
  pipeline : pipeline_declaration;
      [@ocaml.doc
        "Represents the structure of actions and stages to be performed in the pipeline. \n"]
  tags : tag_list option; [@ocaml.doc "The tags for the pipeline.\n"]
}
[@@ocaml.doc "Represents the input of a [CreatePipeline] action.\n"]

type nonrec create_custom_action_type_output = {
  action_type : action_type;
      [@ocaml.doc "Returns information about the details of an action type.\n"]
  tags : tag_list option; [@ocaml.doc "Specifies the tags applied to the custom action.\n"]
}
[@@ocaml.doc "Represents the output of a [CreateCustomActionType] operation.\n"]

type nonrec create_custom_action_type_input = {
  category : action_category;
      [@ocaml.doc "The category of the custom action, such as a build action or a test action.\n"]
  provider : action_provider;
      [@ocaml.doc "The provider of the service used in the custom action, such as CodeDeploy.\n"]
  version : version; [@ocaml.doc "The version identifier of the custom action.\n"]
  settings : action_type_settings option;
      [@ocaml.doc "URLs that provide users information about this custom action.\n"]
  configuration_properties : action_configuration_property_list option;
      [@ocaml.doc
        "The configuration properties for the custom action.\n\n\
        \  You can refer to a name in the configuration properties of the custom action within the \
         URL templates by following the format of \\{Config:name\\}, as long as the configuration \
         property is both required and not secret. For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/how-to-create-custom-action.html}Create \
         a Custom Action for a Pipeline}.\n\
        \  \n\
        \   "]
  input_artifact_details : artifact_details;
      [@ocaml.doc "The details of the input artifact for the action, such as its commit ID.\n"]
  output_artifact_details : artifact_details;
      [@ocaml.doc "The details of the output artifact of the action, such as its commit ID.\n"]
  tags : tag_list option; [@ocaml.doc "The tags for the custom action.\n"]
}
[@@ocaml.doc "Represents the input of a CreateCustomActionType operation.\n"]
