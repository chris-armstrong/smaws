type nonrec xml_string_max_len256 = string [@@ocaml.doc ""]

type nonrec xml_string_max_len256_list = xml_string_max_len256 list [@@ocaml.doc ""]

type nonrec xml_string = string [@@ocaml.doc ""]

type nonrec xml_string_list = xml_string list [@@ocaml.doc ""]

type nonrec whole_number = int [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec throughput_val = int [@@ocaml.doc ""]

type nonrec volume_specification = {
  throughput : throughput_val option;
      [@ocaml.doc
        "The throughput, in mebibyte per second (MiB/s). This optional parameter can be a number \
         from 125 - 1000 and is valid only for gp3 volumes.\n"]
  size_in_g_b : integer;
      [@ocaml.doc
        "The volume size, in gibibytes (GiB). This can be a number from 1 - 1024. If the volume \
         type is EBS-optimized, the minimum value is 10.\n"]
  iops : integer option;
      [@ocaml.doc "The number of I/O operations per second (IOPS) that the volume supports.\n"]
  volume_type : string_;
      [@ocaml.doc
        "The volume type. Volume types supported are gp3, gp2, io1, st1, sc1, and standard.\n"]
}
[@@ocaml.doc
  "EBS volume specifications such as volume type, IOPS, size (GiB) and throughput (MiB/s) that are \
   requested for the EBS volume attached to an Amazon EC2 instance in the cluster.\n"]

type nonrec utilization_performance_index_integer = int [@@ocaml.doc ""]

type nonrec username_password = {
  password : xml_string_max_len256 option;
      [@ocaml.doc
        "The password associated with the temporary credentials that you use to connect to cluster \
         endpoints.\n"]
  username : xml_string_max_len256 option;
      [@ocaml.doc
        "The username associated with the temporary credentials that you use to connect to cluster \
         endpoints.\n"]
}
[@@ocaml.doc "The username and password that you use to connect to cluster endpoints.\n"]

type nonrec uri_string = string [@@ocaml.doc ""]

type nonrec identity_type = GROUP [@ocaml.doc ""] | USER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_studio_session_mapping_input = {
  session_policy_arn : xml_string_max_len256;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the session policy to associate with the specified user \
         or group.\n"]
  identity_type : identity_type;
      [@ocaml.doc "Specifies whether the identity to update is a user or a group.\n"]
  identity_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the user or group to update. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName}UserName} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName}DisplayName} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified.\n"]
  identity_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The globally unique identifier (GUID) of the user or group. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId}UserId} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId}GroupId} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified.\n"]
  studio_id : xml_string_max_len256; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec invalid_request_exception = {
  message : error_message option; [@ocaml.doc "The message associated with the exception.\n"]
  error_code : error_code option; [@ocaml.doc "The error code associated with the exception.\n"]
}
[@@ocaml.doc "This exception occurs when there is something wrong with user input.\n"]

type nonrec internal_server_error = unit [@@ocaml.doc ""]

type nonrec subnet_id_list = string_ list [@@ocaml.doc ""]

type nonrec update_studio_input = {
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook \
         files when backed up to Amazon S3.\n"]
  default_s3_location : xml_string option;
      [@ocaml.doc
        "The Amazon S3 location to back up Workspaces and notebook files for the Amazon EMR Studio.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc
        "A list of subnet IDs to associate with the Amazon EMR Studio. The list can include new \
         subnet IDs, but must also include all of the subnet IDs previously associated with the \
         Studio. The list order does not matter. A Studio can have a maximum of 5 subnets. The \
         subnets must belong to the same VPC as the Studio. \n"]
  description : xml_string_max_len256 option;
      [@ocaml.doc "A detailed description to assign to the Amazon EMR Studio.\n"]
  name : xml_string_max_len256 option;
      [@ocaml.doc "A descriptive name for the Amazon EMR Studio.\n"]
  studio_id : xml_string_max_len256; [@ocaml.doc "The ID of the Amazon EMR Studio to update.\n"]
}
[@@ocaml.doc ""]

type nonrec internal_server_exception = {
  message : error_message option; [@ocaml.doc "The message associated with the exception.\n"]
}
[@@ocaml.doc "This exception occurs when there is an internal failure in the Amazon EMR service.\n"]

type nonrec unit_ =
  | COUNT_PER_SECOND [@ocaml.doc ""]
  | TERA_BITS_PER_SECOND [@ocaml.doc ""]
  | GIGA_BITS_PER_SECOND [@ocaml.doc ""]
  | MEGA_BITS_PER_SECOND [@ocaml.doc ""]
  | KILO_BITS_PER_SECOND [@ocaml.doc ""]
  | BITS_PER_SECOND [@ocaml.doc ""]
  | TERA_BYTES_PER_SECOND [@ocaml.doc ""]
  | GIGA_BYTES_PER_SECOND [@ocaml.doc ""]
  | MEGA_BYTES_PER_SECOND [@ocaml.doc ""]
  | KILO_BYTES_PER_SECOND [@ocaml.doc ""]
  | BYTES_PER_SECOND [@ocaml.doc ""]
  | COUNT [@ocaml.doc ""]
  | PERCENT [@ocaml.doc ""]
  | TERA_BITS [@ocaml.doc ""]
  | GIGA_BITS [@ocaml.doc ""]
  | MEGA_BITS [@ocaml.doc ""]
  | KILO_BITS [@ocaml.doc ""]
  | BITS [@ocaml.doc ""]
  | TERA_BYTES [@ocaml.doc ""]
  | GIGA_BYTES [@ocaml.doc ""]
  | MEGA_BYTES [@ocaml.doc ""]
  | KILO_BYTES [@ocaml.doc ""]
  | BYTES [@ocaml.doc ""]
  | MILLI_SECONDS [@ocaml.doc ""]
  | MICRO_SECONDS [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_id = string [@@ocaml.doc ""]

type nonrec session_id = string [@@ocaml.doc ""]

type nonrec session_state =
  | FAILED [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | BUSY [@ocaml.doc ""]
  | IDLE [@ocaml.doc ""]
  | STARTED [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec terminate_session_output = {
  state : session_state;
      [@ocaml.doc "The state of the session after the terminate request has been accepted.\n"]
  session_id : session_id; [@ocaml.doc "The ID of the terminated session.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster that the session belonged to.\n"]
}
[@@ocaml.doc "Output of the [TerminateSession] operation.\n"]

type nonrec terminate_session_input = {
  session_id : session_id; [@ocaml.doc "The ID of the session to terminate.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster that the session belongs to.\n"]
}
[@@ocaml.doc "Input to the [TerminateSession] operation.\n"]

type nonrec terminate_job_flows_input = {
  job_flow_ids : xml_string_list; [@ocaml.doc "A list of job flows to be shut down.\n"]
}
[@@ocaml.doc " Input to the [TerminateJobFlows] operation. \n"]

type nonrec tag = {
  value : string_ option;
      [@ocaml.doc
        "A user-defined value, which is optional in a tag. For more information, see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag \
         Clusters}. \n"]
  key : string_ option;
      [@ocaml.doc
        "A user-defined key, which is the minimum required information for a valid tag. For more \
         information, see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag}. \n"]
}
[@@ocaml.doc
  "A key-value pair containing user-defined metadata that you can associate with an Amazon EMR \
   resource. Tags make it easier to associate clusters in various ways, such as grouping clusters \
   to track your Amazon EMR resource allocation costs. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag Clusters}. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec supported_products_list = xml_string_max_len256 list [@@ocaml.doc ""]

type nonrec supported_product_config = {
  args : xml_string_list option; [@ocaml.doc "The list of user-supplied arguments.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "The name of the product configuration.\n"]
}
[@@ocaml.doc
  "The list of supported product configurations that allow user-supplied arguments. Amazon EMR \
   accepts these arguments and forwards them to the corresponding installation script as bootstrap \
   action arguments.\n"]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec supported_instance_type = {
  architecture : string_ option;
      [@ocaml.doc "The CPU architecture, for example [X86_64] or [AARCH64].\n"]
  ebs_storage_only : boolean_ option;
      [@ocaml.doc "Indicates whether the [SupportedInstanceType] only supports Amazon EBS.\n"]
  number_of_disks : integer option;
      [@ocaml.doc
        "Number of disks for the [SupportedInstanceType]. This value is [0] for Amazon EBS-only \
         instance types.\n"]
  ebs_optimized_by_default : boolean_ option;
      [@ocaml.doc
        "Indicates whether the [SupportedInstanceType] uses Amazon EBS optimization by default.\n"]
  ebs_optimized_available : boolean_ option;
      [@ocaml.doc
        "Indicates whether the [SupportedInstanceType] supports Amazon EBS optimization.\n"]
  instance_family_id : string_ option;
      [@ocaml.doc "The Amazon EC2 family and generation for the [SupportedInstanceType].\n"]
  is64_bits_only : boolean_ option;
      [@ocaml.doc
        "Indicates whether the [SupportedInstanceType] only supports 64-bit architecture.\n"]
  vcp_u : integer option;
      [@ocaml.doc "The number of vCPUs available for the [SupportedInstanceType].\n"]
  storage_g_b : integer option;
      [@ocaml.doc
        " [StorageGB] represents the storage capacity of the [SupportedInstanceType]. This value \
         is [0] for Amazon EBS-only instance types.\n"]
  memory_g_b : float_ option;
      [@ocaml.doc
        "The amount of memory that is available to Amazon EMR from the [SupportedInstanceType]. \
         The kernel and hypervisor software consume some memory, so this value might be lower than \
         the overall memory for the instance type.\n"]
  type_ : string_ option;
      [@ocaml.doc
        "The {{:http://aws.amazon.com/ec2/instance-types/}Amazon EC2 instance type}, for example \
         [m5.xlarge], of the [SupportedInstanceType].\n"]
}
[@@ocaml.doc "An instance type that the specified Amazon EMR release supports.\n"]

type nonrec supported_instance_types_list = supported_instance_type list [@@ocaml.doc ""]

type nonrec auth_mode = IAM [@ocaml.doc ""] | SSO [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec studio_summary = {
  creation_time : date option; [@ocaml.doc "The time when the Amazon EMR Studio was created.\n"]
  auth_mode : auth_mode option;
      [@ocaml.doc
        "Specifies whether the Studio authenticates users using IAM or IAM Identity Center.\n"]
  url : xml_string_max_len256 option;
      [@ocaml.doc "The unique access URL of the Amazon EMR Studio.\n"]
  description : xml_string_max_len256 option;
      [@ocaml.doc "The detailed description of the Amazon EMR Studio.\n"]
  vpc_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The ID of the Virtual Private Cloud (Amazon VPC) associated with the Amazon EMR Studio.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "The name of the Amazon EMR Studio.\n"]
  studio_id : xml_string_max_len256 option; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc
  "Details for an Amazon EMR Studio, including ID, Name, VPC, and Description. To fetch additional \
   details such as subnets, IAM roles, security groups, and tags for the Studio, use the \
   [DescribeStudio] API.\n"]

type nonrec studio_summary_list = studio_summary list [@@ocaml.doc ""]

type nonrec arn_type = string [@@ocaml.doc ""]

type nonrec boolean_object = bool [@@ocaml.doc ""]

type nonrec idc_user_assignment = OPTIONAL [@ocaml.doc ""] | REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec studio = {
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook \
         files when backed up to Amazon S3.\n"]
  idc_user_assignment : idc_user_assignment option;
      [@ocaml.doc
        " Indicates whether the Studio has [REQUIRED] or [OPTIONAL] IAM Identity Center user \
         assignment. If the value is set to [REQUIRED], users must be explicitly assigned to the \
         Studio application to access the Studio. \n"]
  trusted_identity_propagation_enabled : boolean_object option;
      [@ocaml.doc
        " Indicates whether the Studio has Trusted identity propagation enabled. The default value \
         is [false]. \n"]
  idc_instance_arn : arn_type option;
      [@ocaml.doc
        " The ARN of the IAM Identity Center instance the Studio application belongs to. \n"]
  tags : tag_list option; [@ocaml.doc "A list of tags associated with the Amazon EMR Studio.\n"]
  idp_relay_state_parameter_name : xml_string_max_len256 option;
      [@ocaml.doc "The name of your identity provider's [RelayState] parameter.\n"]
  idp_auth_url : xml_string option;
      [@ocaml.doc
        "Your identity provider's authentication endpoint. Amazon EMR Studio redirects federated \
         users to this endpoint for authentication when logging in to a Studio with the Studio URL.\n"]
  default_s3_location : xml_string option;
      [@ocaml.doc
        "The Amazon S3 location to back up Amazon EMR Studio Workspaces and notebook files.\n"]
  creation_time : date option; [@ocaml.doc "The time the Amazon EMR Studio was created.\n"]
  url : xml_string option; [@ocaml.doc "The unique access URL of the Amazon EMR Studio.\n"]
  engine_security_group_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The ID of the Engine security group associated with the Amazon EMR Studio. The Engine \
         security group allows inbound network traffic from resources in the Workspace security \
         group.\n"]
  workspace_security_group_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The ID of the Workspace security group associated with the Amazon EMR Studio. The \
         Workspace security group allows outbound network traffic to resources in the Engine \
         security group and to the internet.\n"]
  user_role : xml_string option;
      [@ocaml.doc
        "The name of the IAM role assumed by users logged in to the Amazon EMR Studio. A Studio \
         only requires a [UserRole] when you use IAM authentication.\n"]
  service_role : xml_string option;
      [@ocaml.doc "The name of the IAM role assumed by the Amazon EMR Studio.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc "The list of IDs of the subnets associated with the Amazon EMR Studio.\n"]
  vpc_id : xml_string_max_len256 option;
      [@ocaml.doc "The ID of the VPC associated with the Amazon EMR Studio.\n"]
  auth_mode : auth_mode option;
      [@ocaml.doc
        "Specifies whether the Amazon EMR Studio authenticates users with IAM or IAM Identity \
         Center.\n"]
  description : xml_string_max_len256 option;
      [@ocaml.doc "The detailed description of the Amazon EMR Studio.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "The name of the Amazon EMR Studio.\n"]
  studio_arn : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon EMR Studio.\n"]
  studio_id : xml_string_max_len256 option; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc "Details for an Amazon EMR Studio including ID, creation time, name, and so on.\n"]

type nonrec string_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec stop_notebook_execution_input = {
  notebook_execution_id : xml_string_max_len256;
      [@ocaml.doc "The unique identifier of the notebook execution.\n"]
}
[@@ocaml.doc ""]

type nonrec step_timeline = {
  end_date_time : date option;
      [@ocaml.doc "The date and time when the cluster step execution completed or failed.\n"]
  start_date_time : date option;
      [@ocaml.doc "The date and time when the cluster step execution started.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time when the cluster step was created.\n"]
}
[@@ocaml.doc "The timeline of the cluster step lifecycle.\n"]

type nonrec step_id = string [@@ocaml.doc ""]

type nonrec hadoop_step_config = {
  args : string_list option;
      [@ocaml.doc
        "The list of command line arguments to pass to the JAR file's main function for execution.\n"]
  main_class : string_ option;
      [@ocaml.doc
        "The name of the main class in the specified Java file. If not specified, the JAR file \
         should specify a main class in its manifest file.\n"]
  properties : string_map option;
      [@ocaml.doc
        "The list of Java properties that are set when the step runs. You can use these properties \
         to pass key-value pairs to your main function.\n"]
  jar : string_ option; [@ocaml.doc "The path to the JAR file that runs during the step.\n"]
}
[@@ocaml.doc
  "A cluster step consisting of a JAR file whose main function will be executed. The main function \
   submits a job for Hadoop to execute and waits for the job to finish or fail.\n"]

type nonrec action_on_failure =
  | CONTINUE [@ocaml.doc ""]
  | CANCEL_AND_WAIT [@ocaml.doc ""]
  | TERMINATE_CLUSTER [@ocaml.doc ""]
  | TERMINATE_JOB_FLOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_state =
  | INTERRUPTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | CANCEL_PENDING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_state_change_reason_code = NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec step_state_change_reason = {
  message : string_ option; [@ocaml.doc "The descriptive message for the state change reason.\n"]
  code : step_state_change_reason_code option;
      [@ocaml.doc
        "The programmable code for the state change reason. Note: Currently, the service provides \
         no code for the state change.\n"]
}
[@@ocaml.doc "The details of the step state change reason.\n"]

type nonrec failure_details = {
  log_file : string_ option;
      [@ocaml.doc
        "The path to the log file where the step failure root cause was originally recorded.\n"]
  message : string_ option;
      [@ocaml.doc
        "The descriptive message including the error the Amazon EMR service has identified as the \
         cause of step failure. This is text from an error log that describes the root cause of \
         the failure.\n"]
  reason : string_ option;
      [@ocaml.doc
        "The reason for the step failure. In the case where the service cannot successfully \
         determine the root cause of the failure, it returns \"Unknown Error\" as a reason.\n"]
}
[@@ocaml.doc
  "The details of the step failure. The service attempts to detect the root cause for many common \
   failures.\n"]

type nonrec step_status = {
  timeline : step_timeline option;
      [@ocaml.doc "The timeline of the cluster step status over time.\n"]
  failure_details : failure_details option;
      [@ocaml.doc
        "The details for the step failure including reason, message, and log file path where the \
         root cause was identified.\n"]
  state_change_reason : step_state_change_reason option;
      [@ocaml.doc "The reason for the step execution status change.\n"]
  state : step_state option; [@ocaml.doc "The execution state of the cluster step.\n"]
}
[@@ocaml.doc "The execution status details of the cluster step.\n"]

type nonrec step_summary = {
  encryption_key_arn : string_ option;
      [@ocaml.doc
        "The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.\n"]
  log_uri : string_ option; [@ocaml.doc "The Amazon S3 destination URI for log publishing.\n"]
  status : step_status option;
      [@ocaml.doc "The current execution status details of the cluster step.\n"]
  action_on_failure : action_on_failure option;
      [@ocaml.doc
        "The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, \
         CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is available for backward compatibility.\n"]
  config : hadoop_step_config option;
      [@ocaml.doc "The Hadoop job configuration of the cluster step.\n"]
  name : string_ option; [@ocaml.doc "The name of the cluster step.\n"]
  id : step_id option; [@ocaml.doc "The identifier of the cluster step.\n"]
}
[@@ocaml.doc "The summary of the cluster step.\n"]

type nonrec step_summary_list = step_summary list [@@ocaml.doc ""]

type nonrec step_state_list = step_state list [@@ocaml.doc ""]

type nonrec s3_monitoring_configuration = {
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.\n"]
  log_uri : xml_string option; [@ocaml.doc "The Amazon S3 destination URI for log publishing.\n"]
}
[@@ocaml.doc
  "The Amazon S3 configuration for monitoring log publishing. You can configure your step to send \
   log information to Amazon S3. When it's specified, it takes precedence over the cluster's \
   logging configuration. If you don't specify this configuration entirely, or omit individual \
   fields, EMR falls back to cluster-level logging behavior.\n"]

type nonrec step_monitoring_configuration = {
  s3_monitoring_configuration : s3_monitoring_configuration option;
      [@ocaml.doc
        "The Amazon S3 configuration for monitoring log publishing. You can configure your step to \
         send log information to Amazon S3. When it's specified, it takes precedence over the \
         cluster's logging configuration. If you don't specify this configuration entirely, or \
         omit individual fields, EMR falls back to cluster-level logging behavior. \n"]
}
[@@ocaml.doc "Object that holds configuration properties for logging.\n"]

type nonrec step_ids_list = xml_string_max_len256 list [@@ocaml.doc ""]

type nonrec step_execution_state =
  | INTERRUPTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CONTINUE [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_execution_status_detail = {
  last_state_change_reason : xml_string option;
      [@ocaml.doc "A description of the step's current state.\n"]
  end_date_time : date option; [@ocaml.doc "The completion date and time of the step.\n"]
  start_date_time : date option; [@ocaml.doc "The start date and time of the step.\n"]
  creation_date_time : date; [@ocaml.doc "The creation date and time of the step.\n"]
  state : step_execution_state; [@ocaml.doc "The state of the step.\n"]
}
[@@ocaml.doc "The execution state of a step.\n"]

type nonrec key_value = {
  value : xml_string option; [@ocaml.doc "The value part of the identified key.\n"]
  key : xml_string option; [@ocaml.doc "The unique identifier of a key-value pair.\n"]
}
[@@ocaml.doc "A key-value pair.\n"]

type nonrec key_value_list = key_value list [@@ocaml.doc ""]

type nonrec hadoop_jar_step_config = {
  args : xml_string_list option;
      [@ocaml.doc
        "A list of command line arguments passed to the JAR file's main function when executed.\n"]
  main_class : xml_string option;
      [@ocaml.doc
        "The name of the main class in the specified Java file. If not specified, the JAR file \
         should specify a Main-Class in its manifest file.\n"]
  jar : xml_string; [@ocaml.doc "A path to a JAR file run during the step.\n"]
  properties : key_value_list option;
      [@ocaml.doc
        "A list of Java properties that are set when the step runs. You can use these properties \
         to pass key-value pairs to your main function.\n"]
}
[@@ocaml.doc
  "A job flow step consisting of a JAR file whose main function will be executed. The main \
   function submits a job for Hadoop to execute and waits for the job to finish or fail.\n"]

type nonrec step_config = {
  step_monitoring_configuration : step_monitoring_configuration option;
      [@ocaml.doc "Object that holds configuration properties for logging.\n"]
  hadoop_jar_step : hadoop_jar_step_config; [@ocaml.doc "The JAR file used for the step.\n"]
  action_on_failure : action_on_failure option;
      [@ocaml.doc
        "The action to take when the step fails. Use one of the following values:\n\n\
        \ {ul\n\
        \       {-   [TERMINATE_CLUSTER] - Shuts down the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCEL_AND_WAIT] - Cancels any pending steps and returns the cluster to the \
         [WAITING] state.\n\
        \           \n\
        \            }\n\
        \       {-   [CONTINUE] - Continues to the next step in the queue.\n\
        \           \n\
        \            }\n\
        \       {-   [TERMINATE_JOB_FLOW] - Shuts down the cluster. [TERMINATE_JOB_FLOW] is \
         provided for backward compatibility. We recommend using [TERMINATE_CLUSTER] instead.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If a cluster's [StepConcurrencyLevel] is greater than [1], do not use \
         [AddJobFlowSteps] to submit a step with this parameter set to [CANCEL_AND_WAIT] or \
         [TERMINATE_CLUSTER]. The step is not submitted and the action fails with a message that \
         the [ActionOnFailure] setting is not valid.\n\
        \   \n\
        \    If you change a cluster's [StepConcurrencyLevel] to be greater than 1 while a step is \
         running, the [ActionOnFailure] parameter may not behave as you expect. In this case, for \
         a step that fails with this parameter set to [CANCEL_AND_WAIT], pending steps and the \
         running step are not canceled; for a step that fails with this parameter set to \
         [TERMINATE_CLUSTER], the cluster does not terminate.\n\
        \    "]
  name : xml_string_max_len256; [@ocaml.doc "The name of the step.\n"]
}
[@@ocaml.doc "Specification for a cluster (job flow) step.\n"]

type nonrec step_detail = {
  execution_status_detail : step_execution_status_detail;
      [@ocaml.doc "The description of the step status.\n"]
  step_config : step_config; [@ocaml.doc "The step configuration.\n"]
}
[@@ocaml.doc "Combines the execution state and configuration of a step.\n"]

type nonrec step_detail_list = step_detail list [@@ocaml.doc ""]

type nonrec step_config_list = step_config list [@@ocaml.doc ""]

type nonrec step_cancellation_option =
  | TERMINATE_PROCESS [@ocaml.doc ""]
  | SEND_INTERRUPT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec optional_arn_type = string [@@ocaml.doc ""]

type nonrec step = {
  encryption_key_arn : string_ option;
      [@ocaml.doc
        "The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.\n"]
  log_uri : string_ option; [@ocaml.doc "The Amazon S3 destination URI for log publishing.\n"]
  execution_role_arn : optional_arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the runtime role for a step on the cluster. The runtime \
         role can be a cross-account IAM role. The runtime role ARN is a combination of account \
         ID, role name, and role type using the following format: \
         [arn:partition:service:region:account:resource]. \n\n\
        \ For example, [arn:aws:IAM::1234567890:role/ReadOnly] is a correctly formatted runtime \
         role ARN.\n\
        \ "]
  status : step_status option;
      [@ocaml.doc "The current execution status details of the cluster step.\n"]
  action_on_failure : action_on_failure option;
      [@ocaml.doc
        "The action to take when the cluster step fails. Possible values are [TERMINATE_CLUSTER], \
         [CANCEL_AND_WAIT], and [CONTINUE]. [TERMINATE_JOB_FLOW] is provided for backward \
         compatibility. We recommend using [TERMINATE_CLUSTER] instead.\n\n\
        \ If a cluster's [StepConcurrencyLevel] is greater than [1], do not use [AddJobFlowSteps] \
         to submit a step with this parameter set to [CANCEL_AND_WAIT] or [TERMINATE_CLUSTER]. The \
         step is not submitted and the action fails with a message that the [ActionOnFailure] \
         setting is not valid.\n\
        \ \n\
        \  If you change a cluster's [StepConcurrencyLevel] to be greater than 1 while a step is \
         running, the [ActionOnFailure] parameter may not behave as you expect. In this case, for \
         a step that fails with this parameter set to [CANCEL_AND_WAIT], pending steps and the \
         running step are not canceled; for a step that fails with this parameter set to \
         [TERMINATE_CLUSTER], the cluster does not terminate.\n\
        \  "]
  config : hadoop_step_config option;
      [@ocaml.doc "The Hadoop job configuration of the cluster step.\n"]
  name : string_ option; [@ocaml.doc "The name of the cluster step.\n"]
  id : step_id option; [@ocaml.doc "The identifier of the cluster step.\n"]
}
[@@ocaml.doc "This represents a step in a cluster.\n"]

type nonrec statistic =
  | MAXIMUM [@ocaml.doc ""]
  | MINIMUM [@ocaml.doc ""]
  | SUM [@ocaml.doc ""]
  | AVERAGE [@ocaml.doc ""]
  | SAMPLE_COUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_session_output = {
  state : session_state option;
      [@ocaml.doc
        "The state of the session at the time the request returned. When a session is first \
         created, it enters the [SUBMITTED] state.\n"]
  account_id : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon Web Services account ID that owns the session.\n"]
  arn : arn_type option; [@ocaml.doc "The output contains the ARN of the session.\n"]
  cluster_id : cluster_id option;
      [@ocaml.doc "The ID of the cluster that the session was started on.\n"]
  id : session_id; [@ocaml.doc "The output contains the ID of the session.\n"]
}
[@@ocaml.doc "Output of the [StartSession] operation.\n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type configuration = {
  properties : string_map option;
      [@ocaml.doc "A set of properties specified within a configuration classification.\n"]
  configurations : configuration_list option;
      [@ocaml.doc "A list of additional configurations to apply within a configuration object.\n"]
  classification : string_ option; [@ocaml.doc "The classification within a configuration.\n"]
}
[@@ocaml.doc
  " Amazon EMR releases 4.x or later.\n\
  \ \n\
  \   An optional configuration specification to be used when provisioning cluster instances, \
   which can include configurations for applications and software bundled with Amazon EMR. A \
   configuration consists of a classification, properties, and optional nested configurations. A \
   classification refers to an application-specific configuration file. Properties are the \
   settings you want to change in that file. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html}Configuring \
   Applications}.\n\
  \   "]

and configuration_list = configuration list [@@ocaml.doc ""]

type nonrec log_types_map = (xml_string * xml_string_list) list [@@ocaml.doc ""]

type nonrec session_cloud_watch_logging_configuration = {
  log_types : log_types_map option;
      [@ocaml.doc
        "A map of log component names (for example, [SPARK_DRIVER], [SPARK_EXECUTOR]) to the list \
         of log types to publish for that component (for example, [stdout], [stderr]).\n"]
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key used to encrypt the logs published to \
         CloudWatch Logs.\n"]
  log_stream_name_prefix : xml_string option;
      [@ocaml.doc "The prefix applied to the log stream name where session logs are published.\n"]
  log_group : xml_string option;
      [@ocaml.doc "The name of the log group where session logs are published.\n"]
  enabled : boolean_ option; [@ocaml.doc "Whether CloudWatch Logs is enabled for the session.\n"]
}
[@@ocaml.doc "The CloudWatch Logs configuration for a session.\n"]

type nonrec session_managed_logging_configuration = {
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key used to encrypt the managed logs.\n"]
  enabled : boolean_ option;
      [@ocaml.doc "Whether Amazon EMR-managed logging is enabled for the session.\n"]
}
[@@ocaml.doc "The Amazon EMR-managed logging configuration for a session.\n"]

type nonrec session_s3_logging_configuration = {
  log_types : log_types_map option;
      [@ocaml.doc
        "A map of log component names (for example, [SPARK_DRIVER], [SPARK_EXECUTOR]) to the list \
         of log types to publish for that component (for example, [stdout], [stderr]).\n"]
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key used to encrypt logs published to Amazon S3.\n"]
  log_uri : xml_string option;
      [@ocaml.doc "The Amazon S3 destination URI where session logs are published.\n"]
  enabled : boolean_ option; [@ocaml.doc "Whether Amazon S3 logging is enabled for the session.\n"]
}
[@@ocaml.doc "The Amazon S3 logging configuration for a session.\n"]

type nonrec session_monitoring_configuration = {
  s3_logging_configuration : session_s3_logging_configuration option;
      [@ocaml.doc "The Amazon S3 logging configuration for the session.\n"]
  managed_logging_configuration : session_managed_logging_configuration option;
      [@ocaml.doc "The Amazon EMR-managed logging configuration for the session.\n"]
  cloud_watch_logging_configuration : session_cloud_watch_logging_configuration option;
      [@ocaml.doc "The CloudWatch Logs configuration for the session.\n"]
}
[@@ocaml.doc
  "The monitoring configuration for a session. Controls where session logs are published.\n"]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec start_session_input = {
  tags : tag_list option; [@ocaml.doc "The tags to assign to the session.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you retry a request that completed successfully using the same client request \
         token, the service returns the original response without performing the operation again.\n"]
  session_idle_timeout_in_minutes : long option;
      [@ocaml.doc
        "The idle timeout, in minutes. If the session is idle for this duration, Amazon EMR EC2 \
         automatically terminates it.\n"]
  monitoring_configuration : session_monitoring_configuration option;
      [@ocaml.doc
        "The monitoring configuration that controls where session logs are published, such as \
         Amazon S3, CloudWatch, or managed logging.\n"]
  engine_configurations : configuration_list option;
      [@ocaml.doc
        "The configuration overrides for the session. Only runtime configuration overrides are \
         supported.\n"]
  execution_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The execution role ARN for the session. Amazon EMR uses this role to access Amazon Web \
         Services resources on your behalf during session execution.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster on which to start the session.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "An optional name for the session.\n"]
}
[@@ocaml.doc "Input to the [StartSession] operation.\n"]

type nonrec start_notebook_execution_output = {
  notebook_execution_id : xml_string_max_len256 option;
      [@ocaml.doc "The unique identifier of the notebook execution.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_engine_type = EMR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec execution_engine_config = {
  execution_role_arn : iam_role_arn option;
      [@ocaml.doc "The execution role ARN required for the notebook execution.\n"]
  master_instance_security_group_id : xml_string_max_len256 option;
      [@ocaml.doc
        "An optional unique ID of an Amazon EC2 security group to associate with the master \
         instance of the Amazon EMR cluster for this notebook execution. For more information see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-notebooks-security-groups.html}Specifying \
         Amazon EC2 Security Groups for Amazon EMR Notebooks} in the {i EMR Management Guide}.\n"]
  type_ : execution_engine_type option;
      [@ocaml.doc
        "The type of execution engine. A value of [EMR] specifies an Amazon EMR cluster.\n"]
  id : xml_string_max_len256;
      [@ocaml.doc
        "The unique identifier of the execution engine. For an Amazon EMR cluster, this is the \
         cluster ID.\n"]
}
[@@ocaml.doc
  "Specifies the execution engine (cluster) to run the notebook and perform the notebook \
   execution, for example, an Amazon EMR cluster.\n"]

type nonrec notebook_s3_location_from_input = {
  key : uri_string option;
      [@ocaml.doc "The key to the Amazon S3 location that stores the notebook execution input.\n"]
  bucket : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon S3 bucket that stores the notebook execution input.\n"]
}
[@@ocaml.doc "The Amazon S3 location that stores the notebook execution input.\n"]

type nonrec output_notebook_s3_location_from_input = {
  key : uri_string option;
      [@ocaml.doc "The key to the Amazon S3 location that stores the notebook execution output.\n"]
  bucket : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon S3 bucket that stores the notebook execution output.\n"]
}
[@@ocaml.doc "The Amazon S3 location that stores the notebook execution output.\n"]

type nonrec output_notebook_format = HTML [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec environment_variables_map = (xml_string_max_len256 * xml_string) list [@@ocaml.doc ""]

type nonrec start_notebook_execution_input = {
  environment_variables : environment_variables_map option;
      [@ocaml.doc "The environment variables associated with the notebook execution.\n"]
  output_notebook_format : output_notebook_format option;
      [@ocaml.doc "The output format for the notebook execution.\n"]
  output_notebook_s3_location : output_notebook_s3_location_from_input option;
      [@ocaml.doc "The Amazon S3 location for the notebook execution output.\n"]
  notebook_s3_location : notebook_s3_location_from_input option;
      [@ocaml.doc "The Amazon S3 location for the notebook execution input.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags associated with a notebook execution. Tags are user-defined key-value \
         pairs that consist of a required key string with a maximum of 128 characters and an \
         optional value string with a maximum of 256 characters.\n"]
  notebook_instance_security_group_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The unique identifier of the Amazon EC2 security group to associate with the Amazon EMR \
         Notebook for this notebook execution.\n"]
  service_role : xml_string;
      [@ocaml.doc
        "The name or ARN of the IAM role that is used as the service role for Amazon EMR (the \
         Amazon EMR role) for the notebook execution.\n"]
  execution_engine : execution_engine_config;
      [@ocaml.doc "Specifies the execution engine (cluster) that runs the notebook execution.\n"]
  notebook_params : xml_string option;
      [@ocaml.doc
        "Input parameters in JSON format passed to the Amazon EMR Notebook at runtime for execution.\n"]
  notebook_execution_name : xml_string_max_len256 option;
      [@ocaml.doc "An optional name for the notebook execution.\n"]
  relative_path : xml_string option;
      [@ocaml.doc
        "The path and file name of the notebook file for this execution, relative to the path \
         specified for the Amazon EMR Notebook. For example, if you specify a path of \
         [s3://MyBucket/MyNotebooks] when you create an Amazon EMR Notebook for a notebook with an \
         ID of [e-ABCDEFGHIJK1234567890ABCD] (the [EditorID] of this request), and you specify a \
         [RelativePath] of [my_notebook_executions/notebook_execution.ipynb], the location of the \
         file for the notebook execution is \
         [s3://MyBucket/MyNotebooks/e-ABCDEFGHIJK1234567890ABCD/my_notebook_executions/notebook_execution.ipynb].\n"]
  editor_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The unique identifier of the Amazon EMR Notebook to use for notebook execution.\n"]
}
[@@ocaml.doc ""]

type nonrec spot_provisioning_allocation_strategy =
  | CAPACITY_OPTIMIZED_PRIORITIZED [@ocaml.doc ""]
  | DIVERSIFIED [@ocaml.doc ""]
  | LOWEST_PRICE [@ocaml.doc ""]
  | PRICE_CAPACITY_OPTIMIZED [@ocaml.doc ""]
  | CAPACITY_OPTIMIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec spot_resizing_specification = {
  allocation_strategy : spot_provisioning_allocation_strategy option;
      [@ocaml.doc
        "Specifies the allocation strategy to use to launch Spot instances during a resize. If you \
         run Amazon EMR releases 6.9.0 or higher, the default is [price-capacity-optimized]. If \
         you run Amazon EMR releases 6.8.0 or lower, the default is [capacity-optimized].\n"]
  timeout_duration_minutes : whole_number option;
      [@ocaml.doc
        "Spot resize timeout in minutes. If Spot Instances are not provisioned within this time, \
         the resize workflow will stop provisioning of Spot instances. Minimum value is 5 minutes \
         and maximum value is 10,080 minutes (7 days). The timeout applies to all resize workflows \
         on the Instance Fleet. The resize could be triggered by Amazon EMR Managed Scaling or by \
         the customer (via Amazon EMR Console, Amazon EMR CLI modify-instance-fleet or Amazon EMR \
         SDK ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2 Spot Reclamation.\n"]
}
[@@ocaml.doc
  "The resize specification for Spot Instances in the instance fleet, which contains the resize \
   timeout period. \n"]

type nonrec spot_provisioning_timeout_action =
  | TERMINATE_CLUSTER [@ocaml.doc ""]
  | SWITCH_TO_ON_DEMAND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec spot_provisioning_specification = {
  allocation_strategy : spot_provisioning_allocation_strategy option;
      [@ocaml.doc
        "Specifies one of the following strategies to launch Spot Instance fleets: \
         [capacity-optimized], [price-capacity-optimized], [lowest-price], or [diversified], and \
         [capacity-optimized-prioritized]. For more information on the provisioning strategies, \
         see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-allocation-strategy.html}Allocation \
         strategies for Spot Instances} in the {i Amazon EC2 User Guide for Linux Instances}.\n\n\
        \  When you launch a Spot Instance fleet with the old console, it automatically launches \
         with the [capacity-optimized] strategy. You can't change the allocation strategy from the \
         old console.\n\
        \  \n\
        \   "]
  block_duration_minutes : whole_number option;
      [@ocaml.doc
        "The defined duration for Spot Instances (also known as Spot blocks) in minutes. When \
         specified, the Spot Instance does not terminate before the defined duration expires, and \
         defined duration pricing for Spot Instances applies. Valid values are 60, 120, 180, 240, \
         300, or 360. The duration period starts as soon as a Spot Instance receives its instance \
         ID. At the end of the duration, Amazon EC2 marks the Spot Instance for termination and \
         provides a Spot Instance termination notice, which gives the instance a two-minute \
         warning before it terminates. \n\n\
        \  Spot Instances with a defined duration (also known as Spot blocks) are no longer \
         available to new customers from July 1, 2021. For customers who have previously used the \
         feature, we will continue to support Spot Instances with a defined duration until \
         December 31, 2022. \n\
        \  \n\
        \   "]
  timeout_action : spot_provisioning_timeout_action;
      [@ocaml.doc
        "The action to take when [TargetSpotCapacity] has not been fulfilled when the \
         [TimeoutDurationMinutes] has expired; that is, when all Spot Instances could not be \
         provisioned within the Spot provisioning timeout. Valid values are [TERMINATE_CLUSTER] \
         and [SWITCH_TO_ON_DEMAND]. SWITCH_TO_ON_DEMAND specifies that if no Spot Instances are \
         available, On-Demand Instances should be provisioned to fulfill any remaining Spot \
         capacity.\n"]
  timeout_duration_minutes : whole_number;
      [@ocaml.doc
        "The Spot provisioning timeout period in minutes. If Spot Instances are not provisioned \
         within this time period, the [TimeOutAction] is taken. Minimum value is 5 and maximum \
         value is 1440. The timeout applies only during initial provisioning, when the cluster is \
         first created.\n"]
}
[@@ocaml.doc
  "The launch specification for Spot Instances in the instance fleet, which determines the defined \
   duration, provisioning timeout behavior, and allocation strategy.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions. Spot Instance allocation strategy is available in Amazon EMR releases \
   5.12.1 and later.\n\
  \  \n\
  \     Spot Instances with a defined duration (also known as Spot blocks) are no longer available \
   to new customers from July 1, 2021. For customers who have previously used the feature, we will \
   continue to support Spot Instances with a defined duration until December 31, 2022. \n\
  \     \n\
  \      "]

type nonrec simplified_application = {
  version : string_ option;
      [@ocaml.doc "The returned release label application version. For example, [3.2.1].\n"]
  name : string_ option;
      [@ocaml.doc "The returned release label application name. For example, [hadoop].\n"]
}
[@@ocaml.doc "The returned release label application names or versions.\n"]

type nonrec simplified_application_list = simplified_application list [@@ocaml.doc ""]

type nonrec adjustment_type =
  | EXACT_CAPACITY [@ocaml.doc ""]
  | PERCENT_CHANGE_IN_CAPACITY [@ocaml.doc ""]
  | CHANGE_IN_CAPACITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec simple_scaling_policy_configuration = {
  cool_down : integer option;
      [@ocaml.doc
        "The amount of time, in seconds, after a scaling activity completes before any further \
         trigger-related scaling activities can start. The default value is 0.\n"]
  scaling_adjustment : integer;
      [@ocaml.doc
        "The amount by which to scale in or scale out, based on the specified [AdjustmentType]. A \
         positive value adds to the instance group's Amazon EC2 instance count while a negative \
         number removes instances. If [AdjustmentType] is set to [EXACT_CAPACITY], the number \
         should only be a positive integer. If [AdjustmentType] is set to \
         [PERCENT_CHANGE_IN_CAPACITY], the value should express the percentage as an integer. For \
         example, -20 indicates a decrease in 20% increments of cluster capacity.\n"]
  adjustment_type : adjustment_type option;
      [@ocaml.doc
        "The way in which Amazon EC2 instances are added (if [ScalingAdjustment] is a positive \
         number) or terminated (if [ScalingAdjustment] is a negative number) each time the scaling \
         activity is triggered. [CHANGE_IN_CAPACITY] is the default. [CHANGE_IN_CAPACITY] \
         indicates that the Amazon EC2 instance count increments or decrements by \
         [ScalingAdjustment], which should be expressed as an integer. \
         [PERCENT_CHANGE_IN_CAPACITY] indicates the instance count increments or decrements by the \
         percentage specified by [ScalingAdjustment], which should be expressed as an integer. For \
         example, 20 indicates an increase in 20% increments of cluster capacity. [EXACT_CAPACITY] \
         indicates the scaling activity results in an instance group with the number of Amazon EC2 \
         instances specified by [ScalingAdjustment], which should be expressed as a positive \
         integer.\n"]
}
[@@ocaml.doc
  "An automatic scaling configuration, which describes how the policy adds or removes instances, \
   the cooldown period, and the number of Amazon EC2 instances that will be added each time the \
   CloudWatch metric alarm condition is satisfied.\n"]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec ec2_instance_ids_list = instance_id list [@@ocaml.doc ""]

type nonrec instance_resize_policy = {
  instance_termination_timeout : integer option;
      [@ocaml.doc
        "Decommissioning timeout override for the specific list of instances to be terminated.\n"]
  instances_to_protect : ec2_instance_ids_list option;
      [@ocaml.doc "Specific list of instances to be protected when shrinking an instance group.\n"]
  instances_to_terminate : ec2_instance_ids_list option;
      [@ocaml.doc "Specific list of instances to be terminated when shrinking an instance group.\n"]
}
[@@ocaml.doc
  "Custom policy for requesting termination protection or termination of specific instances when \
   shrinking an instance group.\n"]

type nonrec shrink_policy = {
  instance_resize_policy : instance_resize_policy option;
      [@ocaml.doc
        "Custom policy for requesting termination protection or termination of specific instances \
         when shrinking an instance group.\n"]
  decommission_timeout : integer option;
      [@ocaml.doc
        "The desired timeout for decommissioning an instance. Overrides the default YARN \
         decommissioning timeout.\n"]
}
[@@ocaml.doc
  "Policy for customizing shrink operations. Allows configuration of decommissioning timeout and \
   targeted instance shrinking.\n"]

type nonrec set_visible_to_all_users_input = {
  visible_to_all_users : boolean_;
      [@ocaml.doc
        "A value of [true] indicates that an IAM principal in the Amazon Web Services account can \
         perform Amazon EMR actions on the cluster that the IAM policies attached to the principal \
         allow. A value of [false] indicates that only the IAM principal that created the cluster \
         and the Amazon Web Services root user can perform Amazon EMR actions on the cluster.\n"]
  job_flow_ids : xml_string_list; [@ocaml.doc "The unique identifier of the job flow (cluster).\n"]
}
[@@ocaml.doc "The input to the SetVisibleToAllUsers action.\n"]

type nonrec set_unhealthy_node_replacement_input = {
  unhealthy_node_replacement : boolean_object;
      [@ocaml.doc "Indicates whether to turn on or turn off graceful unhealthy node replacement.\n"]
  job_flow_ids : xml_string_list;
      [@ocaml.doc
        "The list of strings that uniquely identify the clusters for which to turn on unhealthy \
         node replacement. You can get these identifiers by running the [RunJobFlow] or the \
         [DescribeJobFlows] operations.\n"]
}
[@@ocaml.doc ""]

type nonrec set_termination_protection_input = {
  termination_protected : boolean_;
      [@ocaml.doc
        "A Boolean that indicates whether to protect the cluster and prevent the Amazon EC2 \
         instances in the cluster from shutting down due to API calls, user intervention, or \
         job-flow error.\n"]
  job_flow_ids : xml_string_list;
      [@ocaml.doc
        " A list of strings that uniquely identify the clusters to protect. This identifier is \
         returned by [RunJobFlow] and can also be obtained from [DescribeJobFlows] . \n"]
}
[@@ocaml.doc " The input argument to the [TerminationProtection] operation. \n"]

type nonrec set_keep_job_flow_alive_when_no_steps_input = {
  keep_job_flow_alive_when_no_steps : boolean_;
      [@ocaml.doc
        "A Boolean that indicates whether to terminate the cluster after all steps are executed.\n"]
  job_flow_ids : xml_string_list;
      [@ocaml.doc
        "A list of strings that uniquely identify the clusters to protect. This identifier is \
         returned by \
         {{:https://docs.aws.amazon.com/emr/latest/APIReference/API_RunJobFlow.html}RunJobFlow} \
         and can also be obtained from \
         {{:https://docs.aws.amazon.com/emr/latest/APIReference/API_DescribeJobFlows.html}DescribeJobFlows}.\n"]
}
[@@ocaml.doc ""]

type nonrec session_state_list = session_state list [@@ocaml.doc ""]

type nonrec session_mapping_summary = {
  creation_time : date option; [@ocaml.doc "The time the session mapping was created.\n"]
  session_policy_arn : xml_string_max_len256 option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the session policy associated with the user or group.\n"]
  identity_type : identity_type option;
      [@ocaml.doc
        "Specifies whether the identity mapped to the Amazon EMR Studio is a user or a group.\n"]
  identity_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the user or group. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName}UserName} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName}DisplayName} \
         in the {i IAM Identity Center Identity Store API Reference}.\n"]
  identity_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The globally unique identifier (GUID) of the user or group from the IAM Identity Center \
         Identity Store.\n"]
  studio_id : xml_string_max_len256 option; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc
  "Details for an Amazon EMR Studio session mapping. The details do not include the time the \
   session mapping was last modified.\n"]

type nonrec session_mapping_summary_list = session_mapping_summary list [@@ocaml.doc ""]

type nonrec session_mapping_detail = {
  last_modified_time : date option; [@ocaml.doc "The time the session mapping was last modified.\n"]
  creation_time : date option; [@ocaml.doc "The time the session mapping was created.\n"]
  session_policy_arn : xml_string_max_len256 option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the session policy associated with the user or group.\n"]
  identity_type : identity_type option;
      [@ocaml.doc
        "Specifies whether the identity mapped to the Amazon EMR Studio is a user or a group.\n"]
  identity_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the user or group. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName}UserName} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName}DisplayName} \
         in the {i IAM Identity Center Identity Store API Reference}.\n"]
  identity_id : xml_string_max_len256 option;
      [@ocaml.doc "The globally unique identifier (GUID) of the user or group.\n"]
  studio_id : xml_string_max_len256 option; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc
  "Details for an Amazon EMR Studio session mapping including creation time, user or group ID, \
   Studio ID, and so on.\n"]

type nonrec certificate_authority = {
  certificate_data : xml_string option;
      [@ocaml.doc
        "The PEM-encoded root CA certificate data. Provide this certificate to your client's trust \
         store when connecting directly to the Spark Connect server over VPC peering.\n"]
  certificate_arn : xml_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the certificate authority in Amazon Web Services \
         Private CA that issued the Spark Connect server certificate.\n"]
}
[@@ocaml.doc
  "Describes the certificate authority used to establish an mTLS connection to the Spark Connect \
   server when connecting directly over VPC peering.\n"]

type nonrec session = {
  tags : tag_list option; [@ocaml.doc "The tags associated with the session.\n"]
  server_url : xml_string option;
      [@ocaml.doc
        "The Spark Connect server URL for the session. Use this URL with the [Credentials] \
         returned by [GetSessionEndpoint] to connect directly to the session over VPC peering.\n"]
  certificate_authority : certificate_authority option;
      [@ocaml.doc
        "The certificate authority used to establish an mTLS connection to the Spark Connect \
         server when connecting directly over VPC peering.\n"]
  session_idle_timeout_in_minutes : long option;
      [@ocaml.doc
        "The idle timeout, in minutes. If the session is idle for this duration, Amazon EMR \
         automatically terminates it.\n"]
  monitoring_configuration : session_monitoring_configuration option;
      [@ocaml.doc "The monitoring configuration for the session.\n"]
  engine_configurations : configuration_list option;
      [@ocaml.doc
        "The configuration overrides for the session. Only runtime configuration overrides are \
         supported.\n"]
  idle_since : date option;
      [@ocaml.doc "The date and time that the session last entered the [IDLE] state.\n"]
  ended_at : date option;
      [@ocaml.doc "The date and time that the session was terminated or failed.\n"]
  started_at : date option;
      [@ocaml.doc "The date and time that the session entered the [STARTED] state.\n"]
  updated_at : date option; [@ocaml.doc "The date and time that the session was last updated.\n"]
  created_at : date option; [@ocaml.doc "The date and time that the session was created.\n"]
  account_id : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon Web Services account ID that owns the session.\n"]
  execution_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The execution role ARN for the session. Amazon EMR uses this role to access Amazon Web \
         Services resources on your behalf during session execution.\n"]
  release_label : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon EMR release label of the cluster that the session is running on.\n"]
  state_change_reason : xml_string option;
      [@ocaml.doc "A human-readable message describing the most recent state change.\n"]
  state : session_state;
      [@ocaml.doc
        "The current state of the session. Valid values are [SUBMITTED], [STARTING], [STARTED], \
         [IDLE], [BUSY], [TERMINATING], [TERMINATED], and [FAILED].\n"]
  arn : arn_type; [@ocaml.doc "The Amazon Resource Name (ARN) of the session.\n"]
  name : xml_string_max_len256 option;
      [@ocaml.doc "The name of the session, if one was provided at creation time.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster that the session belongs to.\n"]
  id : session_id; [@ocaml.doc "The ID of the session.\n"]
}
[@@ocaml.doc "Detailed information about a Spark Connect session.\n"]

type nonrec session_list = session list [@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec security_groups_list = xml_string_max_len256 list [@@ocaml.doc ""]

type nonrec security_configuration_summary = {
  creation_date_time : date option;
      [@ocaml.doc "The date and time the security configuration was created.\n"]
  name : xml_string option; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc "The creation date and time, and name, of a security configuration.\n"]

type nonrec security_configuration_list = security_configuration_summary list [@@ocaml.doc ""]

type nonrec script_bootstrap_action_config = {
  args : xml_string_list option;
      [@ocaml.doc "A list of command line arguments to pass to the bootstrap action script.\n"]
  path : xml_string;
      [@ocaml.doc "Location in Amazon S3 of the script to run during a bootstrap action.\n"]
}
[@@ocaml.doc "Configuration of the script to run during a bootstrap action.\n"]

type nonrec comparison_operator =
  | LESS_THAN_OR_EQUAL [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | GREATER_THAN_OR_EQUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec non_negative_double = float [@@ocaml.doc ""]

type nonrec metric_dimension = {
  value : string_ option; [@ocaml.doc "The dimension value.\n"]
  key : string_ option; [@ocaml.doc "The dimension name.\n"]
}
[@@ocaml.doc
  "A CloudWatch dimension, which is specified using a [Key] (known as a [Name] in CloudWatch), \
   [Value] pair. By default, Amazon EMR uses one dimension whose [Key] is [JobFlowID] and [Value] \
   is a variable representing the cluster ID, which is [${emr.clusterId}]. This enables the rule \
   to bootstrap when the cluster ID becomes available.\n"]

type nonrec metric_dimension_list = metric_dimension list [@@ocaml.doc ""]

type nonrec cloud_watch_alarm_definition = {
  dimensions : metric_dimension_list option; [@ocaml.doc "A CloudWatch metric dimension.\n"]
  unit_ : unit_ option;
      [@ocaml.doc
        "The unit of measure associated with the CloudWatch metric being watched. The value \
         specified for [Unit] must correspond to the units specified in the CloudWatch metric.\n"]
  threshold : non_negative_double;
      [@ocaml.doc "The value against which the specified statistic is compared.\n"]
  statistic : statistic option;
      [@ocaml.doc
        "The statistic to apply to the metric associated with the alarm. The default is [AVERAGE].\n"]
  period : integer;
      [@ocaml.doc
        "The period, in seconds, over which the statistic is applied. CloudWatch metrics for \
         Amazon EMR are emitted every five minutes (300 seconds), so if you specify a CloudWatch \
         metric, specify [300].\n"]
  namespace : string_ option;
      [@ocaml.doc
        "The namespace for the CloudWatch metric. The default is [AWS/ElasticMapReduce].\n"]
  metric_name : string_;
      [@ocaml.doc
        "The name of the CloudWatch metric that is watched to determine an alarm condition.\n"]
  evaluation_periods : integer option;
      [@ocaml.doc
        "The number of periods, in five-minute increments, during which the alarm condition must \
         exist before the alarm triggers automatic scaling activity. The default value is [1].\n"]
  comparison_operator : comparison_operator;
      [@ocaml.doc
        "Determines how the metric specified by [MetricName] is compared to the value specified by \
         [Threshold].\n"]
}
[@@ocaml.doc
  "The definition of a CloudWatch metric alarm, which determines when an automatic scaling \
   activity is triggered. When the defined alarm conditions are satisfied, scaling activity begins.\n"]

type nonrec scaling_trigger = {
  cloud_watch_alarm_definition : cloud_watch_alarm_definition;
      [@ocaml.doc
        "The definition of a CloudWatch metric alarm. When the defined alarm conditions are met \
         along with other trigger parameters, scaling activity begins.\n"]
}
[@@ocaml.doc "The conditions that trigger an automatic scaling activity.\n"]

type nonrec scaling_strategy = ADVANCED [@ocaml.doc ""] | DEFAULT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec market_type = SPOT [@ocaml.doc ""] | ON_DEMAND [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scaling_action = {
  simple_scaling_policy_configuration : simple_scaling_policy_configuration;
      [@ocaml.doc
        "The type of adjustment the automatic scaling activity makes when triggered, and the \
         periodicity of the adjustment.\n"]
  market : market_type option;
      [@ocaml.doc
        "Not available for instance groups. Instance groups use the market type specified for the \
         group.\n"]
}
[@@ocaml.doc
  "The type of adjustment the automatic scaling activity makes when triggered, and the periodicity \
   of the adjustment.\n"]

type nonrec scaling_rule = {
  trigger : scaling_trigger;
      [@ocaml.doc
        "The CloudWatch alarm definition that determines when automatic scaling activity is \
         triggered.\n"]
  action : scaling_action;
      [@ocaml.doc "The conditions that trigger an automatic scaling activity.\n"]
  description : string_ option;
      [@ocaml.doc "A friendly, more verbose description of the automatic scaling rule.\n"]
  name : string_;
      [@ocaml.doc
        "The name used to identify an automatic scaling rule. Rule names must be unique within a \
         scaling policy.\n"]
}
[@@ocaml.doc
  "A scale-in or scale-out rule that defines scaling activity, including the CloudWatch metric \
   alarm that triggers activity, how Amazon EC2 instances are added or removed, and the \
   periodicity of adjustments. The automatic scaling policy for an instance group can comprise one \
   or more automatic scaling rules.\n"]

type nonrec scaling_rule_list = scaling_rule list [@@ocaml.doc ""]

type nonrec scaling_constraints = {
  max_capacity : integer;
      [@ocaml.doc
        "The upper boundary of Amazon EC2 instances in an instance group beyond which scaling \
         activities are not allowed to grow. Scale-out activities will not add instances beyond \
         this boundary.\n"]
  min_capacity : integer;
      [@ocaml.doc
        "The lower boundary of Amazon EC2 instances in an instance group below which scaling \
         activities are not allowed to shrink. Scale-in activities will not terminate instances \
         below this boundary.\n"]
}
[@@ocaml.doc
  "The upper and lower Amazon EC2 instance limits for an automatic scaling policy. Automatic \
   scaling activities triggered by automatic scaling rules will not cause an instance group to \
   grow above or below these limits.\n"]

type nonrec scale_down_behavior =
  | TERMINATE_AT_TASK_COMPLETION [@ocaml.doc ""]
  | TERMINATE_AT_INSTANCE_HOUR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_upload_policy_value =
  | DISABLED [@ocaml.doc ""]
  | ON_CUSTOMER_S3ONLY [@ocaml.doc ""]
  | EMR_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_type =
  | PERSISTENT_UI_LOGS [@ocaml.doc ""]
  | APPLICATION_LOGS [@ocaml.doc ""]
  | SYSTEM_LOGS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_type_map = (log_type * log_upload_policy_value) list [@@ocaml.doc ""]

type nonrec s3_logging_configuration = {
  log_type_upload_policy : log_type_map option;
      [@ocaml.doc
        "A map that specifies the upload policy for each log type. The key is the log type, and \
         the value is the upload policy.\n\n\
        \ Valid log types:\n\
        \ \n\
        \  {ul\n\
        \        {-   [system-logs]: EMR Daemon logs.\n\
        \            \n\
        \             }\n\
        \        {-   [application-logs]: Framework logs from Hadoop, Spark, Hive and other \
         applications running on the cluster.\n\
        \            \n\
        \             }\n\
        \        {-   [persistent-ui-logs]: Logs required for persistent application UIs such as \
         Spark History Server and Tez UI.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Valid upload policies:\n\
        \   \n\
        \    {ul\n\
        \          {-   [emr-managed]: Standard behavior. Logs are uploaded to S3 bucket as \
         configured in your LogUri, with certain logs retained by the service for operational \
         support and troubleshooting purposes.\n\
        \              \n\
        \               }\n\
        \          {-   [on-customer-s3only]: Logs are uploaded only to the customer-specified S3 \
         bucket. This requires you to specify a LogUri when creating the cluster. \
         Persistent-ui-logs cannot have on-customer-s3only policy. Allowed policies for \
         persistent-ui-logs are emr-managed and disabled.\n\
        \              \n\
        \               }\n\
        \          {-   [disabled]: No S3 upload for this log type.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc
  "Configuration for S3 logging behavior in EMR clusters. Defines how different types of logs are \
   uploaded to S3 based on the specified upload policies for each log type.\n"]

type nonrec run_job_flow_output = {
  cluster_arn : arn_type option; [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster.\n"]
  job_flow_id : xml_string_max_len256 option; [@ocaml.doc "A unique identifier for the job flow.\n"]
}
[@@ocaml.doc " The result of the [RunJobFlow] operation. \n"]

type nonrec instance_type = string [@@ocaml.doc ""]

type nonrec instance_role_type =
  | TASK [@ocaml.doc ""]
  | CORE [@ocaml.doc ""]
  | MASTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ebs_block_device_config = {
  volumes_per_instance : integer option;
      [@ocaml.doc
        "Number of EBS volumes with a specific volume configuration that are associated with every \
         instance in the instance group\n"]
  volume_specification : volume_specification;
      [@ocaml.doc
        "EBS volume specifications such as volume type, IOPS, size (GiB) and throughput (MiB/s) \
         that are requested for the EBS volume attached to an Amazon EC2 instance in the cluster.\n"]
}
[@@ocaml.doc
  "Configuration of requested EBS block device associated with the instance group with count of \
   volumes that are associated to every instance.\n"]

type nonrec ebs_block_device_config_list = ebs_block_device_config list [@@ocaml.doc ""]

type nonrec ebs_configuration = {
  ebs_optimized : boolean_object option;
      [@ocaml.doc
        "Indicates whether an Amazon EBS volume is EBS-optimized. The default is false. You should \
         explicitly set this value to true to enable the Amazon EBS-optimized setting for an EC2 \
         instance.\n"]
  ebs_block_device_configs : ebs_block_device_config_list option;
      [@ocaml.doc "An array of Amazon EBS volume specifications attached to a cluster instance.\n"]
}
[@@ocaml.doc "The Amazon EBS configuration of a cluster instance.\n"]

type nonrec auto_scaling_policy = {
  rules : scaling_rule_list;
      [@ocaml.doc "The scale-in and scale-out rules that comprise the automatic scaling policy.\n"]
  constraints : scaling_constraints;
      [@ocaml.doc
        "The upper and lower Amazon EC2 instance limits for an automatic scaling policy. Automatic \
         scaling activity will not cause an instance group to grow above or below these limits.\n"]
}
[@@ocaml.doc
  "An automatic scaling policy for a core instance group or task instance group in an Amazon EMR \
   cluster. An automatic scaling policy defines how an instance group dynamically adds and \
   terminates Amazon EC2 instances in response to the value of a CloudWatch metric. See \
   [PutAutoScalingPolicy].\n"]

type nonrec instance_group_config = {
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc "The custom AMI ID to use for the provisioned instance group.\n"]
  auto_scaling_policy : auto_scaling_policy option;
      [@ocaml.doc
        "An automatic scaling policy for a core instance group or task instance group in an Amazon \
         EMR cluster. The automatic scaling policy defines how an instance group dynamically adds \
         and terminates Amazon EC2 instances in response to the value of a CloudWatch metric. See \
         [PutAutoScalingPolicy].\n"]
  ebs_configuration : ebs_configuration option;
      [@ocaml.doc
        "EBS configurations that will be attached to each Amazon EC2 instance in the instance group.\n"]
  configurations : configuration_list option;
      [@ocaml.doc
        " Amazon EMR releases 4.x or later.\n\
        \ \n\
        \   The list of configurations supplied for an Amazon EMR cluster instance group. You can \
         specify a separate configuration for each instance group (master, core, and task).\n\
        \   "]
  instance_count : integer; [@ocaml.doc "Target number of instances for the instance group.\n"]
  instance_type : instance_type;
      [@ocaml.doc "The Amazon EC2 instance type for all instances in the instance group.\n"]
  bid_price : xml_string_max_len256 option;
      [@ocaml.doc
        "The bid price for each Amazon EC2 Spot Instance type as defined by [InstanceType]. \
         Expressed in USD. If neither [BidPrice] nor [BidPriceAsPercentageOfOnDemandPrice] is \
         provided, [BidPriceAsPercentageOfOnDemandPrice] defaults to 100%.\n"]
  instance_role : instance_role_type;
      [@ocaml.doc "The role of the instance group in the cluster.\n"]
  market : market_type option;
      [@ocaml.doc "Market type of the Amazon EC2 instances used to create a cluster node.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "Friendly name given to the instance group.\n"]
}
[@@ocaml.doc "Configuration defining a new instance group.\n"]

type nonrec instance_group_config_list = instance_group_config list [@@ocaml.doc ""]

type nonrec instance_fleet_type =
  | TASK [@ocaml.doc ""]
  | CORE [@ocaml.doc ""]
  | MASTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_type_config = {
  priority : non_negative_double option;
      [@ocaml.doc
        "The priority at which Amazon EMR launches the Amazon EC2 instances with this instance \
         type. Priority starts at 0, which is the highest priority. Amazon EMR considers the \
         highest priority first.\n"]
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc "The custom AMI ID to use for the instance type.\n"]
  configurations : configuration_list option;
      [@ocaml.doc
        "A configuration classification that applies when provisioning cluster instances, which \
         can include configurations for applications and software that run on the cluster.\n"]
  ebs_configuration : ebs_configuration option;
      [@ocaml.doc
        "The configuration of Amazon Elastic Block Store (Amazon EBS) attached to each instance as \
         defined by [InstanceType]. \n"]
  bid_price_as_percentage_of_on_demand_price : non_negative_double option;
      [@ocaml.doc
        "The bid price, as a percentage of On-Demand price, for each Amazon EC2 Spot Instance as \
         defined by [InstanceType]. Expressed as a number (for example, 20 specifies 20%). If \
         neither [BidPrice] nor [BidPriceAsPercentageOfOnDemandPrice] is provided, \
         [BidPriceAsPercentageOfOnDemandPrice] defaults to 100%.\n"]
  bid_price : xml_string_max_len256 option;
      [@ocaml.doc
        "The bid price for each Amazon EC2 Spot Instance type as defined by [InstanceType]. \
         Expressed in USD. If neither [BidPrice] nor [BidPriceAsPercentageOfOnDemandPrice] is \
         provided, [BidPriceAsPercentageOfOnDemandPrice] defaults to 100%. \n"]
  weighted_capacity : whole_number option;
      [@ocaml.doc
        "The number of units that a provisioned instance of this type provides toward fulfilling \
         the target capacities defined in [InstanceFleetConfig]. This value is 1 for a master \
         instance fleet, and must be 1 or greater for core and task instance fleets. Defaults to 1 \
         if not specified. \n"]
  instance_type : instance_type; [@ocaml.doc "An Amazon EC2 instance type, such as [m3.xlarge]. \n"]
}
[@@ocaml.doc
  "An instance type configuration for each instance type in an instance fleet, which determines \
   the Amazon EC2 instances Amazon EMR attempts to provision to fulfill On-Demand and Spot target \
   capacities. When you use an allocation strategy, you can include a maximum of 30 instance type \
   configurations for a fleet. For more information about how to use an allocation strategy, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-instance-fleet.html}Configure \
   Instance Fleets}. Without an allocation strategy, you may specify a maximum of five instance \
   type configurations for a fleet.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_type_config_list = instance_type_config list [@@ocaml.doc ""]

type nonrec on_demand_provisioning_allocation_strategy =
  | PRIORITIZED [@ocaml.doc ""]
  | LOWEST_PRICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec on_demand_capacity_reservation_usage_strategy =
  | USE_CAPACITY_RESERVATIONS_FIRST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec on_demand_capacity_reservation_preference =
  | NONE [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec on_demand_capacity_reservation_options = {
  capacity_reservation_resource_group_arn : xml_string_max_len256 option;
      [@ocaml.doc
        "The ARN of the Capacity Reservation resource group in which to run the instance.\n"]
  capacity_reservation_preference : on_demand_capacity_reservation_preference option;
      [@ocaml.doc
        "Indicates the instance's Capacity Reservation preferences. Possible preferences include:\n\n\
        \ {ul\n\
        \       {-   [open] - The instance can run in any open Capacity Reservation that has \
         matching attributes (instance type, platform, Availability Zone).\n\
        \           \n\
        \            }\n\
        \       {-   [none] - The instance avoids running in a Capacity Reservation even if one is \
         available. The instance runs as an On-Demand Instance.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  usage_strategy : on_demand_capacity_reservation_usage_strategy option;
      [@ocaml.doc
        "Indicates whether to use unused Capacity Reservations for fulfilling On-Demand capacity.\n\n\
        \ If you specify [use-capacity-reservations-first], the fleet uses unused Capacity \
         Reservations to fulfill On-Demand capacity up to the target On-Demand capacity. If \
         multiple instance pools have unused Capacity Reservations, the On-Demand allocation \
         strategy ([lowest-price]) is applied. If the number of unused Capacity Reservations is \
         less than the On-Demand target capacity, the remaining On-Demand target capacity is \
         launched according to the On-Demand allocation strategy ([lowest-price]).\n\
        \ \n\
        \  If you do not specify a value, the fleet fulfills the On-Demand capacity according to \
         the chosen On-Demand allocation strategy.\n\
        \  "]
}
[@@ocaml.doc
  "Describes the strategy for using unused Capacity Reservations for fulfilling On-Demand capacity.\n"]

type nonrec on_demand_provisioning_specification = {
  capacity_reservation_options : on_demand_capacity_reservation_options option;
      [@ocaml.doc
        "The launch specification for On-Demand instances in the instance fleet, which determines \
         the allocation strategy.\n"]
  allocation_strategy : on_demand_provisioning_allocation_strategy;
      [@ocaml.doc
        "Specifies the strategy to use in launching On-Demand instance fleets. Available options \
         are [lowest-price] and [prioritized]. [lowest-price] specifies to launch the instances \
         with the lowest price first, and [prioritized] specifies that Amazon EMR should launch \
         the instances with the highest priority first. The default is [lowest-price].\n"]
}
[@@ocaml.doc
  " The launch specification for On-Demand Instances in the instance fleet, which determines the \
   allocation strategy. \n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions. On-Demand Instances allocation strategy is available in Amazon EMR \
   releases 5.12.1 and later.\n\
  \  \n\
  \   "]

type nonrec instance_fleet_provisioning_specifications = {
  on_demand_specification : on_demand_provisioning_specification option;
      [@ocaml.doc
        " The launch specification for On-Demand Instances in the instance fleet, which determines \
         the allocation strategy and capacity reservation options.\n\n\
        \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and \
         later, excluding 5.0.x versions. On-Demand Instances allocation strategy is available in \
         Amazon EMR releases 5.12.1 and later.\n\
        \  \n\
        \   "]
  spot_specification : spot_provisioning_specification option;
      [@ocaml.doc
        "The launch specification for Spot instances in the fleet, which determines the allocation \
         strategy, defined duration, and provisioning timeout behavior.\n"]
}
[@@ocaml.doc
  "The launch specification for On-Demand and Spot Instances in the fleet.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions. On-Demand and Spot instance allocation strategies are available in \
   Amazon EMR releases 5.12.1 and later.\n\
  \  \n\
  \   "]

type nonrec on_demand_resizing_specification = {
  capacity_reservation_options : on_demand_capacity_reservation_options option; [@ocaml.doc ""]
  allocation_strategy : on_demand_provisioning_allocation_strategy option;
      [@ocaml.doc
        "Specifies the allocation strategy to use to launch On-Demand instances during a resize. \
         The default is [lowest-price].\n"]
  timeout_duration_minutes : whole_number option;
      [@ocaml.doc
        "On-Demand resize timeout in minutes. If On-Demand Instances are not provisioned within \
         this time, the resize workflow stops. The minimum value is 5 minutes, and the maximum \
         value is 10,080 minutes (7 days). The timeout applies to all resize workflows on the \
         Instance Fleet. The resize could be triggered by Amazon EMR Managed Scaling or by the \
         customer (via Amazon EMR Console, Amazon EMR CLI modify-instance-fleet or Amazon EMR SDK \
         ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2 Spot Reclamation.\n"]
}
[@@ocaml.doc
  "The resize specification for On-Demand Instances in the instance fleet, which contains the \
   resize timeout period. \n"]

type nonrec instance_fleet_resizing_specifications = {
  on_demand_resize_specification : on_demand_resizing_specification option;
      [@ocaml.doc
        "The resize specification for On-Demand Instances in the instance fleet, which contains \
         the allocation strategy, capacity reservation options, and the resize timeout period. \n"]
  spot_resize_specification : spot_resizing_specification option;
      [@ocaml.doc
        "The resize specification for Spot Instances in the instance fleet, which contains the \
         allocation strategy and the resize timeout period. \n"]
}
[@@ocaml.doc "The resize specification for On-Demand and Spot Instances in the fleet.\n"]

type nonrec instance_fleet_config = {
  context : xml_string_max_len256 option; [@ocaml.doc "Reserved.\n"]
  resize_specifications : instance_fleet_resizing_specifications option;
      [@ocaml.doc "The resize specification for the instance fleet.\n"]
  launch_specifications : instance_fleet_provisioning_specifications option;
      [@ocaml.doc "The launch specification for the instance fleet.\n"]
  instance_type_configs : instance_type_config_list option;
      [@ocaml.doc
        "The instance type configurations that define the Amazon EC2 instances in the instance \
         fleet.\n"]
  target_spot_capacity : whole_number option;
      [@ocaml.doc
        "The target capacity of Spot units for the instance fleet, which determines how many Spot \
         Instances to provision. When the instance fleet launches, Amazon EMR tries to provision \
         Spot Instances as specified by [InstanceTypeConfig]. Each instance configuration has a \
         specified [WeightedCapacity]. When a Spot Instance is provisioned, the [WeightedCapacity] \
         units count toward the target capacity. Amazon EMR provisions instances until the target \
         capacity is totally fulfilled, even if this results in an overage. For example, if there \
         are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance \
         with a [WeightedCapacity] of 5 units, the instance is provisioned, and the target \
         capacity is exceeded by 3 units.\n\n\
        \  If not specified or set to 0, only On-Demand Instances are provisioned for the instance \
         fleet. At least one of [TargetSpotCapacity] and [TargetOnDemandCapacity] should be \
         greater than 0. For a master instance fleet, only one of [TargetSpotCapacity] and \
         [TargetOnDemandCapacity] can be specified, and its value must be 1.\n\
        \  \n\
        \   "]
  target_on_demand_capacity : whole_number option;
      [@ocaml.doc
        "The target capacity of On-Demand units for the instance fleet, which determines how many \
         On-Demand Instances to provision. When the instance fleet launches, Amazon EMR tries to \
         provision On-Demand Instances as specified by [InstanceTypeConfig]. Each instance \
         configuration has a specified [WeightedCapacity]. When an On-Demand Instance is \
         provisioned, the [WeightedCapacity] units count toward the target capacity. Amazon EMR \
         provisions instances until the target capacity is totally fulfilled, even if this results \
         in an overage. For example, if there are 2 units remaining to fulfill capacity, and \
         Amazon EMR can only provision an instance with a [WeightedCapacity] of 5 units, the \
         instance is provisioned, and the target capacity is exceeded by 3 units.\n\n\
        \  If not specified or set to 0, only Spot Instances are provisioned for the instance \
         fleet using [TargetSpotCapacity]. At least one of [TargetSpotCapacity] and \
         [TargetOnDemandCapacity] should be greater than 0. For a master instance fleet, only one \
         of [TargetSpotCapacity] and [TargetOnDemandCapacity] can be specified, and its value must \
         be 1.\n\
        \  \n\
        \   "]
  instance_fleet_type : instance_fleet_type;
      [@ocaml.doc
        "The node type that the instance fleet hosts. Valid values are MASTER, CORE, and TASK.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "The friendly name of the instance fleet.\n"]
}
[@@ocaml.doc
  "The configuration that defines an instance fleet.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_fleet_config_list = instance_fleet_config list [@@ocaml.doc ""]

type nonrec placement_type = {
  availability_zones : xml_string_max_len256_list option;
      [@ocaml.doc
        "When multiple Availability Zones are specified, Amazon EMR evaluates them and launches \
         instances in the optimal Availability Zone. [AvailabilityZones] is used for instance \
         fleets, while [AvailabilityZone] (singular) is used for uniform instance groups.\n\n\
        \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and \
         later, excluding 5.0.x versions.\n\
        \  \n\
        \   "]
  availability_zone : xml_string option;
      [@ocaml.doc
        "The Amazon EC2 Availability Zone for the cluster. [AvailabilityZone] is used for uniform \
         instance groups, while [AvailabilityZones] (plural) is used for instance fleets.\n"]
}
[@@ocaml.doc "The Amazon EC2 Availability Zone configuration of the cluster (job flow).\n"]

type nonrec job_flow_instances_config = {
  additional_slave_security_groups : security_groups_list option;
      [@ocaml.doc
        "A list of additional Amazon EC2 security group IDs for the core and task nodes.\n"]
  additional_master_security_groups : security_groups_list option;
      [@ocaml.doc "A list of additional Amazon EC2 security group IDs for the master node.\n"]
  service_access_security_group : xml_string_max_len256 option;
      [@ocaml.doc
        "The identifier of the Amazon EC2 security group for the Amazon EMR service to access \
         clusters in VPC private subnets.\n"]
  emr_managed_slave_security_group : xml_string_max_len256 option;
      [@ocaml.doc
        "The identifier of the Amazon EC2 security group for the core and task nodes. If you \
         specify [EmrManagedSlaveSecurityGroup], you must also specify \
         [EmrManagedMasterSecurityGroup].\n"]
  emr_managed_master_security_group : xml_string_max_len256 option;
      [@ocaml.doc
        "The identifier of the Amazon EC2 security group for the master node. If you specify \
         [EmrManagedMasterSecurityGroup], you must also specify [EmrManagedSlaveSecurityGroup].\n"]
  ec2_subnet_ids : xml_string_max_len256_list option;
      [@ocaml.doc
        "Applies to clusters that use the instance fleet configuration. When multiple Amazon EC2 \
         subnet IDs are specified, Amazon EMR evaluates them and launches instances in the optimal \
         subnet.\n\n\
        \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and \
         later, excluding 5.0.x versions.\n\
        \  \n\
        \   "]
  ec2_subnet_id : xml_string_max_len256 option;
      [@ocaml.doc
        "Applies to clusters that use the uniform instance group configuration. To launch the \
         cluster in Amazon Virtual Private Cloud (Amazon VPC), set this parameter to the \
         identifier of the Amazon VPC subnet where you want the cluster to launch. If you do not \
         specify this value and your account supports EC2-Classic, the cluster launches in \
         EC2-Classic.\n"]
  hadoop_version : xml_string_max_len256 option;
      [@ocaml.doc
        "Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop version for the \
         cluster. Valid inputs are \"0.18\" (no longer maintained), \"0.20\" (no longer \
         maintained), \"0.20.205\" (no longer maintained), \"1.0.3\", \"2.2.0\", or \"2.4.0\". If \
         you do not set this value, the default of 0.18 is used, unless the [AmiVersion] parameter \
         is set in the RunJobFlow call, in which case the default version of Hadoop for that AMI \
         version is used.\n"]
  unhealthy_node_replacement : boolean_object option;
      [@ocaml.doc
        "Indicates whether Amazon EMR should gracefully replace core nodes that have degraded \
         within the cluster.\n"]
  termination_protected : boolean_ option;
      [@ocaml.doc
        "Specifies whether to lock the cluster to prevent the Amazon EC2 instances from being \
         terminated by API call, user intervention, or in the event of a job-flow error.\n"]
  keep_job_flow_alive_when_no_steps : boolean_ option;
      [@ocaml.doc
        "Specifies whether the cluster should remain available after completing all steps. \
         Defaults to [false]. For more information about configuring cluster termination, see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html}Control \
         Cluster Termination} in the {i EMR Management Guide}.\n"]
  placement : placement_type option;
      [@ocaml.doc "The Availability Zone in which the cluster runs.\n"]
  ec2_key_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the Amazon EC2 key pair that can be used to connect to the master node using \
         SSH as the user called \"hadoop.\"\n"]
  instance_fleets : instance_fleet_config_list option;
      [@ocaml.doc
        " The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and \
         later, excluding 5.0.x versions.\n\
        \ \n\
        \   Describes the Amazon EC2 instances and instance configurations for clusters that use \
         the instance fleet configuration.\n\
        \   "]
  instance_groups : instance_group_config_list option;
      [@ocaml.doc "Configuration for the instance groups in a cluster.\n"]
  instance_count : integer option;
      [@ocaml.doc "The number of Amazon EC2 instances in the cluster.\n"]
  slave_instance_type : instance_type option;
      [@ocaml.doc "The Amazon EC2 instance type of the core and task nodes.\n"]
  master_instance_type : instance_type option;
      [@ocaml.doc "The Amazon EC2 instance type of the master node.\n"]
}
[@@ocaml.doc
  "A description of the Amazon EC2 instance on which the cluster (job flow) runs. A valid \
   JobFlowInstancesConfig must contain either InstanceGroups or InstanceFleets. They cannot be \
   used together. You may also have MasterInstanceType, SlaveInstanceType, and InstanceCount (all \
   three must be present), but we don't recommend this configuration.\n"]

type nonrec bootstrap_action_config = {
  script_bootstrap_action : script_bootstrap_action_config;
      [@ocaml.doc "The script run by the bootstrap action.\n"]
  name : xml_string_max_len256; [@ocaml.doc "The name of the bootstrap action.\n"]
}
[@@ocaml.doc "Configuration of a bootstrap action.\n"]

type nonrec bootstrap_action_config_list = bootstrap_action_config list [@@ocaml.doc ""]

type nonrec new_supported_products_list = supported_product_config list [@@ocaml.doc ""]

type nonrec application = {
  additional_info : string_map option;
      [@ocaml.doc
        "This option is for advanced users only. This is meta information about third-party \
         applications that third-party vendors use for testing purposes.\n"]
  args : string_list option; [@ocaml.doc "Arguments for Amazon EMR to pass to the application.\n"]
  version : string_ option; [@ocaml.doc "The version of the application.\n"]
  name : string_ option; [@ocaml.doc "The name of the application.\n"]
}
[@@ocaml.doc
  "With Amazon EMR release version 4.0 and later, the only accepted parameter is the application \
   name. To pass arguments to applications, you use configuration classifications specified using \
   configuration JSON objects. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html}Configuring \
   Applications}.\n\n\
  \ With earlier Amazon EMR releases, the application is any Amazon or third-party software that \
   you can add to the cluster. This structure contains a list of strings that indicates the \
   software to use with the cluster and accepts a user argument list. Amazon EMR accepts and \
   forwards the argument list to the corresponding installation script as bootstrap action \
   argument.\n\
  \ "]

type nonrec application_list = application list [@@ocaml.doc ""]

type nonrec repo_upgrade_on_boot = NONE [@ocaml.doc ""] | SECURITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kerberos_attributes = {
  ad_domain_join_password : xml_string_max_len256 option;
      [@ocaml.doc "The Active Directory password for [ADDomainJoinUser].\n"]
  ad_domain_join_user : xml_string_max_len256 option;
      [@ocaml.doc
        "Required only when establishing a cross-realm trust with an Active Directory domain. A \
         user with sufficient privileges to join resources to the domain.\n"]
  cross_realm_trust_principal_password : xml_string_max_len256 option;
      [@ocaml.doc
        "Required only when establishing a cross-realm trust with a KDC in a different realm. The \
         cross-realm principal password, which must be identical across realms.\n"]
  kdc_admin_password : xml_string_max_len256;
      [@ocaml.doc
        "The password used within the cluster for the kadmin service on the cluster-dedicated KDC, \
         which maintains Kerberos principals, password policies, and keytabs for the cluster.\n"]
  realm : xml_string_max_len256;
      [@ocaml.doc
        "The name of the Kerberos realm to which all nodes in a cluster belong. For example, \
         [EC2.INTERNAL]. \n"]
}
[@@ocaml.doc
  "Attributes for Kerberos configuration when Kerberos authentication is enabled using a security \
   configuration. For more information see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html}Use Kerberos \
   Authentication} in the {i Amazon EMR Management Guide}.\n"]

type nonrec compute_limits_unit_type =
  | VCPU [@ocaml.doc ""]
  | Instances [@ocaml.doc ""]
  | InstanceFleetUnits [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compute_limits = {
  maximum_core_capacity_units : integer option;
      [@ocaml.doc
        " The upper boundary of Amazon EC2 units for core node type in a cluster. It is measured \
         through vCPU cores or instances for instance groups and measured through units for \
         instance fleets. The core units are not allowed to scale beyond this boundary. The \
         parameter is used to split capacity allocation between core and task nodes. \n"]
  maximum_on_demand_capacity_units : integer option;
      [@ocaml.doc
        " The upper boundary of On-Demand Amazon EC2 units. It is measured through vCPU cores or \
         instances for instance groups and measured through units for instance fleets. The \
         On-Demand units are not allowed to scale beyond this boundary. The parameter is used to \
         split capacity allocation between On-Demand and Spot Instances. \n"]
  maximum_capacity_units : integer;
      [@ocaml.doc
        " The upper boundary of Amazon EC2 units. It is measured through vCPU cores or instances \
         for instance groups and measured through units for instance fleets. Managed scaling \
         activities are not allowed beyond this boundary. The limit only applies to the core and \
         task nodes. The master node cannot be scaled after initial configuration. \n"]
  minimum_capacity_units : integer;
      [@ocaml.doc
        " The lower boundary of Amazon EC2 units. It is measured through vCPU cores or instances \
         for instance groups and measured through units for instance fleets. Managed scaling \
         activities are not allowed beyond this boundary. The limit only applies to the core and \
         task nodes. The master node cannot be scaled after initial configuration. \n"]
  unit_type : compute_limits_unit_type;
      [@ocaml.doc " The unit type used for specifying a managed scaling policy. \n"]
}
[@@ocaml.doc
  " The Amazon EC2 unit limits for a managed scaling policy. The managed scaling activity of a \
   cluster can not be above or below these limits. The limit only applies to the core and task \
   nodes. The master node cannot be scaled after initial configuration. \n"]

type nonrec managed_scaling_policy = {
  scaling_strategy : scaling_strategy option;
      [@ocaml.doc
        "Determines whether a custom scaling utilization performance index can be set. Possible \
         values include {i ADVANCED} or {i DEFAULT}.\n"]
  utilization_performance_index : utilization_performance_index_integer option;
      [@ocaml.doc
        "An integer value that represents an advanced scaling strategy. Setting a higher value \
         optimizes for performance. Setting a lower value optimizes for resource conservation. \
         Setting the value to 50 balances performance and resource conservation. Possible values \
         are 1, 25, 50, 75, and 100.\n"]
  compute_limits : compute_limits option;
      [@ocaml.doc
        "The Amazon EC2 unit limits for a managed scaling policy. The managed scaling activity of \
         a cluster is not allowed to go above or below these limits. The limit only applies to the \
         core and task nodes. The master node cannot be scaled after initial configuration.\n"]
}
[@@ocaml.doc
  " Managed scaling policy for an Amazon EMR cluster. The policy specifies the limits for \
   resources that can be added or terminated from a cluster. The policy only applies to the core \
   and task nodes. The master node cannot be scaled after initial configuration. \n"]

type nonrec placement_group_strategy =
  | NONE [@ocaml.doc ""]
  | CLUSTER [@ocaml.doc ""]
  | PARTITION [@ocaml.doc ""]
  | SPREAD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec placement_group_config = {
  placement_strategy : placement_group_strategy option;
      [@ocaml.doc
        "Amazon EC2 Placement Group strategy associated with instance role.\n\n\
        \ Starting with Amazon EMR release 5.23.0, the only supported placement strategy is \
         [SPREAD] for the [MASTER] instance role.\n\
        \ "]
  instance_role : instance_role_type;
      [@ocaml.doc
        "Role of the instance in the cluster.\n\n\
        \ Starting with Amazon EMR release 5.23.0, the only supported instance role is [MASTER].\n\
        \ "]
}
[@@ocaml.doc
  "Placement group configuration for an Amazon EMR cluster. The configuration specifies the \
   placement strategy that can be applied to instance roles during cluster creation.\n\n\
  \ To use this configuration, consider attaching managed policy \
   AmazonElasticMapReducePlacementGroupPolicy to the Amazon EMR role.\n\
  \ "]

type nonrec placement_group_config_list = placement_group_config list [@@ocaml.doc ""]

type nonrec auto_termination_policy = {
  idle_timeout : long option;
      [@ocaml.doc
        "Specifies the amount of idle time in seconds after which the cluster automatically \
         terminates. You can specify a minimum of 60 seconds and a maximum of 604800 seconds \
         (seven days).\n"]
}
[@@ocaml.doc
  "An auto-termination policy for an Amazon EMR cluster. An auto-termination policy defines the \
   amount of idle time in seconds after which a cluster automatically terminates. For alternative \
   cluster termination options, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html}Control \
   cluster termination}.\n"]

type nonrec cloud_watch_log_configuration = {
  log_types : log_types_map option;
      [@ocaml.doc
        "A map of log types to file names for publishing logs to the standard output or standard \
         error streams for CloudWatch. Valid log types include STEP_LOGS, SPARK_DRIVER, and \
         SPARK_EXECUTOR. Valid file names for each type include STDOUT and STDERR.\n"]
  encryption_key_arn : xml_string option;
      [@ocaml.doc "The ARN of the encryption key used to encrypt the logs.\n"]
  log_stream_name_prefix : xml_string option; [@ocaml.doc "The prefix of the log stream name.\n"]
  log_group_name : xml_string option;
      [@ocaml.doc "The name of the CloudWatch log group where logs are published.\n"]
  enabled : boolean_; [@ocaml.doc "Specifies if CloudWatch logging is enabled.\n"]
}
[@@ocaml.doc
  "Holds CloudWatch log configuration settings and metadata that specify settings like log files \
   to monitor and where to send them.\n"]

type nonrec monitoring_configuration = {
  s3_logging_configuration : s3_logging_configuration option;
      [@ocaml.doc
        "S3 logging configuration that controls how different types of logs (system logs, \
         application logs, and persistent UI logs) are uploaded to S3. Each log type can be \
         configured with a specific upload policy.\n"]
  cloud_watch_log_configuration : cloud_watch_log_configuration option;
      [@ocaml.doc
        "CloudWatch log configuration settings and metadata that specify settings like log files \
         to monitor and where to send them.\n"]
}
[@@ocaml.doc
  "Contains CloudWatch log configuration and S3 logging configuration metadata and settings.\n"]

type nonrec run_job_flow_input = {
  session_enabled : boolean_object option;
      [@ocaml.doc
        "Indicates whether Spark Connect sessions are enabled on the cluster. When set to [true], \
         you can start Spark Connect sessions using the [StartSession] operation.\n"]
  monitoring_configuration : monitoring_configuration option;
      [@ocaml.doc "Contains CloudWatch log configuration metadata and settings.\n"]
  extended_support : boolean_object option; [@ocaml.doc "Reserved.\n"]
  ebs_root_volume_throughput : integer option;
      [@ocaml.doc
        "The throughput, in MiB/s, of the Amazon EBS root device volume of the Linux AMI that is \
         used for each Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and later.\n"]
  ebs_root_volume_iops : integer option;
      [@ocaml.doc
        "The IOPS, of the Amazon EBS root device volume of the Linux AMI that is used for each \
         Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and later.\n"]
  os_release_label : xml_string_max_len256 option;
      [@ocaml.doc
        "Specifies a particular Amazon Linux release for all nodes in a cluster launch RunJobFlow \
         request. If a release is not specified, Amazon EMR uses the latest validated Amazon Linux \
         release for cluster launch.\n"]
  auto_termination_policy : auto_termination_policy option; [@ocaml.doc ""]
  placement_group_configs : placement_group_config_list option;
      [@ocaml.doc "The specified placement group configuration for an Amazon EMR cluster.\n"]
  managed_scaling_policy : managed_scaling_policy option;
      [@ocaml.doc " The specified managed scaling policy for an Amazon EMR cluster. \n"]
  step_concurrency_level : integer option;
      [@ocaml.doc
        "Specifies the number of steps that can be executed concurrently. The default value is \
         [1]. The maximum value is [256].\n"]
  kerberos_attributes : kerberos_attributes option;
      [@ocaml.doc
        "Attributes for Kerberos configuration when Kerberos authentication is enabled using a \
         security configuration. For more information see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html}Use Kerberos \
         Authentication} in the {i Amazon EMR Management Guide}.\n"]
  repo_upgrade_on_boot : repo_upgrade_on_boot option;
      [@ocaml.doc
        "Applies only when [CustomAmiID] is used. Specifies which updates from the Amazon Linux \
         AMI package repositories to apply automatically when the instance boots using the AMI. If \
         omitted, the default is [SECURITY], which indicates that only security updates are \
         applied. If [NONE] is specified, no updates are applied, and all updates must be applied \
         manually.\n"]
  ebs_root_volume_size : integer option;
      [@ocaml.doc
        "The size, in GiB, of the Amazon EBS root device volume of the Linux AMI that is used for \
         each Amazon EC2 instance. Available in Amazon EMR releases 4.x and later.\n"]
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc
        "Available only in Amazon EMR releases 5.7.0 and later. The ID of a custom Amazon \
         EBS-backed Linux AMI. If specified, Amazon EMR uses this AMI when it launches cluster \
         Amazon EC2 instances. For more information about custom AMIs in Amazon EMR, see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-custom-ami.html}Using a \
         Custom AMI} in the {i Amazon EMR Management Guide}. If omitted, the cluster uses the base \
         Linux AMI for the [ReleaseLabel] specified. For Amazon EMR releases 2.x and 3.x, use \
         [AmiVersion] instead.\n\n\
        \ For information about creating a custom AMI, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html}Creating \
         an Amazon EBS-Backed Linux AMI} in the {i Amazon Elastic Compute Cloud User Guide for \
         Linux Instances}. For information about finding an AMI ID, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html}Finding a \
         Linux AMI}. \n\
        \ "]
  scale_down_behavior : scale_down_behavior option;
      [@ocaml.doc
        "Specifies the way that individual Amazon EC2 instances terminate when an automatic \
         scale-in activity occurs or an instance group is resized. [TERMINATE_AT_INSTANCE_HOUR] \
         indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of \
         when the request to terminate the instance was submitted. This option is only available \
         with Amazon EMR 5.1.0 and later and is the default for clusters created using that \
         version. [TERMINATE_AT_TASK_COMPLETION] indicates that Amazon EMR adds nodes to a deny \
         list and drains tasks from nodes before terminating the Amazon EC2 instances, regardless \
         of the instance-hour boundary. With either behavior, Amazon EMR removes the least active \
         nodes first and blocks instance termination if it could lead to HDFS corruption. \
         [TERMINATE_AT_TASK_COMPLETION] available only in Amazon EMR releases 4.1.0 and later, and \
         is the default for releases of Amazon EMR earlier than 5.1.0.\n"]
  auto_scaling_role : xml_string option;
      [@ocaml.doc
        "An IAM role for automatic scaling policies. The default role is \
         [EMR_AutoScaling_DefaultRole]. The IAM role provides permissions that the automatic \
         scaling feature requires to launch and terminate Amazon EC2 instances in an instance \
         group.\n"]
  security_configuration : xml_string option;
      [@ocaml.doc "The name of a security configuration to apply to the cluster.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to associate with a cluster and propagate to Amazon EC2 instances.\n"]
  service_role : xml_string option;
      [@ocaml.doc
        "The IAM role that Amazon EMR assumes in order to access Amazon Web Services resources on \
         your behalf. If you've created a custom service role path, you must specify it for the \
         service role when you launch your cluster.\n"]
  job_flow_role : xml_string option;
      [@ocaml.doc
        "Also called instance profile and Amazon EC2 role. An IAM role for an Amazon EMR cluster. \
         The Amazon EC2 instances of the cluster assume this role. The default role is \
         [EMR_EC2_DefaultRole]. In order to use the default role, you must have already created it \
         using the CLI or console.\n"]
  visible_to_all_users : boolean_ option;
      [@ocaml.doc
        " The VisibleToAllUsers parameter is no longer supported. By default, the value is set to \
         [true]. Setting it to [false] now has no effect.\n\
        \ \n\
        \   Set this value to [true] so that IAM principals in the Amazon Web Services account \
         associated with the cluster can perform Amazon EMR actions on the cluster that their IAM \
         policies allow. This value defaults to [true] for clusters created using the Amazon EMR \
         API or the CLI \
         {{:https://docs.aws.amazon.com/cli/latest/reference/emr/create-cluster.html}create-cluster} \
         command.\n\
        \   \n\
        \    When set to [false], only the IAM principal that created the cluster and the Amazon \
         Web Services account root user can perform Amazon EMR actions for the cluster, regardless \
         of the IAM permissions policies attached to other IAM principals. For more information, \
         see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/security_IAM_emr-with-IAM.html#security_set_visible_to_all_users}Understanding \
         the Amazon EMR cluster VisibleToAllUsers setting} in the {i Amazon EMR Management Guide}.\n\
        \    "]
  configurations : configuration_list option;
      [@ocaml.doc
        "For Amazon EMR releases 4.0 and later. The list of configurations supplied for the Amazon \
         EMR cluster that you are creating.\n"]
  applications : application_list option;
      [@ocaml.doc
        "Applies to Amazon EMR releases 4.0 and later. A case-insensitive list of applications for \
         Amazon EMR to install and configure when launching the cluster. For a list of \
         applications available for each Amazon EMR release version, see the \
         {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/}Amazon EMRRelease Guide}.\n"]
  new_supported_products : new_supported_products_list option;
      [@ocaml.doc
        " For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use \
         Applications.\n\
        \ \n\
        \   A list of strings that indicates third-party software to use with the job flow that \
         accepts a user argument list. Amazon EMR accepts and forwards the argument list to the \
         corresponding installation script as bootstrap action arguments. For more information, \
         see \"Launch a Job Flow on the MapR Distribution for Hadoop\" in the \
         {{:https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf}Amazon EMR Developer \
         Guide}. Supported values are:\n\
        \   \n\
        \    {ul\n\
        \          {-  \"mapr-m3\" - launch the cluster using MapR M3 Edition.\n\
        \              \n\
        \               }\n\
        \          {-  \"mapr-m5\" - launch the cluster using MapR M5 Edition.\n\
        \              \n\
        \               }\n\
        \          {-  \"mapr\" with the user arguments specifying \"--edition,m3\" or \
         \"--edition,m5\" - launch the job flow using MapR M3 or M5 Edition respectively.\n\
        \              \n\
        \               }\n\
        \          {-  \"mapr-m7\" - launch the cluster using MapR M7 Edition.\n\
        \              \n\
        \               }\n\
        \          {-  \"hunk\" - launch the cluster with the Hunk Big Data Analytics Platform.\n\
        \              \n\
        \               }\n\
        \          {-  \"hue\"- launch the cluster with Hue installed.\n\
        \              \n\
        \               }\n\
        \          {-  \"spark\" - launch the cluster with Apache Spark installed.\n\
        \              \n\
        \               }\n\
        \          {-  \"ganglia\" - launch the cluster with the Ganglia Monitoring System \
         installed.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  supported_products : supported_products_list option;
      [@ocaml.doc
        " For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use \
         Applications.\n\
        \ \n\
        \   A list of strings that indicates third-party software to use. For more information, \
         see the {{:https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf}Amazon EMR \
         Developer Guide}. Currently supported values are:\n\
        \   \n\
        \    {ul\n\
        \          {-  \"mapr-m3\" - launch the job flow using MapR M3 Edition.\n\
        \              \n\
        \               }\n\
        \          {-  \"mapr-m5\" - launch the job flow using MapR M5 Edition.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  bootstrap_actions : bootstrap_action_config_list option;
      [@ocaml.doc "A list of bootstrap actions to run before Hadoop starts on the cluster nodes.\n"]
  step_execution_role_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the runtime role for steps specified in the RunJobFlow \
         request. The runtime role can be a cross-account IAM role. The runtime role ARN is a \
         combination of account ID, role name, and role type using the following format: \
         [arn:partition:iam::account-id:role/role-name].\n\n\
        \ For example, [arn:aws:iam::1234567890:role/ReadOnly] is a correctly formatted runtime \
         role ARN.\n\
        \ \n\
        \  This parameter applies only to steps included in the [Steps] parameter of this \
         RunJobFlow request. It does not apply to steps added later to the cluster.\n\
        \  "]
  steps : step_config_list option; [@ocaml.doc "A list of steps to run.\n"]
  instances : job_flow_instances_config;
      [@ocaml.doc "A specification of the number and type of Amazon EC2 instances.\n"]
  release_label : xml_string_max_len256 option;
      [@ocaml.doc
        "The Amazon EMR release label, which determines the version of open-source application \
         packages installed on the cluster. Release labels are in the form [emr-x.x.x], where \
         x.x.x is an Amazon EMR release version such as [emr-5.14.0]. For more information about \
         Amazon EMR release versions and included application versions and features, see \
         {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/}https://docs.aws.amazon.com/emr/latest/ReleaseGuide/}. \
         The release label applies only to Amazon EMR releases version 4.0 and later. Earlier \
         versions use [AmiVersion].\n"]
  ami_version : xml_string_max_len256 option;
      [@ocaml.doc
        "Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and \
         later, [ReleaseLabel] is used. To specify a custom AMI, use [CustomAmiID].\n"]
  additional_info : xml_string option;
      [@ocaml.doc "A JSON string for selecting additional features.\n"]
  log_encryption_kms_key_id : xml_string option;
      [@ocaml.doc
        "The KMS key used for encrypting log files. If a value is not provided, the logs remain \
         encrypted by AES-256. This attribute is only available with Amazon EMR releases 5.30.0 \
         and later, excluding Amazon EMR 6.0.0.\n"]
  log_uri : xml_string option;
      [@ocaml.doc
        "The location in Amazon S3 to write the log files of the job flow. If a value is not \
         provided, logs are not created.\n"]
  name : xml_string_max_len256; [@ocaml.doc "The name of the job flow.\n"]
}
[@@ocaml.doc " Input to the [RunJobFlow] operation. \n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec remove_tags_output = unit [@@ocaml.doc ""]

type nonrec remove_tags_input = {
  cluster_id : cluster_id option;
      [@ocaml.doc
        "The ID of the cluster that scopes the tag operation. Required when the resource being \
         untagged is a session-scoped resource.\n"]
  tag_keys : string_list; [@ocaml.doc "A list of tag keys to remove from the resource.\n"]
  resource_id : resource_id;
      [@ocaml.doc
        "The Amazon EMR resource identifier from which tags will be removed. For example, a \
         cluster identifier or an Amazon EMR Studio ID.\n"]
}
[@@ocaml.doc "This input identifies an Amazon EMR resource and a list of tags to remove.\n"]

type nonrec remove_managed_scaling_policy_output = unit [@@ocaml.doc ""]

type nonrec remove_managed_scaling_policy_input = {
  cluster_id : cluster_id;
      [@ocaml.doc
        " Specifies the ID of the cluster from which the managed scaling policy will be removed. \n"]
}
[@@ocaml.doc ""]

type nonrec remove_auto_termination_policy_output = unit [@@ocaml.doc ""]

type nonrec remove_auto_termination_policy_input = {
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of the Amazon EMR cluster from which the auto-termination policy will be \
         removed.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_auto_scaling_policy_output = unit [@@ocaml.doc ""]

type nonrec instance_group_id = string [@@ocaml.doc ""]

type nonrec remove_auto_scaling_policy_input = {
  instance_group_id : instance_group_id;
      [@ocaml.doc
        "Specifies the ID of the instance group to which the scaling policy is applied.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of a cluster. The instance group to which the automatic scaling policy \
         is applied is within this cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec release_label_filter = {
  application : string_ option;
      [@ocaml.doc "Optional release label application filter. For example, [spark@2.1.0].\n"]
  prefix : string_ option;
      [@ocaml.doc "Optional release label version prefix filter. For example, [emr-5].\n"]
}
[@@ocaml.doc "The release label filters by application or version prefix.\n"]

type nonrec reconfiguration_type = MERGE [@ocaml.doc ""] | OVERWRITE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec put_managed_scaling_policy_output = unit [@@ocaml.doc ""]

type nonrec put_managed_scaling_policy_input = {
  managed_scaling_policy : managed_scaling_policy;
      [@ocaml.doc "Specifies the constraints for the managed scaling policy. \n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of an Amazon EMR cluster where the managed scaling policy is attached. \n"]
}
[@@ocaml.doc ""]

type nonrec put_block_public_access_configuration_output = unit [@@ocaml.doc ""]

type nonrec port = int [@@ocaml.doc ""]

type nonrec port_range = {
  max_range : port option;
      [@ocaml.doc "The smallest port number in a specified range of port numbers.\n"]
  min_range : port; [@ocaml.doc "The smallest port number in a specified range of port numbers.\n"]
}
[@@ocaml.doc
  "A list of port ranges that are permitted to allow inbound traffic from all public IP addresses. \
   To specify a single port, use the same value for [MinRange] and [MaxRange].\n"]

type nonrec port_ranges = port_range list [@@ocaml.doc ""]

type nonrec block_public_access_configuration = {
  properties : string_map option;
      [@ocaml.doc "A set of properties specified within a configuration classification.\n"]
  configurations : configuration_list option;
      [@ocaml.doc "A list of additional configurations to apply within a configuration object.\n"]
  classification : string_ option; [@ocaml.doc "The classification within a configuration.\n"]
  permitted_public_security_group_rule_ranges : port_ranges option;
      [@ocaml.doc
        "Specifies ports and port ranges that are permitted to have security group rules that \
         allow inbound traffic from all public sources. For example, if Port 23 (Telnet) is \
         specified for [PermittedPublicSecurityGroupRuleRanges], Amazon EMR allows cluster \
         creation if a security group associated with the cluster has a rule that allows inbound \
         traffic on Port 23 from IPv4 0.0.0.0/0 or IPv6 port ::/0 as the source.\n\n\
        \ By default, Port 22, which is used for SSH access to the cluster Amazon EC2 instances, \
         is in the list of [PermittedPublicSecurityGroupRuleRanges].\n\
        \ "]
  block_public_security_group_rules : boolean_;
      [@ocaml.doc
        "Indicates whether Amazon EMR block public access is enabled ([true]) or disabled \
         ([false]). By default, the value is [false] for accounts that have created Amazon EMR \
         clusters before July 2019. For accounts created after this, the default is [true].\n"]
}
[@@ocaml.doc
  "A configuration for Amazon EMR block public access. When [BlockPublicSecurityGroupRules] is set \
   to [true], Amazon EMR prevents cluster creation if one of the cluster's security groups has a \
   rule that allows inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified \
   as an exception using [PermittedPublicSecurityGroupRuleRanges].\n"]

type nonrec put_block_public_access_configuration_input = {
  block_public_access_configuration : block_public_access_configuration;
      [@ocaml.doc
        "A configuration for Amazon EMR block public access. The configuration applies to all \
         clusters created in your account for the current Region. The configuration specifies \
         whether block public access is enabled. If block public access is enabled, security \
         groups associated with the cluster cannot have rules that allow inbound traffic from \
         0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using \
         [PermittedPublicSecurityGroupRuleRanges] in the [BlockPublicAccessConfiguration]. By \
         default, Port 22 (SSH) is an exception, and public access is allowed on this port. You \
         can change this by updating [BlockPublicSecurityGroupRules] to remove the exception.\n\n\
        \  For accounts that created clusters in a Region before November 25, 2019, block public \
         access is disabled by default in that Region. To use this feature, you must manually \
         enable and configure it. For accounts that did not create an Amazon EMR cluster in a \
         Region before this date, block public access is enabled by default in that Region.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_auto_termination_policy_output = unit [@@ocaml.doc ""]

type nonrec put_auto_termination_policy_input = {
  auto_termination_policy : auto_termination_policy option;
      [@ocaml.doc "Specifies the auto-termination policy to attach to the cluster.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of the Amazon EMR cluster to which the auto-termination policy will be \
         attached.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_policy_state =
  | FAILED [@ocaml.doc ""]
  | DETACHED [@ocaml.doc ""]
  | DETACHING [@ocaml.doc ""]
  | ATTACHED [@ocaml.doc ""]
  | ATTACHING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_scaling_policy_state_change_reason_code =
  | CLEANUP_FAILURE [@ocaml.doc ""]
  | PROVISION_FAILURE [@ocaml.doc ""]
  | USER_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_scaling_policy_state_change_reason = {
  message : string_ option;
      [@ocaml.doc
        "A friendly, more verbose message that accompanies an automatic scaling policy state change.\n"]
  code : auto_scaling_policy_state_change_reason_code option;
      [@ocaml.doc
        "The code indicating the reason for the change in status.[USER_REQUEST] indicates that the \
         scaling policy status was changed by a user. [PROVISION_FAILURE] indicates that the \
         status change was because the policy failed to provision. [CLEANUP_FAILURE] indicates an \
         error.\n"]
}
[@@ocaml.doc "The reason for an [AutoScalingPolicyStatus] change.\n"]

type nonrec auto_scaling_policy_status = {
  state_change_reason : auto_scaling_policy_state_change_reason option;
      [@ocaml.doc "The reason for a change in status.\n"]
  state : auto_scaling_policy_state option;
      [@ocaml.doc "Indicates the status of the automatic scaling policy.\n"]
}
[@@ocaml.doc "The status of an automatic scaling policy. \n"]

type nonrec auto_scaling_policy_description = {
  rules : scaling_rule_list option;
      [@ocaml.doc "The scale-in and scale-out rules that comprise the automatic scaling policy.\n"]
  constraints : scaling_constraints option;
      [@ocaml.doc
        "The upper and lower Amazon EC2 instance limits for an automatic scaling policy. Automatic \
         scaling activity will not cause an instance group to grow above or below these limits.\n"]
  status : auto_scaling_policy_status option;
      [@ocaml.doc "The status of an automatic scaling policy. \n"]
}
[@@ocaml.doc
  "An automatic scaling policy for a core instance group or task instance group in an Amazon EMR \
   cluster. The automatic scaling policy defines how an instance group dynamically adds and \
   terminates Amazon EC2 instances in response to the value of a CloudWatch metric. See \
   [PutAutoScalingPolicy].\n"]

type nonrec put_auto_scaling_policy_output = {
  cluster_arn : arn_type option; [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster.\n"]
  auto_scaling_policy : auto_scaling_policy_description option;
      [@ocaml.doc "The automatic scaling policy definition.\n"]
  instance_group_id : instance_group_id option;
      [@ocaml.doc
        "Specifies the ID of the instance group to which the scaling policy is applied.\n"]
  cluster_id : cluster_id option;
      [@ocaml.doc
        "Specifies the ID of a cluster. The instance group to which the automatic scaling policy \
         is applied is within this cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec put_auto_scaling_policy_input = {
  auto_scaling_policy : auto_scaling_policy;
      [@ocaml.doc "Specifies the definition of the automatic scaling policy.\n"]
  instance_group_id : instance_group_id;
      [@ocaml.doc
        "Specifies the ID of the instance group to which the automatic scaling policy is applied.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of a cluster. The instance group to which the automatic scaling policy \
         is applied is within this cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec profiler_type = YTS [@ocaml.doc ""] | TEZUI [@ocaml.doc ""] | SHS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec persistent_app_ui_type =
  | YTS [@ocaml.doc ""]
  | TEZ [@ocaml.doc ""]
  | SHS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec persistent_app_ui_type_list = persistent_app_ui_type list [@@ocaml.doc ""]

type nonrec persistent_app_u_i = {
  tags : tag_list option;
      [@ocaml.doc "A collection of tags for the persistent application user interface object.\n"]
  last_state_change_reason : xml_string option;
      [@ocaml.doc "The reason the persistent application user interface object was last changed.\n"]
  last_modified_time : date option;
      [@ocaml.doc
        "The date and time the persistent application user interface object was last changed.\n"]
  creation_time : date option;
      [@ocaml.doc
        "The creation date and time for the persistent application user interface object.\n"]
  author_id : xml_string_max_len256 option;
      [@ocaml.doc "The author ID for the persistent application user interface object.\n"]
  persistent_app_ui_status : xml_string_max_len256 option;
      [@ocaml.doc "The status for the persistent application user interface object.\n"]
  persistent_app_ui_type_list : persistent_app_ui_type_list option;
      [@ocaml.doc
        "The type list for the persistent application user interface object. Valid values include \
         SHS, YTS, or TEZ.\n"]
  persistent_app_ui_id : xml_string_max_len256 option;
      [@ocaml.doc "The identifier for the persistent application user interface object.\n"]
}
[@@ocaml.doc
  "Holds persistent application user interface information. Applications installed on the Amazon \
   EMR cluster publish user interfaces as web sites to monitor cluster activity.\n"]

type nonrec output_notebook_s3_location_for_output = {
  key : uri_string option;
      [@ocaml.doc "The key to the Amazon S3 location that stores the notebook execution output.\n"]
  bucket : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon S3 bucket that stores the notebook execution output.\n"]
}
[@@ocaml.doc "The Amazon S3 location that stores the notebook execution output.\n"]

type nonrec on_cluster_app_ui_type =
  | ResourceManager [@ocaml.doc ""]
  | JobHistoryServer [@ocaml.doc ""]
  | ApplicationMaster [@ocaml.doc ""]
  | TezUI [@ocaml.doc ""]
  | YarnTimelineService [@ocaml.doc ""]
  | SparkHistoryServer [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec os_release = {
  label : string_ option;
      [@ocaml.doc
        "The Amazon Linux release specified for a cluster in the RunJobFlow request. The format is \
         as shown in {{:https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-20220218.html} {i \
         Amazon Linux 2 Release Notes} }. For example, 2.0.20220218.1.\n"]
}
[@@ocaml.doc "The Amazon Linux release specified for a cluster in the RunJobFlow request.\n"]

type nonrec os_release_list = os_release list [@@ocaml.doc ""]

type nonrec notebook_s3_location_for_output = {
  key : uri_string option;
      [@ocaml.doc "The key to the Amazon S3 location that stores the notebook execution input.\n"]
  bucket : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon S3 bucket that stores the notebook execution input.\n"]
}
[@@ocaml.doc "The Amazon S3 location that stores the notebook execution input.\n"]

type nonrec notebook_execution_status =
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOP_PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | FAILING [@ocaml.doc ""]
  | FINISHED [@ocaml.doc ""]
  | FINISHING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | START_PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notebook_execution_summary = {
  execution_engine_id : xml_string option;
      [@ocaml.doc "The unique ID of the execution engine for the notebook execution.\n"]
  notebook_s3_location : notebook_s3_location_for_output option;
      [@ocaml.doc "The Amazon S3 location that stores the notebook execution input.\n"]
  end_time : date option; [@ocaml.doc "The timestamp when notebook execution started.\n"]
  start_time : date option; [@ocaml.doc "The timestamp when notebook execution started.\n"]
  status : notebook_execution_status option;
      [@ocaml.doc
        "The status of the notebook execution.\n\n\
        \ {ul\n\
        \       {-   [START_PENDING] indicates that the cluster has received the execution request \
         but execution has not begun.\n\
        \           \n\
        \            }\n\
        \       {-   [STARTING] indicates that the execution is starting on the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING] indicates that the execution is being processed by the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHING] indicates that execution processing is in the final stages.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHED] indicates that the execution has completed without error.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILING] indicates that the execution is failing and will not finish \
         successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] indicates that the execution failed.\n\
        \           \n\
        \            }\n\
        \       {-   [STOP_PENDING] indicates that the cluster has received a \
         [StopNotebookExecution] request and the stop is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPING] indicates that the cluster is in the process of stopping the \
         execution as a result of a [StopNotebookExecution] request.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED] indicates that the execution stopped because of a \
         [StopNotebookExecution] request.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  notebook_execution_name : xml_string_max_len256 option;
      [@ocaml.doc "The name of the notebook execution.\n"]
  editor_id : xml_string_max_len256 option;
      [@ocaml.doc "The unique identifier of the editor associated with the notebook execution.\n"]
  notebook_execution_id : xml_string_max_len256 option;
      [@ocaml.doc "The unique identifier of the notebook execution.\n"]
}
[@@ocaml.doc
  "Details for a notebook execution. The details include information such as the unique ID and \
   status of the notebook execution.\n"]

type nonrec notebook_execution_summary_list = notebook_execution_summary list [@@ocaml.doc ""]

type nonrec notebook_execution = {
  environment_variables : environment_variables_map option;
      [@ocaml.doc "The environment variables associated with the notebook execution.\n"]
  output_notebook_format : output_notebook_format option;
      [@ocaml.doc "The output format for the notebook execution.\n"]
  output_notebook_s3_location : output_notebook_s3_location_for_output option;
      [@ocaml.doc "The Amazon S3 location for the notebook execution output.\n"]
  notebook_s3_location : notebook_s3_location_for_output option;
      [@ocaml.doc "The Amazon S3 location that stores the notebook execution input.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags associated with a notebook execution. Tags are user-defined key-value \
         pairs that consist of a required key string with a maximum of 128 characters and an \
         optional value string with a maximum of 256 characters.\n"]
  notebook_instance_security_group_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The unique identifier of the Amazon EC2 security group associated with the Amazon EMR \
         Notebook instance. For more information see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-notebooks-security-groups.html}Specifying \
         Amazon EC2 Security Groups for Amazon EMR Notebooks} in the {i Amazon EMR Management \
         Guide}.\n"]
  last_state_change_reason : xml_string option;
      [@ocaml.doc "The reason for the latest status change of the notebook execution.\n"]
  output_notebook_ur_i : xml_string option;
      [@ocaml.doc "The location of the notebook execution's output file in Amazon S3.\n"]
  arn : xml_string_max_len256 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the notebook execution.\n"]
  end_time : date option; [@ocaml.doc "The timestamp when notebook execution ended.\n"]
  start_time : date option; [@ocaml.doc "The timestamp when notebook execution started.\n"]
  status : notebook_execution_status option;
      [@ocaml.doc
        "The status of the notebook execution.\n\n\
        \ {ul\n\
        \       {-   [START_PENDING] indicates that the cluster has received the execution request \
         but execution has not begun.\n\
        \           \n\
        \            }\n\
        \       {-   [STARTING] indicates that the execution is starting on the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING] indicates that the execution is being processed by the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHING] indicates that execution processing is in the final stages.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHED] indicates that the execution has completed without error.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILING] indicates that the execution is failing and will not finish \
         successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] indicates that the execution failed.\n\
        \           \n\
        \            }\n\
        \       {-   [STOP_PENDING] indicates that the cluster has received a \
         [StopNotebookExecution] request and the stop is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPING] indicates that the cluster is in the process of stopping the \
         execution as a result of a [StopNotebookExecution] request.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED] indicates that the execution stopped because of a \
         [StopNotebookExecution] request.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  notebook_params : xml_string option;
      [@ocaml.doc
        "Input parameters in JSON format passed to the Amazon EMR Notebook at runtime for execution.\n"]
  notebook_execution_name : xml_string_max_len256 option;
      [@ocaml.doc "A name for the notebook execution.\n"]
  execution_engine : execution_engine_config option;
      [@ocaml.doc
        "The execution engine, such as an Amazon EMR cluster, used to run the Amazon EMR notebook \
         and perform the notebook execution.\n"]
  editor_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The unique identifier of the Amazon EMR Notebook that is used for the notebook execution.\n"]
  notebook_execution_id : xml_string_max_len256 option;
      [@ocaml.doc "The unique identifier of a notebook execution.\n"]
}
[@@ocaml.doc
  "A notebook execution. An execution is a specific instance that an Amazon EMR Notebook is run \
   using the [StartNotebookExecution] action.\n"]

type nonrec ec2_instance_ids_to_terminate_list = instance_id list [@@ocaml.doc ""]

type nonrec instance_group_modify_config = {
  configurations : configuration_list option;
      [@ocaml.doc "A list of new or modified configurations to apply for an instance group.\n"]
  reconfiguration_type : reconfiguration_type option;
      [@ocaml.doc "Type of reconfiguration requested. Valid values are MERGE and OVERWRITE.\n"]
  shrink_policy : shrink_policy option; [@ocaml.doc "Policy for customizing shrink operations.\n"]
  ec2_instance_ids_to_terminate : ec2_instance_ids_to_terminate_list option;
      [@ocaml.doc
        "The Amazon EC2 InstanceIds to terminate. After you terminate the instances, the instance \
         group will not return to its original requested size.\n"]
  instance_count : integer option; [@ocaml.doc "Target size for the instance group.\n"]
  instance_group_id : xml_string_max_len256;
      [@ocaml.doc "Unique ID of the instance group to modify.\n"]
}
[@@ocaml.doc "Modify the size or configurations of an instance group.\n"]

type nonrec instance_group_modify_config_list = instance_group_modify_config list [@@ocaml.doc ""]

type nonrec modify_instance_groups_input = {
  instance_groups : instance_group_modify_config_list option;
      [@ocaml.doc "Instance groups to change.\n"]
  cluster_id : cluster_id option;
      [@ocaml.doc "The ID of the cluster to which the instance group belongs.\n"]
}
[@@ocaml.doc "Change the size of some instance groups.\n"]

type nonrec instance_fleet_id = string [@@ocaml.doc ""]

type nonrec instance_fleet_modify_config = {
  context : xml_string_max_len256 option; [@ocaml.doc "Reserved.\n"]
  instance_type_configs : instance_type_config_list option;
      [@ocaml.doc
        "An array of InstanceTypeConfig objects that specify how Amazon EMR provisions Amazon EC2 \
         instances when it fulfills On-Demand and Spot capacities. For more information, see \
         {{:https://docs.aws.amazon.com/emr/latest/APIReference/API_InstanceTypeConfig.html}InstanceTypeConfig}.\n"]
  resize_specifications : instance_fleet_resizing_specifications option;
      [@ocaml.doc "The resize specification for the instance fleet.\n"]
  target_spot_capacity : whole_number option;
      [@ocaml.doc
        "The target capacity of Spot units for the instance fleet. For more information, see \
         [InstanceFleetConfig$TargetSpotCapacity].\n"]
  target_on_demand_capacity : whole_number option;
      [@ocaml.doc
        "The target capacity of On-Demand units for the instance fleet. For more information see \
         [InstanceFleetConfig$TargetOnDemandCapacity].\n"]
  instance_fleet_id : instance_fleet_id; [@ocaml.doc "A unique identifier for the instance fleet.\n"]
}
[@@ocaml.doc
  "Configuration parameters for an instance fleet modification request.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec modify_instance_fleet_input = {
  instance_fleet : instance_fleet_modify_config;
      [@ocaml.doc "The configuration parameters of the instance fleet.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The unique identifier of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_cluster_output = {
  extended_support : boolean_object option; [@ocaml.doc "Reserved.\n"]
  step_concurrency_level : integer option;
      [@ocaml.doc "The number of steps that can be executed concurrently.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_cluster_input = {
  extended_support : boolean_object option; [@ocaml.doc "Reserved.\n"]
  step_concurrency_level : integer option;
      [@ocaml.doc
        "The number of steps that can be executed concurrently. You can specify a minimum of 1 \
         step and a maximum of 256 steps. We recommend that you do not change this parameter while \
         steps are running or the [ActionOnFailure] setting may not behave as expected. For more \
         information see [Step$ActionOnFailure].\n"]
  cluster_id : string_; [@ocaml.doc "The unique identifier of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_number = int [@@ocaml.doc ""]

type nonrec marker = string [@@ocaml.doc ""]

type nonrec list_supported_instance_types_output = {
  marker : string_ option;
      [@ocaml.doc "The pagination token that marks the next set of results to retrieve.\n"]
  supported_instance_types : supported_instance_types_list option;
      [@ocaml.doc
        "The list of instance types that the release specified in \
         [ListSupportedInstanceTypesInput$ReleaseLabel] supports, filtered by Amazon Web Services \
         Region.\n"]
}
[@@ocaml.doc ""]

type nonrec list_supported_instance_types_input = {
  marker : string_ option;
      [@ocaml.doc "The pagination token that marks the next set of results to retrieve.\n"]
  release_label : string_;
      [@ocaml.doc
        "The Amazon EMR release label determines the \
         {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-app-versions-6.x.html}versions \
         of open-source application packages} that Amazon EMR has installed on the cluster. \
         Release labels are in the format [emr-x.x.x], where x.x.x is an Amazon EMR release number \
         such as [emr-6.10.0]. For more information about Amazon EMR releases and their included \
         application versions and features, see the {i  \
         {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-components.html}Amazon \
         EMR Release Guide} }.\n"]
}
[@@ocaml.doc ""]

type nonrec list_studios_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  studios : studio_summary_list option; [@ocaml.doc "The list of Studio summary objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_studios_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the set of results to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec list_studio_session_mappings_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  session_mappings : session_mapping_summary_list option;
      [@ocaml.doc
        "A list of session mapping summary objects. Each object includes session mapping details \
         such as creation time, identity type (user or group), and Amazon EMR Studio ID.\n"]
}
[@@ocaml.doc ""]

type nonrec list_studio_session_mappings_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the set of results to retrieve.\n"]
  identity_type : identity_type option;
      [@ocaml.doc
        "Specifies whether to return session mappings for users or groups. If not specified, the \
         results include session mapping details for both users and groups.\n"]
  studio_id : xml_string_max_len256 option; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec list_steps_output = {
  marker : marker option;
      [@ocaml.doc
        "The maximum number of steps that a single [ListSteps] action returns is 50. To return a \
         longer list of steps, use multiple [ListSteps] actions along with the [Marker] parameter, \
         which is a pagination token that indicates the next set of results to retrieve.\n"]
  steps : step_summary_list option; [@ocaml.doc "The filtered list of steps for the cluster.\n"]
}
[@@ocaml.doc
  "This output contains the list of steps returned in reverse order. This means that the last step \
   is the first element in the list.\n"]

type nonrec list_steps_input = {
  marker : marker option;
      [@ocaml.doc
        "The maximum number of steps that a single [ListSteps] action returns is 50. To return a \
         longer list of steps, use multiple [ListSteps] actions along with the [Marker] parameter, \
         which is a pagination token that indicates the next set of results to retrieve.\n"]
  step_ids : xml_string_list option;
      [@ocaml.doc
        "The filter to limit the step list based on the identifier of the steps. You can specify a \
         maximum of ten Step IDs. The character constraint applies to the overall length of the \
         array.\n"]
  step_states : step_state_list option;
      [@ocaml.doc "The filter to limit the step list based on certain states.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc "The identifier of the cluster for which to list the steps.\n"]
}
[@@ocaml.doc "This input determines which steps to list.\n"]

type nonrec list_sessions_output = {
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use in a subsequent [ListSessions] call to retrieve the next page \
         of results. This field is absent when there are no more results.\n"]
  sessions : session_list option; [@ocaml.doc "The sessions that match the request.\n"]
}
[@@ocaml.doc "Output of the [ListSessions] operation.\n"]

type nonrec list_sessions_input = {
  max_results : max_results_number option;
      [@ocaml.doc "The maximum number of sessions to return in each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token returned by a previous [ListSessions] call. Use it to retrieve the \
         next page of results.\n"]
  session_states : session_state_list option;
      [@ocaml.doc
        "An optional filter that limits the results to sessions in the specified states.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster to list sessions for.\n"]
}
[@@ocaml.doc "Input to the [ListSessions] operation.\n"]

type nonrec list_security_configurations_output = {
  marker : marker option;
      [@ocaml.doc
        "A pagination token that indicates the next set of results to retrieve. Include the marker \
         in the next ListSecurityConfiguration call to retrieve the next page of results, if \
         required.\n"]
  security_configurations : security_configuration_list option;
      [@ocaml.doc "The creation date and time, and name, of each security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec list_security_configurations_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the set of results to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec list_release_labels_output = {
  next_token : string_ option;
      [@ocaml.doc
        "Used to paginate the next page of results if specified in the next [ListReleaseLabels] \
         request.\n"]
  release_labels : string_list option; [@ocaml.doc "The returned release labels.\n"]
}
[@@ocaml.doc ""]

type nonrec list_release_labels_input = {
  max_results : max_results_number option;
      [@ocaml.doc
        "Defines the maximum number of release labels to return in a single response. The default \
         is [100].\n"]
  next_token : string_ option;
      [@ocaml.doc
        "Specifies the next page of results. If [NextToken] is not specified, which is usually the \
         case for the first request of ListReleaseLabels, the first page of results are determined \
         by other filtering parameters or by the latest version. The [ListReleaseLabels] request \
         fails if the identity (Amazon Web Services account ID) and all filtering parameters are \
         different from the original request, or if the [NextToken] is expired or tampered with.\n"]
  filters : release_label_filter option;
      [@ocaml.doc
        "Filters the results of the request. [Prefix] specifies the prefix of release labels to \
         return. [Application] specifies the application (with/without version) of release labels \
         to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_notebook_executions_output = {
  marker : marker option;
      [@ocaml.doc
        "A pagination token that a subsequent [ListNotebookExecutions] can use to determine the \
         next set of results to retrieve.\n"]
  notebook_executions : notebook_execution_summary_list option;
      [@ocaml.doc "A list of notebook executions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_notebook_executions_input = {
  execution_engine_id : xml_string option; [@ocaml.doc "The unique ID of the execution engine.\n"]
  marker : marker option;
      [@ocaml.doc
        "The pagination token, returned by a previous [ListNotebookExecutions] call, that \
         indicates the start of the list for this [ListNotebookExecutions] call.\n"]
  to_ : date option;
      [@ocaml.doc
        "The end of time range filter for listing notebook executions. The default is the current \
         timestamp.\n"]
  from_ : date option;
      [@ocaml.doc
        "The beginning of time range filter for listing notebook executions. The default is the \
         timestamp of 30 days ago.\n"]
  status : notebook_execution_status option;
      [@ocaml.doc
        "The status filter for listing notebook executions.\n\n\
        \ {ul\n\
        \       {-   [START_PENDING] indicates that the cluster has received the execution request \
         but execution has not begun.\n\
        \           \n\
        \            }\n\
        \       {-   [STARTING] indicates that the execution is starting on the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING] indicates that the execution is being processed by the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHING] indicates that execution processing is in the final stages.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHED] indicates that the execution has completed without error.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILING] indicates that the execution is failing and will not finish \
         successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] indicates that the execution failed.\n\
        \           \n\
        \            }\n\
        \       {-   [STOP_PENDING] indicates that the cluster has received a \
         [StopNotebookExecution] request and the stop is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPING] indicates that the cluster is in the process of stopping the \
         execution as a result of a [StopNotebookExecution] request.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED] indicates that the execution stopped because of a \
         [StopNotebookExecution] request.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  editor_id : xml_string_max_len256 option;
      [@ocaml.doc "The unique ID of the editor associated with the notebook execution.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_state =
  | TERMINATED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | BOOTSTRAPPING [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | AWAITING_FULFILLMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_state_change_reason_code =
  | CLUSTER_TERMINATED [@ocaml.doc ""]
  | BOOTSTRAP_FAILURE [@ocaml.doc ""]
  | INSTANCE_FAILURE [@ocaml.doc ""]
  | VALIDATION_ERROR [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_state_change_reason = {
  message : string_ option; [@ocaml.doc "The status change reason description.\n"]
  code : instance_state_change_reason_code option;
      [@ocaml.doc "The programmable code for the state change reason.\n"]
}
[@@ocaml.doc "The details of the status change reason for the instance.\n"]

type nonrec instance_timeline = {
  end_date_time : date option; [@ocaml.doc "The date and time when the instance was terminated.\n"]
  ready_date_time : date option;
      [@ocaml.doc "The date and time when the instance was ready to perform tasks.\n"]
  creation_date_time : date option; [@ocaml.doc "The creation date and time of the instance.\n"]
}
[@@ocaml.doc "The timeline of the instance lifecycle.\n"]

type nonrec instance_status = {
  timeline : instance_timeline option;
      [@ocaml.doc "The timeline of the instance status over time.\n"]
  state_change_reason : instance_state_change_reason option;
      [@ocaml.doc "The details of the status change reason for the instance.\n"]
  state : instance_state option; [@ocaml.doc "The current state of the instance.\n"]
}
[@@ocaml.doc "The instance status details.\n"]

type nonrec ebs_volume = {
  volume_id : string_ option; [@ocaml.doc "The volume identifier of the EBS volume.\n"]
  device : string_ option;
      [@ocaml.doc "The device name that is exposed to the instance, such as /dev/sdh.\n"]
}
[@@ocaml.doc "EBS block device that's attached to an Amazon EC2 instance.\n"]

type nonrec ebs_volume_list = ebs_volume list [@@ocaml.doc ""]

type nonrec instance = {
  ebs_volumes : ebs_volume_list option;
      [@ocaml.doc "The list of Amazon EBS volumes that are attached to this instance.\n"]
  instance_type : instance_type option;
      [@ocaml.doc "The Amazon EC2 instance type, for example [m3.xlarge].\n"]
  market : market_type option;
      [@ocaml.doc "The instance purchasing option. Valid values are [ON_DEMAND] or [SPOT]. \n"]
  instance_fleet_id : instance_fleet_id option;
      [@ocaml.doc
        "The unique identifier of the instance fleet to which an Amazon EC2 instance belongs.\n"]
  instance_group_id : string_ option;
      [@ocaml.doc "The identifier of the instance group to which this instance belongs.\n"]
  status : instance_status option; [@ocaml.doc "The current status of the instance.\n"]
  private_ip_address : string_ option; [@ocaml.doc "The private IP address of the instance.\n"]
  private_dns_name : string_ option; [@ocaml.doc "The private DNS name of the instance.\n"]
  public_ip_address : string_ option; [@ocaml.doc "The public IP address of the instance.\n"]
  public_dns_name : string_ option; [@ocaml.doc "The public DNS name of the instance.\n"]
  ec2_instance_id : instance_id option;
      [@ocaml.doc "The unique identifier of the instance in Amazon EC2.\n"]
  id : instance_id option; [@ocaml.doc "The unique identifier for the instance in Amazon EMR.\n"]
}
[@@ocaml.doc "Represents an Amazon EC2 instance provisioned as part of cluster.\n"]

type nonrec instance_list = instance list [@@ocaml.doc ""]

type nonrec list_instances_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  instances : instance_list option;
      [@ocaml.doc "The list of instances for the cluster and given filters.\n"]
}
[@@ocaml.doc "This output contains the list of instances.\n"]

type nonrec instance_group_type =
  | TASK [@ocaml.doc ""]
  | CORE [@ocaml.doc ""]
  | MASTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_group_type_list = instance_group_type list [@@ocaml.doc ""]

type nonrec instance_state_list = instance_state list [@@ocaml.doc ""]

type nonrec list_instances_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  instance_states : instance_state_list option;
      [@ocaml.doc
        "A list of instance states that will filter the instances returned with this request.\n"]
  instance_fleet_type : instance_fleet_type option;
      [@ocaml.doc "The node type of the instance fleet. For example MASTER, CORE, or TASK.\n"]
  instance_fleet_id : instance_fleet_id option;
      [@ocaml.doc "The unique identifier of the instance fleet.\n"]
  instance_group_types : instance_group_type_list option;
      [@ocaml.doc "The type of instance group for which to list the instances.\n"]
  instance_group_id : instance_group_id option;
      [@ocaml.doc "The identifier of the instance group for which to list the instances.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc "The identifier of the cluster for which to list the instances.\n"]
}
[@@ocaml.doc "This input determines which instances to list.\n"]

type nonrec instance_group_state =
  | ENDED [@ocaml.doc ""]
  | SHUTTING_DOWN [@ocaml.doc ""]
  | ARRESTED [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | RESIZING [@ocaml.doc ""]
  | RECONFIGURING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | BOOTSTRAPPING [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_group_state_change_reason_code =
  | CLUSTER_TERMINATED [@ocaml.doc ""]
  | INSTANCE_FAILURE [@ocaml.doc ""]
  | VALIDATION_ERROR [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_group_state_change_reason = {
  message : string_ option; [@ocaml.doc "The status change reason description.\n"]
  code : instance_group_state_change_reason_code option;
      [@ocaml.doc "The programmable code for the state change reason.\n"]
}
[@@ocaml.doc "The status change reason details for the instance group.\n"]

type nonrec instance_group_timeline = {
  end_date_time : date option;
      [@ocaml.doc "The date and time when the instance group terminated.\n"]
  ready_date_time : date option;
      [@ocaml.doc "The date and time when the instance group became ready to perform tasks.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time of the instance group.\n"]
}
[@@ocaml.doc "The timeline of the instance group lifecycle.\n"]

type nonrec instance_group_status = {
  timeline : instance_group_timeline option;
      [@ocaml.doc "The timeline of the instance group status over time.\n"]
  state_change_reason : instance_group_state_change_reason option;
      [@ocaml.doc "The status change reason details for the instance group.\n"]
  state : instance_group_state option; [@ocaml.doc "The current state of the instance group.\n"]
}
[@@ocaml.doc "The details of the instance group status.\n"]

type nonrec ebs_block_device = {
  device : string_ option;
      [@ocaml.doc "The device name that is exposed to the instance, such as /dev/sdh.\n"]
  volume_specification : volume_specification option;
      [@ocaml.doc
        "EBS volume specifications such as volume type, IOPS, size (GiB) and throughput (MiB/s) \
         that are requested for the EBS volume attached to an Amazon EC2 instance in the cluster.\n"]
}
[@@ocaml.doc "Configuration of requested EBS block device associated with the instance group.\n"]

type nonrec ebs_block_device_list = ebs_block_device list [@@ocaml.doc ""]

type nonrec instance_group = {
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc "The custom AMI ID to use for the provisioned instance group.\n"]
  auto_scaling_policy : auto_scaling_policy_description option;
      [@ocaml.doc
        "An automatic scaling policy for a core instance group or task instance group in an Amazon \
         EMR cluster. The automatic scaling policy defines how an instance group dynamically adds \
         and terminates Amazon EC2 instances in response to the value of a CloudWatch metric. See \
         PutAutoScalingPolicy.\n"]
  shrink_policy : shrink_policy option; [@ocaml.doc "Policy for customizing shrink operations.\n"]
  ebs_optimized : boolean_object option;
      [@ocaml.doc
        "If the instance group is EBS-optimized. An Amazon EBS-optimized instance uses an \
         optimized configuration stack and provides additional, dedicated capacity for Amazon EBS \
         I/O.\n"]
  ebs_block_devices : ebs_block_device_list option;
      [@ocaml.doc "The EBS block devices that are mapped to this instance group.\n"]
  last_successfully_applied_configurations_version : long option;
      [@ocaml.doc
        "The version number of a configuration specification that was successfully applied for an \
         instance group last time. \n"]
  last_successfully_applied_configurations : configuration_list option;
      [@ocaml.doc
        "A list of configurations that were successfully applied for an instance group last time.\n"]
  configurations_version : long option;
      [@ocaml.doc
        "The version number of the requested configuration specification for this instance group.\n"]
  configurations : configuration_list option;
      [@ocaml.doc
        " Amazon EMR releases 4.x or later.\n\
        \ \n\
        \   The list of configurations supplied for an Amazon EMR cluster instance group. You can \
         specify a separate configuration for each instance group (master, core, and task).\n\
        \   "]
  status : instance_group_status option; [@ocaml.doc "The current status of the instance group.\n"]
  running_instance_count : integer option;
      [@ocaml.doc "The number of instances currently running in this instance group.\n"]
  requested_instance_count : integer option;
      [@ocaml.doc "The target number of instances for the instance group.\n"]
  instance_type : instance_type option;
      [@ocaml.doc "The Amazon EC2 instance type for all instances in the instance group.\n"]
  bid_price : string_ option;
      [@ocaml.doc
        "The bid price for each Amazon EC2 Spot Instance type as defined by [InstanceType]. \
         Expressed in USD. If neither [BidPrice] nor [BidPriceAsPercentageOfOnDemandPrice] is \
         provided, [BidPriceAsPercentageOfOnDemandPrice] defaults to 100%.\n"]
  instance_group_type : instance_group_type option;
      [@ocaml.doc "The type of the instance group. Valid values are MASTER, CORE or TASK.\n"]
  market : market_type option;
      [@ocaml.doc
        "The marketplace to provision instances for this group. Valid values are ON_DEMAND or SPOT.\n"]
  name : string_ option; [@ocaml.doc "The name of the instance group.\n"]
  id : instance_group_id option; [@ocaml.doc "The identifier of the instance group.\n"]
}
[@@ocaml.doc
  "This entity represents an instance group, which is a group of instances that have common \
   purpose. For example, CORE instance group is used for HDFS.\n"]

type nonrec instance_group_list = instance_group list [@@ocaml.doc ""]

type nonrec list_instance_groups_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  instance_groups : instance_group_list option;
      [@ocaml.doc "The list of instance groups for the cluster and given filters.\n"]
}
[@@ocaml.doc "This input determines which instance groups to retrieve.\n"]

type nonrec list_instance_groups_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc "The identifier of the cluster for which to list the instance groups.\n"]
}
[@@ocaml.doc "This input determines which instance groups to retrieve.\n"]

type nonrec instance_fleet_state =
  | TERMINATED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | RECONFIGURING [@ocaml.doc ""]
  | RESIZING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | BOOTSTRAPPING [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_fleet_state_change_reason_code =
  | CLUSTER_TERMINATED [@ocaml.doc ""]
  | INSTANCE_FAILURE [@ocaml.doc ""]
  | VALIDATION_ERROR [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_fleet_state_change_reason = {
  message : string_ option; [@ocaml.doc "An explanatory message.\n"]
  code : instance_fleet_state_change_reason_code option;
      [@ocaml.doc "A code corresponding to the reason the state change occurred.\n"]
}
[@@ocaml.doc
  "Provides status change reason details for the instance fleet.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_fleet_timeline = {
  end_date_time : date option; [@ocaml.doc "The time and date the instance fleet terminated.\n"]
  ready_date_time : date option;
      [@ocaml.doc "The time and date the instance fleet was ready to run jobs.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The time and date the instance fleet was created.\n"]
}
[@@ocaml.doc
  "Provides historical timestamps for the instance fleet, including the time of creation, the time \
   it became ready to run jobs, and the time of termination.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_fleet_status = {
  timeline : instance_fleet_timeline option;
      [@ocaml.doc
        "Provides historical timestamps for the instance fleet, including the time of creation, \
         the time it became ready to run jobs, and the time of termination.\n"]
  state_change_reason : instance_fleet_state_change_reason option;
      [@ocaml.doc "Provides status change reason details for the instance fleet.\n"]
  state : instance_fleet_state option;
      [@ocaml.doc
        "A code representing the instance fleet status.\n\n\
        \ {ul\n\
        \       {-   [PROVISIONING]\226\128\148The instance fleet is provisioning Amazon EC2 \
         resources and is not yet ready to run jobs.\n\
        \           \n\
        \            }\n\
        \       {-   [BOOTSTRAPPING]\226\128\148Amazon EC2 instances and other resources have been \
         provisioned and the bootstrap actions specified for the instances are underway.\n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING]\226\128\148Amazon EC2 instances and other resources are running. \
         They are either executing jobs or waiting to execute jobs.\n\
        \           \n\
        \            }\n\
        \       {-   [RESIZING]\226\128\148A resize operation is underway. Amazon EC2 instances \
         are either being added or removed.\n\
        \           \n\
        \            }\n\
        \       {-   [SUSPENDED]\226\128\148A resize operation could not complete. Existing Amazon \
         EC2 instances are running, but instances can't be added or removed.\n\
        \           \n\
        \            }\n\
        \       {-   [TERMINATING]\226\128\148The instance fleet is terminating Amazon EC2 \
         instances.\n\
        \           \n\
        \            }\n\
        \       {-   [TERMINATED]\226\128\148The instance fleet is no longer active, and all \
         Amazon EC2 instances have been terminated.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The status of the instance fleet.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_type_specification = {
  priority : non_negative_double option;
      [@ocaml.doc
        "The priority at which Amazon EMR launches the Amazon EC2 instances with this instance \
         type. Priority starts at 0, which is the highest priority. Amazon EMR considers the \
         highest priority first.\n"]
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc "The custom AMI ID to use for the instance type.\n"]
  ebs_optimized : boolean_object option;
      [@ocaml.doc "Evaluates to [TRUE] when the specified [InstanceType] is EBS-optimized.\n"]
  ebs_block_devices : ebs_block_device_list option;
      [@ocaml.doc
        "The configuration of Amazon Elastic Block Store (Amazon EBS) attached to each instance as \
         defined by [InstanceType].\n"]
  configurations : configuration_list option;
      [@ocaml.doc
        "A configuration classification that applies when provisioning cluster instances, which \
         can include configurations for applications and software bundled with Amazon EMR.\n"]
  bid_price_as_percentage_of_on_demand_price : non_negative_double option;
      [@ocaml.doc
        "The bid price, as a percentage of On-Demand price, for each Amazon EC2 Spot Instance as \
         defined by [InstanceType]. Expressed as a number (for example, 20 specifies 20%).\n"]
  bid_price : xml_string_max_len256 option;
      [@ocaml.doc
        "The bid price for each Amazon EC2 Spot Instance type as defined by [InstanceType]. \
         Expressed in USD. If neither [BidPrice] nor [BidPriceAsPercentageOfOnDemandPrice] is \
         provided, [BidPriceAsPercentageOfOnDemandPrice] defaults to 100%.\n"]
  weighted_capacity : whole_number option;
      [@ocaml.doc
        "The number of units that a provisioned instance of this type provides toward fulfilling \
         the target capacities defined in [InstanceFleetConfig]. Capacity values represent \
         performance characteristics such as vCPUs, memory, or I/O. If not specified, the default \
         value is 1.\n"]
  instance_type : instance_type option;
      [@ocaml.doc "The Amazon EC2 instance type, for example [m3.xlarge].\n"]
}
[@@ocaml.doc
  "The configuration specification for each instance type in an instance fleet.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_type_specification_list = instance_type_specification list [@@ocaml.doc ""]

type nonrec instance_fleet = {
  context : xml_string_max_len256 option; [@ocaml.doc "Reserved.\n"]
  resize_specifications : instance_fleet_resizing_specifications option;
      [@ocaml.doc "The resize specification for the instance fleet.\n"]
  launch_specifications : instance_fleet_provisioning_specifications option;
      [@ocaml.doc "Describes the launch specification for an instance fleet. \n"]
  instance_type_specifications : instance_type_specification_list option;
      [@ocaml.doc
        "An array of specifications for the instance types that comprise an instance fleet.\n"]
  provisioned_spot_capacity : whole_number option;
      [@ocaml.doc
        "The number of Spot units that have been provisioned for this instance fleet to fulfill \
         [TargetSpotCapacity]. This provisioned capacity might be less than or greater than \
         [TargetSpotCapacity].\n"]
  provisioned_on_demand_capacity : whole_number option;
      [@ocaml.doc
        "The number of On-Demand units that have been provisioned for the instance fleet to \
         fulfill [TargetOnDemandCapacity]. This provisioned capacity might be less than or greater \
         than [TargetOnDemandCapacity].\n"]
  target_spot_capacity : whole_number option;
      [@ocaml.doc
        "The target capacity of Spot units for the instance fleet, which determines how many Spot \
         Instances to provision. When the instance fleet launches, Amazon EMR tries to provision \
         Spot Instances as specified by [InstanceTypeConfig]. Each instance configuration has a \
         specified [WeightedCapacity]. When a Spot instance is provisioned, the [WeightedCapacity] \
         units count toward the target capacity. Amazon EMR provisions instances until the target \
         capacity is totally fulfilled, even if this results in an overage. For example, if there \
         are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance \
         with a [WeightedCapacity] of 5 units, the instance is provisioned, and the target \
         capacity is exceeded by 3 units. You can use [InstanceFleet$ProvisionedSpotCapacity] to \
         determine the Spot capacity units that have been provisioned for the instance fleet.\n\n\
        \  If not specified or set to 0, only On-Demand Instances are provisioned for the instance \
         fleet. At least one of [TargetSpotCapacity] and [TargetOnDemandCapacity] should be \
         greater than 0. For a master instance fleet, only one of [TargetSpotCapacity] and \
         [TargetOnDemandCapacity] can be specified, and its value must be 1.\n\
        \  \n\
        \   "]
  target_on_demand_capacity : whole_number option;
      [@ocaml.doc
        "The target capacity of On-Demand units for the instance fleet, which determines how many \
         On-Demand Instances to provision. When the instance fleet launches, Amazon EMR tries to \
         provision On-Demand Instances as specified by [InstanceTypeConfig]. Each instance \
         configuration has a specified [WeightedCapacity]. When an On-Demand Instance is \
         provisioned, the [WeightedCapacity] units count toward the target capacity. Amazon EMR \
         provisions instances until the target capacity is totally fulfilled, even if this results \
         in an overage. For example, if there are 2 units remaining to fulfill capacity, and \
         Amazon EMR can only provision an instance with a [WeightedCapacity] of 5 units, the \
         instance is provisioned, and the target capacity is exceeded by 3 units. You can use \
         [InstanceFleet$ProvisionedOnDemandCapacity] to determine the Spot capacity units that \
         have been provisioned for the instance fleet.\n\n\
        \  If not specified or set to 0, only Spot Instances are provisioned for the instance \
         fleet using [TargetSpotCapacity]. At least one of [TargetSpotCapacity] and \
         [TargetOnDemandCapacity] should be greater than 0. For a master instance fleet, only one \
         of [TargetSpotCapacity] and [TargetOnDemandCapacity] can be specified, and its value must \
         be 1.\n\
        \  \n\
        \   "]
  instance_fleet_type : instance_fleet_type option;
      [@ocaml.doc
        "The node type that the instance fleet hosts. Valid values are MASTER, CORE, or TASK. \n"]
  status : instance_fleet_status option; [@ocaml.doc "The current status of the instance fleet. \n"]
  name : xml_string_max_len256 option; [@ocaml.doc "A friendly name for the instance fleet.\n"]
  id : instance_fleet_id option; [@ocaml.doc "The unique identifier of the instance fleet.\n"]
}
[@@ocaml.doc
  "Describes an instance fleet, which is a group of Amazon EC2 instances that host a particular \
   node type (master, core, or task) in an Amazon EMR cluster. Instance fleets can consist of a \
   mix of instance types and On-Demand and Spot Instances, which are provisioned to meet a defined \
   target capacity. \n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

type nonrec instance_fleet_list = instance_fleet list [@@ocaml.doc ""]

type nonrec list_instance_fleets_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  instance_fleets : instance_fleet_list option;
      [@ocaml.doc "The list of instance fleets for the cluster and given filters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_instance_fleets_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The unique identifier of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_state =
  | TERMINATED_WITH_ERRORS [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | WAITING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | BOOTSTRAPPING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_state_change_reason_code =
  | ALL_STEPS_COMPLETED [@ocaml.doc ""]
  | STEP_FAILURE [@ocaml.doc ""]
  | USER_REQUEST [@ocaml.doc ""]
  | BOOTSTRAP_FAILURE [@ocaml.doc ""]
  | INSTANCE_FLEET_TIMEOUT [@ocaml.doc ""]
  | INSTANCE_FAILURE [@ocaml.doc ""]
  | VALIDATION_ERROR [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_state_change_reason = {
  message : string_ option; [@ocaml.doc "The descriptive message for the state change reason.\n"]
  code : cluster_state_change_reason_code option;
      [@ocaml.doc "The programmatic code for the state change reason.\n"]
}
[@@ocaml.doc "The reason that the cluster changed to its current state.\n"]

type nonrec cluster_timeline = {
  end_date_time : date option; [@ocaml.doc "The date and time when the cluster was terminated.\n"]
  ready_date_time : date option;
      [@ocaml.doc "The date and time when the cluster was ready to run steps.\n"]
  creation_date_time : date option; [@ocaml.doc "The creation date and time of the cluster.\n"]
}
[@@ocaml.doc "Represents the timeline of the cluster's lifecycle.\n"]

type nonrec error_data = string_map list [@@ocaml.doc ""]

type nonrec error_detail = {
  error_message : string_ option; [@ocaml.doc "A message that describes the error.\n"]
  error_data : error_data option;
      [@ocaml.doc
        "A list of key value pairs that provides contextual information about why an error occured.\n"]
  error_code : string_ option; [@ocaml.doc "The name or code associated with the error.\n"]
}
[@@ocaml.doc
  "A tuple that provides information about an error that caused a cluster to terminate.\n"]

type nonrec error_detail_list = error_detail list [@@ocaml.doc ""]

type nonrec cluster_status = {
  error_details : error_detail_list option;
      [@ocaml.doc
        "A list of tuples that provides information about the errors that caused a cluster to \
         terminate. This structure can contain up to 10 different [ErrorDetail] tuples.\n"]
  timeline : cluster_timeline option;
      [@ocaml.doc
        "A timeline that represents the status of a cluster over the lifetime of the cluster.\n"]
  state_change_reason : cluster_state_change_reason option;
      [@ocaml.doc "The reason for the cluster status change.\n"]
  state : cluster_state option; [@ocaml.doc "The current state of the cluster.\n"]
}
[@@ocaml.doc "The detailed status of the cluster.\n"]

type nonrec cluster_summary = {
  outpost_arn : optional_arn_type option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the Outpost where the cluster is launched. \n"]
  cluster_arn : arn_type option; [@ocaml.doc "The Amazon Resource Name of the cluster.\n"]
  normalized_instance_hours : integer option;
      [@ocaml.doc
        "An approximation of the cost of the cluster, represented in m1.small/hours. This value is \
         incremented one time for every hour an m1.small instance runs. Larger instances are \
         weighted more, so an Amazon EC2 instance that is roughly four times more expensive would \
         result in the normalized instance hours being incremented by four. This result is only an \
         approximation and does not reflect the actual billing rate.\n"]
  status : cluster_status option;
      [@ocaml.doc "The details about the current status of the cluster.\n"]
  name : string_ option; [@ocaml.doc "The name of the cluster.\n"]
  id : cluster_id option; [@ocaml.doc "The unique identifier for the cluster.\n"]
}
[@@ocaml.doc "The summary description of the cluster.\n"]

type nonrec cluster_summary_list = cluster_summary list [@@ocaml.doc ""]

type nonrec list_clusters_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  clusters : cluster_summary_list option;
      [@ocaml.doc "The list of clusters for the account based on the given filters.\n"]
}
[@@ocaml.doc
  "This contains a ClusterSummaryList with the cluster details; for example, the cluster IDs, \
   names, and status.\n"]

type nonrec cluster_state_list = cluster_state list [@@ocaml.doc ""]

type nonrec list_clusters_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  cluster_states : cluster_state_list option;
      [@ocaml.doc
        "The cluster state filters to apply when listing clusters. Clusters that change state \
         while this action runs may be not be returned as expected in the list of clusters.\n"]
  created_before : date option;
      [@ocaml.doc "The creation date and time end value filter for listing clusters.\n"]
  created_after : date option;
      [@ocaml.doc "The creation date and time beginning value filter for listing clusters.\n"]
}
[@@ocaml.doc
  "This input determines how the ListClusters action filters the list of clusters that it returns.\n"]

type nonrec command = {
  args : string_list option;
      [@ocaml.doc "Arguments for Amazon EMR to pass to the command for execution.\n"]
  script_path : string_ option; [@ocaml.doc "The Amazon S3 location of the command script.\n"]
  name : string_ option; [@ocaml.doc "The name of the command.\n"]
}
[@@ocaml.doc "An entity describing an executable that runs on a cluster.\n"]

type nonrec command_list = command list [@@ocaml.doc ""]

type nonrec list_bootstrap_actions_output = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  bootstrap_actions : command_list option;
      [@ocaml.doc "The bootstrap actions associated with the cluster.\n"]
}
[@@ocaml.doc "This output contains the bootstrap actions detail.\n"]

type nonrec list_bootstrap_actions_input = {
  marker : marker option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The cluster identifier for the bootstrap actions to list.\n"]
}
[@@ocaml.doc "This input determines which bootstrap actions to retrieve.\n"]

type nonrec instance_group_detail = {
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc "The custom AMI ID to use for the provisioned instance group.\n"]
  end_date_time : date option; [@ocaml.doc "The date/time the instance group was terminated.\n"]
  ready_date_time : date option;
      [@ocaml.doc "The date/time the instance group was available to the cluster.\n"]
  start_date_time : date option; [@ocaml.doc "The date/time the instance group was started.\n"]
  creation_date_time : date; [@ocaml.doc "The date/time the instance group was created.\n"]
  last_state_change_reason : xml_string option;
      [@ocaml.doc "Details regarding the state of the instance group.\n"]
  state : instance_group_state;
      [@ocaml.doc
        "State of instance group. The following values are no longer supported: STARTING, \
         TERMINATED, and FAILED.\n"]
  instance_running_count : integer; [@ocaml.doc "Actual count of running instances.\n"]
  instance_request_count : integer;
      [@ocaml.doc "Target number of instances to run in the instance group.\n"]
  instance_type : instance_type; [@ocaml.doc "Amazon EC2 instance type.\n"]
  bid_price : xml_string_max_len256 option;
      [@ocaml.doc
        "The bid price for each Amazon EC2 Spot Instance type as defined by [InstanceType]. \
         Expressed in USD. If neither [BidPrice] nor [BidPriceAsPercentageOfOnDemandPrice] is \
         provided, [BidPriceAsPercentageOfOnDemandPrice] defaults to 100%.\n"]
  instance_role : instance_role_type; [@ocaml.doc "Instance group role in the cluster\n"]
  market : market_type;
      [@ocaml.doc "Market type of the Amazon EC2 instances used to create a cluster node.\n"]
  name : xml_string_max_len256 option; [@ocaml.doc "Friendly name for the instance group.\n"]
  instance_group_id : xml_string_max_len256 option;
      [@ocaml.doc "Unique identifier for the instance group.\n"]
}
[@@ocaml.doc "Detailed information about an instance group.\n"]

type nonrec instance_group_detail_list = instance_group_detail list [@@ocaml.doc ""]

type nonrec job_flow_instances_detail = {
  hadoop_version : xml_string_max_len256 option;
      [@ocaml.doc "The Hadoop version for the cluster.\n"]
  unhealthy_node_replacement : boolean_object option;
      [@ocaml.doc
        "Indicates whether Amazon EMR should gracefully replace core nodes that have degraded \
         within the cluster.\n"]
  termination_protected : boolean_ option;
      [@ocaml.doc
        "Specifies whether the Amazon EC2 instances in the cluster are protected from termination \
         by API calls, user intervention, or in the event of a job-flow error.\n"]
  keep_job_flow_alive_when_no_steps : boolean_ option;
      [@ocaml.doc
        "Specifies whether the cluster should remain available after completing all steps.\n"]
  placement : placement_type option;
      [@ocaml.doc "The Amazon EC2 Availability Zone for the cluster.\n"]
  ec2_subnet_id : xml_string_max_len256 option;
      [@ocaml.doc
        "For clusters launched within Amazon Virtual Private Cloud, this is the identifier of the \
         subnet where the cluster was launched.\n"]
  ec2_key_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of an Amazon EC2 key pair that can be used to connect to the master node using \
         SSH.\n"]
  normalized_instance_hours : integer option;
      [@ocaml.doc
        "An approximation of the cost of the cluster, represented in m1.small/hours. This value is \
         increased one time for every hour that an m1.small instance runs. Larger instances are \
         weighted more heavily, so an Amazon EC2 instance that is roughly four times more \
         expensive would result in the normalized instance hours being increased incrementally \
         four times. This result is only an approximation and does not reflect the actual billing \
         rate.\n"]
  instance_groups : instance_group_detail_list option;
      [@ocaml.doc "Details about the instance groups in a cluster.\n"]
  instance_count : integer;
      [@ocaml.doc
        "The number of Amazon EC2 instances in the cluster. If the value is 1, the same instance \
         serves as both the master and core and task node. If the value is greater than 1, one \
         instance is the master node and all others are core and task nodes.\n"]
  slave_instance_type : instance_type;
      [@ocaml.doc "The Amazon EC2 core and task node instance type.\n"]
  master_instance_id : xml_string option;
      [@ocaml.doc "The Amazon EC2 instance identifier of the master node.\n"]
  master_public_dns_name : xml_string option;
      [@ocaml.doc
        "The DNS name of the master node. If the cluster is on a private subnet, this is the \
         private DNS name. On a public subnet, this is the public DNS name.\n"]
  master_instance_type : instance_type; [@ocaml.doc "The Amazon EC2 master node instance type.\n"]
}
[@@ocaml.doc "Specify the type of Amazon EC2 instances that the cluster (job flow) runs on.\n"]

type nonrec job_flow_execution_state =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | SHUTTING_DOWN [@ocaml.doc ""]
  | WAITING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | BOOTSTRAPPING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
[@@ocaml.doc "The type of instance.\n"]

type nonrec job_flow_execution_status_detail = {
  last_state_change_reason : xml_string option;
      [@ocaml.doc "Description of the job flow last changed state.\n"]
  end_date_time : date option; [@ocaml.doc "The completion date and time of the job flow.\n"]
  ready_date_time : date option;
      [@ocaml.doc
        "The date and time when the job flow was ready to start running bootstrap actions.\n"]
  start_date_time : date option; [@ocaml.doc "The start date and time of the job flow.\n"]
  creation_date_time : date; [@ocaml.doc "The creation date and time of the job flow.\n"]
  state : job_flow_execution_state; [@ocaml.doc "The state of the job flow.\n"]
}
[@@ocaml.doc "Describes the status of the cluster (job flow).\n"]

type nonrec job_flow_execution_state_list = job_flow_execution_state list [@@ocaml.doc ""]

type nonrec bootstrap_action_detail = {
  bootstrap_action_config : bootstrap_action_config option;
      [@ocaml.doc "A description of the bootstrap action.\n"]
}
[@@ocaml.doc "Reports the configuration of a bootstrap action in a cluster (job flow).\n"]

type nonrec bootstrap_action_detail_list = bootstrap_action_detail list [@@ocaml.doc ""]

type nonrec job_flow_detail = {
  scale_down_behavior : scale_down_behavior option;
      [@ocaml.doc
        "The way that individual Amazon EC2 instances terminate when an automatic scale-in \
         activity occurs or an instance group is resized. [TERMINATE_AT_INSTANCE_HOUR] indicates \
         that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the \
         request to terminate the instance was submitted. This option is only available with \
         Amazon EMR 5.1.0 and later and is the default for clusters created using that version. \
         [TERMINATE_AT_TASK_COMPLETION] indicates that Amazon EMR adds nodes to a deny list and \
         drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the \
         instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes \
         first and blocks instance termination if it could lead to HDFS corruption. \
         [TERMINATE_AT_TASK_COMPLETION] available only in Amazon EMR releases 4.1.0 and later, and \
         is the default for releases of Amazon EMR earlier than 5.1.0.\n"]
  auto_scaling_role : xml_string option;
      [@ocaml.doc
        "An IAM role for automatic scaling policies. The default role is \
         [EMR_AutoScaling_DefaultRole]. The IAM role provides a way for the automatic scaling \
         feature to get the required permissions it needs to launch and terminate Amazon EC2 \
         instances in an instance group.\n"]
  service_role : xml_string option;
      [@ocaml.doc
        "The IAM role that is assumed by the Amazon EMR service to access Amazon Web Services \
         resources on your behalf.\n"]
  job_flow_role : xml_string option;
      [@ocaml.doc
        "The IAM role that was specified when the job flow was launched. The Amazon EC2 instances \
         of the job flow assume this role.\n"]
  visible_to_all_users : boolean_ option;
      [@ocaml.doc
        "Indicates whether the cluster is visible to IAM principals in the Amazon Web Services \
         account associated with the cluster. When [true], IAM principals in the Amazon Web \
         Services account can perform Amazon EMR cluster actions that their IAM policies allow. \
         When [false], only the IAM principal that created the cluster and the Amazon Web Services \
         account root user can perform Amazon EMR actions, regardless of IAM permissions policies \
         attached to other IAM principals.\n\n\
        \ The default value is [true] if a value is not provided when creating a cluster using the \
         Amazon EMR API [RunJobFlow] command, the CLI \
         {{:https://docs.aws.amazon.com/cli/latest/reference/emr/create-cluster.html}create-cluster} \
         command, or the Amazon Web Services Management Console.\n\
        \ "]
  supported_products : supported_products_list option;
      [@ocaml.doc
        "A list of strings set by third-party software when the job flow is launched. If you are \
         not using third-party software to manage the job flow, this value is empty.\n"]
  bootstrap_actions : bootstrap_action_detail_list option;
      [@ocaml.doc "A list of the bootstrap actions run by the job flow.\n"]
  steps : step_detail_list option; [@ocaml.doc "A list of steps run by the job flow.\n"]
  instances : job_flow_instances_detail;
      [@ocaml.doc "Describes the Amazon EC2 instances of the job flow.\n"]
  execution_status_detail : job_flow_execution_status_detail;
      [@ocaml.doc "Describes the execution status of the job flow.\n"]
  ami_version : xml_string_max_len256 option;
      [@ocaml.doc
        "Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and \
         later, [ReleaseLabel] is used. To specify a custom AMI, use [CustomAmiID].\n"]
  log_encryption_kms_key_id : xml_string option;
      [@ocaml.doc
        "The KMS key used for encrypting log files. This attribute is only available with Amazon \
         EMR 5.30.0 and later, excluding 6.0.0.\n"]
  log_uri : xml_string option;
      [@ocaml.doc "The location in Amazon S3 where log files for the job are stored.\n"]
  name : xml_string_max_len256; [@ocaml.doc "The name of the job flow.\n"]
  job_flow_id : xml_string_max_len256; [@ocaml.doc "The job flow identifier.\n"]
}
[@@ocaml.doc "A description of a cluster (job flow).\n"]

type nonrec job_flow_detail_list = job_flow_detail list [@@ocaml.doc ""]

type nonrec instance_group_ids_list = xml_string_max_len256 list [@@ocaml.doc ""]

type nonrec instance_collection_type =
  | INSTANCE_GROUP [@ocaml.doc ""]
  | INSTANCE_FLEET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_studio_session_mapping_output = {
  session_mapping : session_mapping_detail option;
      [@ocaml.doc
        "The session mapping details for the specified Amazon EMR Studio and identity, including \
         session policy ARN and creation time.\n"]
}
[@@ocaml.doc ""]

type nonrec get_studio_session_mapping_input = {
  identity_type : identity_type;
      [@ocaml.doc "Specifies whether the identity to fetch is a user or a group.\n"]
  identity_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the user or group to fetch. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName}UserName} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName}DisplayName} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified.\n"]
  identity_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The globally unique identifier (GUID) of the user or group. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId}UserId} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId}GroupId} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified.\n"]
  studio_id : xml_string_max_len256; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_output = {
  session : session; [@ocaml.doc "The output displays information about the session.\n"]
}
[@@ocaml.doc "Output of the [GetSession] operation.\n"]

type nonrec get_session_input = {
  session_id : session_id; [@ocaml.doc "The ID of the session.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster that the session belongs to.\n"]
}
[@@ocaml.doc "Input to the [GetSession] operation.\n"]

type nonrec credentials =
  | UsernamePassword of username_password
      [@ocaml.doc "The username and password that you use to connect to cluster endpoints.\n"]
[@@ocaml.doc
  "The credentials that you can use to connect to cluster endpoints. Credentials consist of a \
   username and a password.\n"]

type nonrec get_session_endpoint_output = {
  credentials : credentials option;
      [@ocaml.doc
        "Username and password used to authenticate with the Spark Connect server when connecting \
         directly over VPC peering.\n"]
  auth_token_expiration_time : date option;
      [@ocaml.doc
        "The time at which the authentication token expires. After this time, call \
         [GetSessionEndpoint] again to obtain a new token.\n"]
  auth_token : sensitive_string option;
      [@ocaml.doc
        "A time-limited authentication token used to connect to the Spark Connect endpoint.\n"]
  endpoint : xml_string;
      [@ocaml.doc "The Spark Connect endpoint URL to use in the PySpark client.\n"]
}
[@@ocaml.doc "Output of the [GetSessionEndpoint] operation.\n"]

type nonrec get_session_endpoint_input = {
  session_id : session_id; [@ocaml.doc "The ID of the session.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The ID of the cluster that the session belongs to.\n"]
}
[@@ocaml.doc "Input to the [GetSessionEndpoint] operation.\n"]

type nonrec get_persistent_app_ui_presigned_url_output = {
  presigned_ur_l : xml_string option; [@ocaml.doc "The returned presigned URL.\n"]
  presigned_url_ready : boolean_ option;
      [@ocaml.doc "Used to determine if the presigned URL is ready.\n"]
}
[@@ocaml.doc ""]

type nonrec get_persistent_app_ui_presigned_url_input = {
  execution_role_arn : arn_type option;
      [@ocaml.doc "The execution role ARN associated with the presigned URL.\n"]
  auth_proxy_call : boolean_object option;
      [@ocaml.doc "A boolean that represents if the caller is an authentication proxy call.\n"]
  application_id : xml_string_max_len256 option;
      [@ocaml.doc "The application ID associated with the presigned URL.\n"]
  persistent_app_ui_type : persistent_app_ui_type option;
      [@ocaml.doc
        "The persistent application user interface type associated with the presigned URL.\n"]
  persistent_app_ui_id : xml_string_max_len256;
      [@ocaml.doc
        "The persistent application user interface ID associated with the presigned URL.\n"]
}
[@@ocaml.doc ""]

type nonrec get_on_cluster_app_ui_presigned_url_output = {
  presigned_ur_l : xml_string option; [@ocaml.doc "The cluster's generated presigned URL.\n"]
  presigned_url_ready : boolean_ option;
      [@ocaml.doc "Used to determine if the presigned URL is ready.\n"]
}
[@@ocaml.doc ""]

type nonrec get_on_cluster_app_ui_presigned_url_input = {
  execution_role_arn : arn_type option;
      [@ocaml.doc
        "The execution role ARN associated with the cluster's application user interface presigned \
         URL.\n"]
  dry_run : boolean_object option;
      [@ocaml.doc "Determines if the user interface presigned URL is for a dry run.\n"]
  application_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The application ID associated with the cluster's application user interface presigned URL.\n"]
  on_cluster_app_ui_type : on_cluster_app_ui_type option;
      [@ocaml.doc
        "The application UI type associated with the cluster's application user interface \
         presigned URL.\n"]
  cluster_id : xml_string_max_len256;
      [@ocaml.doc
        "The cluster ID associated with the cluster's application user interface presigned URL.\n"]
}
[@@ocaml.doc ""]

type nonrec get_managed_scaling_policy_output = {
  managed_scaling_policy : managed_scaling_policy option;
      [@ocaml.doc
        "Specifies the managed scaling policy that is attached to an Amazon EMR cluster. \n"]
}
[@@ocaml.doc ""]

type nonrec get_managed_scaling_policy_input = {
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of the cluster for which the managed scaling policy will be fetched. \n"]
}
[@@ocaml.doc ""]

type nonrec get_cluster_session_credentials_output = {
  expires_at : date option;
      [@ocaml.doc
        "The time when the credentials that are returned by the [GetClusterSessionCredentials] API \
         expire.\n"]
  credentials : credentials option;
      [@ocaml.doc
        "The credentials that you can use to connect to cluster endpoints that support username \
         and password authentication.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cluster_session_credentials_input = {
  execution_role_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the runtime role for interactive workload submission on \
         the cluster. The runtime role can be a cross-account IAM role. The runtime role ARN is a \
         combination of account ID, role name, and role type using the following format: \
         [arn:partition:service:region:account:resource].\n"]
  cluster_id : xml_string_max_len256; [@ocaml.doc "The unique identifier of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec block_public_access_configuration_metadata = {
  created_by_arn : arn_type;
      [@ocaml.doc "The Amazon Resource Name that created or last modified the configuration.\n"]
  creation_date_time : date; [@ocaml.doc "The date and time that the configuration was created.\n"]
}
[@@ocaml.doc
  "Properties that describe the Amazon Web Services principal that created the \
   [BlockPublicAccessConfiguration] using the [PutBlockPublicAccessConfiguration] action as well \
   as the date and time that the configuration was created. Each time a configuration for block \
   public access is updated, Amazon EMR updates this metadata.\n"]

type nonrec get_block_public_access_configuration_output = {
  block_public_access_configuration_metadata : block_public_access_configuration_metadata;
      [@ocaml.doc
        "Properties that describe the Amazon Web Services principal that created the \
         [BlockPublicAccessConfiguration] using the [PutBlockPublicAccessConfiguration] action as \
         well as the date and time that the configuration was created. Each time a configuration \
         for block public access is updated, Amazon EMR updates this metadata.\n"]
  block_public_access_configuration : block_public_access_configuration;
      [@ocaml.doc
        "A configuration for Amazon EMR block public access. The configuration applies to all \
         clusters created in your account for the current Region. The configuration specifies \
         whether block public access is enabled. If block public access is enabled, security \
         groups associated with the cluster cannot have rules that allow inbound traffic from \
         0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using \
         [PermittedPublicSecurityGroupRuleRanges] in the [BlockPublicAccessConfiguration]. By \
         default, Port 22 (SSH) is an exception, and public access is allowed on this port. You \
         can change this by updating the block public access configuration to remove the \
         exception.\n\n\
        \  For accounts that created clusters in a Region before November 25, 2019, block public \
         access is disabled by default in that Region. To use this feature, you must manually \
         enable and configure it. For accounts that did not create an Amazon EMR cluster in a \
         Region before this date, block public access is enabled by default in that Region.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_block_public_access_configuration_input = unit [@@ocaml.doc ""]

type nonrec get_auto_termination_policy_output = {
  auto_termination_policy : auto_termination_policy option;
      [@ocaml.doc
        "Specifies the auto-termination policy that is attached to an Amazon EMR cluster. \n"]
}
[@@ocaml.doc ""]

type nonrec get_auto_termination_policy_input = {
  cluster_id : cluster_id;
      [@ocaml.doc
        "Specifies the ID of the Amazon EMR cluster for which the auto-termination policy will be \
         fetched.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_studio_output = {
  studio : studio option; [@ocaml.doc "The Amazon EMR Studio details.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_studio_input = {
  studio_id : xml_string_max_len256; [@ocaml.doc "The Amazon EMR Studio ID.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_step_output = {
  step : step option; [@ocaml.doc "The step details for the requested step identifier.\n"]
}
[@@ocaml.doc "This output contains the description of the cluster step.\n"]

type nonrec describe_step_input = {
  step_id : step_id; [@ocaml.doc "The identifier of the step to describe.\n"]
  cluster_id : cluster_id; [@ocaml.doc "The identifier of the cluster with steps to describe.\n"]
}
[@@ocaml.doc "This input determines which step to describe.\n"]

type nonrec describe_security_configuration_output = {
  creation_date_time : date option;
      [@ocaml.doc "The date and time the security configuration was created\n"]
  security_configuration : string_ option;
      [@ocaml.doc "The security configuration details in JSON format.\n"]
  name : xml_string option; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_security_configuration_input = {
  name : xml_string; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_release_label_output = {
  available_os_releases : os_release_list option;
      [@ocaml.doc
        "The list of available Amazon Linux release versions for an Amazon EMR release. Contains a \
         Label field that is formatted as shown in \
         {{:https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-al2.html} {i Amazon Linux 2 \
         Release Notes} }. For example, \
         {{:https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-20220218.html}2.0.20220218.1}.\n"]
  next_token : string_ option;
      [@ocaml.doc "The pagination token. Reserved for future use. Currently set to null.\n"]
  applications : simplified_application_list option;
      [@ocaml.doc
        "The list of applications available for the target release label. [Name] is the name of \
         the application. [Version] is the concise version of the application.\n"]
  release_label : string_ option;
      [@ocaml.doc "The target release label described in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_release_label_input = {
  max_results : max_results_number option;
      [@ocaml.doc "Reserved for future use. Currently set to null.\n"]
  next_token : string_ option;
      [@ocaml.doc "The pagination token. Reserved for future use. Currently set to null.\n"]
  release_label : string_ option; [@ocaml.doc "The target release label to be described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_persistent_app_ui_output = {
  persistent_app_u_i : persistent_app_u_i option;
      [@ocaml.doc "The persistent application user interface.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_persistent_app_ui_input = {
  persistent_app_ui_id : xml_string_max_len256;
      [@ocaml.doc "The identifier for the persistent application user interface.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_notebook_execution_output = {
  notebook_execution : notebook_execution option;
      [@ocaml.doc "Properties of the notebook execution.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_notebook_execution_input = {
  notebook_execution_id : xml_string_max_len256;
      [@ocaml.doc "The unique identifier of the notebook execution.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_job_flows_output = {
  job_flows : job_flow_detail_list option;
      [@ocaml.doc "A list of job flows matching the parameters supplied.\n"]
}
[@@ocaml.doc " The output for the [DescribeJobFlows] operation. \n"]

type nonrec describe_job_flows_input = {
  job_flow_states : job_flow_execution_state_list option;
      [@ocaml.doc "Return only job flows whose state is contained in this list.\n"]
  job_flow_ids : xml_string_list option;
      [@ocaml.doc "Return only job flows whose job flow ID is contained in this list.\n"]
  created_before : date option;
      [@ocaml.doc "Return only job flows created before this date and time.\n"]
  created_after : date option;
      [@ocaml.doc "Return only job flows created after this date and time.\n"]
}
[@@ocaml.doc " The input for the [DescribeJobFlows] operation. \n"]

type nonrec ec2_instance_attributes = {
  additional_slave_security_groups : string_list option;
      [@ocaml.doc
        "A list of additional Amazon EC2 security group IDs for the core and task nodes.\n"]
  additional_master_security_groups : string_list option;
      [@ocaml.doc "A list of additional Amazon EC2 security group IDs for the master node.\n"]
  service_access_security_group : string_ option;
      [@ocaml.doc
        "The identifier of the Amazon EC2 security group for the Amazon EMR service to access \
         clusters in VPC private subnets.\n"]
  emr_managed_slave_security_group : string_ option;
      [@ocaml.doc "The identifier of the Amazon EC2 security group for the core and task nodes.\n"]
  emr_managed_master_security_group : string_ option;
      [@ocaml.doc "The identifier of the Amazon EC2 security group for the master node.\n"]
  iam_instance_profile : string_ option;
      [@ocaml.doc
        "The IAM role that was specified when the cluster was launched. The Amazon EC2 instances \
         of the cluster assume this role.\n"]
  requested_ec2_availability_zones : xml_string_max_len256_list option;
      [@ocaml.doc
        "Applies to clusters configured with the instance fleets option. Specifies one or more \
         Availability Zones in which to launch Amazon EC2 cluster instances when the EC2-Classic \
         network configuration is supported. Amazon EMR chooses the Availability Zone with the \
         best fit from among the list of [RequestedEc2AvailabilityZones], and then launches all \
         cluster instances within that Availability Zone. If you do not specify this value, Amazon \
         EMR chooses the Availability Zone for you. [RequestedEc2SubnetIDs] and \
         [RequestedEc2AvailabilityZones] cannot be specified together.\n"]
  ec2_availability_zone : string_ option;
      [@ocaml.doc "The Availability Zone in which the cluster will run. \n"]
  requested_ec2_subnet_ids : xml_string_max_len256_list option;
      [@ocaml.doc
        "Applies to clusters configured with the instance fleets option. Specifies the unique \
         identifier of one or more Amazon EC2 subnets in which to launch Amazon EC2 cluster \
         instances. Subnets must exist within the same VPC. Amazon EMR chooses the Amazon EC2 \
         subnet with the best fit from among the list of [RequestedEc2SubnetIds], and then \
         launches all cluster instances within that Subnet. If this value is not specified, and \
         the account and Region support EC2-Classic networks, the cluster launches instances in \
         the EC2-Classic network and uses [RequestedEc2AvailabilityZones] instead of this setting. \
         If EC2-Classic is not supported, and no Subnet is specified, Amazon EMR chooses the \
         subnet for you. [RequestedEc2SubnetIDs] and [RequestedEc2AvailabilityZones] cannot be \
         specified together.\n"]
  ec2_subnet_id : string_ option;
      [@ocaml.doc
        "Set this parameter to the identifier of the Amazon VPC subnet where you want the cluster \
         to launch. If you do not specify this value, and your account supports EC2-Classic, the \
         cluster launches in EC2-Classic.\n"]
  ec2_key_name : string_ option;
      [@ocaml.doc
        "The name of the Amazon EC2 key pair to use when connecting with SSH into the master node \
         as a user named \"hadoop\".\n"]
}
[@@ocaml.doc
  "Provides information about the Amazon EC2 instances in a cluster grouped by category. For \
   example, key name, subnet ID, IAM instance profile, and so on.\n"]

type nonrec cluster = {
  session_enabled : boolean_object option;
      [@ocaml.doc "Indicates whether Spark Connect sessions are enabled on the cluster.\n"]
  monitoring_configuration : monitoring_configuration option;
      [@ocaml.doc "Contains Cloudwatch log configuration metadata and settings.\n"]
  extended_support : boolean_object option; [@ocaml.doc "Reserved.\n"]
  ebs_root_volume_throughput : integer option;
      [@ocaml.doc
        "The throughput, in MiB/s, of the Amazon EBS root device volume of the Linux AMI that is \
         used for each Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and later.\n"]
  ebs_root_volume_iops : integer option;
      [@ocaml.doc
        "The IOPS, of the Amazon EBS root device volume of the Linux AMI that is used for each \
         Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and later.\n"]
  os_release_label : string_ option;
      [@ocaml.doc
        "The Amazon Linux release specified in a cluster launch RunJobFlow request. If no Amazon \
         Linux release was specified, the default Amazon Linux release is shown in the response.\n"]
  placement_groups : placement_group_config_list option;
      [@ocaml.doc "Placement group configured for an Amazon EMR cluster.\n"]
  step_concurrency_level : integer option;
      [@ocaml.doc "Specifies the number of steps that can be executed concurrently.\n"]
  outpost_arn : optional_arn_type option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the Outpost where the cluster is launched. \n"]
  cluster_arn : arn_type option; [@ocaml.doc "The Amazon Resource Name of the cluster.\n"]
  kerberos_attributes : kerberos_attributes option;
      [@ocaml.doc
        "Attributes for Kerberos configuration when Kerberos authentication is enabled using a \
         security configuration. For more information see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html}Use Kerberos \
         Authentication} in the {i Amazon EMR Management Guide}.\n"]
  repo_upgrade_on_boot : repo_upgrade_on_boot option;
      [@ocaml.doc
        "Applies only when [CustomAmiID] is used. Specifies the type of updates that the Amazon \
         Linux AMI package repositories apply when an instance boots using the AMI.\n"]
  ebs_root_volume_size : integer option;
      [@ocaml.doc
        "The size, in GiB, of the Amazon EBS root device volume of the Linux AMI that is used for \
         each Amazon EC2 instance. Available in Amazon EMR releases 4.x and later.\n"]
  custom_ami_id : xml_string_max_len256 option;
      [@ocaml.doc
        "Available only in Amazon EMR releases 5.7.0 and later. The ID of a custom Amazon \
         EBS-backed Linux AMI if the cluster uses a custom AMI.\n"]
  scale_down_behavior : scale_down_behavior option;
      [@ocaml.doc
        "The way that individual Amazon EC2 instances terminate when an automatic scale-in \
         activity occurs or an instance group is resized. [TERMINATE_AT_INSTANCE_HOUR] indicates \
         that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the \
         request to terminate the instance was submitted. This option is only available with \
         Amazon EMR 5.1.0 and later and is the default for clusters created using that version. \
         [TERMINATE_AT_TASK_COMPLETION] indicates that Amazon EMR adds nodes to a deny list and \
         drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the \
         instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes \
         first and blocks instance termination if it could lead to HDFS corruption. \
         [TERMINATE_AT_TASK_COMPLETION] is available only in Amazon EMR releases 4.1.0 and later, \
         and is the default for versions of Amazon EMR earlier than 5.1.0.\n"]
  auto_scaling_role : xml_string option;
      [@ocaml.doc
        "An IAM role for automatic scaling policies. The default role is \
         [EMR_AutoScaling_DefaultRole]. The IAM role provides permissions that the automatic \
         scaling feature requires to launch and terminate Amazon EC2 instances in an instance \
         group.\n"]
  security_configuration : xml_string option;
      [@ocaml.doc "The name of the security configuration applied to the cluster.\n"]
  configurations : configuration_list option;
      [@ocaml.doc
        "Applies only to Amazon EMR releases 4.x and later. The list of configurations that are \
         supplied to the Amazon EMR cluster.\n"]
  master_public_dns_name : string_ option;
      [@ocaml.doc
        "The DNS name of the master node. If the cluster is on a private subnet, this is the \
         private DNS name. On a public subnet, this is the public DNS name.\n"]
  normalized_instance_hours : integer option;
      [@ocaml.doc
        "An approximation of the cost of the cluster, represented in m1.small/hours. This value is \
         incremented one time for every hour an m1.small instance runs. Larger instances are \
         weighted more, so an Amazon EC2 instance that is roughly four times more expensive would \
         result in the normalized instance hours being incremented by four. This result is only an \
         approximation and does not reflect the actual billing rate.\n"]
  service_role : string_ option;
      [@ocaml.doc
        "The IAM role that Amazon EMR assumes in order to access Amazon Web Services resources on \
         your behalf.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags associated with a cluster.\n"]
  applications : application_list option;
      [@ocaml.doc "The applications installed on this cluster.\n"]
  visible_to_all_users : boolean_ option;
      [@ocaml.doc
        "Indicates whether the cluster is visible to IAM principals in the Amazon Web Services \
         account associated with the cluster. When [true], IAM principals in the Amazon Web \
         Services account can perform Amazon EMR cluster actions on the cluster that their IAM \
         policies allow. When [false], only the IAM principal that created the cluster and the \
         Amazon Web Services account root user can perform Amazon EMR actions, regardless of IAM \
         permissions policies attached to other IAM principals.\n\n\
        \ The default value is [true] if a value is not provided when creating a cluster using the \
         Amazon EMR API [RunJobFlow] command, the CLI \
         {{:https://docs.aws.amazon.com/cli/latest/reference/emr/create-cluster.html}create-cluster} \
         command, or the Amazon Web Services Management Console.\n\
        \ "]
  unhealthy_node_replacement : boolean_object option;
      [@ocaml.doc
        "Indicates whether Amazon EMR should gracefully replace Amazon EC2 core instances that \
         have degraded within the cluster.\n"]
  termination_protected : boolean_ option;
      [@ocaml.doc
        "Indicates whether Amazon EMR will lock the cluster to prevent the Amazon EC2 instances \
         from being terminated by an API call or user intervention, or in the event of a cluster \
         error.\n"]
  auto_terminate : boolean_ option;
      [@ocaml.doc "Specifies whether the cluster should terminate after completing all steps.\n"]
  release_label : string_ option;
      [@ocaml.doc
        "The Amazon EMR release label, which determines the version of open-source application \
         packages installed on the cluster. Release labels are in the form [emr-x.x.x], where \
         x.x.x is an Amazon EMR release version such as [emr-5.14.0]. For more information about \
         Amazon EMR release versions and included application versions and features, see \
         {{:https://docs.aws.amazon.com/emr/latest/ReleaseGuide/}https://docs.aws.amazon.com/emr/latest/ReleaseGuide/}. \
         The release label applies only to Amazon EMR releases version 4.0 and later. Earlier \
         versions use [AmiVersion].\n"]
  running_ami_version : string_ option; [@ocaml.doc "The AMI version running on this cluster.\n"]
  requested_ami_version : string_ option;
      [@ocaml.doc "The AMI version requested for this cluster.\n"]
  log_encryption_kms_key_id : string_ option;
      [@ocaml.doc
        " The KMS key used for encrypting log files. This attribute is only available with Amazon \
         EMR 5.30.0 and later, excluding Amazon EMR 6.0.0. \n"]
  log_uri : string_ option;
      [@ocaml.doc "The path to the Amazon S3 location where logs for this cluster are stored.\n"]
  instance_collection_type : instance_collection_type option;
      [@ocaml.doc
        " The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and \
         later, excluding 5.0.x versions.\n\
        \ \n\
        \   The instance group configuration of the cluster. A value of [INSTANCE_GROUP] indicates \
         a uniform instance group configuration. A value of [INSTANCE_FLEET] indicates an instance \
         fleets configuration.\n\
        \   "]
  ec2_instance_attributes : ec2_instance_attributes option;
      [@ocaml.doc
        "Provides information about the Amazon EC2 instances in a cluster grouped by category. For \
         example, key name, subnet ID, IAM instance profile, and so on.\n"]
  status : cluster_status option; [@ocaml.doc "The current status details about the cluster.\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the cluster. This parameter can't contain the characters <, >, $, |, or ` \
         (backtick).\n"]
  id : cluster_id option; [@ocaml.doc "The unique identifier for the cluster.\n"]
}
[@@ocaml.doc "The detailed description of the cluster.\n"]

type nonrec describe_cluster_output = {
  cluster : cluster option;
      [@ocaml.doc "This output contains the details for the requested cluster.\n"]
}
[@@ocaml.doc "This output contains the description of the cluster.\n"]

type nonrec describe_cluster_input = {
  cluster_id : cluster_id; [@ocaml.doc "The identifier of the cluster to describe.\n"]
}
[@@ocaml.doc "This input determines which cluster to describe.\n"]

type nonrec delete_studio_session_mapping_input = {
  identity_type : identity_type;
      [@ocaml.doc
        "Specifies whether the identity to delete from the Amazon EMR Studio is a user or a group.\n"]
  identity_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the user name or group to remove from the Amazon EMR Studio. For more \
         information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName}UserName} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName}DisplayName} \
         in the {i IAM Identity Center Store API Reference}. Either [IdentityName] or [IdentityId] \
         must be specified.\n"]
  identity_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The globally unique identifier (GUID) of the user or group to remove from the Amazon EMR \
         Studio. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId}UserId} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId}GroupId} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified.\n"]
  studio_id : xml_string_max_len256; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_studio_input = {
  studio_id : xml_string_max_len256; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_security_configuration_output = unit [@@ocaml.doc ""]

type nonrec delete_security_configuration_input = {
  name : xml_string; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_studio_session_mapping_input = {
  session_policy_arn : xml_string_max_len256;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the session policy that will be applied to the user or \
         group. You should specify the ARN for the session policy that you want to apply, not the \
         ARN of your user role. For more information, see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-studio-user-role.html}Create \
         an Amazon EMR Studio User Role with Session Policies}.\n"]
  identity_type : identity_type;
      [@ocaml.doc
        "Specifies whether the identity to map to the Amazon EMR Studio is a user or a group.\n"]
  identity_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name of the user or group. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName}UserName} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName}DisplayName} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified, but not both.\n"]
  identity_id : xml_string_max_len256 option;
      [@ocaml.doc
        "The globally unique identifier (GUID) of the user or group from the IAM Identity Center \
         Identity Store. For more information, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId}UserId} \
         and \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId}GroupId} \
         in the {i IAM Identity Center Identity Store API Reference}. Either [IdentityName] or \
         [IdentityId] must be specified, but not both.\n"]
  studio_id : xml_string_max_len256;
      [@ocaml.doc "The ID of the Amazon EMR Studio to which the user or group will be mapped.\n"]
}
[@@ocaml.doc ""]

type nonrec create_studio_output = {
  url : xml_string option; [@ocaml.doc "The unique Studio access URL.\n"]
  studio_id : xml_string_max_len256 option; [@ocaml.doc "The ID of the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec create_studio_input = {
  encryption_key_arn : xml_string option;
      [@ocaml.doc
        "The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook \
         files when backed up to Amazon S3.\n"]
  idc_instance_arn : arn_type option;
      [@ocaml.doc
        " The ARN of the IAM Identity Center instance to create the Studio application. \n"]
  idc_user_assignment : idc_user_assignment option;
      [@ocaml.doc
        " Specifies whether IAM Identity Center user assignment is [REQUIRED] or [OPTIONAL]. If \
         the value is set to [REQUIRED], users must be explicitly assigned to the Studio \
         application to access the Studio. \n"]
  trusted_identity_propagation_enabled : boolean_object option;
      [@ocaml.doc
        " A Boolean indicating whether to enable Trusted identity propagation for the Studio. The \
         default value is [false]. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to associate with the Amazon EMR Studio. Tags are user-defined key-value \
         pairs that consist of a required key string with a maximum of 128 characters, and an \
         optional value string with a maximum of 256 characters.\n"]
  idp_relay_state_parameter_name : xml_string_max_len256 option;
      [@ocaml.doc
        "The name that your identity provider (IdP) uses for its [RelayState] parameter. For \
         example, [RelayState] or [TargetSource]. Specify this value when you use IAM \
         authentication and want to let federated users log in to a Studio using the Studio URL. \
         The [RelayState] parameter differs by IdP.\n"]
  idp_auth_url : xml_string option;
      [@ocaml.doc
        "The authentication endpoint of your identity provider (IdP). Specify this value when you \
         use IAM authentication and want to let federated users log in to a Studio with the Studio \
         URL and credentials from your IdP. Amazon EMR Studio redirects users to this endpoint to \
         enter credentials.\n"]
  default_s3_location : xml_string;
      [@ocaml.doc
        "The Amazon S3 location to back up Amazon EMR Studio Workspaces and notebook files.\n"]
  engine_security_group_id : xml_string_max_len256;
      [@ocaml.doc
        "The ID of the Amazon EMR Studio Engine security group. The Engine security group allows \
         inbound network traffic from the Workspace security group, and it must be in the same VPC \
         specified by [VpcId].\n"]
  workspace_security_group_id : xml_string_max_len256;
      [@ocaml.doc
        "The ID of the Amazon EMR Studio Workspace security group. The Workspace security group \
         allows outbound network traffic to resources in the Engine security group, and it must be \
         in the same VPC specified by [VpcId].\n"]
  user_role : xml_string option;
      [@ocaml.doc
        "The IAM user role that users and groups assume when logged in to an Amazon EMR Studio. \
         Only specify a [UserRole] when you use IAM Identity Center authentication. The \
         permissions attached to the [UserRole] can be scoped down for each user or group using \
         session policies.\n"]
  service_role : xml_string;
      [@ocaml.doc
        "The IAM role that the Amazon EMR Studio assumes. The service role provides a way for \
         Amazon EMR Studio to interoperate with other Amazon Web Services services.\n"]
  subnet_ids : subnet_id_list;
      [@ocaml.doc
        "A list of subnet IDs to associate with the Amazon EMR Studio. A Studio can have a maximum \
         of 5 subnets. The subnets must belong to the VPC specified by [VpcId]. Studio users can \
         create a Workspace in any of the specified subnets.\n"]
  vpc_id : xml_string_max_len256;
      [@ocaml.doc
        "The ID of the Amazon Virtual Private Cloud (Amazon VPC) to associate with the Studio.\n"]
  auth_mode : auth_mode;
      [@ocaml.doc
        "Specifies whether the Studio authenticates users using IAM or IAM Identity Center.\n"]
  description : xml_string_max_len256 option;
      [@ocaml.doc "A detailed description of the Amazon EMR Studio.\n"]
  name : xml_string_max_len256; [@ocaml.doc "A descriptive name for the Amazon EMR Studio.\n"]
}
[@@ocaml.doc ""]

type nonrec create_security_configuration_output = {
  creation_date_time : date;
      [@ocaml.doc "The date and time the security configuration was created.\n"]
  name : xml_string; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_security_configuration_input = {
  security_configuration : string_;
      [@ocaml.doc
        "The security configuration details in JSON format. For JSON parameters and examples, see \
         {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-security-configurations.html}Use \
         Security Configurations to Set Up Cluster Security} in the {i Amazon EMR Management \
         Guide}.\n"]
  name : xml_string; [@ocaml.doc "The name of the security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_persistent_app_ui_output = {
  runtime_role_enabled_cluster : boolean_ option;
      [@ocaml.doc
        "Represents if the EMR on EC2 cluster that the persisent application user interface is \
         created for is a runtime role enabled cluster or not.\n"]
  persistent_app_ui_id : xml_string_max_len256 option;
      [@ocaml.doc "The persistent application user interface identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec emr_containers_config = {
  job_run_id : xml_string_max_len256 option;
      [@ocaml.doc "The Job run ID for the container configuration.\n"]
}
[@@ocaml.doc "The EMR container configuration.\n"]

type nonrec create_persistent_app_ui_input = {
  profiler_type : profiler_type option;
      [@ocaml.doc "The profiler type for the persistent application user interface.\n"]
  x_referer : string_ option;
      [@ocaml.doc "The cross reference for the persistent application user interface.\n"]
  tags : tag_list option; [@ocaml.doc "Tags for the persistent application user interface.\n"]
  emr_containers_config : emr_containers_config option;
      [@ocaml.doc "The EMR containers configuration.\n"]
  target_resource_arn : arn_type;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the target resource.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_steps_request_status = FAILED [@ocaml.doc ""] | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cancel_steps_info = {
  reason : string_ option;
      [@ocaml.doc "The reason for the failure if the CancelSteps request fails.\n"]
  status : cancel_steps_request_status option;
      [@ocaml.doc "The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.\n"]
  step_id : step_id option; [@ocaml.doc "The encrypted StepId of a step.\n"]
}
[@@ocaml.doc
  "Specification of the status of a CancelSteps request. Available only in Amazon EMR version \
   4.8.0 and later, excluding version 5.0.0.\n"]

type nonrec cancel_steps_info_list = cancel_steps_info list [@@ocaml.doc ""]

type nonrec cancel_steps_output = {
  cancel_steps_info_list : cancel_steps_info_list option;
      [@ocaml.doc
        "A list of [CancelStepsInfo], which shows the status of specified cancel requests for each \
         [StepID] specified.\n"]
}
[@@ocaml.doc " The output for the [CancelSteps] operation. \n"]

type nonrec cancel_steps_input = {
  step_cancellation_option : step_cancellation_option option;
      [@ocaml.doc
        "The option to choose to cancel [RUNNING] steps. By default, the value is [SEND_INTERRUPT].\n"]
  step_ids : step_ids_list;
      [@ocaml.doc
        "The list of [StepIDs] to cancel. Use [ListSteps] to get steps and their states for the \
         specified cluster.\n"]
  cluster_id : xml_string_max_len256;
      [@ocaml.doc
        "The [ClusterID] for the specified steps that will be canceled. Use [RunJobFlow] and \
         [ListClusters] to get ClusterIDs. \n"]
}
[@@ocaml.doc "The input argument to the [CancelSteps] operation.\n"]

type nonrec add_tags_output = unit [@@ocaml.doc ""]

type nonrec add_tags_input = {
  cluster_id : cluster_id option;
      [@ocaml.doc
        "The ID of the cluster that scopes the tag operation. Required when the resource being \
         tagged is a session-scoped resource.\n"]
  tags : tag_list;
      [@ocaml.doc
        "A list of tags to associate with a resource. Tags are user-defined key-value pairs that \
         consist of a required key string with a maximum of 128 characters, and an optional value \
         string with a maximum of 256 characters.\n"]
  resource_id : resource_id;
      [@ocaml.doc
        "The Amazon EMR resource identifier to which tags will be added. For example, a cluster \
         identifier or an Amazon EMR Studio ID.\n"]
}
[@@ocaml.doc "This input identifies an Amazon EMR resource and a list of tags to attach.\n"]

type nonrec add_job_flow_steps_output = {
  step_ids : step_ids_list option;
      [@ocaml.doc "The identifiers of the list of steps added to the job flow.\n"]
}
[@@ocaml.doc " The output for the [AddJobFlowSteps] operation. \n"]

type nonrec add_job_flow_steps_input = {
  execution_role_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the runtime role for a step on the cluster. The runtime \
         role can be a cross-account IAM role. The runtime role ARN is a combination of account \
         ID, role name, and role type using the following format: \
         [arn:partition:service:region:account:resource]. \n\n\
        \ For example, [arn:aws:IAM::1234567890:role/ReadOnly] is a correctly formatted runtime \
         role ARN.\n\
        \ "]
  steps : step_config_list;
      [@ocaml.doc " A list of [StepConfig] to be executed by the job flow. \n"]
  job_flow_id : xml_string_max_len256;
      [@ocaml.doc
        "A string that uniquely identifies the job flow. This identifier is returned by \
         [RunJobFlow] and can also be obtained from [ListClusters]. \n"]
}
[@@ocaml.doc " The input argument to the [AddJobFlowSteps] operation. \n"]

type nonrec add_instance_groups_output = {
  cluster_arn : arn_type option; [@ocaml.doc "The Amazon Resource Name of the cluster.\n"]
  instance_group_ids : instance_group_ids_list option;
      [@ocaml.doc "Instance group IDs of the newly created instance groups.\n"]
  job_flow_id : xml_string_max_len256 option;
      [@ocaml.doc "The job flow ID in which the instance groups are added.\n"]
}
[@@ocaml.doc "Output from an AddInstanceGroups call.\n"]

type nonrec add_instance_groups_input = {
  job_flow_id : xml_string_max_len256;
      [@ocaml.doc "Job flow in which to add the instance groups.\n"]
  instance_groups : instance_group_config_list; [@ocaml.doc "Instance groups to add.\n"]
}
[@@ocaml.doc "Input to an AddInstanceGroups call.\n"]

type nonrec add_instance_fleet_output = {
  cluster_arn : arn_type option; [@ocaml.doc "The Amazon Resource Name of the cluster.\n"]
  instance_fleet_id : instance_fleet_id option;
      [@ocaml.doc "The unique identifier of the instance fleet.\n"]
  cluster_id : xml_string_max_len256 option; [@ocaml.doc "The unique identifier of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec add_instance_fleet_input = {
  instance_fleet : instance_fleet_config;
      [@ocaml.doc "Specifies the configuration of the instance fleet.\n"]
  cluster_id : xml_string_max_len256; [@ocaml.doc "The unique identifier of the cluster.\n"]
}
[@@ocaml.doc ""]
