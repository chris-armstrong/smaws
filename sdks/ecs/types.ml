type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec vpc_lattice_configuration = {
  port_name : string_;
      [@ocaml.doc
        "The name of the port mapping to register in the VPC Lattice target group. This is the \
         name of the [portMapping] you defined in your task definition.\n"]
  target_group_arn : string_;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the target group or groups associated with the VPC \
         Lattice configuration that the Amazon ECS tasks will be registered to.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role to associate with this VPC Lattice configuration. This is the \
         Amazon ECS infrastructure IAM role that is used to manage your VPC Lattice infrastructure.\n"]
}
[@@ocaml.doc
  "The VPC Lattice configuration for your service that holds the information for the target \
   group(s) Amazon ECS tasks will be registered to.\n"]

type nonrec vpc_lattice_configurations = vpc_lattice_configuration list [@@ocaml.doc ""]

type nonrec host_volume_properties = {
  source_path : string_ option;
      [@ocaml.doc
        "When the [host] parameter is used, specify a [sourcePath] to declare the path on the host \
         container instance that's presented to the container. If this parameter is empty, then \
         the Docker daemon has assigned a host path for you. If the [host] parameter contains a \
         [sourcePath] file location, then the data volume persists at the specified location on \
         the host container instance until you delete it manually. If the [sourcePath] value \
         doesn't exist on the host container instance, the Docker daemon creates it. If the \
         location does exist, the contents of the source path folder are exported.\n\n\
        \ If you're using the Fargate launch type, the [sourcePath] parameter is not supported.\n\
        \ "]
}
[@@ocaml.doc "Details on a container instance bind mount host volume.\n"]

type nonrec scope = SHARED [@ocaml.doc ""] | TASK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec boxed_boolean = bool [@@ocaml.doc ""]

type nonrec string_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec docker_volume_configuration = {
  labels : string_map option;
      [@ocaml.doc
        "Custom metadata to add to your Docker volume. This parameter maps to [Labels] in the \
         docker container create command and the [xxlabel] option to docker volume create.\n"]
  driver_opts : string_map option;
      [@ocaml.doc
        "A map of Docker driver-specific options passed through. This parameter maps to \
         [DriverOpts] in the docker create-volume command and the [xxopt] option to docker volume \
         create.\n"]
  driver : string_ option;
      [@ocaml.doc
        "The Docker volume driver to use. The driver value must match the driver name provided by \
         Docker because it is used for task placement. If the driver was installed using the \
         Docker plugin CLI, use [docker plugin ls] to retrieve the driver name from your container \
         instance. If the driver was installed using another method, use Docker plugin discovery \
         to retrieve the driver name. This parameter maps to [Driver] in the docker container \
         create command and the [xxdriver] option to docker volume create.\n"]
  autoprovision : boxed_boolean option;
      [@ocaml.doc
        "If this value is [true], the Docker volume is created if it doesn't already exist.\n\n\
        \  This field is only used if the [scope] is [shared].\n\
        \  \n\
        \   "]
  scope : scope option;
      [@ocaml.doc
        "The scope for the Docker volume that determines its lifecycle. Docker volumes that are \
         scoped to a [task] are automatically provisioned when the task starts and destroyed when \
         the task stops. Docker volumes that are scoped as [shared] persist after the task stops.\n"]
}
[@@ocaml.doc
  "This parameter is specified when you're using Docker volumes. Docker volumes are only supported \
   when you're using the EC2 launch type. Windows containers only support the use of the [local] \
   driver. To use bind mounts, specify a [host] instead.\n"]

type nonrec efs_transit_encryption = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boxed_integer = int [@@ocaml.doc ""]

type nonrec efs_authorization_config_ia_m = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec efs_authorization_config = {
  iam : efs_authorization_config_ia_m option;
      [@ocaml.doc
        "Determines whether to use the Amazon ECS task role defined in a task definition when \
         mounting the Amazon EFS file system. If it is turned on, transit encryption must be \
         turned on in the [EFSVolumeConfiguration]. If this parameter is omitted, the default \
         value of [DISABLED] is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html#efs-volume-accesspoints}Using \
         Amazon EFS access points} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  access_point_id : string_ option;
      [@ocaml.doc
        "The Amazon EFS access point ID to use. If an access point is specified, the root \
         directory value specified in the [EFSVolumeConfiguration] must either be omitted or set \
         to [/] which will enforce the path set on the EFS access point. If an access point is \
         used, transit encryption must be on in the [EFSVolumeConfiguration]. For more \
         information, see \
         {{:https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html}Working with Amazon \
         EFS access points} in the {i Amazon Elastic File System User Guide}.\n"]
}
[@@ocaml.doc "The authorization configuration details for the Amazon EFS file system.\n"]

type nonrec efs_volume_configuration = {
  authorization_config : efs_authorization_config option;
      [@ocaml.doc "The authorization configuration details for the Amazon EFS file system.\n"]
  transit_encryption_port : boxed_integer option;
      [@ocaml.doc
        "The port to use when sending encrypted data between the Amazon ECS host and the Amazon \
         EFS server. If you do not specify a transit encryption port, it will use the port \
         selection strategy that the Amazon EFS mount helper uses. For more information, see \
         {{:https://docs.aws.amazon.com/efs/latest/ug/efs-mount-helper.html}EFS mount helper} in \
         the {i Amazon Elastic File System User Guide}.\n"]
  transit_encryption : efs_transit_encryption option;
      [@ocaml.doc
        "Determines whether to use encryption for Amazon EFS data in transit between the Amazon \
         ECS host and the Amazon EFS server. Transit encryption must be turned on if Amazon EFS \
         IAM authorization is used. If this parameter is omitted, the default value of [DISABLED] \
         is used. For more information, see \
         {{:https://docs.aws.amazon.com/efs/latest/ug/encryption-in-transit.html}Encrypting data \
         in transit} in the {i Amazon Elastic File System User Guide}.\n"]
  root_directory : string_ option;
      [@ocaml.doc
        "The directory within the Amazon EFS file system to mount as the root directory inside the \
         host. If this parameter is omitted, the root of the Amazon EFS volume will be used. \
         Specifying [/] will have the same effect as omitting this parameter.\n\n\
        \  If an EFS access point is specified in the [authorizationConfig], the root directory \
         parameter must either be omitted or set to [/] which will enforce the path set on the EFS \
         access point.\n\
        \  \n\
        \   "]
  file_system_id : string_; [@ocaml.doc "The Amazon EFS file system ID to use.\n"]
}
[@@ocaml.doc
  "This parameter is specified when you're using an Amazon Elastic File System file system for \
   task storage. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html}Amazon EFS \
   volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

type nonrec s3_files_volume_configuration = {
  access_point_arn : string_ option;
      [@ocaml.doc
        "The full ARN of the S3 Files access point to use. If an access point is specified, the \
         root directory value specified in the [S3FilesVolumeConfiguration] must either be omitted \
         or set to [/] which will enforce the path set on the S3 Files access point. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-files-access-points-creating.html}Creating \
         S3 Files access points}.\n"]
  transit_encryption_port : boxed_integer option;
      [@ocaml.doc
        "The port to use for sending encrypted data between the ECS host and the S3 Files file \
         system. If you do not specify a transit encryption port, it will use the port selection \
         strategy that the Amazon S3 Files mount helper uses. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-files-mounting.html}S3 Files \
         mount helper}.\n"]
  root_directory : string_ option;
      [@ocaml.doc
        "The directory within the Amazon S3 Files file system to mount as the root directory. If \
         this parameter is omitted, the root of the Amazon S3 Files file system will be used. \
         Specifying [/] will have the same effect as omitting this parameter.\n\n\
        \  If a S3 Files access point is specified in the [accessPointArn], the root directory \
         parameter must either be omitted or set to [/] which will enforce the path set on the S3 \
         Files access point.\n\
        \  \n\
        \   "]
  file_system_arn : string_; [@ocaml.doc "The full ARN of the S3 Files file system to mount.\n"]
}
[@@ocaml.doc
  "This parameter is specified when you're using an Amazon S3 Files file system for task storage. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/s3files-volumes.html}Amazon S3 \
   Files volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \  Your task definition must include a Task IAM Role. See \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-files-prereq-policies.html#s3-files-prereq-iam-compute-role} \
   IAM role for attaching your file system to Amazon Web Services compute resources} for required \
   permissions.\n\
  \  \n\
  \   "]

type nonrec f_sx_windows_file_server_authorization_config = {
  domain : string_;
      [@ocaml.doc
        "A fully qualified domain name hosted by an \
         {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html}Directory \
         Service} Managed Microsoft AD (Active Directory) or self-hosted AD on Amazon EC2.\n"]
  credentials_parameter : string_;
      [@ocaml.doc
        "The authorization credential option to use. The authorization credential options can be \
         provided using either the Amazon Resource Name (ARN) of an Secrets Manager secret or SSM \
         Parameter Store parameter. The ARN refers to the stored credentials.\n"]
}
[@@ocaml.doc
  "The authorization configuration details for Amazon FSx for Windows File Server file system. See \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FSxWindowsFileServerVolumeConfiguration.html}FSxWindowsFileServerVolumeConfiguration} \
   in the {i Amazon ECS API Reference}.\n\n\
  \ For more information and the input format, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/wfsx-volumes.html}Amazon FSx for \
   Windows File Server Volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

type nonrec f_sx_windows_file_server_volume_configuration = {
  authorization_config : f_sx_windows_file_server_authorization_config;
      [@ocaml.doc
        "The authorization configuration details for the Amazon FSx for Windows File Server file \
         system.\n"]
  root_directory : string_;
      [@ocaml.doc
        "The directory within the Amazon FSx for Windows File Server file system to mount as the \
         root directory inside the host.\n"]
  file_system_id : string_;
      [@ocaml.doc "The Amazon FSx for Windows File Server file system ID to use.\n"]
}
[@@ocaml.doc
  "This parameter is specified when you're using \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html}Amazon FSx for Windows File \
   Server} file system for task storage.\n\n\
  \ For more information and the input format, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/wfsx-volumes.html}Amazon FSx for \
   Windows File Server volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

type nonrec volume = {
  configured_at_launch : boxed_boolean option;
      [@ocaml.doc
        "Indicates whether the volume should be configured at launch time. This is used to create \
         Amazon EBS volumes for standalone tasks or tasks created as part of a service. Each task \
         definition revision may only have one volume configured at launch in the volume \
         configuration.\n\n\
        \ To configure a volume at launch time, use this task definition revision and specify a \
         [volumeConfigurations] object when calling the [CreateService], [UpdateService], \
         [RunTask] or [StartTask] APIs.\n\
        \ "]
  fsx_windows_file_server_volume_configuration :
    f_sx_windows_file_server_volume_configuration option;
      [@ocaml.doc
        "This parameter is specified when you use Amazon FSx for Windows File Server file system \
         for task storage.\n"]
  s3files_volume_configuration : s3_files_volume_configuration option;
      [@ocaml.doc
        "This parameter is specified when you use an Amazon S3 Files file system for task storage.\n"]
  efs_volume_configuration : efs_volume_configuration option;
      [@ocaml.doc
        "This parameter is specified when you use an Amazon Elastic File System file system for \
         task storage.\n"]
  docker_volume_configuration : docker_volume_configuration option;
      [@ocaml.doc
        "This parameter is specified when you use Docker volumes.\n\n\
        \ Windows containers only support the use of the [local] driver. To use bind mounts, \
         specify the [host] parameter instead.\n\
        \ \n\
        \   Docker volumes aren't supported by tasks run on Fargate.\n\
        \   \n\
        \    "]
  host : host_volume_properties option;
      [@ocaml.doc
        "This parameter is specified when you use bind mount host volumes. The contents of the \
         [host] parameter determine whether your bind mount host volume persists on the host \
         container instance and where it's stored. If the [host] parameter is empty, then the \
         Docker daemon assigns a host path for your data volume. However, the data isn't \
         guaranteed to persist after the containers that are associated with it stop running.\n\n\
        \ Windows containers can mount whole directories on the same drive as [$env:ProgramData]. \
         Windows containers can't mount directories on a different drive, and mount point can't be \
         across drives. For example, you can mount [C:\\my\\path:C:\\my\\path] and [D:\\:D:\\], \
         but not [D:\\my\\path:C:\\my\\path] or [D:\\:C:\\my\\path].\n\
        \ "]
  name : string_ option;
      [@ocaml.doc
        "The name of the volume. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed.\n\n\
        \ When using a volume configured at launch, the [name] is required and must also be \
         specified as the volume name in the [ServiceVolumeConfiguration] or \
         [TaskVolumeConfiguration] parameter when creating your service or standalone task.\n\
        \ \n\
        \  For all other types of volumes, this name is referenced in the [sourceVolume] parameter \
         of the [mountPoints] object in the container definition.\n\
        \  \n\
        \   When a volume is using the [efsVolumeConfiguration], the name is required.\n\
        \   \n\
        \    When a volume is using the [s3filesVolumeConfiguration], the name is required.\n\
        \    "]
}
[@@ocaml.doc
  "The data volume configuration for tasks launched using this task definition. Specifying a \
   volume configuration in a task definition is optional. The volume configuration may contain \
   multiple volumes but only one volume configured at launch is supported. Each volume defined in \
   the volume configuration may only specify a [name] and one of either [configuredAtLaunch], \
   [dockerVolumeConfiguration], [efsVolumeConfiguration], [s3filesVolumeConfiguration], \
   [fsxWindowsFileServerVolumeConfiguration], or [host]. If an empty volume configuration is \
   specified, by default Amazon ECS uses a host volume. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html}Using \
   data volumes in tasks}.\n"]

type nonrec volume_list = volume list [@@ocaml.doc ""]

type nonrec volume_from = {
  read_only : boxed_boolean option;
      [@ocaml.doc
        "If this value is [true], the container has read-only access to the volume. If this value \
         is [false], then the container can write to the volume. The default value is [false].\n"]
  source_container : string_ option;
      [@ocaml.doc
        "The name of another container within the same task definition to mount volumes from.\n"]
}
[@@ocaml.doc "Details on a data volume from another container in the same task definition.\n"]

type nonrec volume_from_list = volume_from list [@@ocaml.doc ""]

type nonrec version_info = {
  docker_version : string_ option;
      [@ocaml.doc "The Docker version that's running on the container instance.\n"]
  agent_hash : string_ option;
      [@ocaml.doc
        "The Git commit hash for the Amazon ECS container agent build on the \
         {{:https://github.com/aws/amazon-ecs-agent}amazon-ecs-agent } GitHub repository.\n"]
  agent_version : string_ option;
      [@ocaml.doc "The version number of the Amazon ECS container agent.\n"]
}
[@@ocaml.doc
  "The Docker and Amazon ECS container agent version information about a container instance.\n"]

type nonrec version_consistency = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec v_cpu_count_range_request = {
  max : boxed_integer option;
      [@ocaml.doc
        "The maximum number of vCPUs. Instance types with more vCPUs than this value are excluded \
         from selection.\n"]
  min : boxed_integer;
      [@ocaml.doc
        "The minimum number of vCPUs. Instance types with fewer vCPUs than this value are excluded \
         from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum number of vCPUs for instance type selection. This allows you to specify \
   a range of vCPU counts that meet your workload requirements.\n"]

type nonrec express_gateway_service_status_code =
  | INACTIVE [@ocaml.doc ""]
  | DRAINING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec express_gateway_service_status = {
  status_reason : string_ option;
      [@ocaml.doc "Information about why the Express service is in the current status.\n"]
  status_code : express_gateway_service_status_code option;
      [@ocaml.doc "The status of the Express service.\n"]
}
[@@ocaml.doc
  "An object that defines the status of Express service creation and information about the status \
   of the service.\n"]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec express_gateway_service_network_configuration = {
  subnets : string_list option;
      [@ocaml.doc "The IDs of the subnets associated with the Express service.\n"]
  security_groups : string_list option;
      [@ocaml.doc "The IDs of the security groups associated with the Express service.\n"]
}
[@@ocaml.doc
  "The network configuration for an Express service. By default, an Express service utilizes \
   subnets and security groups associated with the default VPC.\n"]

type nonrec express_gateway_service_aws_logs_configuration = {
  log_stream_prefix : string_;
      [@ocaml.doc
        "The prefix for the CloudWatch Logs log stream names. The default for an Express service \
         is [ecs].\n"]
  log_group : string_;
      [@ocaml.doc "The name of the CloudWatch Logs log group to send container logs to.\n"]
}
[@@ocaml.doc
  "Specifies the Amazon CloudWatch Logs configuration for the Express service container.\n"]

type nonrec express_gateway_repository_credentials = {
  credentials_parameter : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the secret containing the private repository credentials.\n"]
}
[@@ocaml.doc
  "The repository credentials for private registry authentication to pass to the container.\n"]

type nonrec key_value_pair = {
  value : string_ option;
      [@ocaml.doc
        "The value of the key-value pair. For environment variables, this is the value of the \
         environment variable.\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the key-value pair. For environment variables, this is the name of the \
         environment variable.\n"]
}
[@@ocaml.doc "A key-value pair object.\n"]

type nonrec environment_variables = key_value_pair list [@@ocaml.doc ""]

type nonrec secret = {
  value_from : string_;
      [@ocaml.doc
        "The secret to expose to the container. The supported values are either the full ARN of \
         the Secrets Manager secret or the full ARN of the parameter in the SSM Parameter Store.\n\n\
        \ For information about the require Identity and Access Management permissions, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-secrets.html#secrets-iam}Required \
         IAM permissions for Amazon ECS secrets} (for Secrets Manager) or \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-parameters.html}Required \
         IAM permissions for Amazon ECS secrets} (for Systems Manager Parameter store) in the {i \
         Amazon Elastic Container Service Developer Guide}.\n\
        \ \n\
        \   If the SSM Parameter Store parameter exists in the same Region as the task you're \
         launching, then you can use either the full ARN or name of the parameter. If the \
         parameter exists in a different Region, then the full ARN must be specified.\n\
        \   \n\
        \    "]
  name : string_; [@ocaml.doc "The name of the secret.\n"]
}
[@@ocaml.doc
  "An object representing the secret to expose to your container. Secrets can be exposed to a \
   container in the following ways:\n\n\
  \ {ul\n\
  \       {-  To inject sensitive data into your containers as environment variables, use the \
   [secrets] container definition parameter.\n\
  \           \n\
  \            }\n\
  \       {-  To reference sensitive information in the log configuration of a container, use the \
   [secretOptions] container definition parameter.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html}Specifying \
   sensitive data} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   "]

type nonrec secret_list = secret list [@@ocaml.doc ""]

type nonrec express_gateway_container = {
  secrets : secret_list option; [@ocaml.doc "The secrets to pass to the container.\n"]
  environment : environment_variables option;
      [@ocaml.doc "The environment variables to pass to the container.\n"]
  command : string_list option; [@ocaml.doc "The command that is passed to the container.\n"]
  repository_credentials : express_gateway_repository_credentials option;
      [@ocaml.doc
        "The configuration for repository credentials for private registry authentication.\n"]
  aws_logs_configuration : express_gateway_service_aws_logs_configuration option;
      [@ocaml.doc "The log configuration for the container.\n"]
  container_port : boxed_integer option;
      [@ocaml.doc
        "The port number on the container that receives traffic from the load balancer. Default is \
         80.\n"]
  image : string_;
      [@ocaml.doc
        "The image used to start a container. This string is passed directly to the Docker daemon. \
         Images in the Docker Hub registry are available by default. Other repositories are \
         specified with either [repository-url/image:tag] or [repository-url/image@digest].\n\n\
        \ For Express services, the image typically contains a web application that listens on the \
         specified container port. The image can be stored in Amazon ECR, Docker Hub, or any other \
         container registry accessible to your execution role.\n\
        \ "]
}
[@@ocaml.doc
  "Defines the configuration for the primary container in an Express service. This container \
   receives traffic from the Application Load Balancer and runs your application code.\n\n\
  \ The container configuration includes the container image, port mapping, logging settings, \
   environment variables, and secrets. The container image is the only required parameter, with \
   sensible defaults provided for other settings.\n\
  \ "]

type nonrec express_gateway_service_scaling_metric =
  | RequestCountPerTarget [@ocaml.doc ""]
  | AverageMemoryUtilization [@ocaml.doc ""]
  | AverageCPUUtilization [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec express_gateway_scaling_target = {
  auto_scaling_target_value : boxed_integer option;
      [@ocaml.doc
        "The target value for the auto-scaling metric. The default value for an Express service is \
         60.\n"]
  auto_scaling_metric : express_gateway_service_scaling_metric option;
      [@ocaml.doc
        "The metric used for auto-scaling decisions. The default metric used for an Express \
         service is [CPUUtilization].\n"]
  max_task_count : boxed_integer option;
      [@ocaml.doc "The maximum number of tasks to run in the Express service.\n"]
  min_task_count : boxed_integer option;
      [@ocaml.doc "The minimum number of tasks to run in the Express service.\n"]
}
[@@ocaml.doc
  "Defines the auto-scaling configuration for an Express service. This determines how the service \
   automatically adjusts the number of running tasks based on demand metrics such as CPU \
   utilization, memory utilization, or request count per target.\n\n\
  \ Auto-scaling helps ensure your application can handle varying levels of traffic while \
   optimizing costs by scaling down during low-demand periods. You can specify the minimum and \
   maximum number of tasks, the scaling metric, and the target value for that metric.\n\
  \ "]

type nonrec access_type = PRIVATE [@ocaml.doc ""] | PUBLIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ingress_path_summary = {
  endpoint : string_; [@ocaml.doc "The endpoint for access to the service.\n"]
  access_type : access_type;
      [@ocaml.doc "The type of access to the endpoint for the Express service.\n"]
}
[@@ocaml.doc "The entry point into an Express service.\n"]

type nonrec ingress_path_summaries = ingress_path_summary list [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec express_gateway_service_configuration = {
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for when this service revision was created.\n"]
  ingress_paths : ingress_path_summaries option;
      [@ocaml.doc "The entry point into this service revision.\n"]
  scaling_target : express_gateway_scaling_target option;
      [@ocaml.doc "The auto-scaling configuration for this service revision.\n"]
  primary_container : express_gateway_container option;
      [@ocaml.doc "The primary container configuration for this service revision.\n"]
  health_check_path : string_ option;
      [@ocaml.doc "The health check path for this service revision.\n"]
  network_configuration : express_gateway_service_network_configuration option;
      [@ocaml.doc "The network configuration for tasks in this service revision.\n"]
  memory : string_ option;
      [@ocaml.doc "The memory allocation for tasks in this service revision.\n"]
  cpu : string_ option; [@ocaml.doc "The CPU allocation for tasks in this service revision.\n"]
  task_definition_arn : string_ option;
      [@ocaml.doc
        "The ARN of the task definition used by this service revision. This is present for all \
         Express services and reflects the task definition in use, whether managed by Amazon ECS \
         or provided by the customer.\n"]
  task_role_arn : string_ option;
      [@ocaml.doc "The ARN of the task role for the service revision.\n"]
  execution_role_arn : string_ option;
      [@ocaml.doc "The ARN of the task execution role for the service revision.\n"]
  service_revision_arn : string_ option; [@ocaml.doc "The ARN of the service revision.\n"]
}
[@@ocaml.doc
  "Represents a specific configuration revision of an Express service, containing all the settings \
   and parameters for that revision.\n"]

type nonrec updated_express_gateway_service = {
  updated_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for when the Express service that is being updated was most recently \
         updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for when the Express service that is being updated was created.\n"]
  target_configuration : express_gateway_service_configuration option;
      [@ocaml.doc "The configuration to which the current Express service is being updated to.\n"]
  status : express_gateway_service_status option;
      [@ocaml.doc "The status of the Express service that is being updated.\n"]
  service_name : string_ option;
      [@ocaml.doc "The name of the Express service that is being updated.\n"]
  cluster : string_ option;
      [@ocaml.doc "The cluster associated with the Express service that is being updated.\n"]
  service_arn : string_ option;
      [@ocaml.doc "The ARN of the Express service that is being updated.\n"]
}
[@@ocaml.doc "An object that describes an Express service to be updated.\n"]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec launch_type =
  | MANAGED_INSTANCES [@ocaml.doc ""]
  | EXTERNAL [@ocaml.doc ""]
  | FARGATE [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_provider_strategy_item_weight = int [@@ocaml.doc ""]

type nonrec capacity_provider_strategy_item_base = int [@@ocaml.doc ""]

type nonrec capacity_provider_strategy_item = {
  base : capacity_provider_strategy_item_base option;
      [@ocaml.doc
        "The {i base} value designates how many tasks, at a minimum, to run on the specified \
         capacity provider for each service. Only one capacity provider in a capacity provider \
         strategy can have a {i base} defined. If no value is specified, the default value of [0] \
         is used.\n\n\
        \ Base value characteristics:\n\
        \ \n\
        \  {ul\n\
        \        {-  Only one capacity provider in a strategy can have a base defined\n\
        \            \n\
        \             }\n\
        \        {-  The default value is [0] if not specified\n\
        \            \n\
        \             }\n\
        \        {-  The valid range is 0 to 100,000\n\
        \            \n\
        \             }\n\
        \        {-  Base requirements are satisfied first before weight distribution\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  weight : capacity_provider_strategy_item_weight option;
      [@ocaml.doc
        "The {i weight} value designates the relative percentage of the total number of tasks \
         launched that should use the specified capacity provider. The [weight] value is taken \
         into consideration after the [base] value, if defined, is satisfied.\n\n\
        \ If no [weight] value is specified, the default value of [0] is used. When multiple \
         capacity providers are specified within a capacity provider strategy, at least one of the \
         capacity providers must have a weight value greater than zero and any capacity providers \
         with a weight of [0] can't be used to place tasks. If you specify multiple capacity \
         providers in a strategy that all have a weight of [0], any [RunTask] or [CreateService] \
         actions using the capacity provider strategy will fail.\n\
        \ \n\
        \  Weight value characteristics:\n\
        \  \n\
        \   {ul\n\
        \         {-  Weight is considered after the base value is satisfied\n\
        \             \n\
        \              }\n\
        \         {-  The default value is [0] if not specified\n\
        \             \n\
        \              }\n\
        \         {-  The valid range is 0 to 1,000\n\
        \             \n\
        \              }\n\
        \         {-  At least one capacity provider must have a weight greater than zero\n\
        \             \n\
        \              }\n\
        \         {-  Capacity providers with weight of [0] cannot place tasks\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Task distribution logic:\n\
        \   \n\
        \    {ol\n\
        \          {-  Base satisfaction: The minimum number of tasks specified by the base value \
         are placed on that capacity provider\n\
        \              \n\
        \               }\n\
        \          {-  Weight distribution: After base requirements are met, additional tasks are \
         distributed according to weight ratios\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   Examples:\n\
        \   \n\
        \    Equal Distribution: Two capacity providers both with weight [1] will split tasks \
         evenly after base requirements are met.\n\
        \    \n\
        \     Weighted Distribution: If capacityProviderA has weight [1] and capacityProviderB has \
         weight [4], then for every 1 task on A, 4 tasks will run on B.\n\
        \     "]
  capacity_provider : string_; [@ocaml.doc "The short name of the capacity provider.\n"]
}
[@@ocaml.doc
  "The details of a capacity provider strategy. A capacity provider strategy can be set when using \
   the {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html}RunTask}or \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCluster.html}CreateCluster} \
   APIs or as the default capacity provider strategy for a cluster with the [CreateCluster] API.\n\n\
  \ Only capacity providers that are already associated with a cluster and have an [ACTIVE] or \
   [UPDATING] status can be used in a capacity provider strategy. The \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
   API is used to associate a capacity provider with a cluster.\n\
  \ \n\
  \  If specifying a capacity provider that uses an Auto Scaling group, the capacity provider must \
   already be created. New Auto Scaling group capacity providers can be created with the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateClusterCapacityProvider.html}CreateClusterCapacityProvider} \
   API operation.\n\
  \  \n\
  \   To use a Fargate capacity provider, specify either the [FARGATE] or [FARGATE_SPOT] capacity \
   providers. The Fargate capacity providers are available to all accounts and only need to be \
   associated with a cluster to be used in a capacity provider strategy.\n\
  \   \n\
  \    With [FARGATE_SPOT], you can run interruption tolerant tasks at a rate that's discounted \
   compared to the [FARGATE] price. [FARGATE_SPOT] runs tasks on spare compute capacity. When \
   Amazon Web Services needs the capacity back, your tasks are interrupted with a two-minute \
   warning. [FARGATE_SPOT] supports Linux tasks with the X86_64 architecture on platform version \
   1.3.0 or later. [FARGATE_SPOT] supports Linux tasks with the ARM64 architecture on platform \
   version 1.4.0 or later.\n\
  \    \n\
  \     A capacity provider strategy can contain a maximum of 20 capacity providers.\n\
  \     "]

type nonrec capacity_provider_strategy = capacity_provider_strategy_item list [@@ocaml.doc ""]

type nonrec assign_public_ip = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec aws_vpc_configuration = {
  assign_public_ip : assign_public_ip option;
      [@ocaml.doc
        "Whether the task's elastic network interface receives a public IP address. \n\n\
        \ Consider the following when you set this value:\n\
        \ \n\
        \  {ul\n\
        \        {-  When you use [create-service] or [update-service], the default is [DISABLED]. \n\
        \            \n\
        \             }\n\
        \        {-  When the service [deploymentController] is [ECS], the value must be \
         [DISABLED]. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  security_groups : string_list option;
      [@ocaml.doc
        "The IDs of the security groups associated with the task or service. If you don't specify \
         a security group, the default security group for the VPC is used. There's a limit of 5 \
         security groups that can be specified.\n\n\
        \  All specified security groups must be from the same VPC.\n\
        \  \n\
        \   "]
  subnets : string_list;
      [@ocaml.doc
        "The IDs of the subnets associated with the task or service. There's a limit of 16 subnets \
         that can be specified.\n\n\
        \  All specified subnets must be from the same VPC.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "An object representing the networking details for a task or service. For example \
   [awsVpcConfiguration={subnets=\\[\"subnet-12344321\"\\],securityGroups=\\[\"sg-12344321\"\\]}].\n"]

type nonrec network_configuration = {
  awsvpc_configuration : aws_vpc_configuration option;
      [@ocaml.doc
        "The VPC subnets and security groups that are associated with a task.\n\n\
        \  All specified subnets and security groups must be from the same VPC.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The network configuration for a task or service.\n"]

type nonrec advanced_configuration = {
  role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon ECS permission to call \
         the Elastic Load Balancing APIs for you.\n"]
  test_listener_rule : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies ) that identifies the test listener rule \
         (in the case of an Application Load Balancer) or listener (in the case for an Network \
         Load Balancer) for routing test traffic.\n"]
  production_listener_rule : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that that identifies the production listener rule (in the \
         case of an Application Load Balancer) or listener (in the case for an Network Load \
         Balancer) for routing production traffic.\n"]
  alternate_target_group_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the alternate target group for Amazon ECS blue/green \
         deployments.\n"]
}
[@@ocaml.doc
  "The advanced settings for a load balancer used in blue/green deployments. Specify the alternate \
   target group, listener rules, and IAM role required for traffic shifting during blue/green \
   deployments. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/blue-green-deployment-implementation.html}Required \
   resources for Amazon ECS blue/green deployments} in the {i Amazon Elastic Container Service \
   Developer Guide}.\n"]

type nonrec load_balancer = {
  advanced_configuration : advanced_configuration option;
      [@ocaml.doc
        "The advanced settings for the load balancer used in blue/green deployments. Specify the \
         alternate target group, listener rules, and IAM role required for traffic shifting during \
         blue/green deployments.\n"]
  container_port : boxed_integer option;
      [@ocaml.doc
        "The port on the container to associate with the load balancer. This port must correspond \
         to a [containerPort] in the task definition the tasks in the service are using. For tasks \
         that use the EC2 launch type, the container instance they're launched on must allow \
         ingress traffic on the [hostPort] of the port mapping.\n"]
  container_name : string_ option;
      [@ocaml.doc
        "The name of the container (as it appears in a container definition) to associate with the \
         load balancer.\n\n\
        \ You need to specify the container name when configuring the target group for an Amazon \
         ECS load balancer.\n\
        \ "]
  load_balancer_name : string_ option;
      [@ocaml.doc
        "The name of the load balancer to associate with the Amazon ECS service or task set.\n\n\
        \ If you are using an Application Load Balancer or a Network Load Balancer the load \
         balancer name parameter should be omitted.\n\
        \ "]
  target_group_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the Elastic Load Balancing target group or groups \
         associated with a service or task set.\n\n\
        \ A target group ARN is only specified when using an Application Load Balancer or Network \
         Load Balancer. \n\
        \ \n\
        \  For services using the [ECS] deployment controller, you can specify one or multiple \
         target groups. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html}Registering \
         multiple target groups with a service} in the {i Amazon Elastic Container Service \
         Developer Guide}.\n\
        \  \n\
        \   For services using the [CODE_DEPLOY] deployment controller, you're required to define \
         two target groups for the load balancer. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-bluegreen.html}Blue/green \
         deployment with CodeDeploy} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \   \n\
        \     If your service's task definition uses the [awsvpc] network mode, you must choose \
         [ip] as the target type, not [instance]. Do this when creating your target groups because \
         tasks that use the [awsvpc] network mode are associated with an elastic network \
         interface, not an Amazon EC2 instance. This network mode is required for the Fargate \
         launch type.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc
  "The load balancer configuration to use with a service or task set.\n\n\
  \ When you add, update, or remove a load balancer configuration, Amazon ECS starts a new \
   deployment with the updated Elastic Load Balancing configuration. This causes tasks to register \
   to and deregister from load balancers.\n\
  \ \n\
  \  We recommend that you verify this on a test environment before you update the Elastic Load \
   Balancing configuration. \n\
  \  \n\
  \   A service-linked role is required for services that use multiple target groups. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html}Using \
   service-linked roles} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   "]

type nonrec load_balancers = load_balancer list [@@ocaml.doc ""]

type nonrec service_registry = {
  container_port : boxed_integer option;
      [@ocaml.doc
        "The port value to be used for your service discovery service. It's already specified in \
         the task definition. If the task definition your service task specifies uses the [bridge] \
         or [host] network mode, you must specify a [containerName] and [containerPort] \
         combination from the task definition. If the task definition your service task specifies \
         uses the [awsvpc] network mode and a type SRV DNS record is used, you must specify either \
         a [containerName] and [containerPort] combination or a [port] value. However, you can't \
         specify both.\n"]
  container_name : string_ option;
      [@ocaml.doc
        "The container name value to be used for your service discovery service. It's already \
         specified in the task definition. If the task definition that your service task specifies \
         uses the [bridge] or [host] network mode, you must specify a [containerName] and \
         [containerPort] combination from the task definition. If the task definition that your \
         service task specifies uses the [awsvpc] network mode and a type SRV DNS record is used, \
         you must specify either a [containerName] and [containerPort] combination or a [port] \
         value. However, you can't specify both.\n"]
  port : boxed_integer option;
      [@ocaml.doc
        "The port value used if your service discovery service specified an SRV record. This field \
         might be used if both the [awsvpc] network mode and SRV records are used.\n"]
  registry_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the service registry. The currently supported service \
         registry is Cloud Map. For more information, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html}CreateService}.\n"]
}
[@@ocaml.doc
  "The details for the service registry.\n\n\
  \ Each service may be associated with one service registry. Multiple service registries for each \
   service are not supported.\n\
  \ \n\
  \  When you add, update, or remove the service registries configuration, Amazon ECS starts a new \
   deployment. New tasks are registered and deregistered to the updated service registry \
   configuration.\n\
  \  "]

type nonrec service_registries = service_registry list [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec scale_unit = PERCENT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scale = {
  unit_ : scale_unit option; [@ocaml.doc "The unit of measure for the scale value.\n"]
  value : double option;
      [@ocaml.doc
        "The value, specified as a percent total of a service's [desiredCount], to scale the task \
         set. Accepted values are numbers between 0 and 100.\n"]
}
[@@ocaml.doc
  "A floating-point percentage of the desired number of tasks to place and keep running in the \
   task set.\n"]

type nonrec stability_status = STABILIZING [@ocaml.doc ""] | STEADY_STATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option;
      [@ocaml.doc
        "The optional part of a key-value pair that make up a tag. A [value] acts as a descriptor \
         within a tag category (key).\n"]
  key : tag_key option;
      [@ocaml.doc
        "One part of a key-value pair that make up a tag. A [key] is a general label that acts \
         like a category for more specific tag values.\n"]
}
[@@ocaml.doc
  "The metadata that you apply to a resource to help you categorize and organize them. Each tag \
   consists of a key and an optional value. You define them.\n\n\
  \ The following basic restrictions apply to tags:\n\
  \ \n\
  \  {ul\n\
  \        {-  Maximum number of tags per resource - 50\n\
  \            \n\
  \             }\n\
  \        {-  For each resource, each tag key must be unique, and each tag key can have only one \
   value.\n\
  \            \n\
  \             }\n\
  \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
  \            \n\
  \             }\n\
  \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
  \            \n\
  \             }\n\
  \        {-  If your tagging schema is used across multiple services and resources, remember \
   that other services may have restrictions on allowed characters. Generally allowed characters \
   are: letters, numbers, and spaces representable in UTF-8, and the following characters: + - = . \
   _ : / \\@.\n\
  \            \n\
  \             }\n\
  \        {-  Tag keys and values are case-sensitive.\n\
  \            \n\
  \             }\n\
  \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
   prefix for either keys or values as it is reserved for Amazon Web Services use. You cannot edit \
   or delete tag keys or values with this prefix. Tags with this prefix do not count against your \
   tags per resource limit.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec deployment_ephemeral_storage = {
  kms_key_id : string_ option;
      [@ocaml.doc
        "Specify an Key Management Service key ID to encrypt the ephemeral storage for deployment.\n"]
}
[@@ocaml.doc "The amount of ephemeral storage to allocate for the deployment.\n"]

type nonrec task_set = {
  fargate_ephemeral_storage : deployment_ephemeral_storage option;
      [@ocaml.doc "The Fargate ephemeral storage settings for the task set.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the task set to help you categorize and organize them. \
         Each tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  stability_status_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task set stability status was retrieved.\n"]
  stability_status : stability_status option;
      [@ocaml.doc
        "The stability status. This indicates whether the task set has reached a steady state. If \
         the following conditions are met, the task set are in [STEADY_STATE]:\n\n\
        \ {ul\n\
        \       {-  The task [runningCount] is equal to the [computedDesiredCount].\n\
        \           \n\
        \            }\n\
        \       {-  The [pendingCount] is [0].\n\
        \           \n\
        \            }\n\
        \       {-  There are no tasks that are running on container instances in the [DRAINING] \
         status.\n\
        \           \n\
        \            }\n\
        \       {-  All tasks are reporting a healthy status from the load balancers, service \
         discovery, and container health checks.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If any of those conditions aren't met, the stability status returns [STABILIZING].\n\
        \   "]
  scale : scale option;
      [@ocaml.doc
        "A floating-point percentage of your desired number of tasks to place and keep running in \
         the task set.\n"]
  service_registries : service_registries option;
      [@ocaml.doc
        "The details for the service discovery registries to assign to this task set. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html}Service \
         discovery}.\n"]
  load_balancers : load_balancers option;
      [@ocaml.doc "Details on a load balancer that are used with a task set.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc "The network configuration for the task set.\n"]
  platform_family : string_ option;
      [@ocaml.doc
        "The operating system that your tasks in the set are running on. A platform family is \
         specified only for tasks that use the Fargate launch type. \n\n\
        \  All tasks in the set must have the same value.\n\
        \ "]
  platform_version : string_ option;
      [@ocaml.doc
        "The Fargate platform version where the tasks in the task set are running. A platform \
         version is only specified for tasks run on Fargate. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         platform versions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc "The capacity provider strategy that are associated with the task set.\n"]
  launch_type : launch_type option;
      [@ocaml.doc
        "The launch type the tasks in the task set are using. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the task set was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the task set was created.\n"]
  running_count : integer option;
      [@ocaml.doc
        "The number of tasks in the task set that are in the [RUNNING] status during a deployment. \
         A task in the [RUNNING] state is running and ready for use.\n"]
  pending_count : integer option;
      [@ocaml.doc
        "The number of tasks in the task set that are in the [PENDING] status during a deployment. \
         A task in the [PENDING] state is preparing to enter the [RUNNING] state. A task set \
         enters the [PENDING] status when it launches for the first time or when it's restarted \
         after being in the [STOPPED] state.\n"]
  computed_desired_count : integer option;
      [@ocaml.doc
        "The computed desired count for the task set. This is calculated by multiplying the \
         service's [desiredCount] by the task set's [scale] percentage. The result is always \
         rounded up. For example, if the computed desired count is 1.2, it rounds up to 2 tasks.\n"]
  task_definition : string_ option; [@ocaml.doc "The task definition that the task set is using.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the task set. The following describes each state.\n\n\
        \  PRIMARY  The task set is serving production traffic.\n\
        \           \n\
        \             ACTIVE  The task set isn't serving production traffic.\n\
        \                     \n\
        \                       DRAINING  The tasks in the task set are being stopped, and their \
         corresponding targets are being deregistered from their target group.\n\
        \                                 \n\
        \                                   "]
  external_id : string_ option;
      [@ocaml.doc
        "The external ID associated with the task set.\n\n\
        \ If an CodeDeploy deployment created a task set, the [externalId] parameter contains the \
         CodeDeploy deployment ID.\n\
        \ \n\
        \  If a task set is created for an external deployment and is associated with a service \
         discovery registry, the [externalId] parameter contains the [ECS_TASK_SET_EXTERNAL_ID] \
         Cloud Map attribute.\n\
        \  "]
  started_by : string_ option;
      [@ocaml.doc
        "The tag specified when a task set is started. If an CodeDeploy deployment created the \
         task set, the [startedBy] parameter is [CODE_DEPLOY]. If an external deployment created \
         the task set, the [startedBy] field isn't used.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the cluster that the service that hosts the task set \
         exists in.\n"]
  service_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the service the task set exists in.\n"]
  task_set_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the task set.\n"]
  id : string_ option; [@ocaml.doc "The ID of the task set.\n"]
}
[@@ocaml.doc
  "Information about a set of Amazon ECS tasks in either an CodeDeploy or an [EXTERNAL] \
   deployment. An Amazon ECS task set includes details such as the desired number of tasks, how \
   many tasks are running, and whether the task set serves production traffic.\n"]

type nonrec update_task_set_response = {
  task_set : task_set option; [@ocaml.doc "Details about the task set.\n"]
}
[@@ocaml.doc ""]

type nonrec update_task_set_request = {
  scale : scale;
      [@ocaml.doc
        "A floating-point percentage of the desired number of tasks to place and keep running in \
         the task set.\n"]
  task_set : string_;
      [@ocaml.doc "The short name or full Amazon Resource Name (ARN) of the task set to update.\n"]
  service : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the service that the task set is \
         found in.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         that the task set is found in.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_feature_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "The specified task isn't supported in this Region.\n"]

type nonrec task_set_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified task set wasn't found. You can view your available task sets with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTaskSets.html}DescribeTaskSets}. \
   Task sets are specific to each cluster, service and Region.\n"]

type nonrec service_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified service wasn't found. You can view your available services with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListServices.html}ListServices}. \
   Amazon ECS services are cluster specific and Region specific.\n"]

type nonrec service_not_active_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified service isn't active. You can't update a service that's inactive. If you have \
   previously deleted a service, you can re-create it with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html}CreateService}.\n"]

type nonrec server_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "These errors are usually caused by a server issue.\n"]

type nonrec limit_exceeded_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "The limit for the resource was exceeded.\n"]

type nonrec invalid_parameter_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified parameter isn't valid. Review the available parameters for the API request.\n\n\
  \ For more information about service event errors, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-event-messages-list.html}Amazon \
   ECS service event messages}. \n\
  \ "]

type nonrec cluster_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified cluster wasn't found. You can view your available clusters with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListClusters.html}ListClusters}. \
   Amazon ECS clusters are Region specific.\n"]

type nonrec client_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "These errors are usually caused by a client action. This client action might be using an action \
   or resource on behalf of a user that doesn't have permissions to use the action or resource. \
   Or, it might be specifying an identifier that isn't valid.\n"]

type nonrec access_denied_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "You don't have authorization to perform the requested action.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec protected_task = {
  expiration_date : timestamp option;
      [@ocaml.doc "The epoch time when protection for the task will expire.\n"]
  protection_enabled : boolean_ option;
      [@ocaml.doc
        "The protection status of the task. If scale-in protection is on for a task, the value is \
         [true]. Otherwise, it is [false].\n"]
  task_arn : string_ option; [@ocaml.doc "The task ARN.\n"]
}
[@@ocaml.doc
  "An object representing the protection status details for a task. You can set the protection \
   status with the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateTaskProtection.html}UpdateTaskProtection} \
   API and get the status of tasks with the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_GetTaskProtection.html}GetTaskProtection} \
   API.\n"]

type nonrec protected_tasks = protected_task list [@@ocaml.doc ""]

type nonrec failure = {
  detail : string_ option; [@ocaml.doc "The details of the failure.\n"]
  reason : string_ option; [@ocaml.doc "The reason for the failure.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the failed resource.\n"]
}
[@@ocaml.doc
  "A failed resource. For a list of common causes, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html}API \
   failure reasons} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

type nonrec failures = failure list [@@ocaml.doc ""]

type nonrec update_task_protection_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  protected_tasks : protected_tasks option;
      [@ocaml.doc
        "A list of tasks with the following information.\n\n\
        \ {ul\n\
        \       {-   [taskArn]: The task ARN.\n\
        \           \n\
        \            }\n\
        \       {-   [protectionEnabled]: The protection status of the task. If scale-in \
         protection is turned on for a task, the value is [true]. Otherwise, it is [false].\n\
        \           \n\
        \            }\n\
        \       {-   [expirationDate]: The epoch time when protection for the task will expire.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_task_protection_request = {
  expires_in_minutes : boxed_integer option;
      [@ocaml.doc
        "If you set [protectionEnabled] to [true], you can specify the duration for task \
         protection in minutes. You can specify a value from 1 minute to up to 2,880 minutes (48 \
         hours). During this time, your task will not be terminated by scale-in events from \
         Service Auto Scaling or deployments. After this time period lapses, [protectionEnabled] \
         will be reset to [false].\n\n\
        \ If you don\226\128\153t specify the time, then the task is automatically protected for \
         120 minutes (2 hours).\n\
        \ "]
  protection_enabled : boolean_;
      [@ocaml.doc
        "Specify [true] to mark a task for protection and [false] to unset protection, making it \
         eligible for termination.\n"]
  tasks : string_list; [@ocaml.doc "A list of up to 10 task IDs or full ARN entries.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         that the task sets exist in.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "The specified resource wasn't found.\n"]

type nonrec threshold_type =
  | UNBOUNDED_PERCENT
      [@ocaml.doc
        "Amazon ECS calculates the failure threshold by multiplying [value] by the latest service \
         desired count, without applying the [3]-to-[200] bounds. Use this when the desired count \
         is large enough that the calculated threshold should be allowed to exceed [200].\n"]
  | BOUNDED_PERCENT
      [@ocaml.doc
        "Amazon ECS calculates the failure threshold by multiplying [value] by the latest service \
         desired count, then clamps the result to a minimum of [3] and a maximum of [200]. This is \
         the default threshold type.\n"]
  | COUNT
      [@ocaml.doc
        "Amazon ECS uses the integer provided in [value] directly as the failure threshold.\n"]
[@@ocaml.doc
  "Determines how the deployment circuit breaker calculates the task failure threshold from the \
   threshold [value].\n"]

type nonrec threshold_configuration = {
  value : integer;
      [@ocaml.doc
        "The integer used to calculate the failure threshold. When [type] is [COUNT], this is the \
         failure threshold itself. When [type] is a percentage type, this is the percentage that \
         Amazon ECS multiplies by the latest service desired count to calculate the failure \
         threshold.\n"]
  type_ : threshold_type;
      [@ocaml.doc
        "Determines how [value] is used to calculate the failure threshold. For the percentage \
         types ([BOUNDED_PERCENT] and [UNBOUNDED_PERCENT]), [value] is multiplied by the latest \
         service desired count; for [COUNT], [value] is used directly. The default is \
         [BOUNDED_PERCENT].\n"]
}
[@@ocaml.doc
  "Defines the failure threshold that the deployment circuit breaker uses to monitor a deployment. \
   The [type] and [value] together determine the number of task failures that are tolerated before \
   the circuit breaker triggers.\n\n\
  \ By default, the threshold configuration uses a [type] of [BOUNDED_PERCENT] with a [value] of \
   [50].\n\
  \ "]

type nonrec deployment_circuit_breaker = {
  threshold_configuration : threshold_configuration option;
      [@ocaml.doc
        "The threshold configuration that controls when the deployment circuit breaker triggers.\n"]
  reset_on_healthy_task : boxed_boolean option;
      [@ocaml.doc
        "Determines whether the deployment circuit breaker resets its failure count when a task \
         reaches a healthy state. When set to [true], a healthy task resets the failure count to \
         [0]; when [false], it doesn't.\n"]
  rollback : boolean_;
      [@ocaml.doc
        "Determines whether to configure Amazon ECS to roll back the service if a service \
         deployment fails. If rollback is on, when a service deployment fails, the service is \
         rolled back to the last deployment that completed successfully.\n"]
  enable : boolean_;
      [@ocaml.doc
        "Determines whether to use the deployment circuit breaker logic for the service.\n"]
}
[@@ocaml.doc
  " The deployment circuit breaker can only be used for services using the rolling update ([ECS]) \
   deployment type.\n\
  \ \n\
  \   The {b deployment circuit breaker} determines whether a service deployment will fail if the \
   service can't reach a steady state. If it is turned on, a service deployment will transition to \
   a failed state and stop launching new tasks. You can also configure Amazon ECS to roll back \
   your service to the last completed deployment after a failure. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html}Rolling \
   update} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   \n\
  \    For more information about API failure reasons, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html}API \
   failure reasons} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \    "]

type nonrec deployment_alarms = {
  enable : boolean_;
      [@ocaml.doc
        "Determines whether to use the CloudWatch alarm option in the service deployment process.\n"]
  rollback : boolean_;
      [@ocaml.doc
        "Determines whether to configure Amazon ECS to roll back the service if a service \
         deployment fails. If rollback is used, when a service deployment fails, the service is \
         rolled back to the last deployment that completed successfully.\n"]
  alarm_names : string_list;
      [@ocaml.doc "One or more CloudWatch alarm names. Use a \",\" to separate the alarms.\n"]
}
[@@ocaml.doc
  "One of the methods which provide a way for you to quickly identify when a deployment has \
   failed, and then to optionally roll back the failure to the last working deployment.\n\n\
  \ When the alarms are generated, Amazon ECS sets the service deployment to failed. Set the \
   rollback parameter to have Amazon ECS to roll back your service to the last completed \
   deployment after a failure.\n\
  \ \n\
  \  You can only use the [DeploymentAlarms] method to detect failures when the \
   [DeploymentController] is set to [ECS].\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html}Rolling \
   update} in the {i  {i Amazon Elastic Container Service Developer Guide} }.\n\
  \   "]

type nonrec deployment_strategy =
  | CANARY [@ocaml.doc ""]
  | LINEAR [@ocaml.doc ""]
  | BLUE_GREEN [@ocaml.doc ""]
  | ROLLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_target_type =
  | PAUSE [@ocaml.doc ""]
  | AWS_LAMBDA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_stage =
  | POST_PRODUCTION_TRAFFIC_SHIFT [@ocaml.doc ""]
  | PRODUCTION_TRAFFIC_SHIFT [@ocaml.doc ""]
  | PRE_PRODUCTION_TRAFFIC_SHIFT [@ocaml.doc ""]
  | POST_TEST_TRAFFIC_SHIFT [@ocaml.doc ""]
  | TEST_TRAFFIC_SHIFT [@ocaml.doc ""]
  | POST_SCALE_UP [@ocaml.doc ""]
  | PRE_SCALE_UP [@ocaml.doc ""]
  | RECONCILE_SERVICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_stage_list = deployment_lifecycle_hook_stage list
[@@ocaml.doc ""]

type nonrec hook_details = Smaws_Lib.CoreTypes.Document.t [@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_duration = int [@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_action = CONTINUE [@ocaml.doc ""] | ROLLBACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_timeout_configuration = {
  action : deployment_lifecycle_hook_action option;
      [@ocaml.doc
        "The action Amazon ECS takes when the lifecycle hook times out. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [CONTINUE] - Proceeds the deployment to the next lifecycle stage.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK] - Rolls back the deployment to the previous service revision.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: [ROLLBACK] \n\
        \   "]
  timeout_in_minutes : deployment_lifecycle_hook_duration option;
      [@ocaml.doc
        "The number of minutes Amazon ECS waits for the lifecycle hook to complete before taking \
         the timeout action.\n\n\
        \ Default: 1440 (24 hours)\n\
        \ "]
}
[@@ocaml.doc
  "The timeout configuration for a deployment lifecycle hook. This determines how long Amazon ECS \
   waits for the hook to complete before taking the specified timeout action.\n"]

type nonrec deployment_lifecycle_hook = {
  timeout_configuration : deployment_lifecycle_hook_timeout_configuration option;
      [@ocaml.doc
        "The timeout configuration for the lifecycle hook. This specifies how long Amazon ECS \
         waits before taking the timeout action if the hook is not resolved.\n"]
  hook_details : hook_details option;
      [@ocaml.doc
        "Use this field to specify custom parameters that Amazon ECS passes to your Lambda \
         function on each invocation. This field is not used for [PAUSE] hooks.\n"]
  lifecycle_stages : deployment_lifecycle_hook_stage_list option;
      [@ocaml.doc
        "The lifecycle stages at which to run the hook. Choose from these valid values:\n\n\
        \ {ul\n\
        \       {-  RECONCILE_SERVICE\n\
        \           \n\
        \            The reconciliation stage that only happens when you start a new service \
         deployment with more than 1 service revision in an ACTIVE state.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  PRE_SCALE_UP\n\
        \           \n\
        \            The green service revision has not started. The blue service revision is \
         handling 100% of the production traffic. There is no test traffic.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  POST_SCALE_UP\n\
        \           \n\
        \            The green service revision has started. The blue service revision is handling \
         100% of the production traffic. There is no test traffic.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  TEST_TRAFFIC_SHIFT\n\
        \           \n\
        \            The blue and green service revisions are running. The blue service revision \
         handles 100% of the production traffic. The green service revision is migrating from 0% \
         to 100% of test traffic.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  POST_TEST_TRAFFIC_SHIFT\n\
        \           \n\
        \            The test traffic shift is complete. The green service revision handles 100% \
         of the test traffic.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  PRE_PRODUCTION_TRAFFIC_SHIFT\n\
        \           \n\
        \            Occurs before production traffic shift. For linear and canary deployments, \
         this stage is invoked before every traffic shift step.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  PRODUCTION_TRAFFIC_SHIFT\n\
        \           \n\
        \            Production traffic is shifting to the green service revision. The green \
         service revision is migrating from 0% to 100% of production traffic. For linear and \
         canary deployments, this stage is invoked at every traffic shift step.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       {-  POST_PRODUCTION_TRAFFIC_SHIFT\n\
        \           \n\
        \            The production traffic shift is complete.\n\
        \            \n\
        \             You can use a lifecycle hook for this stage.\n\
        \             \n\
        \              }\n\
        \       }\n\
        \     [PAUSE] hooks cannot be configured at [TEST_TRAFFIC_SHIFT] or \
         [PRODUCTION_TRAFFIC_SHIFT] stages. These stages are only valid for [AWS_LAMBDA] hooks.\n\
        \    \n\
        \      You must provide this parameter when configuring a deployment lifecycle hook.\n\
        \      "]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon ECS permission to call \
         Lambda functions on your behalf.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/blue-green-permissions.html}Permissions \
         required for Lambda functions in Amazon ECS blue/green deployments} in the {i  Amazon \
         Elastic Container Service Developer Guide}.\n\
        \ "]
  hook_target_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the hook target. For [AWS_LAMBDA] hooks, this is the \
         Lambda function ARN. This field is not applicable for [PAUSE] hooks.\n\n\
        \ You must provide this parameter when configuring an [AWS_LAMBDA] lifecycle hook.\n\
        \ "]
  target_type : deployment_lifecycle_hook_target_type option;
      [@ocaml.doc
        "The type of action the lifecycle hook performs. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [AWS_LAMBDA] - Invokes a Lambda function at the specified lifecycle stage. \
         This is the default value.\n\
        \           \n\
        \            }\n\
        \       {-   [PAUSE] - Pauses the deployment at the specified lifecycle stage until you \
         call [ContinueServiceDeployment] to continue or roll back.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This field is optional. If not specified, the default value is [AWS_LAMBDA].\n\
        \   "]
}
[@@ocaml.doc
  "A deployment lifecycle hook runs custom logic or pauses the deployment at specific stages of \
   the deployment process. You can use Lambda functions or pause hooks as hook targets.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-lifecycle-hooks.html}Lifecycle \
   hooks for Amazon ECS service deployments} in the {i  Amazon Elastic Container Service Developer \
   Guide}.\n\
  \ "]

type nonrec deployment_lifecycle_hook_list = deployment_lifecycle_hook list [@@ocaml.doc ""]

type nonrec linear_configuration = {
  step_bake_time_in_minutes : integer option;
      [@ocaml.doc
        "The amount of time in minutes to wait between each traffic shifting step during a linear \
         deployment. Valid values are 0 to 1440 minutes (24 hours). The default value is 6. This \
         bake time is not applied after reaching 100 percent traffic.\n"]
  step_percent : double option;
      [@ocaml.doc
        "The percentage of production traffic to shift in each step during a linear deployment. \
         Valid values are multiples of 0.1 from 3.0 to 100.0. The default value is 10.0.\n"]
}
[@@ocaml.doc
  "Configuration for linear deployment strategy that shifts production traffic in equal percentage \
   increments with configurable wait times between each step until 100% of traffic is shifted to \
   the new service revision. This is only valid when you run [CreateService] or [UpdateService] \
   with [deploymentController] set to [ECS] and a [deploymentConfiguration] with a strategy set to \
   [LINEAR]. \n"]

type nonrec canary_configuration = {
  canary_bake_time_in_minutes : integer option;
      [@ocaml.doc
        "The amount of time in minutes to wait during the canary phase before shifting the \
         remaining production traffic to the new service revision. Valid values are 0 to 1440 \
         minutes (24 hours). The default value is 10.\n"]
  canary_percent : double option;
      [@ocaml.doc
        "The percentage of production traffic to shift to the new service revision during the \
         canary phase. Valid values are multiples of 0.1 from 0.1 to 100.0. The default value is \
         5.0.\n"]
}
[@@ocaml.doc
  "Configuration for a canary deployment strategy that shifts a fixed percentage of traffic to the \
   new service revision, waits for a specified bake time, then shifts the remaining traffic. \n\n\
  \ This is only valid when you run [CreateService] or [UpdateService] with [deploymentController] \
   set to [ECS] and a [deploymentConfiguration] with a strategy set to [CANARY]. \n\
  \ "]

type nonrec deployment_configuration = {
  canary_configuration : canary_configuration option;
      [@ocaml.doc
        "Configuration for canary deployment strategy. Only valid when the deployment strategy is \
         [CANARY]. This configuration enables shifting a fixed percentage of traffic for testing, \
         followed by shifting the remaining traffic after a bake period.\n"]
  linear_configuration : linear_configuration option;
      [@ocaml.doc
        "Configuration for linear deployment strategy. Only valid when the deployment strategy is \
         [LINEAR]. This configuration enables progressive traffic shifting in equal percentage \
         increments with configurable bake times between each step.\n"]
  lifecycle_hooks : deployment_lifecycle_hook_list option;
      [@ocaml.doc
        "An array of deployment lifecycle hook objects to run custom logic or pause the deployment \
         at specific stages of the deployment lifecycle.\n"]
  bake_time_in_minutes : boxed_integer option;
      [@ocaml.doc
        "The time period when both blue and green service revisions are running simultaneously \
         after the production traffic has shifted.\n\n\
        \ You must provide this parameter when you use the [BLUE_GREEN] deployment strategy.\n\
        \ "]
  strategy : deployment_strategy option;
      [@ocaml.doc
        "The deployment strategy for the service. Choose from these valid values:\n\n\
        \ {ul\n\
        \       {-   [ROLLING] - When you create a service which uses the rolling update \
         ([ROLLING]) deployment strategy, the Amazon ECS service scheduler replaces the currently \
         running tasks with new tasks. The number of tasks that Amazon ECS adds or removes from \
         the service during a rolling update is controlled by the service deployment configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [BLUE_GREEN] - A blue/green deployment strategy ([BLUE_GREEN]) is a release \
         methodology that reduces downtime and risk by running two identical production \
         environments called blue and green. With Amazon ECS blue/green deployments, you can \
         validate new service revisions before directing production traffic to them. This approach \
         provides a safer way to deploy changes with the ability to quickly roll back if needed.\n\
        \           \n\
        \            }\n\
        \       {-   [LINEAR] - A {i linear} deployment strategy ([LINEAR]) gradually shifts \
         traffic from the current production environment to a new environment in equal percentages \
         over time. With Amazon ECS linear deployments, you can control the pace of traffic \
         shifting and validate new service revisions with increasing amounts of production traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [CANARY] - A {i canary} deployment strategy ([CANARY]) shifts a small \
         percentage of traffic to the new service revision first, then shifts the remaining \
         traffic all at once after a specified time period. This allows you to test the new \
         version with a subset of users before full deployment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  alarms : deployment_alarms option; [@ocaml.doc "Information about the CloudWatch alarms.\n"]
  minimum_healthy_percent : boxed_integer option;
      [@ocaml.doc
        "If a service is using the rolling update ([ECS]) deployment type, the \
         [minimumHealthyPercent] represents a lower limit on the number of your service's tasks \
         that must remain in the [RUNNING] state during a deployment, as a percentage of the \
         [desiredCount] (rounded up to the nearest integer). This parameter enables you to deploy \
         without using additional cluster capacity. For example, if your service has a \
         [desiredCount] of four tasks and a [minimumHealthyPercent] of 50%, the service scheduler \
         may stop two existing tasks to free up cluster capacity before starting two new tasks. \n\n\
        \  If any tasks are unhealthy and if [maximumPercent] doesn't allow the Amazon ECS \
         scheduler to start replacement tasks, the scheduler stops the unhealthy tasks one-by-one \
         \226\128\148 using the [minimumHealthyPercent] as a constraint \226\128\148 to clear up \
         capacity to launch replacement tasks. For more information about how the scheduler \
         replaces unhealthy tasks, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html}Amazon \
         ECS services}. \n\
        \ \n\
        \  For services that {i do not} use a load balancer, the following should be noted:\n\
        \  \n\
        \   {ul\n\
        \         {-  A service is considered healthy if all essential containers within the tasks \
         in the service pass their health checks.\n\
        \             \n\
        \              }\n\
        \         {-  If a task has no essential containers with a health check defined, the \
         service scheduler will wait for 40 seconds after a task reaches a [RUNNING] state before \
         the task is counted towards the minimum healthy percent total.\n\
        \             \n\
        \              }\n\
        \         {-  If a task has one or more essential containers with a health check defined, \
         the service scheduler will wait for the task to reach a healthy status before counting it \
         towards the minimum healthy percent total. A task is considered healthy when all \
         essential containers within the task have passed their health checks. The amount of time \
         the service scheduler can wait for is determined by the container health check settings. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For services that {i do} use a load balancer, the following should be noted:\n\
        \   \n\
        \    {ul\n\
        \          {-  If a task has no essential containers with a health check defined, the \
         service scheduler will wait for the load balancer target group health check to return a \
         healthy status before counting the task towards the minimum healthy percent total.\n\
        \              \n\
        \               }\n\
        \          {-  If a task has an essential container with a health check defined, the \
         service scheduler will wait for both the task to reach a healthy status and the load \
         balancer target group health check to return a healthy status before counting the task \
         towards the minimum healthy percent total.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The default value for a replica service for [minimumHealthyPercent] is 100%. The \
         default [minimumHealthyPercent] value for a service using the [DAEMON] service schedule \
         is 0% for the CLI, the Amazon Web Services SDKs, and the APIs and 50% for the Amazon Web \
         Services Management Console.\n\
        \   \n\
        \    The minimum number of healthy tasks during a deployment is the [desiredCount] \
         multiplied by the [minimumHealthyPercent]/100, rounded up to the nearest integer value.\n\
        \    \n\
        \     If a service is using either the blue/green ([CODE_DEPLOY]) or [EXTERNAL] deployment \
         types and is running tasks that use the EC2 launch type, the {b minimum healthy percent} \
         value is set to the default value. The {b minimum healthy percent} value is used to \
         define the lower limit on the number of the tasks in the service that remain in the \
         [RUNNING] state while the container instances are in the [DRAINING] state.\n\
        \     \n\
        \       You can't specify a custom [minimumHealthyPercent] value for a service that uses \
         either the blue/green ([CODE_DEPLOY]) or [EXTERNAL] deployment types and has tasks that \
         use the EC2 launch type.\n\
        \       \n\
        \         If a service is using either the blue/green ([CODE_DEPLOY]) or [EXTERNAL] \
         deployment types and is running tasks that use the Fargate launch type, the minimum \
         healthy percent value is not used, although it is returned when describing your service.\n\
        \         "]
  maximum_percent : boxed_integer option;
      [@ocaml.doc
        "If a service is using the rolling update ([ECS]) deployment type, the [maximumPercent] \
         parameter represents an upper limit on the number of your service's tasks that are \
         allowed in the [RUNNING] or [PENDING] state during a deployment, as a percentage of the \
         [desiredCount] (rounded down to the nearest integer). This parameter enables you to \
         define the deployment batch size. For example, if your service is using the [REPLICA] \
         service scheduler and has a [desiredCount] of four tasks and a [maximumPercent] value of \
         200%, the scheduler may start four new tasks before stopping the four older tasks \
         (provided that the cluster resources required to do this are available). The default \
         [maximumPercent] value for a service using the [REPLICA] service scheduler is 200%.\n\n\
        \ The Amazon ECS scheduler uses this parameter to replace unhealthy tasks by starting \
         replacement tasks first and then stopping the unhealthy tasks, as long as cluster \
         resources for starting replacement tasks are available. For more information about how \
         the scheduler replaces unhealthy tasks, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html}Amazon \
         ECS services}.\n\
        \ \n\
        \  If a service is using either the blue/green ([CODE_DEPLOY]) or [EXTERNAL] deployment \
         types, and tasks in the service use the EC2 launch type, the {b maximum percent} value is \
         set to the default value. The {b maximum percent} value is used to define the upper limit \
         on the number of the tasks in the service that remain in the [RUNNING] state while the \
         container instances are in the [DRAINING] state.\n\
        \  \n\
        \    You can't specify a custom [maximumPercent] value for a service that uses either the \
         blue/green ([CODE_DEPLOY]) or [EXTERNAL] deployment types and has tasks that use the EC2 \
         launch type.\n\
        \    \n\
        \      If the service uses either the blue/green ([CODE_DEPLOY]) or [EXTERNAL] deployment \
         types, and the tasks in the service use the Fargate launch type, the maximum percent \
         value is not used. The value is still returned when describing your service.\n\
        \      "]
  deployment_circuit_breaker : deployment_circuit_breaker option;
      [@ocaml.doc
        " The deployment circuit breaker can only be used for services using the rolling update \
         ([ECS]) deployment type.\n\
        \ \n\
        \   The {b deployment circuit breaker} determines whether a service deployment will fail \
         if the service can't reach a steady state. If you use the deployment circuit breaker, a \
         service deployment will transition to a failed state and stop launching new tasks. If you \
         use the rollback option, when a service deployment fails, the service is rolled back to \
         the last deployment that completed successfully. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html}Rolling \
         update} in the {i Amazon Elastic Container Service Developer Guide} \n\
        \   "]
}
[@@ocaml.doc
  "Optional deployment parameters that control how many tasks run during a deployment and the \
   ordering of stopping and starting tasks.\n"]

type nonrec task_sets = task_set list [@@ocaml.doc ""]

type nonrec deployment_rollout_state =
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec port_number = int [@@ocaml.doc ""]

type nonrec service_connect_test_traffic_header_match_rules = {
  exact : string_;
      [@ocaml.doc
        "The exact value that the HTTP header must match for the test traffic routing rule to \
         apply. This provides precise control over which requests are routed to the new service \
         revision during blue/green deployments.\n"]
}
[@@ocaml.doc
  "The header matching rules for test traffic routing in Amazon ECS blue/green deployments. These \
   rules determine how incoming requests are matched based on HTTP headers to route test traffic \
   to the new service revision.\n"]

type nonrec service_connect_test_traffic_header_rules = {
  value : service_connect_test_traffic_header_match_rules option;
      [@ocaml.doc
        "The header value matching configuration that determines how the HTTP header value is \
         evaluated for test traffic routing decisions.\n"]
  name : string_;
      [@ocaml.doc
        "The name of the HTTP header to examine for test traffic routing. Common examples include \
         custom headers like [X-Test-Version] or [X-Canary-Request] that can be used to identify \
         test traffic.\n"]
}
[@@ocaml.doc
  "The HTTP header rules used to identify and route test traffic during Amazon ECS blue/green \
   deployments. These rules specify which HTTP headers to examine and what values to match for \
   routing decisions.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-blue-green.html}Service \
   Connect for Amazon ECS blue/green deployments} in the {i  Amazon Elastic Container Service \
   Developer Guide}.\n\
  \ "]

type nonrec service_connect_test_traffic_rules = {
  header : service_connect_test_traffic_header_rules;
      [@ocaml.doc
        "The HTTP header-based routing rules that determine which requests should be routed to the \
         new service version during blue/green deployment testing. These rules provide \
         fine-grained control over test traffic routing based on request headers.\n"]
}
[@@ocaml.doc
  "The test traffic routing configuration for Amazon ECS blue/green deployments. This \
   configuration allows you to define rules for routing specific traffic to the new service \
   revision during the deployment process, allowing for safe testing before full production \
   traffic shift.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect-blue-green.html}Service \
   Connect for Amazon ECS blue/green deployments} in the {i  Amazon Elastic Container Service \
   Developer Guide}.\n\
  \ "]

type nonrec service_connect_client_alias = {
  test_traffic_rules : service_connect_test_traffic_rules option;
      [@ocaml.doc
        "The configuration for test traffic routing rules used during blue/green deployments with \
         Amazon ECS Service Connect. This allows you to route a portion of traffic to the new \
         service revision of your service for testing before shifting all production traffic.\n"]
  dns_name : string_ option;
      [@ocaml.doc
        "The [dnsName] is the name that you use in the applications of client tasks to connect to \
         this service. The name must be a valid DNS name but doesn't need to be fully-qualified. \
         The name can include up to 127 characters. The name can include lowercase letters, \
         numbers, underscores (_), hyphens (-), and periods (.). The name can't start with a \
         hyphen.\n\n\
        \ If this parameter isn't specified, the default value of [discoveryName.namespace] is \
         used. If the [discoveryName] isn't specified, the port mapping name from the task \
         definition is used in [portName.namespace].\n\
        \ \n\
        \  To avoid changing your applications in client Amazon ECS services, set this to the same \
         name that the client application uses by default. For example, a few common names are \
         [database], [db], or the lowercase name of a database, such as [mysql] or [redis]. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  "]
  port : port_number;
      [@ocaml.doc
        "The listening port number for the Service Connect proxy. This port is available inside of \
         all of the tasks within the same namespace.\n\n\
        \ To avoid changing your applications in client Amazon ECS services, set this to the same \
         port that the client application uses by default. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "Each alias (\"endpoint\") is a fully-qualified name and port number that other tasks \
   (\"clients\") can use to connect to this service.\n\n\
  \ Each name and port mapping must be unique within the namespace.\n\
  \ \n\
  \  Tasks that run in a namespace can use short names to connect to services in the namespace. \
   Tasks can connect to services across all of the clusters in the namespace. Tasks connect \
   through a managed proxy container that collects logs and metrics for increased visibility. Only \
   the tasks that Amazon ECS services create are supported with Service Connect. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
   Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \  "]

type nonrec service_connect_client_alias_list = service_connect_client_alias list [@@ocaml.doc ""]

type nonrec duration = int [@@ocaml.doc ""]

type nonrec timeout_configuration = {
  per_request_timeout_seconds : duration option;
      [@ocaml.doc
        "The amount of time waiting for the upstream to respond with a complete response per \
         request. A value of [0] can be set to disable [perRequestTimeout]. [perRequestTimeout] \
         can only be set if Service Connect [appProtocol] isn't [TCP]. Only [idleTimeout] is \
         allowed for [TCP] [appProtocol].\n"]
  idle_timeout_seconds : duration option;
      [@ocaml.doc
        "The amount of time in seconds a connection will stay active while idle. A value of [0] \
         can be set to disable [idleTimeout].\n\n\
        \ The [idleTimeout] default for [HTTP]/[HTTP2]/[GRPC] is 5 minutes.\n\
        \ \n\
        \  The [idleTimeout] default for [TCP] is 1 hour.\n\
        \  "]
}
[@@ocaml.doc
  "An object that represents the timeout configurations for Service Connect.\n\n\
  \  If [idleTimeout] is set to a time that is less than [perRequestTimeout], the connection will \
   close when the [idleTimeout] is reached and not the [perRequestTimeout].\n\
  \  \n\
  \   "]

type nonrec service_connect_tls_certificate_authority = {
  aws_pca_authority_arn : string_ option;
      [@ocaml.doc "The ARN of the Amazon Web Services Private Certificate Authority certificate.\n"]
}
[@@ocaml.doc "The certificate root authority that secures your service.\n"]

type nonrec service_connect_tls_configuration = {
  role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that's associated with the Service Connect \
         TLS.\n"]
  kms_key : string_ option; [@ocaml.doc "The Amazon Web Services Key Management Service key.\n"]
  issuer_certificate_authority : service_connect_tls_certificate_authority;
      [@ocaml.doc "The signer certificate authority.\n"]
}
[@@ocaml.doc "The key that encrypts and decrypts your resources for Service Connect TLS.\n"]

type nonrec service_connect_service = {
  tls : service_connect_tls_configuration option;
      [@ocaml.doc
        "A reference to an object that represents a Transport Layer Security (TLS) configuration.\n"]
  timeout : timeout_configuration option;
      [@ocaml.doc
        "A reference to an object that represents the configured timeouts for Service Connect.\n"]
  ingress_port_override : port_number option;
      [@ocaml.doc
        "The port number for the Service Connect proxy to listen on.\n\n\
        \ Use the value of this field to bypass the proxy for traffic on the port number specified \
         in the named [portMapping] in the task definition of this application, and then use it in \
         your VPC security groups to allow traffic into the proxy for this Amazon ECS service.\n\
        \ \n\
        \  In [awsvpc] mode and Fargate, the default value is the container port number. The \
         container port number is in the [portMapping] in the task definition. In bridge mode, the \
         default value is the ephemeral port of the Service Connect proxy.\n\
        \  "]
  client_aliases : service_connect_client_alias_list option;
      [@ocaml.doc
        "The list of client aliases for this Service Connect service. You use these to assign \
         names that can be used by client applications. The maximum number of client aliases that \
         you can have in this list is 1.\n\n\
        \ Each alias (\"endpoint\") is a fully-qualified name and port number that other Amazon \
         ECS tasks (\"clients\") can use to connect to this service.\n\
        \ \n\
        \  Each name and port mapping must be unique within the namespace.\n\
        \  \n\
        \   For each [ServiceConnectService], you must provide at least one [clientAlias] with one \
         [port].\n\
        \   "]
  discovery_name : string_ option;
      [@ocaml.doc
        "The [discoveryName] is the name of the new Cloud Map service that Amazon ECS creates for \
         this Amazon ECS service. This must be unique within the Cloud Map namespace. The name can \
         contain up to 64 characters. The name can include lowercase letters, numbers, underscores \
         (_), and hyphens (-). The name can't start with a hyphen.\n\n\
        \ If the [discoveryName] isn't specified, the port mapping name from the task definition \
         is used in [portName.namespace].\n\
        \ "]
  port_name : string_;
      [@ocaml.doc
        "The [portName] must match the name of one of the [portMappings] from all the containers \
         in the task definition of this Amazon ECS service.\n"]
}
[@@ocaml.doc
  "The Service Connect service object configuration. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
   Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

type nonrec service_connect_service_list = service_connect_service list [@@ocaml.doc ""]

type nonrec log_driver =
  | AWSFIRELENS [@ocaml.doc ""]
  | SPLUNK [@ocaml.doc ""]
  | AWSLOGS [@ocaml.doc ""]
  | FLUENTD [@ocaml.doc ""]
  | GELF [@ocaml.doc ""]
  | JOURNALD [@ocaml.doc ""]
  | SYSLOG [@ocaml.doc ""]
  | JSON_FILE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_configuration_options_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec log_configuration = {
  secret_options : secret_list option;
      [@ocaml.doc
        "The secrets to pass to the log configuration. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html}Specifying \
         sensitive data} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  options : log_configuration_options_map option;
      [@ocaml.doc
        "The configuration options to send to the log driver.\n\n\
        \ The options you can specify depend on the log driver. Some of the options you can \
         specify when you use the [awslogs] log driver to route logs to Amazon CloudWatch include \
         the following:\n\
        \ \n\
        \   awslogs-create-group  Required: No\n\
        \                         \n\
        \                          Specify whether you want the log group to be created \
         automatically. If this option isn't specified, it defaults to [false].\n\
        \                          \n\
        \                            Your IAM policy must include the [logs:CreateLogGroup] \
         permission before you attempt to use [awslogs-create-group].\n\
        \                            \n\
        \                               awslogs-region  Required: Yes\n\
        \                                               \n\
        \                                                Specify the Amazon Web Services Region \
         that the [awslogs] log driver is to send your Docker logs to. You can choose to send all \
         of your logs from clusters in different Regions to a single region in CloudWatch Logs. \
         This is so that they're all visible in one location. Otherwise, you can separate them by \
         Region for more granularity. Make sure that the specified log group exists in the Region \
         that you specify with this option.\n\
        \                                                \n\
        \                                                  awslogs-group  Required: Yes\n\
        \                                                                 \n\
        \                                                                  Make sure to specify a \
         log group that the [awslogs] log driver sends its log streams to.\n\
        \                                                                  \n\
        \                                                                    awslogs-stream-prefix  \n\
         Required: Yes, when using Fargate.Optional when using EC2.\n\n\
        \ Use the [awslogs-stream-prefix] option to associate a log stream with the specified \
         prefix, the container name, and the ID of the Amazon ECS task that the container belongs \
         to. If you specify a prefix with this option, then the log stream takes the format \
         [prefix-name/container-name/ecs-task-id].\n\
        \ \n\
        \  If you don't specify a prefix with this option, then the log stream is named after the \
         container ID that's assigned by the Docker daemon on the container instance. Because it's \
         difficult to trace logs back to the container that sent them with just the Docker \
         container ID (which is only available on the container instance), we recommend that you \
         specify a prefix with this option.\n\
        \  \n\
        \   For Amazon ECS services, you can use the service name as the prefix. Doing so, you can \
         trace log streams to the service that the container belongs to, the name of the container \
         that sent them, and the ID of the task that the container belongs to.\n\
        \   \n\
        \    You must specify a stream-prefix for your logs to have your logs appear in the Log \
         pane when using the Amazon ECS console.\n\
        \    \n\
        \      awslogs-datetime-format  Required: No\n\
        \                               \n\
        \                                This option defines a multiline start pattern in Python \
         [strftime] format. A log message consists of a line that matches the pattern and any \
         following lines that don\226\128\153t match the pattern. The matched line is the \
         delimiter between log messages.\n\
        \                                \n\
        \                                 One example of a use case for using this format is for \
         parsing output such as a stack dump, which might otherwise be logged in multiple entries. \
         The correct pattern allows it to be captured in a single entry.\n\
        \                                 \n\
        \                                  For more information, see \
         {{:https://docs.docker.com/config/containers/logging/awslogs/#awslogs-datetime-format}awslogs-datetime-format}.\n\
        \                                  \n\
        \                                   You cannot configure both the \
         [awslogs-datetime-format] and [awslogs-multiline-pattern] options.\n\
        \                                   \n\
        \                                     Multiline logging performs regular expression \
         parsing and matching of all log messages. This might have a negative impact on logging \
         performance.\n\
        \                                     \n\
        \                                        awslogs-multiline-pattern  Required: No\n\
        \                                                                   \n\
        \                                                                    This option defines a \
         multiline start pattern that uses a regular expression. A log message consists of a line \
         that matches the pattern and any following lines that don\226\128\153t match the pattern. \
         The matched line is the delimiter between log messages.\n\
        \                                                                    \n\
        \                                                                     For more \
         information, see \
         {{:https://docs.docker.com/config/containers/logging/awslogs/#awslogs-multiline-pattern}awslogs-multiline-pattern}.\n\
        \                                                                     \n\
        \                                                                      This option is \
         ignored if [awslogs-datetime-format] is also configured.\n\
        \                                                                      \n\
        \                                                                       You cannot \
         configure both the [awslogs-datetime-format] and [awslogs-multiline-pattern] options.\n\
        \                                                                       \n\
        \                                                                         Multiline \
         logging performs regular expression parsing and matching of all log messages. This might \
         have a negative impact on logging performance.\n\
        \                                                                         \n\
        \                                                                             The \
         following options apply to all supported log drivers.\n\
        \                                                                             \n\
        \                                                                               mode  \n\
         Required: No\n\n\
        \ Valid values: [non-blocking] | [blocking] \n\
        \ \n\
        \  This option defines the delivery mode of log messages from the container to the log \
         driver specified using [logDriver]. The delivery mode you choose affects application \
         availability when the flow of logs from container is interrupted.\n\
        \  \n\
        \   If you use the [blocking] mode and the flow of logs is interrupted, calls from \
         container code to write to the [stdout] and [stderr] streams will block. The logging \
         thread of the application will block as a result. This may cause the application to \
         become unresponsive and lead to container healthcheck failure. \n\
        \   \n\
        \    If you use the [non-blocking] mode, the container's logs are instead stored in an \
         in-memory intermediate buffer configured with the [max-buffer-size] option. This prevents \
         the application from becoming unresponsive when logs cannot be sent. We recommend using \
         this mode if you want to ensure service availability and are okay with some log loss. For \
         more information, see \
         {{:http://aws.amazon.com/blogs/containers/preventing-log-loss-with-non-blocking-mode-in-the-awslogs-container-log-driver/}Preventing \
         log loss with non-blocking mode in the [awslogs] container log driver}.\n\
        \    \n\
        \     You can set a default [mode] for all containers in a specific Amazon Web Services \
         Region by using the [defaultLogDriverMode] account setting. If you don't specify the \
         [mode] option or configure the account setting, Amazon ECS will default to the \
         [non-blocking] mode. For more information about the account setting, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#default-log-driver-mode}Default \
         log driver mode} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \     \n\
        \       On June 25, 2025, Amazon ECS changed the default log driver mode from [blocking] \
         to [non-blocking] to prioritize task availability over logging. To continue using the \
         [blocking] mode after this change, do one of the following:\n\
        \       \n\
        \        {ul\n\
        \              {-  Set the [mode] option in your container definition's [logConfiguration] \
         as [blocking].\n\
        \                  \n\
        \                   }\n\
        \              {-  Set the [defaultLogDriverMode] account setting to [blocking].\n\
        \                  \n\
        \                   }\n\
        \              }\n\
        \     max-buffer-size  Required: No\n\
        \                      \n\
        \                       Default value: [10m] \n\
        \                       \n\
        \                        When [non-blocking] mode is used, the [max-buffer-size] log \
         option controls the size of the buffer that's used for intermediate message storage. Make \
         sure to specify an adequate buffer size based on your application. When the buffer fills \
         up, further logs cannot be stored. Logs that cannot be stored are lost. \n\
        \                        \n\
        \                           To route logs using the [splunk] log router, you need to \
         specify a [splunk-token] and a [splunk-url].\n\
        \                           \n\
        \                            When you use the [awsfirelens] log router to route logs to an \
         Amazon Web Services Service or Amazon Web Services Partner Network destination for log \
         storage and analytics, you can set the [log-driver-buffer-limit] option to limit the \
         number of events that are buffered in memory, before being sent to the log router \
         container. It can help to resolve potential log loss issue because high throughput might \
         result in memory running out for the buffer inside of Docker.\n\
        \                            \n\
        \                             Other options you can specify when using [awsfirelens] to \
         route logs depend on the destination. When you export logs to Amazon Data Firehose, you \
         can specify the Amazon Web Services Region with [region] and a name for the log stream \
         with [delivery_stream].\n\
        \                             \n\
        \                              When you export logs to Amazon Kinesis Data Streams, you \
         can specify an Amazon Web Services Region with [region] and a data stream name with \
         [stream].\n\
        \                              \n\
        \                                When you export logs to Amazon OpenSearch Service, you \
         can specify options like [Name], [Host] (OpenSearch Service endpoint without protocol), \
         [Port], [Index], [Type], [Aws_auth], [Aws_region], [Suppress_Type_Name], and [tls]. For \
         more information, see \
         {{:http://aws.amazon.com/blogs/containers/under-the-hood-firelens-for-amazon-ecs-tasks/}Under \
         the hood: FireLens for Amazon ECS Tasks}.\n\
        \                               \n\
        \                                When you export logs to Amazon S3, you can specify the \
         bucket using the [bucket] option. You can also specify [region], [total_file_size], \
         [upload_timeout], and [use_put_object] as options.\n\
        \                                \n\
        \                                 This parameter requires version 1.19 of the Docker \
         Remote API or greater on your container instance. To check the Docker Remote API version \
         on your container instance, log in to your container instance and run the following \
         command: [sudo docker version --format '{{.Server.APIVersion}}'] \n\
        \                                 "]
  log_driver : log_driver;
      [@ocaml.doc
        "The log driver to use for the container.\n\n\
        \ For tasks on Fargate, the supported log drivers are [awslogs], [splunk], and \
         [awsfirelens].\n\
        \ \n\
        \  For tasks hosted on Amazon EC2 instances, the supported log drivers are [awslogs], \
         [fluentd], [gelf], [json-file], [journald], [syslog], [splunk], and [awsfirelens].\n\
        \  \n\
        \   For more information about using the [awslogs] log driver, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_awslogs.html}Send \
         Amazon ECS logs to CloudWatch} in the {i Amazon Elastic Container Service Developer \
         Guide}.\n\
        \   \n\
        \    For more information about using the [awsfirelens] log driver, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html}Send \
         Amazon ECS logs to an Amazon Web Services service or Amazon Web Services Partner}.\n\
        \    \n\
        \      If you have a custom driver that isn't listed, you can fork the Amazon ECS \
         container agent project that's {{:https://github.com/aws/amazon-ecs-agent}available on \
         GitHub} and customize it to work with that driver. We encourage you to submit pull \
         requests for changes that you would like to have included. However, we don't currently \
         provide support for running modified copies of this software.\n\
        \      \n\
        \       "]
}
[@@ocaml.doc
  "The log configuration for the container. This parameter maps to [LogConfig] in the docker \
   container create command and the [--log-driver] option to docker run.\n\n\
  \ By default, containers use the same logging driver that the Docker daemon uses. However, the \
   container might use a different logging driver than the Docker daemon by specifying a log \
   driver configuration in the container definition.\n\
  \ \n\
  \  Understand the following when specifying a log configuration for your containers.\n\
  \  \n\
  \   {ul\n\
  \         {-  Amazon ECS currently supports a subset of the logging drivers available to the \
   Docker daemon. Additional log drivers may be available in future releases of the Amazon ECS \
   container agent.\n\
  \             \n\
  \              For tasks on Fargate, the supported log drivers are [awslogs], [splunk], and \
   [awsfirelens].\n\
  \              \n\
  \               For tasks hosted on Amazon EC2 instances, the supported log drivers are \
   [awslogs], [fluentd], [gelf], [json-file], [journald],[syslog], [splunk], and [awsfirelens].\n\
  \               \n\
  \                }\n\
  \         {-  This parameter requires version 1.18 of the Docker Remote API or greater on your \
   container instance.\n\
  \             \n\
  \              }\n\
  \         {-  For tasks that are hosted on Amazon EC2 instances, the Amazon ECS container agent \
   must register the available logging drivers with the [ECS_AVAILABLE_LOGGING_DRIVERS] \
   environment variable before containers placed on that instance can use these log configuration \
   options. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html}Amazon ECS \
   container agent configuration} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \             \n\
  \              }\n\
  \         {-  For tasks that are on Fargate, because you don't have access to the underlying \
   infrastructure your tasks are hosted on, any additional software needed must be installed \
   outside of the task. For example, the Fluentd output aggregators or a remote host running \
   Logstash to send Gelf logs to.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec service_connect_access_logging_format = JSON [@ocaml.doc ""] | TEXT [@ocaml.doc ""]
[@@ocaml.doc
  "The format for Service Connect access log output. Choose TEXT for human-readable logs or JSON \
   for structured data that integrates well with log analysis tools.\n"]

type nonrec service_connect_include_query_parameters =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc
  "Controls whether query parameters are included in Service Connect access logs. Consider \
   security and privacy implications when enabling this feature. By default, this parameter is \
   [DISABLED].\n"]

type nonrec service_connect_access_log_configuration = {
  include_query_parameters : service_connect_include_query_parameters option;
      [@ocaml.doc
        "Specifies whether to include query parameters in Service Connect access logs.\n\n\
        \ When enabled, query parameters from HTTP requests are included in the access logs. \
         Consider security and privacy implications when enabling this feature, as query \
         parameters may contain sensitive information such as request IDs and tokens. By default, \
         this parameter is [DISABLED].\n\
        \ "]
  format : service_connect_access_logging_format;
      [@ocaml.doc
        "The format for Service Connect access log output. Choose TEXT for human-readable logs or \
         JSON for structured data that integrates well with log analysis tools.\n"]
}
[@@ocaml.doc
  "Configuration for Service Connect access logging. Access logs provide detailed information \
   about requests made to your service, including request patterns, response codes, and timing \
   data for debugging and monitoring purposes.\n\n\
  \  To enable access logs, you must also specify a [logConfiguration] in the \
   [serviceConnectConfiguration].\n\
  \  \n\
  \   "]

type nonrec service_connect_configuration = {
  access_log_configuration : service_connect_access_log_configuration option;
      [@ocaml.doc
        "The configuration for Service Connect access logging. Access logs capture detailed \
         information about requests made to your service, including request patterns, response \
         codes, and timing data. They can be useful for debugging connectivity issues, monitoring \
         service performance, and auditing service-to-service communication for security and \
         compliance purposes.\n\n\
        \  To enable access logs, you must also specify a [logConfiguration] in the \
         [serviceConnectConfiguration].\n\
        \  \n\
        \   "]
  log_configuration : log_configuration option; [@ocaml.doc ""]
  services : service_connect_service_list option;
      [@ocaml.doc
        "The list of Service Connect service objects. These are names and aliases (also known as \
         endpoints) that are used by other Amazon ECS services to connect to this service. \n\n\
        \ This field is not required for a \"client\" Amazon ECS service that's a member of a \
         namespace only to connect to other services within the namespace. An example of this \
         would be a frontend application that accepts incoming requests from either a load \
         balancer that's attached to the service or by other means.\n\
        \ \n\
        \  An object selects a port from the task definition, assigns a name for the Cloud Map \
         service, and a list of aliases (endpoints) and ports for client applications to refer to \
         this service.\n\
        \  "]
  namespace : string_ option;
      [@ocaml.doc
        "The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace for use \
         with Service Connect. The namespace must be in the same Amazon Web Services Region as the \
         Amazon ECS service and cluster. The type of namespace doesn't affect Service Connect. For \
         more information about Cloud Map, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/dg/working-with-services.html}Working \
         with Services} in the {i Cloud Map Developer Guide}.\n"]
  enabled : boolean_; [@ocaml.doc "Specifies whether to use Service Connect with this service.\n"]
}
[@@ocaml.doc
  "The Service Connect configuration of your Amazon ECS service. The configuration for this \
   service to discover and connect to services, and be discovered by, and connected from, other \
   services within a namespace.\n\n\
  \ Tasks that run in a namespace can use short names to connect to services in the namespace. \
   Tasks can connect to services across all of the clusters in the namespace. Tasks connect \
   through a managed proxy container that collects logs and metrics for increased visibility. Only \
   the tasks that Amazon ECS services create are supported with Service Connect. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
   Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

type nonrec service_connect_service_resource = {
  discovery_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the service in Cloud Map that matches the discovery \
         name for this Service Connect resource. You can use this ARN in other integrations with \
         Cloud Map. However, Service Connect can't ensure connectivity outside of Amazon ECS.\n"]
  discovery_name : string_ option;
      [@ocaml.doc
        "The discovery name of this Service Connect resource.\n\n\
        \ The [discoveryName] is the name of the new Cloud Map service that Amazon ECS creates for \
         this Amazon ECS service. This must be unique within the Cloud Map namespace. The name can \
         contain up to 64 characters. The name can include lowercase letters, numbers, underscores \
         (_), and hyphens (-). The name can't start with a hyphen.\n\
        \ \n\
        \  If the [discoveryName] isn't specified, the port mapping name from the task definition \
         is used in [portName.namespace].\n\
        \  "]
}
[@@ocaml.doc
  "The Service Connect resource. Each configuration maps a discovery name to a Cloud Map service \
   name. The data is stored in Cloud Map as part of the Service Connect configuration for each \
   discovery name of this Amazon ECS service.\n\n\
  \ A task can resolve the [dnsName] for each of the [clientAliases] of a service. However a task \
   can't resolve the discovery names. If you want to connect to a service, refer to the \
   [ServiceConnectConfiguration] of that service for the list of [clientAliases] that you can use.\n\
  \ "]

type nonrec service_connect_service_resource_list = service_connect_service_resource list
[@@ocaml.doc ""]

type nonrec ecs_volume_name = string [@@ocaml.doc ""]

type nonrec ebskms_key_id = string [@@ocaml.doc ""]

type nonrec ebs_volume_type = string [@@ocaml.doc ""]

type nonrec ebs_snapshot_id = string [@@ocaml.doc ""]

type nonrec ebs_resource_type = VOLUME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec propagate_tags =
  | NONE [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
  | TASK_DEFINITION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ebs_tag_specification = {
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Determines whether to propagate the tags from the task definition to the Amazon EBS \
         volume. Tags can only propagate to a [SERVICE] specified in [ServiceVolumeConfiguration]. \
         If no value is specified, the tags aren't propagated.\n"]
  tags : tags option;
      [@ocaml.doc
        "The tags applied to this Amazon EBS volume. [AmazonECSCreated] and [AmazonECSManaged] are \
         reserved tags that can't be used.\n"]
  resource_type : ebs_resource_type; [@ocaml.doc "The type of volume resource.\n"]
}
[@@ocaml.doc "The tag specifications of an Amazon EBS volume.\n"]

type nonrec ebs_tag_specifications = ebs_tag_specification list [@@ocaml.doc ""]

type nonrec task_filesystem_type =
  | NTFS [@ocaml.doc ""]
  | XFS [@ocaml.doc ""]
  | EXT4 [@ocaml.doc ""]
  | EXT3 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_managed_ebs_volume_configuration = {
  filesystem_type : task_filesystem_type option;
      [@ocaml.doc
        "The filesystem type for the volume. For volumes created from a snapshot, you must specify \
         the same filesystem type that the volume was using when the snapshot was created. If \
         there is a filesystem type mismatch, the tasks will fail to start.\n\n\
        \ The available Linux filesystem types are [ext3], [ext4], and [xfs]. If no value is \
         specified, the [xfs] filesystem type is used by default.\n\
        \ \n\
        \  The available Windows filesystem types are [NTFS].\n\
        \  "]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role to associate with this volume. This is the Amazon ECS \
         infrastructure IAM role that is used to manage your Amazon Web Services infrastructure. \
         We recommend using the Amazon ECS-managed [AmazonECSInfrastructureRolePolicyForVolumes] \
         IAM policy with this role. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html}Amazon \
         ECS infrastructure IAM role} in the {i Amazon ECS Developer Guide}.\n"]
  tag_specifications : ebs_tag_specifications option;
      [@ocaml.doc
        "The tags to apply to the volume. Amazon ECS applies service-managed tags by default. This \
         parameter maps 1:1 with the [TagSpecifications.N] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n"]
  throughput : boxed_integer option;
      [@ocaml.doc
        "The throughput to provision for a volume, in MiB/s, with a maximum of 1,000 MiB/s. This \
         parameter maps 1:1 with the [Throughput] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n\n\
        \  This parameter is only supported for the [gp3] volume type.\n\
        \  \n\
        \   "]
  iops : boxed_integer option;
      [@ocaml.doc
        "The number of I/O operations per second (IOPS). For [gp3], [io1], and [io2] volumes, this \
         represents the number of IOPS that are provisioned for the volume. For [gp2] volumes, \
         this represents the baseline performance of the volume and the rate at which the volume \
         accumulates I/O credits for bursting.\n\n\
        \ The following are the supported values for each volume type.\n\
        \ \n\
        \  {ul\n\
        \        {-   [gp3]: 3,000 - 16,000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-   [io1]: 100 - 64,000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-   [io2]: 100 - 256,000 IOPS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   This parameter is required for [io1] and [io2] volume types. The default for [gp3] \
         volumes is [3,000 IOPS]. This parameter is not supported for [st1], [sc1], or [standard] \
         volume types.\n\
        \   \n\
        \    This parameter maps 1:1 with the [Iops] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n\
        \    "]
  volume_initialization_rate : boxed_integer option;
      [@ocaml.doc
        "The rate, in MiB/s, at which data is fetched from a snapshot of an existing EBS volume to \
         create new volumes for attachment to the tasks maintained by the service. This property \
         can be specified only if you specify a [snapshotId]. For more information, see \
         {{:https://docs.aws.amazon.com/ebs/latest/userguide/initalize-volume.html}Initialize \
         Amazon EBS volumes} in the {i Amazon EBS User Guide}.\n"]
  snapshot_id : ebs_snapshot_id option;
      [@ocaml.doc
        "The snapshot that Amazon ECS uses to create volumes for attachment to tasks maintained by \
         the service. You must specify either [snapshotId] or [sizeInGiB] in your volume \
         configuration. This parameter maps 1:1 with the [SnapshotId] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n"]
  size_in_gi_b : boxed_integer option;
      [@ocaml.doc
        "The size of the volume in GiB. You must specify either a volume size or a snapshot ID. If \
         you specify a snapshot ID, the snapshot size is used for the volume size by default. You \
         can optionally specify a volume size greater than or equal to the snapshot size. This \
         parameter maps 1:1 with the [Size] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n\n\
        \ The following are the supported volume size values for each volume type.\n\
        \ \n\
        \  {ul\n\
        \        {-   [gp2] and [gp3]: 1-16,384\n\
        \            \n\
        \             }\n\
        \        {-   [io1] and [io2]: 4-16,384\n\
        \            \n\
        \             }\n\
        \        {-   [st1] and [sc1]: 125-16,384\n\
        \            \n\
        \             }\n\
        \        {-   [standard]: 1-1,024\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  volume_type : ebs_volume_type option;
      [@ocaml.doc
        "The volume type. This parameter maps 1:1 with the [VolumeType] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html}Amazon EBS \
         volume types} in the {i Amazon EC2 User Guide}.\n\n\
        \ The following are the supported volume types.\n\
        \ \n\
        \  {ul\n\
        \        {-  General Purpose SSD: [gp2]|[gp3] \n\
        \            \n\
        \             }\n\
        \        {-  Provisioned IOPS SSD: [io1]|[io2] \n\
        \            \n\
        \             }\n\
        \        {-  Throughput Optimized HDD: [st1] \n\
        \            \n\
        \             }\n\
        \        {-  Cold HDD: [sc1] \n\
        \            \n\
        \             }\n\
        \        {-  Magnetic: [standard] \n\
        \            \n\
        \              The magnetic volume type is not supported on Fargate.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
  kms_key_id : ebskms_key_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) identifier of the Amazon Web Services Key Management \
         Service key to use for Amazon EBS encryption. When a key is specified using this \
         parameter, it overrides Amazon EBS default encryption or any KMS key that you specified \
         for cluster-level managed storage encryption. This parameter maps 1:1 with the [KmsKeyId] \
         parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}. For more information about encrypting Amazon \
         EBS volumes attached to tasks, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-kms-encryption.html}Encrypt \
         data stored in Amazon EBS volumes attached to Amazon ECS tasks}.\n\n\
        \  Amazon Web Services authenticates the Amazon Web Services Key Management Service key \
         asynchronously. Therefore, if you specify an ID, alias, or ARN that is invalid, the \
         action can appear to complete, but eventually fails.\n\
        \  \n\
        \   "]
  encrypted : boxed_boolean option;
      [@ocaml.doc
        "Indicates whether the volume should be encrypted. If you turn on Region-level Amazon EBS \
         encryption by default but set this value as [false], the setting is overridden and the \
         volume is encrypted with the KMS key specified for Amazon EBS encryption by default. This \
         parameter maps 1:1 with the [Encrypted] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n"]
}
[@@ocaml.doc
  "The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your behalf. \
   These settings are used to create each Amazon EBS volume, with one volume created for each task \
   in the service. For information about the supported launch types and operating systems, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volumes-configuration}Supported \
   operating systems and launch types} in the{i  Amazon Elastic Container Service Developer \
   Guide}.\n\n\
  \ Many of these parameters map 1:1 with the Amazon EBS [CreateVolume] API request parameters.\n\
  \ "]

type nonrec service_volume_configuration = {
  managed_ebs_volume : service_managed_ebs_volume_configuration option;
      [@ocaml.doc
        "The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your \
         behalf. These settings are used to create each Amazon EBS volume, with one volume created \
         for each task in the service. The Amazon EBS volumes are visible in your account in the \
         Amazon EC2 console once they are created.\n"]
  name : ecs_volume_name;
      [@ocaml.doc
        "The name of the volume. This value must match the volume name from the [Volume] object in \
         the task definition.\n"]
}
[@@ocaml.doc
  "The configuration for a volume specified in the task definition as a volume that is configured \
   at launch time. Currently, the only supported volume type is an Amazon EBS volume.\n"]

type nonrec service_volume_configurations = service_volume_configuration list [@@ocaml.doc ""]

type nonrec deployment = {
  vpc_lattice_configurations : vpc_lattice_configurations option;
      [@ocaml.doc "The VPC Lattice configuration for the service deployment.\n"]
  fargate_ephemeral_storage : deployment_ephemeral_storage option;
      [@ocaml.doc "The Fargate ephemeral storage settings for the deployment.\n"]
  volume_configurations : service_volume_configurations option;
      [@ocaml.doc
        "The details of the volume that was [configuredAtLaunch]. You can configure different \
         settings like the size, throughput, volumeType, and ecryption in \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ServiceManagedEBSVolumeConfiguration.html}ServiceManagedEBSVolumeConfiguration}. \
         The [name] of the volume must match the [name] from the task definition.\n"]
  service_connect_resources : service_connect_service_resource_list option;
      [@ocaml.doc
        "The list of Service Connect resources that are associated with this deployment. Each list \
         entry maps a discovery name to a Cloud Map service name.\n"]
  service_connect_configuration : service_connect_configuration option;
      [@ocaml.doc
        "The details of the Service Connect configuration that's used by this deployment. Compare \
         the configuration between multiple deployments when troubleshooting issues with new \
         deployments.\n\n\
        \ The configuration for this service to discover and connect to services, and be \
         discovered by, and connected from, other services within a namespace.\n\
        \ \n\
        \  Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  "]
  rollout_state_reason : string_ option;
      [@ocaml.doc "A description of the rollout state of a deployment.\n"]
  rollout_state : deployment_rollout_state option;
      [@ocaml.doc
        " The [rolloutState] of a service is only returned for services that use the rolling \
         update ([ECS]) deployment type that aren't behind a Classic Load Balancer.\n\
        \ \n\
        \   The rollout state of the deployment. When a service deployment is started, it begins \
         in an [IN_PROGRESS] state. When the service reaches a steady state, the deployment \
         transitions to a [COMPLETED] state. If the service fails to reach a steady state and \
         circuit breaker is turned on, the deployment transitions to a [FAILED] state. A \
         deployment in [FAILED] state doesn't launch any new tasks. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeploymentCircuitBreaker.html}DeploymentCircuitBreaker}.\n\
        \   "]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "The VPC subnet and security group configuration for tasks that receive their own elastic \
         network interface by using the [awsvpc] networking mode.\n"]
  platform_family : string_ option;
      [@ocaml.doc
        "The operating system that your tasks in the service, or tasks are running on. A platform \
         family is specified only for tasks using the Fargate launch type. \n\n\
        \  All tasks that run as part of this service must use the same [platformFamily] value as \
         the service, for example, [ LINUX.].\n\
        \ "]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version that your tasks in the service run on. A platform version is only \
         specified for tasks using the Fargate launch type. If one isn't specified, the [LATEST] \
         platform version is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  launch_type : launch_type option;
      [@ocaml.doc
        "The launch type the tasks in the service are using. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS Launch Types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc "The capacity provider strategy that the deployment is using.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the service deployment was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the service deployment was created.\n"]
  failed_tasks : integer option;
      [@ocaml.doc
        "The number of consecutively failed tasks in the deployment. A task is considered a \
         failure if the service scheduler can't launch the task, the task doesn't transition to a \
         [RUNNING] state, or if it fails any of its defined health checks and is stopped.\n\n\
        \  Once a service deployment has one or more successfully running tasks, the failed task \
         count resets to zero and stops being evaluated.\n\
        \  \n\
        \   "]
  running_count : integer option;
      [@ocaml.doc "The number of tasks in the deployment that are in the [RUNNING] status.\n"]
  pending_count : integer option;
      [@ocaml.doc "The number of tasks in the deployment that are in the [PENDING] status.\n"]
  desired_count : integer option;
      [@ocaml.doc
        "The most recent desired count of tasks that was specified for the service to deploy or \
         maintain.\n"]
  task_definition : string_ option;
      [@ocaml.doc
        "The most recent task definition that was specified for the tasks in the service to use.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the deployment. The following describes each state.\n\n\
        \  PRIMARY  The most recent deployment of a service.\n\
        \           \n\
        \             ACTIVE  A service deployment that still has running tasks, but are in the \
         process of being replaced with a new [PRIMARY] deployment.\n\
        \                     \n\
        \                       INACTIVE  A deployment that has been completely replaced.\n\
        \                                 \n\
        \                                   "]
  id : string_ option; [@ocaml.doc "The ID of the deployment.\n"]
}
[@@ocaml.doc
  "The details of an Amazon ECS service deployment. This is used only when a service uses the \
   [ECS] deployment controller type.\n"]

type nonrec deployments = deployment list [@@ocaml.doc ""]

type nonrec service_event = {
  message : string_ option; [@ocaml.doc "The event message.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the event was triggered.\n"]
  id : string_ option; [@ocaml.doc "The ID string for the event.\n"]
}
[@@ocaml.doc "The details for an event that's associated with a service.\n"]

type nonrec service_events = service_event list [@@ocaml.doc ""]

type nonrec service_current_revision_summary = {
  pending_task_count : integer option;
      [@ocaml.doc "The number of pending tasks in the current service revision\n"]
  running_task_count : integer option;
      [@ocaml.doc "The number of running tasks of the current service revision\n"]
  requested_task_count : integer option;
      [@ocaml.doc "The number of requested tasks in the current service revision\n"]
  arn : string_ option; [@ocaml.doc "The ARN of the current service revision.\n"]
}
[@@ocaml.doc "The summary of the current service revision configuration\n"]

type nonrec service_current_revision_summary_list = service_current_revision_summary list
[@@ocaml.doc ""]

type nonrec placement_constraint_type =
  | MEMBER_OF [@ocaml.doc ""]
  | DISTINCT_INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec placement_constraint = {
  expression : string_ option;
      [@ocaml.doc
        "A cluster query language expression to apply to the constraint. The expression can have a \
         maximum length of 2000 characters. You can't specify an expression if the constraint type \
         is [distinctInstance]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster \
         query language} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  type_ : placement_constraint_type option;
      [@ocaml.doc
        "The type of constraint. Use [distinctInstance] to ensure that each task in a particular \
         group is running on a different container instance. Use [memberOf] to restrict the \
         selection to a group of valid candidates.\n"]
}
[@@ocaml.doc
  "An object representing a constraint on task placement. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html}Task \
   placement constraints} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \  If you're using the Fargate launch type, task placement constraints aren't supported.\n\
  \  \n\
  \   "]

type nonrec placement_constraints = placement_constraint list [@@ocaml.doc ""]

type nonrec placement_strategy_type =
  | BINPACK [@ocaml.doc ""]
  | SPREAD [@ocaml.doc ""]
  | RANDOM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec placement_strategy = {
  field : string_ option;
      [@ocaml.doc
        "The field to apply the placement strategy against. For the [spread] placement strategy, \
         valid values are [instanceId] (or [host], which has the same effect), or any platform or \
         custom attribute that's applied to a container instance, such as \
         [attribute:ecs.availability-zone]. For the [binpack] placement strategy, valid values are \
         [cpu] and [memory]. For the [random] placement strategy, this field is not used.\n"]
  type_ : placement_strategy_type option;
      [@ocaml.doc
        "The type of placement strategy. The [random] placement strategy randomly places tasks on \
         available candidates. The [spread] placement strategy spreads placement across available \
         candidates evenly based on the [field] parameter. The [binpack] strategy places tasks on \
         available candidates that have the least available amount of the resource that's \
         specified with the [field] parameter. For example, if you binpack on memory, a task is \
         placed on the instance with the least amount of remaining memory but still enough to run \
         the task.\n"]
}
[@@ocaml.doc
  "The task placement strategy for a task or service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html}Task \
   placement strategies} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

type nonrec placement_strategies = placement_strategy list [@@ocaml.doc ""]

type nonrec scheduling_strategy = DAEMON [@ocaml.doc ""] | REPLICA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_controller_type =
  | EXTERNAL [@ocaml.doc ""]
  | CODE_DEPLOY [@ocaml.doc ""]
  | ECS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_controller = {
  type_ : deployment_controller_type;
      [@ocaml.doc
        "The deployment controller type to use.\n\n\
        \ The deployment controller is the mechanism that determines how tasks are deployed for \
         your service. The valid options are:\n\
        \ \n\
        \  {ul\n\
        \        {-  ECS\n\
        \            \n\
        \             When you create a service which uses the [ECS] deployment controller, you \
         can choose between the following deployment strategies:\n\
        \             \n\
        \              {ul\n\
        \                    {-   [ROLLING]: When you create a service which uses the {i rolling \
         update} ([ROLLING]) deployment strategy, the Amazon ECS service scheduler replaces the \
         currently running tasks with new tasks. The number of tasks that Amazon ECS adds or \
         removes from the service during a rolling update is controlled by the service deployment \
         configuration. \n\
        \                        \n\
        \                         Rolling update deployments are best suited for the following \
         scenarios:\n\
        \                         \n\
        \                          {ul\n\
        \                                {-  Gradual service updates: You need to update your \
         service incrementally without taking the entire service offline at once.\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Limited resource requirements: You want to avoid the \
         additional resource costs of running two complete environments simultaneously (as \
         required by blue/green deployments).\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Acceptable deployment time: Your application can \
         tolerate a longer deployment process, as rolling updates replace tasks one by one.\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  No need for instant roll back: Your service can \
         tolerate a rollback process that takes minutes rather than seconds.\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Simple deployment process: You prefer a \
         straightforward deployment approach without the complexity of managing multiple \
         environments, target groups, and listeners.\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  No load balancer requirement: Your service doesn't \
         use or require a load balancer, Application Load Balancer, Network Load Balancer, or \
         Service Connect (which are required for blue/green deployments).\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Stateful applications: Your application maintains \
         state that makes it difficult to run two parallel environments.\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Cost sensitivity: You want to minimize deployment \
         costs by not running duplicate environments during deployment.\n\
        \                                    \n\
        \                                     }\n\
        \                                \n\
        \                     }\n\
        \                      Rolling updates are the default deployment strategy for services \
         and provide a balance between deployment safety and resource efficiency for many common \
         application scenarios.\n\
        \                      \n\
        \                       }\n\
        \                    {-   [BLUE_GREEN]: A {i blue/green} deployment strategy \
         ([BLUE_GREEN]) is a release methodology that reduces downtime and risk by running two \
         identical production environments called blue and green. With Amazon ECS blue/green \
         deployments, you can validate new service revisions before directing production traffic \
         to them. This approach provides a safer way to deploy changes with the ability to quickly \
         roll back if needed.\n\
        \                        \n\
        \                         Amazon ECS blue/green deployments are best suited for the \
         following scenarios:\n\
        \                         \n\
        \                          {ul\n\
        \                                {-  Service validation: When you need to validate new \
         service revisions before directing production traffic to them\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Zero downtime: When your service requires \
         zero-downtime deployments\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Instant roll back: When you need the ability to \
         quickly roll back if issues are detected\n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Load balancer requirement: When your service uses \
         Application Load Balancer, Network Load Balancer, or Service Connect\n\
        \                                    \n\
        \                                     }\n\
        \                                \n\
        \                     }\n\
        \                      }\n\
        \                    \n\
        \         }\n\
        \          }\n\
        \        {-  External\n\
        \            \n\
        \             Use a third-party deployment controller.\n\
        \             \n\
        \              }\n\
        \        {-  Blue/green deployment (powered by CodeDeploy)\n\
        \            \n\
        \             CodeDeploy installs an updated version of the application as a new \
         replacement task set and reroutes production traffic from the original application task \
         set to the replacement task set. The original task set is terminated after a successful \
         deployment. Use this deployment controller to verify a new deployment of a service before \
         sending production traffic to it.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "The deployment controller to use for the service. \n"]

type nonrec availability_zone_rebalancing = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_management_type = ECS [@ocaml.doc ""] | CUSTOMER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service = {
  resource_management_type : resource_management_type option;
      [@ocaml.doc
        "Identifies whether an ECS Service is an Express Service managed by ECS, or managed by the \
         customer. The valid values are [ECS] and [CUSTOMER] \n"]
  availability_zone_rebalancing : availability_zone_rebalancing option;
      [@ocaml.doc
        "Indicates whether to use Availability Zone rebalancing for the service.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-rebalancing.html}Balancing \
         an Amazon ECS service across Availability Zones} in the {i  {i Amazon Elastic Container \
         Service Developer Guide} }.\n\
        \ \n\
        \  The default behavior of [AvailabilityZoneRebalancing] differs between create and update \
         requests:\n\
        \  \n\
        \   {ul\n\
        \         {-  For create service requests, when no value is specified for \
         [AvailabilityZoneRebalancing], Amazon ECS defaults the value to [ENABLED].\n\
        \             \n\
        \              }\n\
        \         {-  For update service requests, when no value is specified for \
         [AvailabilityZoneRebalancing], Amazon ECS defaults to the existing service\226\128\153s \
         [AvailabilityZoneRebalancing] value. If the service never had an \
         [AvailabilityZoneRebalancing] value set, Amazon ECS treats this as [DISABLED].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Determines whether the execute command functionality is turned on for the service. If \
         [true], the execute command functionality is turned on for all containers in tasks as \
         part of the service.\n"]
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Determines whether to propagate the tags from the task definition or the service to the \
         task. If no value is specified, the tags aren't propagated.\n"]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Determines whether to use Amazon ECS managed tags for the tasks in the service. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         Your Amazon ECS Resources} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  created_by : string_ option; [@ocaml.doc "The principal that created the service.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the service to help you categorize and organize them. Each \
         tag consists of a key and an optional value. You define bot the key and value.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  deployment_controller : deployment_controller option;
      [@ocaml.doc "The deployment controller type the service is using. \n"]
  scheduling_strategy : scheduling_strategy option;
      [@ocaml.doc
        "The scheduling strategy to use for the service. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html}Services}.\n\n\
        \ There are two service scheduler strategies available.\n\
        \ \n\
        \  {ul\n\
        \        {-   [REPLICA]-The replica scheduling strategy places and maintains the desired \
         number of tasks across your cluster. By default, the service scheduler spreads tasks \
         across Availability Zones. You can use task placement strategies and constraints to \
         customize task placement decisions.\n\
        \            \n\
        \             }\n\
        \        {-   [DAEMON]-The daemon scheduling strategy deploys exactly one task on each \
         active container instance. This task meets all of the task placement constraints that you \
         specify in your cluster. The service scheduler also evaluates the task placement \
         constraints for running tasks. It stop tasks that don't meet the placement constraints.\n\
        \            \n\
        \              Fargate tasks don't support the [DAEMON] scheduling strategy.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
  health_check_grace_period_seconds : boxed_integer option;
      [@ocaml.doc
        "The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy \
         Elastic Load Balancing, VPC Lattice, and container health checks after a task has first \
         started.\n\n\
        \ If your service has more running tasks than desired, unhealthy tasks in the grace period \
         might be stopped to reach the desired count.\n\
        \ "]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "The VPC subnet and security group configuration for tasks that receive their own elastic \
         network interface by using the [awsvpc] networking mode.\n"]
  placement_strategy : placement_strategies option;
      [@ocaml.doc "The placement strategy that determines how tasks for the service are placed.\n"]
  placement_constraints : placement_constraints option;
      [@ocaml.doc "The placement constraints for the tasks in the service.\n"]
  current_service_revisions : service_current_revision_summary_list option;
      [@ocaml.doc "The list of the service revisions.\n"]
  current_service_deployment : string_ option;
      [@ocaml.doc "The ARN of the current service deployment.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the service was created.\n"]
  events : service_events option;
      [@ocaml.doc
        "The event stream for your service. A maximum of 100 of the latest events are displayed.\n"]
  role_arn : string_ option;
      [@ocaml.doc
        "The ARN of the IAM role that's associated with the service. It allows the Amazon ECS \
         container agent to register container instances with an Elastic Load Balancing load \
         balancer.\n"]
  deployments : deployments option;
      [@ocaml.doc "The current state of deployments for the service.\n"]
  task_sets : task_sets option;
      [@ocaml.doc
        "Information about a set of Amazon ECS tasks in either an CodeDeploy or an [EXTERNAL] \
         deployment. An Amazon ECS task set includes details such as the desired number of tasks, \
         how many tasks are running, and whether the task set serves production traffic.\n"]
  deployment_configuration : deployment_configuration option;
      [@ocaml.doc
        "Optional deployment parameters that control how many tasks run during the deployment and \
         the ordering of stopping and starting tasks.\n"]
  task_definition : string_ option;
      [@ocaml.doc
        "The task definition to use for tasks in the service. This value is specified when the \
         service is created with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html}CreateService}, \
         and it can be modified with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService}.\n"]
  platform_family : string_ option;
      [@ocaml.doc
        "The operating system that your tasks in the service run on. A platform family is \
         specified only for tasks using the Fargate launch type. \n\n\
        \  All tasks that run as part of this service must use the same [platformFamily] value as \
         the service (for example, [LINUX]).\n\
        \ "]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version to run your service on. A platform version is only specified for \
         tasks that are hosted on Fargate. If one isn't specified, the [LATEST] platform version \
         is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The capacity provider strategy the service uses. When using the DescribeServices API, \
         this field is omitted if the service was created using a launch type.\n"]
  launch_type : launch_type option;
      [@ocaml.doc
        "The launch type the service is using. When using the DescribeServices API, this field is \
         omitted if the service was created using a capacity provider strategy.\n"]
  pending_count : integer option;
      [@ocaml.doc "The number of tasks in the cluster that are in the [PENDING] state.\n"]
  running_count : integer option;
      [@ocaml.doc "The number of tasks in the cluster that are in the [RUNNING] state.\n"]
  desired_count : integer option;
      [@ocaml.doc
        "The desired number of instantiations of the task definition to keep running on the \
         service. This value is specified when the service is created with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html}CreateService} \
         , and it can be modified with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService}.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the service. The valid values are [ACTIVE], [DRAINING], or [INACTIVE].\n"]
  service_registries : service_registries option;
      [@ocaml.doc
        "The details for the service discovery registries to assign to this service. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html}Service \
         Discovery}.\n"]
  load_balancers : load_balancers option;
      [@ocaml.doc
        "A list of Elastic Load Balancing load balancer objects. It contains the load balancer \
         name, the container name, and the container port to access from the load balancer. The \
         container name is as it appears in a container definition.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster that hosts the service.\n"]
  service_name : string_ option;
      [@ocaml.doc
        "The name of your service. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed. Service names must be unique within a cluster. \
         However, you can have similarly named services in multiple clusters within a Region or \
         across multiple Regions.\n"]
  service_arn : string_ option;
      [@ocaml.doc
        "The ARN that identifies the service. For more information about the ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids}Amazon \
         Resource Name (ARN)} in the {i Amazon ECS Developer Guide}.\n"]
}
[@@ocaml.doc "Details on a service within a cluster.\n"]

type nonrec update_service_response = {
  service : service option;
      [@ocaml.doc
        "The full description of your service following the update call.\n\n\
        \ The response includes a [lifecycleHookDetails] field, which is an empty array when the \
         service is created or updated. The values are populated when a lifecycle hook executes \
         and are available as part of the service deployment details \
         ({{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServiceDeployments.html}DescribeServiceDeployments}).\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metric_names_list = metric_name list [@@ocaml.doc ""]

type nonrec metric_resolution_seconds = int [@@ocaml.doc ""]

type nonrec metric_configuration = {
  resolution_seconds : metric_resolution_seconds;
      [@ocaml.doc
        "The resolution, in seconds, at which to collect the metrics. The valid values are [20] \
         and [60].\n"]
  metric_names : metric_names_list;
      [@ocaml.doc
        "The list of metric names to configure. The supported metric names are [CPUUtilization] \
         and [MemoryUtilization].\n"]
}
[@@ocaml.doc "The configuration for a specific set of metrics to collect for a service.\n"]

type nonrec metric_configuration_list = metric_configuration list [@@ocaml.doc ""]

type nonrec monitoring_configuration = {
  metric_configurations : metric_configuration_list option;
      [@ocaml.doc "The list of metric configurations for the service monitoring.\n"]
}
[@@ocaml.doc
  "The optional monitoring configuration for a service, which defines the resolution for the \
   service-level [CPUUtilization] and [MemoryUtilization] Amazon CloudWatch metrics. When not \
   specified, Amazon ECS uses the default resolution of [60] seconds.\n"]

type nonrec update_service_request = {
  monitoring : monitoring_configuration option;
      [@ocaml.doc
        "The optional monitoring configuration for the service, which defines the resolution for \
         the service-level [CPUUtilization] and [MemoryUtilization] Amazon CloudWatch metrics. \
         When not specified, Amazon ECS uses the default resolution of [60] seconds.\n"]
  vpc_lattice_configurations : vpc_lattice_configurations option;
      [@ocaml.doc
        "An object representing the VPC Lattice configuration for the service being updated.\n\n\
        \ This parameter triggers a new service deployment.\n\
        \ "]
  volume_configurations : service_volume_configurations option;
      [@ocaml.doc
        "The details of the volume that was [configuredAtLaunch]. You can configure the size, \
         volumeType, IOPS, throughput, snapshot and encryption in \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ServiceManagedEBSVolumeConfiguration.html}ServiceManagedEBSVolumeConfiguration}. \
         The [name] of the volume must match the [name] from the task definition. If set to null, \
         no new deployment is triggered. Otherwise, if this configuration differs from the \
         existing one, it triggers a new deployment.\n\n\
        \ This parameter triggers a new service deployment.\n\
        \ "]
  service_connect_configuration : service_connect_configuration option;
      [@ocaml.doc
        "The configuration for this service to discover and connect to services, and be discovered \
         by, and connected from, other services within a namespace.\n\n\
        \ Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ \n\
        \  This parameter triggers a new service deployment.\n\
        \  "]
  service_registries : service_registries option;
      [@ocaml.doc
        " You must have a service-linked role when you update this property.\n\
        \ \n\
        \  For more information about the role see the [CreateService] request parameter \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html#ECS-CreateService-request-role} \
         [role] }. \n\
        \  \n\
        \    The details for the service discovery registries to assign to this service. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html}Service \
         Discovery}.\n\
        \    \n\
        \     When you add, update, or remove the service registries configuration, Amazon ECS \
         starts new tasks with the updated service registries configuration, and then stops the \
         old tasks when the new tasks are running.\n\
        \     \n\
        \      You can remove existing [serviceRegistries] by passing an empty list.\n\
        \      \n\
        \       This parameter triggers a new service deployment.\n\
        \       "]
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Determines whether to propagate the tags from the task definition or the service to the \
         task. If no value is specified, the tags aren't propagated.\n\n\
        \ Only tasks launched after the update will reflect the update. To update the tags on all \
         tasks, set [forceNewDeployment] to [true], so that Amazon ECS starts new tasks with the \
         updated tags.\n\
        \ \n\
        \  This parameter doesn't trigger a new service deployment.\n\
        \  "]
  load_balancers : load_balancers option;
      [@ocaml.doc
        " You must have a service-linked role when you update this property\n\
        \ \n\
        \   A list of Elastic Load Balancing load balancer objects. It contains the load balancer \
         name, the container name, and the container port to access from the load balancer. The \
         container name is as it appears in a container definition.\n\
        \   \n\
        \    When you add, update, or remove a load balancer configuration, Amazon ECS starts new \
         tasks with the updated Elastic Load Balancing configuration, and then stops the old tasks \
         when the new tasks are running.\n\
        \    \n\
        \     For services that use rolling updates, you can add, update, or remove Elastic Load \
         Balancing target groups. You can update from a single target group to multiple target \
         groups and from multiple target groups to a single target group.\n\
        \     \n\
        \      For services that use blue/green deployments, you can update Elastic Load Balancing \
         target groups by using \n\
        \      {[\n\
        \       \
         {{:https://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateDeployment.html}CreateDeployment} \n\
        \      ]}\n\
        \       through CodeDeploy. Note that multiple target groups are not supported for \
         blue/green deployments. For more information see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html}Register \
         multiple target groups with a service} in the {i Amazon Elastic Container Service \
         Developer Guide}. \n\
        \      \n\
        \       For services that use the external deployment controller, you can add, update, or \
         remove load balancers by using \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateTaskSet.html}CreateTaskSet}. \
         Note that multiple target groups are not supported for external deployments. For more \
         information see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html}Register \
         multiple target groups with a service} in the {i Amazon Elastic Container Service \
         Developer Guide}. \n\
        \       \n\
        \        You can remove existing [loadBalancers] by passing an empty list.\n\
        \        \n\
        \         This parameter triggers a new service deployment.\n\
        \         "]
  enable_ecs_managed_tags : boxed_boolean option;
      [@ocaml.doc
        "Determines whether to turn on Amazon ECS managed tags for the tasks in the service. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         Your Amazon ECS Resources} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \ Only tasks launched after the update will reflect the update. To update the tags on all \
         tasks, set [forceNewDeployment] to [true], so that Amazon ECS starts new tasks with the \
         updated tags.\n\
        \ \n\
        \  This parameter doesn't trigger a new service deployment.\n\
        \  "]
  enable_execute_command : boxed_boolean option;
      [@ocaml.doc
        "If [true], this enables execute command functionality on all task containers.\n\n\
        \ If you do not want to override the value that was set when the service was created, you \
         can set this to [null] when performing this action.\n\
        \ \n\
        \  This parameter doesn't trigger a new service deployment.\n\
        \  "]
  deployment_controller : deployment_controller option; [@ocaml.doc ""]
  health_check_grace_period_seconds : boxed_integer option;
      [@ocaml.doc
        "The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy \
         Elastic Load Balancing, VPC Lattice, and container health checks after a task has first \
         started. If you don't specify a health check grace period value, the default value of [0] \
         is used. If you don't use any of the health checks, then [healthCheckGracePeriodSeconds] \
         is unused.\n\n\
        \ If your service's tasks take a while to start and respond to health checks, you can \
         specify a health check grace period of up to 2,147,483,647 seconds (about 69 years). \
         During that time, the Amazon ECS service scheduler ignores health check status. This \
         grace period can prevent the service scheduler from marking tasks as unhealthy and \
         stopping them before they have time to come up.\n\
        \ \n\
        \  If your service has more running tasks than desired, unhealthy tasks in the grace \
         period might be stopped to reach the desired count.\n\
        \  \n\
        \   This parameter doesn't trigger a new service deployment.\n\
        \   "]
  force_new_deployment : boolean_ option;
      [@ocaml.doc
        "Determines whether to force a new deployment of the service. By default, deployments \
         aren't forced. You can use this option to start a new deployment with no service \
         definition changes. For example, you can update a service's tasks to use a newer Docker \
         image with the same image/tag combination ([my_image:latest]) or to roll Fargate tasks \
         onto a newer platform version.\n"]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version that your tasks in the service run on. A platform version is only \
         specified for tasks using the Fargate launch type. If a platform version is not \
         specified, the [LATEST] platform version is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \ This parameter triggers a new service deployment.\n\
        \ "]
  placement_strategy : placement_strategies option;
      [@ocaml.doc
        "The task placement strategy objects to update the service to use. If no value is \
         specified, the existing placement strategy for the service will remain unchanged. If this \
         value is specified, it will override the existing placement strategy defined for the \
         service. To remove an existing placement strategy, specify an empty object.\n\n\
        \ You can specify a maximum of five strategy rules for each service.\n\
        \ \n\
        \  This parameter doesn't trigger a new service deployment.\n\
        \  "]
  placement_constraints : placement_constraints option;
      [@ocaml.doc
        "An array of task placement constraint objects to update the service to use. If no value \
         is specified, the existing placement constraints for the service will remain unchanged. \
         If this value is specified, it will override any existing placement constraints defined \
         for the service. To remove all existing placement constraints, specify an empty array.\n\n\
        \ You can specify a maximum of 10 constraints for each task. This limit includes \
         constraints in the task definition and those specified at runtime.\n\
        \ \n\
        \  This parameter doesn't trigger a new service deployment.\n\
        \  "]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "An object representing the network configuration for the service.\n\n\
        \ This parameter triggers a new service deployment.\n\
        \ "]
  availability_zone_rebalancing : availability_zone_rebalancing option;
      [@ocaml.doc
        "Indicates whether to use Availability Zone rebalancing for the service.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-rebalancing.html}Balancing \
         an Amazon ECS service across Availability Zones} in the {i  {i Amazon Elastic Container \
         Service Developer Guide} }.\n\
        \ \n\
        \  The default behavior of [AvailabilityZoneRebalancing] differs between create and update \
         requests:\n\
        \  \n\
        \   {ul\n\
        \         {-  For create service requests, when no value is specified for \
         [AvailabilityZoneRebalancing], Amazon ECS defaults the value to [ENABLED].\n\
        \             \n\
        \              }\n\
        \         {-  For update service requests, when no value is specified for \
         [AvailabilityZoneRebalancing], Amazon ECS defaults to the existing service\226\128\153s \
         [AvailabilityZoneRebalancing] value. If the service never had an \
         [AvailabilityZoneRebalancing] value set, Amazon ECS treats this as [DISABLED].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   This parameter doesn't trigger a new service deployment.\n\
        \   "]
  deployment_configuration : deployment_configuration option;
      [@ocaml.doc
        "Optional deployment parameters that control how many tasks run during the deployment and \
         the ordering of stopping and starting tasks.\n\n\
        \ This parameter doesn't trigger a new service deployment.\n\
        \ "]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The details of a capacity provider strategy. You can set a capacity provider when you \
         create a cluster, run a task, or update a service.\n\n\
        \  If you want to use Amazon ECS Managed Instances, you must use the \
         [capacityProviderStrategy] request parameter.\n\
        \  \n\
        \    When you use Fargate, the capacity providers are [FARGATE] or [FARGATE_SPOT].\n\
        \    \n\
        \     When you use Amazon EC2, the capacity providers are Auto Scaling groups.\n\
        \     \n\
        \      You can change capacity providers for rolling deployments and blue/green deployments.\n\
        \      \n\
        \       The following list provides the valid transitions:\n\
        \       \n\
        \        {ul\n\
        \              {-  Update the Fargate launch type to an Auto Scaling group capacity \
         provider.\n\
        \                  \n\
        \                   }\n\
        \              {-  Update the Amazon EC2 launch type to a Fargate capacity provider.\n\
        \                  \n\
        \                   }\n\
        \              {-  Update the Fargate capacity provider to an Auto Scaling group capacity \
         provider.\n\
        \                  \n\
        \                   }\n\
        \              {-  Update the Amazon EC2 capacity provider to a Fargate capacity provider. \n\
        \                  \n\
        \                   }\n\
        \              {-  Update the Auto Scaling group or Fargate capacity provider back to the \
         launch type.\n\
        \                  \n\
        \                   Pass an empty list in the [capacityProviderStrategy] parameter.\n\
        \                   \n\
        \                    }\n\
        \              }\n\
        \   For information about Amazon Web Services CDK considerations, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/update-service-parameters.html}Amazon \
         Web Services CDK considerations}.\n\
        \   \n\
        \    This parameter doesn't trigger a new service deployment.\n\
        \    "]
  task_definition : string_ option;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full ARN of the task definition to run \
         in your service. If a [revision] is not specified, the latest [ACTIVE] revision is used. \
         If you modify the task definition with [UpdateService], Amazon ECS spawns a task with the \
         new version of the task definition and then stops an old task after the new version is \
         running.\n\n\
        \ This parameter triggers a new service deployment.\n\
        \ "]
  desired_count : boxed_integer option;
      [@ocaml.doc
        "The number of instantiations of the task to place and keep running in your service.\n\n\
        \ This parameter doesn't trigger a new service deployment.\n\
        \ "]
  service : string_; [@ocaml.doc "The name of the service to update.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that your service runs \
         on. If you do not specify a cluster, the default cluster is assumed.\n\n\
        \ You can't change the cluster name.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_service_primary_task_set_response = {
  task_set : task_set option; [@ocaml.doc "The details about the task set.\n"]
}
[@@ocaml.doc ""]

type nonrec update_service_primary_task_set_request = {
  primary_task_set : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the task set to set as the primary \
         task set in the deployment.\n"]
  service : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the service that the task set exists \
         in.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         that the task set exists in.\n"]
}
[@@ocaml.doc ""]

type nonrec platform_unknown_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "The specified platform version doesn't exist.\n"]

type nonrec platform_task_definition_incompatibility_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified platform version doesn't satisfy the required capabilities of the task definition.\n"]

type nonrec namespace_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "The specified namespace wasn't found.\n"]

type nonrec managed_instances_network_configuration = {
  security_groups : string_list option;
      [@ocaml.doc
        "The list of security group IDs to apply to Amazon ECS Managed Instances. These security \
         groups control the network traffic allowed to and from the instances.\n"]
  subnets : string_list option;
      [@ocaml.doc
        "The list of subnet IDs where Amazon ECS can launch Amazon ECS Managed Instances. \
         Instances are distributed across the specified subnets for high availability. All subnets \
         must be in the same VPC.\n"]
}
[@@ocaml.doc
  "The network configuration for Amazon ECS Managed Instances. This specifies the VPC subnets and \
   security groups that instances use for network connectivity. Amazon ECS Managed Instances \
   support multiple network modes including [awsvpc] (instances receive ENIs for task isolation), \
   [host] (instances share network namespace with tasks), and [none] (no external network \
   connectivity), ensuring backward compatibility for migrating workloads from Fargate or Amazon \
   EC2.\n"]

type nonrec task_volume_storage_gi_b = int [@@ocaml.doc ""]

type nonrec managed_instances_storage_configuration = {
  storage_size_gi_b : task_volume_storage_gi_b option; [@ocaml.doc "The size of the data volume.\n"]
}
[@@ocaml.doc
  "The storage configuration for Amazon ECS Managed Instances. This defines the data volume \
   configuration for the instances.\n"]

type nonrec managed_instances_local_storage_configuration = {
  use_local_storage : boolean_ option;
      [@ocaml.doc
        "Use instance store volumes for data storage when available. EBS volumes are not \
         provisioned for data storage. If the container instance has multiple instance store \
         volumes, a single data volume is created. Consider defining instance store requirements \
         using the [localStorage], [localStorageTypes] and [totalLocalStorageGB] properties.\n"]
}
[@@ocaml.doc
  "The local storage configuration for Amazon ECS Managed Instances. This defines how ECS uses and \
   configures instance store volumes available on container instance.\n"]

type nonrec managed_instances_monitoring_options =
  | DETAILED [@ocaml.doc ""]
  | BASIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec memory_mi_b_request = {
  max : boxed_integer option;
      [@ocaml.doc
        "The maximum amount of memory in MiB. Instance types with more memory than this value are \
         excluded from selection.\n"]
  min : boxed_integer;
      [@ocaml.doc
        "The minimum amount of memory in MiB. Instance types with less memory than this value are \
         excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum amount of memory in mebibytes (MiB) for instance type selection. This \
   ensures that selected instance types have adequate memory for your workloads.\n"]

type nonrec cpu_manufacturer =
  | AMAZON_WEB_SERVICES [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
  | INTEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cpu_manufacturer_set = cpu_manufacturer list [@@ocaml.doc ""]

type nonrec boxed_double = float [@@ocaml.doc ""]

type nonrec memory_gi_b_per_v_cpu_request = {
  max : boxed_double option;
      [@ocaml.doc
        "The maximum amount of memory per vCPU in GiB. Instance types with a higher memory-to-vCPU \
         ratio are excluded from selection.\n"]
  min : boxed_double option;
      [@ocaml.doc
        "The minimum amount of memory per vCPU in GiB. Instance types with a lower memory-to-vCPU \
         ratio are excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum amount of memory per vCPU in gibibytes (GiB). This helps ensure that \
   instance types have the appropriate memory-to-CPU ratio for your workloads.\n"]

type nonrec excluded_instance_type = string [@@ocaml.doc ""]

type nonrec excluded_instance_type_set = excluded_instance_type list [@@ocaml.doc ""]

type nonrec instance_generation = PREVIOUS [@ocaml.doc ""] | CURRENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_generation_set = instance_generation list [@@ocaml.doc ""]

type nonrec bare_metal =
  | EXCLUDED [@ocaml.doc ""]
  | REQUIRED [@ocaml.doc ""]
  | INCLUDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec burstable_performance =
  | EXCLUDED [@ocaml.doc ""]
  | REQUIRED [@ocaml.doc ""]
  | INCLUDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_interface_count_request = {
  max : boxed_integer option;
      [@ocaml.doc
        "The maximum number of network interfaces. Instance types that support more network \
         interfaces are excluded from selection.\n"]
  min : boxed_integer option;
      [@ocaml.doc
        "The minimum number of network interfaces. Instance types that support fewer network \
         interfaces are excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum number of network interfaces for instance type selection. This is \
   useful for workloads that require multiple network interfaces.\n"]

type nonrec local_storage =
  | EXCLUDED [@ocaml.doc ""]
  | REQUIRED [@ocaml.doc ""]
  | INCLUDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec local_storage_type = SSD [@ocaml.doc ""] | HDD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec local_storage_type_set = local_storage_type list [@@ocaml.doc ""]

type nonrec total_local_storage_gb_request = {
  max : boxed_double option;
      [@ocaml.doc
        "The maximum total local storage in GB. Instance types with more local storage are \
         excluded from selection.\n"]
  min : boxed_double option;
      [@ocaml.doc
        "The minimum total local storage in GB. Instance types with less local storage are \
         excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum total local storage in gigabytes (GB) for instance types with local \
   storage. This is useful for workloads that require local storage for temporary data or caching.\n"]

type nonrec baseline_ebs_bandwidth_mbps_request = {
  max : boxed_integer option;
      [@ocaml.doc
        "The maximum baseline Amazon EBS bandwidth in Mbps. Instance types with higher Amazon EBS \
         bandwidth are excluded from selection.\n"]
  min : boxed_integer option;
      [@ocaml.doc
        "The minimum baseline Amazon EBS bandwidth in Mbps. Instance types with lower Amazon EBS \
         bandwidth are excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum baseline Amazon EBS bandwidth in megabits per second (Mbps) for \
   instance type selection. This is important for workloads with high storage I/O requirements.\n"]

type nonrec accelerator_type =
  | INFERENCE [@ocaml.doc ""]
  | FPGA [@ocaml.doc ""]
  | GPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_type_set = accelerator_type list [@@ocaml.doc ""]

type nonrec accelerator_count_request = {
  max : boxed_integer option;
      [@ocaml.doc
        "The maximum number of accelerators. Instance types with more accelerators are excluded \
         from selection.\n"]
  min : boxed_integer option;
      [@ocaml.doc
        "The minimum number of accelerators. Instance types with fewer accelerators are excluded \
         from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum number of accelerators (such as GPUs) for instance type selection. This \
   is used for workloads that require specific numbers of accelerators.\n"]

type nonrec accelerator_manufacturer =
  | HABANA [@ocaml.doc ""]
  | XILINX [@ocaml.doc ""]
  | NVIDIA [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
  | AMAZON_WEB_SERVICES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_manufacturer_set = accelerator_manufacturer list [@@ocaml.doc ""]

type nonrec accelerator_name =
  | T4G [@ocaml.doc ""]
  | H100 [@ocaml.doc ""]
  | A10G [@ocaml.doc ""]
  | V100 [@ocaml.doc ""]
  | VU9P [@ocaml.doc ""]
  | T4 [@ocaml.doc ""]
  | RADEON_PRO_V520 [@ocaml.doc ""]
  | M60 [@ocaml.doc ""]
  | K80 [@ocaml.doc ""]
  | K520 [@ocaml.doc ""]
  | INFERENTIA [@ocaml.doc ""]
  | A100 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_name_set = accelerator_name list [@@ocaml.doc ""]

type nonrec accelerator_total_memory_mi_b_request = {
  max : boxed_integer option;
      [@ocaml.doc
        "The maximum total accelerator memory in MiB. Instance types with more accelerator memory \
         are excluded from selection.\n"]
  min : boxed_integer option;
      [@ocaml.doc
        "The minimum total accelerator memory in MiB. Instance types with less accelerator memory \
         are excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum total accelerator memory in mebibytes (MiB) for instance type \
   selection. This is important for GPU workloads that require specific amounts of video memory.\n"]

type nonrec network_bandwidth_gbps_request = {
  max : boxed_double option;
      [@ocaml.doc
        "The maximum network bandwidth in Gbps. Instance types with higher network bandwidth are \
         excluded from selection.\n"]
  min : boxed_double option;
      [@ocaml.doc
        "The minimum network bandwidth in Gbps. Instance types with lower network bandwidth are \
         excluded from selection.\n"]
}
[@@ocaml.doc
  "The minimum and maximum network bandwidth in gigabits per second (Gbps) for instance type \
   selection. This is important for network-intensive workloads.\n"]

type nonrec allowed_instance_type = string [@@ocaml.doc ""]

type nonrec allowed_instance_type_set = allowed_instance_type list [@@ocaml.doc ""]

type nonrec instance_requirements_request = {
  max_spot_price_as_percentage_of_optimal_on_demand_price : boxed_integer option;
      [@ocaml.doc
        "The maximum price for Spot instances as a percentage of the optimal On-Demand price. This \
         provides more precise cost control for Spot instance selection.\n"]
  allowed_instance_types : allowed_instance_type_set option;
      [@ocaml.doc
        "The instance types to include in the selection. When specified, Amazon ECS only considers \
         these instance types, subject to the other requirements specified.\n"]
  network_bandwidth_gbps : network_bandwidth_gbps_request option;
      [@ocaml.doc
        "The minimum and maximum network bandwidth in gigabits per second (Gbps). This is crucial \
         for network-intensive workloads that require high throughput.\n"]
  accelerator_total_memory_mi_b : accelerator_total_memory_mi_b_request option;
      [@ocaml.doc
        "The minimum and maximum total accelerator memory in mebibytes (MiB). This is important \
         for GPU workloads that require specific amounts of video memory.\n"]
  accelerator_names : accelerator_name_set option;
      [@ocaml.doc
        "The specific accelerator names to include. For example, you can specify [a100], [v100], \
         [k80], or other specific accelerator models.\n"]
  accelerator_manufacturers : accelerator_manufacturer_set option;
      [@ocaml.doc
        "The accelerator manufacturers to include. You can specify [nvidia], [amd], \
         [amazon-web-services], or [xilinx] depending on your accelerator requirements.\n"]
  accelerator_count : accelerator_count_request option;
      [@ocaml.doc
        "The minimum and maximum number of accelerators for the instance types. This is used when \
         you need instances with specific numbers of GPUs or other accelerators.\n"]
  accelerator_types : accelerator_type_set option;
      [@ocaml.doc
        "The accelerator types to include. You can specify [gpu] for graphics processing units, \
         [fpga] for field programmable gate arrays, or [inference] for machine learning inference \
         accelerators.\n"]
  baseline_ebs_bandwidth_mbps : baseline_ebs_bandwidth_mbps_request option;
      [@ocaml.doc
        "The minimum and maximum baseline Amazon EBS bandwidth in megabits per second (Mbps). This \
         is important for workloads with high storage I/O requirements.\n"]
  total_local_storage_g_b : total_local_storage_gb_request option;
      [@ocaml.doc
        "The minimum and maximum total local storage in gigabytes (GB) for instance types with \
         local storage.\n"]
  local_storage_types : local_storage_type_set option;
      [@ocaml.doc
        "The local storage types to include. You can specify [hdd] for hard disk drives, [ssd] for \
         solid state drives, or both.\n"]
  local_storage : local_storage option;
      [@ocaml.doc
        "Indicates whether to include instance types with local storage. Set to [included] to \
         allow local storage, [excluded] to exclude it, or [required] to use only instances with \
         local storage.\n"]
  network_interface_count : network_interface_count_request option;
      [@ocaml.doc
        "The minimum and maximum number of network interfaces for the instance types. This is \
         useful for workloads that require multiple network interfaces.\n"]
  require_hibernate_support : boxed_boolean option;
      [@ocaml.doc
        "Indicates whether the instance types must support hibernation. When set to [true], only \
         instance types that support hibernation are selected.\n"]
  burstable_performance : burstable_performance option;
      [@ocaml.doc
        "Indicates whether to include burstable performance instance types (T2, T3, T3a, T4g). Set \
         to [included] to allow burstable instances, [excluded] to exclude them, or [required] to \
         use only burstable instances.\n"]
  bare_metal : bare_metal option;
      [@ocaml.doc
        "Indicates whether to include bare metal instance types. Set to [included] to allow bare \
         metal instances, [excluded] to exclude them, or [required] to use only bare metal \
         instances.\n"]
  on_demand_max_price_percentage_over_lowest_price : boxed_integer option;
      [@ocaml.doc
        "The price protection threshold for On-Demand Instances, as a percentage higher than an \
         identified On-Demand price. The identified On-Demand price is the price of the lowest \
         priced current generation C, M, or R instance type with your specified attributes. If no \
         current generation C, M, or R instance type matches your attributes, then the identified \
         price is from either the lowest priced current generation instance types or, failing \
         that, the lowest priced previous generation instance types that match your attributes. \
         When Amazon ECS selects instance types with your attributes, we will exclude instance \
         types whose price exceeds your specified threshold.\n"]
  spot_max_price_percentage_over_lowest_price : boxed_integer option;
      [@ocaml.doc
        "The maximum price for Spot instances as a percentage over the lowest priced On-Demand \
         instance. This helps control Spot instance costs while maintaining access to capacity.\n"]
  instance_generations : instance_generation_set option;
      [@ocaml.doc
        "The instance generations to include. You can specify [current] to use the latest \
         generation instances, or [previous] to include previous generation instances for cost \
         optimization.\n"]
  excluded_instance_types : excluded_instance_type_set option;
      [@ocaml.doc
        "The instance types to exclude from selection. Use this to prevent Amazon ECS from \
         selecting specific instance types that may not be suitable for your workloads.\n"]
  memory_gi_b_per_v_cpu : memory_gi_b_per_v_cpu_request option;
      [@ocaml.doc
        "The minimum and maximum amount of memory per vCPU in gibibytes (GiB). This helps ensure \
         that instance types have the appropriate memory-to-CPU ratio for your workloads.\n"]
  cpu_manufacturers : cpu_manufacturer_set option;
      [@ocaml.doc
        "The CPU manufacturers to include or exclude. You can specify [intel], [amd], or \
         [amazon-web-services] to control which CPU types are used for your workloads.\n"]
  memory_mi_b : memory_mi_b_request;
      [@ocaml.doc
        "The minimum and maximum amount of memory in mebibytes (MiB) for the instance types. \
         Amazon ECS selects instance types that have memory within this range.\n"]
  v_cpu_count : v_cpu_count_range_request;
      [@ocaml.doc
        "The minimum and maximum number of vCPUs for the instance types. Amazon ECS selects \
         instance types that have vCPU counts within this range.\n"]
}
[@@ocaml.doc
  "The instance requirements for attribute-based instance type selection. Instead of specifying \
   exact instance types, you define requirements such as vCPU count, memory size, network \
   performance, and accelerator specifications. Amazon ECS automatically selects Amazon EC2 \
   instance types that match these requirements, providing flexibility and helping to mitigate \
   capacity constraints.\n"]

type nonrec capacity_reservation_preference =
  | RESERVATIONS_EXCLUDED [@ocaml.doc ""]
  | RESERVATIONS_FIRST [@ocaml.doc ""]
  | RESERVATIONS_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_reservation_request = {
  reservation_preference : capacity_reservation_preference option;
      [@ocaml.doc
        "The preference on when capacity reservations should be used.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [RESERVATIONS_ONLY] - Exclusively launch instances into capacity \
         reservations that match the instance requirements configured for the capacity provider. \
         If none exist, instances will fail to provision.\n\
        \            \n\
        \             }\n\
        \        {-   [RESERVATIONS_FIRST] - Prefer to launch instances into a capacity \
         reservation if any exist that match the instance requirements configured for the capacity \
         provider. If none exist, fall back to launching instances On-Demand.\n\
        \            \n\
        \             }\n\
        \        {-   [RESERVATIONS_EXCLUDED] - Avoid using capacity reservations and launch \
         exclusively On-Demand.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  reservation_group_arn : string_ option;
      [@ocaml.doc
        "The ARN of the Capacity Reservation resource group in which to run the instance.\n"]
}
[@@ocaml.doc
  "The Capacity Reservation configurations to be used when using the [RESERVED] capacity option \
   type.\n"]

type nonrec instance_launch_template_update = {
  capacity_reservations : capacity_reservation_request option;
      [@ocaml.doc
        "The updated capacity reservations specifications for Amazon ECS Managed Instances. \
         Changes to capacity reservations settings apply to new instances launched after the \
         update.\n"]
  instance_requirements : instance_requirements_request option;
      [@ocaml.doc
        "The updated instance requirements for attribute-based instance type selection. Changes to \
         instance requirements affect which instance types Amazon ECS selects for new instances.\n"]
  monitoring : managed_instances_monitoring_options option;
      [@ocaml.doc
        "CloudWatch provides two categories of monitoring: basic monitoring and detailed \
         monitoring. By default, your managed instance is configured for basic monitoring. You can \
         optionally enable detailed monitoring to help you more quickly identify and act on \
         operational issues. You can enable or turn off detailed monitoring at launch or when the \
         managed instance is running or stopped. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/detailed-monitoring-managed-instances.html}Detailed \
         monitoring for Amazon ECS Managed Instances} in the Amazon ECS Developer Guide.\n"]
  local_storage_configuration : managed_instances_local_storage_configuration option;
      [@ocaml.doc
        "The updated local storage configuration for Amazon ECS Managed Instances. Changes to \
         local storage settings apply to new instances launched after the update.\n"]
  instance_metadata_tags_propagation : boxed_boolean option;
      [@ocaml.doc
        "Determines whether tags are propagated to the instance metadata service (IMDS) for Amazon \
         EC2 instances launched by the Managed Instances capacity provider. When enabled, all tags \
         associated with the instance are available through the instance metadata service. When \
         disabled, tags are not propagated to IMDS.\n\n\
        \ Disable this setting if your tags contain characters that are not compatible with IMDS, \
         such as [/]. IMDS requires tag keys to match the pattern \
         [\\[0-9a-zA-Z\\-_+=,.@:\\]{1,255}].\n\
        \ \n\
        \  The default value is [true].\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#work-with-tags-in-IMDS}Work \
         with instance tags in instance metadata} in the {i Amazon EC2 User Guide}.\n\
        \   "]
  storage_configuration : managed_instances_storage_configuration option;
      [@ocaml.doc
        "The updated storage configuration for Amazon ECS Managed Instances. Changes to storage \
         settings apply to new instances launched after the update.\n"]
  network_configuration : managed_instances_network_configuration option;
      [@ocaml.doc
        "The updated network configuration for Amazon ECS Managed Instances. Changes to subnets \
         and security groups affect new instances launched after the update.\n"]
  ec2_instance_profile_arn : string_ option;
      [@ocaml.doc
        "The updated Amazon Resource Name (ARN) of the instance profile. The new instance profile \
         must have the necessary permissions for your tasks.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/managed-instances-instance-profile.html}Amazon \
         ECS instance profile for Managed Instances} in the {i Amazon ECS Developer Guide}. \n\
        \ "]
}
[@@ocaml.doc
  "The updated launch template configuration for Amazon ECS Managed Instances. You can modify the \
   instance profile, network configuration, storage settings, and instance requirements. Changes \
   apply to new instances launched after the update.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html}Store instance \
   launch parameters in Amazon EC2 launch templates} in the {i Amazon EC2 User Guide}.\n\
  \ "]

type nonrec propagate_mi_tags = NONE [@ocaml.doc ""] | CAPACITY_PROVIDER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec infrastructure_optimization = {
  scale_in_after : boxed_integer option;
      [@ocaml.doc
        "This parameter defines the number of seconds Amazon ECS Managed Instances waits before \
         optimizing EC2 instances that have become idle or underutilized. A longer delay increases \
         the likelihood of placing new tasks on idle or underutilized instances instances, \
         reducing startup time. A shorter delay helps reduce infrastructure costs by optimizing \
         idle or underutilized instances,instances more quickly.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [null] - Uses the default optimization behavior.\n\
        \            \n\
        \             }\n\
        \        {-   [-1] - Disables automatic infrastructure optimization.\n\
        \            \n\
        \             }\n\
        \        {-  A value between [0] and [3600] (inclusive) - Specifies the number of seconds \
         to wait before optimizing instances.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "The configuration that controls how Amazon ECS optimizes your infrastructure.\n"]

type nonrec auto_repair_actions_status = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_repair_configuration = {
  actions_status : auto_repair_actions_status option;
      [@ocaml.doc
        "The status of auto repair actions for the capacity provider. When set to [ENABLED], \
         Amazon ECS automatically replaces container instances with an [IMPAIRED] health status. \
         When set to [DISABLED], Amazon ECS still monitors container instance health but does not \
         automatically replace impaired instances.\n"]
}
[@@ocaml.doc
  "The auto repair configuration for an Amazon ECS Managed Instances capacity provider. When \
   enabled, Amazon ECS automatically replaces container instances that are detected as unhealthy \
   based on container instance health checks, including accelerated compute device and daemon \
   health checks.\n"]

type nonrec update_managed_instances_provider_configuration = {
  auto_repair_configuration : auto_repair_configuration option;
      [@ocaml.doc
        "The updated auto repair configuration for the Amazon ECS Managed Instances capacity \
         provider.\n"]
  infrastructure_optimization : infrastructure_optimization option;
      [@ocaml.doc
        "The updated infrastructure optimization configuration. Changes to this setting affect how \
         Amazon ECS optimizes instances going forward.\n"]
  propagate_tags : propagate_mi_tags option;
      [@ocaml.doc
        "The updated tag propagation setting. When changed, this affects only new instances \
         launched after the update.\n"]
  instance_launch_template : instance_launch_template_update;
      [@ocaml.doc
        "The updated launch template configuration. Changes to the launch template affect new \
         instances launched after the update, while existing instances continue to use their \
         original configuration.\n"]
  infrastructure_role_arn : string_;
      [@ocaml.doc
        "The updated Amazon Resource Name (ARN) of the infrastructure role. The new role must have \
         the necessary permissions to manage instances and access required Amazon Web Services \
         services.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html}Amazon \
         ECS infrastructure IAM role} in the {i Amazon ECS Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "The updated configuration for a Amazon ECS Managed Instances provider. You can modify the \
   infrastructure role, instance launch template, and tag propagation settings. Changes apply to \
   new instances launched after the update.\n"]

type nonrec update_in_progress_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "There's already a current Amazon ECS container agent update in progress on the container \
   instance that's specified. If the container agent becomes disconnected while it's in a \
   transitional stage, such as [PENDING] or [STAGING], the update process can get stuck in that \
   state. However, when the agent reconnects, it resumes where it stopped previously.\n"]

type nonrec update_express_gateway_service_response = {
  service : updated_express_gateway_service option;
      [@ocaml.doc
        "The full description of your express gateway service following the update call.\n"]
}
[@@ocaml.doc ""]

type nonrec update_express_gateway_service_request = {
  task_definition_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a task definition to use to update the Express Gateway \
         service. This allows you to manage your own task definition, giving you more control over \
         the service configuration such as adding sidecar containers.\n\n\
        \ The task definition must have a container named [Main] with a single TCP port mapping \
         that includes a container port and port name. The task definition must also have \
         [FARGATE] compatibility.\n\
        \ \n\
        \  If you provide a task definition ARN, you cannot also specify [primaryContainer], \
         [executionRoleArn], [taskRoleArn], [cpu], or [memory].\n\
        \  "]
  scaling_target : express_gateway_scaling_target option;
      [@ocaml.doc "The auto-scaling configuration for the Express service.\n"]
  memory : string_ option; [@ocaml.doc "The amount of memory (in MiB) used by the task.\n"]
  cpu : string_ option; [@ocaml.doc "The number of CPU units used by the task.\n"]
  network_configuration : express_gateway_service_network_configuration option;
      [@ocaml.doc
        "The network configuration for the Express service tasks. By default, the network \
         configuration for an Express service uses the default VPC.\n"]
  task_role_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role for containers in this task.\n"]
  primary_container : express_gateway_container option;
      [@ocaml.doc "The primary container configuration for the Express service.\n"]
  health_check_path : string_ option;
      [@ocaml.doc "The path on the container for Application Load Balancer health checks.\n"]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role for the Express service.\n"]
  service_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Express service to update.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_status = DELETE_IN_PROGRESS [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_daemon_response = {
  deployment_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the daemon deployment that was triggered by the update.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was created.\n"]
  status : daemon_status option; [@ocaml.doc "The status of the daemon.\n"]
  daemon_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_drain_percent = float [@@ocaml.doc ""]

type nonrec daemon_alarm_configuration = {
  enable : boolean_ option;
      [@ocaml.doc
        "Determines whether to use the CloudWatch alarm option in the daemon deployment process. \
         The default value is [false].\n"]
  alarm_names : string_list option;
      [@ocaml.doc "The CloudWatch alarm names to monitor during a daemon deployment.\n"]
}
[@@ocaml.doc
  "The CloudWatch alarm configuration for a daemon. When enabled, CloudWatch alarms determine \
   whether a daemon deployment has failed.\n"]

type nonrec daemon_deployment_configuration = {
  bake_time_in_minutes : integer option;
      [@ocaml.doc
        "The amount of time (in minutes) to wait after a successful deployment step before \
         proceeding. This allows time to monitor for issues before continuing. The default value \
         is 0.\n"]
  alarms : daemon_alarm_configuration option;
      [@ocaml.doc
        "The CloudWatch alarm configuration for the daemon deployment. When alarms are triggered \
         during a deployment, the deployment can be automatically rolled back.\n"]
  drain_percent : daemon_drain_percent option;
      [@ocaml.doc
        "The percentage of container instances to drain simultaneously during a daemon deployment. \
         Valid values are between 0.0 and 100.0.\n"]
}
[@@ocaml.doc
  "Optional deployment parameters that control how a daemon rolls out updates across container \
   instances.\n"]

type nonrec daemon_propagate_tags = NONE [@ocaml.doc ""] | DAEMON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_daemon_request = {
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "If [true], the execute command functionality is turned on for all tasks in the daemon. If \
         [false], the execute command functionality is turned off.\n"]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Specifies whether to turn on Amazon ECS managed tags for the tasks in the daemon. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         your Amazon ECS resources} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  propagate_tags : daemon_propagate_tags option;
      [@ocaml.doc
        "Specifies whether to propagate the tags from the daemon to the daemon tasks. If you don't \
         specify a value, the tags aren't propagated. You can only propagate tags to daemon tasks \
         during task creation.\n"]
  deployment_configuration : daemon_deployment_configuration option;
      [@ocaml.doc
        "Optional deployment parameters that control how the daemon rolls out updates, including \
         the drain percentage, alarm-based rollback, and bake time.\n"]
  capacity_provider_arns : string_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the capacity providers to associate with the daemon.\n"]
  daemon_task_definition_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the daemon task definition to use for the updated daemon.\n"]
  daemon_arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon to update.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified daemon wasn't found. You can view your available daemons with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListDaemons.html}ListDaemons}. \
   Amazon ECS daemons are cluster specific and Region specific.\n"]

type nonrec daemon_not_active_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified daemon isn't active. You can't update a daemon that's inactive. If you have \
   previously deleted a daemon, you can re-create it with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateDaemon.html}CreateDaemon}.\n"]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec resource = {
  string_set_value : string_list option;
      [@ocaml.doc
        "When the [stringSetValue] type is set, the value of the resource must be a string type.\n"]
  integer_value : integer option;
      [@ocaml.doc
        "When the [integerValue] type is set, the value of the resource must be an integer.\n"]
  long_value : long option;
      [@ocaml.doc
        "When the [longValue] type is set, the value of the resource must be an extended precision \
         floating-point type.\n"]
  double_value : double option;
      [@ocaml.doc
        "When the [doubleValue] type is set, the value of the resource must be a double precision \
         floating-point type.\n"]
  type_ : string_ option;
      [@ocaml.doc
        "The type of the resource. Valid values: [INTEGER], [DOUBLE], [LONG], or [STRINGSET].\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the resource, such as [CPU], [MEMORY], [PORTS], [PORTS_UDP], or a \
         user-defined resource.\n"]
}
[@@ocaml.doc "Describes the resources available for a container instance.\n"]

type nonrec resources = resource list [@@ocaml.doc ""]

type nonrec agent_update_status =
  | FAILED [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | STAGED [@ocaml.doc ""]
  | STAGING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_type = CONTAINER_INSTANCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec attribute = {
  target_id : string_ option;
      [@ocaml.doc
        "The ID of the target. You can specify the short form ID for a resource or the full Amazon \
         Resource Name (ARN).\n"]
  target_type : target_type option;
      [@ocaml.doc
        "The type of the target to attach the attribute with. This parameter is required if you \
         use the short form ID for a resource instead of the full ARN.\n"]
  value : string_ option;
      [@ocaml.doc
        "The value of the attribute. The [value] must contain between 1 and 128 characters. It can \
         contain letters (uppercase and lowercase), numbers, hyphens (-), underscores (_), periods \
         (.), at signs (\\@), forward slashes (/), back slashes (\\), colons (:), or spaces. The \
         value can't start or end with a space.\n"]
  name : string_;
      [@ocaml.doc
        "The name of the attribute. The [name] must contain between 1 and 128 characters. The name \
         may contain letters (uppercase and lowercase), numbers, hyphens (-), underscores (_), \
         forward slashes (/), back slashes (\\), or periods (.).\n"]
}
[@@ocaml.doc
  "An attribute is a name-value pair that's associated with an Amazon ECS object. Use attributes \
   to extend the Amazon ECS data model by adding custom metadata to your resources. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes}Attributes} \
   in the {i Amazon Elastic Container Service Developer Guide}.\n"]

type nonrec attributes = attribute list [@@ocaml.doc ""]

type nonrec attachment_details = key_value_pair list [@@ocaml.doc ""]

type nonrec attachment = {
  details : attachment_details option;
      [@ocaml.doc
        "Details of the attachment.\n\n\
        \ For elastic network interfaces, this includes the network interface ID, the MAC address, \
         the subnet ID, and the private IPv4 address.\n\
        \ \n\
        \  For Service Connect services, this includes [portName], [clientAliases], \
         [discoveryName], and [ingressPortOverride].\n\
        \  \n\
        \   For Elastic Block Storage, this includes [roleArn], [deleteOnTermination], \
         [volumeName], [volumeId], and [statusReason] (only when the attachment fails to create or \
         attach).\n\
        \   "]
  status : string_ option;
      [@ocaml.doc
        " The status of the attachment. Valid values are [PRECREATED], [CREATED], [ATTACHING], \
         [ATTACHED], [DETACHING], [DETACHED], [DELETED], and [FAILED].\n"]
  type_ : string_ option;
      [@ocaml.doc
        "The type of the attachment, such as [ElasticNetworkInterface], [Service Connect], and \
         [AmazonElasticBlockStorage].\n"]
  id : string_ option; [@ocaml.doc "The unique identifier for the attachment.\n"]
}
[@@ocaml.doc "An object representing a container instance or task attachment.\n"]

type nonrec attachments = attachment list [@@ocaml.doc ""]

type nonrec instance_health_check_state =
  | INITIALIZING [@ocaml.doc ""]
  | INSUFFICIENT_DATA [@ocaml.doc ""]
  | IMPAIRED [@ocaml.doc ""]
  | OK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_health_check_type =
  | DAEMON [@ocaml.doc ""]
  | ACCELERATED_COMPUTE [@ocaml.doc ""]
  | CONTAINER_RUNTIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_health_check_result = {
  last_status_change : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for when the container instance health status last changed.\n"]
  last_updated : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for when the container instance health status was last updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "The reason for the container instance health status.\n"]
  status : instance_health_check_state option;
      [@ocaml.doc "The container instance health status.\n"]
  type_ : instance_health_check_type option;
      [@ocaml.doc "The type of container instance health status that was verified.\n"]
}
[@@ocaml.doc "An object representing the result of a container instance health status check.\n"]

type nonrec instance_health_check_result_list = instance_health_check_result list [@@ocaml.doc ""]

type nonrec container_instance_health_status = {
  details : instance_health_check_result_list option;
      [@ocaml.doc
        "An array of objects representing the details of the container instance health status.\n"]
  overall_status : instance_health_check_state option;
      [@ocaml.doc
        "The overall health status of the container instance. This is an aggregate status of all \
         container instance health checks.\n"]
}
[@@ocaml.doc "An object representing the health status of the container instance.\n"]

type nonrec container_instance = {
  health_status : container_instance_health_status option;
      [@ocaml.doc "An object representing the health status of the container instance.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the container instance to help you categorize and organize \
         them. Each tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  attachments : attachments option;
      [@ocaml.doc
        "The resources attached to a container instance, such as an elastic network interface.\n"]
  registered_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the container instance was registered.\n"]
  attributes : attributes option;
      [@ocaml.doc
        "The attributes set for the container instance, either by the Amazon ECS container agent \
         at instance registration or manually with the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAttributes.html}PutAttributes} \
         operation.\n"]
  agent_update_status : agent_update_status option;
      [@ocaml.doc
        "The status of the most recent agent update. If an update wasn't ever requested, this \
         value is [NULL].\n"]
  pending_tasks_count : integer option;
      [@ocaml.doc
        "The number of tasks on the container instance that are in the [PENDING] status.\n"]
  running_tasks_count : integer option;
      [@ocaml.doc
        "The number of tasks on the container instance that have a desired status \
         ([desiredStatus]) of [RUNNING].\n"]
  agent_connected : boolean_ option;
      [@ocaml.doc
        "This parameter returns [true] if the agent is connected to Amazon ECS. An instance with \
         an agent that may be unhealthy or stopped return [false]. Only instances connected to an \
         agent can accept task placement requests.\n"]
  status_reason : string_ option;
      [@ocaml.doc "The reason that the container instance reached its current status.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the container instance. The valid values are [REGISTERING], \
         [REGISTRATION_FAILED], [ACTIVE], [INACTIVE], [DEREGISTERING], or [DRAINING].\n\n\
        \ If your account has opted in to the [awsvpcTrunking] account setting, then any newly \
         registered container instance will transition to a [REGISTERING] status while the trunk \
         elastic network interface is provisioned for the instance. If the registration fails, the \
         instance will transition to a [REGISTRATION_FAILED] status. You can describe the \
         container instance and see the reason for failure in the [statusReason] parameter. Once \
         the container instance is terminated, the instance transitions to a [DEREGISTERING] \
         status while the trunk elastic network interface is deprovisioned. The instance then \
         transitions to an [INACTIVE] status.\n\
        \ \n\
        \  The [ACTIVE] status indicates that the container instance can accept tasks. The \
         [DRAINING] indicates that new tasks aren't placed on the container instance and any \
         service tasks running on the container instance are removed if possible. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-draining.html}Container \
         instance draining} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  "]
  registered_resources : resources option;
      [@ocaml.doc
        "For CPU and memory resource types, this parameter describes the amount of each resource \
         that was available on the container instance when the container agent registered it with \
         Amazon ECS. This value represents the total amount of CPU and memory that can be \
         allocated on this container instance to tasks. For port resource types, this parameter \
         describes the ports that were reserved by the Amazon ECS container agent when it \
         registered the container instance with Amazon ECS.\n"]
  remaining_resources : resources option;
      [@ocaml.doc
        "For CPU and memory resource types, this parameter describes the remaining CPU and memory \
         that wasn't already allocated to tasks and is therefore available for new tasks. For port \
         resource types, this parameter describes the ports that were reserved by the Amazon ECS \
         container agent (at instance registration time) and any task containers that have \
         reserved port mappings on the host (with the [host] or [bridge] network mode). Any port \
         that's not specified here is available for new tasks.\n"]
  version_info : version_info option;
      [@ocaml.doc
        "The version information for the Amazon ECS container agent and Docker daemon running on \
         the container instance.\n"]
  version : long option;
      [@ocaml.doc
        "The version counter for the container instance. Every time a container instance \
         experiences a change that triggers a CloudWatch event, the version counter is \
         incremented. If you're replicating your Amazon ECS container instance state with \
         CloudWatch Events, you can compare the version of a container instance reported by the \
         Amazon ECS APIs with the version reported in CloudWatch Events for the container instance \
         (inside the [detail] object) to verify that the version in your event stream is current.\n"]
  capacity_provider_name : string_ option;
      [@ocaml.doc "The capacity provider that's associated with the container instance.\n"]
  ec2_instance_id : string_ option;
      [@ocaml.doc
        "The ID of the container instance. For Amazon EC2 instances, this value is the Amazon EC2 \
         instance ID. For external instances, this value is the Amazon Web Services Systems \
         Manager managed instance ID.\n"]
  container_instance_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the container instance. For more information about the \
         ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids}Amazon \
         Resource Name (ARN)} in the {i Amazon ECS Developer Guide}.\n"]
}
[@@ocaml.doc
  "An Amazon EC2 or External instance that's running the Amazon ECS agent and has been registered \
   with a cluster.\n"]

type nonrec container_instances = container_instance list [@@ocaml.doc ""]

type nonrec update_container_instances_state_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  container_instances : container_instances option; [@ocaml.doc "The list of container instances.\n"]
}
[@@ocaml.doc ""]

type nonrec container_instance_status =
  | REGISTRATION_FAILED [@ocaml.doc ""]
  | DEREGISTERING [@ocaml.doc ""]
  | REGISTERING [@ocaml.doc ""]
  | DRAINING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_container_instances_state_request = {
  status : container_instance_status;
      [@ocaml.doc
        "The container instance state to update the container instance with. The only valid values \
         for this action are [ACTIVE] and [DRAINING]. A container instance can only be updated to \
         [DRAINING] status once it has reached an [ACTIVE] state. If a container instance is in \
         [REGISTERING], [DEREGISTERING], or [REGISTRATION_FAILED] state you can describe the \
         container instance but can't update the container instance state.\n"]
  container_instances : string_list;
      [@ocaml.doc "A list of up to 10 container instance IDs or full ARN entries.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container \
         instance to update. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec update_container_agent_response = {
  container_instance : container_instance option;
      [@ocaml.doc "The container instance that the container agent was updated for.\n"]
}
[@@ocaml.doc ""]

type nonrec update_container_agent_request = {
  container_instance : string_;
      [@ocaml.doc
        "The container instance ID or full ARN entries for the container instance where you would \
         like to update the Amazon ECS container agent.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that your container \
         instance is running on. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec no_update_available_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "There's no update available for this Amazon ECS container agent. This might be because the \
   agent is already running the latest version or because it's so old that there's no update path \
   to the current version.\n"]

type nonrec missing_version_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "Amazon ECS can't determine the current version of the Amazon ECS container agent on the \
   container instance and doesn't have enough information to proceed with an update. This could be \
   because the agent running on the container instance is a previous or custom version that \
   doesn't use our version information.\n"]

type nonrec execute_command_logging =
  | OVERRIDE [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execute_command_log_configuration = {
  s3_key_prefix : string_ option;
      [@ocaml.doc "An optional folder in the S3 bucket to place logs in.\n"]
  s3_encryption_enabled : boolean_ option;
      [@ocaml.doc
        "Determines whether to use encryption on the S3 logs. If not specified, encryption is not \
         used.\n"]
  s3_bucket_name : string_ option;
      [@ocaml.doc
        "The name of the S3 bucket to send logs to.\n\n\
        \  The S3 bucket must already be created.\n\
        \  \n\
        \   "]
  cloud_watch_encryption_enabled : boolean_ option;
      [@ocaml.doc
        "Determines whether to use encryption on the CloudWatch logs. If not specified, encryption \
         will be off.\n"]
  cloud_watch_log_group_name : string_ option;
      [@ocaml.doc
        "The name of the CloudWatch log group to send logs to.\n\n\
        \  The CloudWatch log group must already be created.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The log configuration for the results of the execute command actions. The logs can be sent to \
   CloudWatch Logs or an Amazon S3 bucket.\n"]

type nonrec execute_command_configuration = {
  log_configuration : execute_command_log_configuration option;
      [@ocaml.doc
        "The log configuration for the results of the execute command actions. The logs can be \
         sent to CloudWatch Logs or an Amazon S3 bucket. When [logging=OVERRIDE] is specified, a \
         [logConfiguration] must be provided.\n"]
  logging : execute_command_logging option;
      [@ocaml.doc
        "The log setting to use for redirecting logs for your execute command results. The \
         following log settings are available.\n\n\
        \ {ul\n\
        \       {-   [NONE]: The execute command session is not logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DEFAULT]: The [awslogs] configuration in the task definition is used. If no \
         logging parameter is specified, it defaults to this value. If no [awslogs] log driver is \
         configured in the task definition, the output won't be logged.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERRIDE]: Specify the logging details as a part of [logConfiguration]. If \
         the [OVERRIDE] logging option is specified, the [logConfiguration] is required.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "Specify an Key Management Service key ID to encrypt the data between the local client and \
         the container.\n"]
}
[@@ocaml.doc "The details of the execute command configuration.\n"]

type nonrec managed_storage_configuration = {
  fargate_ephemeral_storage_kms_key_id : string_ option;
      [@ocaml.doc
        "Specify the Key Management Service key ID for Fargate ephemeral storage.\n\n\
        \ When you specify a [fargateEphemeralStorageKmsKeyId], Amazon Web Services Fargate uses \
         the key to encrypt data at rest in ephemeral storage. For more information about Fargate \
         ephemeral storage encryption, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-storage-encryption.html}Customer \
         managed keys for Amazon Web Services Fargate ephemeral storage for Amazon ECS} in the {i \
         Amazon Elastic Container Service Developer Guide}.\n\
        \ \n\
        \  The key must be a single Region key.\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "Specify a Key Management Service key ID to encrypt Amazon ECS managed storage.\n\n\
        \  When you specify a [kmsKeyId], Amazon ECS uses the key to encrypt data volumes managed \
         by Amazon ECS that are attached to tasks in the cluster. The following data volumes are \
         managed by Amazon ECS: Amazon EBS. For more information about encryption of Amazon EBS \
         volumes attached to Amazon ECS tasks, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-kms-encryption.html}Encrypt \
         data stored in Amazon EBS volumes for Amazon ECS} in the {i Amazon Elastic Container \
         Service Developer Guide}.\n\
        \ \n\
        \  The key must be a single Region key.\n\
        \  "]
}
[@@ocaml.doc "The managed storage configuration for the cluster.\n"]

type nonrec cluster_configuration = {
  managed_storage_configuration : managed_storage_configuration option;
      [@ocaml.doc "The details of the managed storage configuration.\n"]
  execute_command_configuration : execute_command_configuration option;
      [@ocaml.doc "The details of the execute command configuration.\n"]
}
[@@ocaml.doc "The execute command and managed storage configuration for the cluster.\n"]

type nonrec statistics = key_value_pair list [@@ocaml.doc ""]

type nonrec cluster_setting_name = CONTAINER_INSIGHTS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cluster_setting = {
  value : string_ option;
      [@ocaml.doc
        "The value to set for the cluster setting. The supported values are [enhanced], [enabled], \
         and [disabled]. \n\n\
        \ To use Container Insights with enhanced observability, set the [containerInsights] \
         account setting to [enhanced].\n\
        \ \n\
        \  To use Container Insights, set the [containerInsights] account setting to [enabled].\n\
        \  \n\
        \   If a cluster value is specified, it will override the [containerInsights] value set \
         with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSetting.html}PutAccountSetting} \
         or \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSettingDefault.html}PutAccountSettingDefault}.\n\
        \   "]
  name : cluster_setting_name option;
      [@ocaml.doc "The name of the cluster setting. The value is [containerInsights].\n"]
}
[@@ocaml.doc
  "The settings to use when creating a cluster. This parameter is used to turn on CloudWatch \
   Container Insights with enhanced observability or CloudWatch Container Insights for a cluster.\n\n\
  \ Container Insights with enhanced observability provides all the Container Insights metrics, \
   plus additional task and container metrics. This version supports enhanced observability for \
   Amazon ECS clusters using the Amazon EC2 and Fargate launch types. After you configure \
   Container Insights with enhanced observability on Amazon ECS, Container Insights auto-collects \
   detailed infrastructure telemetry from the cluster level down to the container level in your \
   environment and displays these critical performance data in curated dashboards removing the \
   heavy lifting in observability set-up. \n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html}Monitor \
   Amazon ECS containers using Container Insights with enhanced observability} in the {i Amazon \
   Elastic Container Service Developer Guide}.\n\
  \  "]

type nonrec cluster_settings = cluster_setting list [@@ocaml.doc ""]

type nonrec cluster_service_connect_defaults = {
  namespace : string_ option;
      [@ocaml.doc
        "The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace. When \
         you create a service and don't specify a Service Connect configuration, this namespace is \
         used.\n"]
}
[@@ocaml.doc
  "Use this parameter to set a default Service Connect namespace. After you set a default Service \
   Connect namespace, any new services with Service Connect turned on that are created in the \
   cluster are added as client services in the namespace. This setting only applies to new \
   services that set the [enabled] parameter to [true] in the [ServiceConnectConfiguration]. You \
   can set the namespace of each service individually in the [ServiceConnectConfiguration] to \
   override this default parameter.\n\n\
  \ Tasks that run in a namespace can use short names to connect to services in the namespace. \
   Tasks can connect to services across all of the clusters in the namespace. Tasks connect \
   through a managed proxy container that collects logs and metrics for increased visibility. Only \
   the tasks that Amazon ECS services create are supported with Service Connect. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
   Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

type nonrec cluster = {
  service_connect_defaults : cluster_service_connect_defaults option;
      [@ocaml.doc
        "Use this parameter to set a default Service Connect namespace. After you set a default \
         Service Connect namespace, any new services with Service Connect turned on that are \
         created in the cluster are added as client services in the namespace. This setting only \
         applies to new services that set the [enabled] parameter to [true] in the \
         [ServiceConnectConfiguration]. You can set the namespace of each service individually in \
         the [ServiceConnectConfiguration] to override this default parameter.\n\n\
        \ Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  attachments_status : string_ option;
      [@ocaml.doc
        "The status of the capacity providers associated with the cluster. The following are the \
         states that are returned.\n\n\
        \  UPDATE_IN_PROGRESS  The available capacity providers for the cluster are updating.\n\
        \                      \n\
        \                        UPDATE_COMPLETE  The capacity providers have successfully updated.\n\
        \                                         \n\
        \                                           UPDATE_FAILED  The capacity provider updates \
         failed.\n\
        \                                                          \n\
        \                                                            "]
  attachments : attachments option;
      [@ocaml.doc
        "The resources attached to a cluster. When using a capacity provider with a cluster, the \
         capacity provider and associated resources are returned as cluster attachments.\n"]
  default_capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The default capacity provider strategy for the cluster. When services or tasks are run in \
         the cluster with no launch type or capacity provider strategy specified, the default \
         capacity provider strategy is used.\n"]
  capacity_providers : string_list option;
      [@ocaml.doc "The capacity providers associated with the cluster.\n"]
  settings : cluster_settings option;
      [@ocaml.doc
        "The settings for the cluster. This parameter indicates whether CloudWatch Container \
         Insights is on or off for a cluster.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the cluster to help you categorize and organize them. Each \
         tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  statistics : statistics option;
      [@ocaml.doc
        "Additional information about your clusters that are separated by launch type. They \
         include the following:\n\n\
        \ {ul\n\
        \       {-  runningEC2TasksCount\n\
        \           \n\
        \            }\n\
        \       {-  RunningFargateTasksCount\n\
        \           \n\
        \            }\n\
        \       {-  pendingEC2TasksCount\n\
        \           \n\
        \            }\n\
        \       {-  pendingFargateTasksCount\n\
        \           \n\
        \            }\n\
        \       {-  activeEC2ServiceCount\n\
        \           \n\
        \            }\n\
        \       {-  activeFargateServiceCount\n\
        \           \n\
        \            }\n\
        \       {-  drainingEC2ServiceCount\n\
        \           \n\
        \            }\n\
        \       {-  drainingFargateServiceCount\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  active_services_count : integer option;
      [@ocaml.doc
        "The number of services that are running on the cluster in an [ACTIVE] state. You can view \
         these services with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListServices.html}ListServices}.\n"]
  pending_tasks_count : integer option;
      [@ocaml.doc "The number of tasks in the cluster that are in the [PENDING] state.\n"]
  running_tasks_count : integer option;
      [@ocaml.doc "The number of tasks in the cluster that are in the [RUNNING] state.\n"]
  registered_container_instances_count : integer option;
      [@ocaml.doc
        "The number of container instances registered into the cluster. This includes container \
         instances in both [ACTIVE] and [DRAINING] status.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the cluster. The following are the possible states that are returned.\n\n\
        \  ACTIVE  The cluster is ready to accept tasks and if applicable you can register \
         container instances with the cluster.\n\
        \          \n\
        \            PROVISIONING  The cluster has capacity providers that are associated with it \
         and the resources needed for the capacity provider are being created.\n\
        \                          \n\
        \                            DEPROVISIONING  The cluster has capacity providers that are \
         associated with it and the resources needed for the capacity provider are being deleted.\n\
        \                                            \n\
        \                                              FAILED  The cluster has capacity providers \
         that are associated with it and the resources needed for the capacity provider have \
         failed to create.\n\
        \                                                      \n\
        \                                                        INACTIVE  The cluster has been \
         deleted. Clusters with an [INACTIVE] status may remain discoverable in your account for a \
         period of time. However, this behavior is subject to change in the future. We don't \
         recommend that you rely on [INACTIVE] clusters persisting.\n\
        \                                                                  \n\
        \                                                                    "]
  configuration : cluster_configuration option;
      [@ocaml.doc "The execute command and managed storage configuration for the cluster.\n"]
  cluster_name : string_ option;
      [@ocaml.doc "A user-generated string that you use to identify your cluster.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the cluster. For more information about \
         the ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids}Amazon \
         Resource Name (ARN)} in the {i Amazon ECS Developer Guide}.\n"]
}
[@@ocaml.doc
  "A regional grouping of one or more container instances where you can run task requests. Each \
   account receives a default cluster the first time you use the Amazon ECS service, but you may \
   also create other clusters. Clusters may contain more than one instance type simultaneously.\n"]

type nonrec update_cluster_settings_response = {
  cluster : cluster option; [@ocaml.doc "Details about the cluster\n"]
}
[@@ocaml.doc ""]

type nonrec update_cluster_settings_request = {
  settings : cluster_settings;
      [@ocaml.doc
        "The setting to use by default for a cluster. This parameter is used to turn on CloudWatch \
         Container Insights for a cluster. If this value is specified, it overrides the \
         [containerInsights] value set with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSetting.html}PutAccountSetting} \
         or \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSettingDefault.html}PutAccountSettingDefault}.\n\n\
        \  Currently, if you delete an existing cluster that does not have Container Insights \
         turned on, and then create a new cluster with the same name with Container Insights tuned \
         on, Container Insights will not actually be turned on. If you want to preserve the same \
         name for your existing cluster and turn on Container Insights, you must wait 7 days \
         before you can re-create it.\n\
        \  \n\
        \   "]
  cluster : string_; [@ocaml.doc "The name of the cluster to modify the settings for.\n"]
}
[@@ocaml.doc ""]

type nonrec update_cluster_response = {
  cluster : cluster option; [@ocaml.doc "Details about the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_service_connect_defaults_request = {
  namespace : string_;
      [@ocaml.doc
        "The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace that's \
         used when you create a service and don't specify a Service Connect configuration. The \
         namespace name can include up to 1024 characters. The name is case-sensitive. The name \
         can't include greater than (>), less than (<), double quotation marks (\"), or slash \
         (/).\n\n\
        \ If you enter an existing namespace name or ARN, then that namespace will be used. Any \
         namespace type is supported. The namespace must be in this account and this Amazon Web \
         Services Region.\n\
        \ \n\
        \  If you enter a new name, a Cloud Map namespace will be created. Amazon ECS creates a \
         Cloud Map namespace with the \"API calls\" method of instance discovery only. This \
         instance discovery method is the \"HTTP\" namespace type in the Command Line Interface. \
         Other types of instance discovery aren't used by Service Connect.\n\
        \  \n\
        \   If you update the cluster with an empty string [\"\"] for the namespace name, the \
         cluster configuration for Service Connect is removed. Note that the namespace will remain \
         in Cloud Map and must be deleted separately.\n\
        \   \n\
        \    For more information about Cloud Map, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/dg/working-with-services.html}Working \
         with Services} in the {i Cloud Map Developer Guide}.\n\
        \    "]
}
[@@ocaml.doc
  "Use this parameter to set a default Service Connect namespace. After you set a default Service \
   Connect namespace, any new services with Service Connect turned on that are created in the \
   cluster are added as client services in the namespace. This setting only applies to new \
   services that set the [enabled] parameter to [true] in the [ServiceConnectConfiguration]. You \
   can set the namespace of each service individually in the [ServiceConnectConfiguration] to \
   override this default parameter.\n\n\
  \ Tasks that run in a namespace can use short names to connect to services in the namespace. \
   Tasks can connect to services across all of the clusters in the namespace. Tasks connect \
   through a managed proxy container that collects logs and metrics for increased visibility. Only \
   the tasks that Amazon ECS services create are supported with Service Connect. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
   Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

type nonrec update_cluster_request = {
  service_connect_defaults : cluster_service_connect_defaults_request option;
      [@ocaml.doc
        "Use this parameter to set a default Service Connect namespace. After you set a default \
         Service Connect namespace, any new services with Service Connect turned on that are \
         created in the cluster are added as client services in the namespace. This setting only \
         applies to new services that set the [enabled] parameter to [true] in the \
         [ServiceConnectConfiguration]. You can set the namespace of each service individually in \
         the [ServiceConnectConfiguration] to override this default parameter.\n\n\
        \ Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  configuration : cluster_configuration option;
      [@ocaml.doc "The execute command configuration for the cluster.\n"]
  settings : cluster_settings option; [@ocaml.doc "The cluster settings for your cluster.\n"]
  cluster : string_; [@ocaml.doc "The name of the cluster to modify the settings for.\n"]
}
[@@ocaml.doc ""]

type nonrec capacity_provider_status =
  | INACTIVE [@ocaml.doc ""]
  | DEPROVISIONING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_scaling_status = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_scaling_target_capacity = int [@@ocaml.doc ""]

type nonrec managed_scaling_step_size = int [@@ocaml.doc ""]

type nonrec managed_scaling_instance_warmup_period = int [@@ocaml.doc ""]

type nonrec managed_scaling = {
  instance_warmup_period : managed_scaling_instance_warmup_period option;
      [@ocaml.doc
        "The period of time, in seconds, after a newly launched Amazon EC2 instance can contribute \
         to CloudWatch metrics for Auto Scaling group. If this parameter is omitted, the default \
         value of [300] seconds is used.\n"]
  maximum_scaling_step_size : managed_scaling_step_size option;
      [@ocaml.doc
        "The maximum number of Amazon EC2 instances that Amazon ECS will scale out at one time. If \
         this parameter is omitted, the default value of [10000] is used.\n"]
  minimum_scaling_step_size : managed_scaling_step_size option;
      [@ocaml.doc
        "The minimum number of Amazon EC2 instances that Amazon ECS will scale out at one time. \
         The scale in process is not affected by this parameter If this parameter is omitted, the \
         default value of [1] is used.\n\n\
        \ When additional capacity is required, Amazon ECS will scale up the minimum scaling step \
         size even if the actual demand is less than the minimum scaling step size.\n\
        \ "]
  target_capacity : managed_scaling_target_capacity option;
      [@ocaml.doc
        "The target capacity utilization as a percentage for the capacity provider. The specified \
         value must be greater than [0] and less than or equal to [100]. For example, if you want \
         the capacity provider to maintain 10% spare capacity, then that means the utilization is \
         90%, so use a [targetCapacity] of [90]. The default value of [100] percent results in the \
         Amazon EC2 instances in your Auto Scaling group being completely used.\n"]
  status : managed_scaling_status option;
      [@ocaml.doc "Determines whether to use managed scaling for the capacity provider.\n"]
}
[@@ocaml.doc
  "The managed scaling settings for the Auto Scaling group capacity provider.\n\n\
  \ When managed scaling is turned on, Amazon ECS manages the scale-in and scale-out actions of \
   the Auto Scaling group. Amazon ECS manages a target tracking scaling policy using an Amazon ECS \
   managed CloudWatch metric with the specified [targetCapacity] value as the target value for the \
   metric. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/asg-capacity-providers.html#asg-capacity-providers-managed-scaling}Using \
   managed scaling} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ \n\
  \  If managed scaling is off, the user must manage the scaling of the Auto Scaling group.\n\
  \  "]

type nonrec managed_termination_protection = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_draining = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec auto_scaling_group_provider = {
  managed_draining : managed_draining option;
      [@ocaml.doc
        "The managed draining option for the Auto Scaling group capacity provider. When you enable \
         this, Amazon ECS manages and gracefully drains the EC2 container instances that are in \
         the Auto Scaling group capacity provider.\n"]
  managed_termination_protection : managed_termination_protection option;
      [@ocaml.doc
        "The managed termination protection setting to use for the Auto Scaling group capacity \
         provider. This determines whether the Auto Scaling group has managed termination \
         protection. The default is off.\n\n\
        \  When using managed termination protection, managed scaling must also be used otherwise \
         managed termination protection doesn't work.\n\
        \  \n\
        \    When managed termination protection is on, Amazon ECS prevents the Amazon EC2 \
         instances in an Auto Scaling group that contain tasks from being terminated during a \
         scale-in action. The Auto Scaling group and each instance in the Auto Scaling group must \
         have instance protection from scale-in actions on as well. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection}Instance \
         Protection} in the {i Auto Scaling User Guide}.\n\
        \    \n\
        \     When managed termination protection is off, your Amazon EC2 instances aren't \
         protected from termination when the Auto Scaling group scales in.\n\
        \     "]
  managed_scaling : managed_scaling option;
      [@ocaml.doc "The managed scaling settings for the Auto Scaling group capacity provider.\n"]
  auto_scaling_group_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the Auto Scaling group, or the Auto \
         Scaling group name.\n"]
}
[@@ocaml.doc "The details of the Auto Scaling group for the capacity provider.\n"]

type nonrec capacity_option_type =
  | RESERVED [@ocaml.doc ""]
  | SPOT [@ocaml.doc ""]
  | ON_DEMAND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_launch_template = {
  capacity_reservations : capacity_reservation_request option;
      [@ocaml.doc
        "Capacity reservation specifications. You can specify:\n\n\
        \ {ul\n\
        \       {-  Capacity reservation preference\n\
        \           \n\
        \            }\n\
        \       {-  Reservation resource group to be used for targeted capacity reservations\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Amazon ECS will launch instances according to the specified criteria.\n\
        \   "]
  fips_enabled : boxed_boolean option;
      [@ocaml.doc
        "Determines whether to enable FIPS 140-2 validated cryptographic modules on EC2 instances \
         launched by the capacity provider. If [true], instances use FIPS-compliant cryptographic \
         algorithms and modules for enhanced security compliance. If [false], instances use \
         standard cryptographic implementations.\n\n\
        \ If not specified, instances are launched with FIPS enabled in Amazon Web Services \
         GovCloud (US) regions and FIPS disabled in other regions.\n\
        \ "]
  instance_requirements : instance_requirements_request option;
      [@ocaml.doc
        "The instance requirements. You can specify:\n\n\
        \ {ul\n\
        \       {-  The instance types\n\
        \           \n\
        \            }\n\
        \       {-  Instance requirements such as vCPU count, memory, network performance, and \
         accelerator specifications\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Amazon ECS automatically selects the instances that match the specified criteria.\n\
        \   "]
  instance_metadata_tags_propagation : boxed_boolean option;
      [@ocaml.doc
        "Determines whether tags are propagated to the instance metadata service (IMDS) for Amazon \
         EC2 instances launched by the Managed Instances capacity provider. When enabled, all tags \
         associated with the instance are available through the instance metadata service. When \
         disabled, tags are not propagated to IMDS.\n\n\
        \ Disable this setting if your tags contain characters that are not compatible with IMDS, \
         such as [/]. IMDS requires tag keys to match the pattern \
         [\\[0-9a-zA-Z\\-_+=,.@:\\]{1,255}].\n\
        \ \n\
        \  The default value is [true].\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#work-with-tags-in-IMDS}Work \
         with instance tags in instance metadata} in the {i Amazon EC2 User Guide}.\n\
        \   "]
  capacity_option_type : capacity_option_type option;
      [@ocaml.doc
        "The capacity option type. This determines whether Amazon ECS launches On-Demand, Spot or \
         Capacity Reservation Instances for your managed instance capacity provider.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ON_DEMAND] - Launches standard On-Demand Instances. On-Demand Instances \
         provide predictable pricing and availability.\n\
        \            \n\
        \             }\n\
        \        {-   [SPOT] - Launches Spot Instances that use spare Amazon EC2 capacity at \
         reduced cost. Spot Instances can be interrupted by Amazon EC2 with a two-minute \
         notification when the capacity is needed back.\n\
        \            \n\
        \             }\n\
        \        {-   [RESERVED] - Launches Instances using Amazon EC2 Capacity Reservations. \
         Capacity Reservations allow you to reserve compute capacity for Amazon EC2 instances in a \
         specific Availability Zone.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The default is On-Demand\n\
        \   \n\
        \    For more information about Amazon EC2 capacity options, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html}Instance \
         purchasing options} in the {i Amazon EC2 User Guide}.\n\
        \    "]
  monitoring : managed_instances_monitoring_options option;
      [@ocaml.doc
        "CloudWatch provides two categories of monitoring: basic monitoring and detailed \
         monitoring. By default, your managed instance is configured for basic monitoring. You can \
         optionally enable detailed monitoring to help you more quickly identify and act on \
         operational issues. You can enable or turn off detailed monitoring at launch or when the \
         managed instance is running or stopped. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/detailed-monitoring-managed-instances.html}Detailed \
         monitoring for Amazon ECS Managed Instances} in the Amazon ECS Developer Guide.\n"]
  local_storage_configuration : managed_instances_local_storage_configuration option;
      [@ocaml.doc
        "The local storage configuration for Amazon ECS Managed Instances. This defines how ECS \
         uses instance store volumes available on the container instance.\n"]
  storage_configuration : managed_instances_storage_configuration option;
      [@ocaml.doc
        "The storage configuration for Amazon ECS Managed Instances. This defines the data volume \
         properties for the instances.\n"]
  network_configuration : managed_instances_network_configuration;
      [@ocaml.doc
        "The network configuration for Amazon ECS Managed Instances. This specifies the subnets \
         and security groups that instances use for network connectivity.\n"]
  ec2_instance_profile_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the instance profile that Amazon ECS applies to Amazon \
         ECS Managed Instances. This instance profile must include the necessary permissions for \
         your tasks to access Amazon Web Services services and resources.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/managed-instances-instance-profile.html}Amazon \
         ECS instance profile for Managed Instances} in the {i Amazon ECS Developer Guide}. \n\
        \ "]
}
[@@ocaml.doc
  "The launch template configuration for Amazon ECS Managed Instances. This defines how Amazon ECS \
   launches Amazon EC2 instances, including the instance profile for your tasks, network and \
   storage configuration, capacity options, and instance requirements for flexible instance type \
   selection.\n"]

type nonrec managed_instances_provider = {
  auto_repair_configuration : auto_repair_configuration option;
      [@ocaml.doc
        "The auto repair configuration for the Amazon ECS Managed Instances capacity provider. \
         Indicates whether Amazon ECS automatically replaces container instances that are detected \
         as unhealthy.\n"]
  infrastructure_optimization : infrastructure_optimization option;
      [@ocaml.doc
        "Defines how Amazon ECS Managed Instances optimizes the infrastastructure in your capacity \
         provider. Configure it to turn on or off the infrastructure optimization in your capacity \
         provider, and to control the idle or underutilized EC2 instances optimization delay.\n"]
  propagate_tags : propagate_mi_tags option;
      [@ocaml.doc
        "Determines whether tags from the capacity provider are automatically applied to Amazon \
         ECS Managed Instances. This helps with cost allocation and resource management by \
         ensuring consistent tagging across your infrastructure.\n"]
  instance_launch_template : instance_launch_template option;
      [@ocaml.doc
        "The launch template that defines how Amazon ECS launches Amazon ECS Managed Instances. \
         This includes the instance profile for your tasks, network and storage configuration, and \
         instance requirements that determine which Amazon EC2 instance types can be used.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html}Store \
         instance launch parameters in Amazon EC2 launch templates} in the {i Amazon EC2 User \
         Guide}.\n\
        \ "]
  infrastructure_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the infrastructure role that Amazon ECS assumes to \
         manage instances. This role must include permissions for Amazon EC2 instance lifecycle \
         management, networking, and any additional Amazon Web Services services required for your \
         workloads.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html}Amazon \
         ECS infrastructure IAM role} in the {i Amazon ECS Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "The configuration for a Amazon ECS Managed Instances provider. Amazon ECS uses this \
   configuration to automatically launch, manage, and terminate Amazon EC2 instances on your \
   behalf. Managed instances provide access to the full range of Amazon EC2 instance types and \
   features while offloading infrastructure management to Amazon Web Services.\n"]

type nonrec capacity_provider_update_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_COMPLETE [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_provider_type =
  | FARGATE_SPOT [@ocaml.doc ""]
  | FARGATE [@ocaml.doc ""]
  | MANAGED_INSTANCES [@ocaml.doc ""]
  | EC2_AUTOSCALING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_provider = {
  type_ : capacity_provider_type option;
      [@ocaml.doc
        "The type of capacity provider. For Amazon ECS Managed Instances, this value is \
         [MANAGED_INSTANCES], indicating that Amazon ECS manages the underlying Amazon EC2 \
         instances on your behalf.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the capacity provider to help you categorize and organize \
         it. Each tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  update_status_reason : string_ option;
      [@ocaml.doc
        "The update status reason. This provides further details about the update status for the \
         capacity provider.\n"]
  update_status : capacity_provider_update_status option;
      [@ocaml.doc
        "The update status of the capacity provider. The following are the possible states that is \
         returned.\n\n\
        \  DELETE_IN_PROGRESS  The capacity provider is in the process of being deleted.\n\
        \                      \n\
        \                        DELETE_COMPLETE  The capacity provider was successfully deleted \
         and has an [INACTIVE] status.\n\
        \                                         \n\
        \                                           DELETE_FAILED  The capacity provider can't be \
         deleted. The update status reason provides further details about why the delete failed.\n\
        \                                                          \n\
        \                                                            "]
  managed_instances_provider : managed_instances_provider option;
      [@ocaml.doc
        "The configuration for the Amazon ECS Managed Instances provider. This includes the \
         infrastructure role, the launch template configuration, and tag propagation settings.\n"]
  auto_scaling_group_provider : auto_scaling_group_provider option;
      [@ocaml.doc "The Auto Scaling group settings for the capacity provider.\n"]
  status : capacity_provider_status option;
      [@ocaml.doc
        "The current status of the capacity provider. Only capacity providers in an [ACTIVE] state \
         can be used in a cluster. When a capacity provider is successfully deleted, it has an \
         [INACTIVE] status.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The cluster that this capacity provider is associated with. Managed instances capacity \
         providers are cluster-scoped, meaning they can only be used within their associated \
         cluster.\n\n\
        \ This is required for Managed instances.\n\
        \ "]
  name : string_ option; [@ocaml.doc "The name of the capacity provider.\n"]
  capacity_provider_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the capacity provider.\n"]
}
[@@ocaml.doc "The details for a capacity provider.\n"]

type nonrec update_capacity_provider_response = {
  capacity_provider : capacity_provider option; [@ocaml.doc "Details about the capacity provider.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_group_provider_update = {
  managed_draining : managed_draining option;
      [@ocaml.doc
        "The managed draining option for the Auto Scaling group capacity provider. When you enable \
         this, Amazon ECS manages and gracefully drains the EC2 container instances that are in \
         the Auto Scaling group capacity provider.\n"]
  managed_termination_protection : managed_termination_protection option;
      [@ocaml.doc
        "The managed termination protection setting to use for the Auto Scaling group capacity \
         provider. This determines whether the Auto Scaling group has managed termination \
         protection.\n\n\
        \  When using managed termination protection, managed scaling must also be used otherwise \
         managed termination protection doesn't work.\n\
        \  \n\
        \    When managed termination protection is on, Amazon ECS prevents the Amazon EC2 \
         instances in an Auto Scaling group that contain tasks from being terminated during a \
         scale-in action. The Auto Scaling group and each instance in the Auto Scaling group must \
         have instance protection from scale-in actions on. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection}Instance \
         Protection} in the {i Auto Scaling User Guide}.\n\
        \    \n\
        \     When managed termination protection is off, your Amazon EC2 instances aren't \
         protected from termination when the Auto Scaling group scales in.\n\
        \     "]
  managed_scaling : managed_scaling option;
      [@ocaml.doc "The managed scaling settings for the Auto Scaling group capacity provider.\n"]
}
[@@ocaml.doc "The details of the Auto Scaling group capacity provider to update.\n"]

type nonrec update_capacity_provider_request = {
  managed_instances_provider : update_managed_instances_provider_configuration option;
      [@ocaml.doc
        "The updated configuration for the Amazon ECS Managed Instances provider. You can modify \
         the infrastructure role, instance launch template, and tag propagation settings. Changes \
         take effect for new instances launched after the update.\n"]
  auto_scaling_group_provider : auto_scaling_group_provider_update option;
      [@ocaml.doc
        "An object that represent the parameters to update for the Auto Scaling group capacity \
         provider.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The name of the cluster that contains the capacity provider to update. Managed instances \
         capacity providers are cluster-scoped and can only be updated within their associated \
         cluster.\n"]
  name : string_; [@ocaml.doc "The name of the capacity provider to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys; [@ocaml.doc "The keys of the tags to be removed.\n"]
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to delete tags from. Currently, the \
         supported resources are Amazon ECS capacity providers, tasks, services, task definitions, \
         clusters, and container instances.\n"]
}
[@@ocaml.doc ""]

type nonrec ulimit_name =
  | STACK [@ocaml.doc ""]
  | SIGPENDING [@ocaml.doc ""]
  | RTTIME [@ocaml.doc ""]
  | RTPRIO [@ocaml.doc ""]
  | RSS [@ocaml.doc ""]
  | NPROC [@ocaml.doc ""]
  | NOFILE [@ocaml.doc ""]
  | NICE [@ocaml.doc ""]
  | MSGQUEUE [@ocaml.doc ""]
  | MEMLOCK [@ocaml.doc ""]
  | LOCKS [@ocaml.doc ""]
  | FSIZE [@ocaml.doc ""]
  | DATA [@ocaml.doc ""]
  | CPU [@ocaml.doc ""]
  | CORE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ulimit = {
  hard_limit : integer;
      [@ocaml.doc
        "The hard limit for the [ulimit] type. The value can be specified in bytes, seconds, or as \
         a count, depending on the [type] of the [ulimit].\n"]
  soft_limit : integer;
      [@ocaml.doc
        "The soft limit for the [ulimit] type. The value can be specified in bytes, seconds, or as \
         a count, depending on the [type] of the [ulimit].\n"]
  name : ulimit_name; [@ocaml.doc "The [type] of the [ulimit].\n"]
}
[@@ocaml.doc
  "The [ulimit] settings to pass to the container.\n\n\
  \ Amazon ECS tasks hosted on Fargate use the default resource limit values set by the operating \
   system with the exception of the [nofile] resource limit parameter which Fargate overrides. The \
   [nofile] resource limit sets a restriction on the number of open files that a container can \
   use. The default [nofile] soft limit is [ 65535] and the default hard limit is [65535].\n\
  \ \n\
  \  You can specify the [ulimit] settings for a container in a task definition.\n\
  \  "]

type nonrec ulimit_list = ulimit list [@@ocaml.doc ""]

type nonrec transport_protocol = UDP [@ocaml.doc ""] | TCP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec tmpfs = {
  mount_options : string_list option;
      [@ocaml.doc
        "The list of tmpfs volume mount options.\n\n\
        \ Valid values: [\"defaults\" | \"ro\" | \"rw\" | \"suid\" | \"nosuid\" | \"dev\" | \
         \"nodev\" | \"exec\" | \"noexec\" | \"sync\" | \"async\" | \"dirsync\" | \"remount\" | \
         \"mand\" | \"nomand\" | \"atime\" | \"noatime\" | \"diratime\" | \"nodiratime\" | \
         \"bind\" | \"rbind\" | \"unbindable\" | \"runbindable\" | \"private\" | \"rprivate\" | \
         \"shared\" | \"rshared\" | \"slave\" | \"rslave\" | \"relatime\" | \"norelatime\" | \
         \"strictatime\" | \"nostrictatime\" | \"mode\" | \"uid\" | \"gid\" | \"nr_inodes\" | \
         \"nr_blocks\" | \"mpol\"] \n\
        \ "]
  size : integer; [@ocaml.doc "The maximum size (in MiB) of the tmpfs volume.\n"]
  container_path : string_;
      [@ocaml.doc "The absolute file path where the tmpfs volume is to be mounted.\n"]
}
[@@ocaml.doc "The container path, mount options, and size of the tmpfs mount.\n"]

type nonrec tmpfs_list = tmpfs list [@@ocaml.doc ""]

type nonrec connectivity = DISCONNECTED [@ocaml.doc ""] | CONNECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_binding = {
  host_port_range : string_ option;
      [@ocaml.doc
        "The port number range on the host that's used with the network binding. This is assigned \
         is assigned by Docker and delivered by the Amazon ECS agent.\n"]
  container_port_range : string_ option;
      [@ocaml.doc
        "The port number range on the container that's bound to the dynamically mapped host port \
         range.\n\n\
        \ The following rules apply when you specify a [containerPortRange]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You must use either the [bridge] network mode or the [awsvpc] network mode.\n\
        \            \n\
        \             }\n\
        \        {-  This parameter is available for both the EC2 and Fargate launch types.\n\
        \            \n\
        \             }\n\
        \        {-  This parameter is available for both the Linux and Windows operating systems.\n\
        \            \n\
        \             }\n\
        \        {-  The container instance must have at least version 1.67.0 of the container \
         agent and at least version 1.67.0-1 of the [ecs-init] package \n\
        \            \n\
        \             }\n\
        \        {-  You can specify a maximum of 100 port ranges per container.\n\
        \            \n\
        \             }\n\
        \        {-  You do not specify a [hostPortRange]. The value of the [hostPortRange] is set \
         as follows:\n\
        \            \n\
        \             {ul\n\
        \                   {-  For containers in a task with the [awsvpc] network mode, the \
         [hostPortRange] is set to the same value as the [containerPortRange]. This is a static \
         mapping strategy.\n\
        \                       \n\
        \                        }\n\
        \                   {-  For containers in a task with the [bridge] network mode, the \
         Amazon ECS agent finds open host ports from the default ephemeral range and passes it to \
         docker to bind them to the container ports.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  The [containerPortRange] valid values are between 1 and 65535.\n\
        \            \n\
        \             }\n\
        \        {-  A port can only be included in one port mapping per container.\n\
        \            \n\
        \             }\n\
        \        {-  You cannot specify overlapping port ranges.\n\
        \            \n\
        \             }\n\
        \        {-  The first port in the range must be less than last port in the range.\n\
        \            \n\
        \             }\n\
        \        {-  Docker recommends that you turn off the docker-proxy in the Docker daemon \
         config file when you have a large number of ports.\n\
        \            \n\
        \             For more information, see {{:https://github.com/moby/moby/issues/11185} \
         Issue #11185} on the Github website.\n\
        \             \n\
        \              For information about how to turn off the docker-proxy in the Docker daemon \
         config file, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/bootstrap_container_instance.html#bootstrap_docker_daemon}Docker \
         daemon} in the {i Amazon ECS Developer Guide}.\n\
        \              \n\
        \               }\n\
        \        }\n\
        \   You can call \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html} \
         [DescribeTasks] } to view the [hostPortRange] which are the host ports that are bound to \
         the container ports.\n\
        \   "]
  protocol : transport_protocol option; [@ocaml.doc "The protocol used for the network binding.\n"]
  host_port : boxed_integer option;
      [@ocaml.doc "The port number on the host that's used with the network binding.\n"]
  container_port : boxed_integer option;
      [@ocaml.doc "The port number on the container that's used with the network binding.\n"]
  bind_i_p : string_ option;
      [@ocaml.doc "The IP address that the container is bound to on the container instance.\n"]
}
[@@ocaml.doc
  "Details on the network bindings between a container and its host container instance. After a \
   task reaches the [RUNNING] status, manual and automatic host and container port assignments are \
   visible in the [networkBindings] section of \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html}DescribeTasks} \
   API responses.\n"]

type nonrec network_bindings = network_binding list [@@ocaml.doc ""]

type nonrec network_interface = {
  ipv6_address : string_ option;
      [@ocaml.doc "The private IPv6 address for the network interface.\n"]
  private_ipv4_address : string_ option;
      [@ocaml.doc "The private IPv4 address for the network interface.\n"]
  attachment_id : string_ option; [@ocaml.doc "The attachment ID for the network interface.\n"]
}
[@@ocaml.doc
  "An object representing the elastic network interface for tasks that use the [awsvpc] network \
   mode.\n"]

type nonrec network_interfaces = network_interface list [@@ocaml.doc ""]

type nonrec health_status =
  | UNKNOWN [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_agent_name = ExecuteCommandAgent [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec managed_agent = {
  last_status : string_ option; [@ocaml.doc "The last known status of the managed agent.\n"]
  reason : string_ option;
      [@ocaml.doc "The reason for why the managed agent is in the state it is in.\n"]
  name : managed_agent_name option;
      [@ocaml.doc
        "The name of the managed agent. When the execute command feature is turned on, the managed \
         agent name is [ExecuteCommandAgent].\n"]
  last_started_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the managed agent was last started.\n"]
}
[@@ocaml.doc "Details about the managed agent status for the container.\n"]

type nonrec managed_agents = managed_agent list [@@ocaml.doc ""]

type nonrec gpu_ids = string_ list [@@ocaml.doc ""]

type nonrec neuron_device_ids = string_ list [@@ocaml.doc ""]

type nonrec container = {
  neuron_device_ids : neuron_device_ids option;
      [@ocaml.doc "The IDs of each Neuron device assigned to the container.\n"]
  gpu_ids : gpu_ids option; [@ocaml.doc "The IDs of each GPU assigned to the container.\n"]
  memory_reservation : string_ option;
      [@ocaml.doc "The soft limit (in MiB) of memory set for the container.\n"]
  memory : string_ option; [@ocaml.doc "The hard limit (in MiB) of memory set for the container.\n"]
  cpu : string_ option;
      [@ocaml.doc
        "The number of CPU units set for the container. The value is [0] if no value was specified \
         in the container definition when the task definition was registered.\n"]
  managed_agents : managed_agents option;
      [@ocaml.doc "The details of any Amazon ECS managed agents associated with the container.\n"]
  health_status : health_status option;
      [@ocaml.doc
        "The health status of the container. If health checks aren't configured for this container \
         in its task definition, then it reports the health status as [UNKNOWN].\n"]
  network_interfaces : network_interfaces option;
      [@ocaml.doc "The network interfaces associated with the container.\n"]
  network_bindings : network_bindings option;
      [@ocaml.doc "The network bindings associated with the container.\n"]
  reason : string_ option;
      [@ocaml.doc
        "A short (1024 max characters) human-readable string to provide additional details about a \
         running or stopped container.\n"]
  exit_code : boxed_integer option; [@ocaml.doc "The exit code returned from the container.\n"]
  last_status : string_ option; [@ocaml.doc "The last known status of the container.\n"]
  runtime_id : string_ option; [@ocaml.doc "The ID of the Docker container.\n"]
  image_digest : string_ option; [@ocaml.doc "The container image manifest digest.\n"]
  image : string_ option; [@ocaml.doc "The image used for the container.\n"]
  name : string_ option; [@ocaml.doc "The name of the container.\n"]
  task_arn : string_ option; [@ocaml.doc "The ARN of the task.\n"]
  container_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the container.\n"]
}
[@@ocaml.doc "A Docker container that's part of a task.\n"]

type nonrec containers = container list [@@ocaml.doc ""]

type nonrec inference_accelerator = {
  device_type : string_; [@ocaml.doc "The Elastic Inference accelerator type to use.\n"]
  device_name : string_;
      [@ocaml.doc
        "The Elastic Inference accelerator device name. The [deviceName] must also be referenced \
         in a container definition as a \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ResourceRequirement.html}ResourceRequirement}.\n"]
}
[@@ocaml.doc
  "Details on an Elastic Inference accelerator. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html}Working with \
   Amazon Elastic Inference on Amazon ECS} in the {i Amazon Elastic Container Service Developer \
   Guide}.\n"]

type nonrec inference_accelerators = inference_accelerator list [@@ocaml.doc ""]

type nonrec environment_file_type = S3 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec environment_file = {
  type_ : environment_file_type;
      [@ocaml.doc
        "The file type to use. Environment files are objects in Amazon S3. The only supported \
         value is [s3].\n"]
  value : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon S3 object containing the environment \
         variable file.\n"]
}
[@@ocaml.doc
  "A list of files containing the environment variables to pass to a container. You can specify up \
   to ten environment files. The file must have a [.env] file extension. Each line in an \
   environment file should contain an environment variable in [VARIABLE=VALUE] format. Lines \
   beginning with [#] are treated as comments and are ignored.\n\n\
  \ If there are environment variables specified using the [environment] parameter in a container \
   definition, they take precedence over the variables contained within an environment file. If \
   multiple environment files are specified that contain the same variable, they're processed from \
   the top down. We recommend that you use unique variable names. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/use-environment-file.html}Use a \
   file to pass environment variables to a container} in the {i Amazon Elastic Container Service \
   Developer Guide}.\n\
  \ \n\
  \  Environment variable files are objects in Amazon S3 and all Amazon S3 security considerations \
   apply. \n\
  \  \n\
  \   You must use the following platforms for the Fargate launch type:\n\
  \   \n\
  \    {ul\n\
  \          {-  Linux platform version [1.4.0] or later.\n\
  \              \n\
  \               }\n\
  \          {-  Windows platform version [1.0.0] or later.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Consider the following when using the Fargate launch type:\n\
  \   \n\
  \    {ul\n\
  \          {-  The file is handled like a native Docker env-file.\n\
  \              \n\
  \               }\n\
  \          {-  There is no support for shell escape handling.\n\
  \              \n\
  \               }\n\
  \          {-  The container entry point interperts the [VARIABLE] values.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec environment_files = environment_file list [@@ocaml.doc ""]

type nonrec resource_type =
  | NEURON_DEVICE [@ocaml.doc ""]
  | INFERENCE_ACCELERATOR [@ocaml.doc ""]
  | GPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_requirement = {
  type_ : resource_type; [@ocaml.doc "The type of resource to assign to a container. \n"]
  value : string_;
      [@ocaml.doc
        "The value for the specified resource type.\n\n\
        \ When the type is [GPU], the value is the number of physical [GPUs] the Amazon ECS \
         container agent reserves for the container. The number of GPUs that's reserved for all \
         containers in a task can't exceed the number of available GPUs on the container instance \
         that the task is launched on. You can also specify [ALL] to allocate all available GPUs \
         on the instance to the container.\n\
        \ \n\
        \  When the type is [NeuronDevice], the value must be [ALL]. This allocates all available \
         Neuron devices on the instance to the container. Only one container in a task can specify \
         [NeuronDevice] resources. This resource type is only supported on Managed Instances.\n\
        \  \n\
        \   When the type is [InferenceAccelerator], the [value] matches the [deviceName] for an \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_InferenceAccelerator.html}InferenceAccelerator} \
         specified in a task definition.\n\
        \   "]
}
[@@ocaml.doc
  "The type and amount of a resource to assign to a container. The supported resource types are \
   GPUs, Neuron devices, and Elastic Inference accelerators. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-gpu.html}Working with GPUs \
   on Amazon ECS} or \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html}Working with \
   Amazon Elastic Inference on Amazon ECS} in the {i Amazon Elastic Container Service Developer \
   Guide} \n"]

type nonrec resource_requirements = resource_requirement list [@@ocaml.doc ""]

type nonrec container_override = {
  resource_requirements : resource_requirements option;
      [@ocaml.doc
        "The type and amount of a resource to assign to a container, instead of the default value \
         from the task definition. The supported resources are GPUs and Neuron devices.\n"]
  memory_reservation : boxed_integer option;
      [@ocaml.doc
        "The soft limit (in MiB) of memory to reserve for the container, instead of the default \
         value from the task definition. You must also specify a container name.\n"]
  memory : boxed_integer option;
      [@ocaml.doc
        "The hard limit (in MiB) of memory to present to the container, instead of the default \
         value from the task definition. If your container attempts to exceed the memory specified \
         here, the container is killed. You must also specify a container name.\n"]
  cpu : boxed_integer option;
      [@ocaml.doc
        "The number of [cpu] units reserved for the container, instead of the default value from \
         the task definition. You must also specify a container name.\n"]
  environment_files : environment_files option;
      [@ocaml.doc
        "A list of files containing the environment variables to pass to a container, instead of \
         the value from the container definition.\n"]
  environment : environment_variables option;
      [@ocaml.doc
        "The environment variables to send to the container. You can add new environment \
         variables, which are added to the container at launch, or you can override the existing \
         environment variables from the Docker image or the task definition. You must also specify \
         a container name.\n"]
  command : string_list option;
      [@ocaml.doc
        "The command to send to the container that overrides the default command from the Docker \
         image or the task definition. You must also specify a container name.\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the container that receives the override. This parameter is required if any \
         override is specified.\n"]
}
[@@ocaml.doc
  "The overrides that are sent to a container. An empty container override can be passed in. An \
   example of an empty container override is [{\"containerOverrides\": \\[ \\] }]. If a non-empty \
   container override is specified, the [name] parameter must be included.\n\n\
  \ You can use Secrets Manager or Amazon Web Services Systems Manager Parameter Store to store \
   the sensitive data. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar.html}Retrieve \
   secrets through environment variables} in the Amazon ECS Developer Guide.\n\
  \ "]

type nonrec container_overrides = container_override list [@@ocaml.doc ""]

type nonrec inference_accelerator_override = {
  device_type : string_ option; [@ocaml.doc "The Elastic Inference accelerator type to use.\n"]
  device_name : string_ option;
      [@ocaml.doc
        "The Elastic Inference accelerator device name to override for the task. This parameter \
         must match a [deviceName] specified in the task definition.\n"]
}
[@@ocaml.doc
  "Details on an Elastic Inference accelerator task override. This parameter is used to override \
   the Elastic Inference accelerator specified in the task definition. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html}Working with \
   Amazon Elastic Inference on Amazon ECS} in the {i Amazon Elastic Container Service Developer \
   Guide}.\n"]

type nonrec inference_accelerator_overrides = inference_accelerator_override list [@@ocaml.doc ""]

type nonrec ephemeral_storage = {
  size_in_gi_b : integer;
      [@ocaml.doc
        "The total amount, in GiB, of ephemeral storage to set for the task. The minimum supported \
         value is [21] GiB and the maximum supported value is [200] GiB.\n"]
}
[@@ocaml.doc
  "The amount of ephemeral storage to allocate for the task. This parameter is used to expand the \
   total amount of ephemeral storage available, beyond the default amount, for tasks hosted on \
   Fargate. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html}Using \
   data volumes in tasks} in the {i Amazon ECS Developer Guide;}.\n\n\
  \  For tasks using the Fargate launch type, the task requires the following platforms:\n\
  \  \n\
  \   {ul\n\
  \         {-  Linux platform version [1.4.0] or later.\n\
  \             \n\
  \              }\n\
  \         {-  Windows platform version [1.0.0] or later.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

type nonrec task_override = {
  ephemeral_storage : ephemeral_storage option;
      [@ocaml.doc
        "The ephemeral storage setting override for the task.\n\n\
        \  This parameter is only supported for tasks hosted on Fargate that use the following \
         platform versions:\n\
        \  \n\
        \   {ul\n\
        \         {-  Linux platform version [1.4.0] or later.\n\
        \             \n\
        \              }\n\
        \         {-  Windows platform version [1.0.0] or later.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  task_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that containers in this task can assume. All \
         containers in this task are granted the permissions that are specified in this role. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html}IAM \
         Role for Tasks} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  memory : string_ option; [@ocaml.doc "The memory override for the task.\n"]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role override for the task. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html}Amazon \
         ECS task execution IAM role} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  inference_accelerator_overrides : inference_accelerator_overrides option;
      [@ocaml.doc "The Elastic Inference accelerator override for the task.\n"]
  cpu : string_ option; [@ocaml.doc "The CPU override for the task.\n"]
  container_overrides : container_overrides option;
      [@ocaml.doc "One or more container overrides that are sent to a task.\n"]
}
[@@ocaml.doc "The overrides that are associated with a task.\n"]

type nonrec task_stop_code =
  | TERMINATION_NOTICE [@ocaml.doc ""]
  | SPOT_INTERRUPTION [@ocaml.doc ""]
  | SERVICE_SCHEDULER_INITIATED [@ocaml.doc ""]
  | USER_INITIATED [@ocaml.doc ""]
  | ESSENTIAL_CONTAINER_EXITED [@ocaml.doc ""]
  | TASK_FAILED_TO_START [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_ephemeral_storage = {
  kms_key_id : string_ option;
      [@ocaml.doc
        "Specify an Key Management Service key ID to encrypt the ephemeral storage for the task.\n"]
  size_in_gi_b : integer option;
      [@ocaml.doc
        "The total amount, in GiB, of the ephemeral storage to set for the task. The minimum \
         supported value is [20] GiB and the maximum supported value is [200] GiB.\n"]
}
[@@ocaml.doc "The amount of ephemeral storage to allocate for the task.\n"]

type nonrec task = {
  fargate_ephemeral_storage : task_ephemeral_storage option;
      [@ocaml.doc "The Fargate ephemeral storage settings for the task.\n"]
  ephemeral_storage : ephemeral_storage option;
      [@ocaml.doc "The ephemeral storage settings for the task.\n"]
  version : long option;
      [@ocaml.doc
        "The version counter for the task. Every time a task experiences a change that starts a \
         CloudWatch event, the version counter is incremented. If you replicate your Amazon ECS \
         task state with CloudWatch Events, you can compare the version of a task reported by the \
         Amazon ECS API actions with the version reported in CloudWatch Events for the task \
         (inside the [detail] object) to verify that the version in your event stream is current.\n"]
  task_definition_arn : string_ option;
      [@ocaml.doc "The ARN of the task definition that creates the task.\n"]
  task_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the task.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the task to help you categorize and organize the task. \
         Each tag consists of a key and an optional value. You define both the key and value.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  stopping_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task stops. More specifically, it's for the time \
         when the task transitions from the [RUNNING] state to [STOPPING].\n"]
  stopped_reason : string_ option; [@ocaml.doc "The reason that the task was stopped.\n"]
  stopped_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task was stopped. More specifically, it's for \
         the time when the task transitioned from the [RUNNING] state to the [STOPPED] state.\n"]
  stop_code : task_stop_code option;
      [@ocaml.doc
        "The stop code indicating why a task was stopped. The [stoppedReason] might contain \
         additional details. \n\n\
        \ For more information about stop code, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/stopped-task-error-codes.html}Stopped \
         tasks error codes} in the {i Amazon ECS Developer Guide}.\n\
        \ "]
  started_by : string_ option;
      [@ocaml.doc
        "The tag specified when a task is started. If an Amazon ECS service started the task, the \
         [startedBy] parameter contains the deployment ID of that service.\n"]
  started_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task started. More specifically, it's for the \
         time when the task transitioned from the [PENDING] state to the [RUNNING] state.\n"]
  pull_stopped_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the container image pull completed.\n"]
  pull_started_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the container image pull began.\n"]
  platform_family : string_ option;
      [@ocaml.doc
        "The operating system that your tasks are running on. A platform family is specified only \
         for tasks that use the Fargate launch type. \n\n\
        \  All tasks that run as part of this service must use the same [platformFamily] value as \
         the service (for example, [LINUX.]).\n\
        \ "]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version where your task runs on. A platform version is only specified for \
         tasks that use the Fargate launch type. If you didn't specify one, the [LATEST] platform \
         version is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  overrides : task_override option; [@ocaml.doc "One or more container overrides.\n"]
  memory : string_ option;
      [@ocaml.doc
        "The amount of memory (in MiB) that the task uses as expressed in a task definition. It \
         can be expressed as an integer using MiB (for example, [1024]). If it's expressed as a \
         string using GB (for example, [1GB] or [1 GB]), it's converted to an integer indicating \
         the MiB when the task definition is registered.\n\n\
        \ If you use the EC2 launch type, this field is optional.\n\
        \ \n\
        \  If you use the Fargate launch type, this field is required. You must use one of the \
         following values. The value that you choose determines the range of supported values for \
         the [cpu] parameter.\n\
        \  \n\
        \   {ul\n\
        \         {-  512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available [cpu] values: 256 (.25 \
         vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available [cpu] values: \
         512 (.5 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 \
         GB), 8192 (8 GB) - Available [cpu] values: 1024 (1 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) - \
         Available [cpu] values: 2048 (2 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) - \
         Available [cpu] values: 4096 (4 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  Between 16 GB and 60 GB in 4 GB increments - Available [cpu] values: 8192 (8 \
         vCPU)\n\
        \             \n\
        \              This option requires Linux platform [1.4.0] or later.\n\
        \              \n\
        \               }\n\
        \         {-  Between 32GB and 120 GB in 8 GB increments - Available [cpu] values: 16384 \
         (16 vCPU)\n\
        \             \n\
        \              This option requires Linux platform [1.4.0] or later.\n\
        \              \n\
        \               }\n\
        \         }\n\
        \  "]
  launch_type : launch_type option;
      [@ocaml.doc
        "The infrastructure where your task runs on. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  last_status : string_ option;
      [@ocaml.doc
        "The last known status for the task. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle.html}Task \
         Lifecycle}.\n"]
  inference_accelerators : inference_accelerators option;
      [@ocaml.doc "The Elastic Inference accelerator that's associated with the task.\n"]
  health_status : health_status option;
      [@ocaml.doc
        "The health status for the task. It's determined by the health of the essential containers \
         in the task. If all essential containers in the task are reporting as [HEALTHY], the task \
         status also reports as [HEALTHY]. If any essential containers in the task are reporting \
         as [UNHEALTHY] or [UNKNOWN], the task status also reports as [UNHEALTHY] or [UNKNOWN].\n\n\
        \  The Amazon ECS container agent doesn't monitor or report on Docker health checks that \
         are embedded in a container image and not specified in the container definition. For \
         example, this includes those specified in a parent image or from the image's Dockerfile. \
         Health check parameters that are specified in a container definition override any Docker \
         health checks that are found in the container image.\n\
        \  \n\
        \   "]
  group : string_ option;
      [@ocaml.doc "The name of the task group that's associated with the task.\n"]
  execution_stopped_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the task execution stopped.\n"]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Determines whether execute command functionality is turned on for this task. If [true], \
         execute command functionality is turned on all the containers in the task.\n"]
  desired_status : string_ option;
      [@ocaml.doc
        "The desired status of the task. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle.html}Task \
         Lifecycle}.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task was created. More specifically, it's for \
         the time when the task entered the [PENDING] state.\n"]
  cpu : string_ option;
      [@ocaml.doc
        "The number of CPU units used by the task as expressed in a task definition. It can be \
         expressed as an integer using CPU units (for example, [1024]). It can also be expressed \
         as a string using vCPUs (for example, [1 vCPU] or [1 vcpu]). String values are converted \
         to an integer that indicates the CPU units when the task definition is registered.\n\n\
        \ If you're using the EC2 launch type or the external launch type, this field is optional. \
         Supported values are between [128] CPU units ([0.125] vCPUs) and [196608] CPU units \
         ([192] vCPUs). If you do not specify a value, the parameter is ignored.\n\
        \ \n\
        \  This field is required for Fargate. For information about the valid values, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size}Task \
         size} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  "]
  containers : containers option; [@ocaml.doc "The containers that's associated with the task.\n"]
  container_instance_arn : string_ option;
      [@ocaml.doc "The ARN of the container instances that host the task.\n"]
  connectivity_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task last went into [CONNECTED] status.\n"]
  connectivity : connectivity option; [@ocaml.doc "The connectivity status of a task.\n"]
  cluster_arn : string_ option; [@ocaml.doc "The ARN of the cluster that hosts the task.\n"]
  capacity_provider_name : string_ option;
      [@ocaml.doc "The capacity provider that's associated with the task.\n"]
  availability_zone : string_ option; [@ocaml.doc "The Availability Zone for the task.\n"]
  attributes : attributes option; [@ocaml.doc "The attributes of the task\n"]
  attachments : attachments option;
      [@ocaml.doc
        "The Elastic Network Adapter that's associated with the task if the task uses the [awsvpc] \
         network mode.\n"]
}
[@@ocaml.doc "Details on a task in a cluster.\n"]

type nonrec tasks = task list [@@ocaml.doc ""]

type nonrec task_managed_ebs_volume_termination_policy = {
  delete_on_termination : boxed_boolean;
      [@ocaml.doc
        "Indicates whether the volume should be deleted on when the task stops. If a value of \
         [true] is specified, Amazon ECS deletes the Amazon EBS volume on your behalf when the \
         task goes into the [STOPPED] state. If no value is specified, the default value is [true] \
         is used. When set to [false], Amazon ECS leaves the volume in your account.\n"]
}
[@@ocaml.doc
  "The termination policy for the Amazon EBS volume when the task exits. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   ECS volume termination policy}.\n"]

type nonrec task_managed_ebs_volume_configuration = {
  filesystem_type : task_filesystem_type option;
      [@ocaml.doc
        "The Linux filesystem type for the volume. For volumes created from a snapshot, you must \
         specify the same filesystem type that the volume was using when the snapshot was created. \
         If there is a filesystem type mismatch, the task will fail to start.\n\n\
        \ The available filesystem types are [ext3], [ext4], and [xfs]. If no value is specified, \
         the [xfs] filesystem type is used by default.\n\
        \ "]
  termination_policy : task_managed_ebs_volume_termination_policy option;
      [@ocaml.doc
        "The termination policy for the volume when the task exits. This provides a way to control \
         whether Amazon ECS terminates the Amazon EBS volume when the task stops.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role to associate with this volume. This is the Amazon ECS \
         infrastructure IAM role that is used to manage your Amazon Web Services infrastructure. \
         We recommend using the Amazon ECS-managed [AmazonECSInfrastructureRolePolicyForVolumes] \
         IAM policy with this role. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html}Amazon \
         ECS infrastructure IAM role} in the {i Amazon ECS Developer Guide}.\n"]
  tag_specifications : ebs_tag_specifications option;
      [@ocaml.doc
        "The tags to apply to the volume. Amazon ECS applies service-managed tags by default. This \
         parameter maps 1:1 with the [TagSpecifications.N] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n"]
  throughput : boxed_integer option;
      [@ocaml.doc
        "The throughput to provision for a volume, in MiB/s, with a maximum of 1,000 MiB/s. This \
         parameter maps 1:1 with the [Throughput] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n\n\
        \  This parameter is only supported for the [gp3] volume type.\n\
        \  \n\
        \   "]
  iops : boxed_integer option;
      [@ocaml.doc
        "The number of I/O operations per second (IOPS). For [gp3], [io1], and [io2] volumes, this \
         represents the number of IOPS that are provisioned for the volume. For [gp2] volumes, \
         this represents the baseline performance of the volume and the rate at which the volume \
         accumulates I/O credits for bursting.\n\n\
        \ The following are the supported values for each volume type.\n\
        \ \n\
        \  {ul\n\
        \        {-   [gp3]: 3,000 - 16,000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-   [io1]: 100 - 64,000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-   [io2]: 100 - 256,000 IOPS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   This parameter is required for [io1] and [io2] volume types. The default for [gp3] \
         volumes is [3,000 IOPS]. This parameter is not supported for [st1], [sc1], or [standard] \
         volume types.\n\
        \   \n\
        \    This parameter maps 1:1 with the [Iops] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n\
        \    "]
  volume_initialization_rate : boxed_integer option;
      [@ocaml.doc
        "The rate, in MiB/s, at which data is fetched from a snapshot of an existing Amazon EBS \
         volume to create a new volume for attachment to the task. This property can be specified \
         only if you specify a [snapshotId]. For more information, see \
         {{:https://docs.aws.amazon.com/ebs/latest/userguide/initalize-volume.html}Initialize \
         Amazon EBS volumes} in the {i Amazon EBS User Guide}.\n"]
  snapshot_id : ebs_snapshot_id option;
      [@ocaml.doc
        "The snapshot that Amazon ECS uses to create the volume. You must specify either a \
         snapshot ID or a volume size. This parameter maps 1:1 with the [SnapshotId] parameter of \
         the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n"]
  size_in_gi_b : boxed_integer option;
      [@ocaml.doc
        "The size of the volume in GiB. You must specify either a volume size or a snapshot ID. If \
         you specify a snapshot ID, the snapshot size is used for the volume size by default. You \
         can optionally specify a volume size greater than or equal to the snapshot size. This \
         parameter maps 1:1 with the [Size] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n\n\
        \ The following are the supported volume size values for each volume type.\n\
        \ \n\
        \  {ul\n\
        \        {-   [gp2] and [gp3]: 1-16,384\n\
        \            \n\
        \             }\n\
        \        {-   [io1] and [io2]: 4-16,384\n\
        \            \n\
        \             }\n\
        \        {-   [st1] and [sc1]: 125-16,384\n\
        \            \n\
        \             }\n\
        \        {-   [standard]: 1-1,024\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  volume_type : ebs_volume_type option;
      [@ocaml.doc
        "The volume type. This parameter maps 1:1 with the [VolumeType] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html}Amazon EBS \
         volume types} in the {i Amazon EC2 User Guide}.\n\n\
        \ The following are the supported volume types.\n\
        \ \n\
        \  {ul\n\
        \        {-  General Purpose SSD: [gp2]|[gp3] \n\
        \            \n\
        \             }\n\
        \        {-  Provisioned IOPS SSD: [io1]|[io2] \n\
        \            \n\
        \             }\n\
        \        {-  Throughput Optimized HDD: [st1] \n\
        \            \n\
        \             }\n\
        \        {-  Cold HDD: [sc1] \n\
        \            \n\
        \             }\n\
        \        {-  Magnetic: [standard] \n\
        \            \n\
        \              The magnetic volume type is not supported on Fargate.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
  kms_key_id : ebskms_key_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) identifier of the Amazon Web Services Key Management \
         Service key to use for Amazon EBS encryption. When a key is specified using this \
         parameter, it overrides Amazon EBS default encryption or any KMS key that you specified \
         for cluster-level managed storage encryption. This parameter maps 1:1 with the [KmsKeyId] \
         parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}. For more information about encrypting Amazon \
         EBS volumes attached to a task, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-kms-encryption.html}Encrypt \
         data stored in Amazon EBS volumes attached to Amazon ECS tasks}.\n\n\
        \  Amazon Web Services authenticates the Amazon Web Services Key Management Service key \
         asynchronously. Therefore, if you specify an ID, alias, or ARN that is invalid, the \
         action can appear to complete, but eventually fails.\n\
        \  \n\
        \   "]
  encrypted : boxed_boolean option;
      [@ocaml.doc
        "Indicates whether the volume should be encrypted. If you turn on Region-level Amazon EBS \
         encryption by default but set this value as [false], the setting is overridden and the \
         volume is encrypted with the KMS key specified for Amazon EBS encryption by default. This \
         parameter maps 1:1 with the [Encrypted] parameter of the \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html}CreateVolume \
         API} in the {i Amazon EC2 API Reference}.\n"]
}
[@@ocaml.doc
  "The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your behalf. \
   These settings are used to create each Amazon EBS volume, with one volume created for each task.\n"]

type nonrec task_volume_configuration = {
  managed_ebs_volume : task_managed_ebs_volume_configuration option;
      [@ocaml.doc
        "The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your \
         behalf. These settings are used to create each Amazon EBS volume, with one volume created \
         for each task. The Amazon EBS volumes are visible in your account in the Amazon EC2 \
         console once they are created.\n"]
  name : ecs_volume_name;
      [@ocaml.doc
        "The name of the volume. This value must match the volume name from the [Volume] object in \
         the task definition.\n"]
}
[@@ocaml.doc
  "Configuration settings for the task volume that was [configuredAtLaunch] that weren't set \
   during [RegisterTaskDef].\n"]

type nonrec task_volume_configurations = task_volume_configuration list [@@ocaml.doc ""]

type nonrec task_set_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec task_set_field = TAGS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_set_field_list = task_set_field list [@@ocaml.doc ""]

type nonrec task_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec task_field = TAGS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_field_list = task_field list [@@ocaml.doc ""]

type nonrec task_definition_status =
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_definition_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec task_definition_placement_constraint_type = MEMBER_OF [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_definition_placement_constraint = {
  expression : string_ option;
      [@ocaml.doc
        "A cluster query language expression to apply to the constraint. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster \
         query language} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  type_ : task_definition_placement_constraint_type option;
      [@ocaml.doc
        "The type of constraint. The [MemberOf] constraint restricts selection to be from a group \
         of valid candidates.\n"]
}
[@@ocaml.doc
  "The constraint on task placement in the task definition. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html}Task \
   placement constraints} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \  Task placement constraints aren't supported for tasks run on Fargate.\n\
  \  \n\
  \   "]

type nonrec task_definition_placement_constraints = task_definition_placement_constraint list
[@@ocaml.doc ""]

type nonrec repository_credentials = {
  credentials_parameter : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the secret containing the private repository \
         credentials.\n\n\
        \  When you use the Amazon ECS API, CLI, or Amazon Web Services SDK, if the secret exists \
         in the same Region as the task that you're launching then you can use either the full ARN \
         or the name of the secret. When you use the Amazon Web Services Management Console, you \
         must specify the full ARN of the secret.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The repository credentials for private registry authentication.\n"]

type nonrec application_protocol =
  | GRPC [@ocaml.doc ""]
  | HTTP2 [@ocaml.doc ""]
  | HTTP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec port_mapping = {
  container_port_range : string_ option;
      [@ocaml.doc
        "The port number range on the container that's bound to the dynamically mapped host port \
         range. \n\n\
        \ The following rules apply when you specify a [containerPortRange]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You must use either the [bridge] network mode or the [awsvpc] network mode.\n\
        \            \n\
        \             }\n\
        \        {-  This parameter is available for both the EC2 and Fargate launch types.\n\
        \            \n\
        \             }\n\
        \        {-  This parameter is available for both the Linux and Windows operating systems.\n\
        \            \n\
        \             }\n\
        \        {-  The container instance must have at least version 1.67.0 of the container \
         agent and at least version 1.67.0-1 of the [ecs-init] package \n\
        \            \n\
        \             }\n\
        \        {-  You can specify a maximum of 100 port ranges per container.\n\
        \            \n\
        \             }\n\
        \        {-  You do not specify a [hostPortRange]. The value of the [hostPortRange] is set \
         as follows:\n\
        \            \n\
        \             {ul\n\
        \                   {-  For containers in a task with the [awsvpc] network mode, the \
         [hostPortRange] is set to the same value as the [containerPortRange]. This is a static \
         mapping strategy.\n\
        \                       \n\
        \                        }\n\
        \                   {-  For containers in a task with the [bridge] network mode, the \
         Amazon ECS agent finds open host ports from the default ephemeral range and passes it to \
         docker to bind them to the container ports.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  The [containerPortRange] valid values are between 1 and 65535.\n\
        \            \n\
        \             }\n\
        \        {-  A port can only be included in one port mapping per container.\n\
        \            \n\
        \             }\n\
        \        {-  You cannot specify overlapping port ranges.\n\
        \            \n\
        \             }\n\
        \        {-  The first port in the range must be less than last port in the range.\n\
        \            \n\
        \             }\n\
        \        {-  Docker recommends that you turn off the docker-proxy in the Docker daemon \
         config file when you have a large number of ports.\n\
        \            \n\
        \             For more information, see {{:https://github.com/moby/moby/issues/11185} \
         Issue #11185} on the Github website.\n\
        \             \n\
        \              For information about how to turn off the docker-proxy in the Docker daemon \
         config file, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/bootstrap_container_instance.html#bootstrap_docker_daemon}Docker \
         daemon} in the {i Amazon ECS Developer Guide}.\n\
        \              \n\
        \               }\n\
        \        }\n\
        \   You can call \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html} \
         [DescribeTasks] } to view the [hostPortRange] which are the host ports that are bound to \
         the container ports.\n\
        \   "]
  app_protocol : application_protocol option;
      [@ocaml.doc
        "The application protocol that's used for the port mapping. This parameter only applies to \
         Service Connect. We recommend that you set this parameter to be consistent with the \
         protocol that your application uses. If you set this parameter, Amazon ECS adds \
         protocol-specific connection handling to the Service Connect proxy. If you set this \
         parameter, Amazon ECS adds protocol-specific telemetry in the Amazon ECS console and \
         CloudWatch.\n\n\
        \ If you don't set a value for this parameter, then TCP is used. However, Amazon ECS \
         doesn't add protocol-specific telemetry for TCP.\n\
        \ \n\
        \   [appProtocol] is immutable in a Service Connect service. Updating this field requires \
         a service deletion and redeployment.\n\
        \  \n\
        \   Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \   "]
  name : string_ option;
      [@ocaml.doc
        "The name that's used for the port mapping. This parameter is the name that you use in the \
         [serviceConnectConfiguration] and the [vpcLatticeConfigurations] of a service. The name \
         can include up to 64 characters. The characters can include lowercase letters, numbers, \
         underscores (_), and hyphens (-). The name can't start with a hyphen.\n"]
  protocol : transport_protocol option;
      [@ocaml.doc
        "The protocol used for the port mapping. Valid values are [tcp] and [udp]. The default is \
         [tcp]. [protocol] is immutable in a Service Connect service. Updating this field requires \
         a service deletion and redeployment. \n"]
  host_port : boxed_integer option;
      [@ocaml.doc
        "The port number on the container instance to reserve for your container.\n\n\
        \ If you specify a [containerPortRange], leave this field empty and the value of the \
         [hostPort] is set as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-  For containers in a task with the [awsvpc] network mode, the [hostPort] is \
         set to the same value as the [containerPort]. This is a static mapping strategy.\n\
        \            \n\
        \             }\n\
        \        {-  For containers in a task with the [bridge] network mode, the Amazon ECS agent \
         finds open ports on the host and automatically binds them to the container ports. This is \
         a dynamic mapping strategy.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you use containers in a task with the [awsvpc] or [host] network mode, the \
         [hostPort] can either be left blank or set to the same value as the [containerPort].\n\
        \   \n\
        \    If you use containers in a task with the [bridge] network mode, you can specify a \
         non-reserved host port for your container port mapping, or you can omit the [hostPort] \
         (or set it to [0]) while specifying a [containerPort] and your container automatically \
         receives a port in the ephemeral port range for your container instance operating system \
         and Docker version.\n\
        \    \n\
        \     The default ephemeral port range for Docker version 1.6.0 and later is listed on the \
         instance under [/proc/sys/net/ipv4/ip_local_port_range]. If this kernel parameter is \
         unavailable, the default ephemeral port range from 49153 through 65535 (Linux) or 49152 \
         through 65535 (Windows) is used. Do not attempt to specify a host port in the ephemeral \
         port range as these are reserved for automatic assignment. In general, ports below 32768 \
         are outside of the ephemeral port range.\n\
        \     \n\
        \      The default reserved ports are 22 for SSH, the Docker ports 2375 and 2376, and the \
         Amazon ECS container agent ports 51678-51680. Any host port that was previously specified \
         in a running task is also reserved while the task is running. That is, after a task \
         stops, the host port is released. The current reserved ports are displayed in the \
         [remainingResources] of \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeContainerInstances.html}DescribeContainerInstances} \
         output. A container instance can have up to 100 reserved ports at a time. This number \
         includes the default reserved ports. Automatically assigned ports aren't included in the \
         100 reserved ports quota.\n\
        \      "]
  container_port : boxed_integer option;
      [@ocaml.doc
        "The port number on the container that's bound to the user-specified or automatically \
         assigned host port.\n\n\
        \ If you use containers in a task with the [awsvpc] or [host] network mode, specify the \
         exposed ports using [containerPort].\n\
        \ \n\
        \  If you use containers in a task with the [bridge] network mode and you specify a \
         container port and not a host port, your container automatically receives a host port in \
         the ephemeral port range. For more information, see [hostPort]. Port mappings that are \
         automatically assigned in this way do not count toward the 100 reserved ports limit of a \
         container instance.\n\
        \  "]
}
[@@ocaml.doc
  "Port mappings allow containers to access ports on the host container instance to send or \
   receive traffic. Port mappings are specified as part of the container definition.\n\n\
  \ If you use containers in a task with the [awsvpc] or [host] network mode, specify the exposed \
   ports using [containerPort]. The [hostPort] can be left blank or it must be the same value as \
   the [containerPort].\n\
  \ \n\
  \  Most fields of this parameter ([containerPort], [hostPort], [protocol]) maps to \
   [PortBindings] in the docker container create command and the [--publish] option to [docker \
   run]. If the network mode of a task definition is set to [host], host ports must either be \
   undefined or match the container port in the port mapping.\n\
  \  \n\
  \    You can't expose the same container port for multiple protocols. If you attempt this, an \
   error is returned.\n\
  \    \n\
  \      After a task reaches the [RUNNING] status, manual and automatic host and container port \
   assignments are visible in the [networkBindings] section of \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html}DescribeTasks} \
   API responses.\n\
  \      "]

type nonrec port_mapping_list = port_mapping list [@@ocaml.doc ""]

type nonrec integer_list = boxed_integer list [@@ocaml.doc ""]

type nonrec container_restart_policy = {
  restart_attempt_period : boxed_integer option;
      [@ocaml.doc
        "A period of time (in seconds) that the container must run for before a restart can be \
         attempted. A container can be restarted only once every [restartAttemptPeriod] seconds. \
         If a container isn't able to run for this time period and exits early, it will not be \
         restarted. You can set a minimum [restartAttemptPeriod] of 60 seconds and a maximum \
         [restartAttemptPeriod] of 1800 seconds. By default, a container must run for 300 seconds \
         before it can be restarted.\n"]
  ignored_exit_codes : integer_list option;
      [@ocaml.doc
        "A list of exit codes that Amazon ECS will ignore and not attempt a restart on. You can \
         specify a maximum of 50 container exit codes. By default, Amazon ECS does not ignore any \
         exit codes.\n"]
  enabled : boxed_boolean;
      [@ocaml.doc "Specifies whether a restart policy is enabled for the container.\n"]
}
[@@ocaml.doc
  "You can enable a restart policy for each container defined in your task definition, to overcome \
   transient failures faster and maintain task availability. When you enable a restart policy for \
   a container, Amazon ECS can restart the container if it exits, without needing to replace the \
   task. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-restart-policy.html}Restart \
   individual containers in Amazon ECS tasks with container restart policies} in the {i Amazon \
   Elastic Container Service Developer Guide}.\n"]

type nonrec mount_point = {
  read_only : boxed_boolean option;
      [@ocaml.doc
        "If this value is [true], the container has read-only access to the volume. If this value \
         is [false], then the container can write to the volume. The default value is [false].\n"]
  container_path : string_ option;
      [@ocaml.doc "The path on the container to mount the host volume at.\n"]
  source_volume : string_ option;
      [@ocaml.doc
        "The name of the volume to mount. Must be a volume name referenced in the [name] parameter \
         of task definition [volume].\n"]
}
[@@ocaml.doc "The details for a volume mount point that's used in a container definition.\n"]

type nonrec mount_point_list = mount_point list [@@ocaml.doc ""]

type nonrec kernel_capabilities = {
  drop : string_list option;
      [@ocaml.doc
        "The Linux capabilities for the container that have been removed from the default \
         configuration provided by Docker. This parameter maps to [CapDrop] in the docker \
         container create command and the [--cap-drop] option to docker run.\n\n\
        \ Valid values: [\"ALL\" | \"AUDIT_CONTROL\" | \"AUDIT_WRITE\" | \"BLOCK_SUSPEND\" | \
         \"CHOWN\" | \"DAC_OVERRIDE\" | \"DAC_READ_SEARCH\" | \"FOWNER\" | \"FSETID\" | \
         \"IPC_LOCK\" | \"IPC_OWNER\" | \"KILL\" | \"LEASE\" | \"LINUX_IMMUTABLE\" | \"MAC_ADMIN\" \
         | \"MAC_OVERRIDE\" | \"MKNOD\" | \"NET_ADMIN\" | \"NET_BIND_SERVICE\" | \"NET_BROADCAST\" \
         | \"NET_RAW\" | \"SETFCAP\" | \"SETGID\" | \"SETPCAP\" | \"SETUID\" | \"SYS_ADMIN\" | \
         \"SYS_BOOT\" | \"SYS_CHROOT\" | \"SYS_MODULE\" | \"SYS_NICE\" | \"SYS_PACCT\" | \
         \"SYS_PTRACE\" | \"SYS_RAWIO\" | \"SYS_RESOURCE\" | \"SYS_TIME\" | \"SYS_TTY_CONFIG\" | \
         \"SYSLOG\" | \"WAKE_ALARM\"] \n\
        \ "]
  add : string_list option;
      [@ocaml.doc
        "The Linux capabilities for the container that have been added to the default \
         configuration provided by Docker. This parameter maps to [CapAdd] in the docker container \
         create command and the [--cap-add] option to docker run.\n\n\
        \  Tasks launched on Fargate only support adding the [SYS_PTRACE] kernel capability.\n\
        \  \n\
        \    Valid values: [\"ALL\" | \"AUDIT_CONTROL\" | \"AUDIT_WRITE\" | \"BLOCK_SUSPEND\" | \
         \"CHOWN\" | \"DAC_OVERRIDE\" | \"DAC_READ_SEARCH\" | \"FOWNER\" | \"FSETID\" | \
         \"IPC_LOCK\" | \"IPC_OWNER\" | \"KILL\" | \"LEASE\" | \"LINUX_IMMUTABLE\" | \"MAC_ADMIN\" \
         | \"MAC_OVERRIDE\" | \"MKNOD\" | \"NET_ADMIN\" | \"NET_BIND_SERVICE\" | \"NET_BROADCAST\" \
         | \"NET_RAW\" | \"SETFCAP\" | \"SETGID\" | \"SETPCAP\" | \"SETUID\" | \"SYS_ADMIN\" | \
         \"SYS_BOOT\" | \"SYS_CHROOT\" | \"SYS_MODULE\" | \"SYS_NICE\" | \"SYS_PACCT\" | \
         \"SYS_PTRACE\" | \"SYS_RAWIO\" | \"SYS_RESOURCE\" | \"SYS_TIME\" | \"SYS_TTY_CONFIG\" | \
         \"SYSLOG\" | \"WAKE_ALARM\"] \n\
        \    "]
}
[@@ocaml.doc
  "The Linux capabilities to add or remove from the default Docker configuration for a container \
   defined in the task definition. For more detailed information about these Linux capabilities, \
   see the {{:http://man7.org/linux/man-pages/man7/capabilities.7.html}capabilities(7)} Linux \
   manual page.\n\n\
  \ The following describes how Docker processes the Linux capabilities specified in the [add] and \
   [drop] request parameters. For information about the latest behavior, see \
   {{:https://forums.docker.com/t/docker-compose-order-of-cap-drop-and-cap-add/97136/1}Docker \
   Compose: order of cap_drop and cap_add} in the Docker Community Forum.\n\
  \ \n\
  \  {ul\n\
  \        {-  When the container is a privleged container, the container capabilities are all of \
   the default Docker capabilities. The capabilities specified in the [add] request parameter, and \
   the [drop] request parameter are ignored.\n\
  \            \n\
  \             }\n\
  \        {-  When the [add] request parameter is set to ALL, the container capabilities are all \
   of the default Docker capabilities, excluding those specified in the [drop] request parameter.\n\
  \            \n\
  \             }\n\
  \        {-  When the [drop] request parameter is set to ALL, the container capabilities are the \
   capabilities specified in the [add] request parameter.\n\
  \            \n\
  \             }\n\
  \        {-  When the [add] request parameter and the [drop] request parameter are both empty, \
   the capabilities the container capabilities are all of the default Docker capabilities.\n\
  \            \n\
  \             }\n\
  \        {-  The default is to first drop the capabilities specified in the [drop] request \
   parameter, and then add the capabilities specified in the [add] request parameter.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec device_cgroup_permission =
  | MKNOD [@ocaml.doc ""]
  | WRITE [@ocaml.doc ""]
  | READ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec device_cgroup_permissions = device_cgroup_permission list [@@ocaml.doc ""]

type nonrec device = {
  permissions : device_cgroup_permissions option;
      [@ocaml.doc
        "The explicit permissions to provide to the container for the device. By default, the \
         container has permissions for [read], [write], and [mknod] for the device.\n"]
  container_path : string_ option;
      [@ocaml.doc "The path inside the container at which to expose the host device.\n"]
  host_path : string_; [@ocaml.doc "The path for the device on the host container instance.\n"]
}
[@@ocaml.doc "An object representing a container instance host device.\n"]

type nonrec devices_list = device list [@@ocaml.doc ""]

type nonrec linux_parameters = {
  swappiness : boxed_integer option;
      [@ocaml.doc
        "This allows you to tune a container's memory swappiness behavior. A [swappiness] value of \
         [0] will cause swapping to not happen unless absolutely necessary. A [swappiness] value \
         of [100] will cause pages to be swapped very aggressively. Accepted values are whole \
         numbers between [0] and [100]. If the [swappiness] parameter is not specified, a default \
         value of [60] is used. If a value is not specified for [maxSwap] then this parameter is \
         ignored. This parameter maps to the [--memory-swappiness] option to docker run.\n\n\
        \  If you're using tasks that use the Fargate launch type, the [swappiness] parameter \
         isn't supported.\n\
        \  \n\
        \   If you're using tasks on Amazon Linux 2023 the [swappiness] parameter isn't supported.\n\
        \   \n\
        \    "]
  max_swap : boxed_integer option;
      [@ocaml.doc
        "The total amount of swap memory (in MiB) a container can use. This parameter will be \
         translated to the [--memory-swap] option to docker run where the value would be the sum \
         of the container memory plus the [maxSwap] value.\n\n\
        \ If a [maxSwap] value of [0] is specified, the container will not use swap. Accepted \
         values are [0] or any positive integer. If the [maxSwap] parameter is omitted, the \
         container will use the swap configuration for the container instance it is running on. A \
         [maxSwap] value must be set for the [swappiness] parameter to be used.\n\
        \ \n\
        \   If you're using tasks that use the Fargate launch type, the [maxSwap] parameter isn't \
         supported.\n\
        \   \n\
        \    If you're using tasks on Amazon Linux 2023 the [swappiness] parameter isn't supported.\n\
        \    \n\
        \     "]
  tmpfs : tmpfs_list option;
      [@ocaml.doc
        "The container path, mount options, and size (in MiB) of the tmpfs mount. This parameter \
         maps to the [--tmpfs] option to docker run.\n"]
  shared_memory_size : boxed_integer option;
      [@ocaml.doc
        "The value for the size (in MiB) of the [/dev/shm] volume. This parameter maps to the \
         [--shm-size] option to docker run.\n\n\
        \  If you are using tasks that use the Fargate launch type, the [sharedMemorySize] \
         parameter is not supported.\n\
        \  \n\
        \   "]
  init_process_enabled : boxed_boolean option;
      [@ocaml.doc
        "Run an [init] process inside the container that forwards signals and reaps processes. \
         This parameter maps to the [--init] option to docker run. This parameter requires version \
         1.25 of the Docker Remote API or greater on your container instance. To check the Docker \
         Remote API version on your container instance, log in to your container instance and run \
         the following command: [sudo docker version --format '{{.Server.APIVersion}}'] \n"]
  devices : devices_list option;
      [@ocaml.doc
        "Any host devices to expose to the container. This parameter maps to [Devices] in the \
         docker container create command and the [--device] option to docker run.\n\n\
        \  If you're using tasks that use the Fargate launch type, the [devices] parameter isn't \
         supported.\n\
        \  \n\
        \   "]
  capabilities : kernel_capabilities option;
      [@ocaml.doc
        "The Linux capabilities for the container that are added to or dropped from the default \
         configuration provided by Docker.\n\n\
        \  For tasks that use the Fargate launch type, [capabilities] is supported for all \
         platform versions but the [add] parameter is only supported if using platform version \
         1.4.0 or later.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The Linux-specific options that are applied to the container, such as Linux \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_KernelCapabilities.html}KernelCapabilities}.\n"]

type nonrec container_condition =
  | HEALTHY [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | START [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_dependency = {
  condition : container_condition;
      [@ocaml.doc
        "The dependency condition of the container. The following are the available conditions and \
         their behavior:\n\n\
        \ {ul\n\
        \       {-   [START] - This condition emulates the behavior of links and volumes today. It \
         validates that a dependent container is started before permitting other containers to \
         start.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE] - This condition validates that a dependent container runs to \
         completion (exits) before permitting other containers to start. This can be useful for \
         nonessential containers that run a script and then exit. This condition can't be set on \
         an essential container.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS] - This condition is the same as [COMPLETE], but it also requires \
         that the container exits with a [zero] status. This condition can't be set on an \
         essential container.\n\
        \           \n\
        \            }\n\
        \       {-   [HEALTHY] - This condition validates that the dependent container passes its \
         Docker health check before permitting other containers to start. This requires that the \
         dependent container has health checks configured. This condition is confirmed only at \
         task startup.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  container_name : string_; [@ocaml.doc "The name of a container.\n"]
}
[@@ocaml.doc
  "The dependencies defined for container startup and shutdown. A container can contain multiple \
   dependencies. When a dependency is defined for container startup, for container shutdown it is \
   reversed.\n\n\
  \ Your Amazon ECS container instances require at least version 1.26.0 of the container agent to \
   use container dependencies. However, we recommend using the latest container agent version. For \
   information about checking your agent version and updating to the latest version, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html}Updating \
   the Amazon ECS Container Agent} in the {i Amazon Elastic Container Service Developer Guide}. If \
   you're using an Amazon ECS-optimized Linux AMI, your instance needs at least version 1.26.0-1 \
   of the [ecs-init] package. If your container instances are launched from version [20190301] or \
   later, then they contain the required versions of the container agent and [ecs-init]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html}Amazon \
   ECS-optimized Linux AMI} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ \n\
  \   For tasks that use the Fargate launch type, the task or service requires the following \
   platforms:\n\
  \   \n\
  \    {ul\n\
  \          {-  Linux platform version [1.3.0] or later.\n\
  \              \n\
  \               }\n\
  \          {-  Windows platform version [1.0.0] or later.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    For more information about how to create a container dependency, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/example_task_definitions.html#example_task_definition-containerdependency}Container \
   dependency} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \    "]

type nonrec container_dependencies = container_dependency list [@@ocaml.doc ""]

type nonrec host_entry = {
  ip_address : string_; [@ocaml.doc "The IP address to use in the [/etc/hosts] entry.\n"]
  hostname : string_; [@ocaml.doc "The hostname to use in the [/etc/hosts] entry.\n"]
}
[@@ocaml.doc
  "Hostnames and IP address entries that are added to the [/etc/hosts] file of a container via the \
   [extraHosts] parameter of its \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html}ContainerDefinition}. \n"]

type nonrec host_entry_list = host_entry list [@@ocaml.doc ""]

type nonrec docker_labels_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec health_check = {
  start_period : boxed_integer option;
      [@ocaml.doc
        "The optional grace period to provide containers time to bootstrap before failed health \
         checks count towards the maximum number of retries. You can specify between 0 and 300 \
         seconds. By default, the [startPeriod] is off. This value applies only when you specify a \
         [command]. \n\n\
        \  If a health check succeeds within the [startPeriod], then the container is considered \
         healthy and any subsequent failures count toward the maximum number of retries.\n\
        \  \n\
        \   "]
  retries : boxed_integer option;
      [@ocaml.doc
        "The number of times to retry a failed health check before the container is considered \
         unhealthy. You may specify between 1 and 10 retries. The default value is 3. This value \
         applies only when you specify a [command]. \n"]
  timeout : boxed_integer option;
      [@ocaml.doc
        "The time period in seconds to wait for a health check to succeed before it is considered \
         a failure. You may specify between 2 and 60 seconds. The default value is 5. This value \
         applies only when you specify a [command]. \n"]
  interval : boxed_integer option;
      [@ocaml.doc
        "The time period in seconds between each health check execution. You may specify between 5 \
         and 300 seconds. The default value is 30 seconds. This value applies only when you \
         specify a [command]. \n"]
  command : string_list;
      [@ocaml.doc
        "A string array representing the command that the container runs to determine if it is \
         healthy. The string array must start with [CMD] to run the command arguments directly, or \
         [CMD-SHELL] to run the command with the container's default shell. \n\n\
        \  When you use the Amazon Web Services Management Console JSON panel, the Command Line \
         Interface, or the APIs, enclose the list of commands in double quotes and brackets.\n\
        \ \n\
        \   [\\[ \"CMD-SHELL\", \"curl -f http://localhost/ || exit 1\" \\]] \n\
        \  \n\
        \   You don't include the double quotes and brackets when you use the Amazon Web Services \
         Management Console.\n\
        \   \n\
        \     [ CMD-SHELL, curl -f http://localhost/ || exit 1] \n\
        \    \n\
        \     An exit code of 0 indicates success, and non-zero exit code indicates failure. For \
         more information, see [HealthCheck] in the docker container create command.\n\
        \     "]
}
[@@ocaml.doc
  "An object representing a container health check. Health check parameters that are specified in \
   a container definition override any Docker health checks that exist in the container image \
   (such as those specified in a parent image or from the image's Dockerfile). This configuration \
   maps to the [HEALTHCHECK] parameter of docker run.\n\n\
  \  The Amazon ECS container agent only monitors and reports on the health checks specified in \
   the task definition. Amazon ECS does not monitor Docker health checks that are embedded in a \
   container image and not specified in the container definition. Health check parameters that are \
   specified in a container definition override any Docker health checks that exist in the \
   container image.\n\
  \  \n\
  \    You can view the health status of both individual containers and a task with the \
   DescribeTasks API operation or when viewing the task details in the console.\n\
  \    \n\
  \     The health check is designed to make sure that your containers survive agent restarts, \
   upgrades, or temporary unavailability.\n\
  \     \n\
  \      Amazon ECS performs health checks on containers with the default that launched the \
   container instance or the task.\n\
  \      \n\
  \       The following describes the possible [healthStatus] values for a container:\n\
  \       \n\
  \        {ul\n\
  \              {-   [HEALTHY]-The container health check has passed successfully.\n\
  \                  \n\
  \                   }\n\
  \              {-   [UNHEALTHY]-The container health check has failed.\n\
  \                  \n\
  \                   }\n\
  \              {-   [UNKNOWN]-The container health check is being evaluated, there's no \
   container health check defined, or Amazon ECS doesn't have the health status of the container.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   The following describes the possible [healthStatus] values based on the container health \
   checker status of essential containers in the task with the following priority order (high to \
   low):\n\
  \   \n\
  \    {ul\n\
  \          {-   [UNHEALTHY]-One or more essential containers have failed their health check.\n\
  \              \n\
  \               }\n\
  \          {-   [UNKNOWN]-Any essential container running within the task is in an [UNKNOWN] \
   state and no other essential containers have an [UNHEALTHY] state.\n\
  \              \n\
  \               }\n\
  \          {-   [HEALTHY]-All essential containers within the task have passed their health \
   checks.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Consider the following task health example with 2 containers.\n\
  \   \n\
  \    {ul\n\
  \          {-  If Container1 is [UNHEALTHY] and Container2 is [UNKNOWN], the task health is \
   [UNHEALTHY].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [UNHEALTHY] and Container2 is [HEALTHY], the task health is \
   [UNHEALTHY].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [HEALTHY] and Container2 is [UNKNOWN], the task health is \
   [UNKNOWN].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [HEALTHY] and Container2 is [HEALTHY], the task health is \
   [HEALTHY].\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Consider the following task health example with 3 containers.\n\
  \   \n\
  \    {ul\n\
  \          {-  If Container1 is [UNHEALTHY] and Container2 is [UNKNOWN], and Container3 is \
   [UNKNOWN], the task health is [UNHEALTHY].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [UNHEALTHY] and Container2 is [UNKNOWN], and Container3 is \
   [HEALTHY], the task health is [UNHEALTHY].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [UNHEALTHY] and Container2 is [HEALTHY], and Container3 is \
   [HEALTHY], the task health is [UNHEALTHY].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [HEALTHY] and Container2 is [UNKNOWN], and Container3 is \
   [HEALTHY], the task health is [UNKNOWN].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [HEALTHY] and Container2 is [UNKNOWN], and Container3 is \
   [UNKNOWN], the task health is [UNKNOWN].\n\
  \              \n\
  \               }\n\
  \          {-  If Container1 is [HEALTHY] and Container2 is [HEALTHY], and Container3 is \
   [HEALTHY], the task health is [HEALTHY].\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If a task is run manually, and not as part of a service, the task will continue its \
   lifecycle regardless of its health status. For tasks that are part of a service, if the task \
   reports as unhealthy then the task will be stopped and the service scheduler will replace it.\n\
  \   \n\
  \    When a container health check fails for a task that is part of a service, the following \
   process occurs:\n\
  \    \n\
  \     {ol\n\
  \           {-  The task is marked as [UNHEALTHY].\n\
  \               \n\
  \                }\n\
  \           {-  The unhealthy task will be stopped, and during the stopping process, it will go \
   through the following states:\n\
  \               \n\
  \                {ul\n\
  \                      {-   [DEACTIVATING] - In this state, Amazon ECS performs additional steps \
   before stopping the task. For example, for tasks that are part of services configured to use \
   Elastic Load Balancing target groups, target groups will be deregistered in this state.\n\
  \                          \n\
  \                           }\n\
  \                      {-   [STOPPING] - The task is in the process of being stopped.\n\
  \                          \n\
  \                           }\n\
  \                      {-   [DEPROVISIONING] - Resources associated with the task are being \
   cleaned up.\n\
  \                          \n\
  \                           }\n\
  \                      {-   [STOPPED] - The task has been completely stopped.\n\
  \                          \n\
  \                           }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           {-  After the old task stops, a new task will be launched to ensure service \
   operation, and the new task will go through the following lifecycle:\n\
  \               \n\
  \                {ul\n\
  \                      {-   [PROVISIONING] - Resources required for the task are being \
   provisioned.\n\
  \                          \n\
  \                           }\n\
  \                      {-   [PENDING] - The task is waiting to be placed on a container instance.\n\
  \                          \n\
  \                           }\n\
  \                      {-   [ACTIVATING] - In this state, Amazon ECS pulls container images, \
   creates containers, configures task networking, registers load balancer target groups, and \
   configures service discovery status.\n\
  \                          \n\
  \                           }\n\
  \                      {-   [RUNNING] - The task is running and performing its work.\n\
  \                          \n\
  \                           }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           }\n\
  \   For more detailed information about task lifecycle states, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle-explanation.html}Task \
   lifecycle} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   \n\
  \    The following are notes about container health check support:\n\
  \    \n\
  \     {ul\n\
  \           {-  If the Amazon ECS container agent becomes disconnected from the Amazon ECS \
   service, this won't cause a container to transition to an [UNHEALTHY] status. This is by \
   design, to ensure that containers remain running during agent restarts or temporary \
   unavailability. The health check status is the \"last heard from\" response from the Amazon ECS \
   agent, so if the container was considered [HEALTHY] prior to the disconnect, that status will \
   remain until the agent reconnects and another health check occurs. There are no assumptions \
   made about the status of the container health checks.\n\
  \               \n\
  \                }\n\
  \           {-  Container health checks require version [1.17.0] or greater of the Amazon ECS \
   container agent. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html}Updating \
   the Amazon ECS container agent}.\n\
  \               \n\
  \                }\n\
  \           {-  Container health checks are supported for Fargate tasks if you're using platform \
   version [1.1.0] or greater. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
   platform versions}.\n\
  \               \n\
  \                }\n\
  \           {-  Container health checks aren't supported for tasks that are part of a service \
   that's configured to use a Classic Load Balancer.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   For an example of how to specify a task definition with multiple containers where container \
   dependency is specified, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/example_task_definitions.html#example_task_definition-containerdependency}Container \
   dependency} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   "]

type nonrec system_control = {
  value : string_ option;
      [@ocaml.doc
        "The namespaced kernel parameter to set a [value] for.\n\n\
        \ Valid IPC namespace values: [\"kernel.msgmax\" | \"kernel.msgmnb\" | \"kernel.msgmni\" | \
         \"kernel.sem\" | \"kernel.shmall\" | \"kernel.shmmax\" | \"kernel.shmmni\" | \
         \"kernel.shm_rmid_forced\"], and [Sysctls] that start with [\"fs.mqueue.*\"] \n\
        \ \n\
        \  Valid network namespace values: [Sysctls] that start with [\"net.*\"]. Only namespaced \
         [Sysctls] that exist within the container starting with \"net.* are accepted.\n\
        \  \n\
        \   All of these values are supported by Fargate.\n\
        \   "]
  namespace : string_ option; [@ocaml.doc "The namespaced kernel parameter to set a [value] for.\n"]
}
[@@ocaml.doc
  "A list of namespaced kernel parameters to set in the container. This parameter maps to \
   [Sysctls] in the docker container create command and the [--sysctl] option to docker run. For \
   example, you can configure [net.ipv4.tcp_keepalive_time] setting to maintain longer lived \
   connections.\n\n\
  \ We don't recommend that you specify network-related [systemControls] parameters for multiple \
   containers in a single task that also uses either the [awsvpc] or [host] network mode. Doing \
   this has the following disadvantages:\n\
  \ \n\
  \  {ul\n\
  \        {-  For tasks that use the [awsvpc] network mode including Fargate, if you set \
   [systemControls] for any container, it applies to all containers in the task. If you set \
   different [systemControls] for multiple containers in a single task, the container that's \
   started last determines which [systemControls] take effect.\n\
  \            \n\
  \             }\n\
  \        {-  For tasks that use the [host] network mode, the network namespace [systemControls] \
   aren't supported.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   If you're setting an IPC resource namespace to use for the containers in the task, the \
   following conditions apply to your system controls. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_definition_ipcmode}IPC \
   mode}.\n\
  \   \n\
  \    {ul\n\
  \          {-  For tasks that use the [host] IPC mode, IPC namespace [systemControls] aren't \
   supported.\n\
  \              \n\
  \               }\n\
  \          {-  For tasks that use the [task] IPC mode, IPC namespace [systemControls] values \
   apply to all containers within a task.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    This parameter is not supported for Windows containers.\n\
  \    \n\
  \       This parameter is only supported for tasks that are hosted on Fargate if the tasks are \
   using platform version [1.4.0] or later (Linux). This isn't supported for Windows containers on \
   Fargate.\n\
  \       \n\
  \        "]

type nonrec system_controls = system_control list [@@ocaml.doc ""]

type nonrec firelens_configuration_type = FLUENTBIT [@ocaml.doc ""] | FLUENTD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firelens_configuration_options_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec firelens_configuration = {
  options : firelens_configuration_options_map option;
      [@ocaml.doc
        "The options to use when configuring the log router. This field is optional and can be \
         used to specify a custom configuration file or to add additional metadata, such as the \
         task, task definition, cluster, and container instance details to the log event. If \
         specified, the syntax to use is \
         [\"options\":{\"enable-ecs-log-metadata\":\"true|false\",\"config-file-type:\"s3|file\",\"config-file-value\":\"arn:aws:s3:::mybucket/fluent.conf|filepath\"}]. \
         For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html#firelens-taskdef}Creating \
         a task definition that uses a FireLens configuration} in the {i Amazon Elastic Container \
         Service Developer Guide}.\n\n\
        \  Tasks hosted on Fargate only support the [file] configuration file type.\n\
        \  \n\
        \   "]
  type_ : firelens_configuration_type;
      [@ocaml.doc "The log router to use. The valid values are [fluentd] or [fluentbit].\n"]
}
[@@ocaml.doc
  "The FireLens configuration for the container. This is used to specify and configure a log \
   router for container logs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html}Custom log \
   routing} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

type nonrec container_definition = {
  credential_specs : string_list option;
      [@ocaml.doc
        "A list of ARNs in SSM or Amazon S3 to a credential spec ([CredSpec]) file that configures \
         the container for Active Directory authentication. We recommend that you use this \
         parameter instead of the [dockerSecurityOptions]. The maximum number of ARNs is 1.\n\n\
        \ There are two formats for each ARN.\n\
        \ \n\
        \   credentialspecdomainless:MyARN  You use [credentialspecdomainless:MyARN] to provide a \
         [CredSpec] with an additional section for a secret in Secrets Manager. You provide the \
         login credentials to the domain in the secret.\n\
        \                                   \n\
        \                                    Each task that runs on any container instance can \
         join different domains.\n\
        \                                    \n\
        \                                     You can use this format without joining the \
         container instance to a domain.\n\
        \                                     \n\
        \                                       credentialspec:MyARN  You use \
         [credentialspec:MyARN] to provide a [CredSpec] for a single domain.\n\
        \                                                             \n\
        \                                                              You must join the container \
         instance to the domain before you start any tasks that use this task definition.\n\
        \                                                              \n\
        \                                                                 In both formats, replace \
         [MyARN] with the ARN in SSM or Amazon S3.\n\
        \                                                                 \n\
        \                                                                  If you provide a \
         [credentialspecdomainless:MyARN], the [credspec] must provide a ARN in Secrets Manager \
         for a secret containing the username, password, and the domain to connect to. For better \
         security, the instance isn't joined to the domain for domainless authentication. Other \
         applications on the instance can't use the domainless credentials. You can use this \
         parameter to run tasks on the same instance, even it the tasks need to join different \
         domains. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/windows-gmsa.html}Using \
         gMSAs for Windows Containers} and \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/linux-gmsa.html}Using \
         gMSAs for Linux Containers}.\n\
        \                                                                  "]
  firelens_configuration : firelens_configuration option;
      [@ocaml.doc
        "The FireLens configuration for the container. This is used to specify and configure a log \
         router for container logs. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html}Custom \
         Log Routing} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  resource_requirements : resource_requirements option;
      [@ocaml.doc
        "The type and amount of a resource to assign to a container. The supported resources are \
         GPUs and Neuron devices.\n"]
  system_controls : system_controls option;
      [@ocaml.doc
        "A list of namespaced kernel parameters to set in the container. This parameter maps to \
         [Sysctls] in the docker container create command and the [--sysctl] option to docker run. \
         For example, you can configure [net.ipv4.tcp_keepalive_time] setting to maintain longer \
         lived connections.\n"]
  health_check : health_check option;
      [@ocaml.doc
        "The container health check command and associated configuration parameters for the \
         container. This parameter maps to [HealthCheck] in the docker container create command \
         and the [HEALTHCHECK] parameter of docker run.\n"]
  log_configuration : log_configuration option;
      [@ocaml.doc
        "The log configuration specification for the container.\n\n\
        \ This parameter maps to [LogConfig] in the docker container create command and the \
         [--log-driver] option to docker run. By default, containers use the same logging driver \
         that the Docker daemon uses. However the container can use a different logging driver \
         than the Docker daemon by specifying a log driver with this parameter in the container \
         definition. To use a different logging driver for a container, the log system must be \
         configured properly on the container instance (or on a different log server for remote \
         logging options). \n\
        \ \n\
        \   Amazon ECS currently supports a subset of the logging drivers available to the Docker \
         daemon (shown in the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html}LogConfiguration} \
         data type). Additional log drivers may be available in future releases of the Amazon ECS \
         container agent.\n\
        \   \n\
        \     This parameter requires version 1.18 of the Docker Remote API or greater on your \
         container instance. To check the Docker Remote API version on your container instance, \
         log in to your container instance and run the following command: [sudo docker version \
         --format '{{.Server.APIVersion}}'] \n\
        \     \n\
        \       The Amazon ECS container agent running on a container instance must register the \
         logging drivers available on that instance with the [ECS_AVAILABLE_LOGGING_DRIVERS] \
         environment variable before containers placed on that instance can use these log \
         configuration options. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html}Amazon \
         ECS Container Agent Configuration} in the {i Amazon Elastic Container Service Developer \
         Guide}.\n\
        \       \n\
        \        "]
  ulimits : ulimit_list option;
      [@ocaml.doc
        "A list of [ulimits] to set in the container. If a [ulimit] value is specified in a task \
         definition, it overrides the default values set by Docker. This parameter maps to \
         [Ulimits] in the docker container create command and the [--ulimit] option to docker run. \
         Valid naming values are displayed in the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_Ulimit.html}Ulimit} data \
         type.\n\n\
        \ Amazon ECS tasks hosted on Fargate use the default resource limit values set by the \
         operating system with the exception of the [nofile] resource limit parameter which \
         Fargate overrides. The [nofile] resource limit sets a restriction on the number of open \
         files that a container can use. The default [nofile] soft limit is [ 65535] and the \
         default hard limit is [65535].\n\
        \ \n\
        \  This parameter requires version 1.18 of the Docker Remote API or greater on your \
         container instance. To check the Docker Remote API version on your container instance, \
         log in to your container instance and run the following command: [sudo docker version \
         --format '{{.Server.APIVersion}}'] \n\
        \  \n\
        \    This parameter is not supported for Windows containers.\n\
        \    \n\
        \     "]
  docker_labels : docker_labels_map option;
      [@ocaml.doc
        "A key/value map of labels to add to the container. This parameter maps to [Labels] in the \
         docker container create command and the [--label] option to docker run. This parameter \
         requires version 1.18 of the Docker Remote API or greater on your container instance. To \
         check the Docker Remote API version on your container instance, log in to your container \
         instance and run the following command: [sudo docker version --format \
         '{{.Server.APIVersion}}'] \n"]
  pseudo_terminal : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is [true], a TTY is allocated. This parameter maps to [Tty] in the \
         docker container create command and the [--tty] option to docker run.\n"]
  interactive : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is [true], you can deploy containerized applications that require \
         [stdin] or a [tty] to be allocated. This parameter maps to [OpenStdin] in the docker \
         container create command and the [--interactive] option to docker run.\n"]
  docker_security_options : string_list option;
      [@ocaml.doc
        "A list of strings to provide custom configuration for multiple security systems. This \
         field isn't valid for containers in tasks using the Fargate launch type.\n\n\
        \ For Linux tasks on EC2, this parameter can be used to reference custom labels for \
         SELinux and AppArmor multi-level security systems.\n\
        \ \n\
        \  For any tasks on EC2, this parameter can be used to reference a credential spec file \
         that configures a container for Active Directory authentication. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/windows-gmsa.html}Using \
         gMSAs for Windows Containers} and \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/linux-gmsa.html}Using \
         gMSAs for Linux Containers} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  \n\
        \   This parameter maps to [SecurityOpt] in the docker container create command and the \
         [--security-opt] option to docker run.\n\
        \   \n\
        \     The Amazon ECS container agent running on a container instance must register with \
         the [ECS_SELINUX_CAPABLE=true] or [ECS_APPARMOR_CAPABLE=true] environment variables \
         before containers placed on that instance can use these security options. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html}Amazon \
         ECS Container Agent Configuration} in the {i Amazon Elastic Container Service Developer \
         Guide}.\n\
        \     \n\
        \       Valid values: \"no-new-privileges\" | \"apparmor:PROFILE\" | \"label:value\" | \
         \"credentialspec:CredentialSpecFilePath\"\n\
        \       "]
  extra_hosts : host_entry_list option;
      [@ocaml.doc
        "A list of hostnames and IP address mappings to append to the [/etc/hosts] file on the \
         container. This parameter maps to [ExtraHosts] in the docker container create command and \
         the [--add-host] option to docker run.\n\n\
        \  This parameter isn't supported for Windows containers or tasks that use the [awsvpc] \
         network mode.\n\
        \  \n\
        \   "]
  dns_search_domains : string_list option;
      [@ocaml.doc
        "A list of DNS search domains that are presented to the container. This parameter maps to \
         [DnsSearch] in the docker container create command and the [--dns-search] option to \
         docker run.\n\n\
        \  This parameter is not supported for Windows containers.\n\
        \  \n\
        \   "]
  dns_servers : string_list option;
      [@ocaml.doc
        "A list of DNS servers that are presented to the container. This parameter maps to [Dns] \
         in the docker container create command and the [--dns] option to docker run.\n\n\
        \  This parameter is not supported for Windows containers.\n\
        \  \n\
        \   "]
  readonly_root_filesystem : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is true, the container is given read-only access to its root file \
         system. This parameter maps to [ReadonlyRootfs] in the docker container create command \
         and the [--read-only] option to docker run.\n\n\
        \  This parameter is not supported for Windows containers.\n\
        \  \n\
        \   "]
  privileged : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is true, the container is given elevated privileges on the host \
         container instance (similar to the [root] user). This parameter maps to [Privileged] in \
         the docker container create command and the [--privileged] option to docker run\n\n\
        \  This parameter is not supported for Windows containers or tasks run on Fargate.\n\
        \  \n\
        \   "]
  disable_networking : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is true, networking is off within the container. This parameter maps \
         to [NetworkDisabled] in the docker container create command.\n\n\
        \  This parameter is not supported for Windows containers.\n\
        \  \n\
        \   "]
  working_directory : string_ option;
      [@ocaml.doc
        "The working directory to run commands inside the container in. This parameter maps to \
         [WorkingDir] in the docker container create command and the [--workdir] option to docker \
         run.\n"]
  user : string_ option;
      [@ocaml.doc
        "The user to use inside the container. This parameter maps to [User] in the docker \
         container create command and the [--user] option to docker run.\n\n\
        \  When running tasks using the [host] network mode, don't run containers using the root \
         user (UID 0). We recommend using a non-root user for better security.\n\
        \  \n\
        \    You can specify the [user] using the following formats. If specifying a UID or GID, \
         you must specify it as a positive integer.\n\
        \    \n\
        \     {ul\n\
        \           {-   [user] \n\
        \               \n\
        \                }\n\
        \           {-   [user:group] \n\
        \               \n\
        \                }\n\
        \           {-   [uid] \n\
        \               \n\
        \                }\n\
        \           {-   [uid:gid] \n\
        \               \n\
        \                }\n\
        \           {-   [user:gid] \n\
        \               \n\
        \                }\n\
        \           {-   [uid:group] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \    This parameter is not supported for Windows containers.\n\
        \    \n\
        \     "]
  hostname : string_ option;
      [@ocaml.doc
        "The hostname to use for your container. This parameter maps to [Hostname] in the docker \
         container create command and the [--hostname] option to docker run.\n\n\
        \  The [hostname] parameter is not supported if you're using the [awsvpc] network mode.\n\
        \  \n\
        \   "]
  version_consistency : version_consistency option;
      [@ocaml.doc
        "Specifies whether Amazon ECS will resolve the container image tag provided in the \
         container definition to an image digest. By default, the value is [enabled]. If you set \
         the value for a container as [disabled], Amazon ECS will not resolve the provided \
         container image tag to a digest and will use the original image URI specified in the \
         container definition for deployment. For more information about container image \
         resolution, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html#deployment-container-image-stability}Container \
         image resolution} in the {i Amazon ECS Developer Guide}.\n"]
  stop_timeout : boxed_integer option;
      [@ocaml.doc
        "Time duration (in seconds) to wait before the container is forcefully killed if it \
         doesn't exit normally on its own.\n\n\
        \ For tasks using the Fargate launch type, the task or service requires the following \
         platforms:\n\
        \ \n\
        \  {ul\n\
        \        {-  Linux platform version [1.3.0] or later.\n\
        \            \n\
        \             }\n\
        \        {-  Windows platform version [1.0.0] or later.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For tasks that use the Fargate launch type, the max stop timeout value is 120 seconds \
         and if the parameter is not specified, the default value of 30 seconds is used.\n\
        \   \n\
        \    For tasks that use the EC2 launch type, if the [stopTimeout] parameter isn't \
         specified, the value set for the Amazon ECS container agent configuration variable \
         [ECS_CONTAINER_STOP_TIMEOUT] is used. If neither the [stopTimeout] parameter or the \
         [ECS_CONTAINER_STOP_TIMEOUT] agent configuration variable are set, then the default \
         values of 30 seconds for Linux containers and 30 seconds on Windows containers are used. \
         Your container instances require at least version 1.26.0 of the container agent to use a \
         container stop timeout value. However, we recommend using the latest container agent \
         version. For information about checking your agent version and updating to the latest \
         version, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html}Updating \
         the Amazon ECS Container Agent} in the {i Amazon Elastic Container Service Developer \
         Guide}. If you're using an Amazon ECS-optimized Linux AMI, your instance needs at least \
         version 1.26.0-1 of the [ecs-init] package. If your container instances are launched from \
         version [20190301] or later, then they contain the required versions of the container \
         agent and [ecs-init]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html}Amazon \
         ECS-optimized Linux AMI} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \    \n\
        \     The valid values for Fargate are 2-120 seconds.\n\
        \     "]
  start_timeout : boxed_integer option;
      [@ocaml.doc
        "Time duration (in seconds) to wait before giving up on resolving dependencies for a \
         container. For example, you specify two containers in a task definition with containerA \
         having a dependency on containerB reaching a [COMPLETE], [SUCCESS], or [HEALTHY] status. \
         If a [startTimeout] value is specified for containerB and it doesn't reach the desired \
         status within that time then containerA gives up and not start. This results in the task \
         transitioning to a [STOPPED] state.\n\n\
        \  When the [ECS_CONTAINER_START_TIMEOUT] container agent configuration variable is used, \
         it's enforced independently from this start timeout value.\n\
        \  \n\
        \    For tasks using the Fargate launch type, the task or service requires the following \
         platforms:\n\
        \    \n\
        \     {ul\n\
        \           {-  Linux platform version [1.3.0] or later.\n\
        \               \n\
        \                }\n\
        \           {-  Windows platform version [1.0.0] or later.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   For tasks using the EC2 launch type, your container instances require at least version \
         [1.26.0] of the container agent to use a container start timeout value. However, we \
         recommend using the latest container agent version. For information about checking your \
         agent version and updating to the latest version, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html}Updating \
         the Amazon ECS Container Agent} in the {i Amazon Elastic Container Service Developer \
         Guide}. If you're using an Amazon ECS-optimized Linux AMI, your instance needs at least \
         version [1.26.0-1] of the [ecs-init] package. If your container instances are launched \
         from version [20190301] or later, then they contain the required versions of the \
         container agent and [ecs-init]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html}Amazon \
         ECS-optimized Linux AMI} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \   \n\
        \    The valid values for Fargate are 2-120 seconds.\n\
        \    "]
  depends_on : container_dependencies option;
      [@ocaml.doc
        "The dependencies defined for container startup and shutdown. A container can contain \
         multiple dependencies on other containers in a task definition. When a dependency is \
         defined for container startup, for container shutdown it is reversed.\n\n\
        \ For tasks using the EC2 launch type, the container instances require at least version \
         1.26.0 of the container agent to turn on container dependencies. However, we recommend \
         using the latest container agent version. For information about checking your agent \
         version and updating to the latest version, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html}Updating \
         the Amazon ECS Container Agent} in the {i Amazon Elastic Container Service Developer \
         Guide}. If you're using an Amazon ECS-optimized Linux AMI, your instance needs at least \
         version 1.26.0-1 of the [ecs-init] package. If your container instances are launched from \
         version [20190301] or later, then they contain the required versions of the container \
         agent and [ecs-init]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html}Amazon \
         ECS-optimized Linux AMI} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ \n\
        \  For tasks using the Fargate launch type, the task or service requires the following \
         platforms:\n\
        \  \n\
        \   {ul\n\
        \         {-  Linux platform version [1.3.0] or later.\n\
        \             \n\
        \              }\n\
        \         {-  Windows platform version [1.0.0] or later.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  secrets : secret_list option;
      [@ocaml.doc
        "The secrets to pass to the container. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html}Specifying \
         Sensitive Data} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  linux_parameters : linux_parameters option;
      [@ocaml.doc
        "Linux-specific modifications that are applied to the default Docker container \
         configuration, such as Linux kernel capabilities. For more information see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_KernelCapabilities.html}KernelCapabilities}.\n\n\
        \  This parameter is not supported for Windows containers.\n\
        \  \n\
        \   "]
  volumes_from : volume_from_list option;
      [@ocaml.doc
        "Data volumes to mount from another container. This parameter maps to [VolumesFrom] in the \
         docker container create command and the [--volumes-from] option to docker run.\n"]
  mount_points : mount_point_list option;
      [@ocaml.doc
        "The mount points for data volumes in your container.\n\n\
        \ This parameter maps to [Volumes] in the docker container create command and the \
         [--volume] option to docker run.\n\
        \ \n\
        \  Windows containers can mount whole directories on the same drive as [$env:ProgramData]. \
         Windows containers can't mount directories on a different drive, and mount point can't be \
         across drives.\n\
        \  "]
  environment_files : environment_files option;
      [@ocaml.doc
        "A list of files containing the environment variables to pass to a container. This \
         parameter maps to the [--env-file] option to docker run.\n\n\
        \ You can specify up to ten environment files. The file must have a [.env] file extension. \
         Each line in an environment file contains an environment variable in [VARIABLE=VALUE] \
         format. Lines beginning with [#] are treated as comments and are ignored.\n\
        \ \n\
        \  If there are environment variables specified using the [environment] parameter in a \
         container definition, they take precedence over the variables contained within an \
         environment file. If multiple environment files are specified that contain the same \
         variable, they're processed from the top down. We recommend that you use unique variable \
         names. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/taskdef-envfiles.html}Specifying \
         Environment Variables} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  "]
  environment : environment_variables option;
      [@ocaml.doc
        "The environment variables to pass to a container. This parameter maps to [Env] in the \
         docker container create command and the [--env] option to docker run.\n\n\
        \  We don't recommend that you use plaintext environment variables for sensitive \
         information, such as credential data.\n\
        \  \n\
        \   "]
  command : string_list option;
      [@ocaml.doc
        "The command that's passed to the container. This parameter maps to [Cmd] in the docker \
         container create command and the [COMMAND] parameter to docker run. If there are multiple \
         arguments, each argument is a separated string in the array.\n"]
  entry_point : string_list option;
      [@ocaml.doc
        " Early versions of the Amazon ECS container agent don't properly handle [entryPoint] \
         parameters. If you have problems using [entryPoint], update your container agent or enter \
         your commands and arguments as [command] array items instead.\n\
        \ \n\
        \   The entry point that's passed to the container. This parameter maps to [Entrypoint] in \
         the docker container create command and the [--entrypoint] option to docker run.\n\
        \   "]
  restart_policy : container_restart_policy option;
      [@ocaml.doc
        "The restart policy for a container. When you set up a restart policy, Amazon ECS can \
         restart the container without needing to replace the task. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-restart-policy.html}Restart \
         individual containers in Amazon ECS tasks with container restart policies} in the {i \
         Amazon Elastic Container Service Developer Guide}.\n"]
  essential : boxed_boolean option;
      [@ocaml.doc
        "If the [essential] parameter of a container is marked as [true], and that container fails \
         or stops for any reason, all other containers that are part of the task are stopped. If \
         the [essential] parameter of a container is marked as [false], its failure doesn't affect \
         the rest of the containers in a task. If this parameter is omitted, a container is \
         assumed to be essential.\n\n\
        \ All tasks must have at least one essential container. If you have an application that's \
         composed of multiple containers, group containers that are used for a common purpose into \
         components, and separate the different components into multiple task definitions. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/application_architecture.html}Application \
         Architecture} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  port_mappings : port_mapping_list option;
      [@ocaml.doc
        "The list of port mappings for the container. Port mappings allow containers to access \
         ports on the host container instance to send or receive traffic.\n\n\
        \ For task definitions that use the [awsvpc] network mode, only specify the \
         [containerPort]. The [hostPort] can be left blank or it must be the same value as the \
         [containerPort].\n\
        \ \n\
        \  Port mappings on Windows use the [NetNAT] gateway address rather than [localhost]. \
         There's no loopback for port mappings on Windows, so you can't access a container's \
         mapped port from the host itself. \n\
        \  \n\
        \   This parameter maps to [PortBindings] in the docker container create command and the \
         [--publish] option to docker run. If the network mode of a task definition is set to \
         [none], then you can't specify port mappings. If the network mode of a task definition is \
         set to [host], then host ports must either be undefined or they must match the container \
         port in the port mapping.\n\
        \   \n\
        \     After a task reaches the [RUNNING] status, manual and automatic host and container \
         port assignments are visible in the {b Network Bindings} section of a container \
         description for a selected task in the Amazon ECS console. The assignments are also \
         visible in the [networkBindings] section \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html}DescribeTasks} \
         responses.\n\
        \     \n\
        \      "]
  links : string_list option;
      [@ocaml.doc
        "The [links] parameter allows containers to communicate with each other without the need \
         for port mappings. This parameter is only supported if the network mode of a task \
         definition is [bridge]. The [name:internalName] construct is analogous to [name:alias] in \
         Docker links. Up to 255 letters (uppercase and lowercase), numbers, underscores, and \
         hyphens are allowed.. This parameter maps to [Links] in the docker container create \
         command and the [--link] option to docker run.\n\n\
        \  This parameter is not supported for Windows containers.\n\
        \  \n\
        \     Containers that are collocated on a single container instance may be able to \
         communicate with each other without requiring links or host port mappings. Network \
         isolation is achieved on the container instance using security groups and VPC settings.\n\
        \     \n\
        \      "]
  memory_reservation : boxed_integer option;
      [@ocaml.doc
        "The soft limit (in MiB) of memory to reserve for the container. When system memory is \
         under heavy contention, Docker attempts to keep the container memory to this soft limit. \
         However, your container can consume more memory when it needs to, up to either the hard \
         limit specified with the [memory] parameter (if applicable), or all of the available \
         memory on the container instance, whichever comes first. This parameter maps to \
         [MemoryReservation] in the docker container create command and the [--memory-reservation] \
         option to docker run.\n\n\
        \ If a task-level memory value is not specified, you must specify a non-zero integer for \
         one or both of [memory] or [memoryReservation] in a container definition. If you specify \
         both, [memory] must be greater than [memoryReservation]. If you specify \
         [memoryReservation], then that value is subtracted from the available memory resources \
         for the container instance where the container is placed. Otherwise, the value of \
         [memory] is used.\n\
        \ \n\
        \  For example, if your container normally uses 128 MiB of memory, but occasionally bursts \
         to 256 MiB of memory for short periods of time, you can set a [memoryReservation] of 128 \
         MiB, and a [memory] hard limit of 300 MiB. This configuration would allow the container \
         to only reserve 128 MiB of memory from the remaining resources on the container instance, \
         but also allow the container to consume more memory resources when needed.\n\
        \  \n\
        \   The Docker 20.10.0 or later daemon reserves a minimum of 6 MiB of memory for a \
         container. So, don't specify less than 6 MiB of memory for your containers. \n\
        \   \n\
        \    The Docker 19.03.13-ce or earlier daemon reserves a minimum of 4 MiB of memory for a \
         container. So, don't specify less than 4 MiB of memory for your containers.\n\
        \    "]
  memory : boxed_integer option;
      [@ocaml.doc
        "The amount (in MiB) of memory to present to the container. If your container attempts to \
         exceed the memory specified here, the container is killed. The total amount of memory \
         reserved for all containers within a task must be lower than the task [memory] value, if \
         one is specified. This parameter maps to [Memory] in the docker container create command \
         and the [--memory] option to docker run.\n\n\
        \ If using the Fargate launch type, this parameter is optional.\n\
        \ \n\
        \  If using the EC2 launch type, you must specify either a task-level memory value or a \
         container-level memory value. If you specify both a container-level [memory] and \
         [memoryReservation] value, [memory] must be greater than [memoryReservation]. If you \
         specify [memoryReservation], then that value is subtracted from the available memory \
         resources for the container instance where the container is placed. Otherwise, the value \
         of [memory] is used.\n\
        \  \n\
        \   The Docker 20.10.0 or later daemon reserves a minimum of 6 MiB of memory for a \
         container. So, don't specify less than 6 MiB of memory for your containers. \n\
        \   \n\
        \    The Docker 19.03.13-ce or earlier daemon reserves a minimum of 4 MiB of memory for a \
         container. So, don't specify less than 4 MiB of memory for your containers.\n\
        \    "]
  cpu : integer option;
      [@ocaml.doc
        "The number of [cpu] units reserved for the container. This parameter maps to [CpuShares] \
         in the docker container create command and the [--cpu-shares] option to docker run.\n\n\
        \ This field is optional for tasks using the Fargate launch type, and the only requirement \
         is that the total amount of CPU reserved for all containers within a task be lower than \
         the task-level [cpu] value.\n\
        \ \n\
        \   You can determine the number of CPU units that are available per EC2 instance type by \
         multiplying the vCPUs listed for that instance type on the \
         {{:http://aws.amazon.com/ec2/instance-types/}Amazon EC2 Instances} detail page by 1,024.\n\
        \   \n\
        \     Linux containers share unallocated CPU units with other containers on the container \
         instance with the same ratio as their allocated amount. For example, if you run a \
         single-container task on a single-core instance type with 512 CPU units specified for \
         that container, and that's the only task running on the container instance, that \
         container could use the full 1,024 CPU unit share at any given time. However, if you \
         launched another copy of the same task on that container instance, each task is \
         guaranteed a minimum of 512 CPU units when needed. Moreover, each container could float \
         to higher CPU usage if the other container was not using it. If both tasks were 100% \
         active all of the time, they would be limited to 512 CPU units.\n\
        \     \n\
        \      On Linux container instances, the Docker daemon on the container instance uses the \
         CPU value to calculate the relative CPU share ratios for running containers. The minimum \
         valid CPU share value that the Linux kernel allows is 2, and the maximum valid CPU share \
         value that the Linux kernel allows is 262144. However, the CPU parameter isn't required, \
         and you can use CPU values below 2 or above 262144 in your container definitions. For CPU \
         values below 2 (including null) or above 262144, the behavior varies based on your Amazon \
         ECS container agent version:\n\
        \      \n\
        \       {ul\n\
        \             {-   {b Agent versions less than or equal to 1.1.0:} Null and zero CPU \
         values are passed to Docker as 0, which Docker then converts to 1,024 CPU shares. CPU \
         values of 1 are passed to Docker as 1, which the Linux kernel converts to two CPU shares.\n\
        \                 \n\
        \                  }\n\
        \             {-   {b Agent versions greater than or equal to 1.2.0:} Null, zero, and CPU \
         values of 1 are passed to Docker as 2.\n\
        \                 \n\
        \                  }\n\
        \             {-   {b Agent versions greater than or equal to 1.84.0:} CPU values greater \
         than 256 vCPU are passed to Docker as 256, which is equivalent to 262144 CPU shares.\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \   On Windows container instances, the CPU limit is enforced as an absolute limit, or a \
         quota. Windows containers only have access to the specified amount of CPU that's \
         described in the task definition. A null or zero CPU value is passed to Docker as [0], \
         which Windows interprets as 1% of one CPU.\n\
        \   "]
  repository_credentials : repository_credentials option;
      [@ocaml.doc "The private repository authentication credentials to use.\n"]
  image : string_ option;
      [@ocaml.doc
        "The image used to start a container. This string is passed directly to the Docker daemon. \
         By default, images in the Docker Hub registry are available. Other repositories are \
         specified with either \n\
         {[\n\
        \ {i repository-url}/{i image}:{i tag} \n\
         ]}\n\
        \ or \n\
         {[\n\
        \ {i repository-url}/{i image}\\@{i digest} \n\
         ]}\n\
         . For images using tags (repository-url/image:tag), up to 255 characters total are \
         allowed, including letters (uppercase and lowercase), numbers, hyphens, underscores, \
         colons, periods, forward slashes, and number signs (#). For images using digests \
         (repository-url/image\\@digest), the 255 character limit applies only to the repository \
         URL and image name (everything before the \\@ sign). The only supported hash function is \
         sha256, and the hash value after sha256: must be exactly 64 characters (only letters A-F, \
         a-f, and numbers 0-9 are allowed). This parameter maps to [Image] in the docker container \
         create command and the [IMAGE] parameter of docker run.\n\n\
        \ {ul\n\
        \       {-  When a new task starts, the Amazon ECS container agent pulls the latest \
         version of the specified image and tag for the container to use. However, subsequent \
         updates to a repository image aren't propagated to already running tasks.\n\
        \           \n\
        \            }\n\
        \       {-  Images in Amazon ECR repositories can be specified by either using the full \
         [registry/repository:tag] or [registry/repository@digest]. For example, \
         [012345678910.dkr.ecr.<region-name>.amazonaws.com/<repository-name>:latest] or \
         [012345678910.dkr.ecr.<region-name>.amazonaws.com/<repository-name>@sha256:94afd1f2e64d908bc90dbca0035a5b567EXAMPLE]. \n\
        \           \n\
        \            }\n\
        \       {-  Images in official repositories on Docker Hub use a single name (for example, \
         [ubuntu] or [mongo]).\n\
        \           \n\
        \            }\n\
        \       {-  Images in other repositories on Docker Hub are qualified with an organization \
         name (for example, [amazon/amazon-ecs-agent]).\n\
        \           \n\
        \            }\n\
        \       {-  Images in other online repositories are qualified further by a domain name \
         (for example, [quay.io/assemblyline/ubuntu]).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : string_ option;
      [@ocaml.doc
        "The name of a container. If you're linking multiple containers together in a task \
         definition, the [name] of one container can be entered in the [links] of another \
         container to connect the containers. Up to 255 letters (uppercase and lowercase), \
         numbers, underscores, and hyphens are allowed. This parameter maps to [name] in the \
         docker container create command and the [--name] option to docker run. \n"]
}
[@@ocaml.doc
  "Container definitions are used in task definitions to describe the different containers that \
   are launched as part of a task.\n"]

type nonrec container_definitions = container_definition list [@@ocaml.doc ""]

type nonrec network_mode =
  | NONE [@ocaml.doc ""]
  | AWSVPC [@ocaml.doc ""]
  | HOST [@ocaml.doc ""]
  | BRIDGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec requires_attributes = attribute list [@@ocaml.doc ""]

type nonrec compatibility =
  | MANAGED_INSTANCES [@ocaml.doc ""]
  | EXTERNAL [@ocaml.doc ""]
  | FARGATE [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compatibility_list = compatibility list [@@ocaml.doc ""]

type nonrec cpu_architecture = ARM64 [@ocaml.doc ""] | X86_64 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec os_family =
  | LINUX [@ocaml.doc ""]
  | WINDOWS_SERVER_20H2_CORE [@ocaml.doc ""]
  | WINDOWS_SERVER_2025_FULL [@ocaml.doc ""]
  | WINDOWS_SERVER_2025_CORE [@ocaml.doc ""]
  | WINDOWS_SERVER_2022_FULL [@ocaml.doc ""]
  | WINDOWS_SERVER_2022_CORE [@ocaml.doc ""]
  | WINDOWS_SERVER_2004_CORE [@ocaml.doc ""]
  | WINDOWS_SERVER_2016_FULL [@ocaml.doc ""]
  | WINDOWS_SERVER_2019_CORE [@ocaml.doc ""]
  | WINDOWS_SERVER_2019_FULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec runtime_platform = {
  operating_system_family : os_family option; [@ocaml.doc "The operating system.\n"]
  cpu_architecture : cpu_architecture option;
      [@ocaml.doc
        "The CPU architecture.\n\n\
        \ You can run your Linux tasks on an ARM-based platform by setting the value to [ARM64]. \
         This option is available for tasks that run on Linux Amazon EC2 instance, Amazon ECS \
         Managed Instances, or Linux containers on Fargate.\n\
        \ "]
}
[@@ocaml.doc
  "Information about the platform for the Amazon ECS service or task.\n\n\
  \ For more information about [RuntimePlatform], see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#runtime-platform}RuntimePlatform} \
   in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

type nonrec pid_mode = TASK [@ocaml.doc ""] | HOST [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ipc_mode = NONE [@ocaml.doc ""] | TASK [@ocaml.doc ""] | HOST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec proxy_configuration_type = APPMESH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec proxy_configuration_properties = key_value_pair list [@@ocaml.doc ""]

type nonrec proxy_configuration = {
  properties : proxy_configuration_properties option;
      [@ocaml.doc
        "The set of network configuration parameters to provide the Container Network Interface \
         (CNI) plugin, specified as key-value pairs.\n\n\
        \ {ul\n\
        \       {-   [IgnoredUID] - (Required) The user ID (UID) of the proxy container as defined \
         by the [user] parameter in a container definition. This is used to ensure the proxy \
         ignores its own traffic. If [IgnoredGID] is specified, this field can be empty.\n\
        \           \n\
        \            }\n\
        \       {-   [IgnoredGID] - (Required) The group ID (GID) of the proxy container as \
         defined by the [user] parameter in a container definition. This is used to ensure the \
         proxy ignores its own traffic. If [IgnoredUID] is specified, this field can be empty.\n\
        \           \n\
        \            }\n\
        \       {-   [AppPorts] - (Required) The list of ports that the application uses. Network \
         traffic to these ports is forwarded to the [ProxyIngressPort] and [ProxyEgressPort].\n\
        \           \n\
        \            }\n\
        \       {-   [ProxyIngressPort] - (Required) Specifies the port that incoming traffic to \
         the [AppPorts] is directed to.\n\
        \           \n\
        \            }\n\
        \       {-   [ProxyEgressPort] - (Required) Specifies the port that outgoing traffic from \
         the [AppPorts] is directed to.\n\
        \           \n\
        \            }\n\
        \       {-   [EgressIgnoredPorts] - (Required) The egress traffic going to the specified \
         ports is ignored and not redirected to the [ProxyEgressPort]. It can be an empty list.\n\
        \           \n\
        \            }\n\
        \       {-   [EgressIgnoredIPs] - (Required) The egress traffic going to the specified IP \
         addresses is ignored and not redirected to the [ProxyEgressPort]. It can be an empty list.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  container_name : string_;
      [@ocaml.doc "The name of the container that will serve as the App Mesh proxy.\n"]
  type_ : proxy_configuration_type option;
      [@ocaml.doc "The proxy type. The only supported value is [APPMESH].\n"]
}
[@@ocaml.doc
  "The configuration details for the App Mesh proxy.\n\n\
  \ For tasks that use the EC2 launch type, the container instances require at least version \
   1.26.0 of the container agent and at least version 1.26.0-1 of the [ecs-init] package to use a \
   proxy configuration. If your container instances are launched from the Amazon ECS optimized AMI \
   version [20190301] or later, then they contain the required versions of the container agent and \
   [ecs-init]. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html}Amazon \
   ECS-optimized Linux AMI} \n\
  \ "]

type nonrec task_definition = {
  enable_fault_injection : boxed_boolean option;
      [@ocaml.doc
        "Enables fault injection and allows for fault injection requests to be accepted from the \
         task's containers. The default value is [false].\n"]
  ephemeral_storage : ephemeral_storage option;
      [@ocaml.doc "The ephemeral storage settings to use for tasks run with the task definition.\n"]
  registered_by : string_ option;
      [@ocaml.doc "The principal that registered the task definition.\n"]
  delete_requested_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the task definition delete was requested.\n"]
  deregistered_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the task definition was deregistered.\n"]
  registered_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the task definition was registered.\n"]
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc
        "The configuration details for the App Mesh proxy.\n\n\
        \ Your Amazon ECS container instances require at least version 1.26.0 of the container \
         agent and at least version 1.26.0-1 of the [ecs-init] package to use a proxy \
         configuration. If your container instances are launched from the Amazon ECS optimized AMI \
         version [20190301] or later, they contain the required versions of the container agent \
         and [ecs-init]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html}Amazon \
         ECS-optimized Linux AMI} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  ipc_mode : ipc_mode option;
      [@ocaml.doc
        "The IPC resource namespace to use for the containers in the task. The valid values are \
         [host], [task], or [none]. If [host] is specified, then all containers within the tasks \
         that specified the [host] IPC mode on the same container instance share the same IPC \
         resources with the host Amazon EC2 instance. If [task] is specified, all containers \
         within the specified task share the same IPC resources. If [none] is specified, then IPC \
         resources within the containers of a task are private and not shared with other \
         containers in a task or on the container instance. If no value is specified, then the IPC \
         resource namespace sharing depends on the Docker daemon setting on the container \
         instance.\n\n\
        \ If the [host] IPC mode is used, be aware that there is a heightened risk of undesired \
         IPC namespace expose.\n\
        \ \n\
        \  If you are setting namespaced kernel parameters using [systemControls] for the \
         containers in the task, the following will apply to your IPC resource namespace. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html}System \
         Controls} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  \n\
        \   {ul\n\
        \         {-  For tasks that use the [host] IPC mode, IPC namespace related \
         [systemControls] are not supported.\n\
        \             \n\
        \              }\n\
        \         {-  For tasks that use the [task] IPC mode, IPC namespace related \
         [systemControls] will apply to all containers within a task.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \    This parameter is not supported for Windows containers or tasks run on Fargate.\n\
        \    \n\
        \     "]
  pid_mode : pid_mode option;
      [@ocaml.doc
        "The process namespace to use for the containers in the task. The valid values are [host] \
         or [task]. On Fargate for Linux containers, the only valid value is [task]. For example, \
         monitoring sidecars might need [pidMode] to access information about other containers \
         running in the same task.\n\n\
        \ If [host] is specified, all containers within the tasks that specified the [host] PID \
         mode on the same container instance share the same process namespace with the host Amazon \
         EC2 instance.\n\
        \ \n\
        \  If [task] is specified, all containers within the specified task share the same process \
         namespace.\n\
        \  \n\
        \   If no value is specified, the The default is a private namespace for each container.\n\
        \   \n\
        \    If the [host] PID mode is used, there's a heightened risk of undesired process \
         namespace exposure.\n\
        \    \n\
        \      This parameter is not supported for Windows containers.\n\
        \      \n\
        \         This parameter is only supported for tasks that are hosted on Fargate if the \
         tasks are using platform version [1.4.0] or later (Linux). This isn't supported for \
         Windows containers on Fargate.\n\
        \         \n\
        \          "]
  inference_accelerators : inference_accelerators option;
      [@ocaml.doc "The Elastic Inference accelerator that's associated with the task.\n"]
  memory : string_ option;
      [@ocaml.doc
        "The amount (in MiB) of memory used by the task.\n\n\
        \ If your tasks runs on Amazon EC2 instances, you must specify either a task-level memory \
         value or a container-level memory value. This field is optional and any value can be \
         used. If a task-level memory value is specified, the container-level memory value is \
         optional. For more information regarding container-level memory and memory reservation, \
         see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html}ContainerDefinition}.\n\
        \ \n\
        \  If your tasks runs on Fargate, this field is required. You must use one of the \
         following values. The value you choose determines your range of valid values for the \
         [cpu] parameter.\n\
        \  \n\
        \   {ul\n\
        \         {-  512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available [cpu] values: 256 (.25 \
         vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available [cpu] values: \
         512 (.5 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 \
         GB), 8192 (8 GB) - Available [cpu] values: 1024 (1 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) - \
         Available [cpu] values: 2048 (2 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) - \
         Available [cpu] values: 4096 (4 vCPU)\n\
        \             \n\
        \              }\n\
        \         {-  Between 16 GB and 60 GB in 4 GB increments - Available [cpu] values: 8192 (8 \
         vCPU)\n\
        \             \n\
        \              This option requires Linux platform [1.4.0] or later.\n\
        \              \n\
        \               }\n\
        \         {-  Between 32GB and 120 GB in 8 GB increments - Available [cpu] values: 16384 \
         (16 vCPU)\n\
        \             \n\
        \              This option requires Linux platform [1.4.0] or later.\n\
        \              \n\
        \               }\n\
        \         }\n\
        \  "]
  cpu : string_ option;
      [@ocaml.doc
        "The number of [cpu] units used by the task. If you use the EC2 launch type, this field is \
         optional. Any value can be used. If you use the Fargate launch type, this field is \
         required. You must use one of the following values. The value that you choose determines \
         your range of valid values for the [memory] parameter.\n\n\
        \ If you're using the EC2 launch type or the external launch type, this field is optional. \
         Supported values are between [128] CPU units ([0.125] vCPUs) and [196608] CPU units \
         ([192] vCPUs). \n\
        \ \n\
        \  This field is required for Fargate. For information about the valid values, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size}Task \
         size} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  "]
  requires_compatibilities : compatibility_list option;
      [@ocaml.doc
        "The task launch types the task definition was validated against. The valid values are \
         [MANAGED_INSTANCES], [EC2], [FARGATE], and [EXTERNAL]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  runtime_platform : runtime_platform option;
      [@ocaml.doc
        "The operating system that your task definitions are running on. A platform family is \
         specified only for tasks using the Fargate launch type. \n\n\
        \ When you specify a task in a service, this value must match the [runtimePlatform] value \
         of the service.\n\
        \ "]
  compatibilities : compatibility_list option;
      [@ocaml.doc
        "Amazon ECS validates the task definition parameters with those supported by the launch \
         type. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  placement_constraints : task_definition_placement_constraints option;
      [@ocaml.doc
        "An array of placement constraint objects to use for tasks.\n\n\
        \  This parameter isn't supported for tasks run on Fargate.\n\
        \  \n\
        \   "]
  requires_attributes : requires_attributes option;
      [@ocaml.doc
        "The container instance attributes required by your task. When an Amazon EC2 instance is \
         registered to your cluster, the Amazon ECS container agent assigns some standard \
         attributes to the instance. You can apply custom attributes. These are specified as \
         key-value pairs using the Amazon ECS console or the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAttributes.html}PutAttributes} \
         API. These attributes are used when determining task placement for tasks hosted on Amazon \
         EC2 instances. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes}Attributes} \
         in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \  This parameter isn't supported for tasks run on Fargate.\n\
        \  \n\
        \   "]
  status : task_definition_status option; [@ocaml.doc "The status of the task definition.\n"]
  volumes : volume_list option;
      [@ocaml.doc
        "The list of data volume definitions for the task. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html}Using \
         data volumes in tasks} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \  The [host] and [sourcePath] parameters aren't supported for tasks run on Fargate. \n\
        \  \n\
        \   "]
  revision : integer option;
      [@ocaml.doc
        "The revision of the task in a particular family. The revision is a version number of a \
         task definition in a family. When you register a task definition for the first time, the \
         revision is [1]. Each time that you register a new revision of a task definition in the \
         same family, the revision value always increases by one. This is even if you deregistered \
         previous revisions in this family.\n"]
  network_mode : network_mode option;
      [@ocaml.doc
        "The Docker networking mode to use for the containers in the task. The valid values are \
         [none], [bridge], [awsvpc], and [host]. If no network mode is specified, the default is \
         [bridge].\n\n\
        \ For Amazon ECS tasks on Fargate, the [awsvpc] network mode is required. For Amazon ECS \
         tasks on Amazon EC2 Linux instances, any network mode can be used. For Amazon ECS tasks \
         on Amazon EC2 Windows instances, [<default>] or [awsvpc] can be used. If the network mode \
         is set to [none], you cannot specify port mappings in your container definitions, and the \
         tasks containers do not have external connectivity. The [host] and [awsvpc] network modes \
         offer the highest networking performance for containers because they use the EC2 network \
         stack instead of the virtualized network stack provided by the [bridge] mode.\n\
        \ \n\
        \  With the [host] and [awsvpc] network modes, exposed container ports are mapped directly \
         to the corresponding host port (for the [host] network mode) or the attached elastic \
         network interface port (for the [awsvpc] network mode), so you cannot take advantage of \
         dynamic host port mappings. \n\
        \  \n\
        \    When using the [host] network mode, you should not run containers using the root user \
         (UID 0). It is considered best practice to use a non-root user.\n\
        \    \n\
        \      If the network mode is [awsvpc], the task is allocated an elastic network \
         interface, and you must specify a \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_NetworkConfiguration.html}NetworkConfiguration} \
         value when you create a service or run a task with the task definition. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html}Task \
         Networking} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \      \n\
        \       If the network mode is [host], you cannot run multiple instantiations of the same \
         task on a single container instance when port mappings are used.\n\
        \       "]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS \
         container agent permission to make Amazon Web Services API calls on your behalf. For \
         informationabout the required IAM roles for Amazon ECS, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/security-ecs-iam-role-overview.html}IAM \
         roles for Amazon ECS} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  task_role_arn : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the Identity and Access Management \
         role that grants containers in the task permission to call Amazon Web Services APIs on \
         your behalf. For informationabout the required IAM roles for Amazon ECS, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/security-ecs-iam-role-overview.html}IAM \
         roles for Amazon ECS} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  family : string_ option;
      [@ocaml.doc
        "The name of a family that this task definition is registered to. Up to 255 characters are \
         allowed. Letters (both uppercase and lowercase letters), numbers, hyphens (-), and \
         underscores (_) are allowed.\n\n\
        \ A family groups multiple versions of a task definition. Amazon ECS gives the first task \
         definition that you registered to a family a revision number of 1. Amazon ECS gives \
         sequential revision numbers to each task definition that you add.\n\
        \ "]
  container_definitions : container_definitions option;
      [@ocaml.doc
        "A list of container definitions in JSON format that describe the different containers \
         that make up your task. For more information about container definition parameters and \
         defaults, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html}Amazon \
         ECS Task Definitions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  task_definition_arn : string_ option;
      [@ocaml.doc "The full Amazon Resource Name (ARN) of the task definition.\n"]
}
[@@ocaml.doc
  "The details of a task definition which describes the container and volume definitions of an \
   Amazon Elastic Container Service task. You can specify which Docker images to use, the required \
   resources, and other configurations related to launching the task definition through an Amazon \
   ECS service or task.\n"]

type nonrec task_definition_list = task_definition list [@@ocaml.doc ""]

type nonrec task_definition_field = TAGS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_definition_field_list = task_definition_field list [@@ocaml.doc ""]

type nonrec task_definition_family_status =
  | ALL [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The specified target wasn't found. You can view your available container instances with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListContainerInstances.html}ListContainerInstances}. \
   Amazon ECS container instances are cluster-specific and Region-specific.\n"]

type nonrec target_not_connected_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The execute command cannot run. This error can be caused by any of the following configuration \
   issues:\n\n\
  \ {ul\n\
  \       {-  Incorrect IAM permissions\n\
  \           \n\
  \            }\n\
  \       {-  The SSM agent is not installed or is not running\n\
  \           \n\
  \            }\n\
  \       {-   There is an interface Amazon VPC endpoint for Amazon ECS, but there is not one for \
   Systems Manager Session Manager\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For information about how to troubleshoot the issues, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html}Troubleshooting \
   issues with ECS Exec} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   "]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags;
      [@ocaml.doc
        "The tags to add to the resource. A tag is an array of key-value pairs.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to add tags to. Currently, the supported \
         resources are Amazon ECS capacity providers, tasks, services, task definitions, clusters, \
         and container instances.\n\n\
        \ In order to tag a service that has the following ARN format, you need to migrate the \
         service to the long ARN. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-arn-migration.html}Migrate \
         an Amazon ECS short service ARN to a long ARN} in the {i Amazon Elastic Container Service \
         Developer Guide}.\n\
        \ \n\
        \   [arn:aws:ecs:region:aws_account_id:service/service-name] \n\
        \  \n\
        \   After the migration is complete, the service has the long ARN format, as shown below. \
         Use this ARN to tag the service.\n\
        \   \n\
        \     [arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name] \n\
        \    \n\
        \     If you try to tag a service with a short ARN, you receive an \
         [InvalidParameterException] error.\n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec submit_task_state_change_response = {
  acknowledgment : string_ option; [@ocaml.doc "Acknowledgement of the state change.\n"]
}
[@@ocaml.doc ""]

type nonrec container_state_change = {
  status : string_ option; [@ocaml.doc "The status of the container.\n"]
  reason : string_ option; [@ocaml.doc "The reason for the state change.\n"]
  network_bindings : network_bindings option;
      [@ocaml.doc "Any network bindings that are associated with the container.\n"]
  exit_code : boxed_integer option;
      [@ocaml.doc
        "The exit code for the container, if the state change is a result of the container exiting.\n"]
  runtime_id : string_ option; [@ocaml.doc "The ID of the Docker container.\n"]
  image_digest : string_ option; [@ocaml.doc "The container image SHA 256 digest.\n"]
  container_name : string_ option; [@ocaml.doc "The name of the container.\n"]
}
[@@ocaml.doc "An object that represents a change in state for a container.\n"]

type nonrec container_state_changes = container_state_change list [@@ocaml.doc ""]

type nonrec attachment_state_change = {
  status : string_; [@ocaml.doc "The status of the attachment.\n"]
  attachment_arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the attachment.\n"]
}
[@@ocaml.doc "An object representing a change in state for a task attachment.\n"]

type nonrec attachment_state_changes = attachment_state_change list [@@ocaml.doc ""]

type nonrec managed_agent_state_change = {
  reason : string_ option; [@ocaml.doc "The reason for the status of the managed agent.\n"]
  status : string_; [@ocaml.doc "The status of the managed agent.\n"]
  managed_agent_name : managed_agent_name; [@ocaml.doc "The name of the managed agent.\n"]
  container_name : string_;
      [@ocaml.doc "The name of the container that's associated with the managed agent.\n"]
}
[@@ocaml.doc "An object representing a change in state for a managed agent.\n"]

type nonrec managed_agent_state_changes = managed_agent_state_change list [@@ocaml.doc ""]

type nonrec submit_task_state_change_request = {
  execution_stopped_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the task execution stopped.\n"]
  pull_stopped_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the container image pull completed.\n"]
  pull_started_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the container image pull started.\n"]
  managed_agents : managed_agent_state_changes option;
      [@ocaml.doc "The details for the managed agent that's associated with the task.\n"]
  attachments : attachment_state_changes option;
      [@ocaml.doc "Any attachments associated with the state change request.\n"]
  containers : container_state_changes option;
      [@ocaml.doc "Any containers that's associated with the state change request.\n"]
  reason : string_ option; [@ocaml.doc "The reason for the state change request.\n"]
  status : string_ option; [@ocaml.doc "The status of the state change request.\n"]
  task : string_ option;
      [@ocaml.doc "The task ID or full ARN of the task in the state change request.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_container_state_change_response = {
  acknowledgment : string_ option; [@ocaml.doc "Acknowledgement of the state change.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_container_state_change_request = {
  network_bindings : network_bindings option;
      [@ocaml.doc "The network bindings of the container.\n"]
  reason : string_ option; [@ocaml.doc "The reason for the state change request.\n"]
  exit_code : boxed_integer option;
      [@ocaml.doc "The exit code that's returned for the state change request.\n"]
  status : string_ option; [@ocaml.doc "The status of the state change request.\n"]
  runtime_id : string_ option; [@ocaml.doc "The ID of the Docker container.\n"]
  container_name : string_ option; [@ocaml.doc "The name of the container.\n"]
  task : string_ option;
      [@ocaml.doc
        "The task ID or full Amazon Resource Name (ARN) of the task that hosts the container.\n"]
  cluster : string_ option;
      [@ocaml.doc "The short name or full ARN of the cluster that hosts the container.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_attachment_state_changes_response = {
  acknowledgment : string_ option; [@ocaml.doc "Acknowledgement of the state change.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_attachment_state_changes_request = {
  attachments : attachment_state_changes;
      [@ocaml.doc "Any attachments associated with the state change request.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full ARN of the cluster that hosts the container instance the \
         attachment belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_task_response = { task : task option [@ocaml.doc "The task that was stopped.\n"] }
[@@ocaml.doc ""]

type nonrec stop_task_request = {
  reason : string_ option;
      [@ocaml.doc
        "An optional message specified when a task is stopped. For example, if you're using a \
         custom scheduler, you can use this parameter to specify the reason for stopping the task \
         here, and the message appears in subsequent \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html}DescribeTasks}> \
         API operations on this task.\n"]
  task : string_; [@ocaml.doc "Thefull Amazon Resource Name (ARN) of the task.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task to \
         stop. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_service_deployment_stop_type = ROLLBACK [@ocaml.doc ""] | ABORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_service_deployment_response = {
  service_deployment_arn : string_ option;
      [@ocaml.doc "The ARN of the stopped service deployment.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_service_deployment_request = {
  stop_type : stop_service_deployment_stop_type option;
      [@ocaml.doc
        "How you want Amazon ECS to stop the service. \n\n The valid values are [ROLLBACK].\n "]
  service_deployment_arn : string_;
      [@ocaml.doc "The ARN of the service deployment that you want to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec service_deployment_not_found_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The service deploy ARN that you specified in the [ContinueServiceDeployment] doesn't exist. You \
   can use [ListServiceDeployments] to retrieve the service deployment ARNs.\n"]

type nonrec resource_ids = string_ list [@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
  resource_ids : resource_ids option;
      [@ocaml.doc "The existing task ARNs which are already associated with the [clientToken].\n"]
}
[@@ocaml.doc
  "The request could not be processed because of conflict in the current state of the resource. \n"]

type nonrec start_task_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  tasks : tasks option;
      [@ocaml.doc
        "A full description of the tasks that were started. Each task that was successfully placed \
         on your container instances is described.\n"]
}
[@@ocaml.doc ""]

type nonrec start_task_request = {
  volume_configurations : task_volume_configurations option;
      [@ocaml.doc
        "The details of the volume that was [configuredAtLaunch]. You can configure the size, \
         volumeType, IOPS, throughput, snapshot and encryption in \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TaskManagedEBSVolumeConfiguration.html}TaskManagedEBSVolumeConfiguration}. \
         The [name] of the volume must match the [name] from the task definition.\n"]
  task_definition : string_;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full ARN of the task definition to \
         start. If a [revision] isn't specified, the latest [ACTIVE] revision is used.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the task to help you categorize and organize them. Each \
         tag consists of a key and an optional value, both of which you define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  started_by : string_ option;
      [@ocaml.doc
        "An optional tag specified when a task is started. For example, if you automatically \
         trigger a task to run a batch process job, you could apply a unique identifier for that \
         job to your task with the [startedBy] parameter. You can then identify which tasks belong \
         to that job by filtering the results of a \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListTasks.html}ListTasks} \
         call with the [startedBy] value. Up to 36 letters (uppercase and lowercase), numbers, \
         hyphens (-), forward slash (/), and underscores (_) are allowed.\n\n\
        \ If a task is started by an Amazon ECS service, the [startedBy] parameter contains the \
         deployment ID of the service that starts it.\n\
        \ "]
  reference_id : string_ option;
      [@ocaml.doc
        "This parameter is only used by Amazon ECS. It is not intended for use by customers.\n"]
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Specifies whether to propagate the tags from the task definition or the service to the \
         task. If no value is specified, the tags aren't propagated.\n"]
  overrides : task_override option;
      [@ocaml.doc
        "A list of container overrides in JSON format that specify the name of a container in the \
         specified task definition and the overrides it receives. You can override the default \
         command for a container (that's specified in the task definition or Docker image) with a \
         [command] override. You can also override existing environment variables (that are \
         specified in the task definition or Docker image) on a container or add new environment \
         variables to it with an [environment] override.\n\n\
        \  A total of 8192 characters are allowed for overrides. This limit includes the JSON \
         formatting characters of the override structure.\n\
        \  \n\
        \   "]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "The VPC subnet and security group configuration for tasks that receive their own elastic \
         network interface by using the [awsvpc] networking mode.\n"]
  group : string_ option;
      [@ocaml.doc
        "The name of the task group to associate with the task. The default value is the family \
         name of the task definition (for example, family:my-family-name).\n"]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Whether or not the execute command functionality is turned on for the task. If [true], \
         this turns on the execute command functionality on all containers in the task.\n"]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Specifies whether to use Amazon ECS managed tags for the task. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         Your Amazon ECS Resources} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  container_instances : string_list;
      [@ocaml.doc
        "The container instance IDs or full ARN entries for the container instances where you \
         would like to place your task. You can specify up to 10 container instances.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster where to start your \
         task. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec sort_order = DESC [@ocaml.doc ""] | ASC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec setting_name =
  | FARGATE_EVENT_WINDOWS [@ocaml.doc ""]
  | DEFAULT_LOG_DRIVER_MODE [@ocaml.doc ""]
  | GUARD_DUTY_ACTIVATE [@ocaml.doc ""]
  | FARGATE_TASK_RETIREMENT_WAIT_PERIOD [@ocaml.doc ""]
  | TAG_RESOURCE_AUTHORIZATION [@ocaml.doc ""]
  | FARGATE_FIPS_MODE [@ocaml.doc ""]
  | CONTAINER_INSIGHTS [@ocaml.doc ""]
  | AWSVPC_TRUNKING [@ocaml.doc ""]
  | CONTAINER_INSTANCE_LONG_ARN_FORMAT [@ocaml.doc ""]
  | TASK_LONG_ARN_FORMAT [@ocaml.doc ""]
  | SERVICE_LONG_ARN_FORMAT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec setting_type = AWS_MANAGED [@ocaml.doc ""] | USER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec setting = {
  type_ : setting_type option;
      [@ocaml.doc
        "Indicates whether Amazon Web Services manages the account setting, or if the user manages \
         it.\n\n\
        \  [aws_managed] account settings are read-only, as Amazon Web Services manages such on \
         the customer's behalf. Currently, the [guardDutyActivate] account setting is the only one \
         Amazon Web Services manages.\n\
        \ "]
  principal_arn : string_ option;
      [@ocaml.doc
        "The ARN of the principal. It can be a user, role, or the root user. If this field is \
         omitted, the authenticated user is assumed.\n"]
  value : string_ option;
      [@ocaml.doc
        "Determines whether the account setting is on or off for the specified resource.\n"]
  name : setting_name option; [@ocaml.doc "The Amazon ECS resource name.\n"]
}
[@@ocaml.doc "The current account setting for a resource.\n"]

type nonrec settings = setting list [@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec session = {
  token_value : sensitive_string option;
      [@ocaml.doc
        "An encrypted token value containing session and caller information. It's used to \
         authenticate the connection to the container.\n"]
  stream_url : string_ option;
      [@ocaml.doc
        "A URL to the managed agent on the container that the SSM Session Manager client uses to \
         send commands and receive output from the container.\n"]
  session_id : string_ option; [@ocaml.doc "The ID of the execute command session.\n"]
}
[@@ocaml.doc "The details for the execute command session.\n"]

type nonrec services = service list [@@ocaml.doc ""]

type nonrec service_revision_summary = {
  requested_production_traffic_weight : double option;
      [@ocaml.doc
        "The percentage of production traffic that is directed to this service revision. This \
         value represents a snapshot of the traffic distribution and may not reflect real-time \
         changes during active deployments. Valid values are 0.0 to 100.0.\n"]
  requested_test_traffic_weight : double option;
      [@ocaml.doc
        "The percentage of test traffic that is directed to this service revision. This value \
         represents a snapshot of the traffic distribution and may not reflect real-time changes \
         during active deployments. Valid values are 0.0 to 100.0.\n"]
  pending_task_count : integer option;
      [@ocaml.doc "The number of pending tasks for the service revision.\n"]
  running_task_count : integer option;
      [@ocaml.doc "The number of running tasks for the service revision.\n"]
  requested_task_count : integer option;
      [@ocaml.doc "The number of requested tasks for the service revision.\n"]
  arn : string_ option; [@ocaml.doc "The ARN of the service revision.\n"]
}
[@@ocaml.doc
  "The information about the number of requested, pending, and running tasks for a service revision.\n"]

type nonrec service_revisions_summary_list = service_revision_summary list [@@ocaml.doc ""]

type nonrec container_image = {
  image : string_ option; [@ocaml.doc "The container image. \n"]
  image_digest : string_ option; [@ocaml.doc "The container image digest.\n"]
  container_name : string_ option; [@ocaml.doc "The name of the container.\n"]
}
[@@ocaml.doc
  "The details about the container image a service revision uses. \n\n\
  \ To ensure that all tasks in a service use the same container image, Amazon ECS resolves \
   container image names and any image tags specified in the task definition to container image \
   digests. \n\
  \ \n\
  \  After the container image digest has been established, Amazon ECS uses the digest to start \
   any other desired tasks, and for any future service and service revision updates. This leads to \
   all tasks in a service always running identical container images, resulting in version \
   consistency for your software. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html#deployment-container-image-stability}Container \
   image resolution} in the Amazon ECS Developer Guide.\n\
  \  "]

type nonrec container_images = container_image list [@@ocaml.doc ""]

type nonrec service_revision_load_balancer = {
  production_listener_rule : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the production listener rule or listener that directs \
         traffic to the target group associated with the service revision.\n"]
  target_group_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target group associated with the service revision.\n"]
}
[@@ocaml.doc
  "The resolved load balancer configuration for a service revision. This includes information \
   about which target groups serve traffic and which listener rules direct traffic to them.\n"]

type nonrec service_revision_load_balancers = service_revision_load_balancer list [@@ocaml.doc ""]

type nonrec resolved_configuration = {
  load_balancers : service_revision_load_balancers option;
      [@ocaml.doc
        "The resolved load balancer configuration for the service revision. This includes \
         information about which target groups serve traffic and which listener rules direct \
         traffic to them.\n"]
}
[@@ocaml.doc
  "The resolved configuration for a service revision, which contains the actual resources your \
   service revision uses, such as which target groups serve traffic.\n"]

type nonrec managed_resource_status =
  | FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DEPROVISIONING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_load_balancer = {
  security_group_ids : string_list option;
      [@ocaml.doc "The IDs of the security groups associated with the load balancer.\n"]
  subnet_ids : string_list option;
      [@ocaml.doc "The IDs of the subnets associated with the load balancer.\n"]
  scheme : string_;
      [@ocaml.doc
        "The scheme of the load balancer. By default, the scheme of the load balancer is \
         [internet-facing].\n"]
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when this load balancer was most recently updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the load balancer is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the load balancer.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc "The Application Load Balancer associated with the Express service.\n"]

type nonrec managed_security_group = {
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when the security group was last updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the security group is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the security group.\n"]
  arn : string_ option; [@ocaml.doc "The ARN of the security group.\n"]
}
[@@ocaml.doc "A security group associated with the Express service.\n"]

type nonrec managed_security_groups = managed_security_group list [@@ocaml.doc ""]

type nonrec managed_certificate = {
  domain_name : string_;
      [@ocaml.doc
        "The fully qualified domain name (FQDN) that is secured with this ACM certificate.\n"]
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when the ACM certificate was last updated\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the ACM certificate is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the ACM; certificate.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the ACM certificate.\n"]
}
[@@ocaml.doc
  "The ACM certificate associated with the HTTPS domain created for the Express service.\n"]

type nonrec managed_listener = {
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when this listener was most recently updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Informaion about why the load balancer listener is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the load balancer listener.\n"]
  arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer listener.\n"]
}
[@@ocaml.doc "The listeners associated with the Express service's Application Load Balancer.\n"]

type nonrec managed_listener_rule = {
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when this listener rule was most recently updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc
        "Information about why the load balancer listener rule is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the load balancer listener rule.\n"]
  arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer listener rule.\n"]
}
[@@ocaml.doc "The listener rule associated with the Express service's Application Load Balancer.\n"]

type nonrec managed_target_group = {
  port : integer; [@ocaml.doc "The port on which the targets receive traffic.\n"]
  health_check_port : integer;
      [@ocaml.doc "The port the load balancer uses when performing health checks on targets.\n"]
  health_check_path : string_; [@ocaml.doc "The destination for health checks on the targets.\n"]
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when the target group was last updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the target group is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the target group.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc
  "The target group associated with the Express service's Application Load Balancer. For more \
   information about load balancer target groups, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_CreateTargetGroup.html}CreateTargetGroup} \
   in the {i Elastic Load Balancing API Reference} \n"]

type nonrec managed_target_groups = managed_target_group list [@@ocaml.doc ""]

type nonrec managed_ingress_path = {
  target_groups : managed_target_groups option;
      [@ocaml.doc "The target groups associated with the Application Load Balancer.\n"]
  rule : managed_listener_rule option;
      [@ocaml.doc "The listener rules for the Application Load Balancer.\n"]
  listener : managed_listener option;
      [@ocaml.doc "The listeners associated with the Application Load Balancer.\n"]
  certificate : managed_certificate option;
      [@ocaml.doc "The ACM certificate for the Express service's domain.\n"]
  load_balancer_security_groups : managed_security_groups option;
      [@ocaml.doc "The security groups associated with the Application Load Balancer.\n"]
  load_balancer : managed_load_balancer option;
      [@ocaml.doc "The Application Load Balancer associated with the Express service.\n"]
  endpoint : string_; [@ocaml.doc "The endpoint for access to the Express service.\n"]
  access_type : access_type;
      [@ocaml.doc "The type of access to the endpoint for the Express service.\n"]
}
[@@ocaml.doc "The entry point into the Express service.\n"]

type nonrec managed_ingress_paths = managed_ingress_path list [@@ocaml.doc ""]

type nonrec managed_scalable_target = {
  max_capacity : integer;
      [@ocaml.doc "The maximum value to scale to in response to a scale-out activity.\n"]
  min_capacity : integer;
      [@ocaml.doc "The minimum value to scale to in response to a scale-in activity.\n"]
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when the target was most recently updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the scalable target is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the scalable target.\n"]
  arn : string_ option; [@ocaml.doc "The ARN of the scalable target.\n"]
}
[@@ocaml.doc "Represents a scalable target.\n"]

type nonrec managed_application_auto_scaling_policy = {
  metric : string_;
      [@ocaml.doc
        "The metric used for auto scaling decisions. The available metrics are \
         [ECSServiceAverageCPUUtilization], [ECSServiceAverageMemoryUtilization], and \
         [ALBRequestCOuntPerTarget].\n"]
  target_value : double; [@ocaml.doc "The target value for the auto scaling metric.\n"]
  policy_type : string_;
      [@ocaml.doc
        "The type of Application Auto Scaling policy associated with the Express service. Valid \
         values are [TargetTrackingScaling], [StepScaling], and [PredictiveScaling].\n"]
  updated_at : timestamp;
      [@ocaml.doc
        "The Unix timestamp for when the Application Auto Scaling policy was last updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc
        "Information about why the Application Auto Scaling policy is in the current status.\n"]
  status : managed_resource_status;
      [@ocaml.doc "The status of Application Auto Scaling policy creation.\n"]
  arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Application Auto Scaling policy associated with the \
         Express service.\n"]
}
[@@ocaml.doc
  "The Application Auto Scaling policy created by Amazon ECS when you create an Express service.\n"]

type nonrec managed_application_auto_scaling_policies = managed_application_auto_scaling_policy list
[@@ocaml.doc ""]

type nonrec managed_auto_scaling = {
  application_auto_scaling_policies : managed_application_auto_scaling_policies option;
      [@ocaml.doc "The policy used for auto scaling.\n"]
  scalable_target : managed_scalable_target option; [@ocaml.doc "Represents a scalable target.\n"]
}
[@@ocaml.doc "The auto scaling configuration created by Amazon ECS for an Express service.\n"]

type nonrec managed_metric_alarm = {
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when the CloudWatch metric alarm was last updated.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the CloudWatch metric alarm is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the CloudWatch metric alarm.\n"]
  arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the CloudWatch metric alarm.\n"]
}
[@@ocaml.doc "The CloudWatch metric alarm associated with the Express service's scaling policy.\n"]

type nonrec managed_metric_alarms = managed_metric_alarm list [@@ocaml.doc ""]

type nonrec managed_log_group = {
  log_group_name : string_;
      [@ocaml.doc "The name of the Cloudwatch Log Group associated with the Express service.\n"]
  updated_at : timestamp;
      [@ocaml.doc "The Unix timestamp for when the Cloudwatch LogGroup was last updated\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the Cloudwatch LogGroup is in the current status.\n"]
  status : managed_resource_status; [@ocaml.doc "The status of the Cloudwatch LogGroup.\n"]
  arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Cloudwatch Log Group associated with the Express \
         service.\n"]
}
[@@ocaml.doc "The Cloudwatch Log Group created by Amazon ECS for an Express service.\n"]

type nonrec managed_log_groups = managed_log_group list [@@ocaml.doc ""]

type nonrec ecs_managed_resources = {
  log_groups : managed_log_groups option;
      [@ocaml.doc "The log groups managed by the Express service.\n"]
  service_security_groups : managed_security_groups option;
      [@ocaml.doc "The security groups managed by the Express service.\n"]
  metric_alarms : managed_metric_alarms option;
      [@ocaml.doc "The CloudWatch metric alarms associated with the Express service.\n"]
  auto_scaling : managed_auto_scaling option;
      [@ocaml.doc "The auto-scaling configuration and policies for the Express service.\n"]
  ingress_paths : managed_ingress_paths option;
      [@ocaml.doc "The ingress paths and endpoints for the Express service.\n"]
}
[@@ocaml.doc
  "Represents the Amazon Web Services resources managed by Amazon ECS for an Express service, \
   including ingress paths, auto-scaling policies, metric alarms, and security groups.\n"]

type nonrec service_revision = {
  monitoring : monitoring_configuration option;
      [@ocaml.doc
        "The optional monitoring configuration for the service, which defines the resolution for \
         the service-level [CPUUtilization] and [MemoryUtilization] Amazon CloudWatch metrics. \
         When not specified, Amazon ECS uses the default resolution of [60] seconds.\n"]
  ecs_managed_resources : ecs_managed_resources option;
      [@ocaml.doc
        "The resources created and managed by Amazon ECS when you create an Express service for \
         Amazon ECS.\n"]
  resolved_configuration : resolved_configuration option;
      [@ocaml.doc
        "The resolved configuration for the service revision which contains the actual resources \
         your service revision uses, such as which target groups serve traffic.\n"]
  vpc_lattice_configurations : vpc_lattice_configurations option;
      [@ocaml.doc "The VPC Lattice configuration for the service revision.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "The time that the service revision was created. The format is yyyy-mm-dd HH:mm:ss.SSSSS.\n"]
  fargate_ephemeral_storage : deployment_ephemeral_storage option; [@ocaml.doc ""]
  volume_configurations : service_volume_configurations option;
      [@ocaml.doc "The volumes that are configured at deployment that the service revision uses.\n"]
  service_connect_configuration : service_connect_configuration option; [@ocaml.doc ""]
  guard_duty_enabled : boolean_ option;
      [@ocaml.doc "Indicates whether Runtime Monitoring is turned on.\n"]
  container_images : container_images option;
      [@ocaml.doc "The container images the service revision uses.\n"]
  network_configuration : network_configuration option; [@ocaml.doc ""]
  service_registries : service_registries option;
      [@ocaml.doc "The service registries (for Service Discovery) the service revision uses.\n"]
  load_balancers : load_balancers option;
      [@ocaml.doc "The load balancers the service revision uses.\n"]
  platform_family : string_ option; [@ocaml.doc "The platform family the service revision uses.\n"]
  platform_version : string_ option;
      [@ocaml.doc "For the Fargate launch type, the platform version the service revision uses.\n"]
  launch_type : launch_type option; [@ocaml.doc "The launch type the service revision uses.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc "The capacity provider strategy the service revision uses.\n"]
  task_definition : string_ option; [@ocaml.doc "The task definition the service revision uses.\n"]
  cluster_arn : string_ option; [@ocaml.doc "The ARN of the cluster that hosts the service.\n"]
  service_arn : string_ option; [@ocaml.doc "The ARN of the service for the service revision.\n"]
  service_revision_arn : string_ option; [@ocaml.doc "The ARN of the service revision.\n"]
}
[@@ocaml.doc
  "Information about the service revision.\n\n\
  \ A service revision contains a record of the workload configuration Amazon ECS is attempting to \
   deploy. Whenever you create or deploy a service, Amazon ECS automatically creates and captures \
   the configuration that you're trying to deploy in the service revision. For information about \
   service revisions, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-revision.html}Amazon ECS \
   service revisions} in the {i  {i Amazon Elastic Container Service Developer Guide} }.\n\
  \ "]

type nonrec service_revisions = service_revision list [@@ocaml.doc ""]

type nonrec service_revision_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec service_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec service_field = TAGS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec service_field_list = service_field list [@@ocaml.doc ""]

type nonrec service_deployment_status =
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_SUCCESSFUL [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | ROLLBACK_REQUESTED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | SUCCESSFUL [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_deployment_brief = {
  status_reason : string_ option;
      [@ocaml.doc
        "Information about why the service deployment is in the current status. For example, the \
         circuit breaker detected a deployment failure.\n"]
  status : service_deployment_status option; [@ocaml.doc "The status of the service deployment\n"]
  target_service_revision_arn : string_ option;
      [@ocaml.doc "The ARN of the service revision being deplyed.\n"]
  finished_at : timestamp option;
      [@ocaml.doc
        "The time that the service deployment completed. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "The time that the service deployment was created. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  started_at : timestamp option;
      [@ocaml.doc
        "The time that the service deployment statred. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  cluster_arn : string_ option; [@ocaml.doc "The ARN of the cluster that hosts the service.\n"]
  service_arn : string_ option; [@ocaml.doc "The ARN of the service for this service deployment.\n"]
  service_deployment_arn : string_ option; [@ocaml.doc "The ARN of the service deployment.\n"]
}
[@@ocaml.doc
  "The service deployment properties that are retured when you call [ListServiceDeployments].\n\n\
  \ This provides a high-level overview of the service deployment. \n\
  \ "]

type nonrec service_deployments_brief = service_deployment_brief list [@@ocaml.doc ""]

type nonrec service_deployment_lifecycle_stage =
  | CLEAN_UP [@ocaml.doc ""]
  | BAKE_TIME [@ocaml.doc ""]
  | POST_PRODUCTION_TRAFFIC_SHIFT [@ocaml.doc ""]
  | PRODUCTION_TRAFFIC_SHIFT [@ocaml.doc ""]
  | POST_TEST_TRAFFIC_SHIFT [@ocaml.doc ""]
  | TEST_TRAFFIC_SHIFT [@ocaml.doc ""]
  | POST_SCALE_UP [@ocaml.doc ""]
  | SCALE_UP [@ocaml.doc ""]
  | PRE_SCALE_UP [@ocaml.doc ""]
  | RECONCILE_SERVICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_status =
  | TIMED_OUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | AWAITING_ACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_lifecycle_hook_detail = {
  timeout_action : deployment_lifecycle_hook_action option;
      [@ocaml.doc
        "The action Amazon ECS takes when the lifecycle hook times out. Valid values are \
         [CONTINUE] and [ROLLBACK].\n"]
  expires_at : timestamp option;
      [@ocaml.doc
        "The time when the lifecycle hook times out. If the hook has not been completed by this \
         time, Amazon ECS takes the timeout action.\n"]
  status : deployment_lifecycle_hook_status option;
      [@ocaml.doc
        "The status of the lifecycle hook. Valid values include [AWAITING_ACTION], [IN_PROGRESS], \
         [SUCCEEDED], [FAILED], and [TIMED_OUT].\n"]
  target_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the hook target. For [AWS_LAMBDA] hooks, this is the \
         Lambda function ARN. For [PAUSE] hooks, this field is not set.\n"]
  target_type : deployment_lifecycle_hook_target_type option;
      [@ocaml.doc
        "The type of action the lifecycle hook performs, such as [AWS_LAMBDA] or [PAUSE].\n"]
  hook_id : string_ option;
      [@ocaml.doc
        "The ID of the lifecycle hook. Use this value when calling [ContinueServiceDeployment] to \
         continue or roll back a paused deployment.\n"]
}
[@@ocaml.doc
  "The details of a deployment lifecycle hook that is active during a service deployment.\n\n\
  \ You can view lifecycle hook details by calling \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServiceDeployments.html}DescribeServiceDeployments}.\n\
  \ "]

type nonrec deployment_lifecycle_hook_detail_list = deployment_lifecycle_hook_detail list
[@@ocaml.doc ""]

type nonrec rollback = {
  service_revision_arn : string_ option;
      [@ocaml.doc "The ARN of the service revision deployed as part of the rollback.\n"]
  started_at : timestamp option;
      [@ocaml.doc
        "Time time that the rollback started. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  reason : string_ option;
      [@ocaml.doc
        "The reason the rollback happened. For example, the circuit breaker initiated the rollback \
         operation.\n"]
}
[@@ocaml.doc "Information about the service deployment rollback.\n"]

type nonrec service_deployment_rollback_monitors_status =
  | DISABLED [@ocaml.doc ""]
  | MONITORING_COMPLETE [@ocaml.doc ""]
  | MONITORING [@ocaml.doc ""]
  | TRIGGERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_deployment_circuit_breaker = {
  threshold : integer option;
      [@ocaml.doc
        "The threshhold which determines that the service deployment failed.\n\n\
        \ The deployment circuit breaker calculates the threshold value, and then uses the value \
         to determine when to move the deployment to a FAILED state. The deployment circuit \
         breaker has a minimum threshold of 3 and a maximum threshold of 200. and uses the values \
         in the following formula to determine the deployment failure.\n\
        \ \n\
        \   [0.5 * desired task count] \n\
        \  "]
  failure_count : integer option;
      [@ocaml.doc
        "The number of times the circuit breaker detected a service deploymeny failure.\n"]
  status : service_deployment_rollback_monitors_status option;
      [@ocaml.doc
        "The circuit breaker status. Amazon ECS is not using the circuit breaker for service \
         deployment failures when the status is [DISABLED].\n"]
}
[@@ocaml.doc
  "Information about the circuit breaker used to determine when a service deployment has failed.\n\n\
  \ The deployment circuit breaker is the rolling update mechanism that determines if the tasks \
   reach a steady state. The deployment circuit breaker has an option that will automatically roll \
   back a failed deployment to the last cpompleted service revision. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-circuit-breaker.html}How \
   the Amazon ECS deployment circuit breaker detects failures} in the{i  Amazon ECS Developer \
   Guide}.\n\
  \ "]

type nonrec service_deployment_alarms = {
  triggered_alarm_names : string_list option;
      [@ocaml.doc
        "One or more CloudWatch alarm names that have been triggered during the service \
         deployment. A \",\" separates the alarm names.\n"]
  alarm_names : string_list option;
      [@ocaml.doc
        "The name of the CloudWatch alarms that determine when a service deployment failed. A \
         \",\" separates the alarms.\n"]
  status : service_deployment_rollback_monitors_status option;
      [@ocaml.doc
        "The status of the alarms check. Amazon ECS is not using alarms for service deployment \
         failures when the status is [DISABLED].\n"]
}
[@@ocaml.doc
  "The CloudWatch alarms used to determine a service deployment failed. \n\n\
  \ Amazon ECS considers the service deployment as failed when any of the alarms move to the \
   [ALARM] state. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-alarm-failure.html}How \
   CloudWatch alarms detect Amazon ECS deployment failures} in the Amazon ECS Developer Guide.\n\
  \ "]

type nonrec service_deployment = {
  alarms : service_deployment_alarms option;
      [@ocaml.doc "The CloudWatch alarms that determine when a service deployment fails.\n"]
  deployment_circuit_breaker : service_deployment_circuit_breaker option;
      [@ocaml.doc
        "The circuit breaker configuration that determines a service deployment failed.\n"]
  rollback : rollback option;
      [@ocaml.doc "The rollback options the service deployment uses when the deployment fails.\n"]
  deployment_configuration : deployment_configuration option; [@ocaml.doc ""]
  lifecycle_hook_details : deployment_lifecycle_hook_detail_list option;
      [@ocaml.doc "The details of the lifecycle hooks for the current service deployment.\n"]
  lifecycle_stage : service_deployment_lifecycle_stage option;
      [@ocaml.doc
        "The current lifecycle stage of the deployment. Possible values include:\n\n\
        \ {ul\n\
        \       {-  RECONCILE_SERVICE\n\
        \           \n\
        \            The reconciliation stage that only happens when you start a new service \
         deployment with more than 1 service revision in an ACTIVE state.\n\
        \            \n\
        \             }\n\
        \       {-  PRE_SCALE_UP\n\
        \           \n\
        \            The green service revision has not started. The blue service revision is \
         handling 100% of the production traffic. There is no test traffic.\n\
        \            \n\
        \             }\n\
        \       {-  SCALE_UP\n\
        \           \n\
        \            The stage when the green service revision scales up to 100% and launches new \
         tasks. The green service revision is not serving any traffic at this point.\n\
        \            \n\
        \             }\n\
        \       {-  POST_SCALE_UP\n\
        \           \n\
        \            The green service revision has started. The blue service revision is handling \
         100% of the production traffic. There is no test traffic.\n\
        \            \n\
        \             }\n\
        \       {-  TEST_TRAFFIC_SHIFT\n\
        \           \n\
        \            The blue and green service revisions are running. The blue service revision \
         handles 100% of the production traffic. The green service revision is migrating from 0% \
         to 100% of test traffic.\n\
        \            \n\
        \             }\n\
        \       {-  POST_TEST_TRAFFIC_SHIFT\n\
        \           \n\
        \            The test traffic shift is complete. The green service revision handles 100% \
         of the test traffic.\n\
        \            \n\
        \             }\n\
        \       {-  PRE_PRODUCTION_TRAFFIC_SHIFT\n\
        \           \n\
        \            Occurs before production traffic shift. For linear and canary deployments, \
         this stage is invoked before every traffic shift step.\n\
        \            \n\
        \             }\n\
        \       {-  PRODUCTION_TRAFFIC_SHIFT\n\
        \           \n\
        \            Production traffic is shifting to the green service revision. The green \
         service revision is migrating from 0% to 100% of production traffic. For linear and \
         canary deployments, this stage is invoked at every traffic shift step.\n\
        \            \n\
        \             }\n\
        \       {-  POST_PRODUCTION_TRAFFIC_SHIFT\n\
        \           \n\
        \            The production traffic shift is complete.\n\
        \            \n\
        \             }\n\
        \       {-  BAKE_TIME\n\
        \           \n\
        \            The stage when both blue and green service revisions are running \
         simultaneously after the production traffic has shifted.\n\
        \            \n\
        \             }\n\
        \       {-  CLEAN_UP\n\
        \           \n\
        \            The stage when the blue service revision has completely scaled down to 0 \
         running tasks. The green service revision is now the production service revision after \
         this stage.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  status_reason : string_ option;
      [@ocaml.doc
        "Information about why the service deployment is in the current status. For example, the \
         circuit breaker detected a failure.\n"]
  status : service_deployment_status option; [@ocaml.doc "The service deployment state.\n"]
  target_service_revision : service_revision_summary option;
      [@ocaml.doc "The workload configuration being deployed.\n"]
  source_service_revisions : service_revisions_summary_list option;
      [@ocaml.doc "The currently deployed workload configuration.\n"]
  updated_at : timestamp option;
      [@ocaml.doc
        "The time that the service deployment was last updated. The format is yyyy-MM-dd \
         HH:mm:ss.SSSSSS.\n"]
  stopped_at : timestamp option;
      [@ocaml.doc
        "The time the service deployment stopped. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n\n\
        \ The service deployment stops when any of the following actions happen:\n\
        \ \n\
        \  {ul\n\
        \        {-  A user manually stops the deployment\n\
        \            \n\
        \             }\n\
        \        {-  The rollback option is not in use for the failure detection mechanism (the \
         circuit breaker or alarm-based) and the service fails.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  finished_at : timestamp option;
      [@ocaml.doc
        "The time the service deployment finished. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  started_at : timestamp option;
      [@ocaml.doc
        "The time the service deployment statred. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "The time the service deployment was created. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  cluster_arn : string_ option; [@ocaml.doc "The ARN of the cluster that hosts the service.\n"]
  service_arn : string_ option; [@ocaml.doc "The ARN of the service for this service deployment.\n"]
  service_deployment_arn : string_ option; [@ocaml.doc "The ARN of the service deployment.\n"]
}
[@@ocaml.doc
  "Information about the service deployment.\n\n\
  \ Service deployments provide a comprehensive view of your deployments. For information about \
   service deployments, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-deployment.html}View \
   service history using Amazon ECS service deployments} in the {i  {i Amazon Elastic Container \
   Service Developer Guide} }.\n\
  \ "]

type nonrec service_deployments = service_deployment list [@@ocaml.doc ""]

type nonrec service_deployment_status_list = service_deployment_status list [@@ocaml.doc ""]

type nonrec service_deployment_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec run_task_response = {
  failures : failures option;
      [@ocaml.doc
        "Any failures associated with the call.\n\n\
        \ For information about how to address failures, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-event-messages.html#service-event-messages-list}Service \
         event messages} and \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html}API \
         failure reasons} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  tasks : tasks option;
      [@ocaml.doc
        "A full description of the tasks that were run. The tasks that were successfully placed on \
         your cluster are described here.\n"]
}
[@@ocaml.doc ""]

type nonrec run_task_request = {
  volume_configurations : task_volume_configurations option;
      [@ocaml.doc
        "The details of the volume that was [configuredAtLaunch]. You can configure the size, \
         volumeType, IOPS, throughput, snapshot and encryption in \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TaskManagedEBSVolumeConfiguration.html}TaskManagedEBSVolumeConfiguration}. \
         The [name] of the volume must match the [name] from the task definition.\n"]
  client_token : string_ option;
      [@ocaml.doc
        "An identifier that you provide to ensure the idempotency of the request. It must be \
         unique and is case sensitive. Up to 64 characters are allowed. The valid characters are \
         characters in the range of 33-126, inclusive. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/ECS_Idempotency.html}Ensuring \
         idempotency}.\n"]
  task_definition : string_;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full ARN of the task definition to \
         run. If a [revision] isn't specified, the latest [ACTIVE] revision is used.\n\n\
        \ The full ARN value must match the value that you specified as the [Resource] of the \
         principal's permissions policy.\n\
        \ \n\
        \  When you specify a task definition, you must either specify a specific revision, or all \
         revisions in the ARN.\n\
        \  \n\
        \   To specify a specific revision, include the revision number in the ARN. For example, \
         to specify revision 2, use \
         [arn:aws:ecs:us-east-1:111122223333:task-definition/TaskFamilyName:2].\n\
        \   \n\
        \    To specify all revisions, use the wildcard (*) in the ARN. For example, to specify \
         all revisions, use [arn:aws:ecs:us-east-1:111122223333:task-definition/TaskFamilyName:*].\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-resources}Policy \
         Resources for Amazon ECS} in the Amazon Elastic Container Service Developer Guide.\n\
        \     "]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the task to help you categorize and organize them. Each \
         tag consists of a key and an optional value, both of which you define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  started_by : string_ option;
      [@ocaml.doc
        "An optional tag specified when a task is started. For example, if you automatically \
         trigger a task to run a batch process job, you could apply a unique identifier for that \
         job to your task with the [startedBy] parameter. You can then identify which tasks belong \
         to that job by filtering the results of a \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListTasks.html}ListTasks} \
         call with the [startedBy] value. Up to 128 letters (uppercase and lowercase), numbers, \
         hyphens (-), forward slash (/), and underscores (_) are allowed.\n\n\
        \ If a task is started by an Amazon ECS service, then the [startedBy] parameter contains \
         the deployment ID of the service that starts it.\n\
        \ "]
  reference_id : string_ option;
      [@ocaml.doc
        "This parameter is only used by Amazon ECS. It is not intended for use by customers.\n"]
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Specifies whether to propagate the tags from the task definition to the task. If no value \
         is specified, the tags aren't propagated. Tags can only be propagated to the task during \
         task creation. To add tags to a task after task creation, use \
         the{{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TagResource.html}TagResource} \
         API action.\n\n\
        \  An error will be received if you specify the [SERVICE] option when running a task.\n\
        \  \n\
        \   "]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version the task uses. A platform version is only specified for tasks hosted \
         on Fargate. If one isn't specified, the [LATEST] platform version is used. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         platform versions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  placement_strategy : placement_strategies option;
      [@ocaml.doc
        "The placement strategy objects to use for the task. You can specify a maximum of 5 \
         strategy rules for each task.\n"]
  placement_constraints : placement_constraints option;
      [@ocaml.doc
        "An array of placement constraint objects to use for the task. You can specify up to 10 \
         constraints for each task (including constraints in the task definition and those \
         specified at runtime).\n"]
  overrides : task_override option;
      [@ocaml.doc
        "A list of container overrides in JSON format that specify the name of a container in the \
         specified task definition and the overrides it should receive. You can override the \
         default command for a container (that's specified in the task definition or Docker image) \
         with a [command] override. You can also override existing environment variables (that are \
         specified in the task definition or Docker image) on a container or add new environment \
         variables to it with an [environment] override.\n\n\
        \ A total of 8192 characters are allowed for overrides. This limit includes the JSON \
         formatting characters of the override structure.\n\
        \ "]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "The network configuration for the task. This parameter is required for task definitions \
         that use the [awsvpc] network mode to receive their own elastic network interface, and it \
         isn't supported for other network modes. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html}Task \
         networking} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  launch_type : launch_type option;
      [@ocaml.doc
        "The infrastructure to run your standalone task on. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \  If you want to use Amazon ECS Managed Instances, you must use the \
         [capacityProviderStrategy] request parameter and omit the [launchType] request parameter.\n\
        \  \n\
        \    The [FARGATE] launch type runs your tasks on Fargate On-Demand infrastructure.\n\
        \    \n\
        \      Fargate Spot infrastructure is available for use but a capacity provider strategy \
         must be used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-capacity-providers.html}Fargate \
         capacity providers} in the {i Amazon ECS Developer Guide}.\n\
        \      \n\
        \        The [EC2] launch type runs your tasks on Amazon EC2 instances registered to your \
         cluster.\n\
        \        \n\
        \         The [EXTERNAL] launch type runs your tasks on your on-premises server or virtual \
         machine (VM) capacity registered to your cluster.\n\
        \         \n\
        \          A task can use either a launch type or a capacity provider strategy. If a \
         [launchType] is specified, the [capacityProviderStrategy] parameter must be omitted.\n\
        \          \n\
        \           When you use cluster auto scaling, you must specify [capacityProviderStrategy] \
         and not [launchType]. \n\
        \           "]
  group : string_ option;
      [@ocaml.doc
        "The name of the task group to associate with the task. The default value is the family \
         name of the task definition (for example, [family:my-family-name]).\n"]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Determines whether to use the execute command functionality for the containers in this \
         task. If [true], this enables execute command functionality on all containers in the \
         task.\n\n\
        \ If [true], then the task definition must have a task role, or you must provide one as an \
         override.\n\
        \ "]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Specifies whether to use Amazon ECS managed tags for the task. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         Your Amazon ECS Resources} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  count : boxed_integer option;
      [@ocaml.doc
        "The number of instantiations of the specified task to place on your cluster. You can \
         specify up to 10 tasks for each call.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster to run your task on. If \
         you do not specify a cluster, the default cluster is assumed.\n\n\
        \ Each account receives a default cluster the first time you use the service, but you may \
         also create other clusters.\n\
        \ "]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The capacity provider strategy to use for the task.\n\n\
        \  If you want to use Amazon ECS Managed Instances, you must use the \
         [capacityProviderStrategy] request parameter and omit the [launchType] request parameter.\n\
        \  \n\
        \    If a [capacityProviderStrategy] is specified, the [launchType] parameter must be \
         omitted. If no [capacityProviderStrategy] or [launchType] is specified, the \
         [defaultCapacityProviderStrategy] for the cluster is used.\n\
        \    \n\
        \     When you use cluster auto scaling, you must specify [capacityProviderStrategy] and \
         not [launchType]. \n\
        \     \n\
        \      A capacity provider strategy can contain a maximum of 20 capacity providers.\n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec blocked_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "Your Amazon Web Services account was blocked. For more information, contact \
   {{:http://aws.amazon.com/contact-us/} Amazon Web Services Support}.\n"]

type nonrec resource_in_use_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "The specified resource is in-use and can't be removed.\n"]

type nonrec register_task_definition_response = {
  tags : tags option; [@ocaml.doc "The list of tags associated with the task definition.\n"]
  task_definition : task_definition option;
      [@ocaml.doc "The full description of the registered task definition.\n"]
}
[@@ocaml.doc ""]

type nonrec register_task_definition_request = {
  enable_fault_injection : boxed_boolean option;
      [@ocaml.doc
        "Enables fault injection when you register your task definition and allows for fault \
         injection requests to be accepted from the task's containers. The default value is \
         [false].\n"]
  runtime_platform : runtime_platform option;
      [@ocaml.doc "The operating system that your tasks definitions run on.\n"]
  ephemeral_storage : ephemeral_storage option;
      [@ocaml.doc
        "The amount of ephemeral storage to allocate for the task. This parameter is used to \
         expand the total amount of ephemeral storage available, beyond the default amount, for \
         tasks hosted on Fargate. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html}Using \
         data volumes in tasks} in the {i Amazon ECS Developer Guide}.\n\n\
        \  For tasks using the Fargate launch type, the task requires the following platforms:\n\
        \  \n\
        \   {ul\n\
        \         {-  Linux platform version [1.4.0] or later.\n\
        \             \n\
        \              }\n\
        \         {-  Windows platform version [1.0.0] or later.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  inference_accelerators : inference_accelerators option;
      [@ocaml.doc "The Elastic Inference accelerators to use for the containers in the task.\n"]
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc
        "The configuration details for the App Mesh proxy.\n\n\
        \ For tasks hosted on Amazon EC2 instances, the container instances require at least \
         version [1.26.0] of the container agent and at least version [1.26.0-1] of the [ecs-init] \
         package to use a proxy configuration. If your container instances are launched from the \
         Amazon ECS-optimized AMI version [20190301] or later, then they contain the required \
         versions of the container agent and [ecs-init]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-ami-versions.html}Amazon \
         ECS-optimized AMI versions} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  ipc_mode : ipc_mode option;
      [@ocaml.doc
        "The IPC resource namespace to use for the containers in the task. The valid values are \
         [host], [task], or [none]. If [host] is specified, then all containers within the tasks \
         that specified the [host] IPC mode on the same container instance share the same IPC \
         resources with the host Amazon EC2 instance. If [task] is specified, all containers \
         within the specified task share the same IPC resources. If [none] is specified, then IPC \
         resources within the containers of a task are private and not shared with other \
         containers in a task or on the container instance. If no value is specified, then the IPC \
         resource namespace sharing depends on the Docker daemon setting on the container \
         instance.\n\n\
        \ If the [host] IPC mode is used, be aware that there is a heightened risk of undesired \
         IPC namespace expose.\n\
        \ \n\
        \  If you are setting namespaced kernel parameters using [systemControls] for the \
         containers in the task, the following will apply to your IPC resource namespace. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html}System \
         Controls} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \  \n\
        \   {ul\n\
        \         {-  For tasks that use the [host] IPC mode, IPC namespace related \
         [systemControls] are not supported.\n\
        \             \n\
        \              }\n\
        \         {-  For tasks that use the [task] IPC mode, IPC namespace related \
         [systemControls] will apply to all containers within a task.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \    This parameter is not supported for Windows containers or tasks run on Fargate.\n\
        \    \n\
        \     "]
  pid_mode : pid_mode option;
      [@ocaml.doc
        "The process namespace to use for the containers in the task. The valid values are [host] \
         or [task]. On Fargate for Linux containers, the only valid value is [task]. For example, \
         monitoring sidecars might need [pidMode] to access information about other containers \
         running in the same task.\n\n\
        \ If [host] is specified, all containers within the tasks that specified the [host] PID \
         mode on the same container instance share the same process namespace with the host Amazon \
         EC2 instance.\n\
        \ \n\
        \  If [task] is specified, all containers within the specified task share the same process \
         namespace.\n\
        \  \n\
        \   If no value is specified, the The default is a private namespace for each container.\n\
        \   \n\
        \    If the [host] PID mode is used, there's a heightened risk of undesired process \
         namespace exposure.\n\
        \    \n\
        \      This parameter is not supported for Windows containers.\n\
        \      \n\
        \         This parameter is only supported for tasks that are hosted on Fargate if the \
         tasks are using platform version [1.4.0] or later (Linux). This isn't supported for \
         Windows containers on Fargate.\n\
        \         \n\
        \          "]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the task definition to help you categorize and organize \
         them. Each tag consists of a key and an optional value. You define both of them.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  memory : string_ option;
      [@ocaml.doc
        "The amount of memory (in MiB) used by the task. It can be expressed as an integer using \
         MiB (for example ,[1024]) or as a string using GB (for example, [1GB] or [1 GB]) in a \
         task definition. String values are converted to an integer indicating the MiB when the \
         task definition is registered.\n\n\
        \  Task-level CPU and memory parameters are ignored for Windows containers. We recommend \
         specifying container-level resources for Windows containers.\n\
        \  \n\
        \    If using the EC2 launch type, this field is optional.\n\
        \    \n\
        \     If using the Fargate launch type, this field is required and you must use one of the \
         following values. This determines your range of supported values for the [cpu] parameter.\n\
        \     \n\
        \      The CPU units cannot be less than 1 vCPU when you use Windows containers on Fargate.\n\
        \      \n\
        \       {ul\n\
        \             {-  512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available [cpu] values: 256 \
         (.25 vCPU)\n\
        \                 \n\
        \                  }\n\
        \             {-  1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available [cpu] \
         values: 512 (.5 vCPU)\n\
        \                 \n\
        \                  }\n\
        \             {-  2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 \
         GB), 8192 (8 GB) - Available [cpu] values: 1024 (1 vCPU)\n\
        \                 \n\
        \                  }\n\
        \             {-  Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) - \
         Available [cpu] values: 2048 (2 vCPU)\n\
        \                 \n\
        \                  }\n\
        \             {-  Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) - \
         Available [cpu] values: 4096 (4 vCPU)\n\
        \                 \n\
        \                  }\n\
        \             {-  Between 16 GB and 60 GB in 4 GB increments - Available [cpu] values: \
         8192 (8 vCPU)\n\
        \                 \n\
        \                  This option requires Linux platform [1.4.0] or later.\n\
        \                  \n\
        \                   }\n\
        \             {-  Between 32GB and 120 GB in 8 GB increments - Available [cpu] values: \
         16384 (16 vCPU)\n\
        \                 \n\
        \                  This option requires Linux platform [1.4.0] or later.\n\
        \                  \n\
        \                   }\n\
        \             }\n\
        \  "]
  cpu : string_ option;
      [@ocaml.doc
        "The number of CPU units used by the task. It can be expressed as an integer using CPU \
         units (for example, [1024]) or as a string using vCPUs (for example, [1 vCPU] or [1 \
         vcpu]) in a task definition. String values are converted to an integer indicating the CPU \
         units when the task definition is registered.\n\n\
        \  Task-level CPU and memory parameters are ignored for Windows containers. We recommend \
         specifying container-level resources for Windows containers.\n\
        \  \n\
        \    If you're using the EC2 launch type or external launch type, this field is optional. \
         Supported values are between [128] CPU units ([0.125] vCPUs) and [196608] CPU units \
         ([192] vCPUs). If you do not specify a value, the parameter is ignored.\n\
        \    \n\
        \     This field is required for Fargate. For information about the valid values, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size}Task \
         size} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \     "]
  requires_compatibilities : compatibility_list option;
      [@ocaml.doc
        "The task launch type that Amazon ECS validates the task definition against. A client \
         exception is returned if the task definition doesn't validate against the compatibilities \
         specified. If no value is specified, the parameter is omitted from the response.\n"]
  placement_constraints : task_definition_placement_constraints option;
      [@ocaml.doc
        "An array of placement constraint objects to use for the task. You can specify a maximum \
         of 10 constraints for each task. This limit includes constraints in the task definition \
         and those specified at runtime.\n"]
  volumes : volume_list option;
      [@ocaml.doc
        "A list of volume definitions in JSON format that containers in your task might use.\n"]
  container_definitions : container_definitions;
      [@ocaml.doc
        "A list of container definitions in JSON format that describe the different containers \
         that make up your task.\n"]
  network_mode : network_mode option;
      [@ocaml.doc
        "The Docker networking mode to use for the containers in the task. The valid values are \
         [none], [bridge], [awsvpc], and [host]. If no network mode is specified, the default is \
         [bridge].\n\n\
        \ For Amazon ECS tasks on Fargate, the [awsvpc] network mode is required. For Amazon ECS \
         tasks on Amazon EC2 Linux instances, any network mode can be used. For Amazon ECS tasks \
         on Amazon EC2 Windows instances, [<default>] or [awsvpc] can be used. If the network mode \
         is set to [none], you cannot specify port mappings in your container definitions, and the \
         tasks containers do not have external connectivity. The [host] and [awsvpc] network modes \
         offer the highest networking performance for containers because they use the EC2 network \
         stack instead of the virtualized network stack provided by the [bridge] mode.\n\
        \ \n\
        \  With the [host] and [awsvpc] network modes, exposed container ports are mapped directly \
         to the corresponding host port (for the [host] network mode) or the attached elastic \
         network interface port (for the [awsvpc] network mode), so you cannot take advantage of \
         dynamic host port mappings. \n\
        \  \n\
        \    When using the [host] network mode, you should not run containers using the root user \
         (UID 0). It is considered best practice to use a non-root user.\n\
        \    \n\
        \      If the network mode is [awsvpc], the task is allocated an elastic network \
         interface, and you must specify a \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_NetworkConfiguration.html}NetworkConfiguration} \
         value when you create a service or run a task with the task definition. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html}Task \
         Networking} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \      \n\
        \       If the network mode is [host], you cannot run multiple instantiations of the same \
         task on a single container instance when port mappings are used.\n\
        \       "]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS \
         container agent permission to make Amazon Web Services API calls on your behalf. For \
         informationabout the required IAM roles for Amazon ECS, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/security-ecs-iam-role-overview.html}IAM \
         roles for Amazon ECS} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  task_role_arn : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this \
         task can assume. All containers in this task are granted the permissions that are \
         specified in this role. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html}IAM \
         Roles for Tasks} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  family : string_;
      [@ocaml.doc
        "You must specify a [family] for a task definition. You can use it track multiple versions \
         of the same task definition. The [family] is used as a name for your task definition. Up \
         to 255 letters (uppercase and lowercase), numbers, underscores, and hyphens are allowed.\n"]
}
[@@ocaml.doc ""]

type nonrec register_daemon_task_definition_response = {
  daemon_task_definition_arn : string_ option;
      [@ocaml.doc "The full Amazon Resource Name (ARN) of the registered daemon task definition.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_linux_parameters = {
  tmpfs : tmpfs_list option;
      [@ocaml.doc "The container path, mount options, and size (in MiB) of the tmpfs mount.\n"]
  init_process_enabled : boxed_boolean option;
      [@ocaml.doc
        "Run an [init] process inside the container that forwards signals and reaps processes.\n"]
  devices : devices_list option; [@ocaml.doc "Any host devices to expose to the container.\n"]
  capabilities : kernel_capabilities option;
      [@ocaml.doc
        "The Linux capabilities for the container that are added to or dropped from the default \
         configuration provided by Docker.\n"]
}
[@@ocaml.doc
  "The Linux-specific options that are applied to the daemon container, such as Linux kernel \
   capabilities.\n"]

type nonrec daemon_container_definition = {
  restart_policy : container_restart_policy option;
      [@ocaml.doc
        "The restart policy for the container. When you set up a restart policy, Amazon ECS can \
         restart the container without needing to replace the task.\n"]
  pseudo_terminal : boxed_boolean option;
      [@ocaml.doc "When this parameter is [true], a TTY is allocated.\n"]
  interactive : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is [true], you can deploy containerized applications that require \
         [stdin] or a [tty] to be allocated.\n"]
  system_controls : system_controls option;
      [@ocaml.doc "A list of namespaced kernel parameters to set in the container.\n"]
  stop_timeout : boxed_integer option;
      [@ocaml.doc
        "Time duration (in seconds) to wait before the container is forcefully killed if it \
         doesn't exit normally on its own.\n"]
  start_timeout : boxed_integer option;
      [@ocaml.doc
        "Time duration (in seconds) to wait before giving up on resolving dependencies for a \
         container.\n"]
  depends_on : container_dependencies option;
      [@ocaml.doc
        "The dependencies defined for container startup and shutdown. A container can contain \
         multiple dependencies on other containers in a task definition.\n"]
  linux_parameters : daemon_linux_parameters option;
      [@ocaml.doc
        "Linux-specific modifications that are applied to the container configuration, such as \
         Linux kernel capabilities.\n"]
  ulimits : ulimit_list option; [@ocaml.doc "A list of [ulimits] to set in the container.\n"]
  user : string_ option; [@ocaml.doc "The user to use inside the container.\n"]
  privileged : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is true, the container is given elevated privileges on the host \
         container instance (similar to the [root] user).\n"]
  firelens_configuration : firelens_configuration option;
      [@ocaml.doc
        "The FireLens configuration for the container. This is used to specify and configure a log \
         router for container logs.\n"]
  log_configuration : log_configuration option;
      [@ocaml.doc "The log configuration specification for the container.\n"]
  mount_points : mount_point_list option;
      [@ocaml.doc "The mount points for data volumes in your container.\n"]
  readonly_root_filesystem : boxed_boolean option;
      [@ocaml.doc
        "When this parameter is true, the container is given read-only access to its root file \
         system.\n"]
  secrets : secret_list option; [@ocaml.doc "The secrets to pass to the container.\n"]
  environment : environment_variables option;
      [@ocaml.doc "The environment variables to pass to a container.\n"]
  environment_files : environment_files option;
      [@ocaml.doc "A list of files containing the environment variables to pass to a container.\n"]
  working_directory : string_ option;
      [@ocaml.doc "The working directory to run commands inside the container in.\n"]
  command : string_list option; [@ocaml.doc "The command that's passed to the container.\n"]
  entry_point : string_list option; [@ocaml.doc "The entry point that's passed to the container.\n"]
  essential : boxed_boolean option;
      [@ocaml.doc
        "If the [essential] parameter of a container is marked as [true], and that container fails \
         or stops for any reason, all other containers that are part of the task are stopped.\n"]
  cpu : integer option; [@ocaml.doc "The number of [cpu] units reserved for the container.\n"]
  health_check : health_check option;
      [@ocaml.doc
        "The container health check command and associated configuration parameters for the \
         container.\n"]
  repository_credentials : repository_credentials option;
      [@ocaml.doc "The private repository authentication credentials to use.\n"]
  memory_reservation : boxed_integer option;
      [@ocaml.doc "The soft limit (in MiB) of memory to reserve for the container.\n"]
  memory : boxed_integer option;
      [@ocaml.doc
        "The amount (in MiB) of memory to present to the container. If the container attempts to \
         exceed the memory specified here, the container is killed.\n"]
  image : string_;
      [@ocaml.doc
        "The image used to start the container. This string is passed directly to the Docker \
         daemon. Images in the Docker Hub registry are available by default. Other repositories \
         are specified with either \n\
         {[\n\
        \ {i repository-url}/{i image}:{i tag} \n\
         ]}\n\
        \ or \n\
         {[\n\
        \ {i repository-url}/{i image}\\@{i digest} \n\
         ]}\n\
         .\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the container. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed.\n"]
}
[@@ocaml.doc
  "A container definition for a daemon task. Daemon container definitions describe the containers \
   that run as part of a daemon task on container instances managed by capacity providers.\n"]

type nonrec daemon_container_definition_list = daemon_container_definition list [@@ocaml.doc ""]

type nonrec daemon_volume = {
  host : host_volume_properties option;
      [@ocaml.doc
        "The contents of the [host] parameter determine whether your bind mount host volume \
         persists on the host container instance and where it's stored.\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the volume. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed.\n"]
}
[@@ocaml.doc "A data volume definition for a daemon task.\n"]

type nonrec daemon_volume_list = daemon_volume list [@@ocaml.doc ""]

type nonrec daemon_pid_mode =
  | SHARED
      [@ocaml.doc
        "The daemon shares the PID namespace with co-located tasks on the same container instance.\n"]
  | NONE [@ocaml.doc "The daemon gets its own isolated PID namespace.\n"]
[@@ocaml.doc ""]

type nonrec daemon_ipc_mode =
  | SHARED
      [@ocaml.doc
        "The daemon shares the IPC namespace with co-located tasks on the same container instance.\n"]
  | NONE [@ocaml.doc "The daemon gets its own isolated IPC namespace.\n"]
[@@ocaml.doc ""]

type nonrec register_daemon_task_definition_request = {
  ipc_mode : daemon_ipc_mode option;
      [@ocaml.doc
        "The IPC namespace mode for the daemon. The valid values are [none] and [shared]. The \
         default is [none].\n\n\
        \ If [none] is specified or no value is provided, the daemon runs with its own IPC \
         namespace, isolated from other tasks. If [shared] is specified, the daemon joins the host \
         IPC namespace, making it accessible to non-daemon tasks that use [ipcMode: \"host\"] or \
         other daemons that use [ipcMode: \"shared\"].\n\
        \ "]
  pid_mode : daemon_pid_mode option;
      [@ocaml.doc
        "The PID namespace mode for the daemon. The valid values are [none] and [shared]. The \
         default is [none].\n\n\
        \ If [none] is specified or no value is provided, the daemon runs with its own PID \
         namespace, isolated from other tasks. If [shared] is specified, the daemon joins the host \
         PID namespace, making it accessible to non-daemon tasks that use [pidMode: \"host\"] or \
         other daemons that use [pidMode: \"shared\"].\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the daemon task definition to help you categorize and \
         organize them. Each tag consists of a key and an optional value. You define both of \
         them.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  volumes : daemon_volume_list option;
      [@ocaml.doc
        "A list of volume definitions in JSON format that containers in your daemon task can use.\n"]
  memory : string_ option;
      [@ocaml.doc
        "The amount of memory (in MiB) used by the daemon task. It can be expressed as an integer \
         using MiB (for example, [1024]).\n"]
  cpu : string_ option;
      [@ocaml.doc
        "The number of CPU units used by the daemon task. It can be expressed as an integer using \
         CPU units (for example, [1024]).\n"]
  container_definitions : daemon_container_definition_list;
      [@ocaml.doc
        "A list of container definitions in JSON format that describe the containers that make up \
         your daemon task.\n"]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS \
         container agent permission to make Amazon Web Services API calls on your behalf. The task \
         execution role is required for daemon tasks that pull container images from Amazon ECR or \
         send container logs to CloudWatch.\n"]
  task_role_arn : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this \
         daemon task can assume. All containers in this daemon task are granted the permissions \
         that are specified in this role.\n"]
  family : string_;
      [@ocaml.doc
        "You must specify a [family] for a daemon task definition. This family is used as a name \
         for your daemon task definition. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed.\n"]
}
[@@ocaml.doc ""]

type nonrec register_container_instance_response = {
  container_instance : container_instance option;
      [@ocaml.doc "The container instance that was registered.\n"]
}
[@@ocaml.doc ""]

type nonrec platform_device_type = NEURON_DEVICE [@ocaml.doc ""] | GPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec platform_device = {
  type_ : platform_device_type;
      [@ocaml.doc
        "The type of device that's available on the container instance. The supported values are \
         [GPU] and [NEURON_DEVICE].\n"]
  id : string_;
      [@ocaml.doc
        "The ID for the GPU or Neuron device on the container instance. For GPUs, the available \
         GPU IDs can also be obtained on the container instance in the \
         [/var/lib/ecs/gpu/nvidia_gpu_info.json] file. For Neuron devices, the ID corresponds to \
         the device index (for example, [0] for [/dev/neuron0]).\n"]
}
[@@ocaml.doc
  "The devices that are available on the container instance. The supported device types are GPUs \
   and Neuron devices.\n"]

type nonrec platform_devices = platform_device list [@@ocaml.doc ""]

type nonrec register_container_instance_request = {
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the container instance to help you categorize and organize \
         them. Each tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  platform_devices : platform_devices option;
      [@ocaml.doc
        "The devices that are available on the container instance. The supported device types are \
         GPUs and Neuron devices.\n"]
  attributes : attributes option;
      [@ocaml.doc "The container instance attributes that this container instance supports.\n"]
  container_instance_arn : string_ option;
      [@ocaml.doc "The ARN of the container instance (if it was previously registered).\n"]
  version_info : version_info option;
      [@ocaml.doc
        "The version information for the Amazon ECS container agent and Docker daemon that runs on \
         the container instance.\n"]
  total_resources : resources option; [@ocaml.doc "The resources available on the instance.\n"]
  instance_identity_document_signature : string_ option;
      [@ocaml.doc
        "The instance identity document signature for the EC2 instance to register. This signature \
         can be found by running the following command from the instance: [curl \
         http://169.254.169.254/latest/dynamic/instance-identity/signature/] \n"]
  instance_identity_document : string_ option;
      [@ocaml.doc
        "The instance identity document for the EC2 instance to register. This document can be \
         found by running the following command from the instance: [curl \
         http://169.254.169.254/latest/dynamic/instance-identity/document/] \n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster to register your \
         container instance with. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec put_cluster_capacity_providers_response = {
  cluster : cluster option; [@ocaml.doc "Details about the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec put_cluster_capacity_providers_request = {
  default_capacity_provider_strategy : capacity_provider_strategy;
      [@ocaml.doc
        "The capacity provider strategy to use by default for the cluster.\n\n\
        \ When creating a service or running a task on a cluster, if no capacity provider or \
         launch type is specified then the default capacity provider strategy for the cluster is \
         used.\n\
        \ \n\
        \  A capacity provider strategy consists of one or more capacity providers along with the \
         [base] and [weight] to assign to them. A capacity provider must be associated with the \
         cluster to be used in a capacity provider strategy. The \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
         API is used to associate a capacity provider with a cluster. Only capacity providers with \
         an [ACTIVE] or [UPDATING] status can be used.\n\
        \  \n\
        \   If specifying a capacity provider that uses an Auto Scaling group, the capacity \
         provider must already be created. New capacity providers can be created with the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCapacityProvider.html}CreateCapacityProvider} \
         API operation.\n\
        \   \n\
        \    To use a Fargate capacity provider, specify either the [FARGATE] or [FARGATE_SPOT] \
         capacity providers. The Fargate capacity providers are available to all accounts and only \
         need to be associated with a cluster to be used.\n\
        \    "]
  capacity_providers : string_list;
      [@ocaml.doc
        "The name of one or more capacity providers to associate with the cluster.\n\n\
        \ If specifying a capacity provider that uses an Auto Scaling group, the capacity provider \
         must already be created. New capacity providers can be created with the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCapacityProvider.html}CreateCapacityProvider} \
         API operation.\n\
        \ \n\
        \  To use a Fargate capacity provider, specify either the [FARGATE] or [FARGATE_SPOT] \
         capacity providers. The Fargate capacity providers are available to all accounts and only \
         need to be associated with a cluster to be used.\n\
        \  "]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster to modify the capacity \
         provider settings for. If you don't specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec put_attributes_response = {
  attributes : attributes option; [@ocaml.doc "The attributes applied to your resource.\n"]
}
[@@ocaml.doc ""]

type nonrec put_attributes_request = {
  attributes : attributes;
      [@ocaml.doc
        "The attributes to apply to your resource. You can specify up to 10 custom attributes for \
         each resource. You can specify up to 10 attributes in a single call.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that contains the \
         resource to apply attributes. If you do not specify a cluster, the default cluster is \
         assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec attribute_limit_exceeded_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "You can apply up to 10 custom attributes for each resource. You can view the attributes of a \
   resource with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListAttributes.html}ListAttributes}. \
   You can remove existing attributes on a resource with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeleteAttributes.html}DeleteAttributes}.\n"]

type nonrec put_account_setting_response = {
  setting : setting option; [@ocaml.doc "The current account setting for a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec put_account_setting_request = {
  principal_arn : string_ option;
      [@ocaml.doc
        "The ARN of the principal, which can be a user, role, or the root user. If you specify the \
         root user, it modifies the account setting for all users, roles, and the root user of the \
         account unless a user or role explicitly overrides these settings. If this field is \
         omitted, the setting is changed only for the authenticated user.\n\n\
        \ In order to use this parameter, you must be the root user, or the principal.\n\
        \ \n\
        \   You must use the root user when you set the Fargate wait time \
         ([fargateTaskRetirementWaitPeriod]). \n\
        \   \n\
        \    Federated users assume the account setting of the root user and can't have explicit \
         account settings set for them.\n\
        \    \n\
        \     "]
  value : string_;
      [@ocaml.doc
        "The account setting value for the specified principal ARN. Accepted values are [enabled], \
         [disabled], [enhanced], [on], and [off].\n\n\
        \ When you specify [fargateTaskRetirementWaitPeriod] for the [name], the following are the \
         valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [0] - Amazon Web Services sends the notification, and immediately retires \
         the affected tasks.\n\
        \            \n\
        \             }\n\
        \        {-   [7] - Amazon Web Services sends the notification, and waits 7 calendar days \
         to retire the tasks.\n\
        \            \n\
        \             }\n\
        \        {-   [14] - Amazon Web Services sends the notification, and waits 14 calendar \
         days to retire the tasks.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : setting_name;
      [@ocaml.doc
        "The Amazon ECS account setting name to modify.\n\n\
        \ The following are the valid values for the account setting name.\n\
        \ \n\
        \  {ul\n\
        \        {-   [serviceLongArnFormat] - When modified, the Amazon Resource Name (ARN) and \
         resource ID format of the resource type for a specified user, role, or the root user for \
         an account is affected. The opt-in and opt-out account setting must be set for each \
         Amazon ECS resource separately. The ARN and resource ID format of a resource is defined \
         by the opt-in status of the user or role that created the resource. You must turn on this \
         setting to use Amazon ECS features such as resource tagging.\n\
        \            \n\
        \             }\n\
        \        {-   [taskLongArnFormat] - When modified, the Amazon Resource Name (ARN) and \
         resource ID format of the resource type for a specified user, role, or the root user for \
         an account is affected. The opt-in and opt-out account setting must be set for each \
         Amazon ECS resource separately. The ARN and resource ID format of a resource is defined \
         by the opt-in status of the user or role that created the resource. You must turn on this \
         setting to use Amazon ECS features such as resource tagging.\n\
        \            \n\
        \             }\n\
        \        {-   [containerInstanceLongArnFormat] - When modified, the Amazon Resource Name \
         (ARN) and resource ID format of the resource type for a specified user, role, or the root \
         user for an account is affected. The opt-in and opt-out account setting must be set for \
         each Amazon ECS resource separately. The ARN and resource ID format of a resource is \
         defined by the opt-in status of the user or role that created the resource. You must turn \
         on this setting to use Amazon ECS features such as resource tagging.\n\
        \            \n\
        \             }\n\
        \        {-   [awsvpcTrunking] - When modified, the elastic network interface (ENI) limit \
         for any new container instances that support the feature is changed. If [awsvpcTrunking] \
         is turned on, any new container instances that support the feature are launched have the \
         increased ENI limits available to them. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html}Elastic \
         Network Interface Trunking} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [containerInsights] - Container Insights with enhanced observability \
         provides all the Container Insights metrics, plus additional task and container metrics. \
         This version supports enhanced observability for Amazon ECS clusters using the Amazon EC2 \
         and Fargate launch types. After you configure Container Insights with enhanced \
         observability on Amazon ECS, Container Insights auto-collects detailed infrastructure \
         telemetry from the cluster level down to the container level in your environment and \
         displays these critical performance data in curated dashboards removing the heavy lifting \
         in observability set-up. \n\
        \            \n\
        \             To use Container Insights with enhanced observability, set the \
         [containerInsights] account setting to [enhanced].\n\
        \             \n\
        \              To use Container Insights, set the [containerInsights] account setting to \
         [enabled].\n\
        \              \n\
        \               For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html}Monitor \
         Amazon ECS containers using Container Insights with enhanced observability} in the {i \
         Amazon Elastic Container Service Developer Guide}.\n\
        \               \n\
        \                }\n\
        \        {-   [dualStackIPv6] - When turned on, when using a VPC in dual stack mode, your \
         tasks using the [awsvpc] network mode can have an IPv6 address assigned. For more \
         information on using IPv6 with tasks launched on Amazon EC2 instances, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking-awsvpc.html#task-networking-vpc-dual-stack}Using \
         a VPC in dual-stack mode}. For more information on using IPv6 with tasks launched on \
         Fargate, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-task-networking.html#fargate-task-networking-vpc-dual-stack}Using \
         a VPC in dual-stack mode}.\n\
        \            \n\
        \             }\n\
        \        {-   [fargateTaskRetirementWaitPeriod] - When Amazon Web Services determines that \
         a security or infrastructure update is needed for an Amazon ECS task hosted on Fargate, \
         the tasks need to be stopped and new tasks launched to replace them. Use \
         [fargateTaskRetirementWaitPeriod] to configure the wait time to retire a Fargate task. \
         For information about the Fargate tasks maintenance, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-maintenance.html}Amazon \
         Web Services Fargate task maintenance} in the {i Amazon ECS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [fargateEventWindows] - When Amazon Web Services determines that a security \
         or infrastructure update is needed for an Amazon ECS task hosted on Fargate, the tasks \
         need to be stopped and new tasks launched to replace them. Use [fargateEventWindows] to \
         use EC2 Event Windows associated with Fargate tasks to configure time windows for task \
         retirement.\n\
        \            \n\
        \             }\n\
        \        {-   [tagResourceAuthorization] - Amazon ECS is introducing tagging authorization \
         for resource creation. Users must have permissions for actions that create the resource, \
         such as [ecsCreateCluster]. If tags are specified when you create a resource, Amazon Web \
         Services performs additional authorization to verify if users or roles have permissions \
         to create tags. Therefore, you must grant explicit permissions to use the \
         [ecs:TagResource] action. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/supported-iam-actions-tagging.html}Grant \
         permission to tag resources on creation} in the {i Amazon ECS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [defaultLogDriverMode] - Amazon ECS supports setting a default delivery mode \
         of log messages from a container to the [logDriver] that you specify in the container's \
         [logConfiguration]. The delivery mode affects application stability when the flow of logs \
         from the container to the log driver is interrupted. The [defaultLogDriverMode] setting \
         supports two values: [blocking] and [non-blocking]. If you don't specify a delivery mode \
         in your container definition's [logConfiguration], the mode you specify using this \
         account setting will be used as the default. For more information about log delivery \
         modes, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html}LogConfiguration}. \n\
        \            \n\
        \              On June 25, 2025, Amazon ECS changed the default log driver mode from \
         [blocking] to [non-blocking] to prioritize task availability over logging. To continue \
         using the [blocking] mode after this change, do one of the following:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Set the [mode] option in your container definition's \
         [logConfiguration] as [blocking].\n\
        \                         \n\
        \                          }\n\
        \                     {-  Set the [defaultLogDriverMode] account setting to [blocking].\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \         }\n\
        \           }\n\
        \        {-   [guardDutyActivate] - The [guardDutyActivate] parameter is read-only in \
         Amazon ECS and indicates whether Amazon ECS Runtime Monitoring is enabled or disabled by \
         your security administrator in your Amazon ECS account. Amazon GuardDuty controls this \
         account setting on your behalf. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-guard-duty-integration.html}Protecting \
         Amazon ECS workloads with Amazon ECS Runtime Monitoring}.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec put_account_setting_default_response = {
  setting : setting option; [@ocaml.doc "The current setting for a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec put_account_setting_default_request = {
  value : string_;
      [@ocaml.doc
        "The account setting value for the specified principal ARN. Accepted values are [enabled], \
         [disabled], [on], [enhanced], and [off].\n\n\
        \ When you specify [fargateTaskRetirementWaitPeriod] for the [name], the following are the \
         valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [0] - Amazon Web Services sends the notification, and immediately retires \
         the affected tasks.\n\
        \            \n\
        \             }\n\
        \        {-   [7] - Amazon Web Services sends the notification, and waits 7 calendar days \
         to retire the tasks.\n\
        \            \n\
        \             }\n\
        \        {-   [14] - Amazon Web Services sends the notification, and waits 14 calendar \
         days to retire the tasks.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : setting_name;
      [@ocaml.doc
        "The resource name for which to modify the account setting.\n\n\
        \ The following are the valid values for the account setting name.\n\
        \ \n\
        \  {ul\n\
        \        {-   [serviceLongArnFormat] - When modified, the Amazon Resource Name (ARN) and \
         resource ID format of the resource type for a specified user, role, or the root user for \
         an account is affected. The opt-in and opt-out account setting must be set for each \
         Amazon ECS resource separately. The ARN and resource ID format of a resource is defined \
         by the opt-in status of the user or role that created the resource. You must turn on this \
         setting to use Amazon ECS features such as resource tagging.\n\
        \            \n\
        \             }\n\
        \        {-   [taskLongArnFormat] - When modified, the Amazon Resource Name (ARN) and \
         resource ID format of the resource type for a specified user, role, or the root user for \
         an account is affected. The opt-in and opt-out account setting must be set for each \
         Amazon ECS resource separately. The ARN and resource ID format of a resource is defined \
         by the opt-in status of the user or role that created the resource. You must turn on this \
         setting to use Amazon ECS features such as resource tagging.\n\
        \            \n\
        \             }\n\
        \        {-   [containerInstanceLongArnFormat] - When modified, the Amazon Resource Name \
         (ARN) and resource ID format of the resource type for a specified user, role, or the root \
         user for an account is affected. The opt-in and opt-out account setting must be set for \
         each Amazon ECS resource separately. The ARN and resource ID format of a resource is \
         defined by the opt-in status of the user or role that created the resource. You must turn \
         on this setting to use Amazon ECS features such as resource tagging.\n\
        \            \n\
        \             }\n\
        \        {-   [awsvpcTrunking] - When modified, the elastic network interface (ENI) limit \
         for any new container instances that support the feature is changed. If [awsvpcTrunking] \
         is turned on, any new container instances that support the feature are launched have the \
         increased ENI limits available to them. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html}Elastic \
         Network Interface Trunking} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [containerInsights] - Container Insights with enhanced observability \
         provides all the Container Insights metrics, plus additional task and container metrics. \
         This version supports enhanced observability for Amazon ECS clusters using the Amazon EC2 \
         and Fargate launch types. After you configure Container Insights with enhanced \
         observability on Amazon ECS, Container Insights auto-collects detailed infrastructure \
         telemetry from the cluster level down to the container level in your environment and \
         displays these critical performance data in curated dashboards removing the heavy lifting \
         in observability set-up. \n\
        \            \n\
        \             To use Container Insights with enhanced observability, set the \
         [containerInsights] account setting to [enhanced].\n\
        \             \n\
        \              To use Container Insights, set the [containerInsights] account setting to \
         [enabled].\n\
        \              \n\
        \               For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html}Monitor \
         Amazon ECS containers using Container Insights with enhanced observability} in the {i \
         Amazon Elastic Container Service Developer Guide}.\n\
        \               \n\
        \                }\n\
        \        {-   [dualStackIPv6] - When turned on, when using a VPC in dual stack mode, your \
         tasks using the [awsvpc] network mode can have an IPv6 address assigned. For more \
         information on using IPv6 with tasks launched on Amazon EC2 instances, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking-awsvpc.html#task-networking-vpc-dual-stack}Using \
         a VPC in dual-stack mode}. For more information on using IPv6 with tasks launched on \
         Fargate, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-task-networking.html#fargate-task-networking-vpc-dual-stack}Using \
         a VPC in dual-stack mode}.\n\
        \            \n\
        \             }\n\
        \        {-   [fargateFIPSMode] - If you specify [fargateFIPSMode], Fargate FIPS 140 \
         compliance is affected.\n\
        \            \n\
        \             }\n\
        \        {-   [fargateTaskRetirementWaitPeriod] - When Amazon Web Services determines that \
         a security or infrastructure update is needed for an Amazon ECS task hosted on Fargate, \
         the tasks need to be stopped and new tasks launched to replace them. Use \
         [fargateTaskRetirementWaitPeriod] to configure the wait time to retire a Fargate task. \
         For information about the Fargate tasks maintenance, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-maintenance.html}Amazon \
         Web Services Fargate task maintenance} in the {i Amazon ECS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [fargateEventWindows] - When Amazon Web Services determines that a security \
         or infrastructure update is needed for an Amazon ECS task hosted on Fargate, the tasks \
         need to be stopped and new tasks launched to replace them. Use [fargateEventWindows] to \
         use EC2 Event Windows associated with Fargate tasks to configure time windows for task \
         retirement.\n\
        \            \n\
        \             }\n\
        \        {-   [tagResourceAuthorization] - Amazon ECS is introducing tagging authorization \
         for resource creation. Users must have permissions for actions that create the resource, \
         such as [ecsCreateCluster]. If tags are specified when you create a resource, Amazon Web \
         Services performs additional authorization to verify if users or roles have permissions \
         to create tags. Therefore, you must grant explicit permissions to use the \
         [ecs:TagResource] action. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/supported-iam-actions-tagging.html}Grant \
         permission to tag resources on creation} in the {i Amazon ECS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [defaultLogDriverMode] -Amazon ECS supports setting a default delivery mode \
         of log messages from a container to the [logDriver] that you specify in the container's \
         [logConfiguration]. The delivery mode affects application stability when the flow of logs \
         from the container to the log driver is interrupted. The [defaultLogDriverMode] setting \
         supports two values: [blocking] and [non-blocking]. If you don't specify a delivery mode \
         in your container definition's [logConfiguration], the mode you specify using this \
         account setting will be used as the default. For more information about log delivery \
         modes, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html}LogConfiguration}.\n\
        \            \n\
        \              On June 25, 2025, Amazon ECS changed the default log driver mode from \
         [blocking] to [non-blocking] to prioritize task availability over logging. To continue \
         using the [blocking] mode after this change, do one of the following:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Set the [mode] option in your container definition's \
         [logConfiguration] as [blocking].\n\
        \                         \n\
        \                          }\n\
        \                     {-  Set the [defaultLogDriverMode] account setting to [blocking].\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \         }\n\
        \           }\n\
        \        {-   [guardDutyActivate] - The [guardDutyActivate] parameter is read-only in \
         Amazon ECS and indicates whether Amazon ECS Runtime Monitoring is enabled or disabled by \
         your security administrator in your Amazon ECS account. Amazon GuardDuty controls this \
         account setting on your behalf. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-guard-duty-integration.html}Protecting \
         Amazon ECS workloads with Amazon ECS Runtime Monitoring}.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_tasks_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListTasks] request. When the results of a \
         [ListTasks] request exceed [maxResults], this value can be used to retrieve the next page \
         of results. This value is [null] when there are no more results to return.\n"]
  task_arns : string_list option;
      [@ocaml.doc "The list of task ARN entries for the [ListTasks] request.\n"]
}
[@@ocaml.doc ""]

type nonrec desired_status =
  | STOPPED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_tasks_request = {
  daemon_name : string_ option;
      [@ocaml.doc
        "The name of the daemon to use when filtering the [ListTasks] results. Specifying a \
         [daemonName] limits the results to tasks that belong to that daemon.\n"]
  launch_type : launch_type option;
      [@ocaml.doc "The launch type to use when filtering the [ListTasks] results.\n"]
  desired_status : desired_status option;
      [@ocaml.doc
        "The task desired status to use when filtering the [ListTasks] results. Specifying a \
         [desiredStatus] of [STOPPED] limits the results to tasks that Amazon ECS has set the \
         desired status to [STOPPED]. This can be useful for debugging tasks that aren't starting \
         properly or have died or finished. The default status filter is [RUNNING], which shows \
         tasks that Amazon ECS has set the desired status to [RUNNING].\n\n\
        \  Although you can filter results based on a desired status of [PENDING], this doesn't \
         return any results. Amazon ECS never sets the desired status of a task to that value \
         (only a task's [lastStatus] may have a value of [PENDING]).\n\
        \  \n\
        \   "]
  service_name : string_ option;
      [@ocaml.doc
        "The name of the service to use when filtering the [ListTasks] results. Specifying a \
         [serviceName] limits the results to tasks that belong to that service.\n"]
  started_by : string_ option;
      [@ocaml.doc
        "The [startedBy] value to filter the task results with. Specifying a [startedBy] value \
         limits the results to tasks that were started with that value.\n\n\
        \ When you specify [startedBy] as the filter, it must be the only filter that you use.\n\
        \ "]
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of task results that [ListTasks] returned in paginated output. When \
         this parameter is used, [ListTasks] only returns [maxResults] results in a single page \
         along with a [nextToken] response element. The remaining results of the initial request \
         can be seen by sending another [ListTasks] request with the returned [nextToken] value. \
         This value can be between 1 and 100. If this parameter isn't used, then [ListTasks] \
         returns up to 100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListTasks] request indicating that more results \
         are available to fulfill the request and further calls will be needed. If [maxResults] \
         was provided, it's possible the number of results to be fewer than [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  family : string_ option;
      [@ocaml.doc
        "The name of the task definition family to use when filtering the [ListTasks] results. \
         Specifying a [family] limits the results to tasks that belong to that family.\n"]
  container_instance : string_ option;
      [@ocaml.doc
        "The container instance ID or full ARN of the container instance to use when filtering the \
         [ListTasks] results. Specifying a [containerInstance] limits the results to tasks that \
         belong to that container instance.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster to use when filtering \
         the [ListTasks] results. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_task_definitions_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListTaskDefinitions] request. When the \
         results of a [ListTaskDefinitions] request exceed [maxResults], this value can be used to \
         retrieve the next page of results. This value is [null] when there are no more results to \
         return.\n"]
  task_definition_arns : string_list option;
      [@ocaml.doc
        "The list of task definition Amazon Resource Name (ARN) entries for the \
         [ListTaskDefinitions] request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_task_definitions_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of task definition results that [ListTaskDefinitions] returned in \
         paginated output. When this parameter is used, [ListTaskDefinitions] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [ListTaskDefinitions] request with the returned [nextToken] value. This value can be \
         between 1 and 100. If this parameter isn't used, then [ListTaskDefinitions] returns up to \
         100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListTaskDefinitions] request indicating that more \
         results are available to fulfill the request and further calls will be needed. If \
         [maxResults] was provided, it is possible the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  sort : sort_order option;
      [@ocaml.doc
        "The order to sort the results in. Valid values are [ASC] and [DESC]. By default, ([ASC]) \
         task definitions are listed lexicographically by family name and in ascending numerical \
         order by revision so that the newest task definitions in a family are listed last. \
         Setting this parameter to [DESC] reverses the sort order on family name and revision. \
         This is so that the newest task definitions in a family are listed first.\n"]
  status : task_definition_status option;
      [@ocaml.doc
        "The task definition status to filter the [ListTaskDefinitions] results with. By default, \
         only [ACTIVE] task definitions are listed. By setting this parameter to [INACTIVE], you \
         can view task definitions that are [INACTIVE] as long as an active task or service still \
         references them. If you paginate the resulting output, be sure to keep the [status] value \
         constant in each subsequent request.\n"]
  family_prefix : string_ option;
      [@ocaml.doc
        "The full family name to filter the [ListTaskDefinitions] results with. Specifying a \
         [familyPrefix] limits the listed task definitions to task definition revisions that \
         belong to that family.\n"]
}
[@@ocaml.doc ""]

type nonrec list_task_definition_families_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListTaskDefinitionFamilies] request. When \
         the results of a [ListTaskDefinitionFamilies] request exceed [maxResults], this value can \
         be used to retrieve the next page of results. This value is [null] when there are no more \
         results to return.\n"]
  families : string_list option;
      [@ocaml.doc
        "The list of task definition family names that match the [ListTaskDefinitionFamilies] \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_task_definition_families_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of task definition family results that [ListTaskDefinitionFamilies] \
         returned in paginated output. When this parameter is used, [ListTaskDefinitions] only \
         returns [maxResults] results in a single page along with a [nextToken] response element. \
         The remaining results of the initial request can be seen by sending another \
         [ListTaskDefinitionFamilies] request with the returned [nextToken] value. This value can \
         be between 1 and 100. If this parameter isn't used, then [ListTaskDefinitionFamilies] \
         returns up to 100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListTaskDefinitionFamilies] request indicating \
         that more results are available to fulfill the request and further calls will be needed. \
         If [maxResults] was provided, it is possible the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  status : task_definition_family_status option;
      [@ocaml.doc
        "The task definition family status to filter the [ListTaskDefinitionFamilies] results \
         with. By default, both [ACTIVE] and [INACTIVE] task definition families are listed. If \
         this parameter is set to [ACTIVE], only task definition families that have an [ACTIVE] \
         task definition revision are returned. If this parameter is set to [INACTIVE], only task \
         definition families that do not have any [ACTIVE] task definition revisions are returned. \
         If you paginate the resulting output, be sure to keep the [status] value constant in each \
         subsequent request.\n"]
  family_prefix : string_ option;
      [@ocaml.doc
        "The [familyPrefix] is a string that's used to filter the results of \
         [ListTaskDefinitionFamilies]. If you specify a [familyPrefix], only task definition \
         family names that begin with the [familyPrefix] string are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource to list the tags for. \
         Currently, the supported resources are Amazon ECS tasks, services, task definitions, \
         clusters, and container instances.\n"]
}
[@@ocaml.doc ""]

type nonrec list_services_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListServices] request. When the results of \
         a [ListServices] request exceed [maxResults], this value can be used to retrieve the next \
         page of results. This value is [null] when there are no more results to return.\n"]
  service_arns : string_list option;
      [@ocaml.doc
        "The list of full ARN entries for each service that's associated with the specified cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec list_services_request = {
  resource_management_type : resource_management_type option;
      [@ocaml.doc
        "The resourceManagementType type to use when filtering the [ListServices] results.\n"]
  scheduling_strategy : scheduling_strategy option;
      [@ocaml.doc "The scheduling strategy to use when filtering the [ListServices] results.\n"]
  launch_type : launch_type option;
      [@ocaml.doc "The launch type to use when filtering the [ListServices] results.\n"]
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of service results that [ListServices] returned in paginated output. \
         When this parameter is used, [ListServices] only returns [maxResults] results in a single \
         page along with a [nextToken] response element. The remaining results of the initial \
         request can be seen by sending another [ListServices] request with the returned \
         [nextToken] value. This value can be between 1 and 100. If this parameter isn't used, \
         then [ListServices] returns up to 10 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListServices] request indicating that more results \
         are available to fulfill the request and further calls will be needed. If [maxResults] \
         was provided, it is possible the number of results to be fewer than [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster to use when filtering \
         the [ListServices] results. If you do not specify a cluster, the default cluster is \
         assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_services_by_namespace_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListServicesByNamespace] request. When the \
         results of a [ListServicesByNamespace] request exceed [maxResults], this value can be \
         used to retrieve the next page of results. When there are no more results to return, this \
         value is [null].\n"]
  service_arns : string_list option;
      [@ocaml.doc
        "The list of full ARN entries for each service that's associated with the specified \
         namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec list_services_by_namespace_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of service results that [ListServicesByNamespace] returns in paginated \
         output. When this parameter is used, [ListServicesByNamespace] only returns [maxResults] \
         results in a single page along with a [nextToken] response element. The remaining results \
         of the initial request can be seen by sending another [ListServicesByNamespace] request \
         with the returned [nextToken] value. This value can be between 1 and 100. If this \
         parameter isn't used, then [ListServicesByNamespace] returns up to 10 results and a \
         [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value that's returned from a [ListServicesByNamespace] request. It \
         indicates that more results are available to fulfill the request and further calls are \
         needed. If [maxResults] is returned, it is possible the number of results is less than \
         [maxResults].\n"]
  namespace : string_;
      [@ocaml.doc
        "The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace to list \
         the services in.\n\n\
        \ Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_service_deployments_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListServiceDeployments] request. When the \
         results of a [ListServiceDeployments] request exceed [maxResults], this value can be used \
         to retrieve the next page of results. This value is null when there are no more results \
         to return.\n"]
  service_deployments : service_deployments_brief option;
      [@ocaml.doc
        "An overview of the service deployment, including the following properties:\n\n\
        \ {ul\n\
        \       {-  The ARN of the service deployment.\n\
        \           \n\
        \            }\n\
        \       {-  The ARN of the service being deployed.\n\
        \           \n\
        \            }\n\
        \       {-  The ARN of the cluster that hosts the service in the service deployment.\n\
        \           \n\
        \            }\n\
        \       {-  The time that the service deployment started.\n\
        \           \n\
        \            }\n\
        \       {-  The time that the service deployment completed.\n\
        \           \n\
        \            }\n\
        \       {-  The service deployment status.\n\
        \           \n\
        \            }\n\
        \       {-  Information about why the service deployment is in the current state.\n\
        \           \n\
        \            }\n\
        \       {-  The ARN of the service revision that is being deployed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec created_at = {
  after : timestamp option;
      [@ocaml.doc
        "Include service deployments in the result that were created after this time. The format \
         is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  before : timestamp option;
      [@ocaml.doc
        "Include service deployments in the result that were created before this time. The format \
         is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
}
[@@ocaml.doc
  "The optional filter to narrow the [ListServiceDeployment] results.\n\n\
  \  If you do not specify a value, service deployments that were created before the current time \
   are included in the result.\n\
  \ "]

type nonrec list_service_deployments_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of service deployment results that [ListServiceDeployments] returned \
         in paginated output. When this parameter is used, [ListServiceDeployments] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [ListServiceDeployments] request with the returned [nextToken] value. This value can be \
         between 1 and 100. If this parameter isn't used, then [ListServiceDeployments] returns up \
         to 20 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListServiceDeployments] request indicating that \
         more results are available to fulfill the request and further calls are needed. If you \
         provided [maxResults], it's possible the number of results is fewer than [maxResults].\n"]
  created_at : created_at option;
      [@ocaml.doc
        "An optional filter you can use to narrow the results by the service creation date. If you \
         do not specify a value, the result includes all services created before the current time. \
         The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  status : service_deployment_status_list option;
      [@ocaml.doc
        "An optional filter you can use to narrow the results. If you do not specify a status, \
         then all status values are included in the result.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The cluster that hosts the service. This can either be the cluster name or ARN. Starting \
         April 15, 2023, Amazon Web Services will not onboard new customers to Amazon Elastic \
         Inference (EI), and will help current customers migrate their workloads to options that \
         offer better price and performance. If you don't specify a cluster, [default] is used.\n"]
  service : string_; [@ocaml.doc "The ARN or name of the service\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_summary = {
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was created.\n"]
  status : daemon_status option; [@ocaml.doc "The status of the daemon.\n"]
  daemon_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon.\n"]
}
[@@ocaml.doc "A summary of a daemon.\n"]

type nonrec daemon_summaries_list = daemon_summary list [@@ocaml.doc ""]

type nonrec list_daemons_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListDaemons] request. When the results of a \
         [ListDaemons] request exceed [maxResults], this value can be used to retrieve the next \
         page of results.\n"]
  daemon_summaries_list : daemon_summaries_list option;
      [@ocaml.doc "The list of daemon summaries.\n"]
}
[@@ocaml.doc ""]

type nonrec list_daemons_request = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListDaemons] request indicating that more results \
         are available to fulfill the request and further calls will be needed. If [maxResults] \
         was provided, it's possible for the number of results to be fewer than [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of daemon results that [ListDaemons] returned in paginated output. \
         When this parameter is used, [ListDaemons] only returns [maxResults] results in a single \
         page along with a [nextToken] response element. The remaining results of the initial \
         request can be seen by sending another [ListDaemons] request with the returned \
         [nextToken] value. This value can be between 1 and 100. If this parameter isn't used, \
         then [ListDaemons] returns up to 100 results and a [nextToken] value if applicable.\n"]
  capacity_provider_arns : string_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the capacity providers to filter daemons by. Only \
         daemons associated with the specified capacity providers are returned.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the cluster to filter daemons by. If you do not specify \
         a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_task_definition_status =
  | DELETED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec daemon_task_definition_summary = {
  status : daemon_task_definition_status option;
      [@ocaml.doc "The status of the daemon task definition.\n"]
  delete_requested_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the daemon task definition delete was requested.\n"]
  registered_by : string_ option;
      [@ocaml.doc "The principal that registered the daemon task definition.\n"]
  registered_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the daemon task definition was registered.\n"]
  arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon task definition.\n"]
}
[@@ocaml.doc "A summary of a daemon task definition.\n"]

type nonrec daemon_task_definition_summaries = daemon_task_definition_summary list [@@ocaml.doc ""]

type nonrec list_daemon_task_definitions_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListDaemonTaskDefinitions] request. When \
         the results of a [ListDaemonTaskDefinitions] request exceed [maxResults], this value can \
         be used to retrieve the next page of results.\n"]
  daemon_task_definitions : daemon_task_definition_summaries option;
      [@ocaml.doc "The list of daemon task definition summaries.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_task_definition_revision_filter = LAST_REGISTERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec daemon_task_definition_status_filter =
  | ALL [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_daemon_task_definitions_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of daemon task definition results that [ListDaemonTaskDefinitions] \
         returned in paginated output. When this parameter is used, [ListDaemonTaskDefinitions] \
         only returns [maxResults] results in a single page along with a [nextToken] response \
         element. The remaining results of the initial request can be seen by sending another \
         [ListDaemonTaskDefinitions] request with the returned [nextToken] value. This value can \
         be between 1 and 100. If this parameter isn't used, then [ListDaemonTaskDefinitions] \
         returns up to 100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListDaemonTaskDefinitions] request indicating that \
         more results are available to fulfill the request and further calls will be needed. If \
         [maxResults] was provided, it's possible for the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  sort : sort_order option;
      [@ocaml.doc
        "The order to sort the results. Valid values are [ASC] and [DESC]. By default ([ASC]), \
         daemon task definitions are listed in ascending order by family name and revision number.\n"]
  status : daemon_task_definition_status_filter option;
      [@ocaml.doc
        "The daemon task definition status to filter the [ListDaemonTaskDefinitions] results with. \
         By default, only [ACTIVE] daemon task definitions are listed. If you set this parameter \
         to [DELETE_IN_PROGRESS], only daemon task definitions that are in the process of being \
         deleted are listed. If you set this parameter to [ALL], all daemon task definitions are \
         listed regardless of status.\n"]
  revision : daemon_task_definition_revision_filter option;
      [@ocaml.doc
        "The revision filter to apply. Specify [LAST_REGISTERED] to return only the last \
         registered revision for each daemon task definition family.\n"]
  family : string_ option;
      [@ocaml.doc "The exact name of the daemon task definition family to filter results with.\n"]
  family_prefix : string_ option;
      [@ocaml.doc
        "The full family name to filter the [ListDaemonTaskDefinitions] results with. Specifying a \
         [familyPrefix] limits the listed daemon task definitions to daemon task definition \
         families that start with the [familyPrefix] string.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_deployment_status =
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_SUCCESSFUL [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | SUCCESSFUL [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec daemon_deployment_summary = {
  finished_at : timestamp option; [@ocaml.doc "The time the daemon deployment finished.\n"]
  stopped_at : timestamp option; [@ocaml.doc "The time the daemon deployment stopped.\n"]
  started_at : timestamp option; [@ocaml.doc "The time the daemon deployment started.\n"]
  created_at : timestamp option; [@ocaml.doc "The time the daemon deployment was created.\n"]
  target_daemon_revision_arn : string_ option;
      [@ocaml.doc "The ARN of the daemon revision being deployed.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the daemon deployment is in the current status.\n"]
  status : daemon_deployment_status option; [@ocaml.doc "The status of the daemon deployment.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster that hosts the daemon.\n"]
  daemon_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon.\n"]
  daemon_deployment_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon deployment.\n"]
}
[@@ocaml.doc "A summary of a daemon deployment.\n"]

type nonrec daemon_deployment_summary_list = daemon_deployment_summary list [@@ocaml.doc ""]

type nonrec list_daemon_deployments_response = {
  daemon_deployments : daemon_deployment_summary_list option;
      [@ocaml.doc "The list of daemon deployment summaries.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListDaemonDeployments] request. When the \
         results of a [ListDaemonDeployments] request exceed [maxResults], this value can be used \
         to retrieve the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_deployment_status_list = daemon_deployment_status list [@@ocaml.doc ""]

type nonrec list_daemon_deployments_request = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListDaemonDeployments] request indicating that \
         more results are available to fulfill the request and further calls will be needed. If \
         [maxResults] was provided, it's possible for the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of daemon deployment results that [ListDaemonDeployments] returned in \
         paginated output. When this parameter is used, [ListDaemonDeployments] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [ListDaemonDeployments] request with the returned [nextToken] value. This value can be \
         between 1 and 100. If this parameter isn't used, then [ListDaemonDeployments] returns up \
         to 20 results and a [nextToken] value if applicable.\n"]
  created_at : created_at option;
      [@ocaml.doc
        "An optional filter to narrow the [ListDaemonDeployments] results by creation time. If you \
         don't specify a time range, all deployments are returned.\n"]
  status : daemon_deployment_status_list option;
      [@ocaml.doc
        "An optional filter to narrow the [ListDaemonDeployments] results by deployment status. If \
         you don't specify a status, all deployments are returned.\n"]
  daemon_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon to list deployments for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_instances_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListContainerInstances] request. When the \
         results of a [ListContainerInstances] request exceed [maxResults], this value can be used \
         to retrieve the next page of results. This value is [null] when there are no more results \
         to return.\n"]
  container_instance_arns : string_list option;
      [@ocaml.doc
        "The list of container instances with full ARN entries for each container instance \
         associated with the specified cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_instances_request = {
  status : container_instance_status option;
      [@ocaml.doc
        "Filters the container instances by status. For example, if you specify the [DRAINING] \
         status, the results include only container instances that have been set to [DRAINING] \
         using \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateContainerInstancesState.html}UpdateContainerInstancesState}. \
         If you don't specify this parameter, the The default is to include container instances \
         set to all states other than [INACTIVE].\n"]
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of container instance results that [ListContainerInstances] returned \
         in paginated output. When this parameter is used, [ListContainerInstances] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [ListContainerInstances] request with the returned [nextToken] value. This value can be \
         between 1 and 100. If this parameter isn't used, then [ListContainerInstances] returns up \
         to 100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListContainerInstances] request indicating that \
         more results are available to fulfill the request and further calls are needed. If \
         [maxResults] was provided, it's possible the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  filter : string_ option;
      [@ocaml.doc
        "You can filter the results of a [ListContainerInstances] operation with cluster query \
         language statements. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster \
         Query Language} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container \
         instances to list. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_clusters_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListClusters] request. When the results of \
         a [ListClusters] request exceed [maxResults], this value can be used to retrieve the next \
         page of results. This value is [null] when there are no more results to return.\n"]
  cluster_arns : string_list option;
      [@ocaml.doc
        "The list of full Amazon Resource Name (ARN) entries for each cluster that's associated \
         with your account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_clusters_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of cluster results that [ListClusters] returned in paginated output. \
         When this parameter is used, [ListClusters] only returns [maxResults] results in a single \
         page along with a [nextToken] response element. The remaining results of the initial \
         request can be seen by sending another [ListClusters] request with the returned \
         [nextToken] value. This value can be between 1 and 100. If this parameter isn't used, \
         then [ListClusters] returns up to 100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListClusters] request indicating that more results \
         are available to fulfill the request and further calls are needed. If [maxResults] was \
         provided, it's possible the number of results to be fewer than [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec list_attributes_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListAttributes] request. When the results \
         of a [ListAttributes] request exceed [maxResults], this value can be used to retrieve the \
         next page of results. This value is [null] when there are no more results to return.\n"]
  attributes : attributes option;
      [@ocaml.doc "A list of attribute objects that meet the criteria of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_attributes_request = {
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of cluster results that [ListAttributes] returned in paginated output. \
         When this parameter is used, [ListAttributes] only returns [maxResults] results in a \
         single page along with a [nextToken] response element. The remaining results of the \
         initial request can be seen by sending another [ListAttributes] request with the returned \
         [nextToken] value. This value can be between 1 and 100. If this parameter isn't used, \
         then [ListAttributes] returns up to 100 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListAttributes] request indicating that more \
         results are available to fulfill the request and further calls are needed. If \
         [maxResults] was provided, it's possible the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  attribute_value : string_ option;
      [@ocaml.doc
        "The value of the attribute to filter results with. You must also specify an attribute \
         name to use this parameter.\n"]
  attribute_name : string_ option;
      [@ocaml.doc "The name of the attribute to filter the results with. \n"]
  target_type : target_type; [@ocaml.doc "The type of the target to list attributes with.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster to list attributes. If \
         you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_settings_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListAccountSettings] request. When the \
         results of a [ListAccountSettings] request exceed [maxResults], this value can be used to \
         retrieve the next page of results. This value is [null] when there are no more results to \
         return.\n"]
  settings : settings option; [@ocaml.doc "The account settings for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_settings_request = {
  max_results : integer option;
      [@ocaml.doc
        "The maximum number of account setting results returned by [ListAccountSettings] in \
         paginated output. When this parameter is used, [ListAccountSettings] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [ListAccountSettings] request with the returned [nextToken] value. This value can be \
         between 1 and 10. If this parameter isn't used, then [ListAccountSettings] returns up to \
         10 results and a [nextToken] value if applicable.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a [ListAccountSettings] request indicating that more \
         results are available to fulfill the request and further calls will be needed. If \
         [maxResults] was provided, it's possible the number of results to be fewer than \
         [maxResults].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  effective_settings : boolean_ option;
      [@ocaml.doc
        "Determines whether to return the effective settings. If [true], the account settings for \
         the root user or the default setting for the [principalArn] are returned. If [false], the \
         account settings for the [principalArn] are returned if they're set. Otherwise, no \
         account settings are returned.\n"]
  principal_arn : string_ option;
      [@ocaml.doc
        "The ARN of the principal, which can be a user, role, or the root user. If this field is \
         omitted, the account settings are listed only for the authenticated user.\n\n\
        \ In order to use this parameter, you must be the root user, or the principal.\n\
        \ \n\
        \   Federated users assume the account setting of the root user and can't have explicit \
         account settings set for them.\n\
        \   \n\
        \    "]
  value : string_ option;
      [@ocaml.doc
        "The value of the account settings to filter results with. You must also specify an \
         account setting name to use this parameter.\n"]
  name : setting_name option;
      [@ocaml.doc "The name of the account setting you want to list the settings for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_task_protection_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  protected_tasks : protected_tasks option;
      [@ocaml.doc
        "A list of tasks with the following information.\n\n\
        \ {ul\n\
        \       {-   [taskArn]: The task ARN.\n\
        \           \n\
        \            }\n\
        \       {-   [protectionEnabled]: The protection status of the task. If scale-in \
         protection is turned on for a task, the value is [true]. Otherwise, it is [false].\n\
        \           \n\
        \            }\n\
        \       {-   [expirationDate]: The epoch time when protection for the task will expire.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_task_protection_request = {
  tasks : string_list option; [@ocaml.doc "A list of up to 100 task IDs or full ARN entries.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         that the task sets exist in.\n"]
}
[@@ocaml.doc ""]

type nonrec express_gateway_service_include = TAGS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec express_gateway_service_include_list = express_gateway_service_include list
[@@ocaml.doc ""]

type nonrec express_gateway_service_configurations = express_gateway_service_configuration list
[@@ocaml.doc ""]

type nonrec execute_command_response = {
  task_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the task.\n"]
  session : session option;
      [@ocaml.doc
        "The details of the SSM session that was created for this instance of execute-command.\n"]
  interactive : boolean_ option;
      [@ocaml.doc
        "Determines whether the execute command session is running in interactive mode. Amazon ECS \
         only supports initiating interactive sessions, so you must specify [true] for this value.\n"]
  container_name : string_ option; [@ocaml.doc "The name of the container.\n"]
  container_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the container.\n"]
  cluster_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_command_request = {
  task : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) or ID of the task the container is part of.\n"]
  interactive : boolean_; [@ocaml.doc "Use this flag to run your command in interactive mode.\n"]
  command : string_; [@ocaml.doc "The command to run on the container.\n"]
  container : string_ option;
      [@ocaml.doc
        "The name of the container to execute the command on. A container name only needs to be \
         specified for tasks containing multiple containers.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) or short name of the cluster the task is running in. If \
         you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec ecs_express_gateway_service = {
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for when the Express service was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for when the Express service was created.\n"]
  tags : tags option; [@ocaml.doc "The metadata applied to the Express service.\n"]
  active_configurations : express_gateway_service_configurations option;
      [@ocaml.doc "The list of active service configurations for the Express service.\n"]
  current_deployment : string_ option;
      [@ocaml.doc "The current deployment configuration for the Express service.\n"]
  status : express_gateway_service_status option;
      [@ocaml.doc "The current status of the Express service.\n"]
  infrastructure_role_arn : string_ option;
      [@ocaml.doc
        "The ARN of the infrastructure role that manages Amazon Web Services resources for the \
         Express service.\n"]
  service_arn : string_ option; [@ocaml.doc "The ARN that identifies the Express service.\n"]
  service_name : string_ option; [@ocaml.doc "The name of the Express service.\n"]
  cluster : string_ option;
      [@ocaml.doc "The short name or full ARN of the cluster that hosts the Express service.\n"]
}
[@@ocaml.doc
  "Represents an Express service, which provides a simplified way to deploy containerized web \
   applications on Amazon ECS with managed Amazon Web Services infrastructure. An Express service \
   automatically provisions and manages Application Load Balancers, target groups, security \
   groups, and auto-scaling policies.\n\n\
  \ Express services use a service revision architecture where each service can have multiple \
   active configurations, enabling blue-green deployments and gradual rollouts. The service \
   maintains a list of active configurations and manages the lifecycle of the underlying Amazon \
   Web Services resources.\n\
  \ "]

type nonrec discover_poll_endpoint_response = {
  service_connect_endpoint : string_ option;
      [@ocaml.doc
        "The endpoint for the Amazon ECS agent to poll for Service Connect configuration. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  telemetry_endpoint : string_ option;
      [@ocaml.doc "The telemetry endpoint for the Amazon ECS agent.\n"]
  endpoint : string_ option; [@ocaml.doc "The endpoint for the Amazon ECS agent to poll.\n"]
}
[@@ocaml.doc ""]

type nonrec discover_poll_endpoint_request = {
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that the container \
         instance belongs to.\n"]
  container_instance : string_ option;
      [@ocaml.doc
        "The container instance ID or full ARN of the container instance. For more information \
         about the ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids}Amazon \
         Resource Name (ARN)} in the {i Amazon ECS Developer Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tasks_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  tasks : tasks option; [@ocaml.doc "The list of tasks.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tasks_request = {
  include_ : task_field_list option;
      [@ocaml.doc
        "Specifies whether you want to see the resource tags for the task. If [TAGS] is specified, \
         the tags are included in the response. If this field is omitted, tags aren't included in \
         the response.\n"]
  tasks : string_list; [@ocaml.doc "A list of up to 100 task IDs or full ARN entries.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task or \
         tasks to describe. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_task_sets_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  task_sets : task_sets option; [@ocaml.doc "The list of task sets described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_task_sets_request = {
  include_ : task_set_field_list option;
      [@ocaml.doc
        "Specifies whether to see the resource tags for the task set. If [TAGS] is specified, the \
         tags are included in the response. If this field is omitted, tags aren't included in the \
         response.\n"]
  task_sets : string_list option;
      [@ocaml.doc "The ID or full Amazon Resource Name (ARN) of task sets to describe.\n"]
  service : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the service that the task sets exist \
         in.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         that the task sets exist in.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_task_definition_response = {
  tags : tags option;
      [@ocaml.doc
        "The metadata that's applied to the task definition to help you categorize and organize \
         them. Each tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  task_definition : task_definition option; [@ocaml.doc "The full task definition description.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_task_definition_request = {
  include_ : task_definition_field_list option;
      [@ocaml.doc
        "Determines whether to see the resource tags for the task definition. If [TAGS] is \
         specified, the tags are included in the response. If this field is omitted, tags aren't \
         included in the response.\n"]
  task_definition : string_;
      [@ocaml.doc
        "The [family] for the latest [ACTIVE] revision, [family] and [revision] \
         ([family:revision]) for a specific revision in the family, or full Amazon Resource Name \
         (ARN) of the task definition to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_services_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  services : services option; [@ocaml.doc "The list of services described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_services_request = {
  include_ : service_field_list option;
      [@ocaml.doc
        "Determines whether you want to see the resource tags for the service. If [TAGS] is \
         specified, the tags are included in the response. If this field is omitted, tags aren't \
         included in the response.\n"]
  services : string_list;
      [@ocaml.doc
        "A list of services to describe. You may specify up to 10 services to describe in a single \
         operation.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN)the cluster that hosts the service to \
         describe. If you do not specify a cluster, the default cluster is assumed. This parameter \
         is required if the service or services you are describing were launched in any cluster \
         other than the default cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_revisions_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  service_revisions : service_revisions option;
      [@ocaml.doc "The list of service revisions described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_revisions_request = {
  service_revision_arns : string_list;
      [@ocaml.doc
        "The ARN of the service revision. \n\n\
        \ You can specify a maximum of 20 ARNs.\n\
        \ \n\
        \  You can call \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListServiceDeployments.html}ListServiceDeployments} \
         to get the ARNs.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_service_deployments_response = {
  failures : failures option;
      [@ocaml.doc
        "Any failures associated with the call.\n\n\
        \ If you decsribe a deployment with a service revision created before October 25, 2024, \
         the call fails. The failure includes the service revision ARN and the reason set to \
         [MISSING].\n\
        \ "]
  service_deployments : service_deployments option;
      [@ocaml.doc "The list of service deployments described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_deployments_request = {
  service_deployment_arns : string_list;
      [@ocaml.doc "The ARN of the service deployment.\n\n You can specify a maximum of 20 ARNs.\n "]
}
[@@ocaml.doc ""]

type nonrec describe_express_gateway_service_response = {
  service : ecs_express_gateway_service option;
      [@ocaml.doc "The full description of the described express service.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_express_gateway_service_request = {
  include_ : express_gateway_service_include_list option;
      [@ocaml.doc
        "Specifies additional information to include in the response. Valid values are [TAGS] to \
         include resource tags associated with the Express service.\n"]
  service_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Express service to describe. The ARN uniquely \
         identifies the service within your Amazon Web Services account and region.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_task_definition = {
  ipc_mode : daemon_ipc_mode option;
      [@ocaml.doc
        "The IPC namespace mode for the daemon. The valid values are [none] and [shared]. The \
         default is [none].\n\n\
        \ If [none] is specified or no value is provided, the daemon runs with its own IPC \
         namespace, isolated from other tasks. If [shared] is specified, the daemon joins the host \
         IPC namespace, making it accessible to non-daemon tasks that use [ipcMode: \"host\"] or \
         other daemons that use [ipcMode: \"shared\"].\n\
        \ "]
  pid_mode : daemon_pid_mode option;
      [@ocaml.doc
        "The PID namespace mode for the daemon. The valid values are [none] and [shared]. The \
         default is [none].\n\n\
        \ If [none] is specified or no value is provided, the daemon runs with its own PID \
         namespace, isolated from other tasks. If [shared] is specified, the daemon joins the host \
         PID namespace, making it accessible to non-daemon tasks that use [pidMode: \"host\"] or \
         other daemons that use [pidMode: \"shared\"].\n\
        \ "]
  registered_by : string_ option;
      [@ocaml.doc "The principal that registered the daemon task definition.\n"]
  delete_requested_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the daemon task definition delete was requested.\n"]
  registered_at : timestamp option;
      [@ocaml.doc
        "The Unix timestamp for the time when the daemon task definition was registered.\n"]
  status : daemon_task_definition_status option;
      [@ocaml.doc
        "The status of the daemon task definition. The valid values are [ACTIVE], \
         [DELETE_IN_PROGRESS], and [DELETED].\n"]
  memory : string_ option; [@ocaml.doc "The amount of memory (in MiB) used by the daemon task.\n"]
  cpu : string_ option; [@ocaml.doc "The number of CPU units used by the daemon task.\n"]
  volumes : daemon_volume_list option;
      [@ocaml.doc "The list of data volume definitions for the daemon task.\n"]
  container_definitions : daemon_container_definition_list option;
      [@ocaml.doc
        "A list of container definitions in JSON format that describe the containers that make up \
         the daemon task.\n"]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS \
         container agent permission to make Amazon Web Services API calls on your behalf.\n"]
  task_role_arn : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the IAM role that grants containers \
         in the daemon task permission to call Amazon Web Services APIs on your behalf.\n"]
  revision : integer option;
      [@ocaml.doc
        "The revision of the daemon task in a particular family. The revision is a version number \
         of a daemon task definition in a family. When you register a daemon task definition for \
         the first time, the revision is [1]. Each time that you register a new revision of a \
         daemon task definition in the same family, the revision value always increases by one.\n"]
  family : string_ option;
      [@ocaml.doc "The name of a family that this daemon task definition is registered to.\n"]
  daemon_task_definition_arn : string_ option;
      [@ocaml.doc "The full Amazon Resource Name (ARN) of the daemon task definition.\n"]
}
[@@ocaml.doc
  "The details of a daemon task definition. A daemon task definition is a template that describes \
   the containers that form a daemon. Daemons deploy cross-cutting software agents independently \
   across your Amazon ECS infrastructure.\n"]

type nonrec describe_daemon_task_definition_response = {
  daemon_task_definition : daemon_task_definition option;
      [@ocaml.doc "The full daemon task definition description.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_daemon_task_definition_request = {
  daemon_task_definition : string_;
      [@ocaml.doc
        "The [family] for the latest [ACTIVE] revision, [family] and [revision] \
         ([family:revision]) for a specific revision in the family, or full Amazon Resource Name \
         (ARN) of the daemon task definition to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_container_image = {
  image : string_ option; [@ocaml.doc "The container image.\n"]
  image_digest : string_ option; [@ocaml.doc "The container image digest.\n"]
  container_name : string_ option; [@ocaml.doc "The name of the container.\n"]
}
[@@ocaml.doc "The details about the container image a daemon revision uses.\n"]

type nonrec daemon_container_images = daemon_container_image list [@@ocaml.doc ""]

type nonrec daemon_revision = {
  enable_execute_command : boxed_boolean option;
      [@ocaml.doc
        "Specifies whether the execute command functionality is turned on for the daemon tasks.\n"]
  enable_ecs_managed_tags : boxed_boolean option;
      [@ocaml.doc "Specifies whether Amazon ECS managed tags are turned on for the daemon tasks.\n"]
  propagate_tags : daemon_propagate_tags option;
      [@ocaml.doc "Specifies whether tags are propagated from the daemon to the daemon tasks.\n"]
  container_images : daemon_container_images option;
      [@ocaml.doc "The container images used by the daemon revision.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon revision was created.\n"]
  daemon_task_definition_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the daemon task definition used by this revision.\n"]
  daemon_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon for this revision.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster that hosts the daemon.\n"]
  daemon_revision_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon revision.\n"]
}
[@@ocaml.doc
  "Information about a daemon revision. A daemon revision is a snapshot of the daemon's \
   configuration at the time a deployment was initiated.\n"]

type nonrec daemon_revisions = daemon_revision list [@@ocaml.doc ""]

type nonrec describe_daemon_revisions_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  daemon_revisions : daemon_revisions option; [@ocaml.doc "The list of daemon revisions.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_daemon_revisions_request = {
  daemon_revision_arns : string_list;
      [@ocaml.doc "The ARN of the daemon revisions to describe. You can specify up to 20 ARNs.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_capacity_provider = {
  running_count : integer option;
      [@ocaml.doc "The number of daemon tasks running on this capacity provider.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the capacity provider.\n"]
}
[@@ocaml.doc "Information about a capacity provider associated with a daemon revision.\n"]

type nonrec daemon_capacity_provider_list = daemon_capacity_provider list [@@ocaml.doc ""]

type nonrec daemon_revision_detail = {
  total_running_count : integer option;
      [@ocaml.doc "The total number of daemon tasks running for this revision.\n"]
  capacity_providers : daemon_capacity_provider_list option;
      [@ocaml.doc "The capacity providers associated with this daemon revision.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon revision.\n"]
}
[@@ocaml.doc
  "Details about a daemon revision, including the running task counts per capacity provider.\n"]

type nonrec daemon_revision_detail_list = daemon_revision_detail list [@@ocaml.doc ""]

type nonrec daemon_detail = {
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was created.\n"]
  deployment_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the most recent daemon deployment.\n"]
  current_revisions : daemon_revision_detail_list option;
      [@ocaml.doc
        "The current daemon revision details, including the running task counts per capacity \
         provider.\n"]
  status : daemon_status option; [@ocaml.doc "The status of the daemon.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster that the daemon is running in.\n"]
  daemon_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon.\n"]
}
[@@ocaml.doc "The detailed information about a daemon.\n"]

type nonrec describe_daemon_response = {
  daemon : daemon_detail option;
      [@ocaml.doc
        "The full description of the daemon, including the current revisions, deployment ARN, \
         cluster, and status information.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_daemon_request = {
  daemon_arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_deployment_capacity_provider = {
  draining_instance_count : boxed_integer option;
      [@ocaml.doc
        "The number of instances being drained on this capacity provider during the deployment.\n"]
  running_instance_count : boxed_integer option;
      [@ocaml.doc "The number of instances running daemon tasks on this capacity provider.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the capacity provider.\n"]
}
[@@ocaml.doc "Information about a capacity provider during a daemon deployment.\n"]

type nonrec daemon_deployment_capacity_provider_list = daemon_deployment_capacity_provider list
[@@ocaml.doc ""]

type nonrec daemon_deployment_revision_detail = {
  total_draining_instance_count : boxed_integer option;
      [@ocaml.doc
        "The total number of instances being drained for this revision during the deployment.\n"]
  total_running_instance_count : boxed_integer option;
      [@ocaml.doc "The total number of instances running daemon tasks for this revision.\n"]
  capacity_providers : daemon_deployment_capacity_provider_list option;
      [@ocaml.doc
        "The capacity providers associated with this daemon revision during the deployment.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon revision.\n"]
}
[@@ocaml.doc
  "Details about a daemon revision during a deployment, including running and draining instance \
   counts per capacity provider.\n"]

type nonrec daemon_deployment_revision_detail_list = daemon_deployment_revision_detail list
[@@ocaml.doc ""]

type nonrec daemon_deployment_rollback_monitors_status =
  | DISABLED [@ocaml.doc ""]
  | MONITORING_COMPLETE [@ocaml.doc ""]
  | MONITORING [@ocaml.doc ""]
  | TRIGGERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec daemon_circuit_breaker = {
  threshold : integer option;
      [@ocaml.doc "The threshold which determines that the daemon deployment failed.\n"]
  status : daemon_deployment_rollback_monitors_status option;
      [@ocaml.doc
        "The circuit breaker status. Amazon ECS is not using the circuit breaker for daemon \
         deployment failures when the status is [DISABLED].\n"]
  failure_count : integer option;
      [@ocaml.doc "The number of times the circuit breaker detected a daemon deployment failure.\n"]
}
[@@ocaml.doc
  "Information about the circuit breaker used to determine when a daemon deployment has failed.\n"]

type nonrec daemon_deployment_alarms = {
  triggered_alarm_names : string_list option;
      [@ocaml.doc
        "One or more CloudWatch alarm names that have been triggered during the daemon deployment.\n"]
  alarm_names : string_list option;
      [@ocaml.doc
        "The name of the CloudWatch alarms that determine when a daemon deployment failed.\n"]
  status : daemon_deployment_rollback_monitors_status option;
      [@ocaml.doc
        "The status of the alarms check. Amazon ECS is not using alarms for daemon deployment \
         failures when the status is [DISABLED].\n"]
}
[@@ocaml.doc "The CloudWatch alarms used to determine a daemon deployment failed.\n"]

type nonrec daemon_rollback = {
  rollback_capacity_providers : string_list option;
      [@ocaml.doc "The capacity providers involved in the rollback.\n"]
  rollback_target_daemon_revision_arn : string_ option;
      [@ocaml.doc "The ARN of the daemon revision deployed as part of the rollback.\n"]
  started_at : timestamp option;
      [@ocaml.doc "The time that the rollback started. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  reason : string_ option;
      [@ocaml.doc
        "The reason the rollback happened. For example, the circuit breaker initiated the rollback \
         operation.\n"]
}
[@@ocaml.doc "Information about a daemon deployment rollback.\n"]

type nonrec daemon_deployment = {
  finished_at : timestamp option;
      [@ocaml.doc
        "The time the daemon deployment finished. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  stopped_at : timestamp option;
      [@ocaml.doc
        "The time the daemon deployment stopped. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  started_at : timestamp option;
      [@ocaml.doc
        "The time the daemon deployment started. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "The time the daemon deployment was created. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.\n"]
  deployment_configuration : daemon_deployment_configuration option;
      [@ocaml.doc "The deployment configuration used for this daemon deployment.\n"]
  rollback : daemon_rollback option;
      [@ocaml.doc "The rollback options for the daemon deployment.\n"]
  alarms : daemon_deployment_alarms option;
      [@ocaml.doc "The CloudWatch alarms that determine when a daemon deployment fails.\n"]
  circuit_breaker : daemon_circuit_breaker option;
      [@ocaml.doc
        "The circuit breaker configuration that determines when a daemon deployment has failed.\n"]
  source_daemon_revisions : daemon_deployment_revision_detail_list option;
      [@ocaml.doc "The currently deployed daemon revisions that are being replaced.\n"]
  target_daemon_revision : daemon_deployment_revision_detail option;
      [@ocaml.doc "The daemon revision being deployed.\n"]
  status_reason : string_ option;
      [@ocaml.doc "Information about why the daemon deployment is in the current status.\n"]
  status : daemon_deployment_status option; [@ocaml.doc "The status of the daemon deployment.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster that hosts the daemon.\n"]
  daemon_deployment_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon deployment.\n"]
}
[@@ocaml.doc
  "Information about a daemon deployment. A daemon deployment orchestrates the progressive rollout \
   of daemon task updates across container instances.\n"]

type nonrec daemon_deployment_list = daemon_deployment list [@@ocaml.doc ""]

type nonrec describe_daemon_deployments_response = {
  daemon_deployments : daemon_deployment_list option;
      [@ocaml.doc "The list of daemon deployments.\n"]
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_daemon_deployments_request = {
  daemon_deployment_arns : string_list;
      [@ocaml.doc "The ARN of the daemon deployments to describe. You can specify up to 20 ARNs.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_instances_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  container_instances : container_instances option; [@ocaml.doc "The list of container instances.\n"]
}
[@@ocaml.doc ""]

type nonrec container_instance_field =
  | CONTAINER_INSTANCE_HEALTH [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_instance_field_list = container_instance_field list [@@ocaml.doc ""]

type nonrec describe_container_instances_request = {
  include_ : container_instance_field_list option;
      [@ocaml.doc
        "Specifies whether you want to see the resource tags for the container instance. If [TAGS] \
         is specified, the tags are included in the response. If [CONTAINER_INSTANCE_HEALTH] is \
         specified, the container instance health is included in the response. If this field is \
         omitted, tags and container instance health status aren't included in the response.\n"]
  container_instances : string_list;
      [@ocaml.doc
        "A list of up to 100 container instance IDs or full Amazon Resource Name (ARN) entries.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container \
         instances to describe. If you do not specify a cluster, the default cluster is assumed. \
         This parameter is required if the container instance or container instances you are \
         describing were launched in any cluster other than the default cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec clusters = cluster list [@@ocaml.doc ""]

type nonrec describe_clusters_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  clusters : clusters option; [@ocaml.doc "The list of clusters.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_field =
  | TAGS [@ocaml.doc ""]
  | STATISTICS [@ocaml.doc ""]
  | SETTINGS [@ocaml.doc ""]
  | CONFIGURATIONS [@ocaml.doc ""]
  | ATTACHMENTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_field_list = cluster_field list [@@ocaml.doc ""]

type nonrec describe_clusters_request = {
  include_ : cluster_field_list option;
      [@ocaml.doc
        "Determines whether to include additional information about the clusters in the response. \
         If this field is omitted, this information isn't included.\n\n\
        \ If [ATTACHMENTS] is specified, the attachments for the container instances or tasks \
         within the cluster are included, for example the capacity providers.\n\
        \ \n\
        \  If [SETTINGS] is specified, the settings for the cluster are included.\n\
        \  \n\
        \   If [CONFIGURATIONS] is specified, the configuration for the cluster is included.\n\
        \   \n\
        \    If [STATISTICS] is specified, the task and service count is included, separated by \
         launch type.\n\
        \    \n\
        \     If [TAGS] is specified, the metadata tags associated with the cluster are included.\n\
        \     "]
  clusters : string_list option;
      [@ocaml.doc
        "A list of up to 100 cluster names or full cluster Amazon Resource Name (ARN) entries. If \
         you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec capacity_providers = capacity_provider list [@@ocaml.doc ""]

type nonrec describe_capacity_providers_response = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeCapacityProviders] request. When \
         the results of a [DescribeCapacityProviders] request exceed [maxResults], this value can \
         be used to retrieve the next page of results. This value is [null] when there are no more \
         results to return.\n"]
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  capacity_providers : capacity_providers option; [@ocaml.doc "The list of capacity providers.\n"]
}
[@@ocaml.doc ""]

type nonrec capacity_provider_field = TAGS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec capacity_provider_field_list = capacity_provider_field list [@@ocaml.doc ""]

type nonrec describe_capacity_providers_request = {
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [DescribeCapacityProviders] \
         request where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value.\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  max_results : boxed_integer option;
      [@ocaml.doc
        "The maximum number of account setting results returned by [DescribeCapacityProviders] in \
         paginated output. When this parameter is used, [DescribeCapacityProviders] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [DescribeCapacityProviders] request with the returned [nextToken] value. This value can \
         be between 1 and 10. If this parameter is not used, then [DescribeCapacityProviders] \
         returns up to 10 results and a [nextToken] value if applicable.\n"]
  include_ : capacity_provider_field_list option;
      [@ocaml.doc
        "Specifies whether or not you want to see the resource tags for the capacity provider. If \
         [TAGS] is specified, the tags are included in the response. If this field is omitted, \
         tags aren't included in the response.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The name of the cluster to describe capacity providers for. When specified, only capacity \
         providers associated with this cluster are returned, including Amazon ECS Managed \
         Instances capacity providers.\n"]
  capacity_providers : string_list option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of one or more capacity providers. Up \
         to [100] capacity providers can be described in an action.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_task_definition_response = {
  task_definition : task_definition option;
      [@ocaml.doc "The full description of the deregistered task.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_task_definition_request = {
  task_definition : string_;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full Amazon Resource Name (ARN) of the \
         task definition to deregister. You must specify a [revision].\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_container_instance_response = {
  container_instance : container_instance option;
      [@ocaml.doc "The container instance that was deregistered.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_container_instance_request = {
  force : boxed_boolean option;
      [@ocaml.doc
        "Forces the container instance to be deregistered. If you have tasks running on the \
         container instance when you deregister it with the [force] option, these tasks remain \
         running until you terminate the instance or the tasks stop through some other means, but \
         they're orphaned (no longer monitored or accounted for by Amazon ECS). If an orphaned \
         task on your container instance is part of an Amazon ECS service, then the service \
         scheduler starts another copy of that task, on a different container instance if \
         possible. \n\n\
        \ Any containers in orphaned service tasks that are registered with a Classic Load \
         Balancer or an Application Load Balancer target group are deregistered. They begin \
         connection draining according to the settings on the load balancer or target group.\n\
        \ "]
  container_instance : string_;
      [@ocaml.doc
        "The container instance ID or full ARN of the container instance to deregister. For more \
         information about the ARN format, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids}Amazon \
         Resource Name (ARN)} in the {i Amazon ECS Developer Guide}.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container \
         instance to deregister. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_task_set_response = {
  task_set : task_set option; [@ocaml.doc "Details about the task set.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_task_set_request = {
  force : boxed_boolean option;
      [@ocaml.doc
        "If [true], you can delete a task set even if it hasn't been scaled down to zero.\n"]
  task_set : string_;
      [@ocaml.doc "The task set ID or full Amazon Resource Name (ARN) of the task set to delete.\n"]
  service : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the service that hosts the task set \
         to delete.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         that the task set found in to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_task_definitions_response = {
  failures : failures option; [@ocaml.doc "Any failures associated with the call.\n"]
  task_definitions : task_definition_list option;
      [@ocaml.doc "The list of deleted task definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_task_definitions_request = {
  task_definitions : string_list;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full Amazon Resource Name (ARN) of the \
         task definition to delete. You must specify a [revision].\n\n\
        \ You can specify up to 10 task definitions as a comma separated list.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_service_response = {
  service : service option; [@ocaml.doc "The full description of the deleted service.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_service_request = {
  force : boxed_boolean option;
      [@ocaml.doc
        "If [true], allows you to delete a service even if it wasn't scaled down to zero tasks. \
         It's only necessary to use this if the service uses the [REPLICA] scheduling strategy.\n"]
  service : string_; [@ocaml.doc "The name of the service to delete.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         to delete. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_express_gateway_service_response = {
  service : ecs_express_gateway_service option;
      [@ocaml.doc "The full description of the deleted express service.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_express_gateway_service_request = {
  service_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Express service to delete. The ARN uniquely \
         identifies the service within your Amazon Web Services account and region.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_daemon_task_definition_response = {
  daemon_task_definition_arn : string_ option;
      [@ocaml.doc "The full Amazon Resource Name (ARN) of the deleted daemon task definition.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_daemon_task_definition_request = {
  daemon_task_definition : string_;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full Amazon Resource Name (ARN) of the \
         daemon task definition to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_daemon_response = {
  deployment_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the daemon deployment that was triggered by the delete \
         operation. This deployment drains existing daemon tasks from the container instances.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was created.\n"]
  status : daemon_status option;
      [@ocaml.doc
        "The status of the daemon. After you call [DeleteDaemon], the status changes to \
         [DELETE_IN_PROGRESS].\n"]
  daemon_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_daemon_request = {
  daemon_arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The full description of the deleted cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_request = {
  cluster : string_;
      [@ocaml.doc "The short name or full Amazon Resource Name (ARN) of the cluster to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_contains_tasks_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc "You can't delete a cluster that has active tasks.\n"]

type nonrec cluster_contains_services_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "You can't delete a cluster that contains services. First, update the service to reduce its \
   desired task count to 0, and then delete the service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService} \
   and \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeleteService.html}DeleteService}.\n"]

type nonrec cluster_contains_container_instances_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "You can't delete a cluster that has registered container instances. First, deregister the \
   container instances before you can delete the cluster. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeregisterContainerInstance.html}DeregisterContainerInstance}.\n"]

type nonrec cluster_contains_capacity_provider_exception = {
  message : string_ option; [@ocaml.doc " Message that describes the cause of the exception.\n"]
}
[@@ocaml.doc
  "The cluster contains one or more capacity providers that prevent the requested operation. This \
   exception occurs when you try to delete a cluster that still has active capacity providers, \
   including Amazon ECS Managed Instances capacity providers. You must first delete all capacity \
   providers from the cluster before you can delete the cluster itself.\n"]

type nonrec delete_capacity_provider_response = {
  capacity_provider : capacity_provider option;
      [@ocaml.doc "The details of the capacity provider.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_capacity_provider_request = {
  cluster : string_ option;
      [@ocaml.doc
        "The name of the cluster that contains the capacity provider to delete. Managed instances \
         capacity providers are cluster-scoped and can only be deleted from their associated \
         cluster.\n"]
  capacity_provider : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the capacity provider to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_attributes_response = {
  attributes : attributes option;
      [@ocaml.doc
        "A list of attribute objects that were successfully deleted from your resource.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_attributes_request = {
  attributes : attributes;
      [@ocaml.doc
        "The attributes to delete from your resource. You can specify up to 10 attributes for each \
         request. For custom attributes, specify the attribute name and target ID, but don't \
         specify the value. If you specify the target ID using the short form, you must also \
         specify the target type.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that contains the \
         resource to delete attributes. If you do not specify a cluster, the default cluster is \
         assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_setting_response = {
  setting : setting option; [@ocaml.doc "The account setting for the specified principal ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_setting_request = {
  principal_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the principal. It can be a user, role, or the root \
         user. If you specify the root user, it disables the account setting for all users, roles, \
         and the root user of the account unless a user or role explicitly overrides these \
         settings. If this field is omitted, the setting is changed only for the authenticated \
         user.\n\n\
        \ In order to use this parameter, you must be the root user, or the principal.\n\
        \ "]
  name : setting_name;
      [@ocaml.doc
        "The resource name to disable the account setting for. If [serviceLongArnFormat] is \
         specified, the ARN for your Amazon ECS services is affected. If [taskLongArnFormat] is \
         specified, the ARN and resource ID for your Amazon ECS tasks is affected. If \
         [containerInstanceLongArnFormat] is specified, the ARN and resource ID for your Amazon \
         ECS container instances is affected. If [awsvpcTrunking] is specified, the ENI limit for \
         your Amazon ECS container instances is affected.\n"]
}
[@@ocaml.doc ""]

type nonrec daemon_task_definition_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec daemon_revision_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec daemon_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec daemon_deployment_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec create_task_set_response = {
  task_set : task_set option;
      [@ocaml.doc
        "Information about a set of Amazon ECS tasks in either an CodeDeploy or an [EXTERNAL] \
         deployment. A task set includes details such as the desired number of tasks, how many \
         tasks are running, and whether the task set serves production traffic.\n"]
}
[@@ocaml.doc ""]

type nonrec create_task_set_request = {
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the task set to help you categorize and organize them. \
         Each tag consists of a key and an optional value. You define both. When a service is \
         deleted, the tags are deleted.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  client_token : string_ option;
      [@ocaml.doc
        "An identifier that you provide to ensure the idempotency of the request. It must be \
         unique and is case sensitive. Up to 36 ASCII characters in the range of 33-126 \
         (inclusive) are allowed.\n"]
  scale : scale option;
      [@ocaml.doc
        "A floating-point percentage of the desired number of tasks to place and keep running in \
         the task set.\n"]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version that the tasks in the task set uses. A platform version is specified \
         only for tasks using the Fargate launch type. If one isn't specified, the [LATEST] \
         platform version is used.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The capacity provider strategy to use for the task set.\n\n\
        \ A capacity provider strategy consists of one or more capacity providers along with the \
         [base] and [weight] to assign to them. A capacity provider must be associated with the \
         cluster to be used in a capacity provider strategy. The \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
         API is used to associate a capacity provider with a cluster. Only capacity providers with \
         an [ACTIVE] or [UPDATING] status can be used.\n\
        \ \n\
        \  If a [capacityProviderStrategy] is specified, the [launchType] parameter must be \
         omitted. If no [capacityProviderStrategy] or [launchType] is specified, the \
         [defaultCapacityProviderStrategy] for the cluster is used.\n\
        \  \n\
        \   If specifying a capacity provider that uses an Auto Scaling group, the capacity \
         provider must already be created. New capacity providers can be created with the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCapacityProviderProvider.html}CreateCapacityProviderProvider}API \
         operation.\n\
        \   \n\
        \    To use a Fargate capacity provider, specify either the [FARGATE] or [FARGATE_SPOT] \
         capacity providers. The Fargate capacity providers are available to all accounts and only \
         need to be associated with a cluster to be used.\n\
        \    \n\
        \     The \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
         API operation is used to update the list of available capacity providers for a cluster \
         after the cluster is created.\n\
        \     "]
  launch_type : launch_type option;
      [@ocaml.doc
        "The launch type that new tasks in the task set uses. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \ If a [launchType] is specified, the [capacityProviderStrategy] parameter must be omitted.\n\
        \ "]
  service_registries : service_registries option;
      [@ocaml.doc
        "The details of the service discovery registries to assign to this task set. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html}Service \
         discovery}.\n"]
  load_balancers : load_balancers option;
      [@ocaml.doc
        "A load balancer object representing the load balancer to use with the task set. The \
         supported load balancer types are either an Application Load Balancer or a Network Load \
         Balancer.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc "An object representing the network configuration for a task set.\n"]
  task_definition : string_;
      [@ocaml.doc
        "The task definition for the tasks in the task set to use. If a revision isn't specified, \
         the latest [ACTIVE] revision is used.\n"]
  external_id : string_ option;
      [@ocaml.doc
        "An optional non-unique tag that identifies this task set in external systems. If the task \
         set is associated with a service discovery registry, the tasks in this task set will have \
         the [ECS_TASK_SET_EXTERNAL_ID] Cloud Map attribute set to the provided value.\n"]
  cluster : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service \
         to create the task set in.\n"]
  service : string_;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the service to create the task set in.\n"]
}
[@@ocaml.doc ""]

type nonrec create_service_response = {
  service : service option;
      [@ocaml.doc
        "The full description of your service following the create call.\n\n\
        \ A service will return either a [capacityProviderStrategy] or [launchType] parameter, but \
         not both, depending where one was specified when it was created.\n\
        \ \n\
        \  If a service is using the [ECS] deployment controller, the [deploymentController] and \
         [taskSets] parameters will not be returned.\n\
        \  \n\
        \   if the service uses the [CODE_DEPLOY] deployment controller, the \
         [deploymentController], [taskSets] and [deployments] parameters will be returned, however \
         the [deployments] parameter will be an empty list.\n\
        \   \n\
        \    The response includes a [lifecycleHookDetails] field, which is an empty array when \
         the service is created or updated. The values are populated when a lifecycle hook \
         executes and are available as part of the service deployment details \
         ({{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServiceDeployments.html}DescribeServiceDeployments}).\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec create_service_request = {
  monitoring : monitoring_configuration option;
      [@ocaml.doc
        "The optional monitoring configuration for the service, which defines the resolution for \
         the service-level [CPUUtilization] and [MemoryUtilization] Amazon CloudWatch metrics. \
         When not specified, Amazon ECS uses the default resolution of [60] seconds.\n"]
  vpc_lattice_configurations : vpc_lattice_configurations option;
      [@ocaml.doc "The VPC Lattice configuration for the service being created.\n"]
  volume_configurations : service_volume_configurations option;
      [@ocaml.doc
        "The configuration for a volume specified in the task definition as a volume that is \
         configured at launch time. Currently, the only supported volume type is an Amazon EBS \
         volume.\n"]
  service_connect_configuration : service_connect_configuration option;
      [@ocaml.doc
        "The configuration for this service to discover and connect to services, and be discovered \
         by, and connected from, other services within a namespace.\n\n\
        \ Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Determines whether the execute command functionality is turned on for the service. If \
         [true], this enables execute command functionality on all containers in the service tasks.\n"]
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Specifies whether to propagate the tags from the task definition to the task. If no value \
         is specified, the tags aren't propagated. Tags can only be propagated to the task during \
         task creation. To add tags to a task after task creation, use the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TagResource.html}TagResource} \
         API action.\n\n\
        \ You must set this to a value other than [NONE] when you use Cost Explorer. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/usage-reports.html}Amazon \
         ECS usage reports} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ \n\
        \  The default is [NONE].\n\
        \  "]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Specifies whether to turn on Amazon ECS managed tags for the tasks within the service. \
         For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         your Amazon ECS resources} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \ When you use Amazon ECS managed tags, you must set the [propagateTags] request parameter.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the service to help you categorize and organize them. Each \
         tag consists of a key and an optional value, both of which you define. When a service is \
         deleted, the tags are deleted as well.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  deployment_controller : deployment_controller option;
      [@ocaml.doc
        "The deployment controller to use for the service. If no deployment controller is \
         specified, the default value of [ECS] is used.\n"]
  scheduling_strategy : scheduling_strategy option;
      [@ocaml.doc
        "The scheduling strategy to use for the service. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html}Services}.\n\n\
        \ There are two service scheduler strategies available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [REPLICA]-The replica scheduling strategy places and maintains the desired \
         number of tasks across your cluster. By default, the service scheduler spreads tasks \
         across Availability Zones. You can use task placement strategies and constraints to \
         customize task placement decisions. This scheduler strategy is required if the service \
         uses the [CODE_DEPLOY] or [EXTERNAL] deployment controller types.\n\
        \            \n\
        \             }\n\
        \        {-   [DAEMON]-The daemon scheduling strategy deploys exactly one task on each \
         active container instance that meets all of the task placement constraints that you \
         specify in your cluster. The service scheduler also evaluates the task placement \
         constraints for running tasks and will stop tasks that don't meet the placement \
         constraints. When you're using this strategy, you don't need to specify a desired number \
         of tasks, a task placement strategy, or use Service Auto Scaling policies.\n\
        \            \n\
        \              Tasks using the Fargate launch type or the [CODE_DEPLOY] or [EXTERNAL] \
         deployment controller types don't support the [DAEMON] scheduling strategy.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
  health_check_grace_period_seconds : boxed_integer option;
      [@ocaml.doc
        "The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy \
         Elastic Load Balancing, VPC Lattice, and container health checks after a task has first \
         started. If you do not specify a health check grace period value, the default value of 0 \
         is used. If you do not use any of the health checks, then [healthCheckGracePeriodSeconds] \
         is unused.\n\n\
        \ If your service has more running tasks than desired, unhealthy tasks in the grace period \
         might be stopped to reach the desired count.\n\
        \ "]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "The network configuration for the service. This parameter is required for task \
         definitions that use the [awsvpc] network mode to receive their own elastic network \
         interface, and it isn't supported for other network modes. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html}Task \
         networking} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  placement_strategy : placement_strategies option;
      [@ocaml.doc
        "The placement strategy objects to use for tasks in your service. You can specify a \
         maximum of 5 strategy rules for each service.\n"]
  placement_constraints : placement_constraints option;
      [@ocaml.doc
        "An array of placement constraint objects to use for tasks in your service. You can \
         specify a maximum of 10 constraints for each task. This limit includes constraints in the \
         task definition and those specified at runtime.\n"]
  deployment_configuration : deployment_configuration option;
      [@ocaml.doc
        "Optional deployment parameters that control how many tasks run during the deployment and \
         the ordering of stopping and starting tasks.\n"]
  role : string_ option;
      [@ocaml.doc
        "The name or full Amazon Resource Name (ARN) of the IAM role that allows Amazon ECS to \
         make calls to your load balancer on your behalf. This parameter is only permitted if you \
         are using a load balancer with your service and your task definition doesn't use the \
         [awsvpc] network mode. If you specify the [role] parameter, you must also specify a load \
         balancer object with the [loadBalancers] parameter.\n\n\
        \  If your account has already created the Amazon ECS service-linked role, that role is \
         used for your service unless you specify a role here. The service-linked role is required \
         if your task definition uses the [awsvpc] network mode or if the service is configured to \
         use service discovery, an external deployment controller, multiple target groups, or \
         Elastic Inference accelerators in which case you don't specify a role here. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html}Using \
         service-linked roles for Amazon ECS} in the {i Amazon Elastic Container Service Developer \
         Guide}.\n\
        \  \n\
        \    If your specified role has a path other than [/], then you must either specify the \
         full role ARN (this is recommended) or prefix the role name with the path. For example, \
         if a role with the name [bar] has a path of [/foo/] then you would specify [/foo/bar] as \
         the role name. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names}Friendly \
         names and paths} in the {i IAM User Guide}.\n\
        \    "]
  platform_version : string_ option;
      [@ocaml.doc
        "The platform version that your tasks in the service are running on. A platform version is \
         specified only for tasks using the Fargate launch type. If one isn't specified, the \
         [LATEST] platform version is used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         platform versions} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The capacity provider strategy to use for the service.\n\n\
        \  If you want to use Amazon ECS Managed Instances, you must use the \
         [capacityProviderStrategy] request parameter and omit the [launchType] request parameter.\n\
        \  \n\
        \    If a [capacityProviderStrategy] is specified, the [launchType] parameter must be \
         omitted. If no [capacityProviderStrategy] or [launchType] is specified, the \
         [defaultCapacityProviderStrategy] for the cluster is used.\n\
        \    \n\
        \     A capacity provider strategy can contain a maximum of 20 capacity providers.\n\
        \     "]
  launch_type : launch_type option;
      [@ocaml.doc
        "The infrastructure that you run your service on. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html}Amazon \
         ECS launch types} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \  If you want to use Amazon ECS Managed Instances, you must use the \
         [capacityProviderStrategy] request parameter and omit the [launchType] request parameter.\n\
        \  \n\
        \    The [FARGATE] launch type runs your tasks on Fargate On-Demand infrastructure.\n\
        \    \n\
        \      Fargate Spot infrastructure is available for use but a capacity provider strategy \
         must be used. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-capacity-providers.html}Fargate \
         capacity providers} in the {i Amazon ECS Developer Guide}.\n\
        \      \n\
        \        The [EC2] launch type runs your tasks on Amazon EC2 instances registered to your \
         cluster.\n\
        \        \n\
        \         The [EXTERNAL] launch type runs your tasks on your on-premises server or virtual \
         machine (VM) capacity registered to your cluster.\n\
        \         \n\
        \          A service can use either a launch type or a capacity provider strategy. If a \
         [launchType] is specified, the [capacityProviderStrategy] parameter must be omitted.\n\
        \          "]
  client_token : string_ option;
      [@ocaml.doc
        "An identifier that you provide to ensure the idempotency of the request. It must be \
         unique and is case sensitive. Up to 36 ASCII characters in the range of 33-126 \
         (inclusive) are allowed.\n"]
  desired_count : boxed_integer option;
      [@ocaml.doc
        "The number of instantiations of the specified task definition to place and keep running \
         in your service.\n\n\
        \ This is required if [schedulingStrategy] is [REPLICA] or isn't specified. If \
         [schedulingStrategy] is [DAEMON] then this isn't required.\n\
        \ "]
  service_registries : service_registries option;
      [@ocaml.doc
        "The details of the service discovery registry to associate with this service. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html}Service \
         discovery}.\n\n\
        \  Each service may be associated with one service registry. Multiple service registries \
         for each service isn't supported.\n\
        \  \n\
        \   "]
  load_balancers : load_balancers option;
      [@ocaml.doc
        "A load balancer object representing the load balancers to use with your service. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html}Service \
         load balancing} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
        \ If the service uses the [ECS] deployment controller and using either an Application Load \
         Balancer or Network Load Balancer, you must specify one or more target group ARNs to \
         attach to the service. The service-linked role is required for services that use multiple \
         target groups. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html}Using \
         service-linked roles for Amazon ECS} in the {i Amazon Elastic Container Service Developer \
         Guide}.\n\
        \ \n\
        \  If the service uses the [CODE_DEPLOY] deployment controller, the service is required to \
         use either an Application Load Balancer or Network Load Balancer. When creating an \
         CodeDeploy deployment group, you specify two target groups (referred to as a \
         [targetGroupPair]). During a deployment, CodeDeploy determines which task set in your \
         service has the status [PRIMARY], and it associates one target group with it. Then, it \
         also associates the other target group with the replacement task set. The load balancer \
         can also have up to two listeners: a required listener for production traffic and an \
         optional listener that you can use to perform validation tests with Lambda functions \
         before routing production traffic to it.\n\
        \  \n\
        \   If you use the [CODE_DEPLOY] deployment controller, these values can be changed when \
         updating the service.\n\
        \   \n\
        \    For Application Load Balancers and Network Load Balancers, this object must contain \
         the load balancer target group ARN, the container name, and the container port to access \
         from the load balancer. The container name must be as it appears in a container \
         definition. The load balancer name parameter must be omitted. When a task from this \
         service is placed on a container instance, the container instance and port combination is \
         registered as a target in the target group that's specified here.\n\
        \    \n\
        \     For Classic Load Balancers, this object must contain the load balancer name, the \
         container name , and the container port to access from the load balancer. The container \
         name must be as it appears in a container definition. The target group ARN parameter must \
         be omitted. When a task from this service is placed on a container instance, the \
         container instance is registered with the load balancer that's specified here.\n\
        \     \n\
        \      Services with tasks that use the [awsvpc] network mode (for example, those with the \
         Fargate launch type) only support Application Load Balancers and Network Load Balancers. \
         Classic Load Balancers aren't supported. Also, when you create any target groups for \
         these services, you must choose [ip] as the target type, not [instance]. This is because \
         tasks that use the [awsvpc] network mode are associated with an elastic network \
         interface, not an Amazon EC2 instance.\n\
        \      "]
  availability_zone_rebalancing : availability_zone_rebalancing option;
      [@ocaml.doc
        "Indicates whether to use Availability Zone rebalancing for the service.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-rebalancing.html}Balancing \
         an Amazon ECS service across Availability Zones} in the {i  {i Amazon Elastic Container \
         Service Developer Guide} }.\n\
        \ \n\
        \  The default behavior of [AvailabilityZoneRebalancing] differs between create and update \
         requests:\n\
        \  \n\
        \   {ul\n\
        \         {-  For create service requests, when no value is specified for \
         [AvailabilityZoneRebalancing], Amazon ECS defaults the value to [ENABLED].\n\
        \             \n\
        \              }\n\
        \         {-  For update service requests, when no value is specified for \
         [AvailabilityZoneRebalancing], Amazon ECS defaults to the existing service\226\128\153s \
         [AvailabilityZoneRebalancing] value. If the service never had an \
         [AvailabilityZoneRebalancing] value set, Amazon ECS treats this as [DISABLED].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  task_definition : string_ option;
      [@ocaml.doc
        "The [family] and [revision] ([family:revision]) or full ARN of the task definition to run \
         in your service. If a [revision] isn't specified, the latest [ACTIVE] revision is used.\n\n\
        \ A task definition must be specified if the service uses either the [ECS] or \
         [CODE_DEPLOY] deployment controllers.\n\
        \ \n\
        \  For more information about deployment types, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon \
         ECS deployment types}.\n\
        \  "]
  service_name : string_;
      [@ocaml.doc
        "The name of your service. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed. Service names must be unique within a cluster, but \
         you can have similarly named services in multiple clusters within a Region or across \
         multiple Regions.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster that you run your \
         service on. If you do not specify a cluster, the default cluster is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec create_managed_instances_provider_configuration = {
  auto_repair_configuration : auto_repair_configuration option;
      [@ocaml.doc
        "The auto repair configuration for the Amazon ECS Managed Instances capacity provider. Use \
         this to enable or disable automatic replacement of container instances that are detected \
         as unhealthy.\n"]
  infrastructure_optimization : infrastructure_optimization option;
      [@ocaml.doc
        "Defines how Amazon ECS Managed Instances optimizes the infrastastructure in your capacity \
         provider. Provides control over the delay between when EC2 instances become idle or \
         underutilized and when Amazon ECS optimizes them.\n"]
  propagate_tags : propagate_mi_tags option;
      [@ocaml.doc
        "Specifies whether to propagate tags from the capacity provider to the Amazon ECS Managed \
         Instances. When enabled, tags applied to the capacity provider are automatically applied \
         to all instances launched by this provider.\n"]
  instance_launch_template : instance_launch_template;
      [@ocaml.doc
        "The launch template configuration that specifies how Amazon ECS should launch Amazon EC2 \
         instances. This includes the instance profile, network configuration, storage settings, \
         and instance requirements for attribute-based instance type selection.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html}Store \
         instance launch parameters in Amazon EC2 launch templates} in the {i Amazon EC2 User \
         Guide}.\n\
        \ "]
  infrastructure_role_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the infrastructure role that Amazon ECS uses to manage \
         instances on your behalf. This role must have permissions to launch, terminate, and \
         manage Amazon EC2 instances, as well as access to other Amazon Web Services services \
         required for Amazon ECS Managed Instances functionality.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html}Amazon \
         ECS infrastructure IAM role} in the {i Amazon ECS Developer Guide}. \n\
        \ "]
}
[@@ocaml.doc
  "The configuration for creating a Amazon ECS Managed Instances provider. This specifies how \
   Amazon ECS should manage Amazon EC2 instances, including the infrastructure role, instance \
   launch template, and whether to propagate tags from the capacity provider to the instances.\n"]

type nonrec create_express_gateway_service_response = {
  service : ecs_express_gateway_service option;
      [@ocaml.doc "The full description of your Express service following the create operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_express_gateway_service_request = {
  task_definition_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a task definition to use to create the Express Gateway \
         service. This allows you to manage your own task definition, giving you more control over \
         the service configuration such as adding sidecar containers.\n\n\
        \ The task definition must have a container named [Main] with a single TCP port mapping \
         that includes a container port and port name. The task definition must also have \
         [FARGATE] compatibility.\n\
        \ \n\
        \  If you provide a task definition ARN, you cannot also specify [primaryContainer], \
         [executionRoleArn], [taskRoleArn], [cpu], or [memory].\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the Express service to help categorize and organize it. \
         Each tag consists of a key and an optional value. You can apply up to 50 tags to a \
         service.\n"]
  scaling_target : express_gateway_scaling_target option;
      [@ocaml.doc
        "The auto-scaling configuration for the Express service. This defines how the service \
         automatically adjusts the number of running tasks based on demand.\n\n\
        \ You can specify the minimum and maximum number of tasks, the scaling metric (CPU \
         utilization, memory utilization, or request count per target), and the target value for \
         the metric. If not specified, the default target value for an Express service is 60.\n\
        \ "]
  memory : string_ option;
      [@ocaml.doc
        "The amount of memory (in MiB) used by the task. This parameter determines the memory \
         allocation for each task in the Express service. The default value for an express service \
         is 512 MiB.\n"]
  cpu : string_ option;
      [@ocaml.doc
        "The number of CPU units used by the task. This parameter determines the CPU allocation \
         for each task in the Express service. The default value for an Express service is 256 \
         (.25 vCPU).\n"]
  network_configuration : express_gateway_service_network_configuration option;
      [@ocaml.doc
        "The network configuration for the Express service tasks. This specifies the VPC subnets \
         and security groups for the tasks.\n\n\
        \ For Express services, you can specify custom security groups and subnets. If not \
         provided, Amazon ECS will use the default VPC configuration and create appropriate \
         security groups automatically. The network configuration determines how your service \
         integrates with your VPC and what network access it has.\n\
        \ "]
  task_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that containers in this task can assume. \
         This role allows your application code to access other Amazon Web Services services \
         securely.\n\n\
        \ The task role is different from the execution role. While the execution role is used by \
         the Amazon ECS agent to set up the task, the task role is used by your application code \
         running inside the container to make Amazon Web Services API calls. If your application \
         doesn't need to access Amazon Web Services services, you can omit this parameter.\n\
        \ "]
  primary_container : express_gateway_container option;
      [@ocaml.doc
        "The primary container configuration for the Express service. This defines the main \
         application container that will receive traffic from the Application Load Balancer.\n\n\
        \ The primary container must specify at minimum a container image. You can also configure \
         the container port (defaults to 80), logging configuration, environment variables, \
         secrets, and startup commands. The container image can be from Amazon ECR, Docker Hub, or \
         any other container registry accessible to your execution role.\n\
        \ "]
  health_check_path : string_ option;
      [@ocaml.doc
        "The path on the container that the Application Load Balancer uses for health checks. This \
         should be a valid HTTP endpoint that returns a successful response (HTTP 200) when the \
         application is healthy.\n\n\
        \ If not specified, the default health check path is [/ping]. The health check path must \
         start with a forward slash and can include query parameters. Examples: [/health], \
         [/api/status], [/ping?format=json].\n\
        \ "]
  cluster : string_ option;
      [@ocaml.doc
        "The short name or full Amazon Resource Name (ARN) of the cluster on which to create the \
         Express service. If you do not specify a cluster, the [default] cluster is assumed.\n"]
  service_name : string_ option;
      [@ocaml.doc
        "The name of the Express service. This name must be unique within the specified cluster \
         and can contain up to 255 letters (uppercase and lowercase), numbers, underscores, and \
         hyphens. The name is used to identify the service in the Amazon ECS console and API \
         operations.\n\n\
        \ If you don't specify a service name, Amazon ECS generates a unique name for the service. \
         The service name becomes part of the service ARN and cannot be changed after the service \
         is created.\n\
        \ "]
  infrastructure_role_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the infrastructure role that grants Amazon ECS \
         permission to create and manage Amazon Web Services resources on your behalf for the \
         Express service. This role is used to provision and manage Application Load Balancers, \
         target groups, security groups, auto-scaling policies, and other Amazon Web Services \
         infrastructure components.\n\n\
        \ The infrastructure role must include permissions for Elastic Load Balancing, Application \
         Auto Scaling, Amazon EC2 (for security groups), and other services required for managed \
         infrastructure. This role is only used during Express service creation, updates, and \
         deletion operations.\n\
        \ "]
  execution_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS \
         container agent permission to make Amazon Web Services API calls on your behalf. This \
         role is required for Amazon ECS to pull container images from Amazon ECR, send container \
         logs to Amazon CloudWatch Logs, and retrieve sensitive data from Amazon Web Services \
         Systems Manager Parameter Store or Amazon Web Services Secrets Manager.\n\n\
        \ The execution role must include the [AmazonECSTaskExecutionRolePolicy] managed policy or \
         equivalent permissions. For Express services, this role is used during task startup and \
         runtime for container management operations.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_daemon_response = {
  deployment_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the initial daemon deployment. This deployment places \
         daemon tasks on each container instance of the specified capacity providers.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp for the time when the daemon was created.\n"]
  status : daemon_status option; [@ocaml.doc "The status of the daemon.\n"]
  daemon_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the daemon.\n"]
}
[@@ocaml.doc ""]

type nonrec create_daemon_request = {
  client_token : string_ option;
      [@ocaml.doc
        "An identifier that you provide to ensure the idempotency of the request. It must be \
         unique and is case sensitive. Up to 36 ASCII characters in the range of 33-126 \
         (inclusive) are allowed.\n"]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Determines whether the execute command functionality is turned on for the daemon. If \
         [true], the execute command functionality is turned on for all tasks in the daemon.\n"]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Specifies whether to turn on Amazon ECS managed tags for the tasks in the daemon. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         your Amazon ECS resources} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  propagate_tags : daemon_propagate_tags option;
      [@ocaml.doc
        "Specifies whether to propagate the tags from the daemon to the daemon tasks. If you don't \
         specify a value, the tags aren't propagated. You can only propagate tags to daemon tasks \
         during task creation. To add tags to a task after task creation, use the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TagResource.html}TagResource} \
         API action.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the daemon to help you categorize and organize them. Each \
         tag consists of a key and an optional value. You define both of them.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  deployment_configuration : daemon_deployment_configuration option;
      [@ocaml.doc
        "Optional deployment parameters that control how the daemon rolls out updates, including \
         the drain percentage, alarm-based rollback, and bake time.\n"]
  capacity_provider_arns : string_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the capacity providers to associate with the daemon. \
         The daemon deploys tasks on container instances managed by these capacity providers.\n"]
  daemon_task_definition_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the daemon task definition to use for the daemon.\n"]
  cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster to create the daemon in.\n"]
  daemon_name : string_;
      [@ocaml.doc
        "The name of the daemon. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The full description of your new cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_request = {
  service_connect_defaults : cluster_service_connect_defaults_request option;
      [@ocaml.doc
        "Use this parameter to set a default Service Connect namespace. After you set a default \
         Service Connect namespace, any new services with Service Connect turned on that are \
         created in the cluster are added as client services in the namespace. This setting only \
         applies to new services that set the [enabled] parameter to [true] in the \
         [ServiceConnectConfiguration]. You can set the namespace of each service individually in \
         the [ServiceConnectConfiguration] to override this default parameter.\n\n\
        \ Tasks that run in a namespace can use short names to connect to services in the \
         namespace. Tasks can connect to services across all of the clusters in the namespace. \
         Tasks connect through a managed proxy container that collects logs and metrics for \
         increased visibility. Only the tasks that Amazon ECS services create are supported with \
         Service Connect. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
         Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  default_capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The capacity provider strategy to set as the default for the cluster. After a default \
         capacity provider strategy is set for a cluster, when you call the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html}CreateService} \
         or {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html}RunTask} \
         APIs with no capacity provider strategy or launch type specified, the default capacity \
         provider strategy for the cluster is used.\n\n\
        \ If a default capacity provider strategy isn't defined for a cluster when it was created, \
         it can be defined later with the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
         API operation.\n\
        \ "]
  capacity_providers : string_list option;
      [@ocaml.doc
        "The short name of one or more capacity providers to associate with the cluster. A \
         capacity provider must be associated with a cluster before it can be included as part of \
         the default capacity provider strategy of the cluster or used in a capacity provider \
         strategy when calling the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html}CreateService} \
         or {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html}RunTask} \
         actions.\n\n\
        \ If specifying a capacity provider that uses an Auto Scaling group, the capacity provider \
         must be created but not associated with another cluster. New Auto Scaling group capacity \
         providers can be created with the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCapacityProvider.html}CreateCapacityProvider} \
         API operation.\n\
        \ \n\
        \  To use a Fargate capacity provider, specify either the [FARGATE] or [FARGATE_SPOT] \
         capacity providers. The Fargate capacity providers are available to all accounts and only \
         need to be associated with a cluster to be used.\n\
        \  \n\
        \   The \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutCapacityProvider.html}PutCapacityProvider} \
         API operation is used to update the list of available capacity providers for a cluster \
         after the cluster is created.\n\
        \   "]
  configuration : cluster_configuration option;
      [@ocaml.doc "The [execute] command configuration for the cluster.\n"]
  settings : cluster_settings option;
      [@ocaml.doc
        "The setting to use when creating a cluster. This parameter is used to turn on CloudWatch \
         Container Insights for a cluster. If this value is specified, it overrides the \
         [containerInsights] value set with \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSetting.html}PutAccountSetting} \
         or \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSettingDefault.html}PutAccountSettingDefault}.\n"]
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the cluster to help you categorize and organize them. Each \
         tag consists of a key and an optional value. You define both.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  cluster_name : string_ option;
      [@ocaml.doc
        "The name of your cluster. If you don't specify a name for your cluster, you create a \
         cluster that's named [default]. Up to 255 letters (uppercase and lowercase), numbers, \
         underscores, and hyphens are allowed. \n"]
}
[@@ocaml.doc ""]

type nonrec create_capacity_provider_response = {
  capacity_provider : capacity_provider option;
      [@ocaml.doc "The full description of the new capacity provider.\n"]
}
[@@ocaml.doc ""]

type nonrec create_capacity_provider_request = {
  tags : tags option;
      [@ocaml.doc
        "The metadata that you apply to the capacity provider to categorize and organize them more \
         conveniently. Each tag consists of a key and an optional value. You define both of them.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case-sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for either keys or values as it is reserved for Amazon Web Services use. You \
         cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not \
         count against your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  managed_instances_provider : create_managed_instances_provider_configuration option;
      [@ocaml.doc
        "The configuration for the Amazon ECS Managed Instances provider. This configuration \
         specifies how Amazon ECS manages Amazon EC2 instances on your behalf, including the \
         infrastructure role, instance launch template, and tag propagation settings.\n"]
  auto_scaling_group_provider : auto_scaling_group_provider option;
      [@ocaml.doc "The details of the Auto Scaling group for the capacity provider.\n"]
  cluster : string_ option;
      [@ocaml.doc
        "The name of the cluster to associate with the capacity provider. When you create a \
         capacity provider with Amazon ECS Managed Instances, it becomes available only within the \
         specified cluster.\n"]
  name : string_;
      [@ocaml.doc
        "The name of the capacity provider. Up to 255 characters are allowed. They include letters \
         (both upper and lowercase letters), numbers, underscores (_), and hyphens (-). The name \
         can't be prefixed with \"[aws]\", \"[ecs]\", or \"[fargate]\".\n"]
}
[@@ocaml.doc ""]

type nonrec continue_service_deployment_response = {
  service_deployment_arn : string_ option;
      [@ocaml.doc "The ARN of the service deployment that was continued or rolled back.\n"]
}
[@@ocaml.doc ""]

type nonrec continue_service_deployment_request = {
  action : deployment_lifecycle_hook_action option;
      [@ocaml.doc
        "The action to take on the paused lifecycle hook. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [CONTINUE] - Proceeds the deployment to the next lifecycle stage.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK] - Rolls back the deployment to the previous service revision.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If no value is specified, the default action is [CONTINUE].\n\
        \   "]
  hook_id : string_;
      [@ocaml.doc
        "The ID of the paused lifecycle hook to act on. You can find the [hookId] by calling \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServiceDeployments.html}DescribeServiceDeployments} \
         and inspecting the [lifecycleHookDetails] field of the service deployment.\n"]
  service_deployment_arn : string_;
      [@ocaml.doc "The ARN of the service deployment to continue or roll back.\n"]
}
[@@ocaml.doc ""]

type nonrec container_instance_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec cluster_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec capacity_provider_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
