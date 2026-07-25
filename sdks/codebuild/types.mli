type nonrec string_ = string [@@ocaml.doc ""]

type nonrec account_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "An Amazon Web Services service limit was exceeded for the calling Amazon Web Services account.\n"]

type nonrec account_suspended_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The CodeBuild access has been suspended for the calling Amazon Web Services account.\n"]

type nonrec artifact_namespace = NONE [@ocaml.doc ""] | BUILD_ID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec artifact_packaging = NONE [@ocaml.doc ""] | ZIP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec artifacts_type =
  | CODEPIPELINE [@ocaml.doc ""]
  | S3 [@ocaml.doc ""]
  | NO_ARTIFACTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auth_type =
  | OAUTH [@ocaml.doc ""]
  | BASIC_AUTH [@ocaml.doc ""]
  | PERSONAL_ACCESS_TOKEN [@ocaml.doc ""]
  | CODECONNECTIONS [@ocaml.doc ""]
  | SECRETS_MANAGER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec wrapper_int = int [@@ocaml.doc ""]

type nonrec auto_retry_config = {
  auto_retry_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of additional automatic retries after a failed build. For example, if \
         the auto-retry limit is set to 2, CodeBuild will call the [RetryBuild] API to \
         automatically retry your build for up to 2 additional times.\n"]
  auto_retry_number : wrapper_int option;
      [@ocaml.doc
        "The number of times that the build has been retried. The initial build will have an \
         auto-retry number of 0.\n"]
  next_auto_retry : string_ option;
      [@ocaml.doc
        "The build ARN of the auto-retried build triggered by the current build. The next \
         auto-retry will be [null] for builds that don't trigger an auto-retry.\n"]
  previous_auto_retry : string_ option;
      [@ocaml.doc
        "The build ARN of the build that triggered the current auto-retry build. The previous \
         auto-retry will be [null] for the initial build.\n"]
}
[@@ocaml.doc "Information about the auto-retry configuration for the build.\n"]

type nonrec invalid_input_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The input value that was provided is not valid.\n"]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec build_not_deleted = {
  id : non_empty_string option;
      [@ocaml.doc "The ID of the build that could not be successfully deleted.\n"]
  status_code : string_ option;
      [@ocaml.doc
        "Additional information about the build that could not be successfully deleted.\n"]
}
[@@ocaml.doc "Information about a build that could not be successfully deleted.\n"]

type nonrec builds_not_deleted = build_not_deleted list [@@ocaml.doc ""]

type nonrec build_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec batch_delete_builds_output = {
  builds_deleted : build_ids option;
      [@ocaml.doc "The IDs of the builds that were successfully deleted.\n"]
  builds_not_deleted : builds_not_deleted option;
      [@ocaml.doc "Information about any builds that could not be successfully deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_builds_input = {
  ids : build_ids; [@ocaml.doc "The IDs of the builds to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec build_batch_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec build_report_arns = string_ list [@@ocaml.doc ""]

type nonrec wrapper_boolean = bool [@@ocaml.doc ""]

type nonrec resolved_artifact = {
  type_ : artifacts_type option; [@ocaml.doc "Specifies the type of artifact.\n"]
  location : string_ option; [@ocaml.doc "The location of the artifact.\n"]
  identifier : string_ option; [@ocaml.doc "The identifier of the artifact.\n"]
}
[@@ocaml.doc
  "Represents a resolved build artifact. A resolved artifact is an artifact that is built and \
   deployed to the destination, such as Amazon S3.\n"]

type nonrec resolved_secondary_artifacts = resolved_artifact list [@@ocaml.doc ""]

type nonrec status_type =
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | FAULT [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec build_summary = {
  arn : string_ option; [@ocaml.doc "The batch build ARN.\n"]
  requested_on : timestamp option;
      [@ocaml.doc "When the build was started, expressed in Unix time format.\n"]
  build_status : status_type option;
      [@ocaml.doc
        "The status of the build group.\n\n\
        \  FAILED  The build group failed.\n\
        \          \n\
        \            FAULT  The build group faulted.\n\
        \                   \n\
        \                     IN_PROGRESS  The build group is still in progress.\n\
        \                                  \n\
        \                                    STOPPED  The build group stopped.\n\
        \                                             \n\
        \                                               SUCCEEDED  The build group succeeded.\n\
        \                                                          \n\
        \                                                            TIMED_OUT  The build group \
         timed out.\n\
        \                                                                       \n\
        \                                                                         "]
  primary_artifact : resolved_artifact option;
      [@ocaml.doc
        "A [ResolvedArtifact] object that represents the primary build artifacts for the build \
         group.\n"]
  secondary_artifacts : resolved_secondary_artifacts option;
      [@ocaml.doc
        "An array of [ResolvedArtifact] objects that represents the secondary build artifacts for \
         the build group.\n"]
}
[@@ocaml.doc "Contains summary information about a batch build group.\n"]

type nonrec build_summaries = build_summary list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec identifiers = non_empty_string list [@@ocaml.doc ""]

type nonrec build_group = {
  identifier : string_ option; [@ocaml.doc "Contains the identifier of the build group.\n"]
  depends_on : identifiers option;
      [@ocaml.doc
        "An array of strings that contain the identifiers of the build groups that this build \
         group depends on.\n"]
  ignore_failure : boolean_ option;
      [@ocaml.doc "Specifies if failures in this build group can be ignored.\n"]
  current_build_summary : build_summary option;
      [@ocaml.doc "A [BuildSummary] object that contains a summary of the current build group.\n"]
  prior_build_summary_list : build_summaries option;
      [@ocaml.doc
        "An array of [BuildSummary] objects that contain summaries of previous build groups.\n"]
}
[@@ocaml.doc
  "Contains information about a batch build build group. Build groups are used to combine builds \
   that can run in parallel, while still being able to set dependencies on other build groups.\n"]

type nonrec build_groups = build_group list [@@ocaml.doc ""]

type nonrec batch_report_mode_type =
  | REPORT_INDIVIDUAL_BUILDS [@ocaml.doc ""]
  | REPORT_AGGREGATED_BATCH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleets_allowed = non_empty_string list [@@ocaml.doc ""]

type nonrec compute_types_allowed = non_empty_string list [@@ocaml.doc ""]

type nonrec batch_restrictions = {
  maximum_builds_allowed : wrapper_int option;
      [@ocaml.doc "Specifies the maximum number of builds allowed.\n"]
  compute_types_allowed : compute_types_allowed option;
      [@ocaml.doc
        "An array of strings that specify the compute types that are allowed for the batch build. \
         See \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html}Build \
         environment compute types} in the {i CodeBuild User Guide} for these values. \n"]
  fleets_allowed : fleets_allowed option;
      [@ocaml.doc
        "An array of strings that specify the fleets that are allowed for the batch build. See \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/fleets.html}Run builds on \
         reserved capacity fleets} in the {i CodeBuild User Guide} for more information. \n"]
}
[@@ocaml.doc "Specifies restrictions for the batch build.\n"]

type nonrec project_build_batch_config = {
  service_role : non_empty_string option;
      [@ocaml.doc "Specifies the service role ARN for the batch build project.\n"]
  combine_artifacts : wrapper_boolean option;
      [@ocaml.doc
        "Specifies if the build artifacts for the batch build should be combined into a single \
         artifact location.\n"]
  restrictions : batch_restrictions option;
      [@ocaml.doc
        "A [BatchRestrictions] object that specifies the restrictions for the batch build.\n"]
  timeout_in_mins : wrapper_int option;
      [@ocaml.doc
        "Specifies the maximum amount of time, in minutes, that the batch build must be completed \
         in.\n"]
  batch_report_mode : batch_report_mode_type option;
      [@ocaml.doc
        "Specifies how build status reports are sent to the source provider for the batch build. \
         This property is only used when the source provider for your project is Bitbucket, \
         GitHub, or GitHub Enterprise, and your project is configured to report build statuses to \
         the source provider.\n\n\
        \  REPORT_AGGREGATED_BATCH  (Default) Aggregate all of the build statuses into a single \
         status report.\n\
        \                           \n\
        \                             REPORT_INDIVIDUAL_BUILDS  Send a separate status report for \
         each individual build.\n\
        \                                                       \n\
        \                                                         "]
}
[@@ocaml.doc "Contains configuration information about a batch build project.\n"]

type nonrec file_system_type = EFS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec project_file_system_location = {
  type_ : file_system_type option;
      [@ocaml.doc " The type of the file system. The one supported type is [EFS]. \n"]
  location : string_ option;
      [@ocaml.doc
        "A string that specifies the location of the file system created by Amazon EFS. Its format \
         is [efs-dns-name:/directory-path]. You can find the DNS name of file system when you view \
         it in the Amazon EFS console. The directory path is a path to a directory in the file \
         system that CodeBuild mounts. For example, if the DNS name of a file system is \
         [fs-abcd1234.efs.us-west-2.amazonaws.com], and its mount directory is \
         [my-efs-mount-directory], then the [location] is \
         [fs-abcd1234.efs.us-west-2.amazonaws.com:/my-efs-mount-directory]. \n\n\
        \ The directory path in the format [efs-dns-name:/directory-path] is optional. If you do \
         not specify a directory path, the location is only the DNS name and CodeBuild mounts the \
         entire file system. \n\
        \ "]
  mount_point : string_ option;
      [@ocaml.doc "The location in the container where you mount the file system. \n"]
  identifier : string_ option;
      [@ocaml.doc
        "The name used to access a file system created by Amazon EFS. CodeBuild creates an \
         environment variable by appending the [identifier] in all capital letters to \
         [CODEBUILD_]. For example, if you specify [my_efs] for [identifier], a new environment \
         variable is create named [CODEBUILD_MY_EFS]. \n\n\
        \  The [identifier] is used to mount your file system. \n\
        \ "]
  mount_options : string_ option;
      [@ocaml.doc
        " The mount options for a file system created by Amazon EFS. The default mount options \
         used by CodeBuild are [nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2]. \
         For more information, see \
         {{:https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-nfs-mount-settings.html}Recommended \
         NFS Mount Options}. \n"]
}
[@@ocaml.doc
  " Information about a file system created by Amazon Elastic File System (EFS). For more \
   information, see {{:https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html}What Is Amazon \
   Elastic File System?} \n"]

type nonrec project_file_system_locations = project_file_system_location list [@@ocaml.doc ""]

type nonrec wrapper_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec security_group_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec subnets = non_empty_string list [@@ocaml.doc ""]

type nonrec vpc_config = {
  vpc_id : non_empty_string option; [@ocaml.doc "The ID of the Amazon VPC.\n"]
  subnets : subnets option; [@ocaml.doc "A list of one or more subnet IDs in your Amazon VPC.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc "A list of one or more security groups IDs in your Amazon VPC.\n"]
}
[@@ocaml.doc "Information about the VPC configuration that CodeBuild accesses.\n"]

type nonrec bucket_owner_access =
  | NONE [@ocaml.doc ""]
  | READ_ONLY [@ocaml.doc ""]
  | FULL [@ocaml.doc ""]
[@@ocaml.doc
  "Specifies the bucket owner's access for objects that another account uploads to their Amazon S3 \
   bucket. By default, only the account that uploads the objects to the bucket has access to these \
   objects. This property allows you to give the bucket owner access to these objects.\n\n\
  \  To use this property, your CodeBuild service role must have the [s3:PutBucketAcl] permission. \
   This permission allows CodeBuild to modify the access control list for the bucket.\n\
  \  \n\
  \    This property can be one of the following values:\n\
  \    \n\
  \      NONE  The bucket owner does not have access to the objects. This is the default.\n\
  \            \n\
  \              READ_ONLY  The bucket owner has read-only access to the objects. The uploading \
   account retains ownership of the objects.\n\
  \                         \n\
  \                           FULL  The bucket owner has full access to the objects. Object \
   ownership is determined by the following criteria:\n\
  \                                 \n\
  \                                  {ul\n\
  \                                        {-  If the bucket is configured with the {b Bucket \
   owner preferred} setting, the bucket owner owns the objects. The uploading account will have \
   object access as specified by the bucket's policy.\n\
  \                                            \n\
  \                                             }\n\
  \                                        {-  Otherwise, the uploading account retains ownership \
   of the objects.\n\
  \                                            \n\
  \                                             }\n\
  \                                        }\n\
  \   For more information about Amazon S3 object ownership, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling \
   ownership of uploaded objects using S3 Object Ownership} in the {i Amazon Simple Storage \
   Service User Guide}.\n\
  \   \n\
  \     "]

type nonrec logs_config_status_type = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_logs_config = {
  status : logs_config_status_type;
      [@ocaml.doc
        "The current status of the S3 build logs. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [ENABLED]: S3 build logs are enabled for this build project.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED]: S3 build logs are not enabled for this build project.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  location : string_ option;
      [@ocaml.doc
        " The ARN of an S3 bucket and the path prefix for S3 logs. If your Amazon S3 bucket name \
         is [my-bucket], and your path prefix is [build-log], then acceptable formats are \
         [my-bucket/build-log] or [arn:aws:s3:::my-bucket/build-log]. \n"]
  encryption_disabled : wrapper_boolean option;
      [@ocaml.doc
        " Set to true if you do not want your S3 build log output encrypted. By default S3 build \
         logs are encrypted. \n"]
  bucket_owner_access : bucket_owner_access option; [@ocaml.doc ""]
}
[@@ocaml.doc " Information about S3 logs for a build project. \n"]

type nonrec cloud_watch_logs_config = {
  status : logs_config_status_type;
      [@ocaml.doc
        "The current status of the logs in CloudWatch Logs for a build project. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [ENABLED]: CloudWatch Logs are enabled for this build project.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED]: CloudWatch Logs are not enabled for this build project.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  group_name : string_ option;
      [@ocaml.doc
        " The group name of the logs in CloudWatch Logs. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html}Working \
         with Log Groups and Log Streams}. \n"]
  stream_name : string_ option;
      [@ocaml.doc
        " The prefix of the stream name of the CloudWatch Logs. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html}Working \
         with Log Groups and Log Streams}. \n"]
}
[@@ocaml.doc " Information about CloudWatch Logs for a build project. \n"]

type nonrec logs_config = {
  cloud_watch_logs : cloud_watch_logs_config option;
      [@ocaml.doc
        " Information about CloudWatch Logs for a build project. CloudWatch Logs are enabled by \
         default. \n"]
  s3_logs : s3_logs_config option;
      [@ocaml.doc
        " Information about logs built to an S3 bucket for a build project. S3 logs are not \
         enabled by default. \n"]
}
[@@ocaml.doc
  " Information about logs for a build project. These can be logs in CloudWatch Logs, built in a \
   specified S3 bucket, or both. \n"]

type nonrec host_kernel =
  | LINUX_KERNEL_4 [@ocaml.doc ""]
  | LINUX_KERNEL_6 [@ocaml.doc ""]
  | LINUX_KERNEL_LATEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec docker_server_status = {
  status : string_ option; [@ocaml.doc "The status of the docker server.\n"]
  message : string_ option; [@ocaml.doc "A message associated with the status of a docker server.\n"]
}
[@@ocaml.doc "Contains information about the status of the docker server.\n"]

type nonrec compute_type =
  | BUILD_GENERAL1_SMALL [@ocaml.doc ""]
  | BUILD_GENERAL1_MEDIUM [@ocaml.doc ""]
  | BUILD_GENERAL1_LARGE [@ocaml.doc ""]
  | BUILD_GENERAL1_XLARGE [@ocaml.doc ""]
  | BUILD_GENERAL1_2XLARGE [@ocaml.doc ""]
  | BUILD_LAMBDA_1GB [@ocaml.doc ""]
  | BUILD_LAMBDA_2GB [@ocaml.doc ""]
  | BUILD_LAMBDA_4GB [@ocaml.doc ""]
  | BUILD_LAMBDA_8GB [@ocaml.doc ""]
  | BUILD_LAMBDA_10GB [@ocaml.doc ""]
  | ATTRIBUTE_BASED_COMPUTE [@ocaml.doc ""]
  | CUSTOM_INSTANCE_TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec docker_server = {
  compute_type : compute_type;
      [@ocaml.doc
        "Information about the compute resources the docker server uses. Available values include:\n\n\
        \ {ul\n\
        \       {-   [BUILD_GENERAL1_SMALL]: Use up to 4 GiB memory and 2 vCPUs for your docker \
         server.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_MEDIUM]: Use up to 8 GiB memory and 4 vCPUs for your docker \
         server.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_LARGE]: Use up to 16 GiB memory and 8 vCPUs for your docker \
         server.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_XLARGE]: Use up to 64 GiB memory and 32 vCPUs for your docker \
         server.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_2XLARGE]: Use up to 128 GiB memory and 64 vCPUs for your \
         docker server.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "A list of one or more security groups IDs.\n\n\
        \  Security groups configured for Docker servers should allow ingress network traffic from \
         the VPC configured in the project. They should allow ingress on port 9876.\n\
        \  \n\
        \   "]
  status : docker_server_status option;
      [@ocaml.doc
        "A DockerServerStatus object to use for this docker server.\n\n\
        \  Note that [status] is only an output and cannot be passed in as an input.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Contains docker server information.\n"]

type nonrec image_pull_credentials_type = CODEBUILD [@ocaml.doc ""] | SERVICE_ROLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec credential_provider_type = SECRETS_MANAGER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec registry_credential = {
  credential : non_empty_string;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) or name of credentials created using Secrets Manager. \n\n\
        \   The [credential] can use the name of the credentials only if they exist in your \
         current Amazon Web Services Region. \n\
        \  \n\
        \   "]
  credential_provider : credential_provider_type;
      [@ocaml.doc
        " The service that created the credentials to access a private Docker registry. The valid \
         value, SECRETS_MANAGER, is for Secrets Manager. \n"]
}
[@@ocaml.doc
  " Information about credentials that provide access to a private Docker registry. When this is \
   set: \n\n\
  \ {ul\n\
  \       {-   [imagePullCredentialsType] must be set to [SERVICE_ROLE]. \n\
  \           \n\
  \            }\n\
  \       {-   images cannot be curated or an Amazon ECR image.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-private-registry.html}Private \
   Registry with Secrets Manager Sample for CodeBuild}. \n\
  \   "]

type nonrec environment_variable_type =
  | PLAINTEXT [@ocaml.doc ""]
  | PARAMETER_STORE [@ocaml.doc ""]
  | SECRETS_MANAGER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_variable = {
  name : non_empty_string; [@ocaml.doc "The name or key of the environment variable.\n"]
  value : string_;
      [@ocaml.doc
        "The value of the environment variable.\n\n\
        \  We strongly discourage the use of [PLAINTEXT] environment variables to store sensitive \
         values, especially Amazon Web Services secret key IDs. [PLAINTEXT] environment variables \
         can be displayed in plain text using the CodeBuild console and the CLI. For sensitive \
         values, we recommend you use an environment variable of type [PARAMETER_STORE] or \
         [SECRETS_MANAGER]. \n\
        \  \n\
        \   "]
  type_ : environment_variable_type option;
      [@ocaml.doc
        "The type of environment variable. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [PARAMETER_STORE]: An environment variable stored in Systems Manager \
         Parameter Store. For environment variables of this type, specify the name of the \
         parameter as the [value] of the EnvironmentVariable. The parameter value will be \
         substituted for the name at runtime. You can also define Parameter Store environment \
         variables in the buildspec. To learn how to do so, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env.parameter-store}env/parameter-store} \
         in the {i CodeBuild User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [PLAINTEXT]: An environment variable in plain text format. This is the \
         default value.\n\
        \           \n\
        \            }\n\
        \       {-   [SECRETS_MANAGER]: An environment variable stored in Secrets Manager. For \
         environment variables of this type, specify the name of the secret as the [value] of the \
         EnvironmentVariable. The secret value will be substituted for the name at runtime. You \
         can also define Secrets Manager environment variables in the buildspec. To learn how to \
         do so, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env.secrets-manager}env/secrets-manager} \
         in the {i CodeBuild User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about an environment variable for a build project or a build.\n"]

type nonrec environment_variables = environment_variable list [@@ocaml.doc ""]

type nonrec project_fleet = {
  fleet_arn : string_ option; [@ocaml.doc "Specifies the compute fleet ARN for the build project.\n"]
}
[@@ocaml.doc
  "Information about the compute fleet of the build project. For more information, see \
   {{:https://docs.aws.amazon.com/codebuild/latest/userguide/fleets.html}Working with reserved \
   capacity in CodeBuild}.\n"]

type nonrec machine_type = GENERAL [@ocaml.doc ""] | NVME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec compute_configuration = {
  v_cpu : wrapper_long option;
      [@ocaml.doc "The number of vCPUs of the instance type included in your fleet.\n"]
  memory : wrapper_long option;
      [@ocaml.doc "The amount of memory of the instance type included in your fleet.\n"]
  disk : wrapper_long option;
      [@ocaml.doc "The amount of disk space of the instance type included in your fleet.\n"]
  machine_type : machine_type option;
      [@ocaml.doc "The machine type of the instance type included in your fleet.\n"]
  instance_type : non_empty_string option;
      [@ocaml.doc "The EC2 instance type to be launched in your fleet.\n"]
}
[@@ocaml.doc
  "Contains compute attributes. These attributes only need be specified when your project's or \
   fleet's [computeType] is set to [ATTRIBUTE_BASED_COMPUTE] or [CUSTOM_INSTANCE_TYPE].\n"]

type nonrec environment_type =
  | WINDOWS_CONTAINER [@ocaml.doc ""]
  | LINUX_CONTAINER [@ocaml.doc ""]
  | LINUX_GPU_CONTAINER [@ocaml.doc ""]
  | ARM_CONTAINER [@ocaml.doc ""]
  | WINDOWS_SERVER_2019_CONTAINER [@ocaml.doc ""]
  | WINDOWS_SERVER_2022_CONTAINER [@ocaml.doc ""]
  | LINUX_LAMBDA_CONTAINER [@ocaml.doc ""]
  | ARM_LAMBDA_CONTAINER [@ocaml.doc ""]
  | LINUX_EC2 [@ocaml.doc ""]
  | ARM_EC2 [@ocaml.doc ""]
  | WINDOWS_EC2 [@ocaml.doc ""]
  | MAC_ARM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec project_environment = {
  type_ : environment_type;
      [@ocaml.doc
        "The type of build environment to use for related builds.\n\n\
        \  If you're using compute fleets during project creation, [type] will be ignored.\n\
        \  \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html}Build \
         environment compute types} in the {i CodeBuild user guide}.\n\
        \    "]
  image : non_empty_string;
      [@ocaml.doc
        "The image tag or image digest that identifies the Docker image to use for this build \
         project. Use the following formats:\n\n\
        \ {ul\n\
        \       {-  For an image tag: \n\
        \           {[\n\
        \           /:\n\
        \           ]}\n\
        \           . For example, in the Docker repository that CodeBuild uses to manage its \
         Docker images, this would be [aws/codebuild/standard:4.0]. \n\
        \           \n\
        \            }\n\
        \       {-  For an image digest: \n\
        \           {[\n\
        \           /\\@\n\
        \           ]}\n\
        \           . For example, to specify an image with the digest \
         \"sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf,\" use \n\
        \           {[\n\
        \           /\\@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf\n\
        \           ]}\n\
        \           .\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html}Docker \
         images provided by CodeBuild} in the {i CodeBuild user guide}.\n\
        \   "]
  compute_type : compute_type;
      [@ocaml.doc
        "Information about the compute resources the build project uses. Available values include:\n\n\
        \ {ul\n\
        \       {-   [ATTRIBUTE_BASED_COMPUTE]: Specify the amount of vCPUs, memory, disk space, \
         and the type of machine.\n\
        \           \n\
        \              If you use [ATTRIBUTE_BASED_COMPUTE], you must define your attributes by \
         using [computeConfiguration]. CodeBuild will select the cheapest instance that satisfies \
         your specified attributes. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.types}Reserved \
         capacity environment types} in the {i CodeBuild User Guide}.\n\
        \             \n\
        \               }\n\
        \       {-   [BUILD_GENERAL1_SMALL]: Use up to 4 GiB memory and 2 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_MEDIUM]: Use up to 8 GiB memory and 4 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_LARGE]: Use up to 16 GiB memory and 8 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_XLARGE]: Use up to 72 GiB memory and 36 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_2XLARGE]: Use up to 144 GiB memory, 72 vCPUs, and 824 GB of \
         SSD storage for builds. This compute type supports Docker images up to 100 GB \
         uncompressed.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_1GB]: Use up to 1 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_2GB]: Use up to 2 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_4GB]: Use up to 4 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_8GB]: Use up to 8 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_10GB]: Use up to 10 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you use [BUILD_GENERAL1_SMALL]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 4 GiB memory and \
         2 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 16 GiB \
         memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 4 GiB memory and 2 \
         vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    If you use [BUILD_GENERAL1_LARGE]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 16 GiB memory \
         and 8 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 255 GiB \
         memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 16 GiB memory and \
         8 vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment.types}On-demand \
         environment types} in the {i CodeBuild User Guide.} \n\
        \   "]
  compute_configuration : compute_configuration option;
      [@ocaml.doc
        "The compute configuration of the build project. This is only required if [computeType] is \
         set to [ATTRIBUTE_BASED_COMPUTE].\n"]
  fleet : project_fleet option;
      [@ocaml.doc "A ProjectFleet object to use for this build project.\n"]
  environment_variables : environment_variables option;
      [@ocaml.doc
        "A set of environment variables to make available to builds for this build project.\n"]
  privileged_mode : wrapper_boolean option;
      [@ocaml.doc
        "Enables running the Docker daemon inside a Docker container. Set to true only if the \
         build project is used to build Docker images. Otherwise, a build that attempts to \
         interact with the Docker daemon fails. The default setting is [false].\n\n\
        \ You can initialize the Docker daemon during the install phase of your build by adding \
         one of the following sets of commands to the install phase of your buildspec file:\n\
        \ \n\
        \  If the operating system's base image is Ubuntu Linux:\n\
        \  \n\
        \    [- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock \
         --host=tcp://0.0.0.0:2375 --storage-driver=overlay&] \n\
        \   \n\
        \     [- timeout 15 sh -c \"until docker info; do echo .; sleep 1; done\"] \n\
        \    \n\
        \     If the operating system's base image is Alpine Linux and the previous command does \
         not work, add the [-t] argument to [timeout]:\n\
        \     \n\
        \       [- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock \
         --host=tcp://0.0.0.0:2375 --storage-driver=overlay&] \n\
        \      \n\
        \        [- timeout -t 15 sh -c \"until docker info; do echo .; sleep 1; done\"] \n\
        \       "]
  certificate : string_ option;
      [@ocaml.doc
        "The ARN of the Amazon S3 bucket, path prefix, and object key that contains the \
         PEM-encoded certificate for the build project. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/create-project-cli.html#cli.environment.certificate}certificate} \
         in the {i CodeBuild User Guide}.\n"]
  registry_credential : registry_credential option;
      [@ocaml.doc " The credentials for access to a private registry.\n"]
  image_pull_credentials_type : image_pull_credentials_type option;
      [@ocaml.doc
        " The type of credentials CodeBuild uses to pull images in your build. There are two valid \
         values: \n\n\
        \ {ul\n\
        \       {-   [CODEBUILD] specifies that CodeBuild uses its own credentials. This requires \
         that you modify your ECR repository policy to trust CodeBuild service principal. \n\
        \           \n\
        \            }\n\
        \       {-   [SERVICE_ROLE] specifies that CodeBuild uses your build project's service \
         role. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    When you use a cross-account or private registry image, you must use SERVICE_ROLE \
         credentials. When you use an CodeBuild curated image, you must use CODEBUILD credentials. \n\
        \   "]
  docker_server : docker_server option;
      [@ocaml.doc "A DockerServer object to use for this build project.\n"]
  host_kernel : host_kernel option;
      [@ocaml.doc
        "The host operating system kernel used for on-demand builds in the build project. The host \
         kernel does not affect the build environment operating system, which is determined by the \
         image you specify. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [LINUX_KERNEL_4]: Runs on an Amazon Linux 2 host (kernel 4.x).\n\
        \           \n\
        \            }\n\
        \       {-   [LINUX_KERNEL_6]: Runs on an Amazon Linux 2023 host (kernel 6.x).\n\
        \           \n\
        \            }\n\
        \       {-   [LINUX_KERNEL_LATEST]: Runs on the latest supported host kernel.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This setting applies to the [LINUX_CONTAINER], [ARM_CONTAINER], [LINUX_EC2], and \
         [ARM_EC2] environment types. It is not applicable to Windows, Lambda, or Mac environment \
         types.\n\
        \   "]
}
[@@ocaml.doc "Information about the build environment of the build project.\n"]

type nonrec cache_mode =
  | LOCAL_DOCKER_LAYER_CACHE [@ocaml.doc ""]
  | LOCAL_SOURCE_CACHE [@ocaml.doc ""]
  | LOCAL_CUSTOM_CACHE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec project_cache_modes = cache_mode list [@@ocaml.doc ""]

type nonrec cache_type = NO_CACHE [@ocaml.doc ""] | S3 [@ocaml.doc ""] | LOCAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec project_cache = {
  type_ : cache_type;
      [@ocaml.doc
        "The type of cache used by the build project. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [NO_CACHE]: The build project does not use any cache.\n\
        \           \n\
        \            }\n\
        \       {-   [S3]: The build project reads and writes from and to S3.\n\
        \           \n\
        \            }\n\
        \       {-   [LOCAL]: The build project stores a cache locally on a build host that is \
         only available to that build host.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  location : string_ option;
      [@ocaml.doc
        "Information about the cache location: \n\n\
        \ {ul\n\
        \       {-   [NO_CACHE] or [LOCAL]: This value is ignored.\n\
        \           \n\
        \            }\n\
        \       {-   [S3]: This is the S3 bucket name/prefix.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  modes : project_cache_modes option;
      [@ocaml.doc
        "An array of strings that specify the local cache modes. You can use one or more local \
         cache modes at the same time. This is only used for [LOCAL] cache types.\n\n\
        \ Possible values are:\n\
        \ \n\
        \   LOCAL_SOURCE_CACHE  Caches Git metadata for primary and secondary sources. After the \
         cache is created, subsequent builds pull only the change between commits. This mode is a \
         good choice for projects with a clean working directory and a source that is a large Git \
         repository. If you choose this option and your project does not use a Git repository \
         (GitHub, GitHub Enterprise, or Bitbucket), the option is ignored. \n\
        \                       \n\
        \                         LOCAL_DOCKER_LAYER_CACHE  Caches existing Docker layers. This \
         mode is a good choice for projects that build or pull large Docker images. It can prevent \
         the performance issues caused by pulling large Docker images down from the network. \n\
        \                                                   \n\
        \                                                     {ul\n\
        \                                                           {-  You can use a Docker layer \
         cache in the Linux environment only. \n\
        \                                                               \n\
        \                                                                }\n\
        \                                                           {-  The [privileged] flag must \
         be set so that your project has the required Docker permissions. \n\
        \                                                               \n\
        \                                                                }\n\
        \                                                           {-  You should consider the \
         security implications before you use a Docker layer cache. \n\
        \                                                               \n\
        \                                                                }\n\
        \                                                           }\n\
        \     LOCAL_CUSTOM_CACHE  Caches directories you specify in the buildspec file. This mode \
         is a good choice if your build scenario is not suited to one of the other three local \
         cache modes. If you use a custom cache: \n\
        \                         \n\
        \                          {ul\n\
        \                                {-  Only directories can be specified for caching. You \
         cannot specify individual files. \n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Symlinks are used to reference cached directories. \n\
        \                                    \n\
        \                                     }\n\
        \                                {-  Cached directories are linked to your build before it \
         downloads its project sources. Cached items are overridden if a source item has the same \
         name. Directories are specified using cache paths in the buildspec file. \n\
        \                                    \n\
        \                                     }\n\
        \                                }\n\
        \    "]
  cache_namespace : string_ option;
      [@ocaml.doc
        "Defines the scope of the cache. You can use this namespace to share a cache across \
         multiple projects. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/caching-s3.html#caching-s3-sharing}Cache \
         sharing between projects} in the {i CodeBuild User Guide}.\n"]
}
[@@ocaml.doc "Information about the cache for the build project.\n"]

type nonrec build_artifacts = {
  location : string_ option; [@ocaml.doc "Information about the location of the build artifacts.\n"]
  sha256sum : string_ option;
      [@ocaml.doc
        "The SHA-256 hash of the build artifact.\n\n\
        \ You can use this hash along with a checksum tool to confirm file integrity and \
         authenticity.\n\
        \ \n\
        \   This value is available only if the build project's [packaging] value is set to [ZIP].\n\
        \   \n\
        \    "]
  md5sum : string_ option;
      [@ocaml.doc
        "The MD5 hash of the build artifact.\n\n\
        \ You can use this hash along with a checksum tool to confirm file integrity and \
         authenticity.\n\
        \ \n\
        \   This value is available only if the build project's [packaging] value is set to [ZIP].\n\
        \   \n\
        \    "]
  override_artifact_name : wrapper_boolean option;
      [@ocaml.doc
        " If this flag is set, a name specified in the buildspec file overrides the artifact name. \
         The name specified in a buildspec file is calculated at build time and uses the Shell \
         Command Language. For example, you can append a date and time to your artifact name so \
         that it is always unique. \n"]
  encryption_disabled : wrapper_boolean option;
      [@ocaml.doc " Information that tells you if encryption for build artifacts is disabled. \n"]
  artifact_identifier : string_ option;
      [@ocaml.doc " An identifier for this artifact definition. \n"]
  bucket_owner_access : bucket_owner_access option; [@ocaml.doc ""]
}
[@@ocaml.doc "Information about build output artifacts.\n"]

type nonrec build_artifacts_list = build_artifacts list [@@ocaml.doc ""]

type nonrec project_source_version = {
  source_identifier : string_;
      [@ocaml.doc
        "An identifier for a source in the build project. The identifier can only contain \
         alphanumeric characters and underscores, and must be less than 128 characters in length. \n"]
  source_version : string_;
      [@ocaml.doc
        "The source version for the corresponding source identifier. If specified, must be one of:\n\n\
        \ {ul\n\
        \       {-  For CodeCommit: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For GitHub: the commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example, [pr/25]). If a \
         branch name is specified, the branch's HEAD commit ID is used. If not specified, the \
         default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For GitLab: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For Bitbucket: the commit ID, branch name, or tag name that corresponds to the \
         version of the source code you want to build. If a branch name is specified, the branch's \
         HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3: the version ID of the object that represents the build input \
         ZIP file to use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \   "]
}
[@@ocaml.doc " A source identifier and its corresponding version. \n"]

type nonrec project_secondary_source_versions = project_source_version list [@@ocaml.doc ""]

type nonrec build_status_config = {
  context : string_ option;
      [@ocaml.doc
        "Specifies the context of the build status CodeBuild sends to the source provider. The \
         usage of this parameter depends on the source provider.\n\n\
        \  Bitbucket  This parameter is used for the [name] parameter in the Bitbucket commit \
         status. For more information, see \
         {{:https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/commit/%7Bnode%7D/statuses/build}build} \
         in the Bitbucket API documentation.\n\
        \             \n\
        \               GitHub/GitHub Enterprise Server  This parameter is used for the [context] \
         parameter in the GitHub commit status. For more information, see \
         {{:https://developer.github.com/v3/repos/statuses/#create-a-commit-status}Create a commit \
         status} in the GitHub developer guide.\n\
        \                                                \n\
        \                                                  "]
  target_url : string_ option;
      [@ocaml.doc
        "Specifies the target url of the build status CodeBuild sends to the source provider. The \
         usage of this parameter depends on the source provider.\n\n\
        \  Bitbucket  This parameter is used for the [url] parameter in the Bitbucket commit \
         status. For more information, see \
         {{:https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/commit/%7Bnode%7D/statuses/build}build} \
         in the Bitbucket API documentation.\n\
        \             \n\
        \               GitHub/GitHub Enterprise Server  This parameter is used for the \
         [target_url] parameter in the GitHub commit status. For more information, see \
         {{:https://developer.github.com/v3/repos/statuses/#create-a-commit-status}Create a commit \
         status} in the GitHub developer guide.\n\
        \                                                \n\
        \                                                  "]
}
[@@ocaml.doc
  "Contains information that defines how the CodeBuild build project reports the build status to \
   the source provider. \n"]

type nonrec source_auth_type =
  | OAUTH [@ocaml.doc ""]
  | CODECONNECTIONS [@ocaml.doc ""]
  | SECRETS_MANAGER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_auth = {
  type_ : source_auth_type;
      [@ocaml.doc
        "The authorization type to use. Valid options are OAUTH, CODECONNECTIONS, or \
         SECRETS_MANAGER.\n"]
  resource : string_ option;
      [@ocaml.doc "The resource value that applies to the specified authorization type.\n"]
}
[@@ocaml.doc
  "Information about the authorization settings for CodeBuild to access the source code to be built.\n"]

type nonrec git_submodules_config = {
  fetch_submodules : wrapper_boolean;
      [@ocaml.doc " Set to true to fetch Git submodules for your CodeBuild build project. \n"]
}
[@@ocaml.doc
  " Information about the Git submodules configuration for an CodeBuild build project. \n"]

type nonrec git_clone_depth = int [@@ocaml.doc ""]

type nonrec source_type =
  | CODECOMMIT [@ocaml.doc ""]
  | CODEPIPELINE [@ocaml.doc ""]
  | GITHUB [@ocaml.doc ""]
  | GITLAB [@ocaml.doc ""]
  | GITLAB_SELF_MANAGED [@ocaml.doc ""]
  | S3 [@ocaml.doc ""]
  | BITBUCKET [@ocaml.doc ""]
  | GITHUB_ENTERPRISE [@ocaml.doc ""]
  | NO_SOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec project_source = {
  type_ : source_type;
      [@ocaml.doc
        "The type of repository that contains the source code to be built. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [BITBUCKET]: The source code is in a Bitbucket repository.\n\
        \           \n\
        \            }\n\
        \       {-   [CODECOMMIT]: The source code is in an CodeCommit repository.\n\
        \           \n\
        \            }\n\
        \       {-   [CODEPIPELINE]: The source code settings are specified in the source action \
         of a pipeline in CodePipeline.\n\
        \           \n\
        \            }\n\
        \       {-   [GITHUB]: The source code is in a GitHub repository.\n\
        \           \n\
        \            }\n\
        \       {-   [GITHUB_ENTERPRISE]: The source code is in a GitHub Enterprise Server \
         repository.\n\
        \           \n\
        \            }\n\
        \       {-   [GITLAB]: The source code is in a GitLab repository.\n\
        \           \n\
        \            }\n\
        \       {-   [GITLAB_SELF_MANAGED]: The source code is in a self-managed GitLab repository.\n\
        \           \n\
        \            }\n\
        \       {-   [NO_SOURCE]: The project does not have input source code.\n\
        \           \n\
        \            }\n\
        \       {-   [S3]: The source code is in an Amazon S3 bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  location : string_ option;
      [@ocaml.doc
        "Information about the location of the source code to be built. Valid values include:\n\n\
        \ {ul\n\
        \       {-  For source code settings that are specified in the source action of a pipeline \
         in CodePipeline, [location] should not be specified. If it is specified, CodePipeline \
         ignores it. This is because CodePipeline uses the settings in a pipeline's source action \
         instead of this value.\n\
        \           \n\
        \            }\n\
        \       {-  For source code in an CodeCommit repository, the HTTPS clone URL to the \
         repository that contains the source code and the buildspec file (for example, \n\
        \           {[\n\
        \           https://git-codecommit..amazonaws.com/v1/repos/\n\
        \           ]}\n\
        \           ).\n\
        \           \n\
        \            }\n\
        \       {-  For source code in an Amazon S3 input bucket, one of the following. \n\
        \           \n\
        \            {ul\n\
        \                  {-  The path to the ZIP file that contains the source code (for example, \n\
        \                      {[\n\
        \                      //.zip\n\
        \                      ]}\n\
        \                      ). \n\
        \                      \n\
        \                       }\n\
        \                  {-  The path to the folder that contains the source code (for example, \n\
        \                      {[\n\
        \                      ///\n\
        \                      ]}\n\
        \                      ). \n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  For source code in a GitHub repository, the HTTPS clone URL to the repository \
         that contains the source and the buildspec file. You must connect your Amazon Web \
         Services account to your GitHub account. Use the CodeBuild console to start creating a \
         build project. When you use the console to connect (or reconnect) with GitHub, on the \
         GitHub {b Authorize application} page, for {b Organization access}, choose {b Request \
         access} next to each repository you want to allow CodeBuild to have access to, and then \
         choose {b Authorize application}. (After you have connected to your GitHub account, you \
         do not need to finish creating the build project. You can leave the CodeBuild console.) \
         To instruct CodeBuild to use this connection, in the [source] object, set the [auth] \
         object's [type] value to [OAUTH].\n\
        \           \n\
        \            }\n\
        \       {-  For source code in an GitLab or self-managed GitLab repository, the HTTPS \
         clone URL to the repository that contains the source and the buildspec file. You must \
         connect your Amazon Web Services account to your GitLab account. Use the CodeBuild \
         console to start creating a build project. When you use the console to connect (or \
         reconnect) with GitLab, on the Connections {b Authorize application} page, choose {b \
         Authorize}. Then on the CodeConnections {b Create GitLab connection} page, choose {b \
         Connect to GitLab}. (After you have connected to your GitLab account, you do not need to \
         finish creating the build project. You can leave the CodeBuild console.) To instruct \
         CodeBuild to override the default connection and use this connection instead, set the \
         [auth] object's [type] value to [CODECONNECTIONS] in the [source] object.\n\
        \           \n\
        \            }\n\
        \       {-  For source code in a Bitbucket repository, the HTTPS clone URL to the \
         repository that contains the source and the buildspec file. You must connect your Amazon \
         Web Services account to your Bitbucket account. Use the CodeBuild console to start \
         creating a build project. When you use the console to connect (or reconnect) with \
         Bitbucket, on the Bitbucket {b Confirm access to your account} page, choose {b Grant \
         access}. (After you have connected to your Bitbucket account, you do not need to finish \
         creating the build project. You can leave the CodeBuild console.) To instruct CodeBuild \
         to use this connection, in the [source] object, set the [auth] object's [type] value to \
         [OAUTH].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you specify [CODEPIPELINE] for the [Type] property, don't specify this property. \
         For all of the other types, you must specify [Location]. \n\
        \   "]
  git_clone_depth : git_clone_depth option;
      [@ocaml.doc "Information about the Git clone depth for the build project.\n"]
  git_submodules_config : git_submodules_config option;
      [@ocaml.doc " Information about the Git submodules configuration for the build project. \n"]
  buildspec : string_ option;
      [@ocaml.doc
        "The buildspec file declaration to use for the builds in this build project.\n\n\
        \  If this value is set, it can be either an inline buildspec definition, the path to an \
         alternate buildspec file relative to the value of the built-in [CODEBUILD_SRC_DIR] \
         environment variable, or the path to an S3 bucket. The bucket must be in the same Amazon \
         Web Services Region as the build project. Specify the buildspec file using its ARN (for \
         example, [arn:aws:s3:::my-codebuild-sample2/buildspec.yml]). If this value is not \
         provided or is set to an empty string, the source code must contain a buildspec file in \
         its root directory. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage}Buildspec \
         File Name and Storage Location}. \n\
        \ "]
  auth : source_auth option;
      [@ocaml.doc
        "Information about the authorization settings for CodeBuild to access the source code to \
         be built.\n"]
  report_build_status : wrapper_boolean option;
      [@ocaml.doc
        " Set to true to report the status of a build's start and finish to your source provider. \
         This option is valid only when your source provider is GitHub, GitHub Enterprise, GitLab, \
         GitLab Self Managed, GitLab, GitLab Self Managed, or Bitbucket. If this is set and you \
         use a different source provider, an [invalidInputException] is thrown. \n\n\
        \ To be able to report the build status to the source provider, the user associated with \
         the source provider must have write access to the repo. If the user does not have write \
         access, the build status cannot be updated. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/access-tokens.html}Source \
         provider access} in the {i CodeBuild User Guide}.\n\
        \ \n\
        \  The status of a build triggered by a webhook is always reported to your source provider. \n\
        \  \n\
        \   If your project's builds are triggered by a webhook, you must push a new commit to the \
         repo for a change to this property to take effect.\n\
        \   "]
  build_status_config : build_status_config option;
      [@ocaml.doc
        "Contains information that defines how the build project reports the build status to the \
         source provider. This option is only used when the source provider is [GITHUB], \
         [GITHUB_ENTERPRISE], or [BITBUCKET].\n"]
  insecure_ssl : wrapper_boolean option;
      [@ocaml.doc
        "Enable this flag to ignore SSL warnings while connecting to the project source code.\n"]
  source_identifier : string_ option;
      [@ocaml.doc
        "An identifier for this project source. The identifier can only contain alphanumeric \
         characters and underscores, and must be less than 128 characters in length. \n"]
}
[@@ocaml.doc "Information about the build input source code for the build project.\n"]

type nonrec project_sources = project_source list [@@ocaml.doc ""]

type nonrec phase_context = {
  status_code : string_ option; [@ocaml.doc "The status code for the context of the build phase.\n"]
  message : string_ option;
      [@ocaml.doc
        "An explanation of the build phase's context. This might include a command ID and an exit \
         code.\n"]
}
[@@ocaml.doc
  "Additional information about a build phase that has an error. You can use this information for \
   troubleshooting.\n"]

type nonrec phase_contexts = phase_context list [@@ocaml.doc ""]

type nonrec build_batch_phase_type =
  | SUBMITTED [@ocaml.doc ""]
  | DOWNLOAD_BATCHSPEC [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMBINE_ARTIFACTS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec build_batch_phase = {
  phase_type : build_batch_phase_type option;
      [@ocaml.doc
        "The name of the batch build phase. Valid values include:\n\n\
        \  COMBINE_ARTIFACTS  Build output artifacts are being combined and uploaded to the output \
         location.\n\
        \                     \n\
        \                       DOWNLOAD_BATCHSPEC  The batch build specification is being \
         downloaded.\n\
        \                                           \n\
        \                                             FAILED  One or more of the builds failed.\n\
        \                                                     \n\
        \                                                       IN_PROGRESS  The batch build is in \
         progress.\n\
        \                                                                    \n\
        \                                                                      STOPPED  The batch \
         build was stopped.\n\
        \                                                                               \n\
        \                                                                                 \
         SUBMITTED  \n\
         The btach build has been submitted.\n\n\
        \  SUCCEEDED  The batch build succeeded.\n\
        \             \n\
        \               "]
  phase_status : status_type option;
      [@ocaml.doc
        "The current status of the batch build phase. Valid values include:\n\n\
        \  FAILED  The build phase failed.\n\
        \          \n\
        \            FAULT  The build phase faulted.\n\
        \                   \n\
        \                     IN_PROGRESS  The build phase is still in progress.\n\
        \                                  \n\
        \                                    STOPPED  The build phase stopped.\n\
        \                                             \n\
        \                                               SUCCEEDED  The build phase succeeded.\n\
        \                                                          \n\
        \                                                            TIMED_OUT  The build phase \
         timed out.\n\
        \                                                                       \n\
        \                                                                         "]
  start_time : timestamp option;
      [@ocaml.doc "When the batch build phase started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the batch build phase ended, expressed in Unix time format.\n"]
  duration_in_seconds : wrapper_long option;
      [@ocaml.doc
        "How long, in seconds, between the starting and ending times of the batch build's phase.\n"]
  contexts : phase_contexts option;
      [@ocaml.doc
        "Additional information about the batch build phase. Especially to help troubleshoot a \
         failed batch build.\n"]
}
[@@ocaml.doc "Contains information about a stage for a batch build.\n"]

type nonrec build_batch_phases = build_batch_phase list [@@ocaml.doc ""]

type nonrec build_batch = {
  id : non_empty_string option; [@ocaml.doc "The identifier of the batch build.\n"]
  arn : non_empty_string option; [@ocaml.doc "The ARN of the batch build.\n"]
  start_time : timestamp option; [@ocaml.doc "The date and time that the batch build started.\n"]
  end_time : timestamp option; [@ocaml.doc "The date and time that the batch build ended.\n"]
  current_phase : string_ option; [@ocaml.doc "The current phase of the batch build.\n"]
  build_batch_status : status_type option; [@ocaml.doc "The status of the batch build.\n"]
  source_version : non_empty_string option;
      [@ocaml.doc "The identifier of the version of the source code to be built.\n"]
  resolved_source_version : non_empty_string option;
      [@ocaml.doc
        "The identifier of the resolved version of this batch build's source code.\n\n\
        \ {ul\n\
        \       {-  For CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID.\n\
        \           \n\
        \            }\n\
        \       {-  For CodePipeline, the source revision provided by CodePipeline.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3, this does not apply.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  project_name : non_empty_string option; [@ocaml.doc "The name of the batch build project.\n"]
  phases : build_batch_phases option;
      [@ocaml.doc
        "An array of [BuildBatchPhase] objects the specify the phases of the batch build.\n"]
  source : project_source option; [@ocaml.doc ""]
  secondary_sources : project_sources option;
      [@ocaml.doc
        "An array of [ProjectSource] objects that define the sources for the batch build.\n"]
  secondary_source_versions : project_secondary_source_versions option;
      [@ocaml.doc
        "An array of [ProjectSourceVersion] objects. Each [ProjectSourceVersion] must be one of: \n\n\
        \ {ul\n\
        \       {-  For CodeCommit: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For GitHub: the commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example, [pr/25]). If a \
         branch name is specified, the branch's HEAD commit ID is used. If not specified, the \
         default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Bitbucket: the commit ID, branch name, or tag name that corresponds to the \
         version of the source code you want to build. If a branch name is specified, the branch's \
         HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3: the version ID of the object that represents the build input \
         ZIP file to use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  artifacts : build_artifacts option;
      [@ocaml.doc
        "A [BuildArtifacts] object the defines the build artifacts for this batch build.\n"]
  secondary_artifacts : build_artifacts_list option;
      [@ocaml.doc
        "An array of [BuildArtifacts] objects the define the build artifacts for this batch build.\n"]
  cache : project_cache option; [@ocaml.doc ""]
  environment : project_environment option; [@ocaml.doc ""]
  service_role : non_empty_string option;
      [@ocaml.doc "The name of a service role used for builds in the batch.\n"]
  log_config : logs_config option; [@ocaml.doc ""]
  build_timeout_in_minutes : wrapper_int option;
      [@ocaml.doc
        "Specifies the maximum amount of time, in minutes, that the build in a batch must be \
         completed in.\n"]
  queued_timeout_in_minutes : wrapper_int option;
      [@ocaml.doc
        "Specifies the amount of time, in minutes, that the batch build is allowed to be queued \
         before it times out.\n"]
  complete : boolean_ option; [@ocaml.doc "Indicates if the batch build is complete.\n"]
  initiator : string_ option;
      [@ocaml.doc
        "The entity that started the batch build. Valid values include:\n\n\
        \ {ul\n\
        \       {-  If CodePipeline started the build, the pipeline's name (for example, \
         [codepipeline/my-demo-pipeline]).\n\
        \           \n\
        \            }\n\
        \       {-  If a user started the build, the user's name.\n\
        \           \n\
        \            }\n\
        \       {-  If the Jenkins plugin for CodeBuild started the build, the string \
         [CodeBuild-Jenkins-Plugin].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option; [@ocaml.doc ""]
  encryption_key : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) to be used for encrypting the batch \
         build output artifacts.\n\n\
        \  You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ).\n\
        \    "]
  build_batch_number : wrapper_long option;
      [@ocaml.doc
        "The number of the batch build. For each project, the [buildBatchNumber] of its first \
         batch build is [1]. The [buildBatchNumber] of each subsequent batch build is incremented \
         by [1]. If a batch build is deleted, the [buildBatchNumber] of other batch builds does \
         not change.\n"]
  file_system_locations : project_file_system_locations option;
      [@ocaml.doc
        "An array of [ProjectFileSystemLocation] objects for the batch build project. A \
         [ProjectFileSystemLocation] object specifies the [identifier], [location], \
         [mountOptions], [mountPoint], and [type] of a file system created using Amazon Elastic \
         File System. \n"]
  build_batch_config : project_build_batch_config option; [@ocaml.doc ""]
  build_groups : build_groups option;
      [@ocaml.doc
        "An array of [BuildGroup] objects that define the build groups for the batch build.\n"]
  debug_session_enabled : wrapper_boolean option;
      [@ocaml.doc
        "Specifies if session debugging is enabled for this batch build. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html}Viewing a \
         running build in Session Manager}. Batch session debugging is not supported for matrix \
         batch builds.\n"]
  report_arns : build_report_arns option;
      [@ocaml.doc
        "An array that contains the ARNs of reports created by merging reports from builds \
         associated with this batch build.\n"]
}
[@@ocaml.doc "Contains information about a batch build.\n"]

type nonrec build_batches = build_batch list [@@ocaml.doc ""]

type nonrec batch_get_build_batches_output = {
  build_batches : build_batches option;
      [@ocaml.doc "An array of [BuildBatch] objects that represent the retrieved batch builds.\n"]
  build_batches_not_found : build_batch_ids option;
      [@ocaml.doc
        "An array that contains the identifiers of any batch builds that are not found.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_build_batches_input = {
  ids : build_batch_ids;
      [@ocaml.doc "An array that contains the batch build identifiers to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec debug_session = {
  session_enabled : wrapper_boolean option;
      [@ocaml.doc "Specifies if session debugging is enabled for this build.\n"]
  session_target : non_empty_string option;
      [@ocaml.doc
        "Contains the identifier of the Session Manager session used for the build. To work with \
         the paused build, you open this session to examine, control, and resume the build.\n"]
}
[@@ocaml.doc
  "Contains information about the debug session for a build. For more information, see \
   {{:https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html}Viewing a \
   running build in Session Manager}.\n"]

type nonrec exported_environment_variable = {
  name : non_empty_string option; [@ocaml.doc "The name of the exported environment variable.\n"]
  value : string_ option; [@ocaml.doc "The value assigned to the exported environment variable.\n"]
}
[@@ocaml.doc
  "Contains information about an exported environment variable. \n\n\
  \ Exported environment variables are used in conjunction with CodePipeline to export environment \
   variables from the current build stage to subsequent stages in the pipeline. For more \
   information, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/actions-variables.html}Working \
   with variables} in the {i CodePipeline User Guide}.\n\
  \ \n\
  \    During a build, the value of a variable is available starting with the [install] phase. It \
   can be updated between the start of the [install] phase and the end of the [post_build] phase. \
   After the [post_build] phase ends, the value of exported variables cannot change.\n\
  \   \n\
  \    "]

type nonrec exported_environment_variables = exported_environment_variable list [@@ocaml.doc ""]

type nonrec network_interface = {
  subnet_id : non_empty_string option; [@ocaml.doc "The ID of the subnet.\n"]
  network_interface_id : non_empty_string option; [@ocaml.doc "The ID of the network interface.\n"]
}
[@@ocaml.doc "Describes a network interface.\n"]

type nonrec logs_location = {
  group_name : string_ option;
      [@ocaml.doc "The name of the CloudWatch Logs group for the build logs.\n"]
  stream_name : string_ option;
      [@ocaml.doc "The name of the CloudWatch Logs stream for the build logs.\n"]
  deep_link : string_ option;
      [@ocaml.doc
        "The URL to an individual build log in CloudWatch Logs. The log stream is created during \
         the PROVISIONING phase of a build and the [deeplink] will not be valid until it is \
         created.\n"]
  s3_deep_link : string_ option; [@ocaml.doc " The URL to a build log in an S3 bucket. \n"]
  cloud_watch_logs_arn : string_ option;
      [@ocaml.doc
        "The ARN of the CloudWatch Logs stream for a build execution. Its format is \
         [arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}:log-stream:${LogStreamName}]. \
         The CloudWatch Logs stream is created during the PROVISIONING phase of a build and the \
         ARN will not be valid until it is created. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatchlogs.html#amazoncloudwatchlogs-resources-for-iam-policies}Resources \
         Defined by CloudWatch Logs}.\n"]
  s3_logs_arn : string_ option;
      [@ocaml.doc
        " The ARN of S3 logs for a build project. Its format is \
         [arn:${Partition}:s3:::${BucketName}/${ObjectName}]. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html#amazons3-resources-for-iam-policies}Resources \
         Defined by Amazon S3}. \n"]
  cloud_watch_logs : cloud_watch_logs_config option;
      [@ocaml.doc " Information about CloudWatch Logs for a build project. \n"]
  s3_logs : s3_logs_config option; [@ocaml.doc " Information about S3 logs for a build project. \n"]
}
[@@ocaml.doc "Information about build logs in CloudWatch Logs.\n"]

type nonrec build_phase_type =
  | SUBMITTED [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | DOWNLOAD_SOURCE [@ocaml.doc ""]
  | INSTALL [@ocaml.doc ""]
  | PRE_BUILD [@ocaml.doc ""]
  | BUILD [@ocaml.doc ""]
  | POST_BUILD [@ocaml.doc ""]
  | UPLOAD_ARTIFACTS [@ocaml.doc ""]
  | FINALIZING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec build_phase = {
  phase_type : build_phase_type option;
      [@ocaml.doc
        "The name of the build phase. Valid values include:\n\n\
        \  BUILD  Core build activities typically occur in this build phase.\n\
        \         \n\
        \           COMPLETED  The build has been completed.\n\
        \                      \n\
        \                        DOWNLOAD_SOURCE  Source code is being downloaded in this build \
         phase.\n\
        \                                         \n\
        \                                           FINALIZING  The build process is completing in \
         this build phase.\n\
        \                                                       \n\
        \                                                         INSTALL  Installation activities \
         typically occur in this build phase.\n\
        \                                                                  \n\
        \                                                                    POST_BUILD  \
         Post-build activities typically occur in this build phase.\n\
        \                                                                                \n\
        \                                                                                  \
         PRE_BUILD  \n\
         Pre-build activities typically occur in this build phase.\n\n\
        \  PROVISIONING  The build environment is being set up.\n\
        \                \n\
        \                  QUEUED  The build has been submitted and is queued behind other \
         submitted builds.\n\
        \                          \n\
        \                            SUBMITTED  The build has been submitted.\n\
        \                                       \n\
        \                                         UPLOAD_ARTIFACTS  Build output artifacts are \
         being uploaded to the output location.\n\
        \                                                           \n\
        \                                                             "]
  phase_status : status_type option;
      [@ocaml.doc
        "The current status of the build phase. Valid values include:\n\n\
        \  FAILED  The build phase failed.\n\
        \          \n\
        \            FAULT  The build phase faulted.\n\
        \                   \n\
        \                     IN_PROGRESS  The build phase is still in progress.\n\
        \                                  \n\
        \                                    STOPPED  The build phase stopped.\n\
        \                                             \n\
        \                                               SUCCEEDED  The build phase succeeded.\n\
        \                                                          \n\
        \                                                            TIMED_OUT  The build phase \
         timed out.\n\
        \                                                                       \n\
        \                                                                         "]
  start_time : timestamp option;
      [@ocaml.doc "When the build phase started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the build phase ended, expressed in Unix time format.\n"]
  duration_in_seconds : wrapper_long option;
      [@ocaml.doc
        "How long, in seconds, between the starting and ending times of the build's phase.\n"]
  contexts : phase_contexts option;
      [@ocaml.doc
        "Additional information about a build phase, especially to help troubleshoot a failed build.\n"]
}
[@@ocaml.doc "Information about a stage for a build.\n"]

type nonrec build_phases = build_phase list [@@ocaml.doc ""]

type nonrec build = {
  id : non_empty_string option; [@ocaml.doc "The unique ID for the build.\n"]
  arn : non_empty_string option; [@ocaml.doc "The Amazon Resource Name (ARN) of the build.\n"]
  build_number : wrapper_long option;
      [@ocaml.doc
        "The number of the build. For each project, the [buildNumber] of its first build is [1]. \
         The [buildNumber] of each subsequent build is incremented by [1]. If a build is deleted, \
         the [buildNumber] of other builds does not change.\n"]
  start_time : timestamp option;
      [@ocaml.doc "When the build process started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the build process ended, expressed in Unix time format.\n"]
  current_phase : string_ option; [@ocaml.doc "The current build phase.\n"]
  build_status : status_type option;
      [@ocaml.doc
        "The current status of the build. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [FAILED]: The build failed.\n\
        \           \n\
        \            }\n\
        \       {-   [FAULT]: The build faulted.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS]: The build is still in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED]: The build stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED]: The build succeeded.\n\
        \           \n\
        \            }\n\
        \       {-   [TIMED_OUT]: The build timed out.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  source_version : non_empty_string option;
      [@ocaml.doc
        "Any version identifier for the version of the source code to be built. If [sourceVersion] \
         is specified at the project level, then this [sourceVersion] (at the build level) takes \
         precedence. \n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \ "]
  resolved_source_version : non_empty_string option;
      [@ocaml.doc
        " An identifier for the version of this build's source code. \n\n\
        \ {ul\n\
        \       {-   For CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID. \n\
        \           \n\
        \            }\n\
        \       {-   For CodePipeline, the source revision provided by CodePipeline. \n\
        \           \n\
        \            }\n\
        \       {-   For Amazon S3, this does not apply. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  project_name : non_empty_string option; [@ocaml.doc "The name of the CodeBuild project.\n"]
  phases : build_phases option;
      [@ocaml.doc
        "Information about all previous build phases that are complete and information about any \
         current build phase that is not yet complete.\n"]
  source : project_source option; [@ocaml.doc "Information about the source code to be built.\n"]
  secondary_sources : project_sources option;
      [@ocaml.doc " An array of [ProjectSource] objects. \n"]
  secondary_source_versions : project_secondary_source_versions option;
      [@ocaml.doc
        " An array of [ProjectSourceVersion] objects. Each [ProjectSourceVersion] must be one of: \n\n\
        \ {ul\n\
        \       {-  For CodeCommit: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For GitHub: the commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example, [pr/25]). If a \
         branch name is specified, the branch's HEAD commit ID is used. If not specified, the \
         default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Bitbucket: the commit ID, branch name, or tag name that corresponds to the \
         version of the source code you want to build. If a branch name is specified, the branch's \
         HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3: the version ID of the object that represents the build input \
         ZIP file to use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  artifacts : build_artifacts option;
      [@ocaml.doc "Information about the output artifacts for the build.\n"]
  secondary_artifacts : build_artifacts_list option;
      [@ocaml.doc " An array of [ProjectArtifacts] objects. \n"]
  cache : project_cache option; [@ocaml.doc "Information about the cache for the build.\n"]
  environment : project_environment option;
      [@ocaml.doc "Information about the build environment for this build.\n"]
  service_role : non_empty_string option;
      [@ocaml.doc "The name of a service role used for this build.\n"]
  logs : logs_location option;
      [@ocaml.doc "Information about the build's logs in CloudWatch Logs.\n"]
  timeout_in_minutes : wrapper_int option;
      [@ocaml.doc
        "How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out \
         this build if it does not get marked as completed.\n"]
  queued_timeout_in_minutes : wrapper_int option;
      [@ocaml.doc " The number of minutes a build is allowed to be queued before it times out. \n"]
  build_complete : boolean_ option;
      [@ocaml.doc "Whether the build is complete. True if complete; otherwise, false.\n"]
  initiator : string_ option;
      [@ocaml.doc
        "The entity that started the build. Valid values include:\n\n\
        \ {ul\n\
        \       {-  If CodePipeline started the build, the pipeline's name (for example, \
         [codepipeline/my-demo-pipeline]).\n\
        \           \n\
        \            }\n\
        \       {-  If a user started the build, the user's name (for example, [MyUserName]).\n\
        \           \n\
        \            }\n\
        \       {-  If the Jenkins plugin for CodeBuild started the build, the string \
         [CodeBuild-Jenkins-Plugin].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "If your CodeBuild project accesses resources in an Amazon VPC, you provide this parameter \
         that identifies the VPC ID and the list of security group IDs and subnet IDs. The \
         security groups and subnets must belong to the same VPC. You must provide at least one \
         security group and one subnet ID.\n"]
  network_interface : network_interface option; [@ocaml.doc "Describes a network interface.\n"]
  encryption_key : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) to be used for encrypting the build \
         output artifacts.\n\n\
        \   You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ).\n\
        \    "]
  exported_environment_variables : exported_environment_variables option;
      [@ocaml.doc
        "A list of exported environment variables for this build.\n\n\
        \ Exported environment variables are used in conjunction with CodePipeline to export \
         environment variables from the current build stage to subsequent stages in the pipeline. \
         For more information, see \
         {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/actions-variables.html}Working \
         with variables} in the {i CodePipeline User Guide}.\n\
        \ "]
  report_arns : build_report_arns option;
      [@ocaml.doc " An array of the ARNs associated with this build's reports. \n"]
  file_system_locations : project_file_system_locations option;
      [@ocaml.doc
        " An array of [ProjectFileSystemLocation] objects for a CodeBuild build project. A \
         [ProjectFileSystemLocation] object specifies the [identifier], [location], \
         [mountOptions], [mountPoint], and [type] of a file system created using Amazon Elastic \
         File System. \n"]
  debug_session : debug_session option;
      [@ocaml.doc "Contains information about the debug session for this build.\n"]
  build_batch_arn : string_ option;
      [@ocaml.doc "The ARN of the batch build that this build is a member of, if applicable.\n"]
  auto_retry_config : auto_retry_config option;
      [@ocaml.doc "Information about the auto-retry configuration for the build.\n"]
}
[@@ocaml.doc "Information about a build.\n"]

type nonrec builds = build list [@@ocaml.doc ""]

type nonrec batch_get_builds_output = {
  builds : builds option; [@ocaml.doc "Information about the requested builds.\n"]
  builds_not_found : build_ids option;
      [@ocaml.doc "The IDs of builds for which information could not be found.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_builds_input = { ids : build_ids [@ocaml.doc "The IDs of the builds.\n"] }
[@@ocaml.doc ""]

type nonrec command_execution_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec sensitive_non_empty_string = string [@@ocaml.doc ""]

type nonrec command_type = SHELL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec command_execution = {
  id : non_empty_string option; [@ocaml.doc "The ID of the command execution.\n"]
  sandbox_id : non_empty_string option; [@ocaml.doc "A [sandboxId].\n"]
  submit_time : timestamp option;
      [@ocaml.doc
        "When the command execution process was initially submitted, expressed in Unix time format.\n"]
  start_time : timestamp option;
      [@ocaml.doc "When the command execution process started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the command execution process ended, expressed in Unix time format.\n"]
  status : non_empty_string option; [@ocaml.doc "The status of the command execution.\n"]
  command : sensitive_non_empty_string option;
      [@ocaml.doc "The command that needs to be executed.\n"]
  type_ : command_type option; [@ocaml.doc "The command type.\n"]
  exit_code : non_empty_string option; [@ocaml.doc "The exit code to return upon completion.\n"]
  standard_output_content : sensitive_non_empty_string option;
      [@ocaml.doc "The text written by the command to stdout.\n"]
  standard_err_content : sensitive_non_empty_string option;
      [@ocaml.doc "The text written by the command to stderr.\n"]
  logs : logs_location option; [@ocaml.doc ""]
  sandbox_arn : non_empty_string option; [@ocaml.doc "A [sandboxArn].\n"]
}
[@@ocaml.doc "Contains command execution information.\n"]

type nonrec command_executions = command_execution list [@@ocaml.doc ""]

type nonrec batch_get_command_executions_output = {
  command_executions : command_executions option;
      [@ocaml.doc "Information about the requested command executions.\n"]
  command_executions_not_found : command_execution_ids option;
      [@ocaml.doc "The IDs of command executions for which information could not be found.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_command_executions_input = {
  sandbox_id : non_empty_string; [@ocaml.doc "A [sandboxId] or [sandboxArn].\n"]
  command_execution_ids : command_execution_ids;
      [@ocaml.doc "A comma separated list of [commandExecutionIds].\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_names = non_empty_string list [@@ocaml.doc ""]

type nonrec value_input = string [@@ocaml.doc ""]

type nonrec key_input = string [@@ocaml.doc ""]

type nonrec tag = {
  key : key_input option; [@ocaml.doc "The tag's key.\n"]
  value : value_input option; [@ocaml.doc "The tag's value.\n"]
}
[@@ocaml.doc
  "A tag, consisting of a key and a value.\n\n\
  \ This tag is available for use by Amazon Web Services services that support tags in CodeBuild.\n\
  \ "]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec fleet_proxy_rule_entities = string_ list [@@ocaml.doc ""]

type nonrec fleet_proxy_rule_effect_type = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet_proxy_rule_type = DOMAIN [@ocaml.doc ""] | IP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec fleet_proxy_rule = {
  type_ : fleet_proxy_rule_type; [@ocaml.doc "The type of proxy rule.\n"]
  effect_ : fleet_proxy_rule_effect_type; [@ocaml.doc "The behavior of the proxy rule.\n"]
  entities : fleet_proxy_rule_entities; [@ocaml.doc "The destination of the proxy rule.\n"]
}
[@@ocaml.doc "Information about the proxy rule for your reserved capacity instances.\n"]

type nonrec fleet_proxy_rules = fleet_proxy_rule list [@@ocaml.doc ""]

type nonrec fleet_proxy_rule_behavior = ALLOW_ALL [@ocaml.doc ""] | DENY_ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec proxy_configuration = {
  default_behavior : fleet_proxy_rule_behavior option;
      [@ocaml.doc "The default behavior of outgoing traffic.\n"]
  ordered_proxy_rules : fleet_proxy_rules option;
      [@ocaml.doc
        "An array of [FleetProxyRule] objects that represent the specified destination domains or \
         IPs to allow or deny network access control to.\n"]
}
[@@ocaml.doc
  "Information about the proxy configurations that apply network access control to your reserved \
   capacity instances.\n"]

type nonrec fleet_overflow_behavior = QUEUE [@ocaml.doc ""] | ON_DEMAND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet_capacity = int [@@ocaml.doc ""]

type nonrec wrapper_double = float [@@ocaml.doc ""]

type nonrec fleet_scaling_metric_type = FLEET_UTILIZATION_RATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec target_tracking_scaling_configuration = {
  metric_type : fleet_scaling_metric_type option;
      [@ocaml.doc "The metric type to determine auto-scaling.\n"]
  target_value : wrapper_double option;
      [@ocaml.doc "The value of [metricType] when to start scaling.\n"]
}
[@@ocaml.doc "Defines when a new instance is auto-scaled into the compute fleet.\n"]

type nonrec target_tracking_scaling_configurations = target_tracking_scaling_configuration list
[@@ocaml.doc ""]

type nonrec fleet_scaling_type = TARGET_TRACKING_SCALING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scaling_configuration_output = {
  scaling_type : fleet_scaling_type option; [@ocaml.doc "The scaling type for a compute fleet.\n"]
  target_tracking_scaling_configs : target_tracking_scaling_configurations option;
      [@ocaml.doc "A list of [TargetTrackingScalingConfiguration] objects.\n"]
  max_capacity : fleet_capacity option;
      [@ocaml.doc "The maximum number of instances in the \239\172\130eet when auto-scaling.\n"]
  desired_capacity : fleet_capacity option;
      [@ocaml.doc "The desired number of instances in the \239\172\130eet when auto-scaling.\n"]
}
[@@ocaml.doc "The scaling configuration output of a compute fleet.\n"]

type nonrec fleet_context_code =
  | CREATE_FAILED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | ACTION_REQUIRED [@ocaml.doc ""]
  | PENDING_DELETION [@ocaml.doc ""]
  | INSUFFICIENT_CAPACITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet_status_code =
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ROTATING [@ocaml.doc ""]
  | PENDING_DELETION [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | UPDATE_ROLLBACK_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet_status = {
  status_code : fleet_status_code option;
      [@ocaml.doc
        "The status code of the compute fleet. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [CREATING]: The compute fleet is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING]: The compute fleet is being updated.\n\
        \           \n\
        \            }\n\
        \       {-   [ROTATING]: The compute fleet is being rotated.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_DELETION]: The compute fleet is pending deletion.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING]: The compute fleet is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_FAILED]: The compute fleet has failed to create.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_ROLLBACK_FAILED]: The compute fleet has failed to update and could \
         not rollback to previous state.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE]: The compute fleet has succeeded and is active.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  context : fleet_context_code option;
      [@ocaml.doc
        "Additional information about a compute fleet. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [CREATE_FAILED]: The compute fleet has failed to create.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_FAILED]: The compute fleet has failed to update.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : string_ option; [@ocaml.doc "A message associated with the status of a compute fleet.\n"]
}
[@@ocaml.doc "The status of the compute fleet.\n"]

type nonrec fleet_name = string [@@ocaml.doc ""]

type nonrec fleet = {
  arn : non_empty_string option; [@ocaml.doc "The ARN of the compute fleet.\n"]
  name : fleet_name option; [@ocaml.doc "The name of the compute fleet.\n"]
  id : non_empty_string option; [@ocaml.doc "The ID of the compute fleet.\n"]
  created : timestamp option; [@ocaml.doc "The time at which the compute fleet was created.\n"]
  last_modified : timestamp option;
      [@ocaml.doc "The time at which the compute fleet was last modified.\n"]
  status : fleet_status option; [@ocaml.doc "The status of the compute fleet.\n"]
  base_capacity : fleet_capacity option;
      [@ocaml.doc
        "The initial number of machines allocated to the compute \239\172\130eet, which \
         de\239\172\129nes the number of builds that can run in parallel.\n"]
  environment_type : environment_type option;
      [@ocaml.doc
        "The environment type of the compute fleet.\n\n\
        \ {ul\n\
        \       {-  The environment type [ARM_CONTAINER] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific (Mumbai), Asia \
         Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and \
         South America (S\195\163o Paulo).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [ARM_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_CONTAINER] is available only in regions US East \
         (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia \
         Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America \
         (S\195\163o Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_GPU_CONTAINER] is available only in regions US \
         East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia \
         Pacific (Tokyo), and Asia Pacific (Sydney).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [MAC_ARM] is available for Medium fleets only in regions \
         US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), and EU \
         (Frankfurt)\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [MAC_ARM] is available for Large fleets only in regions \
         US East (N. Virginia), US East (Ohio), US West (Oregon), and Asia Pacific (Sydney).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_SERVER_2019_CONTAINER] is available only in \
         regions US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), \
         Asia Pacific (Tokyo), Asia Pacific (Mumbai) and EU (Ireland).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_SERVER_2022_CONTAINER] is available only in \
         regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU \
         (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore), Asia Pacific (Tokyo), South \
         America (S\195\163o Paulo) and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html}Build \
         environment compute types} in the {i CodeBuild user guide}.\n\
        \   "]
  compute_type : compute_type option;
      [@ocaml.doc
        "Information about the compute resources the compute fleet uses. Available values include:\n\n\
        \ {ul\n\
        \       {-   [ATTRIBUTE_BASED_COMPUTE]: Specify the amount of vCPUs, memory, disk space, \
         and the type of machine.\n\
        \           \n\
        \              If you use [ATTRIBUTE_BASED_COMPUTE], you must define your attributes by \
         using [computeConfiguration]. CodeBuild will select the cheapest instance that satisfies \
         your specified attributes. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.types}Reserved \
         capacity environment types} in the {i CodeBuild User Guide}.\n\
        \             \n\
        \               }\n\
        \       {-   [CUSTOM_INSTANCE_TYPE]: Specify the instance type for your compute fleet. For \
         a list of supported instance types, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.instance-types}Supported \
         instance families } in the {i CodeBuild User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_SMALL]: Use up to 4 GiB memory and 2 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_MEDIUM]: Use up to 8 GiB memory and 4 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_LARGE]: Use up to 16 GiB memory and 8 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_XLARGE]: Use up to 72 GiB memory and 36 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_2XLARGE]: Use up to 144 GiB memory, 72 vCPUs, and 824 GB of \
         SSD storage for builds. This compute type supports Docker images up to 100 GB \
         uncompressed.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_1GB]: Use up to 1 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_2GB]: Use up to 2 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_4GB]: Use up to 4 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_8GB]: Use up to 8 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_10GB]: Use up to 10 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you use [BUILD_GENERAL1_SMALL]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 4 GiB memory and \
         2 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 16 GiB \
         memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 4 GiB memory and 2 \
         vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    If you use [BUILD_GENERAL1_LARGE]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 16 GiB memory \
         and 8 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 255 GiB \
         memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 16 GiB memory and \
         8 vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment.types}On-demand \
         environment types} in the {i CodeBuild User Guide.} \n\
        \   "]
  compute_configuration : compute_configuration option;
      [@ocaml.doc
        "The compute configuration of the compute fleet. This is only required if [computeType] is \
         set to [ATTRIBUTE_BASED_COMPUTE] or [CUSTOM_INSTANCE_TYPE].\n"]
  scaling_configuration : scaling_configuration_output option;
      [@ocaml.doc "The scaling configuration of the compute fleet.\n"]
  overflow_behavior : fleet_overflow_behavior option;
      [@ocaml.doc
        "The compute fleet overflow behavior.\n\n\
        \ {ul\n\
        \       {-  For overflow behavior [QUEUE], your overflow builds need to wait on the \
         existing fleet instance to become available.\n\
        \           \n\
        \            }\n\
        \       {-  For overflow behavior [ON_DEMAND], your overflow builds run on CodeBuild \
         on-demand.\n\
        \           \n\
        \             If you choose to set your overflow behavior to on-demand while creating a \
         VPC-connected fleet, make sure that you add the required VPC permissions to your project \
         service role. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-create-vpc-network-interface}Example \
         policy statement to allow CodeBuild access to Amazon Web Services services required to \
         create a VPC network interface}.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option; [@ocaml.doc ""]
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc "The proxy configuration of the compute fleet.\n"]
  image_id : non_empty_string option;
      [@ocaml.doc "The Amazon Machine Image (AMI) of the compute fleet.\n"]
  fleet_service_role : non_empty_string option;
      [@ocaml.doc
        "The service role associated with the compute fleet. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-permission-policy-fleet-service-role.html} \
         Allow a user to add a permission policy for a fleet service role} in the {i CodeBuild \
         User Guide}.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tag key and value pairs associated with this compute fleet.\n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         build project tags.\n\
        \ "]
}
[@@ocaml.doc "A set of dedicated instances for your build environment.\n"]

type nonrec fleets = fleet list [@@ocaml.doc ""]

type nonrec batch_get_fleets_output = {
  fleets : fleets option; [@ocaml.doc "Information about the requested compute fleets.\n"]
  fleets_not_found : fleet_names option;
      [@ocaml.doc "The names of compute fleets for which information could not be found.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_fleets_input = {
  names : fleet_names; [@ocaml.doc "The names or ARNs of the compute fleets.\n"]
}
[@@ocaml.doc ""]

type nonrec project_names = non_empty_string list [@@ocaml.doc ""]

type nonrec project_visibility_type = PUBLIC_READ [@ocaml.doc ""] | PRIVATE [@ocaml.doc ""]
[@@ocaml.doc
  "Specifies the visibility of the project's builds. Possible values are:\n\n\
  \  PUBLIC_READ  The project builds are visible to the public.\n\
  \               \n\
  \                 PRIVATE  The project builds are not visible to the public.\n\
  \                          \n\
  \                            "]

type nonrec project_badge = {
  badge_enabled : boolean_ option;
      [@ocaml.doc
        "Set this to true to generate a publicly accessible URL for your project's build badge.\n"]
  badge_request_url : string_ option;
      [@ocaml.doc
        "The publicly-accessible URL through which you can access the build badge for your project. \n"]
}
[@@ocaml.doc "Information about the build badge for the build project.\n"]

type nonrec pull_request_build_approver_role =
  | GITHUB_READ [@ocaml.doc ""]
  | GITHUB_TRIAGE [@ocaml.doc ""]
  | GITHUB_WRITE [@ocaml.doc ""]
  | GITHUB_MAINTAIN [@ocaml.doc ""]
  | GITHUB_ADMIN [@ocaml.doc ""]
  | GITLAB_GUEST [@ocaml.doc ""]
  | GITLAB_PLANNER [@ocaml.doc ""]
  | GITLAB_REPORTER [@ocaml.doc ""]
  | GITLAB_DEVELOPER [@ocaml.doc ""]
  | GITLAB_MAINTAINER [@ocaml.doc ""]
  | GITLAB_OWNER [@ocaml.doc ""]
  | BITBUCKET_READ [@ocaml.doc ""]
  | BITBUCKET_WRITE [@ocaml.doc ""]
  | BITBUCKET_ADMIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pull_request_build_approver_roles = pull_request_build_approver_role list
[@@ocaml.doc ""]

type nonrec pull_request_build_comment_approval =
  | DISABLED [@ocaml.doc ""]
  | ALL_PULL_REQUESTS [@ocaml.doc ""]
  | FORK_PULL_REQUESTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pull_request_build_policy = {
  requires_comment_approval : pull_request_build_comment_approval;
      [@ocaml.doc
        "Specifies when comment-based approval is required before triggering a build on pull \
         requests. This setting determines whether builds run automatically or require explicit \
         approval through comments.\n\n\
        \ {ul\n\
        \       {-   {i DISABLED}: Builds trigger automatically without requiring comment approval\n\
        \           \n\
        \            }\n\
        \       {-   {i ALL_PULL_REQUESTS}: All pull requests require comment approval before \
         builds execute (unless contributor is one of the approver roles)\n\
        \           \n\
        \            }\n\
        \       {-   {i FORK_PULL_REQUESTS}: Only pull requests from forked repositories require \
         comment approval (unless contributor is one of the approver roles)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  approver_roles : pull_request_build_approver_roles option;
      [@ocaml.doc
        "List of repository roles that have approval privileges for pull request builds when \
         comment approval is required. Only users with these roles can provide valid comment \
         approvals. If a pull request contributor is one of these roles, their pull request builds \
         will trigger automatically. This field is only applicable when [requiresCommentApproval] \
         is not {i DISABLED}.\n"]
}
[@@ocaml.doc
  "A PullRequestBuildPolicy object that defines comment-based approval requirements for triggering \
   builds on pull requests. This policy helps control when automated builds are executed based on \
   contributor permissions and approval workflows.\n"]

type nonrec webhook_status =
  | CREATING [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec webhook_scope_type =
  | GITHUB_ORGANIZATION [@ocaml.doc ""]
  | GITHUB_GLOBAL [@ocaml.doc ""]
  | GITLAB_GROUP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scope_configuration = {
  name : string_;
      [@ocaml.doc
        "The name of either the group, enterprise, or organization that will send webhook events \
         to CodeBuild, depending on the type of webhook.\n"]
  domain : string_ option;
      [@ocaml.doc
        "The domain of the GitHub Enterprise organization or the GitLab Self Managed group. Note \
         that this parameter is only required if your project's source type is GITHUB_ENTERPRISE \
         or GITLAB_SELF_MANAGED.\n"]
  scope : webhook_scope_type;
      [@ocaml.doc
        "The type of scope for a GitHub or GitLab webhook. The scope default is GITHUB_ORGANIZATION.\n"]
}
[@@ocaml.doc "Contains configuration information about the scope for a webhook. \n"]

type nonrec webhook_build_type =
  | BUILD [@ocaml.doc ""]
  | BUILD_BATCH [@ocaml.doc ""]
  | RUNNER_BUILDKITE_BUILD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec webhook_filter_type =
  | EVENT [@ocaml.doc ""]
  | BASE_REF [@ocaml.doc ""]
  | HEAD_REF [@ocaml.doc ""]
  | ACTOR_ACCOUNT_ID [@ocaml.doc ""]
  | FILE_PATH [@ocaml.doc ""]
  | COMMIT_MESSAGE [@ocaml.doc ""]
  | WORKFLOW_NAME [@ocaml.doc ""]
  | TAG_NAME [@ocaml.doc ""]
  | RELEASE_NAME [@ocaml.doc ""]
  | REPOSITORY_NAME [@ocaml.doc ""]
  | ORGANIZATION_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec webhook_filter = {
  type_ : webhook_filter_type;
      [@ocaml.doc
        " The type of webhook filter. There are 11 webhook filter types: [EVENT], \
         [ACTOR_ACCOUNT_ID], [HEAD_REF], [BASE_REF], [FILE_PATH], [COMMIT_MESSAGE], [TAG_NAME], \
         [RELEASE_NAME], [REPOSITORY_NAME], [ORGANIZATION_NAME], and [WORKFLOW_NAME]. \n\n\
        \ {ul\n\
        \       {-   EVENT \n\
        \           \n\
        \            {ul\n\
        \                  {-   A webhook event triggers a build when the provided [pattern] \
         matches one of nine event types: [PUSH], [PULL_REQUEST_CREATED], [PULL_REQUEST_UPDATED], \
         [PULL_REQUEST_CLOSED], [PULL_REQUEST_REOPENED], [PULL_REQUEST_MERGED], [RELEASED], \
         [PRERELEASED], and [WORKFLOW_JOB_QUEUED]. The [EVENT] patterns are specified as a \
         comma-separated string. For example, [PUSH,\n\
        \                                PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED] filters all \
         push, pull request created, and pull request updated events. \n\
        \                      \n\
        \                         Types [PULL_REQUEST_REOPENED] and [WORKFLOW_JOB_QUEUED] work \
         with GitHub and GitHub Enterprise only. Types [RELEASED] and [PRERELEASED] work with \
         GitHub only.\n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  ACTOR_ACCOUNT_ID\n\
        \           \n\
        \            {ul\n\
        \                  {-   A webhook event triggers a build when a GitHub, GitHub Enterprise, \
         or Bitbucket account ID matches the regular expression [pattern]. \n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  HEAD_REF\n\
        \           \n\
        \            {ul\n\
        \                  {-   A webhook event triggers a build when the head reference matches \
         the regular expression [pattern]. For example, [refs/heads/branch-name] and \
         [refs/tags/tag-name]. \n\
        \                      \n\
        \                         Works with GitHub and GitHub Enterprise push, GitHub and GitHub \
         Enterprise pull request, Bitbucket push, and Bitbucket pull request events.\n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  BASE_REF\n\
        \           \n\
        \            {ul\n\
        \                  {-   A webhook event triggers a build when the base reference matches \
         the regular expression [pattern]. For example, [refs/heads/branch-name]. \n\
        \                      \n\
        \                         Works with pull request events only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  FILE_PATH\n\
        \           \n\
        \            {ul\n\
        \                  {-   A webhook triggers a build when the path of a changed file matches \
         the regular expression [pattern]. \n\
        \                      \n\
        \                         Works with push and pull request events only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  COMMIT_MESSAGE\n\
        \           \n\
        \            {ul\n\
        \                  {-  A webhook triggers a build when the head commit message matches the \
         regular expression [pattern].\n\
        \                      \n\
        \                         Works with push and pull request events only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  TAG_NAME\n\
        \           \n\
        \            {ul\n\
        \                  {-  A webhook triggers a build when the tag name of the release matches \
         the regular expression [pattern].\n\
        \                      \n\
        \                         Works with [RELEASED] and [PRERELEASED] events only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  RELEASE_NAME\n\
        \           \n\
        \            {ul\n\
        \                  {-  A webhook triggers a build when the release name matches the \
         regular expression [pattern].\n\
        \                      \n\
        \                         Works with [RELEASED] and [PRERELEASED] events only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  REPOSITORY_NAME\n\
        \           \n\
        \            {ul\n\
        \                  {-  A webhook triggers a build when the repository name matches the \
         regular expression [pattern].\n\
        \                      \n\
        \                         Works with GitHub global or organization webhooks only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  ORGANIZATION_NAME\n\
        \           \n\
        \            {ul\n\
        \                  {-  A webhook triggers a build when the organization name matches the \
         regular expression [pattern].\n\
        \                      \n\
        \                         Works with GitHub global webhooks only. \n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  WORKFLOW_NAME\n\
        \           \n\
        \            {ul\n\
        \                  {-  A webhook triggers a build when the workflow name matches the \
         regular expression [pattern].\n\
        \                      \n\
        \                         Works with [WORKFLOW_JOB_QUEUED] events only. \n\
        \                        \n\
        \                           For CodeBuild-hosted Buildkite runner builds, WORKFLOW_NAME \
         filters will filter by pipeline name.\n\
        \                           \n\
        \                             }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  pattern : string_;
      [@ocaml.doc
        " For a [WebHookFilter] that uses [EVENT] type, a comma-separated string that specifies \
         one or more events. For example, the webhook filter [PUSH,\n\
        \                PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED] allows all push, pull request \
         created, and pull request updated events to trigger a build. \n\n\
        \  For a [WebHookFilter] that uses any of the other filter types, a regular expression \
         pattern. For example, a [WebHookFilter] that uses [HEAD_REF] for its [type] and the \
         pattern [^refs/heads/] triggers a build when the head reference is a branch with a \
         reference name [refs/heads/branch-name]. \n\
        \ "]
  exclude_matched_pattern : wrapper_boolean option;
      [@ocaml.doc
        " Used to indicate that the [pattern] determines which webhook events do not trigger a \
         build. If true, then a webhook event that does not match the [pattern] triggers a build. \
         If false, then a webhook event that matches the [pattern] triggers a build. \n"]
}
[@@ocaml.doc "A filter used to determine which webhooks trigger a build. \n"]

type nonrec filter_group = webhook_filter list [@@ocaml.doc ""]

type nonrec filter_groups = filter_group list [@@ocaml.doc ""]

type nonrec webhook = {
  url : non_empty_string option; [@ocaml.doc "The URL to the webhook.\n"]
  payload_url : non_empty_string option;
      [@ocaml.doc "The CodeBuild endpoint where webhook events are sent.\n"]
  secret : non_empty_string option;
      [@ocaml.doc
        "The secret token of the associated repository. \n\n\
        \  A Bitbucket webhook does not support [secret]. \n\
        \  \n\
        \   "]
  branch_filter : string_ option;
      [@ocaml.doc
        "A regular expression used to determine which repository branches are built when a webhook \
         is triggered. If the name of a branch matches the regular expression, then it is built. \
         If [branchFilter] is empty, then all branches are built.\n\n\
        \  It is recommended that you use [filterGroups] instead of [branchFilter]. \n\
        \  \n\
        \   "]
  filter_groups : filter_groups option;
      [@ocaml.doc
        "An array of arrays of [WebhookFilter] objects used to determine which webhooks are \
         triggered. At least one [WebhookFilter] in the array must specify [EVENT] as its [type]. \
         \n\n\
        \ For a build to be triggered, at least one filter group in the [filterGroups] array must \
         pass. For a filter group to pass, each of its filters must pass. \n\
        \ "]
  build_type : webhook_build_type option;
      [@ocaml.doc
        "Specifies the type of build this webhook will trigger.\n\n\
        \   [RUNNER_BUILDKITE_BUILD] is only available for [NO_SOURCE] source type projects \
         configured for Buildkite runner builds. For more information about CodeBuild-hosted \
         Buildkite runner builds, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-runner-buildkite.html}Tutorial: \
         Configure a CodeBuild-hosted Buildkite runner} in the {i CodeBuild user guide}.\n\
        \  \n\
        \   "]
  manual_creation : wrapper_boolean option;
      [@ocaml.doc
        "If manualCreation is true, CodeBuild doesn't create a webhook in GitHub and instead \
         returns [payloadUrl] and [secret] values for the webhook. The [payloadUrl] and [secret] \
         values in the output can be used to manually create a webhook within GitHub.\n\n\
        \  manualCreation is only available for GitHub webhooks.\n\
        \  \n\
        \   "]
  last_modified_secret : timestamp option;
      [@ocaml.doc
        "A timestamp that indicates the last time a repository's secret token was modified. \n"]
  scope_configuration : scope_configuration option;
      [@ocaml.doc
        "The scope configuration for global or organization webhooks.\n\n\
        \  Global or organization webhooks are only available for GitHub and Github Enterprise \
         webhooks.\n\
        \  \n\
        \   "]
  status : webhook_status option;
      [@ocaml.doc
        "The status of the webhook. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [CREATING]: The webhook is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_FAILED]: The webhook has failed to create.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE]: The webhook has succeeded and is active.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING]: The webhook is being deleted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_message : string_ option;
      [@ocaml.doc "A message associated with the status of a webhook.\n"]
  pull_request_build_policy : pull_request_build_policy option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Information about a webhook that connects repository events to a build project in CodeBuild.\n"]

type nonrec time_out = int [@@ocaml.doc ""]

type nonrec build_time_out = int [@@ocaml.doc ""]

type nonrec project_artifacts = {
  type_ : artifacts_type;
      [@ocaml.doc
        "The type of build output artifact. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [CODEPIPELINE]: The build project has build output generated through \
         CodePipeline. \n\
        \           \n\
        \             The [CODEPIPELINE] type is not supported for [secondaryArtifacts].\n\
        \             \n\
        \               }\n\
        \       {-   [NO_ARTIFACTS]: The build project does not produce any build output.\n\
        \           \n\
        \            }\n\
        \       {-   [S3]: The build project stores build output in Amazon S3.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  location : string_ option;
      [@ocaml.doc
        "Information about the build output artifact location:\n\n\
        \ {ul\n\
        \       {-  If [type] is set to [CODEPIPELINE], CodePipeline ignores this value if \
         specified. This is because CodePipeline manages its build output locations instead of \
         CodeBuild.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [NO_ARTIFACTS], this value is ignored if specified, \
         because no build output is produced.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [S3], this is the name of the output bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  path : string_ option;
      [@ocaml.doc
        "Along with [namespaceType] and [name], the pattern that CodeBuild uses to name and store \
         the output artifact:\n\n\
        \ {ul\n\
        \       {-  If [type] is set to [CODEPIPELINE], CodePipeline ignores this value if \
         specified. This is because CodePipeline manages its build output names instead of \
         CodeBuild.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [NO_ARTIFACTS], this value is ignored if specified, \
         because no build output is produced.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [S3], this is the path to the output artifact. If [path] \
         is not specified, [path] is not used.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For example, if [path] is set to [MyArtifacts], [namespaceType] is set to [NONE], and \
         [name] is set to [MyArtifact.zip], the output artifact is stored in the output bucket at \
         [MyArtifacts/MyArtifact.zip].\n\
        \   "]
  namespace_type : artifact_namespace option;
      [@ocaml.doc
        "Along with [path] and [name], the pattern that CodeBuild uses to determine the name and \
         location to store the output artifact:\n\n\
        \ {ul\n\
        \       {-  If [type] is set to [CODEPIPELINE], CodePipeline ignores this value if \
         specified. This is because CodePipeline manages its build output names instead of \
         CodeBuild.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [NO_ARTIFACTS], this value is ignored if specified, \
         because no build output is produced.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [S3], valid values include:\n\
        \           \n\
        \            {ul\n\
        \                  {-   [BUILD_ID]: Include the build ID in the location of the build \
         output artifact.\n\
        \                      \n\
        \                       }\n\
        \                  {-   [NONE]: Do not include the build ID. This is the default if \
         [namespaceType] is not specified.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \   For example, if [path] is set to [MyArtifacts], [namespaceType] is set to [BUILD_ID], \
         and [name] is set to [MyArtifact.zip], the output artifact is stored in \n\
        \   {[\n\
        \   MyArtifacts//MyArtifact.zip\n\
        \   ]}\n\
        \   .\n\
        \   "]
  name : string_ option;
      [@ocaml.doc
        "Along with [path] and [namespaceType], the pattern that CodeBuild uses to name and store \
         the output artifact:\n\n\
        \ {ul\n\
        \       {-  If [type] is set to [CODEPIPELINE], CodePipeline ignores this value if \
         specified. This is because CodePipeline manages its build output names instead of \
         CodeBuild.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [NO_ARTIFACTS], this value is ignored if specified, \
         because no build output is produced.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [S3], this is the name of the output artifact object. If \
         you set the name to be a forward slash (\"/\"), the artifact is stored in the root of the \
         output bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For example:\n\
        \   \n\
        \    {ul\n\
        \          {-   If [path] is set to [MyArtifacts], [namespaceType] is set to [BUILD_ID], \
         and [name] is set to [MyArtifact.zip], then the output artifact is stored in \n\
        \              {[\n\
        \              MyArtifacts//MyArtifact.zip\n\
        \              ]}\n\
        \              . \n\
        \              \n\
        \               }\n\
        \          {-   If [path] is empty, [namespaceType] is set to [NONE], and [name] is set to \
         \"[/]\", the output artifact is stored in the root of the output bucket. \n\
        \              \n\
        \               }\n\
        \          {-   If [path] is set to [MyArtifacts], [namespaceType] is set to [BUILD_ID], \
         and [name] is set to \"[/]\", the output artifact is stored in \n\
        \              {[\n\
        \              MyArtifacts/\n\
        \              ]}\n\
        \              . \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  packaging : artifact_packaging option;
      [@ocaml.doc
        "The type of build output artifact to create:\n\n\
        \ {ul\n\
        \       {-  If [type] is set to [CODEPIPELINE], CodePipeline ignores this value if \
         specified. This is because CodePipeline manages its build output artifacts instead of \
         CodeBuild.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [NO_ARTIFACTS], this value is ignored if specified, \
         because no build output is produced.\n\
        \           \n\
        \            }\n\
        \       {-  If [type] is set to [S3], valid values include:\n\
        \           \n\
        \            {ul\n\
        \                  {-   [NONE]: CodeBuild creates in the output bucket a folder that \
         contains the build output. This is the default if [packaging] is not specified.\n\
        \                      \n\
        \                       }\n\
        \                  {-   [ZIP]: CodeBuild creates in the output bucket a ZIP file that \
         contains the build output.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  override_artifact_name : wrapper_boolean option;
      [@ocaml.doc
        " If this flag is set, a name specified in the buildspec file overrides the artifact name. \
         The name specified in a buildspec file is calculated at build time and uses the Shell \
         Command Language. For example, you can append a date and time to your artifact name so \
         that it is always unique. \n"]
  encryption_disabled : wrapper_boolean option;
      [@ocaml.doc
        " Set to true if you do not want your output artifacts encrypted. This option is valid \
         only if your artifacts type is Amazon S3. If this is set with another artifacts type, an \
         invalidInputException is thrown. \n"]
  artifact_identifier : string_ option;
      [@ocaml.doc " An identifier for this artifact definition. \n"]
  bucket_owner_access : bucket_owner_access option; [@ocaml.doc ""]
}
[@@ocaml.doc "Information about the build output artifacts for the build project.\n"]

type nonrec project_artifacts_list = project_artifacts list [@@ocaml.doc ""]

type nonrec project_description = string [@@ocaml.doc ""]

type nonrec project_name = string [@@ocaml.doc ""]

type nonrec project = {
  name : project_name option; [@ocaml.doc "The name of the build project.\n"]
  arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the build project.\n"]
  description : project_description option;
      [@ocaml.doc "A description that makes the build project easy to identify.\n"]
  source : project_source option;
      [@ocaml.doc "Information about the build input source code for this build project.\n"]
  secondary_sources : project_sources option; [@ocaml.doc "An array of [ProjectSource] objects. \n"]
  source_version : string_ option;
      [@ocaml.doc
        "A version of the build input to be built for this project. If not specified, the latest \
         version is used. If specified, it must be one of:\n\n\
        \ {ul\n\
        \       {-  For CodeCommit: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For GitHub: the commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example [pr/25]). If a branch \
         name is specified, the branch's HEAD commit ID is used. If not specified, the default \
         branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For GitLab: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For Bitbucket: the commit ID, branch name, or tag name that corresponds to the \
         version of the source code you want to build. If a branch name is specified, the branch's \
         HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3: the version ID of the object that represents the build input \
         ZIP file to use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If [sourceVersion] is specified at the build level, then that version takes precedence \
         over this [sourceVersion] (at the project level). \n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \    "]
  secondary_source_versions : project_secondary_source_versions option;
      [@ocaml.doc
        "An array of [ProjectSourceVersion] objects. If [secondarySourceVersions] is specified at \
         the build level, then they take over these [secondarySourceVersions] (at the project \
         level). \n"]
  artifacts : project_artifacts option;
      [@ocaml.doc "Information about the build output artifacts for the build project.\n"]
  secondary_artifacts : project_artifacts_list option;
      [@ocaml.doc "An array of [ProjectArtifacts] objects. \n"]
  cache : project_cache option; [@ocaml.doc "Information about the cache for the build project.\n"]
  environment : project_environment option;
      [@ocaml.doc "Information about the build environment for this build project.\n"]
  service_role : non_empty_string option;
      [@ocaml.doc
        "The ARN of the IAM role that enables CodeBuild to interact with dependent Amazon Web \
         Services services on behalf of the Amazon Web Services account.\n"]
  timeout_in_minutes : build_time_out option;
      [@ocaml.doc
        "How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out \
         any related build that did not get marked as completed. The default is 60 minutes.\n"]
  queued_timeout_in_minutes : time_out option;
      [@ocaml.doc "The number of minutes a build is allowed to be queued before it times out. \n"]
  encryption_key : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) to be used for encrypting the build \
         output artifacts.\n\n\
        \  You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ). If you don't specify a value, CodeBuild uses the managed CMK for Amazon Simple \
         Storage Service (Amazon S3). \n\
        \    "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tag key and value pairs associated with this build project.\n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         build project tags.\n\
        \ "]
  created : timestamp option;
      [@ocaml.doc "When the build project was created, expressed in Unix time format.\n"]
  last_modified : timestamp option;
      [@ocaml.doc
        "When the build project's settings were last modified, expressed in Unix time format.\n"]
  webhook : webhook option;
      [@ocaml.doc
        "Information about a webhook that connects repository events to a build project in \
         CodeBuild.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc "Information about the VPC configuration that CodeBuild accesses.\n"]
  badge : project_badge option;
      [@ocaml.doc "Information about the build badge for the build project.\n"]
  logs_config : logs_config option;
      [@ocaml.doc
        "Information about logs for the build project. A project can create logs in CloudWatch \
         Logs, an S3 bucket, or both. \n"]
  file_system_locations : project_file_system_locations option;
      [@ocaml.doc
        " An array of [ProjectFileSystemLocation] objects for a CodeBuild build project. A \
         [ProjectFileSystemLocation] object specifies the [identifier], [location], \
         [mountOptions], [mountPoint], and [type] of a file system created using Amazon Elastic \
         File System. \n"]
  build_batch_config : project_build_batch_config option;
      [@ocaml.doc
        "A [ProjectBuildBatchConfig] object that defines the batch build options for the project.\n"]
  concurrent_build_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of concurrent builds that are allowed for this project.\n\n\
        \ New builds are only started if the current number of builds is less than or equal to \
         this limit. If the current build count meets this limit, new builds are throttled and are \
         not run.\n\
        \ "]
  project_visibility : project_visibility_type option; [@ocaml.doc ""]
  public_project_alias : non_empty_string option;
      [@ocaml.doc "Contains the project identifier used with the public build APIs. \n"]
  resource_access_role : non_empty_string option;
      [@ocaml.doc
        "The ARN of the IAM role that enables CodeBuild to access the CloudWatch Logs and Amazon \
         S3 artifacts for the project's builds.\n"]
  auto_retry_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of additional automatic retries after a failed build. For example, if \
         the auto-retry limit is set to 2, CodeBuild will call the [RetryBuild] API to \
         automatically retry your build for up to 2 additional times.\n"]
}
[@@ocaml.doc "Information about a build project.\n"]

type nonrec projects = project list [@@ocaml.doc ""]

type nonrec batch_get_projects_output = {
  projects : projects option; [@ocaml.doc "Information about the requested build projects.\n"]
  projects_not_found : project_names option;
      [@ocaml.doc "The names of build projects for which information could not be found.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_projects_input = {
  names : project_names;
      [@ocaml.doc
        "The names or ARNs of the build projects. To get information about a project shared with \
         your Amazon Web Services account, its ARN must be specified. You cannot specify a shared \
         project using its name.\n"]
}
[@@ocaml.doc ""]

type nonrec report_group_arns = non_empty_string list [@@ocaml.doc ""]

type nonrec report_group_status_type = ACTIVE [@ocaml.doc ""] | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_packaging_type = ZIP [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec s3_report_export_config = {
  bucket : non_empty_string option;
      [@ocaml.doc " The name of the S3 bucket where the raw data of a report are exported. \n"]
  bucket_owner : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account identifier of the owner of the Amazon S3 bucket. This \
         allows report data to be exported to an Amazon S3 bucket that is owned by an account \
         other than the account running the build.\n"]
  path : string_ option; [@ocaml.doc " The path to the exported report's raw data results. \n"]
  packaging : report_packaging_type option;
      [@ocaml.doc
        " The type of build output artifact to create. Valid values include: \n\n\
        \ {ul\n\
        \       {-   [NONE]: CodeBuild creates the raw data in the output bucket. This is the \
         default if packaging is not specified. \n\
        \           \n\
        \            }\n\
        \       {-   [ZIP]: CodeBuild creates a ZIP file with the raw data in the output bucket. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  encryption_key : non_empty_string option;
      [@ocaml.doc " The encryption key for the report's encrypted raw data. \n"]
  encryption_disabled : wrapper_boolean option;
      [@ocaml.doc " A boolean value that specifies if the results of a report are encrypted. \n"]
}
[@@ocaml.doc " Information about the S3 bucket where the raw data of a report are exported. \n"]

type nonrec report_export_config_type = S3 [@ocaml.doc ""] | NO_EXPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_export_config = {
  export_config_type : report_export_config_type option;
      [@ocaml.doc
        " The export configuration type. Valid values are: \n\n\
        \ {ul\n\
        \       {-   [S3]: The report results are exported to an S3 bucket. \n\
        \           \n\
        \            }\n\
        \       {-   [NO_EXPORT]: The report results are not exported. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  s3_destination : s3_report_export_config option;
      [@ocaml.doc
        " A [S3ReportExportConfig] object that contains information about the S3 bucket where the \
         run of a report is exported. \n"]
}
[@@ocaml.doc " Information about the location where the run of a report is exported. \n"]

type nonrec report_type = TEST [@ocaml.doc ""] | CODE_COVERAGE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec report_group_name = string [@@ocaml.doc ""]

type nonrec report_group = {
  arn : non_empty_string option; [@ocaml.doc "The ARN of the [ReportGroup]. \n"]
  name : report_group_name option; [@ocaml.doc "The name of the [ReportGroup]. \n"]
  type_ : report_type option;
      [@ocaml.doc
        "The type of the [ReportGroup]. This can be one of the following values:\n\n\
        \  CODE_COVERAGE  The report group contains code coverage reports.\n\
        \                 \n\
        \                   TEST  The report group contains test reports.\n\
        \                         \n\
        \                           "]
  export_config : report_export_config option;
      [@ocaml.doc
        "Information about the destination where the raw data of this [ReportGroup] is exported. \n"]
  created : timestamp option; [@ocaml.doc "The date and time this [ReportGroup] was created. \n"]
  last_modified : timestamp option;
      [@ocaml.doc "The date and time this [ReportGroup] was last modified. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tag key and value pairs associated with this report group. \n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         report group tags.\n\
        \ "]
  status : report_group_status_type option;
      [@ocaml.doc
        "The status of the report group. This property is read-only.\n\n\
        \ This can be one of the following values:\n\
        \ \n\
        \   ACTIVE  The report group is active.\n\
        \           \n\
        \             DELETING  The report group is in the process of being deleted.\n\
        \                       \n\
        \                         "]
}
[@@ocaml.doc
  "A series of reports. Each report contains information about the results from running a series \
   of test cases. You specify the test cases for a report group in the buildspec for a build \
   project using one or more paths to the test case files. \n"]

type nonrec report_groups = report_group list [@@ocaml.doc ""]

type nonrec batch_get_report_groups_output = {
  report_groups : report_groups option;
      [@ocaml.doc " The array of report groups returned by [BatchGetReportGroups]. \n"]
  report_groups_not_found : report_group_arns option;
      [@ocaml.doc
        " An array of ARNs passed to [BatchGetReportGroups] that are not associated with a \
         [ReportGroup]. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_report_groups_input = {
  report_group_arns : report_group_arns;
      [@ocaml.doc " An array of report group ARNs that identify the report groups to return. \n"]
}
[@@ocaml.doc ""]

type nonrec report_arns = non_empty_string list [@@ocaml.doc ""]

type nonrec non_negative_int = int [@@ocaml.doc ""]

type nonrec percentage = float [@@ocaml.doc ""]

type nonrec code_coverage_report_summary = {
  line_coverage_percentage : percentage option;
      [@ocaml.doc "The percentage of lines that are covered by your tests.\n"]
  lines_covered : non_negative_int option;
      [@ocaml.doc "The number of lines that are covered by your tests.\n"]
  lines_missed : non_negative_int option;
      [@ocaml.doc "The number of lines that are not covered by your tests.\n"]
  branch_coverage_percentage : percentage option;
      [@ocaml.doc "The percentage of branches that are covered by your tests.\n"]
  branches_covered : non_negative_int option;
      [@ocaml.doc "The number of conditional branches that are covered by your tests.\n"]
  branches_missed : non_negative_int option;
      [@ocaml.doc "The number of conditional branches that are not covered by your tests.\n"]
}
[@@ocaml.doc
  "Contains a summary of a code coverage report.\n\n\
  \ Line coverage measures how many statements your tests cover. A statement is a single \
   instruction, not including comments, conditionals, etc.\n\
  \ \n\
  \  Branch coverage determines if your tests cover every possible branch of a control structure, \
   such as an [if] or [case] statement.\n\
  \  "]

type nonrec report_status_counts = (string_ * wrapper_int) list [@@ocaml.doc ""]

type nonrec test_report_summary = {
  total : wrapper_int;
      [@ocaml.doc
        " The number of test cases in this [TestReportSummary]. The total includes truncated test \
         cases. \n"]
  status_counts : report_status_counts;
      [@ocaml.doc
        " A map that contains the number of each type of status returned by the test results in \
         this [TestReportSummary]. \n"]
  duration_in_nano_seconds : wrapper_long;
      [@ocaml.doc
        " The number of nanoseconds it took to run all of the test cases in this report. \n"]
}
[@@ocaml.doc " Information about a test report. \n"]

type nonrec report_status_type =
  | GENERATING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | INCOMPLETE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report = {
  arn : non_empty_string option; [@ocaml.doc " The ARN of the report run. \n"]
  type_ : report_type option;
      [@ocaml.doc
        "The type of the report that was run.\n\n\
        \  CODE_COVERAGE  A code coverage report.\n\
        \                 \n\
        \                   TEST  A test report.\n\
        \                         \n\
        \                           "]
  name : string_ option; [@ocaml.doc " The name of the report that was run. \n"]
  report_group_arn : non_empty_string option;
      [@ocaml.doc " The ARN of the report group associated with this report. \n"]
  execution_id : string_ option;
      [@ocaml.doc " The ARN of the build run that generated this report. \n"]
  status : report_status_type option; [@ocaml.doc " The status of this report. \n"]
  created : timestamp option; [@ocaml.doc " The date and time this report run occurred. \n"]
  expired : timestamp option;
      [@ocaml.doc
        " The date and time a report expires. A report expires 30 days after it is created. An \
         expired report is not available to view in CodeBuild. \n"]
  export_config : report_export_config option;
      [@ocaml.doc
        " Information about where the raw data used to generate this report was exported. \n"]
  truncated : wrapper_boolean option;
      [@ocaml.doc
        " A boolean that specifies if this report run is truncated. The list of test cases is \
         truncated after the maximum number of test cases is reached. \n"]
  test_summary : test_report_summary option;
      [@ocaml.doc
        " A [TestReportSummary] object that contains information about this test report. \n"]
  code_coverage_summary : code_coverage_report_summary option;
      [@ocaml.doc
        "A [CodeCoverageReportSummary] object that contains a code coverage summary for this report.\n"]
}
[@@ocaml.doc
  "Information about the results from running a series of test cases during the run of a build \
   project. The test cases are specified in the buildspec for the build project using one or more \
   paths to the test case files. You can specify any type of tests you want, such as unit tests, \
   integration tests, and functional tests. \n"]

type nonrec reports = report list [@@ocaml.doc ""]

type nonrec batch_get_reports_output = {
  reports : reports option;
      [@ocaml.doc " The array of [Report] objects returned by [BatchGetReports]. \n"]
  reports_not_found : report_arns option;
      [@ocaml.doc
        " An array of ARNs passed to [BatchGetReportGroups] that are not associated with a \
         [Report]. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_reports_input = {
  report_arns : report_arns;
      [@ocaml.doc " An array of ARNs that identify the [Report] objects to return. \n"]
}
[@@ocaml.doc ""]

type nonrec sandbox_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec sandbox_session_phase = {
  phase_type : string_ option; [@ocaml.doc "The name of the sandbox phase.\n"]
  phase_status : status_type option;
      [@ocaml.doc
        "The current status of the sandbox phase. Valid values include:\n\n\
        \  FAILED  The sandbox phase failed.\n\
        \          \n\
        \            FAULT  The sandbox phase faulted.\n\
        \                   \n\
        \                     IN_PROGRESS  The sandbox phase is still in progress.\n\
        \                                  \n\
        \                                    STOPPED  The sandbox phase stopped.\n\
        \                                             \n\
        \                                               SUCCEEDED  The sandbox phase succeeded.\n\
        \                                                          \n\
        \                                                            TIMED_OUT  The sandbox phase \
         timed out.\n\
        \                                                                       \n\
        \                                                                         "]
  start_time : timestamp option;
      [@ocaml.doc "When the sandbox phase started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the sandbox phase ended, expressed in Unix time format.\n"]
  duration_in_seconds : wrapper_long option;
      [@ocaml.doc
        "How long, in seconds, between the starting and ending times of the sandbox's phase.\n"]
  contexts : phase_contexts option; [@ocaml.doc " An array of [PhaseContext] objects. \n"]
}
[@@ocaml.doc "Contains information about the sandbox phase.\n"]

type nonrec sandbox_session_phases = sandbox_session_phase list [@@ocaml.doc ""]

type nonrec sandbox_session = {
  id : non_empty_string option; [@ocaml.doc "The ID of the sandbox session.\n"]
  status : string_ option; [@ocaml.doc "The status of the sandbox session.\n"]
  start_time : timestamp option;
      [@ocaml.doc "When the sandbox session started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the sandbox session ended, expressed in Unix time format.\n"]
  current_phase : string_ option; [@ocaml.doc "The current phase for the sandbox.\n"]
  phases : sandbox_session_phases option;
      [@ocaml.doc " An array of [SandboxSessionPhase] objects. \n"]
  resolved_source_version : non_empty_string option;
      [@ocaml.doc "An identifier for the version of this sandbox's source code.\n"]
  logs : logs_location option; [@ocaml.doc ""]
  network_interface : network_interface option; [@ocaml.doc ""]
}
[@@ocaml.doc "Contains information about the sandbox session.\n"]

type nonrec sandbox = {
  id : non_empty_string option; [@ocaml.doc "The ID of the sandbox.\n"]
  arn : non_empty_string option; [@ocaml.doc "The ARN of the sandbox.\n"]
  project_name : non_empty_string option; [@ocaml.doc "The CodeBuild project name.\n"]
  request_time : timestamp option;
      [@ocaml.doc
        "When the sandbox process was initially requested, expressed in Unix time format.\n"]
  start_time : timestamp option;
      [@ocaml.doc "When the sandbox process started, expressed in Unix time format.\n"]
  end_time : timestamp option;
      [@ocaml.doc "When the sandbox process ended, expressed in Unix time format.\n"]
  status : string_ option; [@ocaml.doc "The status of the sandbox.\n"]
  source : project_source option; [@ocaml.doc ""]
  source_version : non_empty_string option;
      [@ocaml.doc "Any version identifier for the version of the sandbox to be built.\n"]
  secondary_sources : project_sources option;
      [@ocaml.doc " An array of [ProjectSource] objects. \n"]
  secondary_source_versions : project_secondary_source_versions option;
      [@ocaml.doc " An array of [ProjectSourceVersion] objects.\n"]
  environment : project_environment option; [@ocaml.doc ""]
  file_system_locations : project_file_system_locations option;
      [@ocaml.doc
        " An array of [ProjectFileSystemLocation] objects for a CodeBuild build project. A \
         [ProjectFileSystemLocation] object specifies the [identifier], [location], \
         [mountOptions], [mountPoint], and [type] of a file system created using Amazon Elastic \
         File System. \n"]
  timeout_in_minutes : wrapper_int option;
      [@ocaml.doc
        "How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out \
         this sandbox if it does not get marked as completed.\n"]
  queued_timeout_in_minutes : wrapper_int option;
      [@ocaml.doc "The number of minutes a sandbox is allowed to be queued before it times out. \n"]
  vpc_config : vpc_config option; [@ocaml.doc ""]
  log_config : logs_config option; [@ocaml.doc ""]
  encryption_key : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) to be used for encrypting the \
         sandbox output artifacts.\n"]
  service_role : non_empty_string option;
      [@ocaml.doc "The name of a service role used for this sandbox.\n"]
  current_session : sandbox_session option; [@ocaml.doc "The current session for the sandbox.\n"]
}
[@@ocaml.doc "Contains sandbox information.\n"]

type nonrec sandboxes = sandbox list [@@ocaml.doc ""]

type nonrec batch_get_sandboxes_output = {
  sandboxes : sandboxes option; [@ocaml.doc "Information about the requested sandboxes.\n"]
  sandboxes_not_found : sandbox_ids option;
      [@ocaml.doc "The IDs of sandboxes for which information could not be found.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_sandboxes_input = {
  ids : sandbox_ids; [@ocaml.doc "A comma separated list of [sandboxIds] or [sandboxArns].\n"]
}
[@@ocaml.doc ""]

type nonrec build_batch_filter = {
  status : status_type option;
      [@ocaml.doc
        "The status of the batch builds to retrieve. Only batch builds that have this status will \
         be retrieved.\n"]
}
[@@ocaml.doc "Specifies filters when retrieving batch builds.\n"]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The specified Amazon Web Services resource cannot be found.\n"]

type nonrec o_auth_provider_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "There was a problem with the underlying OAuth provider.\n"]

type nonrec update_webhook_output = {
  webhook : webhook option;
      [@ocaml.doc
        " Information about a repository's webhook that is associated with a project in CodeBuild. \n"]
}
[@@ocaml.doc ""]

type nonrec update_webhook_input = {
  project_name : project_name; [@ocaml.doc "The name of the CodeBuild project.\n"]
  branch_filter : string_ option;
      [@ocaml.doc
        "A regular expression used to determine which repository branches are built when a webhook \
         is triggered. If the name of a branch matches the regular expression, then it is built. \
         If [branchFilter] is empty, then all branches are built.\n\n\
        \   It is recommended that you use [filterGroups] instead of [branchFilter]. \n\
        \  \n\
        \   "]
  rotate_secret : boolean_ option;
      [@ocaml.doc
        " A boolean value that specifies whether the associated GitHub repository's secret token \
         should be updated. If you use Bitbucket for your repository, [rotateSecret] is ignored. \n"]
  filter_groups : filter_groups option;
      [@ocaml.doc
        " An array of arrays of [WebhookFilter] objects used to determine if a webhook event can \
         trigger a build. A filter group must contain at least one [EVENT] [WebhookFilter]. \n"]
  build_type : webhook_build_type option;
      [@ocaml.doc
        "Specifies the type of build this webhook will trigger.\n\n\
        \   [RUNNER_BUILDKITE_BUILD] is only available for [NO_SOURCE] source type projects \
         configured for Buildkite runner builds. For more information about CodeBuild-hosted \
         Buildkite runner builds, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-runner-buildkite.html}Tutorial: \
         Configure a CodeBuild-hosted Buildkite runner} in the {i CodeBuild user guide}.\n\
        \  \n\
        \   "]
  pull_request_build_policy : pull_request_build_policy option;
      [@ocaml.doc
        "A PullRequestBuildPolicy object that defines comment-based approval requirements for \
         triggering builds on pull requests. This policy helps control when automated builds are \
         executed based on contributor permissions and approval workflows.\n"]
}
[@@ocaml.doc ""]

type nonrec update_report_group_output = {
  report_group : report_group option; [@ocaml.doc " Information about the updated report group. \n"]
}
[@@ocaml.doc ""]

type nonrec update_report_group_input = {
  arn : non_empty_string; [@ocaml.doc " The ARN of the report group to update. \n"]
  export_config : report_export_config option;
      [@ocaml.doc
        " Used to specify an updated export type. Valid values are: \n\n\
        \ {ul\n\
        \       {-   [S3]: The report results are exported to an S3 bucket. \n\
        \           \n\
        \            }\n\
        \       {-   [NO_EXPORT]: The report results are not exported. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        " An updated list of tag key and value pairs associated with this report group. \n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         report group tags.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_project_visibility_output = {
  project_arn : non_empty_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the build project.\n"]
  public_project_alias : non_empty_string option;
      [@ocaml.doc "Contains the project identifier used with the public build APIs. \n"]
  project_visibility : project_visibility_type option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_project_visibility_input = {
  project_arn : non_empty_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the build project.\n"]
  project_visibility : project_visibility_type; [@ocaml.doc ""]
  resource_access_role : non_empty_string option;
      [@ocaml.doc
        "The ARN of the IAM role that enables CodeBuild to access the CloudWatch Logs and Amazon \
         S3 artifacts for the project's builds.\n"]
}
[@@ocaml.doc ""]

type nonrec update_project_output = {
  project : project option; [@ocaml.doc "Information about the build project that was changed.\n"]
}
[@@ocaml.doc ""]

type nonrec update_project_input = {
  name : non_empty_string;
      [@ocaml.doc
        "The name of the build project.\n\n  You cannot change a build project's name.\n  \n   "]
  description : project_description option;
      [@ocaml.doc "A new or replacement description of the build project.\n"]
  source : project_source option;
      [@ocaml.doc
        "Information to be changed about the build input source code for the build project.\n"]
  secondary_sources : project_sources option;
      [@ocaml.doc " An array of [ProjectSource] objects. \n"]
  source_version : string_ option;
      [@ocaml.doc
        " A version of the build input to be built for this project. If not specified, the latest \
         version is used. If specified, it must be one of: \n\n\
        \ {ul\n\
        \       {-  For CodeCommit: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For GitHub: the commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example [pr/25]). If a branch \
         name is specified, the branch's HEAD commit ID is used. If not specified, the default \
         branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For GitLab: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For Bitbucket: the commit ID, branch name, or tag name that corresponds to the \
         version of the source code you want to build. If a branch name is specified, the branch's \
         HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3: the version ID of the object that represents the build input \
         ZIP file to use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If [sourceVersion] is specified at the build level, then that version takes \
         precedence over this [sourceVersion] (at the project level). \n\
        \   \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \    "]
  secondary_source_versions : project_secondary_source_versions option;
      [@ocaml.doc
        " An array of [ProjectSourceVersion] objects. If [secondarySourceVersions] is specified at \
         the build level, then they take over these [secondarySourceVersions] (at the project \
         level). \n"]
  artifacts : project_artifacts option;
      [@ocaml.doc
        "Information to be changed about the build output artifacts for the build project.\n"]
  secondary_artifacts : project_artifacts_list option;
      [@ocaml.doc " An array of [ProjectArtifact] objects. \n"]
  cache : project_cache option;
      [@ocaml.doc
        "Stores recently used information so that it can be quickly accessed at a later time.\n"]
  environment : project_environment option;
      [@ocaml.doc "Information to be changed about the build environment for the build project.\n"]
  service_role : non_empty_string option;
      [@ocaml.doc
        "The replacement ARN of the IAM role that enables CodeBuild to interact with dependent \
         Amazon Web Services services on behalf of the Amazon Web Services account.\n"]
  timeout_in_minutes : build_time_out option;
      [@ocaml.doc
        "The replacement value in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before \
         timing out any related build that did not get marked as completed.\n"]
  queued_timeout_in_minutes : time_out option;
      [@ocaml.doc " The number of minutes a build is allowed to be queued before it times out. \n"]
  encryption_key : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) to be used for encrypting the build \
         output artifacts.\n\n\
        \   You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ). \n\
        \    "]
  tags : tag_list option;
      [@ocaml.doc
        "An updated list of tag key and value pairs associated with this build project.\n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         build project tags.\n\
        \ "]
  vpc_config : vpc_config option;
      [@ocaml.doc "VpcConfig enables CodeBuild to access resources in an Amazon VPC.\n"]
  badge_enabled : wrapper_boolean option;
      [@ocaml.doc
        "Set this to true to generate a publicly accessible URL for your project's build badge.\n"]
  logs_config : logs_config option;
      [@ocaml.doc
        " Information about logs for the build project. A project can create logs in CloudWatch \
         Logs, logs in an S3 bucket, or both. \n"]
  file_system_locations : project_file_system_locations option;
      [@ocaml.doc
        " An array of [ProjectFileSystemLocation] objects for a CodeBuild build project. A \
         [ProjectFileSystemLocation] object specifies the [identifier], [location], \
         [mountOptions], [mountPoint], and [type] of a file system created using Amazon Elastic \
         File System. \n"]
  build_batch_config : project_build_batch_config option; [@ocaml.doc ""]
  concurrent_build_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of concurrent builds that are allowed for this project.\n\n\
        \ New builds are only started if the current number of builds is less than or equal to \
         this limit. If the current build count meets this limit, new builds are throttled and are \
         not run.\n\
        \ \n\
        \  To remove this limit, set this value to -1.\n\
        \  "]
  auto_retry_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of additional automatic retries after a failed build. For example, if \
         the auto-retry limit is set to 2, CodeBuild will call the [RetryBuild] API to \
         automatically retry your build for up to 2 additional times.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_output = { fleet : fleet option [@ocaml.doc "A [Fleet] object.\n"] }
[@@ocaml.doc ""]

type nonrec scaling_configuration_input = {
  scaling_type : fleet_scaling_type option; [@ocaml.doc "The scaling type for a compute fleet.\n"]
  target_tracking_scaling_configs : target_tracking_scaling_configurations option;
      [@ocaml.doc "A list of [TargetTrackingScalingConfiguration] objects.\n"]
  max_capacity : fleet_capacity option;
      [@ocaml.doc "The maximum number of instances in the \239\172\130eet when auto-scaling.\n"]
}
[@@ocaml.doc "The scaling configuration input of a compute fleet.\n"]

type nonrec update_fleet_input = {
  arn : non_empty_string; [@ocaml.doc "The ARN of the compute fleet.\n"]
  base_capacity : fleet_capacity option;
      [@ocaml.doc
        "The initial number of machines allocated to the compute \239\172\130eet, which \
         de\239\172\129nes the number of builds that can run in parallel.\n"]
  environment_type : environment_type option;
      [@ocaml.doc
        "The environment type of the compute fleet.\n\n\
        \ {ul\n\
        \       {-  The environment type [ARM_CONTAINER] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific (Mumbai), Asia \
         Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and \
         South America (S\195\163o Paulo).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [ARM_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_CONTAINER] is available only in regions US East \
         (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia \
         Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America \
         (S\195\163o Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_GPU_CONTAINER] is available only in regions US \
         East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia \
         Pacific (Tokyo), and Asia Pacific (Sydney).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [MAC_ARM] is available for Medium fleets only in regions \
         US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), and EU \
         (Frankfurt)\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [MAC_ARM] is available for Large fleets only in regions \
         US East (N. Virginia), US East (Ohio), US West (Oregon), and Asia Pacific (Sydney).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_SERVER_2019_CONTAINER] is available only in \
         regions US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), \
         Asia Pacific (Tokyo), Asia Pacific (Mumbai) and EU (Ireland).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_SERVER_2022_CONTAINER] is available only in \
         regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU \
         (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore), Asia Pacific (Tokyo), South \
         America (S\195\163o Paulo) and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html}Build \
         environment compute types} in the {i CodeBuild user guide}.\n\
        \   "]
  compute_type : compute_type option;
      [@ocaml.doc
        "Information about the compute resources the compute fleet uses. Available values include:\n\n\
        \ {ul\n\
        \       {-   [ATTRIBUTE_BASED_COMPUTE]: Specify the amount of vCPUs, memory, disk space, \
         and the type of machine.\n\
        \           \n\
        \              If you use [ATTRIBUTE_BASED_COMPUTE], you must define your attributes by \
         using [computeConfiguration]. CodeBuild will select the cheapest instance that satisfies \
         your specified attributes. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.types}Reserved \
         capacity environment types} in the {i CodeBuild User Guide}.\n\
        \             \n\
        \               }\n\
        \       {-   [CUSTOM_INSTANCE_TYPE]: Specify the instance type for your compute fleet. For \
         a list of supported instance types, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.instance-types}Supported \
         instance families } in the {i CodeBuild User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_SMALL]: Use up to 4 GiB memory and 2 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_MEDIUM]: Use up to 8 GiB memory and 4 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_LARGE]: Use up to 16 GiB memory and 8 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_XLARGE]: Use up to 72 GiB memory and 36 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_2XLARGE]: Use up to 144 GiB memory, 72 vCPUs, and 824 GB of \
         SSD storage for builds. This compute type supports Docker images up to 100 GB \
         uncompressed.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_1GB]: Use up to 1 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_2GB]: Use up to 2 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_4GB]: Use up to 4 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_8GB]: Use up to 8 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_10GB]: Use up to 10 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you use [BUILD_GENERAL1_SMALL]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 4 GiB memory and \
         2 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 16 GiB \
         memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 4 GiB memory and 2 \
         vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    If you use [BUILD_GENERAL1_LARGE]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 16 GiB memory \
         and 8 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 255 GiB \
         memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 16 GiB memory and \
         8 vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment.types}On-demand \
         environment types} in the {i CodeBuild User Guide.} \n\
        \   "]
  compute_configuration : compute_configuration option;
      [@ocaml.doc
        "The compute configuration of the compute fleet. This is only required if [computeType] is \
         set to [ATTRIBUTE_BASED_COMPUTE] or [CUSTOM_INSTANCE_TYPE].\n"]
  scaling_configuration : scaling_configuration_input option;
      [@ocaml.doc "The scaling configuration of the compute fleet.\n"]
  overflow_behavior : fleet_overflow_behavior option;
      [@ocaml.doc
        "The compute fleet overflow behavior.\n\n\
        \ {ul\n\
        \       {-  For overflow behavior [QUEUE], your overflow builds need to wait on the \
         existing fleet instance to become available.\n\
        \           \n\
        \            }\n\
        \       {-  For overflow behavior [ON_DEMAND], your overflow builds run on CodeBuild \
         on-demand.\n\
        \           \n\
        \             If you choose to set your overflow behavior to on-demand while creating a \
         VPC-connected fleet, make sure that you add the required VPC permissions to your project \
         service role. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-create-vpc-network-interface}Example \
         policy statement to allow CodeBuild access to Amazon Web Services services required to \
         create a VPC network interface}.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option; [@ocaml.doc ""]
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc "The proxy configuration of the compute fleet.\n"]
  image_id : non_empty_string option;
      [@ocaml.doc "The Amazon Machine Image (AMI) of the compute fleet.\n"]
  fleet_service_role : non_empty_string option;
      [@ocaml.doc
        "The service role associated with the compute fleet. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-permission-policy-fleet-service-role.html} \
         Allow a user to add a permission policy for a fleet service role} in the {i CodeBuild \
         User Guide}.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tag key and value pairs associated with this compute fleet.\n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         build project tags.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec stop_sandbox_output = {
  sandbox : sandbox option; [@ocaml.doc "Information about the requested sandbox.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_sandbox_input = {
  id : non_empty_string; [@ocaml.doc "Information about the requested sandbox ID.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_build_batch_output = { build_batch : build_batch option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec stop_build_batch_input = {
  id : non_empty_string; [@ocaml.doc "The identifier of the batch build to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_build_output = {
  build : build option; [@ocaml.doc "Information about the build.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_build_input = { id : non_empty_string [@ocaml.doc "The ID of the build.\n"] }
[@@ocaml.doc ""]

type nonrec ssm_session = {
  session_id : string_ option; [@ocaml.doc "The ID of the session.\n"]
  token_value : string_ option;
      [@ocaml.doc "An encrypted token value containing session and caller information.\n"]
  stream_url : string_ option;
      [@ocaml.doc
        "A URL back to SSM Agent on the managed node that the Session Manager client uses to send \
         commands and receive output from the node.\n"]
}
[@@ocaml.doc "Contains information about the Session Manager session.\n"]

type nonrec start_sandbox_connection_output = {
  ssm_session : ssm_session option; [@ocaml.doc "Information about the Session Manager session.\n"]
}
[@@ocaml.doc ""]

type nonrec start_sandbox_connection_input = {
  sandbox_id : non_empty_string; [@ocaml.doc "A [sandboxId] or [sandboxArn].\n"]
}
[@@ocaml.doc ""]

type nonrec start_sandbox_output = {
  sandbox : sandbox option; [@ocaml.doc "Information about the requested sandbox.\n"]
}
[@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec start_sandbox_input = {
  project_name : non_empty_string option; [@ocaml.doc "The CodeBuild project name.\n"]
  idempotency_token : sensitive_string option; [@ocaml.doc "A unique client token.\n"]
}
[@@ocaml.doc ""]

type nonrec start_command_execution_output = {
  command_execution : command_execution option;
      [@ocaml.doc "Information about the requested command executions.\n"]
}
[@@ocaml.doc ""]

type nonrec start_command_execution_input = {
  sandbox_id : non_empty_string; [@ocaml.doc "A [sandboxId] or [sandboxArn].\n"]
  command : sensitive_non_empty_string; [@ocaml.doc "The command that needs to be executed.\n"]
  type_ : command_type option; [@ocaml.doc "The command type.\n"]
}
[@@ocaml.doc ""]

type nonrec start_build_batch_output = {
  build_batch : build_batch option;
      [@ocaml.doc "A [BuildBatch] object that contains information about the batch build.\n"]
}
[@@ocaml.doc ""]

type nonrec start_build_batch_input = {
  project_name : non_empty_string; [@ocaml.doc "The name of the project.\n"]
  secondary_sources_override : project_sources option;
      [@ocaml.doc
        "An array of [ProjectSource] objects that override the secondary sources defined in the \
         batch build project.\n"]
  secondary_sources_version_override : project_secondary_source_versions option;
      [@ocaml.doc
        "An array of [ProjectSourceVersion] objects that override the secondary source versions in \
         the batch build project.\n"]
  source_version : string_ option;
      [@ocaml.doc
        "The version of the batch build input to be built, for this build only. If not specified, \
         the latest version is used. If specified, the contents depends on the source provider:\n\n\
        \  CodeCommit  The commit ID, branch, or Git tag to use.\n\
        \              \n\
        \                GitHub  The commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example [pr/25]). If a branch \
         name is specified, the branch's HEAD commit ID is used. If not specified, the default \
         branch's HEAD commit ID is used.\n\
        \                        \n\
        \                          Bitbucket  The commit ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a branch name is \
         specified, the branch's HEAD commit ID is used. If not specified, the default branch's \
         HEAD commit ID is used.\n\
        \                                     \n\
        \                                       Amazon S3  The version ID of the object that \
         represents the build input ZIP file to use.\n\
        \                                                  \n\
        \                                                     If [sourceVersion] is specified at \
         the project level, then this [sourceVersion] (at the build level) takes precedence. \n\
        \                                                     \n\
        \                                                      For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \                                                      "]
  artifacts_override : project_artifacts option;
      [@ocaml.doc
        "An array of [ProjectArtifacts] objects that contains information about the build output \
         artifact overrides for the build project.\n"]
  secondary_artifacts_override : project_artifacts_list option;
      [@ocaml.doc
        "An array of [ProjectArtifacts] objects that override the secondary artifacts defined in \
         the batch build project.\n"]
  environment_variables_override : environment_variables option;
      [@ocaml.doc
        "An array of [EnvironmentVariable] objects that override, or add to, the environment \
         variables defined in the batch build project.\n"]
  source_type_override : source_type option;
      [@ocaml.doc
        "The source input type that overrides the source input defined in the batch build project.\n"]
  source_location_override : string_ option;
      [@ocaml.doc
        "A location that overrides, for this batch build, the source location defined in the batch \
         build project.\n"]
  source_auth_override : source_auth option;
      [@ocaml.doc
        "A [SourceAuth] object that overrides the one defined in the batch build project. This \
         override applies only if the build project's source is BitBucket or GitHub.\n"]
  git_clone_depth_override : git_clone_depth option;
      [@ocaml.doc
        "The user-defined depth of history, with a minimum value of 0, that overrides, for this \
         batch build only, any previous depth of history defined in the batch build project.\n"]
  git_submodules_config_override : git_submodules_config option;
      [@ocaml.doc
        "A [GitSubmodulesConfig] object that overrides the Git submodules configuration for this \
         batch build.\n"]
  buildspec_override : string_ option;
      [@ocaml.doc
        "A buildspec file declaration that overrides, for this build only, the latest one already \
         defined in the build project.\n\n\
        \ If this value is set, it can be either an inline buildspec definition, the path to an \
         alternate buildspec file relative to the value of the built-in [CODEBUILD_SRC_DIR] \
         environment variable, or the path to an S3 bucket. The bucket must be in the same Amazon \
         Web Services Region as the build project. Specify the buildspec file using its ARN (for \
         example, [arn:aws:s3:::my-codebuild-sample2/buildspec.yml]). If this value is not \
         provided or is set to an empty string, the source code must contain a buildspec file in \
         its root directory. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage}Buildspec \
         File Name and Storage Location}. \n\
        \ "]
  insecure_ssl_override : wrapper_boolean option;
      [@ocaml.doc
        "Enable this flag to override the insecure SSL setting that is specified in the batch \
         build project. The insecure SSL setting determines whether to ignore SSL warnings while \
         connecting to the project source code. This override applies only if the build's source \
         is GitHub Enterprise.\n"]
  report_build_batch_status_override : wrapper_boolean option;
      [@ocaml.doc
        "Set to [true] to report to your source provider the status of a batch build's start and \
         completion. If you use this option with a source provider other than GitHub, GitHub \
         Enterprise, or Bitbucket, an [invalidInputException] is thrown. \n\n\
        \  The status of a build triggered by a webhook is always reported to your source provider. \n\
        \  \n\
        \   "]
  environment_type_override : environment_type option;
      [@ocaml.doc
        "A container type for this batch build that overrides the one specified in the batch build \
         project.\n"]
  image_override : non_empty_string option;
      [@ocaml.doc
        "The name of an image for this batch build that overrides the one specified in the batch \
         build project.\n"]
  compute_type_override : compute_type option;
      [@ocaml.doc
        "The name of a compute type for this batch build that overrides the one specified in the \
         batch build project.\n"]
  certificate_override : string_ option;
      [@ocaml.doc
        "The name of a certificate for this batch build that overrides the one specified in the \
         batch build project.\n"]
  cache_override : project_cache option;
      [@ocaml.doc "A [ProjectCache] object that specifies cache overrides.\n"]
  service_role_override : non_empty_string option;
      [@ocaml.doc
        "The name of a service role for this batch build that overrides the one specified in the \
         batch build project.\n"]
  privileged_mode_override : wrapper_boolean option;
      [@ocaml.doc "Enable this flag to override privileged mode in the batch build project.\n"]
  build_timeout_in_minutes_override : build_time_out option;
      [@ocaml.doc "Overrides the build timeout specified in the batch build project.\n"]
  queued_timeout_in_minutes_override : time_out option;
      [@ocaml.doc
        "The number of minutes a batch build is allowed to be queued before it times out.\n"]
  encryption_key_override : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) that overrides the one specified in \
         the batch build project. The CMK key encrypts the build output artifacts.\n\n\
        \  You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ).\n\
        \    "]
  idempotency_token : string_ option;
      [@ocaml.doc
        "A unique, case sensitive identifier you provide to ensure the idempotency of the \
         [StartBuildBatch] request. The token is included in the [StartBuildBatch] request and is \
         valid for five minutes. If you repeat the [StartBuildBatch] request with the same token, \
         but change a parameter, CodeBuild returns a parameter mismatch error.\n"]
  logs_config_override : logs_config option;
      [@ocaml.doc
        "A [LogsConfig] object that override the log settings defined in the batch build project.\n"]
  registry_credential_override : registry_credential option;
      [@ocaml.doc
        "A [RegistryCredential] object that overrides credentials for access to a private registry.\n"]
  image_pull_credentials_type_override : image_pull_credentials_type option;
      [@ocaml.doc
        "The type of credentials CodeBuild uses to pull images in your batch build. There are two \
         valid values: \n\n\
        \  CODEBUILD  Specifies that CodeBuild uses its own credentials. This requires that you \
         modify your ECR repository policy to trust CodeBuild's service principal.\n\
        \             \n\
        \               SERVICE_ROLE  Specifies that CodeBuild uses your build project's service \
         role. \n\
        \                             \n\
        \                                When using a cross-account or private registry image, you \
         must use [SERVICE_ROLE] credentials. When using an CodeBuild curated image, you must use \
         [CODEBUILD] credentials. \n\
        \                                "]
  build_batch_config_override : project_build_batch_config option;
      [@ocaml.doc
        "A [BuildBatchConfigOverride] object that contains batch build configuration overrides.\n"]
  debug_session_enabled : wrapper_boolean option;
      [@ocaml.doc
        "Specifies if session debugging is enabled for this batch build. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html}Viewing a \
         running build in Session Manager}. Batch session debugging is not supported for matrix \
         batch builds.\n"]
}
[@@ocaml.doc ""]

type nonrec start_build_output = {
  build : build option; [@ocaml.doc "Information about the build to be run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_build_input = {
  project_name : non_empty_string;
      [@ocaml.doc "The name of the CodeBuild build project to start running a build.\n"]
  secondary_sources_override : project_sources option;
      [@ocaml.doc " An array of [ProjectSource] objects. \n"]
  secondary_sources_version_override : project_secondary_source_versions option;
      [@ocaml.doc
        " An array of [ProjectSourceVersion] objects that specify one or more versions of the \
         project's secondary sources to be used for this build only. \n"]
  source_version : string_ option;
      [@ocaml.doc
        "The version of the build input to be built, for this build only. If not specified, the \
         latest version is used. If specified, the contents depends on the source provider:\n\n\
        \  CodeCommit  The commit ID, branch, or Git tag to use.\n\
        \              \n\
        \                GitHub  The commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example [pr/25]). If a branch \
         name is specified, the branch's HEAD commit ID is used. If not specified, the default \
         branch's HEAD commit ID is used.\n\
        \                        \n\
        \                          GitLab  The commit ID, branch, or Git tag to use.\n\
        \                                  \n\
        \                                    Bitbucket  The commit ID, branch name, or tag name \
         that corresponds to the version of the source code you want to build. If a branch name is \
         specified, the branch's HEAD commit ID is used. If not specified, the default branch's \
         HEAD commit ID is used.\n\
        \                                               \n\
        \                                                 Amazon S3  The version ID of the object \
         that represents the build input ZIP file to use.\n\
        \                                                            \n\
        \                                                               If [sourceVersion] is \
         specified at the project level, then this [sourceVersion] (at the build level) takes \
         precedence. \n\
        \                                                               \n\
        \                                                                For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \                                                                "]
  artifacts_override : project_artifacts option;
      [@ocaml.doc
        "Build output artifact settings that override, for this build only, the latest ones \
         already defined in the build project.\n"]
  secondary_artifacts_override : project_artifacts_list option;
      [@ocaml.doc " An array of [ProjectArtifacts] objects. \n"]
  environment_variables_override : environment_variables option;
      [@ocaml.doc
        "A set of environment variables that overrides, for this build only, the latest ones \
         already defined in the build project.\n"]
  source_type_override : source_type option;
      [@ocaml.doc
        "A source input type, for this build, that overrides the source input defined in the build \
         project.\n"]
  source_location_override : string_ option;
      [@ocaml.doc
        "A location that overrides, for this build, the source location for the one defined in the \
         build project.\n"]
  source_auth_override : source_auth option;
      [@ocaml.doc
        "An authorization type for this build that overrides the one defined in the build project. \
         This override applies only if the build project's source is BitBucket, GitHub, GitLab, or \
         GitLab Self Managed.\n"]
  git_clone_depth_override : git_clone_depth option;
      [@ocaml.doc
        "The user-defined depth of history, with a minimum value of 0, that overrides, for this \
         build only, any previous depth of history defined in the build project.\n"]
  git_submodules_config_override : git_submodules_config option;
      [@ocaml.doc
        " Information about the Git submodules configuration for this build of an CodeBuild build \
         project. \n"]
  buildspec_override : string_ option;
      [@ocaml.doc
        "A buildspec file declaration that overrides the latest one defined in the build project, \
         for this build only. The buildspec defined on the project is not changed.\n\n\
        \ If this value is set, it can be either an inline buildspec definition, the path to an \
         alternate buildspec file relative to the value of the built-in [CODEBUILD_SRC_DIR] \
         environment variable, or the path to an S3 bucket. The bucket must be in the same Amazon \
         Web Services Region as the build project. Specify the buildspec file using its ARN (for \
         example, [arn:aws:s3:::my-codebuild-sample2/buildspec.yml]). If this value is not \
         provided or is set to an empty string, the source code must contain a buildspec file in \
         its root directory. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage}Buildspec \
         File Name and Storage Location}.\n\
        \ \n\
        \   Since this property allows you to change the build commands that will run in the \
         container, you should note that an IAM principal with the ability to call this API and \
         set this parameter can override the default settings. Moreover, we encourage that you use \
         a trustworthy buildspec location like a file in your source repository or a Amazon S3 \
         bucket. Alternatively, you can restrict overrides to the buildspec by using a condition \
         key: \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/action-context-keys.html#action-context-keys-example-overridebuildspec.html}Prevent \
         unauthorized modifications to project buildspec}.\n\
        \   \n\
        \    "]
  insecure_ssl_override : wrapper_boolean option;
      [@ocaml.doc
        "Enable this flag to override the insecure SSL setting that is specified in the build \
         project. The insecure SSL setting determines whether to ignore SSL warnings while \
         connecting to the project source code. This override applies only if the build's source \
         is GitHub Enterprise.\n"]
  report_build_status_override : wrapper_boolean option;
      [@ocaml.doc
        " Set to true to report to your source provider the status of a build's start and \
         completion. If you use this option with a source provider other than GitHub, GitHub \
         Enterprise, GitLab, GitLab Self Managed, or Bitbucket, an [invalidInputException] is \
         thrown. \n\n\
        \ To be able to report the build status to the source provider, the user associated with \
         the source provider must have write access to the repo. If the user does not have write \
         access, the build status cannot be updated. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/access-tokens.html}Source \
         provider access} in the {i CodeBuild User Guide}.\n\
        \ \n\
        \    The status of a build triggered by a webhook is always reported to your source \
         provider. \n\
        \   \n\
        \    "]
  build_status_config_override : build_status_config option;
      [@ocaml.doc
        "Contains information that defines how the build project reports the build status to the \
         source provider. This option is only used when the source provider is [GITHUB], \
         [GITHUB_ENTERPRISE], or [BITBUCKET].\n"]
  environment_type_override : environment_type option;
      [@ocaml.doc
        "A container type for this build that overrides the one specified in the build project.\n"]
  image_override : non_empty_string option;
      [@ocaml.doc
        "The name of an image for this build that overrides the one specified in the build project.\n"]
  compute_type_override : compute_type option;
      [@ocaml.doc
        "The name of a compute type for this build that overrides the one specified in the build \
         project.\n"]
  certificate_override : string_ option;
      [@ocaml.doc
        "The name of a certificate for this build that overrides the one specified in the build \
         project.\n"]
  cache_override : project_cache option;
      [@ocaml.doc
        "A ProjectCache object specified for this build that overrides the one defined in the \
         build project.\n"]
  service_role_override : non_empty_string option;
      [@ocaml.doc
        "The name of a service role for this build that overrides the one specified in the build \
         project.\n"]
  privileged_mode_override : wrapper_boolean option;
      [@ocaml.doc "Enable this flag to override privileged mode in the build project.\n"]
  timeout_in_minutes_override : build_time_out option;
      [@ocaml.doc
        "The number of build timeout minutes, from 5 to 2160 (36 hours), that overrides, for this \
         build only, the latest setting already defined in the build project.\n"]
  queued_timeout_in_minutes_override : time_out option;
      [@ocaml.doc " The number of minutes a build is allowed to be queued before it times out. \n"]
  encryption_key_override : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) that overrides the one specified in \
         the build project. The CMK key encrypts the build output artifacts.\n\n\
        \   You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ).\n\
        \    "]
  idempotency_token : string_ option;
      [@ocaml.doc
        "A unique, case sensitive identifier you provide to ensure the idempotency of the \
         StartBuild request. The token is included in the StartBuild request and is valid for 5 \
         minutes. If you repeat the StartBuild request with the same token, but change a \
         parameter, CodeBuild returns a parameter mismatch error. \n"]
  logs_config_override : logs_config option;
      [@ocaml.doc
        " Log settings for this build that override the log settings defined in the build project. \n"]
  registry_credential_override : registry_credential option;
      [@ocaml.doc " The credentials for access to a private registry. \n"]
  image_pull_credentials_type_override : image_pull_credentials_type option;
      [@ocaml.doc
        "The type of credentials CodeBuild uses to pull images in your build. There are two valid \
         values: \n\n\
        \  CODEBUILD  Specifies that CodeBuild uses its own credentials. This requires that you \
         modify your ECR repository policy to trust CodeBuild's service principal.\n\
        \             \n\
        \               SERVICE_ROLE  Specifies that CodeBuild uses your build project's service \
         role. \n\
        \                             \n\
        \                                When using a cross-account or private registry image, you \
         must use [SERVICE_ROLE] credentials. When using an CodeBuild curated image, you must use \
         [CODEBUILD] credentials. \n\
        \                                "]
  debug_session_enabled : wrapper_boolean option;
      [@ocaml.doc
        "Specifies if session debugging is enabled for this build. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html}Viewing a \
         running build in Session Manager}.\n"]
  fleet_override : project_fleet option;
      [@ocaml.doc
        "A ProjectFleet object specified for this build that overrides the one defined in the \
         build project.\n"]
  auto_retry_limit_override : wrapper_int option;
      [@ocaml.doc
        "The maximum number of additional automatic retries after a failed build. For example, if \
         the auto-retry limit is set to 2, CodeBuild will call the [RetryBuild] API to \
         automatically retry your build for up to 2 additional times.\n"]
  host_kernel_override : host_kernel option;
      [@ocaml.doc
        "The host operating system kernel for this build that overrides the one specified in the \
         build project.\n"]
}
[@@ocaml.doc ""]

type nonrec retry_build_batch_output = { build_batch : build_batch option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec retry_build_batch_type =
  | RETRY_ALL_BUILDS [@ocaml.doc ""]
  | RETRY_FAILED_BUILDS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec retry_build_batch_input = {
  id : non_empty_string option;
      [@ocaml.doc "Specifies the identifier of the batch build to restart.\n"]
  idempotency_token : string_ option;
      [@ocaml.doc
        "A unique, case sensitive identifier you provide to ensure the idempotency of the \
         [RetryBuildBatch] request. The token is included in the [RetryBuildBatch] request and is \
         valid for five minutes. If you repeat the [RetryBuildBatch] request with the same token, \
         but change a parameter, CodeBuild returns a parameter mismatch error.\n"]
  retry_type : retry_build_batch_type option;
      [@ocaml.doc "Specifies the type of retry to perform.\n"]
}
[@@ocaml.doc ""]

type nonrec retry_build_output = { build : build option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec retry_build_input = {
  id : non_empty_string option; [@ocaml.doc "Specifies the identifier of the build to restart.\n"]
  idempotency_token : string_ option;
      [@ocaml.doc
        "A unique, case sensitive identifier you provide to ensure the idempotency of the \
         [RetryBuild] request. The token is included in the [RetryBuild] request and is valid for \
         five minutes. If you repeat the [RetryBuild] request with the same token, but change a \
         parameter, CodeBuild returns a parameter mismatch error.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_output = {
  resource_arn : non_empty_string option;
      [@ocaml.doc
        " The ARN of the [Project] or [ReportGroup] resource that is associated with a resource \
         policy. \n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_input = {
  policy : non_empty_string;
      [@ocaml.doc
        " A JSON-formatted resource policy. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/project-sharing.html#project-sharing-share}Sharing \
         a Project} and \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/report-groups-sharing.html#report-groups-sharing-share}Sharing \
         a Report Group} in the {i CodeBuild User Guide}. \n"]
  resource_arn : non_empty_string;
      [@ocaml.doc
        " The ARN of the [Project] or [ReportGroup] resource you want to associate with a resource \
         policy. \n"]
}
[@@ocaml.doc ""]

type nonrec server_type =
  | GITHUB [@ocaml.doc ""]
  | BITBUCKET [@ocaml.doc ""]
  | GITHUB_ENTERPRISE [@ocaml.doc ""]
  | GITLAB [@ocaml.doc ""]
  | GITLAB_SELF_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_credentials_info = {
  arn : non_empty_string option; [@ocaml.doc " The Amazon Resource Name (ARN) of the token. \n"]
  server_type : server_type option;
      [@ocaml.doc
        " The type of source provider. The valid options are GITHUB, GITHUB_ENTERPRISE, GITLAB, \
         GITLAB_SELF_MANAGED, or BITBUCKET. \n"]
  auth_type : auth_type option;
      [@ocaml.doc
        " The type of authentication used by the credentials. Valid options are OAUTH, BASIC_AUTH, \
         PERSONAL_ACCESS_TOKEN, CODECONNECTIONS, or SECRETS_MANAGER. \n"]
  resource : string_ option;
      [@ocaml.doc "The connection ARN if your authType is CODECONNECTIONS or SECRETS_MANAGER.\n"]
}
[@@ocaml.doc
  " Information about the credentials for a GitHub, GitHub Enterprise, GitLab, GitLab Self \
   Managed, or Bitbucket repository. \n"]

type nonrec source_credentials_infos = source_credentials_info list [@@ocaml.doc ""]

type nonrec list_source_credentials_output = {
  source_credentials_infos : source_credentials_infos option;
      [@ocaml.doc
        " A list of [SourceCredentialsInfo] objects. Each [SourceCredentialsInfo] object includes \
         the authentication type, token ARN, and type of source provider for one set of \
         credentials. \n"]
}
[@@ocaml.doc ""]

type nonrec list_source_credentials_input = unit [@@ocaml.doc ""]

type nonrec list_shared_report_groups_output = {
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  report_groups : report_group_arns option;
      [@ocaml.doc
        " The list of ARNs for the report groups shared with the current Amazon Web Services \
         account or user. \n"]
}
[@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec shared_resource_sort_by_type = ARN [@ocaml.doc ""] | MODIFIED_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_order_type = ASCENDING [@ocaml.doc ""] | DESCENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_shared_report_groups_input = {
  sort_order : sort_order_type option;
      [@ocaml.doc
        "The order in which to list shared report groups. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List in ascending order.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List in descending order.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  sort_by : shared_resource_sort_by_type option;
      [@ocaml.doc
        " The criterion to be used to list report groups shared with the current Amazon Web \
         Services account or user. Valid values include: \n\n\
        \ {ul\n\
        \       {-   [ARN]: List based on the ARN. \n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED_TIME]: List based on when information about the shared report group \
         was last changed. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of paginated shared report groups per response. Use [nextToken] to \
         iterate pages in the list of returned [ReportGroup] objects. The default value is 100. \n"]
}
[@@ocaml.doc ""]

type nonrec project_arns = non_empty_string list [@@ocaml.doc ""]

type nonrec list_shared_projects_output = {
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  projects : project_arns option;
      [@ocaml.doc
        " The list of ARNs for the build projects shared with the current Amazon Web Services \
         account or user. \n"]
}
[@@ocaml.doc ""]

type nonrec list_shared_projects_input = {
  sort_by : shared_resource_sort_by_type option;
      [@ocaml.doc
        " The criterion to be used to list build projects shared with the current Amazon Web \
         Services account or user. Valid values include: \n\n\
        \ {ul\n\
        \       {-   [ARN]: List based on the ARN. \n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED_TIME]: List based on when information about the shared project was \
         last changed. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  sort_order : sort_order_type option;
      [@ocaml.doc
        "The order in which to list shared build projects. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List in ascending order.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List in descending order.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of paginated shared build projects returned per response. Use \
         [nextToken] to iterate pages in the list of returned [Project] objects. The default value \
         is 100. \n"]
  next_token : non_empty_string option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
}
[@@ocaml.doc ""]

type nonrec list_sandboxes_for_project_output = {
  ids : sandbox_ids option; [@ocaml.doc "Information about the requested sandbox IDs.\n"]
  next_token : string_ option;
      [@ocaml.doc "Information about the next token to get paginated results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sandboxes_for_project_input = {
  project_name : non_empty_string; [@ocaml.doc "The CodeBuild project name.\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of sandbox records to be retrieved.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc "The order in which sandbox records should be retrieved.\n"]
  next_token : sensitive_string option;
      [@ocaml.doc
        "The next token, if any, to get paginated results. You will get this value from previous \
         execution of list sandboxes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sandboxes_output = {
  ids : sandbox_ids option; [@ocaml.doc "Information about the requested sandbox IDs.\n"]
  next_token : string_ option;
      [@ocaml.doc "Information about the next token to get paginated results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sandboxes_input = {
  max_results : page_size option;
      [@ocaml.doc "The maximum number of sandbox records to be retrieved.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc "The order in which sandbox records should be retrieved.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The next token, if any, to get paginated results. You will get this value from previous \
         execution of list sandboxes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_reports_for_report_group_output = {
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  reports : report_arns option; [@ocaml.doc " The list of report ARNs. \n"]
}
[@@ocaml.doc ""]

type nonrec report_filter = {
  status : report_status_type option;
      [@ocaml.doc " The status used to filter reports. You can filter using one status only. \n"]
}
[@@ocaml.doc
  " A filter used to return reports with the status specified by the input [status] parameter. \n"]

type nonrec list_reports_for_report_group_input = {
  report_group_arn : string_;
      [@ocaml.doc " The ARN of the report group for which you want to return report ARNs. \n"]
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  sort_order : sort_order_type option;
      [@ocaml.doc
        " Use to specify whether the results are returned in ascending or descending order. \n"]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of paginated reports in this report group returned per response. Use \
         [nextToken] to iterate pages in the list of returned [Report] objects. The default value \
         is 100. \n"]
  filter : report_filter option;
      [@ocaml.doc " A [ReportFilter] object used to filter the returned reports. \n"]
}
[@@ocaml.doc ""]

type nonrec list_reports_output = {
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  reports : report_arns option;
      [@ocaml.doc
        " The list of returned ARNs for the reports in the current Amazon Web Services account. \n"]
}
[@@ocaml.doc ""]

type nonrec list_reports_input = {
  sort_order : sort_order_type option;
      [@ocaml.doc
        " Specifies the sort order for the list of returned reports. Valid values are: \n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: return reports in chronological order based on their creation \
         date. \n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: return reports in the reverse chronological order based on \
         their creation date. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of paginated reports returned per response. Use [nextToken] to \
         iterate pages in the list of returned [Report] objects. The default value is 100. \n"]
  filter : report_filter option;
      [@ocaml.doc " A [ReportFilter] object used to filter the returned reports. \n"]
}
[@@ocaml.doc ""]

type nonrec list_report_groups_output = {
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  report_groups : report_group_arns option;
      [@ocaml.doc
        " The list of ARNs for the report groups in the current Amazon Web Services account. \n"]
}
[@@ocaml.doc ""]

type nonrec report_group_sort_by_type =
  | NAME [@ocaml.doc ""]
  | CREATED_TIME [@ocaml.doc ""]
  | LAST_MODIFIED_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_report_groups_input = {
  sort_order : sort_order_type option;
      [@ocaml.doc
        " Used to specify the order to sort the list of returned report groups. Valid values are \
         [ASCENDING] and [DESCENDING]. \n"]
  sort_by : report_group_sort_by_type option;
      [@ocaml.doc
        " The criterion to be used to list build report groups. Valid values include: \n\n\
        \ {ul\n\
        \       {-   [CREATED_TIME]: List based on when each report group was created.\n\
        \           \n\
        \            }\n\
        \       {-   [LAST_MODIFIED_TIME]: List based on when each report group was last changed.\n\
        \           \n\
        \            }\n\
        \       {-   [NAME]: List based on each report group's name.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of paginated report groups returned per response. Use [nextToken] to \
         iterate pages in the list of returned [ReportGroup] objects. The default value is 100. \n"]
}
[@@ocaml.doc ""]

type nonrec list_projects_output = {
  next_token : string_ option;
      [@ocaml.doc
        "If there are more than 100 items in the list, only the first 100 items are returned, \
         along with a unique string called a {i nextToken}. To get the next batch of items in the \
         list, call this operation again, adding the next token to the call.\n"]
  projects : project_names option;
      [@ocaml.doc
        "The list of build project names, with each build project name representing a single build \
         project.\n"]
}
[@@ocaml.doc ""]

type nonrec project_sort_by_type =
  | NAME [@ocaml.doc ""]
  | CREATED_TIME [@ocaml.doc ""]
  | LAST_MODIFIED_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_projects_input = {
  sort_by : project_sort_by_type option;
      [@ocaml.doc
        "The criterion to be used to list build project names. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [CREATED_TIME]: List based on when each build project was created.\n\
        \           \n\
        \            }\n\
        \       {-   [LAST_MODIFIED_TIME]: List based on when information about each build project \
         was last changed.\n\
        \           \n\
        \            }\n\
        \       {-   [NAME]: List based on each build project's name.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Use [sortOrder] to specify in what order to list the build project names based on the \
         preceding criteria.\n\
        \   "]
  sort_order : sort_order_type option;
      [@ocaml.doc
        "The order in which to list build projects. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List in ascending order.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List in descending order.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Use [sortBy] to specify the criterion to be used to list build project names.\n\
        \   "]
  next_token : non_empty_string option;
      [@ocaml.doc
        "During a previous call, if there are more than 100 items in the list, only the first 100 \
         items are returned, along with a unique string called a {i nextToken}. To get the next \
         batch of items in the list, call this operation again, adding the next token to the call. \
         To get all of the items in the list, keep calling this operation with each subsequent \
         next token that is returned, until no more next tokens are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_arns = non_empty_string list [@@ocaml.doc ""]

type nonrec list_fleets_output = {
  next_token : string_ option;
      [@ocaml.doc
        "If there are more than 100 items in the list, only the first 100 items are returned, \
         along with a unique string called a {i nextToken}. To get the next batch of items in the \
         list, call this operation again, adding the next token to the call.\n"]
  fleets : fleet_arns option; [@ocaml.doc "The list of compute fleet names.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_sort_by_type =
  | NAME [@ocaml.doc ""]
  | CREATED_TIME [@ocaml.doc ""]
  | LAST_MODIFIED_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_fleets_input = {
  next_token : sensitive_string option;
      [@ocaml.doc
        "During a previous call, if there are more than 100 items in the list, only the first 100 \
         items are returned, along with a unique string called a {i nextToken}. To get the next \
         batch of items in the list, call this operation again, adding the next token to the call. \
         To get all of the items in the list, keep calling this operation with each subsequent \
         next token that is returned, until no more next tokens are returned.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "The maximum number of paginated compute fleets returned per response. Use [nextToken] to \
         iterate pages in the list of returned compute fleets.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc
        "The order in which to list compute fleets. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List in ascending order.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List in descending order.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Use [sortBy] to specify the criterion to be used to list compute fleet names.\n\
        \   "]
  sort_by : fleet_sort_by_type option;
      [@ocaml.doc
        "The criterion to be used to list compute fleet names. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [CREATED_TIME]: List based on when each compute fleet was created.\n\
        \           \n\
        \            }\n\
        \       {-   [LAST_MODIFIED_TIME]: List based on when information about each compute fleet \
         was last changed.\n\
        \           \n\
        \            }\n\
        \       {-   [NAME]: List based on each compute fleet's name.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Use [sortOrder] to specify in what order to list the compute fleet names based on the \
         preceding criteria.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec image_versions = string_ list [@@ocaml.doc ""]

type nonrec environment_image = {
  name : string_ option; [@ocaml.doc "The name of the Docker image.\n"]
  description : string_ option; [@ocaml.doc "The description of the Docker image.\n"]
  versions : image_versions option; [@ocaml.doc "A list of environment image versions.\n"]
}
[@@ocaml.doc "Information about a Docker image that is managed by CodeBuild.\n"]

type nonrec environment_images = environment_image list [@@ocaml.doc ""]

type nonrec language_type =
  | JAVA [@ocaml.doc ""]
  | PYTHON [@ocaml.doc ""]
  | NODE_JS [@ocaml.doc ""]
  | RUBY [@ocaml.doc ""]
  | GOLANG [@ocaml.doc ""]
  | DOCKER [@ocaml.doc ""]
  | ANDROID [@ocaml.doc ""]
  | DOTNET [@ocaml.doc ""]
  | BASE [@ocaml.doc ""]
  | PHP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_language = {
  language : language_type option; [@ocaml.doc "The programming language for the Docker images.\n"]
  images : environment_images option;
      [@ocaml.doc
        "The list of Docker images that are related by the specified programming language.\n"]
}
[@@ocaml.doc
  "A set of Docker images that are related by programming language and are managed by CodeBuild.\n"]

type nonrec environment_languages = environment_language list [@@ocaml.doc ""]

type nonrec platform_type =
  | DEBIAN [@ocaml.doc ""]
  | AMAZON_LINUX [@ocaml.doc ""]
  | UBUNTU [@ocaml.doc ""]
  | WINDOWS_SERVER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_platform = {
  platform : platform_type option; [@ocaml.doc "The platform's name.\n"]
  languages : environment_languages option;
      [@ocaml.doc
        "The list of programming languages that are available for the specified platform.\n"]
}
[@@ocaml.doc "A set of Docker images that are related by platform and are managed by CodeBuild.\n"]

type nonrec environment_platforms = environment_platform list [@@ocaml.doc ""]

type nonrec list_curated_environment_images_output = {
  platforms : environment_platforms option;
      [@ocaml.doc
        "Information about supported platforms for Docker images that are managed by CodeBuild.\n"]
}
[@@ocaml.doc ""]

type nonrec list_curated_environment_images_input = unit [@@ocaml.doc ""]

type nonrec list_command_executions_for_sandbox_output = {
  command_executions : command_executions option;
      [@ocaml.doc "Information about the requested command executions.\n"]
  next_token : string_ option;
      [@ocaml.doc "Information about the next token to get paginated results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_command_executions_for_sandbox_input = {
  sandbox_id : non_empty_string; [@ocaml.doc "A [sandboxId] or [sandboxArn].\n"]
  max_results : page_size option;
      [@ocaml.doc "The maximum number of sandbox records to be retrieved.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc "The order in which sandbox records should be retrieved.\n"]
  next_token : sensitive_string option;
      [@ocaml.doc
        "The next token, if any, to get paginated results. You will get this value from previous \
         execution of list sandboxes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_builds_for_project_output = {
  ids : build_ids option;
      [@ocaml.doc
        "A list of build identifiers for the specified build project, with each build ID \
         representing a single build.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If there are more than 100 items in the list, only the first 100 items are returned, \
         along with a unique string called a {i nextToken}. To get the next batch of items in the \
         list, call this operation again, adding the next token to the call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_builds_for_project_input = {
  project_name : non_empty_string; [@ocaml.doc "The name of the CodeBuild project.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc
        "The order to sort the results in. The results are sorted by build number, not the build \
         identifier. If this is not specified, the results are sorted in descending order.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ASCENDING]: List the build identifiers in ascending order, by build number.\n\
        \            \n\
        \             }\n\
        \        {-   [DESCENDING]: List the build identifiers in descending order, by build number.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If the project has more than 100 builds, setting the sort order will result in an \
         error. \n\
        \   "]
  next_token : string_ option;
      [@ocaml.doc
        "During a previous call, if there are more than 100 items in the list, only the first 100 \
         items are returned, along with a unique string called a {i nextToken}. To get the next \
         batch of items in the list, call this operation again, adding the next token to the call. \
         To get all of the items in the list, keep calling this operation with each subsequent \
         next token that is returned, until no more next tokens are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_builds_output = {
  ids : build_ids option;
      [@ocaml.doc "A list of build IDs, with each build ID representing a single build.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If there are more than 100 items in the list, only the first 100 items are returned, \
         along with a unique string called a {i nextToken}. To get the next batch of items in the \
         list, call this operation again, adding the next token to the call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_builds_input = {
  sort_order : sort_order_type option;
      [@ocaml.doc
        "The order to list build IDs. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List the build IDs in ascending order by build ID.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List the build IDs in descending order by build ID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        "During a previous call, if there are more than 100 items in the list, only the first 100 \
         items are returned, along with a unique string called a {i nextToken}. To get the next \
         batch of items in the list, call this operation again, adding the next token to the call. \
         To get all of the items in the list, keep calling this operation with each subsequent \
         next token that is returned, until no more next tokens are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_build_batches_for_project_output = {
  ids : build_batch_ids option;
      [@ocaml.doc "An array of strings that contains the batch build identifiers.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If there are more items to return, this contains a token that is passed to a subsequent \
         call to [ListBuildBatchesForProject] to retrieve the next set of items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_build_batches_for_project_input = {
  project_name : non_empty_string option; [@ocaml.doc "The name of the project.\n"]
  filter : build_batch_filter option;
      [@ocaml.doc "A [BuildBatchFilter] object that specifies the filters for the search.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc
        "Specifies the sort order of the returned items. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List the batch build identifiers in ascending order by identifier.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List the batch build identifiers in descending order by \
         identifier.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous call to [ListBuildBatchesForProject]. This \
         specifies the next item to return. To return the beginning of the list, exclude this \
         parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec list_build_batches_output = {
  ids : build_batch_ids option;
      [@ocaml.doc "An array of strings that contains the batch build identifiers.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If there are more items to return, this contains a token that is passed to a subsequent \
         call to [ListBuildBatches] to retrieve the next set of items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_build_batches_input = {
  filter : build_batch_filter option;
      [@ocaml.doc "A [BuildBatchFilter] object that specifies the filters for the search.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc
        "Specifies the sort order of the returned items. Valid values include:\n\n\
        \ {ul\n\
        \       {-   [ASCENDING]: List the batch build identifiers in ascending order by identifier.\n\
        \           \n\
        \            }\n\
        \       {-   [DESCENDING]: List the batch build identifiers in descending order by \
         identifier.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous call to [ListBuildBatches]. This specifies \
         the next item to return. To return the beginning of the list, exclude this parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec invalidate_project_cache_output = unit [@@ocaml.doc ""]

type nonrec invalidate_project_cache_input = {
  project_name : non_empty_string;
      [@ocaml.doc "The name of the CodeBuild build project that the cache is reset for.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_already_exists_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified Amazon Web Services resource cannot be created, because an Amazon Web Services \
   resource with the same settings already exists.\n"]

type nonrec import_source_credentials_output = {
  arn : non_empty_string option; [@ocaml.doc " The Amazon Resource Name (ARN) of the token. \n"]
}
[@@ocaml.doc ""]

type nonrec import_source_credentials_input = {
  username : non_empty_string option;
      [@ocaml.doc
        " The Bitbucket username when the [authType] is BASIC_AUTH. This parameter is not valid \
         for other types of source providers or connections. \n"]
  token : sensitive_non_empty_string;
      [@ocaml.doc
        " For GitHub or GitHub Enterprise, this is the personal access token. For Bitbucket, this \
         is either the access token or the app password. For the [authType] CODECONNECTIONS, this \
         is the [connectionArn]. For the [authType] SECRETS_MANAGER, this is the [secretArn].\n"]
  server_type : server_type; [@ocaml.doc " The source provider used for this project. \n"]
  auth_type : auth_type;
      [@ocaml.doc
        " The type of authentication used to connect to a GitHub, GitHub Enterprise, GitLab, \
         GitLab Self Managed, or Bitbucket repository. An OAUTH connection is not supported by the \
         API and must be created using the CodeBuild console.\n"]
  should_overwrite : wrapper_boolean option;
      [@ocaml.doc
        " Set to [false] to prevent overwriting the repository source credentials. Set to [true] \
         to overwrite the repository source credentials. The default value is [true]. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_output = {
  policy : non_empty_string option;
      [@ocaml.doc " The resource policy for the resource identified by the input ARN parameter. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_input = {
  resource_arn : non_empty_string;
      [@ocaml.doc " The ARN of the resource that is associated with the resource policy. \n"]
}
[@@ocaml.doc ""]

type nonrec report_with_raw_data = {
  report_arn : non_empty_string option; [@ocaml.doc "The ARN of the report.\n"]
  data : string_ option; [@ocaml.doc "The value of the requested data field from the report.\n"]
}
[@@ocaml.doc "Contains the unmodified data for the report. For more information, see .\n"]

type nonrec report_group_trend_raw_data_list = report_with_raw_data list [@@ocaml.doc ""]

type nonrec report_group_trend_stats = {
  average : string_ option; [@ocaml.doc "Contains the average of all values analyzed.\n"]
  max : string_ option; [@ocaml.doc "Contains the maximum value analyzed.\n"]
  min : string_ option; [@ocaml.doc "Contains the minimum value analyzed.\n"]
}
[@@ocaml.doc
  "Contains trend statistics for a set of reports. The actual values depend on the type of trend \
   being collected. For more information, see .\n"]

type nonrec get_report_group_trend_output = {
  stats : report_group_trend_stats option; [@ocaml.doc "Contains the accumulated trend data.\n"]
  raw_data : report_group_trend_raw_data_list option;
      [@ocaml.doc "An array that contains the raw data for each report.\n"]
}
[@@ocaml.doc ""]

type nonrec report_group_trend_field_type =
  | PASS_RATE [@ocaml.doc ""]
  | DURATION [@ocaml.doc ""]
  | TOTAL [@ocaml.doc ""]
  | LINE_COVERAGE [@ocaml.doc ""]
  | LINES_COVERED [@ocaml.doc ""]
  | LINES_MISSED [@ocaml.doc ""]
  | BRANCH_COVERAGE [@ocaml.doc ""]
  | BRANCHES_COVERED [@ocaml.doc ""]
  | BRANCHES_MISSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_report_group_trend_input = {
  report_group_arn : non_empty_string;
      [@ocaml.doc "The ARN of the report group that contains the reports to analyze.\n"]
  num_of_reports : page_size option;
      [@ocaml.doc
        "The number of reports to analyze. This operation always retrieves the most recent \
         reports.\n\n\
        \ If this parameter is omitted, the most recent 100 reports are analyzed.\n\
        \ "]
  trend_field : report_group_trend_field_type;
      [@ocaml.doc
        "The test report value to accumulate. This must be one of the following values:\n\n\
        \  Test reports:   DURATION  Accumulate the test run times for the specified reports.\n\
        \                            \n\
        \                              PASS_RATE  Accumulate the percentage of tests that passed \
         for the specified test reports.\n\
        \                                         \n\
        \                                           TOTAL  Accumulate the total number of tests \
         for the specified test reports.\n\
        \                                                  \n\
        \                                                        Code coverage reports:   \
         BRANCH_COVERAGE  \n\
         Accumulate the branch coverage percentages for the specified test reports.\n\n\
        \  BRANCHES_COVERED  Accumulate the branches covered values for the specified test reports.\n\
        \                    \n\
        \                      BRANCHES_MISSED  Accumulate the branches missed values for the \
         specified test reports.\n\
        \                                       \n\
        \                                         LINE_COVERAGE  Accumulate the line coverage \
         percentages for the specified test reports.\n\
        \                                                        \n\
        \                                                          LINES_COVERED  Accumulate the \
         lines covered values for the specified test reports.\n\
        \                                                                         \n\
        \                                                                           LINES_MISSED  \n\
         Accumulate the lines not covered values for the specified test reports.\n\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec test_case = {
  report_arn : non_empty_string option;
      [@ocaml.doc " The ARN of the report to which the test case belongs. \n"]
  test_raw_data_path : string_ option;
      [@ocaml.doc " The path to the raw data file that contains the test result. \n"]
  prefix : string_ option;
      [@ocaml.doc
        " A string that is applied to a series of related test cases. CodeBuild generates the \
         prefix. The prefix depends on the framework used to generate the tests. \n"]
  name : string_ option; [@ocaml.doc " The name of the test case. \n"]
  status : string_ option;
      [@ocaml.doc
        " The status returned by the test case after it was run. Valid statuses are [SUCCEEDED], \
         [FAILED], [ERROR], [SKIPPED], and [UNKNOWN]. \n"]
  duration_in_nano_seconds : wrapper_long option;
      [@ocaml.doc " The number of nanoseconds it took to run this test case. \n"]
  message : string_ option;
      [@ocaml.doc
        " A message associated with a test case. For example, an error message or stack trace. \n"]
  expired : timestamp option;
      [@ocaml.doc
        " The date and time a test case expires. A test case expires 30 days after it is created. \
         An expired test case is not available to view in CodeBuild. \n"]
  test_suite_name : string_ option;
      [@ocaml.doc "The name of the test suite that the test case is a part of.\n"]
}
[@@ocaml.doc
  " Information about a test case created using a framework such as NUnit or Cucumber. A test case \
   might be a unit test or a configuration test. \n"]

type nonrec test_cases = test_case list [@@ocaml.doc ""]

type nonrec describe_test_cases_output = {
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  test_cases : test_cases option; [@ocaml.doc " The returned list of test cases. \n"]
}
[@@ocaml.doc ""]

type nonrec test_case_filter = {
  status : string_ option;
      [@ocaml.doc
        "The status used to filter test cases. A [TestCaseFilter] can have one status. Valid \
         values are:\n\n\
        \ {ul\n\
        \       {-   [SUCCEEDED] \n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [ERROR] \n\
        \           \n\
        \            }\n\
        \       {-   [SKIPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  keyword : string_ option;
      [@ocaml.doc
        "A keyword that is used to filter on the [name] or the [prefix] of the test cases. Only \
         test cases where the keyword is a substring of the [name] or the [prefix] will be \
         returned.\n"]
}
[@@ocaml.doc
  "A filter used to return specific types of test cases. In order to pass the filter, the report \
   must meet all of the filter properties.\n"]

type nonrec describe_test_cases_input = {
  report_arn : string_; [@ocaml.doc " The ARN of the report for which test cases are returned. \n"]
  next_token : string_ option;
      [@ocaml.doc
        " During a previous call, the maximum number of items that can be returned is the value \
         specified in [maxResults]. If there more items in the list, then a unique string called a \
         {i nextToken} is returned. To get the next batch of items in the list, call this \
         operation again, adding the next token to the call. To get all of the items in the list, \
         keep calling this operation with each subsequent next token that is returned, until no \
         more next tokens are returned. \n"]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of paginated test cases returned per response. Use [nextToken] to \
         iterate pages in the list of returned [TestCase] objects. The default value is 100. \n"]
  filter : test_case_filter option;
      [@ocaml.doc " A [TestCaseFilter] object used to filter the returned reports. \n"]
}
[@@ocaml.doc ""]

type nonrec code_coverage = {
  id : non_empty_string option; [@ocaml.doc "The identifier of the code coverage report.\n"]
  report_ar_n : non_empty_string option; [@ocaml.doc "The ARN of the report.\n"]
  file_path : non_empty_string option; [@ocaml.doc "The path of the test report file.\n"]
  line_coverage_percentage : percentage option;
      [@ocaml.doc "The percentage of lines that are covered by your tests.\n"]
  lines_covered : non_negative_int option;
      [@ocaml.doc "The number of lines that are covered by your tests.\n"]
  lines_missed : non_negative_int option;
      [@ocaml.doc "The number of lines that are not covered by your tests.\n"]
  branch_coverage_percentage : percentage option;
      [@ocaml.doc "The percentage of branches that are covered by your tests.\n"]
  branches_covered : non_negative_int option;
      [@ocaml.doc "The number of conditional branches that are covered by your tests.\n"]
  branches_missed : non_negative_int option;
      [@ocaml.doc "The number of conditional branches that are not covered by your tests.\n"]
  expired : timestamp option; [@ocaml.doc "The date and time that the tests were run.\n"]
}
[@@ocaml.doc
  "Contains code coverage report information.\n\n\
  \ Line coverage measures how many statements your tests cover. A statement is a single \
   instruction, not including comments, conditionals, etc.\n\
  \ \n\
  \  Branch coverage determines if your tests cover every possible branch of a control structure, \
   such as an [if] or [case] statement.\n\
  \  "]

type nonrec code_coverages = code_coverage list [@@ocaml.doc ""]

type nonrec describe_code_coverages_output = {
  next_token : string_ option;
      [@ocaml.doc
        "If there are more items to return, this contains a token that is passed to a subsequent \
         call to [DescribeCodeCoverages] to retrieve the next set of items.\n"]
  code_coverages : code_coverages option;
      [@ocaml.doc "An array of [CodeCoverage] objects that contain the results.\n"]
}
[@@ocaml.doc ""]

type nonrec report_code_coverage_sort_by_type =
  | LINE_COVERAGE_PERCENTAGE [@ocaml.doc ""]
  | FILE_PATH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_code_coverages_input = {
  report_arn : non_empty_string;
      [@ocaml.doc " The ARN of the report for which test cases are returned. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous call to [DescribeCodeCoverages]. This \
         specifies the next item to return. To return the beginning of the list, exclude this \
         parameter.\n"]
  max_results : page_size option; [@ocaml.doc "The maximum number of results to return.\n"]
  sort_order : sort_order_type option;
      [@ocaml.doc "Specifies if the results are sorted in ascending or descending order.\n"]
  sort_by : report_code_coverage_sort_by_type option;
      [@ocaml.doc
        "Specifies how the results are sorted. Possible values are:\n\n\
        \  FILE_PATH  The results are sorted by file path.\n\
        \             \n\
        \               LINE_COVERAGE_PERCENTAGE  The results are sorted by the percentage of \
         lines that are covered.\n\
        \                                         \n\
        \                                           "]
  min_line_coverage_percentage : percentage option;
      [@ocaml.doc "The minimum line coverage percentage to report.\n"]
  max_line_coverage_percentage : percentage option;
      [@ocaml.doc "The maximum line coverage percentage to report.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_webhook_output = unit [@@ocaml.doc ""]

type nonrec delete_webhook_input = {
  project_name : project_name; [@ocaml.doc "The name of the CodeBuild project.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_source_credentials_output = {
  arn : non_empty_string option; [@ocaml.doc " The Amazon Resource Name (ARN) of the token. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_source_credentials_input = {
  arn : non_empty_string; [@ocaml.doc " The Amazon Resource Name (ARN) of the token.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_resource_policy_input = {
  resource_arn : non_empty_string;
      [@ocaml.doc " The ARN of the resource that is associated with the resource policy. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_report_group_output = unit [@@ocaml.doc ""]

type nonrec delete_report_group_input = {
  arn : non_empty_string; [@ocaml.doc "The ARN of the report group to delete. \n"]
  delete_reports : boolean_ option;
      [@ocaml.doc
        "If [true], deletes any reports that belong to a report group before deleting the report \
         group. \n\n\
        \ If [false], you must delete any reports in the report group. Use \
         {{:https://docs.aws.amazon.com/codebuild/latest/APIReference/API_ListReportsForReportGroup.html}ListReportsForReportGroup} \
         to get the reports in a report group. Use \
         {{:https://docs.aws.amazon.com/codebuild/latest/APIReference/API_DeleteReport.html}DeleteReport} \
         to delete the reports. If you call [DeleteReportGroup] for a report group that contains \
         one or more reports, an exception is thrown. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_report_output = unit [@@ocaml.doc ""]

type nonrec delete_report_input = {
  arn : non_empty_string; [@ocaml.doc " The ARN of the report to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_output = unit [@@ocaml.doc ""]

type nonrec delete_project_input = {
  name : non_empty_string; [@ocaml.doc "The name of the build project.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_output = unit [@@ocaml.doc ""]

type nonrec delete_fleet_input = {
  arn : non_empty_string; [@ocaml.doc "The ARN of the compute fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_build_batch_output = {
  status_code : string_ option; [@ocaml.doc "The status code.\n"]
  builds_deleted : build_ids option;
      [@ocaml.doc
        "An array of strings that contain the identifiers of the builds that were deleted.\n"]
  builds_not_deleted : builds_not_deleted option;
      [@ocaml.doc
        "An array of [BuildNotDeleted] objects that specify the builds that could not be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_build_batch_input = {
  id : non_empty_string; [@ocaml.doc "The identifier of the batch build to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_webhook_output = {
  webhook : webhook option;
      [@ocaml.doc
        "Information about a webhook that connects repository events to a build project in \
         CodeBuild.\n"]
}
[@@ocaml.doc ""]

type nonrec create_webhook_input = {
  project_name : project_name; [@ocaml.doc "The name of the CodeBuild project.\n"]
  branch_filter : string_ option;
      [@ocaml.doc
        "A regular expression used to determine which repository branches are built when a webhook \
         is triggered. If the name of a branch matches the regular expression, then it is built. \
         If [branchFilter] is empty, then all branches are built.\n\n\
        \  It is recommended that you use [filterGroups] instead of [branchFilter]. \n\
        \  \n\
        \   "]
  filter_groups : filter_groups option;
      [@ocaml.doc
        "An array of arrays of [WebhookFilter] objects used to determine which webhooks are \
         triggered. At least one [WebhookFilter] in the array must specify [EVENT] as its [type]. \
         \n\n\
        \ For a build to be triggered, at least one filter group in the [filterGroups] array must \
         pass. For a filter group to pass, each of its filters must pass. \n\
        \ "]
  build_type : webhook_build_type option;
      [@ocaml.doc
        "Specifies the type of build this webhook will trigger.\n\n\
        \   [RUNNER_BUILDKITE_BUILD] is only available for [NO_SOURCE] source type projects \
         configured for Buildkite runner builds. For more information about CodeBuild-hosted \
         Buildkite runner builds, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-runner-buildkite.html}Tutorial: \
         Configure a CodeBuild-hosted Buildkite runner} in the {i CodeBuild user guide}.\n\
        \  \n\
        \   "]
  manual_creation : wrapper_boolean option;
      [@ocaml.doc
        "If manualCreation is true, CodeBuild doesn't create a webhook in GitHub and instead \
         returns [payloadUrl] and [secret] values for the webhook. The [payloadUrl] and [secret] \
         values in the output can be used to manually create a webhook within GitHub.\n\n\
        \   [manualCreation] is only available for GitHub webhooks.\n\
        \  \n\
        \   "]
  scope_configuration : scope_configuration option;
      [@ocaml.doc
        "The scope configuration for global or organization webhooks.\n\n\
        \  Global or organization webhooks are only available for GitHub and Github Enterprise \
         webhooks.\n\
        \  \n\
        \   "]
  pull_request_build_policy : pull_request_build_policy option;
      [@ocaml.doc
        "A PullRequestBuildPolicy object that defines comment-based approval requirements for \
         triggering builds on pull requests. This policy helps control when automated builds are \
         executed based on contributor permissions and approval workflows.\n"]
}
[@@ocaml.doc ""]

type nonrec create_report_group_output = {
  report_group : report_group option;
      [@ocaml.doc " Information about the report group that was created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_report_group_input = {
  name : report_group_name; [@ocaml.doc " The name of the report group. \n"]
  type_ : report_type; [@ocaml.doc " The type of report group. \n"]
  export_config : report_export_config;
      [@ocaml.doc
        " A [ReportExportConfig] object that contains information about where the report group \
         test results are exported. \n"]
  tags : tag_list option;
      [@ocaml.doc
        " A list of tag key and value pairs associated with this report group. \n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         report group tags.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_project_output = {
  project : project option; [@ocaml.doc "Information about the build project that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_project_input = {
  name : project_name; [@ocaml.doc "The name of the build project.\n"]
  description : project_description option;
      [@ocaml.doc "A description that makes the build project easy to identify.\n"]
  source : project_source;
      [@ocaml.doc "Information about the build input source code for the build project.\n"]
  secondary_sources : project_sources option; [@ocaml.doc "An array of [ProjectSource] objects. \n"]
  source_version : string_ option;
      [@ocaml.doc
        "A version of the build input to be built for this project. If not specified, the latest \
         version is used. If specified, it must be one of: \n\n\
        \ {ul\n\
        \       {-  For CodeCommit: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For GitHub: the commit ID, pull request ID, branch name, or tag name that \
         corresponds to the version of the source code you want to build. If a pull request ID is \
         specified, it must use the format [pr/pull-request-ID] (for example [pr/25]). If a branch \
         name is specified, the branch's HEAD commit ID is used. If not specified, the default \
         branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For GitLab: the commit ID, branch, or Git tag to use.\n\
        \           \n\
        \            }\n\
        \       {-  For Bitbucket: the commit ID, branch name, or tag name that corresponds to the \
         version of the source code you want to build. If a branch name is specified, the branch's \
         HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon S3: the version ID of the object that represents the build input \
         ZIP file to use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If [sourceVersion] is specified at the build level, then that version takes precedence \
         over this [sourceVersion] (at the project level). \n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html}Source \
         Version Sample with CodeBuild} in the {i CodeBuild User Guide}. \n\
        \    "]
  secondary_source_versions : project_secondary_source_versions option;
      [@ocaml.doc
        "An array of [ProjectSourceVersion] objects. If [secondarySourceVersions] is specified at \
         the build level, then they take precedence over these [secondarySourceVersions] (at the \
         project level). \n"]
  artifacts : project_artifacts;
      [@ocaml.doc "Information about the build output artifacts for the build project.\n"]
  secondary_artifacts : project_artifacts_list option;
      [@ocaml.doc "An array of [ProjectArtifacts] objects. \n"]
  cache : project_cache option;
      [@ocaml.doc
        "Stores recently used information so that it can be quickly accessed at a later time.\n"]
  environment : project_environment;
      [@ocaml.doc "Information about the build environment for the build project.\n"]
  service_role : non_empty_string;
      [@ocaml.doc
        "The ARN of the IAM role that enables CodeBuild to interact with dependent Amazon Web \
         Services services on behalf of the Amazon Web Services account.\n"]
  timeout_in_minutes : build_time_out option;
      [@ocaml.doc
        "How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before it times \
         out any build that has not been marked as completed. The default is 60 minutes.\n"]
  queued_timeout_in_minutes : time_out option;
      [@ocaml.doc "The number of minutes a build is allowed to be queued before it times out. \n"]
  encryption_key : non_empty_string option;
      [@ocaml.doc
        "The Key Management Service customer master key (CMK) to be used for encrypting the build \
         output artifacts.\n\n\
        \  You can use a cross-account KMS key to encrypt the build output artifacts if your \
         service role has permission to that key. \n\
        \  \n\
        \    You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, \
         the CMK's alias (using the format \n\
        \    {[\n\
        \    alias/\n\
        \    ]}\n\
        \    ). \n\
        \    "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tag key and value pairs associated with this build project.\n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         build project tags.\n\
        \ "]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "VpcConfig enables CodeBuild to access resources in an Amazon VPC.\n\n\
        \  If you're using compute fleets during project creation, do not provide vpcConfig.\n\
        \  \n\
        \   "]
  badge_enabled : wrapper_boolean option;
      [@ocaml.doc
        "Set this to true to generate a publicly accessible URL for your project's build badge.\n"]
  logs_config : logs_config option;
      [@ocaml.doc
        "Information about logs for the build project. These can be logs in CloudWatch Logs, logs \
         uploaded to a specified S3 bucket, or both. \n"]
  file_system_locations : project_file_system_locations option;
      [@ocaml.doc
        " An array of [ProjectFileSystemLocation] objects for a CodeBuild build project. A \
         [ProjectFileSystemLocation] object specifies the [identifier], [location], \
         [mountOptions], [mountPoint], and [type] of a file system created using Amazon Elastic \
         File System. \n"]
  build_batch_config : project_build_batch_config option;
      [@ocaml.doc
        "A [ProjectBuildBatchConfig] object that defines the batch build options for the project.\n"]
  concurrent_build_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of concurrent builds that are allowed for this project.\n\n\
        \ New builds are only started if the current number of builds is less than or equal to \
         this limit. If the current build count meets this limit, new builds are throttled and are \
         not run.\n\
        \ "]
  auto_retry_limit : wrapper_int option;
      [@ocaml.doc
        "The maximum number of additional automatic retries after a failed build. For example, if \
         the auto-retry limit is set to 2, CodeBuild will call the [RetryBuild] API to \
         automatically retry your build for up to 2 additional times.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_output = {
  fleet : fleet option; [@ocaml.doc "Information about the compute fleet\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_input = {
  name : fleet_name; [@ocaml.doc "The name of the compute fleet.\n"]
  base_capacity : fleet_capacity;
      [@ocaml.doc
        "The initial number of machines allocated to the \239\172\130eet, which de\239\172\129nes \
         the number of builds that can run in parallel.\n"]
  environment_type : environment_type;
      [@ocaml.doc
        "The environment type of the compute fleet.\n\n\
        \ {ul\n\
        \       {-  The environment type [ARM_CONTAINER] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific (Mumbai), Asia \
         Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and \
         South America (S\195\163o Paulo).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [ARM_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_CONTAINER] is available only in regions US East \
         (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia \
         Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America \
         (S\195\163o Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [LINUX_GPU_CONTAINER] is available only in regions US \
         East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia \
         Pacific (Tokyo), and Asia Pacific (Sydney).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [MAC_ARM] is available for Medium fleets only in regions \
         US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), and EU \
         (Frankfurt)\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [MAC_ARM] is available for Large fleets only in regions \
         US East (N. Virginia), US East (Ohio), US West (Oregon), and Asia Pacific (Sydney).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_EC2] is available only in regions US East (N. \
         Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific \
         (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (S\195\163o \
         Paulo), and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_SERVER_2019_CONTAINER] is available only in \
         regions US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), \
         Asia Pacific (Tokyo), Asia Pacific (Mumbai) and EU (Ireland).\n\
        \           \n\
        \            }\n\
        \       {-  The environment type [WINDOWS_SERVER_2022_CONTAINER] is available only in \
         regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU \
         (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore), Asia Pacific (Tokyo), South \
         America (S\195\163o Paulo) and Asia Pacific (Mumbai).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html}Build \
         environment compute types} in the {i CodeBuild user guide}.\n\
        \   "]
  compute_type : compute_type;
      [@ocaml.doc
        "Information about the compute resources the compute fleet uses. Available values include:\n\n\
        \ {ul\n\
        \       {-   [ATTRIBUTE_BASED_COMPUTE]: Specify the amount of vCPUs, memory, disk space, \
         and the type of machine.\n\
        \           \n\
        \              If you use [ATTRIBUTE_BASED_COMPUTE], you must define your attributes by \
         using [computeConfiguration]. CodeBuild will select the cheapest instance that satisfies \
         your specified attributes. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.types}Reserved \
         capacity environment types} in the {i CodeBuild User Guide}.\n\
        \             \n\
        \               }\n\
        \       {-   [CUSTOM_INSTANCE_TYPE]: Specify the instance type for your compute fleet. For \
         a list of supported instance types, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment-reserved-capacity.instance-types}Supported \
         instance families } in the {i CodeBuild User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_SMALL]: Use up to 4 GiB memory and 2 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_MEDIUM]: Use up to 8 GiB memory and 4 vCPUs for builds.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_LARGE]: Use up to 16 GiB memory and 8 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_XLARGE]: Use up to 72 GiB memory and 36 vCPUs for builds, \
         depending on your environment type.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_2XLARGE]: Use up to 144 GiB memory, 72 vCPUs, and 824 GB of \
         SSD storage for builds. This compute type supports Docker images up to 100 GB \
         uncompressed.\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_1GB]: Use up to 1 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_2GB]: Use up to 2 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_4GB]: Use up to 4 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_8GB]: Use up to 8 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_LAMBDA_10GB]: Use up to 10 GiB memory for builds. Only available for \
         environment type [LINUX_LAMBDA_CONTAINER] and [ARM_LAMBDA_CONTAINER].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you use [BUILD_GENERAL1_SMALL]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 4 GiB memory and \
         2 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 16 GiB \
         memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 4 GiB memory and 2 \
         vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    If you use [BUILD_GENERAL1_LARGE]: \n\
        \   \n\
        \    {ul\n\
        \          {-   For environment type [LINUX_CONTAINER], you can use up to 16 GiB memory \
         and 8 vCPUs for builds. \n\
        \              \n\
        \               }\n\
        \          {-   For environment type [LINUX_GPU_CONTAINER], you can use up to 255 GiB \
         memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.\n\
        \              \n\
        \               }\n\
        \          {-   For environment type [ARM_CONTAINER], you can use up to 16 GiB memory and \
         8 vCPUs on ARM-based processors for builds.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html#environment.types}On-demand \
         environment types} in the {i CodeBuild User Guide.} \n\
        \   "]
  compute_configuration : compute_configuration option;
      [@ocaml.doc
        "The compute configuration of the compute fleet. This is only required if [computeType] is \
         set to [ATTRIBUTE_BASED_COMPUTE] or [CUSTOM_INSTANCE_TYPE].\n"]
  scaling_configuration : scaling_configuration_input option;
      [@ocaml.doc "The scaling configuration of the compute fleet.\n"]
  overflow_behavior : fleet_overflow_behavior option;
      [@ocaml.doc
        "The compute fleet overflow behavior.\n\n\
        \ {ul\n\
        \       {-  For overflow behavior [QUEUE], your overflow builds need to wait on the \
         existing fleet instance to become available.\n\
        \           \n\
        \            }\n\
        \       {-  For overflow behavior [ON_DEMAND], your overflow builds run on CodeBuild \
         on-demand.\n\
        \           \n\
        \             If you choose to set your overflow behavior to on-demand while creating a \
         VPC-connected fleet, make sure that you add the required VPC permissions to your project \
         service role. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-create-vpc-network-interface}Example \
         policy statement to allow CodeBuild access to Amazon Web Services services required to \
         create a VPC network interface}.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option; [@ocaml.doc ""]
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc "The proxy configuration of the compute fleet.\n"]
  image_id : non_empty_string option;
      [@ocaml.doc "The Amazon Machine Image (AMI) of the compute fleet.\n"]
  fleet_service_role : non_empty_string option;
      [@ocaml.doc
        "The service role associated with the compute fleet. For more information, see \
         {{:https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-permission-policy-fleet-service-role.html} \
         Allow a user to add a permission policy for a fleet service role} in the {i CodeBuild \
         User Guide}.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tag key and value pairs associated with this compute fleet.\n\n\
        \ These tags are available for use by Amazon Web Services services that support CodeBuild \
         build project tags.\n\
        \ "]
}
[@@ocaml.doc ""]
