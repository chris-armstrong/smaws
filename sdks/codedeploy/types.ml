type nonrec message = string [@@ocaml.doc ""]

type nonrec tag_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "A tag was not specified.\n"]

type nonrec tag_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The maximum allowed number of tags was exceeded.\n"]

type nonrec invalid_tag_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The tag was specified in an invalid format.\n"]

type nonrec invalid_instance_name_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The on-premises instance name was specified in an invalid format.\n"]

type nonrec instance_not_registered_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified on-premises instance is not registered.\n"]

type nonrec instance_name_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "An on-premises instance name was not specified.\n"]

type nonrec instance_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The maximum number of allowed on-premises instances in a single call was exceeded.\n"]

type nonrec instance_name = string [@@ocaml.doc ""]

type nonrec instance_name_list = instance_name list [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : key option; [@ocaml.doc "The tag's key.\n"]
  value : value option; [@ocaml.doc "The tag's value.\n"]
}
[@@ocaml.doc "Information about a tag.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec add_tags_to_on_premises_instances_input = {
  tags : tag_list;
      [@ocaml.doc
        "The tag key-value pairs to add to the on-premises instances.\n\n\
        \ Keys and values are both required. Keys cannot be null or empty strings. Value-only tags \
         are not allowed.\n\
        \ "]
  instance_names : instance_name_list;
      [@ocaml.doc "The names of the on-premises instances to which to add tags.\n"]
}
[@@ocaml.doc "Represents the input of, and adds tags to, an on-premises instance operation.\n"]

type nonrec additional_deployment_status_info = string [@@ocaml.doc ""]

type nonrec alarm_name = string [@@ocaml.doc ""]

type nonrec alarm = {
  name : alarm_name option;
      [@ocaml.doc
        "The name of the alarm. Maximum length is 255 characters. Each alarm name can be used only \
         once in a list of alarms.\n"]
}
[@@ocaml.doc "Information about an alarm.\n"]

type nonrec alarm_list = alarm list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec alarm_configuration = {
  enabled : boolean_ option; [@ocaml.doc "Indicates whether the alarm configuration is enabled.\n"]
  ignore_poll_alarm_failure : boolean_ option;
      [@ocaml.doc
        "Indicates whether a deployment should continue if information about the current state of \
         alarms cannot be retrieved from Amazon CloudWatch. The default value is false.\n\n\
        \ {ul\n\
        \       {-   [true]: The deployment proceeds even if alarm status information can't be \
         retrieved from Amazon CloudWatch.\n\
        \           \n\
        \            }\n\
        \       {-   [false]: The deployment stops if alarm status information can't be retrieved \
         from Amazon CloudWatch.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  alarms : alarm_list option;
      [@ocaml.doc
        "A list of alarms configured for the deployment or deployment group. A maximum of 10 \
         alarms can be added.\n"]
}
[@@ocaml.doc "Information about alarms associated with a deployment or deployment group.\n"]

type nonrec alarms_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The maximum number of alarms for a deployment group (10) was exceeded.\n"]

type nonrec raw_string_sha256 = string [@@ocaml.doc ""]

type nonrec raw_string_content = string [@@ocaml.doc ""]

type nonrec app_spec_content = {
  content : raw_string_content option;
      [@ocaml.doc
        " The YAML-formatted or JSON-formatted revision string. \n\n\
        \  For an Lambda deployment, the content includes a Lambda function name, the alias for \
         its original version, and the alias for its replacement version. The deployment shifts \
         traffic from the original version of the Lambda function to the replacement version. \n\
        \ \n\
        \   For an Amazon ECS deployment, the content includes the task name, information about \
         the load balancer that serves traffic to the container, and more. \n\
        \  \n\
        \    For both types of deployments, the content can specify Lambda functions that run at \
         specified hooks, such as [BeforeInstall], during a deployment. \n\
        \   "]
  sha256 : raw_string_sha256 option;
      [@ocaml.doc " The SHA256 hash value of the revision content. \n"]
}
[@@ocaml.doc
  " A revision for an Lambda or Amazon ECS deployment that is a YAML-formatted or JSON-formatted \
   string. For Lambda and Amazon ECS deployments, the revision is the same as the AppSpec file. \
   This method replaces the deprecated [RawString] data type. \n"]

type nonrec application_already_exists_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "An application with the specified name with the user or Amazon Web Services account already \
   exists.\n"]

type nonrec application_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The application does not exist with the user or Amazon Web Services account.\n"]

type nonrec application_id = string [@@ocaml.doc ""]

type nonrec compute_platform =
  | SERVER [@ocaml.doc ""]
  | LAMBDA [@ocaml.doc ""]
  | ECS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec git_hub_account_token_name = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec application_name = string [@@ocaml.doc ""]

type nonrec application_info = {
  application_id : application_id option; [@ocaml.doc "The application ID.\n"]
  application_name : application_name option; [@ocaml.doc "The application name.\n"]
  create_time : timestamp option; [@ocaml.doc "The time at which the application was created.\n"]
  linked_to_git_hub : boolean_ option;
      [@ocaml.doc
        "True if the user has authenticated with GitHub for the specified application. Otherwise, \
         false.\n"]
  git_hub_account_name : git_hub_account_token_name option;
      [@ocaml.doc "The name for a connection to a GitHub account.\n"]
  compute_platform : compute_platform option;
      [@ocaml.doc
        "The destination platform type for deployment of the application ([Lambda] or [Server]).\n"]
}
[@@ocaml.doc "Information about an application.\n"]

type nonrec application_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "More applications were attempted to be created than are allowed.\n"]

type nonrec application_name_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The minimum number of required application names was not specified.\n"]

type nonrec application_revision_sort_by =
  | RegisterTime [@ocaml.doc ""]
  | FirstUsedTime [@ocaml.doc ""]
  | LastUsedTime [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec applications_info_list = application_info list [@@ocaml.doc ""]

type nonrec applications_list = application_name list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec arn_not_supported_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  " The specified ARN is not supported. For example, it might be an ARN for a resource that is not \
   expected. \n"]

type nonrec auto_rollback_event =
  | DEPLOYMENT_FAILURE [@ocaml.doc ""]
  | DEPLOYMENT_STOP_ON_ALARM [@ocaml.doc ""]
  | DEPLOYMENT_STOP_ON_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_rollback_events_list = auto_rollback_event list [@@ocaml.doc ""]

type nonrec auto_rollback_configuration = {
  enabled : boolean_ option;
      [@ocaml.doc
        "Indicates whether a defined automatic rollback configuration is currently enabled.\n"]
  events : auto_rollback_events_list option;
      [@ocaml.doc "The event type or types that trigger a rollback.\n"]
}
[@@ocaml.doc
  "Information about a configuration for automatically rolling back to a previous version of an \
   application revision when a deployment is not completed successfully.\n"]

type nonrec auto_scaling_group_hook = string [@@ocaml.doc ""]

type nonrec auto_scaling_group_name = string [@@ocaml.doc ""]

type nonrec auto_scaling_group = {
  name : auto_scaling_group_name option; [@ocaml.doc "The Auto Scaling group name.\n"]
  hook : auto_scaling_group_hook option;
      [@ocaml.doc
        "The name of the launch hook that CodeDeploy installed into the Auto Scaling group.\n\n\
        \ For more information about the launch hook, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors}How \
         Amazon EC2 Auto Scaling works with CodeDeploy} in the {i CodeDeploy User Guide}.\n\
        \ "]
  termination_hook : auto_scaling_group_hook option;
      [@ocaml.doc
        "The name of the termination hook that CodeDeploy installed into the Auto Scaling group.\n\n\
        \ For more information about the termination hook, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors-hook-enable}Enabling \
         termination deployments during Auto Scaling scale-in events} in the {i CodeDeploy User \
         Guide}.\n\
        \ "]
}
[@@ocaml.doc "Information about an Auto Scaling group.\n"]

type nonrec auto_scaling_group_list = auto_scaling_group list [@@ocaml.doc ""]

type nonrec auto_scaling_group_name_list = auto_scaling_group_name list [@@ocaml.doc ""]

type nonrec revision_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The revision ID was not specified.\n"]

type nonrec invalid_revision_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The revision was specified in an invalid format.\n"]

type nonrec invalid_application_name_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The application name was specified in an invalid format.\n"]

type nonrec batch_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The maximum number of names or IDs allowed for this request (100) was exceeded.\n"]

type nonrec deployment_group_name = string [@@ocaml.doc ""]

type nonrec deployment_groups_list = deployment_group_name list [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec generic_revision_info = {
  description : description option; [@ocaml.doc "A comment about the revision.\n"]
  deployment_groups : deployment_groups_list option;
      [@ocaml.doc "The deployment groups for which this is the current target revision.\n"]
  first_used_time : timestamp option;
      [@ocaml.doc "When the revision was first used by CodeDeploy.\n"]
  last_used_time : timestamp option; [@ocaml.doc "When the revision was last used by CodeDeploy.\n"]
  register_time : timestamp option;
      [@ocaml.doc "When the revision was registered with CodeDeploy.\n"]
}
[@@ocaml.doc "Information about an application revision.\n"]

type nonrec raw_string = {
  content : raw_string_content option;
      [@ocaml.doc
        "The YAML-formatted or JSON-formatted revision string. It includes information about which \
         Lambda function to update and optional Lambda functions that validate deployment \
         lifecycle events.\n"]
  sha256 : raw_string_sha256 option; [@ocaml.doc "The SHA256 hash value of the revision content.\n"]
}
[@@ocaml.doc
  "A revision for an Lambda deployment that is a YAML-formatted or JSON-formatted string. For \
   Lambda deployments, the revision is the same as the AppSpec file.\n"]

type nonrec commit_id = string [@@ocaml.doc ""]

type nonrec repository = string [@@ocaml.doc ""]

type nonrec git_hub_location = {
  repository : repository option;
      [@ocaml.doc
        "The GitHub account and repository pair that stores a reference to the commit that \
         represents the bundled artifacts for the application revision. \n\n\
        \ Specified as account/repository.\n\
        \ "]
  commit_id : commit_id option;
      [@ocaml.doc
        "The SHA1 commit ID of the GitHub commit that represents the bundled artifacts for the \
         application revision.\n"]
}
[@@ocaml.doc "Information about the location of application artifacts stored in GitHub.\n"]

type nonrec e_tag = string [@@ocaml.doc ""]

type nonrec version_id = string [@@ocaml.doc ""]

type nonrec bundle_type =
  | Tar [@ocaml.doc ""]
  | TarGZip [@ocaml.doc ""]
  | Zip [@ocaml.doc ""]
  | YAML [@ocaml.doc ""]
  | JSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_location = {
  bucket : s3_bucket option;
      [@ocaml.doc "The name of the Amazon S3 bucket where the application revision is stored.\n"]
  key : s3_key option;
      [@ocaml.doc
        "The name of the Amazon S3 object that represents the bundled artifacts for the \
         application revision.\n"]
  bundle_type : bundle_type option;
      [@ocaml.doc
        "The file type of the application revision. Must be one of the following:\n\n\
        \ {ul\n\
        \       {-   [tar]: A tar archive file.\n\
        \           \n\
        \            }\n\
        \       {-   [tgz]: A compressed tar archive file.\n\
        \           \n\
        \            }\n\
        \       {-   [zip]: A zip archive file.\n\
        \           \n\
        \            }\n\
        \       {-   [YAML]: A YAML-formatted file.\n\
        \           \n\
        \            }\n\
        \       {-   [JSON]: A JSON-formatted file.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  version : version_id option;
      [@ocaml.doc
        "A specific version of the Amazon S3 object that represents the bundled artifacts for the \
         application revision.\n\n\
        \ If the version is not specified, the system uses the most recent version by default.\n\
        \ "]
  e_tag : e_tag option;
      [@ocaml.doc
        "The ETag of the Amazon S3 object that represents the bundled artifacts for the \
         application revision.\n\n\
        \ If the ETag is not specified as an input parameter, ETag validation of the object is \
         skipped.\n\
        \ "]
}
[@@ocaml.doc "Information about the location of application artifacts stored in Amazon S3.\n"]

type nonrec revision_location_type =
  | S3 [@ocaml.doc ""]
  | GitHub [@ocaml.doc ""]
  | String [@ocaml.doc ""]
  | AppSpecContent [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec revision_location = {
  revision_type : revision_location_type option;
      [@ocaml.doc
        "The type of application revision:\n\n\
        \ {ul\n\
        \       {-  S3: An application revision stored in Amazon S3.\n\
        \           \n\
        \            }\n\
        \       {-  GitHub: An application revision stored in GitHub (EC2/On-premises deployments \
         only).\n\
        \           \n\
        \            }\n\
        \       {-  String: A YAML-formatted or JSON-formatted string (Lambda deployments only).\n\
        \           \n\
        \            }\n\
        \       {-  AppSpecContent: An [AppSpecContent] object that contains the contents of an \
         AppSpec file for an Lambda or Amazon ECS deployment. The content is formatted as JSON or \
         YAML stored as a RawString.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  s3_location : s3_location option;
      [@ocaml.doc "Information about the location of a revision stored in Amazon S3. \n"]
  git_hub_location : git_hub_location option;
      [@ocaml.doc "Information about the location of application artifacts stored in GitHub.\n"]
  string_ : raw_string option;
      [@ocaml.doc
        "Information about the location of an Lambda deployment revision stored as a RawString.\n"]
  app_spec_content : app_spec_content option;
      [@ocaml.doc
        " The content of an AppSpec file for an Lambda or Amazon ECS deployment. The content is \
         formatted as JSON or YAML and stored as a RawString. \n"]
}
[@@ocaml.doc "Information about the location of an application revision.\n"]

type nonrec revision_info = {
  revision_location : revision_location option;
      [@ocaml.doc "Information about the location and type of an application revision.\n"]
  generic_revision_info : generic_revision_info option;
      [@ocaml.doc
        "Information about an application revision, including usage details and associated \
         deployment groups.\n"]
}
[@@ocaml.doc "Information about an application revision.\n"]

type nonrec revision_info_list = revision_info list [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec batch_get_application_revisions_output = {
  application_name : application_name option;
      [@ocaml.doc "The name of the application that corresponds to the revisions.\n"]
  error_message : error_message option;
      [@ocaml.doc "Information about errors that might have occurred during the API call.\n"]
  revisions : revision_info_list option;
      [@ocaml.doc "Additional information about the revisions, including the type and location.\n"]
}
[@@ocaml.doc "Represents the output of a [BatchGetApplicationRevisions] operation.\n"]

type nonrec revision_location_list = revision_location list [@@ocaml.doc ""]

type nonrec batch_get_application_revisions_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application about which to get revision information.\n"]
  revisions : revision_location_list;
      [@ocaml.doc
        "An array of [RevisionLocation] objects that specify information to get about the \
         application revisions, including type and location. The maximum number of \
         [RevisionLocation] objects you can specify is 25.\n"]
}
[@@ocaml.doc "Represents the input of a [BatchGetApplicationRevisions] operation.\n"]

type nonrec batch_get_applications_output = {
  applications_info : applications_info_list option;
      [@ocaml.doc "Information about the applications.\n"]
}
[@@ocaml.doc "Represents the output of a [BatchGetApplications] operation.\n"]

type nonrec batch_get_applications_input = {
  application_names : applications_list;
      [@ocaml.doc
        "A list of application names separated by spaces. The maximum number of application names \
         you can specify is 100.\n"]
}
[@@ocaml.doc "Represents the input of a [BatchGetApplications] operation.\n"]

type nonrec invalid_deployment_group_name_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment group name was specified in an invalid format.\n"]

type nonrec deployment_group_name_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment group name was not specified.\n"]

type nonrec deployment_config_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The deployment configuration does not exist with the user or Amazon Web Services account.\n"]

type nonrec ecs_cluster_name = string [@@ocaml.doc ""]

type nonrec ecs_service_name = string [@@ocaml.doc ""]

type nonrec ecs_service = {
  service_name : ecs_service_name option;
      [@ocaml.doc " The name of the target Amazon ECS service. \n"]
  cluster_name : ecs_cluster_name option;
      [@ocaml.doc " The name of the cluster that the Amazon ECS service is associated with. \n"]
}
[@@ocaml.doc
  " Contains the service and cluster names used to identify an Amazon ECS deployment's target. \n"]

type nonrec ecs_service_list = ecs_service list [@@ocaml.doc ""]

type nonrec tag_filter_type =
  | KEY_ONLY [@ocaml.doc ""]
  | VALUE_ONLY [@ocaml.doc ""]
  | KEY_AND_VALUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_filter = {
  key : key option; [@ocaml.doc "The on-premises instance tag filter key.\n"]
  value : value option; [@ocaml.doc "The on-premises instance tag filter value.\n"]
  type_ : tag_filter_type option;
      [@ocaml.doc
        "The on-premises instance tag filter type:\n\n\
        \ {ul\n\
        \       {-  KEY_ONLY: Key only.\n\
        \           \n\
        \            }\n\
        \       {-  VALUE_ONLY: Value only.\n\
        \           \n\
        \            }\n\
        \       {-  KEY_AND_VALUE: Key and value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about an on-premises instance tag filter.\n"]

type nonrec tag_filter_list = tag_filter list [@@ocaml.doc ""]

type nonrec on_premises_tag_set_list = tag_filter_list list [@@ocaml.doc ""]

type nonrec on_premises_tag_set = {
  on_premises_tag_set_list : on_premises_tag_set_list option;
      [@ocaml.doc
        "A list that contains other lists of on-premises instance tag groups. For an instance to \
         be included in the deployment group, it must be identified by all of the tag groups in \
         the list.\n"]
}
[@@ocaml.doc "Information about groups of on-premises instance tags.\n"]

type nonrec ec2_tag_filter_type =
  | KEY_ONLY [@ocaml.doc ""]
  | VALUE_ONLY [@ocaml.doc ""]
  | KEY_AND_VALUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ec2_tag_filter = {
  key : key option; [@ocaml.doc "The tag filter key.\n"]
  value : value option; [@ocaml.doc "The tag filter value.\n"]
  type_ : ec2_tag_filter_type option;
      [@ocaml.doc
        "The tag filter type:\n\n\
        \ {ul\n\
        \       {-   [KEY_ONLY]: Key only.\n\
        \           \n\
        \            }\n\
        \       {-   [VALUE_ONLY]: Value only.\n\
        \           \n\
        \            }\n\
        \       {-   [KEY_AND_VALUE]: Key and value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about an EC2 tag filter.\n"]

type nonrec ec2_tag_filter_list = ec2_tag_filter list [@@ocaml.doc ""]

type nonrec ec2_tag_set_list = ec2_tag_filter_list list [@@ocaml.doc ""]

type nonrec ec2_tag_set = {
  ec2_tag_set_list : ec2_tag_set_list option;
      [@ocaml.doc
        "A list that contains other lists of Amazon EC2 instance tag groups. For an instance to be \
         included in the deployment group, it must be identified by all of the tag groups in the \
         list.\n"]
}
[@@ocaml.doc "Information about groups of Amazon EC2 instance tags.\n"]

type nonrec deployment_status =
  | CREATED [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | BAKING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_id = string [@@ocaml.doc ""]

type nonrec last_deployment_info = {
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
  status : deployment_status option; [@ocaml.doc "The status of the most recent deployment.\n"]
  end_time : timestamp option;
      [@ocaml.doc
        "A timestamp that indicates when the most recent deployment to the deployment group was \
         complete.\n"]
  create_time : timestamp option;
      [@ocaml.doc
        "A timestamp that indicates when the most recent deployment to the deployment group started.\n"]
}
[@@ocaml.doc
  "Information about the most recent attempted or successful deployment to a deployment group.\n"]

type nonrec listener_arn = string [@@ocaml.doc ""]

type nonrec listener_arn_list = listener_arn list [@@ocaml.doc ""]

type nonrec traffic_route = {
  listener_arns : listener_arn_list option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of one listener. The listener identifies the route \
         between a target group and a load balancer. This is an array of strings with a maximum \
         size of one. \n"]
}
[@@ocaml.doc
  " Information about a listener. The listener contains the path used to route traffic that is \
   received from the load balancer to a target group. \n"]

type nonrec target_group_name = string [@@ocaml.doc ""]

type nonrec target_group_info = {
  name : target_group_name option;
      [@ocaml.doc
        "For blue/green deployments, the name of the target group that instances in the original \
         environment are deregistered from, and instances in the replacement environment are \
         registered with. For in-place deployments, the name of the target group that instances \
         are deregistered from, so they are not serving traffic during a deployment, and then \
         re-registered with after the deployment is complete. \n"]
}
[@@ocaml.doc
  "Information about a target group in Elastic Load Balancing to use in a deployment. Instances \
   are registered as targets in a target group, and traffic is routed to the target group.\n"]

type nonrec target_group_info_list = target_group_info list [@@ocaml.doc ""]

type nonrec target_group_pair_info = {
  target_groups : target_group_info_list option;
      [@ocaml.doc
        " One pair of target groups. One is associated with the original task set. The second is \
         associated with the task set that serves traffic after the deployment is complete. \n"]
  prod_traffic_route : traffic_route option;
      [@ocaml.doc
        " The path used by a load balancer to route production traffic when an Amazon ECS \
         deployment is complete. \n"]
  test_traffic_route : traffic_route option;
      [@ocaml.doc
        " An optional path used by a load balancer to route test traffic after an Amazon ECS \
         deployment. Validation can occur while test traffic is served during a deployment. \n"]
}
[@@ocaml.doc
  " Information about two target groups and how traffic is routed during an Amazon ECS deployment. \
   An optional test traffic route can be specified. \n"]

type nonrec target_group_pair_info_list = target_group_pair_info list [@@ocaml.doc ""]

type nonrec elb_name = string [@@ocaml.doc ""]

type nonrec elb_info = {
  name : elb_name option;
      [@ocaml.doc
        "For blue/green deployments, the name of the Classic Load Balancer that is used to route \
         traffic from original instances to replacement instances in a blue/green deployment. For \
         in-place deployments, the name of the Classic Load Balancer that instances are \
         deregistered from so they are not serving traffic during a deployment, and then \
         re-registered with after the deployment is complete.\n"]
}
[@@ocaml.doc
  "Information about a Classic Load Balancer in Elastic Load Balancing to use in a deployment. \
   Instances are registered directly with a load balancer, and traffic is routed to the load \
   balancer.\n"]

type nonrec elb_info_list = elb_info list [@@ocaml.doc ""]

type nonrec load_balancer_info = {
  elb_info_list : elb_info_list option;
      [@ocaml.doc
        "An array that contains information about the load balancers to use for load balancing in \
         a deployment. If you're using Classic Load Balancers, specify those load balancers in \
         this array. \n\n\
        \  You can add up to 10 load balancers to the array.\n\
        \  \n\
        \     If you're using Application Load Balancers or Network Load Balancers, use the \
         [targetGroupInfoList] array instead of this one.\n\
        \     \n\
        \      "]
  target_group_info_list : target_group_info_list option;
      [@ocaml.doc
        "An array that contains information about the target groups to use for load balancing in a \
         deployment. If you're using Application Load Balancers and Network Load Balancers, \
         specify their associated target groups in this array.\n\n\
        \  You can add up to 10 target groups to the array.\n\
        \  \n\
        \     If you're using Classic Load Balancers, use the [elbInfoList] array instead of this \
         one.\n\
        \     \n\
        \      "]
  target_group_pair_info_list : target_group_pair_info_list option;
      [@ocaml.doc
        " The target group pair information. This is an array of [TargeGroupPairInfo] objects with \
         a maximum size of one. \n"]
}
[@@ocaml.doc
  "Information about the Elastic Load Balancing load balancer or target group used in a \
   deployment.\n\n\
  \ You can use load balancers and target groups in combination. For example, if you have two \
   Classic Load Balancers, and five target groups tied to an Application Load Balancer, you can \
   specify the two Classic Load Balancers in [elbInfoList], and the five target groups in \
   [targetGroupInfoList].\n\
  \ "]

type nonrec green_fleet_provisioning_action =
  | DISCOVER_EXISTING [@ocaml.doc ""]
  | COPY_AUTO_SCALING_GROUP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec green_fleet_provisioning_option = {
  action : green_fleet_provisioning_action option;
      [@ocaml.doc
        "The method used to add instances to a replacement environment.\n\n\
        \ {ul\n\
        \       {-   [DISCOVER_EXISTING]: Use instances that already exist or will be created \
         manually.\n\
        \           \n\
        \            }\n\
        \       {-   [COPY_AUTO_SCALING_GROUP]: Use settings from a specified Auto Scaling group \
         to define and create instances in a new Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Information about the instances that belong to the replacement environment in a blue/green \
   deployment.\n"]

type nonrec duration = int [@@ocaml.doc ""]

type nonrec deployment_ready_action =
  | CONTINUE_DEPLOYMENT [@ocaml.doc ""]
  | STOP_DEPLOYMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_ready_option = {
  action_on_timeout : deployment_ready_action option;
      [@ocaml.doc
        "Information about when to reroute traffic from an original environment to a replacement \
         environment in a blue/green deployment.\n\n\
        \ {ul\n\
        \       {-  CONTINUE_DEPLOYMENT: Register new instances with the load balancer immediately \
         after the new application revision is installed on the instances in the replacement \
         environment.\n\
        \           \n\
        \            }\n\
        \       {-  STOP_DEPLOYMENT: Do not register new instances with a load balancer unless \
         traffic rerouting is started using [ContinueDeployment]. If traffic rerouting is not \
         started before the end of the specified wait period, the deployment status is changed to \
         Stopped.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  wait_time_in_minutes : duration option;
      [@ocaml.doc
        "The number of minutes to wait before the status of a blue/green deployment is changed to \
         Stopped if rerouting is not started manually. Applies only to the [STOP_DEPLOYMENT] \
         option for [actionOnTimeout].\n"]
}
[@@ocaml.doc
  "Information about how traffic is rerouted to instances in a replacement environment in a \
   blue/green deployment.\n"]

type nonrec instance_action = TERMINATE [@ocaml.doc ""] | KEEP_ALIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec blue_instance_termination_option = {
  action : instance_action option;
      [@ocaml.doc
        "The action to take on instances in the original environment after a successful blue/green \
         deployment.\n\n\
        \ {ul\n\
        \       {-   [TERMINATE]: Instances are terminated after a specified wait time.\n\
        \           \n\
        \            }\n\
        \       {-   [KEEP_ALIVE]: Instances are left running after they are deregistered from the \
         load balancer and removed from the deployment group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  termination_wait_time_in_minutes : duration option;
      [@ocaml.doc
        "For an Amazon EC2 deployment, the number of minutes to wait after a successful blue/green \
         deployment before terminating instances from the original environment.\n\n\
        \  For an Amazon ECS deployment, the number of minutes before deleting the original (blue) \
         task set. During an Amazon ECS deployment, CodeDeploy shifts traffic from the original \
         (blue) task set to a replacement (green) task set. \n\
        \ \n\
        \   The maximum setting is 2880 minutes (2 days). \n\
        \  "]
}
[@@ocaml.doc
  "Information about whether instances in the original environment are terminated when a \
   blue/green deployment is successful. [BlueInstanceTerminationOption] does not apply to Lambda \
   deployments. \n"]

type nonrec blue_green_deployment_configuration = {
  terminate_blue_instances_on_deployment_success : blue_instance_termination_option option;
      [@ocaml.doc
        "Information about whether to terminate instances in the original fleet during a \
         blue/green deployment.\n"]
  deployment_ready_option : deployment_ready_option option;
      [@ocaml.doc
        "Information about the action to take when newly provisioned instances are ready to \
         receive traffic in a blue/green deployment.\n"]
  green_fleet_provisioning_option : green_fleet_provisioning_option option;
      [@ocaml.doc
        "Information about how instances are provisioned for a replacement environment in a \
         blue/green deployment.\n"]
}
[@@ocaml.doc "Information about blue/green deployment options for a deployment group.\n"]

type nonrec outdated_instances_strategy = Update [@ocaml.doc ""] | Ignore [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_option =
  | WITH_TRAFFIC_CONTROL [@ocaml.doc ""]
  | WITHOUT_TRAFFIC_CONTROL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_type = IN_PLACE [@ocaml.doc ""] | BLUE_GREEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_style = {
  deployment_type : deployment_type option;
      [@ocaml.doc "Indicates whether to run an in-place deployment or a blue/green deployment.\n"]
  deployment_option : deployment_option option;
      [@ocaml.doc "Indicates whether to route deployment traffic behind a load balancer.\n"]
}
[@@ocaml.doc
  "Information about the type of deployment, either in-place or blue/green, you want to run and \
   whether to route deployment traffic behind a load balancer.\n"]

type nonrec trigger_event_type =
  | DEPLOYMENT_START [@ocaml.doc ""]
  | DEPLOYMENT_SUCCESS [@ocaml.doc ""]
  | DEPLOYMENT_FAILURE [@ocaml.doc ""]
  | DEPLOYMENT_STOP [@ocaml.doc ""]
  | DEPLOYMENT_ROLLBACK [@ocaml.doc ""]
  | DEPLOYMENT_READY [@ocaml.doc ""]
  | INSTANCE_START [@ocaml.doc ""]
  | INSTANCE_SUCCESS [@ocaml.doc ""]
  | INSTANCE_FAILURE [@ocaml.doc ""]
  | INSTANCE_READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec trigger_event_type_list = trigger_event_type list [@@ocaml.doc ""]

type nonrec trigger_target_arn = string [@@ocaml.doc ""]

type nonrec trigger_name = string [@@ocaml.doc ""]

type nonrec trigger_config = {
  trigger_name : trigger_name option; [@ocaml.doc "The name of the notification trigger.\n"]
  trigger_target_arn : trigger_target_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service topic through \
         which notifications about deployment or instance events are sent.\n"]
  trigger_events : trigger_event_type_list option;
      [@ocaml.doc "The event type or types for which notifications are triggered.\n"]
}
[@@ocaml.doc "Information about notification triggers for the deployment group.\n"]

type nonrec trigger_config_list = trigger_config list [@@ocaml.doc ""]

type nonrec role = string [@@ocaml.doc ""]

type nonrec deployment_config_name = string [@@ocaml.doc ""]

type nonrec deployment_group_id = string [@@ocaml.doc ""]

type nonrec deployment_group_info = {
  application_name : application_name option; [@ocaml.doc "The application name.\n"]
  deployment_group_id : deployment_group_id option; [@ocaml.doc "The deployment group ID.\n"]
  deployment_group_name : deployment_group_name option; [@ocaml.doc "The deployment group name.\n"]
  deployment_config_name : deployment_config_name option;
      [@ocaml.doc "The deployment configuration name.\n"]
  ec2_tag_filters : ec2_tag_filter_list option;
      [@ocaml.doc
        "The Amazon EC2 tags on which to filter. The deployment group includes EC2 instances with \
         any of the specified tags.\n"]
  on_premises_instance_tag_filters : tag_filter_list option;
      [@ocaml.doc
        "The on-premises instance tags on which to filter. The deployment group includes \
         on-premises instances with any of the specified tags.\n"]
  auto_scaling_groups : auto_scaling_group_list option;
      [@ocaml.doc "A list of associated Auto Scaling groups.\n"]
  service_role_arn : role option;
      [@ocaml.doc
        "A service role Amazon Resource Name (ARN) that grants CodeDeploy permission to make calls \
         to Amazon Web Services services on your behalf. For more information, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-service-role.html}Create \
         a Service Role for CodeDeploy} in the {i CodeDeploy User Guide}.\n"]
  target_revision : revision_location option;
      [@ocaml.doc
        "Information about the deployment group's target revision, including type and location.\n"]
  trigger_configurations : trigger_config_list option;
      [@ocaml.doc "Information about triggers associated with the deployment group.\n"]
  alarm_configuration : alarm_configuration option;
      [@ocaml.doc "A list of alarms associated with the deployment group.\n"]
  auto_rollback_configuration : auto_rollback_configuration option;
      [@ocaml.doc
        "Information about the automatic rollback configuration associated with the deployment \
         group.\n"]
  deployment_style : deployment_style option;
      [@ocaml.doc
        "Information about the type of deployment, either in-place or blue/green, you want to run \
         and whether to route deployment traffic behind a load balancer.\n"]
  outdated_instances_strategy : outdated_instances_strategy option;
      [@ocaml.doc
        "Indicates what happens when new Amazon EC2 instances are launched mid-deployment and do \
         not receive the deployed application revision.\n\n\
        \ If this option is set to [UPDATE] or is unspecified, CodeDeploy initiates one or more \
         'auto-update outdated instances' deployments to apply the deployed application revision \
         to the new Amazon EC2 instances.\n\
        \ \n\
        \  If this option is set to [IGNORE], CodeDeploy does not initiate a deployment to update \
         the new Amazon EC2 instances. This may result in instances having different revisions.\n\
        \  "]
  blue_green_deployment_configuration : blue_green_deployment_configuration option;
      [@ocaml.doc "Information about blue/green deployment options for a deployment group.\n"]
  load_balancer_info : load_balancer_info option;
      [@ocaml.doc "Information about the load balancer to use in a deployment.\n"]
  last_successful_deployment : last_deployment_info option;
      [@ocaml.doc
        "Information about the most recent successful deployment to the deployment group.\n"]
  last_attempted_deployment : last_deployment_info option;
      [@ocaml.doc
        "Information about the most recent attempted deployment to the deployment group.\n"]
  ec2_tag_set : ec2_tag_set option;
      [@ocaml.doc
        "Information about groups of tags applied to an Amazon EC2 instance. The deployment group \
         includes only Amazon EC2 instances identified by all of the tag groups. Cannot be used in \
         the same call as ec2TagFilters.\n"]
  on_premises_tag_set : on_premises_tag_set option;
      [@ocaml.doc
        "Information about groups of tags applied to an on-premises instance. The deployment group \
         includes only on-premises instances identified by all the tag groups. Cannot be used in \
         the same call as onPremisesInstanceTagFilters.\n"]
  compute_platform : compute_platform option;
      [@ocaml.doc
        "The destination platform type for the deployment ([Lambda], [Server], or [ECS]).\n"]
  ecs_services : ecs_service_list option;
      [@ocaml.doc
        " The target Amazon ECS services in the deployment group. This applies only to deployment \
         groups that use the Amazon ECS compute platform. A target Amazon ECS service is specified \
         as an Amazon ECS cluster and service name pair using the format \n\
         {[\n\
         :\n\
         ]}\n\
         . \n"]
  termination_hook_enabled : boolean_ option;
      [@ocaml.doc
        "Indicates whether the deployment group was configured to have CodeDeploy install a \
         termination hook into an Auto Scaling group.\n\n\
        \ For more information about the termination hook, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors}How \
         Amazon EC2 Auto Scaling works with CodeDeploy} in the {i CodeDeploy User Guide}.\n\
        \ "]
}
[@@ocaml.doc "Information about a deployment group.\n"]

type nonrec deployment_group_info_list = deployment_group_info list [@@ocaml.doc ""]

type nonrec batch_get_deployment_groups_output = {
  deployment_groups_info : deployment_group_info_list option;
      [@ocaml.doc "Information about the deployment groups.\n"]
  error_message : error_message option;
      [@ocaml.doc "Information about errors that might have occurred during the API call.\n"]
}
[@@ocaml.doc "Represents the output of a [BatchGetDeploymentGroups] operation.\n"]

type nonrec batch_get_deployment_groups_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the applicable user or Amazon Web \
         Services account.\n"]
  deployment_group_names : deployment_groups_list;
      [@ocaml.doc "The names of the deployment groups.\n"]
}
[@@ocaml.doc "Represents the input of a [BatchGetDeploymentGroups] operation.\n"]

type nonrec invalid_deployment_id_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "At least one of the deployment IDs was specified in an invalid format.\n"]

type nonrec invalid_compute_platform_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The computePlatform is invalid. The computePlatform should be [Lambda], [Server], or [ECS].\n"]

type nonrec instance_id_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The instance ID was not specified.\n"]

type nonrec deployment_id_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "At least one deployment ID must be specified.\n"]

type nonrec deployment_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment with the user or Amazon Web Services account does not exist.\n"]

type nonrec instance_type = BLUE [@ocaml.doc ""] | GREEN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec lifecycle_event_status =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SKIPPED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_tail = string [@@ocaml.doc ""]

type nonrec lifecycle_message = string [@@ocaml.doc ""]

type nonrec script_name = string [@@ocaml.doc ""]

type nonrec lifecycle_error_code =
  | SUCCESS [@ocaml.doc ""]
  | SCRIPT_MISSING [@ocaml.doc ""]
  | SCRIPT_NOT_EXECUTABLE [@ocaml.doc ""]
  | SCRIPT_TIMED_OUT [@ocaml.doc ""]
  | SCRIPT_FAILED [@ocaml.doc ""]
  | UNKNOWN_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec diagnostics = {
  error_code : lifecycle_error_code option;
      [@ocaml.doc
        "The associated error code:\n\n\
        \ {ul\n\
        \       {-  Success: The specified script ran.\n\
        \           \n\
        \            }\n\
        \       {-  ScriptMissing: The specified script was not found in the specified location.\n\
        \           \n\
        \            }\n\
        \       {-  ScriptNotExecutable: The specified script is not a recognized executable file \
         type.\n\
        \           \n\
        \            }\n\
        \       {-  ScriptTimedOut: The specified script did not finish running in the specified \
         time period.\n\
        \           \n\
        \            }\n\
        \       {-  ScriptFailed: The specified script failed to run as expected.\n\
        \           \n\
        \            }\n\
        \       {-  UnknownError: The specified script did not run for an unknown reason.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  script_name : script_name option; [@ocaml.doc "The name of the script.\n"]
  message : lifecycle_message option; [@ocaml.doc "The message associated with the error.\n"]
  log_tail : log_tail option;
      [@ocaml.doc
        "The last portion of the diagnostic log.\n\n\
        \ If available, CodeDeploy returns up to the last 4 KB of the diagnostic log.\n\
        \ "]
}
[@@ocaml.doc "Diagnostic information about executable scripts that are part of a deployment.\n"]

type nonrec lifecycle_event_name = string [@@ocaml.doc ""]

type nonrec lifecycle_event = {
  lifecycle_event_name : lifecycle_event_name option;
      [@ocaml.doc
        "The deployment lifecycle event name, such as [ApplicationStop], [BeforeInstall], \
         [AfterInstall], [ApplicationStart], or [ValidateService].\n"]
  diagnostics : diagnostics option;
      [@ocaml.doc "Diagnostic information about the deployment lifecycle event.\n"]
  start_time : timestamp option;
      [@ocaml.doc "A timestamp that indicates when the deployment lifecycle event started.\n"]
  end_time : timestamp option;
      [@ocaml.doc "A timestamp that indicates when the deployment lifecycle event ended.\n"]
  status : lifecycle_event_status option;
      [@ocaml.doc
        "The deployment lifecycle event status:\n\n\
        \ {ul\n\
        \       {-  Pending: The deployment lifecycle event is pending.\n\
        \           \n\
        \            }\n\
        \       {-  InProgress: The deployment lifecycle event is in progress.\n\
        \           \n\
        \            }\n\
        \       {-  Succeeded: The deployment lifecycle event ran successfully.\n\
        \           \n\
        \            }\n\
        \       {-  Failed: The deployment lifecycle event has failed.\n\
        \           \n\
        \            }\n\
        \       {-  Skipped: The deployment lifecycle event has been skipped.\n\
        \           \n\
        \            }\n\
        \       {-  Unknown: The deployment lifecycle event is unknown.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about a deployment lifecycle event.\n"]

type nonrec lifecycle_event_list = lifecycle_event list [@@ocaml.doc ""]

type nonrec instance_status =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SKIPPED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec instance_summary = {
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
  instance_id : instance_id option; [@ocaml.doc "The instance ID.\n"]
  status : instance_status option;
      [@ocaml.doc
        "The deployment status for this instance:\n\n\
        \ {ul\n\
        \       {-   [Pending]: The deployment is pending for this instance.\n\
        \           \n\
        \            }\n\
        \       {-   [In Progress]: The deployment is in progress for this instance.\n\
        \           \n\
        \            }\n\
        \       {-   [Succeeded]: The deployment has succeeded for this instance.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed]: The deployment has failed for this instance.\n\
        \           \n\
        \            }\n\
        \       {-   [Skipped]: The deployment has been skipped for this instance.\n\
        \           \n\
        \            }\n\
        \       {-   [Unknown]: The deployment status is unknown for this instance.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_updated_at : timestamp option;
      [@ocaml.doc "A timestamp that indicates when the instance information was last updated.\n"]
  lifecycle_events : lifecycle_event_list option;
      [@ocaml.doc "A list of lifecycle events for this instance.\n"]
  instance_type : instance_type option;
      [@ocaml.doc
        "Information about which environment an instance belongs to in a blue/green deployment.\n\n\
        \ {ul\n\
        \       {-  BLUE: The instance is part of the original environment.\n\
        \           \n\
        \            }\n\
        \       {-  GREEN: The instance is part of the replacement environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about an instance in a deployment.\n"]

type nonrec instance_summary_list = instance_summary list [@@ocaml.doc ""]

type nonrec batch_get_deployment_instances_output = {
  instances_summary : instance_summary_list option; [@ocaml.doc "Information about the instance.\n"]
  error_message : error_message option;
      [@ocaml.doc "Information about errors that might have occurred during the API call.\n"]
}
[@@ocaml.doc "Represents the output of a [BatchGetDeploymentInstances] operation.\n"]

type nonrec instances_list = instance_id list [@@ocaml.doc ""]

type nonrec batch_get_deployment_instances_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  instance_ids : instances_list;
      [@ocaml.doc
        "The unique IDs of instances used in the deployment. The maximum number of instance IDs \
         you can specify is 25.\n"]
}
[@@ocaml.doc " Represents the input of a [BatchGetDeploymentInstances] operation. \n"]

type nonrec invalid_deployment_target_id_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The target ID provided was not valid. \n"]

type nonrec instance_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified instance does not exist in the deployment group.\n"]

type nonrec deployment_target_list_size_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  " The maximum number of targets that can be associated with an Amazon ECS or Lambda deployment \
   was exceeded. The target list of both types of deployments must have exactly one item. This \
   exception does not apply to EC2/On-premises deployments. \n"]

type nonrec deployment_target_id_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " A deployment target ID was not provided. \n"]

type nonrec deployment_target_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The provided target ID does not belong to the attempted deployment. \n"]

type nonrec deployment_not_started_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified deployment has not started.\n"]

type nonrec traffic_weight = float [@@ocaml.doc ""]

type nonrec cloud_formation_resource_type = string [@@ocaml.doc ""]

type nonrec target_status =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SKIPPED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec target_id = string [@@ocaml.doc ""]

type nonrec cloud_formation_target = {
  deployment_id : deployment_id option;
      [@ocaml.doc "The unique ID of an CloudFormation blue/green deployment.\n"]
  target_id : target_id option;
      [@ocaml.doc
        " The unique ID of a deployment target that has a type of\194\160[CloudFormationTarget]. \n"]
  last_updated_at : time option;
      [@ocaml.doc
        " The date and time when the target application was updated by an CloudFormation \
         blue/green deployment. \n"]
  lifecycle_events : lifecycle_event_list option;
      [@ocaml.doc
        " The lifecycle events of the CloudFormation blue/green deployment to this target \
         application. \n"]
  status : target_status option;
      [@ocaml.doc " The status of an CloudFormation blue/green deployment's target application. \n"]
  resource_type : cloud_formation_resource_type option;
      [@ocaml.doc "The resource type for the CloudFormation blue/green deployment.\n"]
  target_version_weight : traffic_weight option;
      [@ocaml.doc
        "The percentage of production traffic that the target version of an CloudFormation \
         blue/green deployment receives.\n"]
}
[@@ocaml.doc
  " Information about the target to be updated by an CloudFormation blue/green deployment. This \
   target type is used for all deployments initiated by a CloudFormation stack update.\n"]

type nonrec target_label = BLUE [@ocaml.doc ""] | GREEN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ecs_task_set_status = string [@@ocaml.doc ""]

type nonrec ecs_task_set_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec ecs_task_set_identifier = string [@@ocaml.doc ""]

type nonrec ecs_task_set = {
  identifer : ecs_task_set_identifier option; [@ocaml.doc " A unique ID of an [ECSTaskSet]. \n"]
  desired_count : ecs_task_set_count option;
      [@ocaml.doc
        " The number of tasks in a task set. During a deployment that uses the Amazon ECS compute \
         type, CodeDeploy instructs Amazon ECS to create a new task set and uses this value to \
         determine how many tasks to create. After the updated task set is created, CodeDeploy \
         shifts traffic to the new task set. \n"]
  pending_count : ecs_task_set_count option;
      [@ocaml.doc
        " The number of tasks in the task set that are in the [PENDING] status during an Amazon \
         ECS deployment. A task in the [PENDING] state is preparing to enter the [RUNNING] state. \
         A task set enters the [PENDING] status when it launches for the first time, or when it is \
         restarted after being in the [STOPPED] state. \n"]
  running_count : ecs_task_set_count option;
      [@ocaml.doc
        " The number of tasks in the task set that are in the [RUNNING] status during an Amazon \
         ECS deployment. A task in the [RUNNING] state is running and ready for use. \n"]
  status : ecs_task_set_status option;
      [@ocaml.doc
        " The status of the task set. There are three valid task set statuses: \n\n\
        \ {ul\n\
        \       {-   [PRIMARY]: Indicates the task set is serving production traffic. \n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE]: Indicates the task set is not serving production traffic. \n\
        \           \n\
        \            }\n\
        \       {-   [DRAINING]: Indicates the tasks in the task set are being stopped and their \
         corresponding targets are being deregistered from their target group. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  traffic_weight : traffic_weight option;
      [@ocaml.doc " The percentage of traffic served by this task set. \n"]
  target_group : target_group_info option;
      [@ocaml.doc
        " The target group associated with the task set. The target group is used by CodeDeploy to \
         manage traffic to a task set. \n"]
  task_set_label : target_label option;
      [@ocaml.doc
        " A label that identifies whether the ECS task set is an original target ([BLUE]) or a \
         replacement target ([GREEN]). \n"]
}
[@@ocaml.doc
  " Information about a set of Amazon ECS tasks in an CodeDeploy deployment. An Amazon ECS task \
   set includes details such as the desired number of tasks, how many tasks are running, and \
   whether the task set serves production traffic. An CodeDeploy application that uses the Amazon \
   ECS compute platform deploys a containerized application in an Amazon ECS service as a task \
   set. \n"]

type nonrec ecs_task_set_list = ecs_task_set list [@@ocaml.doc ""]

type nonrec target_arn = string [@@ocaml.doc ""]

type nonrec ecs_target = {
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
  target_id : target_id option;
      [@ocaml.doc " The unique ID of a deployment target that has a type of [ecsTarget]. \n"]
  target_arn : target_arn option; [@ocaml.doc " The Amazon Resource Name (ARN) of the target. \n"]
  last_updated_at : time option;
      [@ocaml.doc
        " The date and time when the target Amazon ECS application was updated by a deployment. \n"]
  lifecycle_events : lifecycle_event_list option;
      [@ocaml.doc
        " The lifecycle events of the deployment to this target Amazon ECS application. \n"]
  status : target_status option;
      [@ocaml.doc " The status an Amazon ECS deployment's target ECS application. \n"]
  task_sets_info : ecs_task_set_list option;
      [@ocaml.doc " The [ECSTaskSet] objects associated with the ECS target. \n"]
}
[@@ocaml.doc " Information about the target of an Amazon ECS deployment. \n"]

type nonrec version = string [@@ocaml.doc ""]

type nonrec lambda_function_alias = string [@@ocaml.doc ""]

type nonrec lambda_function_name = string [@@ocaml.doc ""]

type nonrec lambda_function_info = {
  function_name : lambda_function_name option; [@ocaml.doc " The name of a Lambda function. \n"]
  function_alias : lambda_function_alias option;
      [@ocaml.doc
        " The alias of a Lambda function. For more information, see \
         {{:https://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html}Lambda Function \
         Aliases} in the {i Lambda Developer Guide}.\n"]
  current_version : version option;
      [@ocaml.doc " The version of a Lambda function that production traffic points to. \n"]
  target_version : version option;
      [@ocaml.doc
        " The version of a Lambda function that production traffic points to after the Lambda \
         function is deployed. \n"]
  target_version_weight : traffic_weight option;
      [@ocaml.doc
        " The percentage of production traffic that the target version of a Lambda function \
         receives. \n"]
}
[@@ocaml.doc " Information about a Lambda function specified in a deployment. \n"]

type nonrec lambda_target = {
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
  target_id : target_id option;
      [@ocaml.doc " The unique ID of a deployment target that has a type of [lambdaTarget]. \n"]
  target_arn : target_arn option; [@ocaml.doc " The Amazon Resource Name (ARN) of the target. \n"]
  status : target_status option;
      [@ocaml.doc " The status an Lambda deployment's target Lambda function. \n"]
  last_updated_at : time option;
      [@ocaml.doc
        " The date and time when the target Lambda function was updated by a deployment. \n"]
  lifecycle_events : lifecycle_event_list option;
      [@ocaml.doc " The lifecycle events of the deployment to this target Lambda function. \n"]
  lambda_function_info : lambda_function_info option;
      [@ocaml.doc " A [LambdaFunctionInfo] object that describes a target Lambda function. \n"]
}
[@@ocaml.doc " Information about the target Lambda function during an Lambda deployment. \n"]

type nonrec instance_target = {
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
  target_id : target_id option;
      [@ocaml.doc " The unique ID of a deployment target that has a type of [instanceTarget]. \n"]
  target_arn : target_arn option; [@ocaml.doc " The Amazon Resource Name (ARN) of the target. \n"]
  status : target_status option;
      [@ocaml.doc " The status an EC2/On-premises deployment's target instance. \n"]
  last_updated_at : time option;
      [@ocaml.doc " The date and time when the target instance was updated by a deployment. \n"]
  lifecycle_events : lifecycle_event_list option;
      [@ocaml.doc " The lifecycle events of the deployment to this target instance. \n"]
  instance_label : target_label option;
      [@ocaml.doc
        " A label that identifies whether the instance is an original target ([BLUE]) or a \
         replacement target ([GREEN]). \n"]
}
[@@ocaml.doc
  " A target Amazon EC2 or on-premises instance during a deployment that uses the EC2/On-premises \
   compute platform. \n"]

type nonrec deployment_target_type =
  | INSTANCE_TARGET [@ocaml.doc ""]
  | LAMBDA_TARGET [@ocaml.doc ""]
  | ECS_TARGET [@ocaml.doc ""]
  | CLOUDFORMATION_TARGET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_target = {
  deployment_target_type : deployment_target_type option;
      [@ocaml.doc
        "The deployment type that is specific to the deployment's compute platform or deployments \
         initiated by a CloudFormation stack update.\n"]
  instance_target : instance_target option;
      [@ocaml.doc
        " Information about the target for a deployment that uses the EC2/On-premises compute \
         platform. \n"]
  lambda_target : lambda_target option;
      [@ocaml.doc
        " Information about the target for a deployment that uses the Lambda compute platform. \n"]
  ecs_target : ecs_target option;
      [@ocaml.doc
        " Information about the target for a deployment that uses the Amazon ECS compute platform. \n"]
  cloud_formation_target : cloud_formation_target option; [@ocaml.doc ""]
}
[@@ocaml.doc " Information about the deployment target. \n"]

type nonrec deployment_target_list = deployment_target list [@@ocaml.doc ""]

type nonrec batch_get_deployment_targets_output = {
  deployment_targets : deployment_target_list option;
      [@ocaml.doc
        " A list of target objects for a deployment. Each target object contains details about the \
         target, such as its status and lifecycle events. The type of the target objects depends \
         on the deployment' compute platform. \n\n\
        \ {ul\n\
        \       {-   {b EC2/On-premises}: Each target object is an Amazon EC2 or on-premises \
         instance. \n\
        \           \n\
        \            }\n\
        \       {-   {b Lambda}: The target object is a specific version of an Lambda function. \n\
        \           \n\
        \            }\n\
        \       {-   {b Amazon ECS}: The target object is an Amazon ECS service. \n\
        \           \n\
        \            }\n\
        \       {-   {b CloudFormation}: The target object is an CloudFormation blue/green \
         deployment. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec target_id_list = target_id list [@@ocaml.doc ""]

type nonrec batch_get_deployment_targets_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  target_ids : target_id_list;
      [@ocaml.doc
        " The unique IDs of the deployment targets. The compute platform of the deployment \
         determines the type of the targets and their formats. The maximum number of deployment \
         target IDs you can specify is 25.\n\n\
        \ {ul\n\
        \       {-   For deployments that use the EC2/On-premises compute platform, the target IDs \
         are Amazon EC2 or on-premises instances IDs, and their target type is [instanceTarget]. \n\
        \           \n\
        \            }\n\
        \       {-   For deployments that use the Lambda compute platform, the target IDs are the \
         names of Lambda functions, and their target type is [instanceTarget]. \n\
        \           \n\
        \            }\n\
        \       {-   For deployments that use the Amazon ECS compute platform, the target IDs are \
         pairs of Amazon ECS clusters and services specified using the format \n\
        \           {[\n\
        \           :\n\
        \           ]}\n\
        \           . Their target type is [ecsTarget]. \n\
        \           \n\
        \            }\n\
        \       {-   For deployments that are deployed with CloudFormation, the target IDs are \
         CloudFormation stack IDs. Their target type is [cloudFormationTarget]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec deployments_list = deployment_id list [@@ocaml.doc ""]

type nonrec related_deployments = {
  auto_update_outdated_instances_root_deployment_id : deployment_id option;
      [@ocaml.doc "The deployment ID of the root deployment that triggered this deployment.\n"]
  auto_update_outdated_instances_deployment_ids : deployments_list option;
      [@ocaml.doc
        "The deployment IDs of 'auto-update outdated instances' deployments triggered by this \
         deployment.\n"]
}
[@@ocaml.doc "Information about deployments related to the specified deployment.\n"]

type nonrec external_id = string [@@ocaml.doc ""]

type nonrec deployment_status_message_list = error_message list [@@ocaml.doc ""]

type nonrec file_exists_behavior =
  | DISALLOW [@ocaml.doc ""]
  | OVERWRITE [@ocaml.doc ""]
  | RETAIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_instances = {
  tag_filters : ec2_tag_filter_list option;
      [@ocaml.doc
        "The tag filter key, type, and value used to identify Amazon EC2 instances in a \
         replacement environment for a blue/green deployment. Cannot be used in the same call as \
         [ec2TagSet].\n"]
  auto_scaling_groups : auto_scaling_group_name_list option;
      [@ocaml.doc
        "The names of one or more Auto Scaling groups to identify a replacement environment for a \
         blue/green deployment.\n"]
  ec2_tag_set : ec2_tag_set option;
      [@ocaml.doc
        "Information about the groups of Amazon EC2 instance tags that an instance must be \
         identified by in order for it to be included in the replacement environment for a \
         blue/green deployment. Cannot be used in the same call as [tagFilters].\n"]
}
[@@ocaml.doc
  "Information about the instances to be used in the replacement environment in a blue/green \
   deployment.\n"]

type nonrec rollback_info = {
  rollback_deployment_id : deployment_id option; [@ocaml.doc "The ID of the deployment rollback.\n"]
  rollback_triggering_deployment_id : deployment_id option;
      [@ocaml.doc
        "The deployment ID of the deployment that was underway and triggered a rollback deployment \
         because it failed or was stopped.\n"]
  rollback_message : description option;
      [@ocaml.doc
        "Information that describes the status of a deployment rollback (for example, whether the \
         deployment can't be rolled back, is in progress, failed, or succeeded). \n"]
}
[@@ocaml.doc "Information about a deployment rollback.\n"]

type nonrec deployment_creator =
  | User [@ocaml.doc ""]
  | Autoscaling [@ocaml.doc ""]
  | CodeDeployRollback [@ocaml.doc ""]
  | CodeDeploy [@ocaml.doc ""]
  | CodeDeployAutoUpdate [@ocaml.doc ""]
  | CloudFormation [@ocaml.doc ""]
  | CloudFormationRollback [@ocaml.doc ""]
  | AutoscalingTermination [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec deployment_overview = {
  pending : instance_count option;
      [@ocaml.doc "The number of instances in the deployment in a pending state.\n"]
  in_progress : instance_count option;
      [@ocaml.doc "The number of instances in which the deployment is in progress.\n"]
  succeeded : instance_count option;
      [@ocaml.doc
        "The number of instances in the deployment to which revisions have been successfully \
         deployed.\n"]
  failed : instance_count option;
      [@ocaml.doc "The number of instances in the deployment in a failed state.\n"]
  skipped : instance_count option;
      [@ocaml.doc "The number of instances in the deployment in a skipped state.\n"]
  ready : instance_count option;
      [@ocaml.doc
        "The number of instances in a replacement environment ready to receive traffic in a \
         blue/green deployment.\n"]
}
[@@ocaml.doc "Information about the deployment status of the instances in the deployment.\n"]

type nonrec error_code =
  | AGENT_ISSUE [@ocaml.doc ""]
  | ALARM_ACTIVE [@ocaml.doc ""]
  | APPLICATION_MISSING [@ocaml.doc ""]
  | AUTOSCALING_VALIDATION_ERROR [@ocaml.doc ""]
  | AUTO_SCALING_CONFIGURATION [@ocaml.doc ""]
  | AUTO_SCALING_IAM_ROLE_PERMISSIONS [@ocaml.doc ""]
  | CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND [@ocaml.doc ""]
  | CUSTOMER_APPLICATION_UNHEALTHY [@ocaml.doc ""]
  | DEPLOYMENT_GROUP_MISSING [@ocaml.doc ""]
  | ECS_UPDATE_ERROR [@ocaml.doc ""]
  | ELASTIC_LOAD_BALANCING_INVALID [@ocaml.doc ""]
  | ELB_INVALID_INSTANCE [@ocaml.doc ""]
  | HEALTH_CONSTRAINTS [@ocaml.doc ""]
  | HEALTH_CONSTRAINTS_INVALID [@ocaml.doc ""]
  | HOOK_EXECUTION_FAILURE [@ocaml.doc ""]
  | IAM_ROLE_MISSING [@ocaml.doc ""]
  | IAM_ROLE_PERMISSIONS [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
  | INVALID_ECS_SERVICE [@ocaml.doc ""]
  | INVALID_LAMBDA_CONFIGURATION [@ocaml.doc ""]
  | INVALID_LAMBDA_FUNCTION [@ocaml.doc ""]
  | INVALID_REVISION [@ocaml.doc ""]
  | MANUAL_STOP [@ocaml.doc ""]
  | MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION [@ocaml.doc ""]
  | MISSING_ELB_INFORMATION [@ocaml.doc ""]
  | MISSING_GITHUB_TOKEN [@ocaml.doc ""]
  | NO_EC2_SUBSCRIPTION [@ocaml.doc ""]
  | NO_INSTANCES [@ocaml.doc ""]
  | OVER_MAX_INSTANCES [@ocaml.doc ""]
  | RESOURCE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | REVISION_MISSING [@ocaml.doc ""]
  | THROTTLED [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | CLOUDFORMATION_STACK_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_information = {
  code : error_code option;
      [@ocaml.doc
        "For more information, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/error-codes.html}Error Codes \
         for CodeDeploy} in the \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide}CodeDeploy User Guide}.\n\n\
        \ The error code:\n\
        \ \n\
        \  {ul\n\
        \        {-  APPLICATION_MISSING: The application was missing. This error code is most \
         likely raised if the application is deleted after the deployment is created, but before \
         it is started.\n\
        \            \n\
        \             }\n\
        \        {-  DEPLOYMENT_GROUP_MISSING: The deployment group was missing. This error code \
         is most likely raised if the deployment group is deleted after the deployment is created, \
         but before it is started.\n\
        \            \n\
        \             }\n\
        \        {-  HEALTH_CONSTRAINTS: The deployment failed on too many instances to be \
         successfully deployed within the instance health constraints specified.\n\
        \            \n\
        \             }\n\
        \        {-  HEALTH_CONSTRAINTS_INVALID: The revision cannot be successfully deployed \
         within the instance health constraints specified.\n\
        \            \n\
        \             }\n\
        \        {-  IAM_ROLE_MISSING: The service role cannot be accessed.\n\
        \            \n\
        \             }\n\
        \        {-  IAM_ROLE_PERMISSIONS: The service role does not have the correct permissions.\n\
        \            \n\
        \             }\n\
        \        {-  INTERNAL_ERROR: There was an internal error.\n\
        \            \n\
        \             }\n\
        \        {-  NO_EC2_SUBSCRIPTION: The calling account is not subscribed to Amazon EC2.\n\
        \            \n\
        \             }\n\
        \        {-  NO_INSTANCES: No instances were specified, or no instances can be found.\n\
        \            \n\
        \             }\n\
        \        {-  OVER_MAX_INSTANCES: The maximum number of instances was exceeded.\n\
        \            \n\
        \             }\n\
        \        {-  THROTTLED: The operation was throttled because the calling account exceeded \
         the throttling limits of one or more Amazon Web Services services.\n\
        \            \n\
        \             }\n\
        \        {-  TIMEOUT: The deployment has timed out.\n\
        \            \n\
        \             }\n\
        \        {-  REVISION_MISSING: The revision ID was missing. This error code is most likely \
         raised if the revision is deleted after the deployment is created, but before it is \
         started.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  message : error_message option; [@ocaml.doc "An accompanying error message.\n"]
}
[@@ocaml.doc "Information about a deployment error.\n"]

type nonrec deployment_info = {
  application_name : application_name option; [@ocaml.doc "The application name.\n"]
  deployment_group_name : deployment_group_name option;
      [@ocaml.doc " The deployment group name. \n"]
  deployment_config_name : deployment_config_name option;
      [@ocaml.doc " The deployment configuration name. \n"]
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
  previous_revision : revision_location option;
      [@ocaml.doc
        "Information about the application revision that was deployed to the deployment group \
         before the most recent successful deployment.\n"]
  revision : revision_location option;
      [@ocaml.doc
        "Information about the location of stored application artifacts and the service from which \
         to retrieve them.\n"]
  status : deployment_status option;
      [@ocaml.doc "The current state of the deployment as a whole.\n"]
  error_information : error_information option;
      [@ocaml.doc "Information about any error associated with this deployment.\n"]
  create_time : timestamp option;
      [@ocaml.doc "A timestamp that indicates when the deployment was created.\n"]
  start_time : timestamp option;
      [@ocaml.doc
        "A timestamp that indicates when the deployment was deployed to the deployment group.\n\n\
        \ In some cases, the reported value of the start time might be later than the complete \
         time. This is due to differences in the clock settings of backend servers that \
         participate in the deployment process.\n\
        \ "]
  complete_time : timestamp option;
      [@ocaml.doc "A timestamp that indicates when the deployment was complete.\n"]
  deployment_overview : deployment_overview option;
      [@ocaml.doc "A summary of the deployment status of the instances in the deployment.\n"]
  description : description option; [@ocaml.doc "A comment about the deployment.\n"]
  creator : deployment_creator option;
      [@ocaml.doc
        "The means by which the deployment was created:\n\n\
        \ {ul\n\
        \       {-   [user]: A user created the deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [autoscaling]: Amazon EC2 Auto Scaling created the deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [codeDeployRollback]: A rollback process created the deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [CodeDeployAutoUpdate]: An auto-update process created the deployment when it \
         detected outdated Amazon EC2 instances.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ignore_application_stop_failures : boolean_ option;
      [@ocaml.doc
        " If true, then if an [ApplicationStop], [BeforeBlockTraffic], or [AfterBlockTraffic] \
         deployment lifecycle event to an instance fails, then the deployment continues to the \
         next deployment lifecycle event. For example, if [ApplicationStop] fails, the deployment \
         continues with DownloadBundle. If [BeforeBlockTraffic] fails, the deployment continues \
         with [BlockTraffic]. If [AfterBlockTraffic] fails, the deployment continues with \
         [ApplicationStop]. \n\n\
        \  If false or not specified, then if a lifecycle event fails during a deployment to an \
         instance, that deployment fails. If deployment to that instance is part of an overall \
         deployment and the number of healthy hosts is not less than the minimum number of healthy \
         hosts, then a deployment to the next instance is attempted. \n\
        \ \n\
        \   During a deployment, the CodeDeploy agent runs the scripts specified for \
         [ApplicationStop], [BeforeBlockTraffic], and [AfterBlockTraffic] in the AppSpec file from \
         the previous successful deployment. (All other scripts are run from the AppSpec file in \
         the current deployment.) If one of these scripts contains an error and does not run \
         successfully, the deployment can fail. \n\
        \  \n\
        \    If the cause of the failure is a script from the last successful deployment that will \
         never run successfully, create a new deployment and use [ignoreApplicationStopFailures] \
         to specify that the [ApplicationStop], [BeforeBlockTraffic], and [AfterBlockTraffic] \
         failures should be ignored. \n\
        \   "]
  auto_rollback_configuration : auto_rollback_configuration option;
      [@ocaml.doc
        "Information about the automatic rollback configuration associated with the deployment.\n"]
  update_outdated_instances_only : boolean_ option;
      [@ocaml.doc
        "Indicates whether only instances that are not running the latest application revision are \
         to be deployed to.\n"]
  rollback_info : rollback_info option; [@ocaml.doc "Information about a deployment rollback.\n"]
  deployment_style : deployment_style option;
      [@ocaml.doc
        "Information about the type of deployment, either in-place or blue/green, you want to run \
         and whether to route deployment traffic behind a load balancer.\n"]
  target_instances : target_instances option;
      [@ocaml.doc
        "Information about the instances that belong to the replacement environment in a \
         blue/green deployment.\n"]
  instance_termination_wait_time_started : boolean_ option;
      [@ocaml.doc
        "Indicates whether the wait period set for the termination of instances in the original \
         environment has started. Status is 'false' if the KEEP_ALIVE option is specified. \
         Otherwise, 'true' as soon as the termination wait period starts.\n"]
  blue_green_deployment_configuration : blue_green_deployment_configuration option;
      [@ocaml.doc "Information about blue/green deployment options for this deployment.\n"]
  load_balancer_info : load_balancer_info option;
      [@ocaml.doc "Information about the load balancer used in the deployment.\n"]
  additional_deployment_status_info : additional_deployment_status_info option;
      [@ocaml.doc
        "Provides information about the results of a deployment, such as whether instances in the \
         original environment in a blue/green deployment were not terminated.\n"]
  file_exists_behavior : file_exists_behavior option;
      [@ocaml.doc
        "Information about how CodeDeploy handles files that already exist in a deployment target \
         location but weren't part of the previous successful deployment.\n\n\
        \ {ul\n\
        \       {-   [DISALLOW]: The deployment fails. This is also the default behavior if no \
         option is specified.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERWRITE]: The version of the file from the application revision currently \
         being deployed replaces the version already on the instance.\n\
        \           \n\
        \            }\n\
        \       {-   [RETAIN]: The version of the file already on the instance is kept and used as \
         part of the new deployment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  deployment_status_messages : deployment_status_message_list option;
      [@ocaml.doc "Messages that contain information about the status of a deployment.\n"]
  compute_platform : compute_platform option;
      [@ocaml.doc
        "The destination platform type for the deployment ([Lambda], [Server], or [ECS]).\n"]
  external_id : external_id option;
      [@ocaml.doc
        "The unique ID for an external resource (for example, a CloudFormation stack ID) that is \
         linked to this deployment.\n"]
  related_deployments : related_deployments option; [@ocaml.doc ""]
  override_alarm_configuration : alarm_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc "Information about a deployment.\n"]

type nonrec deployments_info_list = deployment_info list [@@ocaml.doc ""]

type nonrec batch_get_deployments_output = {
  deployments_info : deployments_info_list option;
      [@ocaml.doc " Information about the deployments. \n"]
}
[@@ocaml.doc " Represents the output of a [BatchGetDeployments] operation. \n"]

type nonrec batch_get_deployments_input = {
  deployment_ids : deployments_list;
      [@ocaml.doc
        " A list of deployment IDs, separated by spaces. The maximum number of deployment IDs you \
         can specify is 25.\n"]
}
[@@ocaml.doc " Represents the input of a [BatchGetDeployments] operation. \n"]

type nonrec instance_arn = string [@@ocaml.doc ""]

type nonrec iam_user_arn = string [@@ocaml.doc ""]

type nonrec iam_session_arn = string [@@ocaml.doc ""]

type nonrec instance_info = {
  instance_name : instance_name option; [@ocaml.doc "The name of the on-premises instance.\n"]
  iam_session_arn : iam_session_arn option;
      [@ocaml.doc "The ARN of the IAM session associated with the on-premises instance.\n"]
  iam_user_arn : iam_user_arn option;
      [@ocaml.doc "The user ARN associated with the on-premises instance.\n"]
  instance_arn : instance_arn option; [@ocaml.doc "The ARN of the on-premises instance.\n"]
  register_time : timestamp option;
      [@ocaml.doc "The time at which the on-premises instance was registered.\n"]
  deregister_time : timestamp option;
      [@ocaml.doc
        "If the on-premises instance was deregistered, the time at which the on-premises instance \
         was deregistered.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags currently associated with the on-premises instance.\n"]
}
[@@ocaml.doc "Information about an on-premises instance.\n"]

type nonrec instance_info_list = instance_info list [@@ocaml.doc ""]

type nonrec batch_get_on_premises_instances_output = {
  instance_infos : instance_info_list option;
      [@ocaml.doc "Information about the on-premises instances.\n"]
}
[@@ocaml.doc "Represents the output of a [BatchGetOnPremisesInstances] operation.\n"]

type nonrec batch_get_on_premises_instances_input = {
  instance_names : instance_name_list;
      [@ocaml.doc
        "The names of the on-premises instances about which to get information. The maximum number \
         of instance names you can specify is 25.\n"]
}
[@@ocaml.doc "Represents the input of a [BatchGetOnPremisesInstances] operation.\n"]

type nonrec bucket_name_filter_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "A bucket name is required, but was not provided.\n"]

type nonrec trigger_targets_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The maximum allowed number of triggers was exceeded.\n"]

type nonrec throttling_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "An API function was called too frequently.\n"]

type nonrec tag_set_list_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The number of tag groups included in the tag set list exceeded the maximum allowed limit of 3.\n"]

type nonrec lifecycle_hook_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The limit for lifecycle hooks was exceeded.\n"]

type nonrec invalid_trigger_config_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The trigger was specified in an invalid format.\n"]

type nonrec invalid_traffic_routing_configuration_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  " The configuration that specifies how traffic is routed during a deployment is invalid.\n"]

type nonrec invalid_target_group_pair_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " A target group pair associated with this deployment is not valid. \n"]

type nonrec invalid_role_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The service role ARN was specified in an invalid format. Or, if an Auto Scaling group was \
   specified, the specified service role does not grant the appropriate permissions to Amazon EC2 \
   Auto Scaling.\n"]

type nonrec invalid_on_premises_tag_combination_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "A call was submitted that specified both OnPremisesTagFilters and OnPremisesTagSet, but only \
   one of these data types can be used in a single call.\n"]

type nonrec invalid_load_balancer_info_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "An invalid load balancer name, or no load balancer name, was specified.\n"]

type nonrec invalid_input_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The input was specified in an invalid format.\n"]

type nonrec invalid_ecs_service_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The Amazon ECS service identifier is not valid. \n"]

type nonrec invalid_ec2_tag_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The tag was specified in an invalid format.\n"]

type nonrec invalid_ec2_tag_combination_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "A call was submitted that specified both Ec2TagFilters and Ec2TagSet, but only one of these \
   data types can be used in a single call.\n"]

type nonrec invalid_deployment_style_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "An invalid deployment style was specified. Valid deployment types include \"IN_PLACE\" and \
   \"BLUE_GREEN.\" Valid deployment options include \"WITH_TRAFFIC_CONTROL\" and \
   \"WITHOUT_TRAFFIC_CONTROL.\"\n"]

type nonrec invalid_deployment_config_name_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment configuration name was specified in an invalid format.\n"]

type nonrec invalid_blue_green_deployment_configuration_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The configuration for the blue/green deployment group was provided in an invalid format. For \
   information about deployment configuration format, see [CreateDeploymentConfig].\n"]

type nonrec invalid_auto_scaling_group_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The Auto Scaling group was specified in an invalid format or does not exist.\n"]

type nonrec invalid_auto_rollback_config_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The automatic rollback configuration was specified in an invalid format. For example, automatic \
   rollback is enabled, but an invalid triggering event type or no event types were listed.\n"]

type nonrec invalid_alarm_config_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The format of the alarm configuration is invalid. Possible causes include:\n\n\
  \ {ul\n\
  \       {-  The alarm list is null.\n\
  \           \n\
  \            }\n\
  \       {-  The alarm object is null.\n\
  \           \n\
  \            }\n\
  \       {-  The alarm name is empty or null or exceeds the limit of 255 characters.\n\
  \           \n\
  \            }\n\
  \       {-  Two alarms with the same name have been specified.\n\
  \           \n\
  \            }\n\
  \       {-  The alarm configuration is enabled, but the alarm list is empty.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec ecs_service_mapping_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  " The Amazon ECS service is associated with more than one deployment groups. An Amazon ECS \
   service can be associated with only one deployment group. \n"]

type nonrec deployment_group_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The named deployment group with the user or Amazon Web Services account does not exist.\n"]

type nonrec deployment_group_already_exists_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "A deployment group with the specified name with the user or Amazon Web Services account already \
   exists.\n"]

type nonrec update_deployment_group_output = {
  hooks_not_cleaned_up : auto_scaling_group_list option;
      [@ocaml.doc
        "If the output contains no data, and the corresponding deployment group contained at least \
         one Auto Scaling group, CodeDeploy successfully removed all corresponding Auto Scaling \
         lifecycle event hooks from the Amazon Web Services account. If the output contains data, \
         CodeDeploy could not remove some Auto Scaling lifecycle event hooks from the Amazon Web \
         Services account.\n"]
}
[@@ocaml.doc "Represents the output of an [UpdateDeploymentGroup] operation.\n"]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec update_deployment_group_input = {
  application_name : application_name;
      [@ocaml.doc "The application name that corresponds to the deployment group to update.\n"]
  current_deployment_group_name : deployment_group_name;
      [@ocaml.doc "The current name of the deployment group.\n"]
  new_deployment_group_name : deployment_group_name option;
      [@ocaml.doc "The new name of the deployment group, if you want to change it.\n"]
  deployment_config_name : deployment_config_name option;
      [@ocaml.doc
        "The replacement deployment configuration name to use, if you want to change it.\n"]
  ec2_tag_filters : ec2_tag_filter_list option;
      [@ocaml.doc
        "The replacement set of Amazon EC2 tags on which to filter, if you want to change them. To \
         keep the existing tags, enter their names. To remove tags, do not enter any tag names.\n"]
  on_premises_instance_tag_filters : tag_filter_list option;
      [@ocaml.doc
        "The replacement set of on-premises instance tags on which to filter, if you want to \
         change them. To keep the existing tags, enter their names. To remove tags, do not enter \
         any tag names.\n"]
  auto_scaling_groups : auto_scaling_group_name_list option;
      [@ocaml.doc
        "The replacement list of Auto Scaling groups to be included in the deployment group, if \
         you want to change them.\n\n\
        \ {ul\n\
        \       {-  To keep the Auto Scaling groups, enter their names or do not specify this \
         parameter. \n\
        \           \n\
        \            }\n\
        \       {-  To remove Auto Scaling groups, specify a non-null empty list of Auto Scaling \
         group names to detach all CodeDeploy-managed Auto Scaling lifecycle hooks. For examples, \
         see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/troubleshooting-auto-scaling.html#troubleshooting-auto-scaling-heartbeat}Amazon \
         EC2 instances in an Amazon EC2 Auto Scaling group fail to launch and receive the error \
         \"Heartbeat Timeout\"} in the {i CodeDeploy User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_role_arn : role option;
      [@ocaml.doc "A replacement ARN for the service role, if you want to change it.\n"]
  trigger_configurations : trigger_config_list option;
      [@ocaml.doc
        "Information about triggers to change when the deployment group is updated. For examples, \
         see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-edit.html}Edit a \
         Trigger in a CodeDeploy Deployment Group} in the {i CodeDeploy User Guide}.\n"]
  alarm_configuration : alarm_configuration option;
      [@ocaml.doc
        "Information to add or change about Amazon CloudWatch alarms when the deployment group is \
         updated.\n"]
  auto_rollback_configuration : auto_rollback_configuration option;
      [@ocaml.doc
        "Information for an automatic rollback configuration that is added or changed when a \
         deployment group is updated.\n"]
  outdated_instances_strategy : outdated_instances_strategy option;
      [@ocaml.doc
        "Indicates what happens when new Amazon EC2 instances are launched mid-deployment and do \
         not receive the deployed application revision.\n\n\
        \ If this option is set to [UPDATE] or is unspecified, CodeDeploy initiates one or more \
         'auto-update outdated instances' deployments to apply the deployed application revision \
         to the new Amazon EC2 instances.\n\
        \ \n\
        \  If this option is set to [IGNORE], CodeDeploy does not initiate a deployment to update \
         the new Amazon EC2 instances. This may result in instances having different revisions.\n\
        \  "]
  deployment_style : deployment_style option;
      [@ocaml.doc
        "Information about the type of deployment, either in-place or blue/green, you want to run \
         and whether to route deployment traffic behind a load balancer.\n"]
  blue_green_deployment_configuration : blue_green_deployment_configuration option;
      [@ocaml.doc "Information about blue/green deployment options for a deployment group.\n"]
  load_balancer_info : load_balancer_info option;
      [@ocaml.doc "Information about the load balancer used in a deployment.\n"]
  ec2_tag_set : ec2_tag_set option;
      [@ocaml.doc
        "Information about groups of tags applied to on-premises instances. The deployment group \
         includes only Amazon EC2 instances identified by all the tag groups.\n"]
  ecs_services : ecs_service_list option;
      [@ocaml.doc
        " The target Amazon ECS services in the deployment group. This applies only to deployment \
         groups that use the Amazon ECS compute platform. A target Amazon ECS service is specified \
         as an Amazon ECS cluster and service name pair using the format \n\
         {[\n\
         :\n\
         ]}\n\
         . \n"]
  on_premises_tag_set : on_premises_tag_set option;
      [@ocaml.doc
        "Information about an on-premises instance tag set. The deployment group includes only \
         on-premises instances identified by all the tag groups.\n"]
  termination_hook_enabled : nullable_boolean option;
      [@ocaml.doc
        "This parameter only applies if you are using CodeDeploy with Amazon EC2 Auto Scaling. For \
         more information, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html}Integrating \
         CodeDeploy with Amazon EC2 Auto Scaling} in the {i CodeDeploy User Guide}.\n\n\
        \ Set [terminationHookEnabled] to [true] to have CodeDeploy install a termination hook \
         into your Auto Scaling group when you update a deployment group. When this hook is \
         installed, CodeDeploy will perform termination deployments.\n\
        \ \n\
        \  For information about termination deployments, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors-hook-enable}Enabling \
         termination deployments during Auto Scaling scale-in events} in the {i CodeDeploy User \
         Guide}.\n\
        \  \n\
        \   For more information about Auto Scaling scale-in events, see the \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-lifecycle.html#as-lifecycle-scale-in}Scale \
         in} topic in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \   "]
}
[@@ocaml.doc "Represents the input of an [UpdateDeploymentGroup] operation.\n"]

type nonrec update_application_input = {
  application_name : application_name option;
      [@ocaml.doc "The current name of the application you want to change.\n"]
  new_application_name : application_name option;
      [@ocaml.doc "The new name to give the application.\n"]
}
[@@ocaml.doc "Represents the input of an [UpdateApplication] operation.\n"]

type nonrec resource_arn_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The ARN of a resource is required, but was not found. \n"]

type nonrec invalid_tags_to_add_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The specified tags are not valid. \n"]

type nonrec invalid_arn_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The specified ARN is not in a valid format. \n"]

type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_key_list = key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that specifies from which resource to disassociate the \
         tags with the keys in the [TagKeys] input parameter. \n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        " A list of keys of [Tag] objects. The [Tag] objects identified by the keys are \
         disassociated from the resource specified by the [ResourceArn] input parameter. \n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        " The ARN of a resource, such as a CodeDeploy application or deployment group. \n"]
  tags : tag_list;
      [@ocaml.doc
        " A list of tags that [TagResource] associates with a resource. The resource is identified \
         by the [ResourceArn] input parameter. \n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_action_for_deployment_type_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "A call was submitted that is not supported for the specified deployment type.\n"]

type nonrec deployment_already_completed_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment is already complete.\n"]

type nonrec stop_status = PENDING [@ocaml.doc ""] | SUCCEEDED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec stop_deployment_output = {
  status : stop_status option;
      [@ocaml.doc
        "The status of the stop deployment operation:\n\n\
        \ {ul\n\
        \       {-  Pending: The stop operation is pending.\n\
        \           \n\
        \            }\n\
        \       {-  Succeeded: The stop operation was successful.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_message : message option; [@ocaml.doc "An accompanying status message.\n"]
}
[@@ocaml.doc " Represents the output of a [StopDeployment] operation. \n"]

type nonrec stop_deployment_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  auto_rollback_enabled : nullable_boolean option;
      [@ocaml.doc
        " Indicates, when a deployment is stopped, whether instances that have been updated should \
         be rolled back to the previous version of the application revision. \n"]
}
[@@ocaml.doc " Represents the input of a [StopDeployment] operation. \n"]

type nonrec skip_wait_time_for_instance_termination_input = {
  deployment_id : deployment_id option;
      [@ocaml.doc
        " The unique ID of a blue/green deployment for which you want to skip the instance \
         termination wait time. \n"]
}
[@@ocaml.doc ""]

type nonrec remove_tags_from_on_premises_instances_input = {
  tags : tag_list;
      [@ocaml.doc "The tag key-value pairs to remove from the on-premises instances.\n"]
  instance_names : instance_name_list;
      [@ocaml.doc "The names of the on-premises instances from which to remove tags.\n"]
}
[@@ocaml.doc "Represents the input of a [RemoveTagsFromOnPremisesInstances] operation.\n"]

type nonrec multiple_iam_arns_provided_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "Both an user ARN and an IAM session ARN were included in the request. Use only one ARN type.\n"]

type nonrec invalid_iam_user_arn_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The user ARN was specified in an invalid format.\n"]

type nonrec invalid_iam_session_arn_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The IAM session ARN was specified in an invalid format.\n"]

type nonrec instance_name_already_registered_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified on-premises instance name is already registered.\n"]

type nonrec iam_user_arn_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "An user ARN was not specified.\n"]

type nonrec iam_user_arn_already_registered_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified user ARN is already registered with an on-premises instance.\n"]

type nonrec iam_session_arn_already_registered_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The request included an IAM session ARN that has already been used to register a different \
   instance.\n"]

type nonrec iam_arn_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "No IAM ARN was included in the request. You must use an IAM session ARN or user ARN in the \
   request.\n"]

type nonrec register_on_premises_instance_input = {
  instance_name : instance_name; [@ocaml.doc "The name of the on-premises instance to register.\n"]
  iam_session_arn : iam_session_arn option;
      [@ocaml.doc "The ARN of the IAM session to associate with the on-premises instance.\n"]
  iam_user_arn : iam_user_arn option;
      [@ocaml.doc "The ARN of the user to associate with the on-premises instance.\n"]
}
[@@ocaml.doc "Represents the input of the register on-premises instance operation.\n"]

type nonrec description_too_long_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The description is too long.\n"]

type nonrec register_application_revision_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
  description : description option; [@ocaml.doc "A comment about the revision.\n"]
  revision : revision_location;
      [@ocaml.doc
        "Information about the application revision to register, including type and location.\n"]
}
[@@ocaml.doc "Represents the input of a RegisterApplicationRevision operation.\n"]

type nonrec lifecycle_event_already_completed_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "An attempt to return the status of an already completed lifecycle event occurred.\n"]

type nonrec invalid_lifecycle_event_hook_execution_status_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The result of a Lambda validation function that verifies a lifecycle event is invalid. It \
   should return [Succeeded] or [Failed].\n"]

type nonrec invalid_lifecycle_event_hook_execution_id_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "A lifecycle event hook is invalid. Review the [hooks] section in your AppSpec file to ensure \
   the lifecycle events and [hooks] functions are valid.\n"]

type nonrec lifecycle_event_hook_execution_id = string [@@ocaml.doc ""]

type nonrec put_lifecycle_event_hook_execution_status_output = {
  lifecycle_event_hook_execution_id : lifecycle_event_hook_execution_id option;
      [@ocaml.doc
        "The execution ID of the lifecycle event hook. A hook is specified in the [hooks] section \
         of the deployment's AppSpec file.\n"]
}
[@@ocaml.doc ""]

type nonrec put_lifecycle_event_hook_execution_status_input = {
  deployment_id : deployment_id option;
      [@ocaml.doc
        " The unique ID of a deployment. Pass this ID to a Lambda function that validates a \
         deployment lifecycle event. \n"]
  lifecycle_event_hook_execution_id : lifecycle_event_hook_execution_id option;
      [@ocaml.doc
        " The execution ID of a deployment's lifecycle hook. A deployment lifecycle hook is \
         specified in the [hooks] section of the AppSpec file. \n"]
  status : lifecycle_event_status option;
      [@ocaml.doc
        "The result of a Lambda function that validates a deployment lifecycle event. The values \
         listed in {b Valid Values} are valid for lifecycle statuses in general; however, only \
         [Succeeded] and [Failed] can be passed successfully in your API call.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  tags : tag_list option;
      [@ocaml.doc
        " A list of tags returned by [ListTagsForResource]. The tags are associated with the \
         resource identified by the input [ResourceArn] parameter. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list application revisions call to return the next set of \
         application revisions in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        " The ARN of a CodeDeploy resource. [ListTagsForResource] returns all the tags associated \
         with the resource that is identified by the [ResourceArn]. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous [ListTagsForResource] call. It can be used to \
         return the next set of applications in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_tag_filter_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The tag filter was specified in an invalid format.\n"]

type nonrec invalid_registration_status_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The registration status was specified in an invalid format.\n"]

type nonrec invalid_next_token_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The next token was specified in an invalid format.\n"]

type nonrec list_on_premises_instances_output = {
  instance_names : instance_name_list option;
      [@ocaml.doc "The list of matching on-premises instance names.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list on-premises instances call to return the next set of \
         on-premises instances in the list.\n"]
}
[@@ocaml.doc "Represents the output of the list on-premises instances operation.\n"]

type nonrec registration_status = Registered [@ocaml.doc ""] | Deregistered [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_on_premises_instances_input = {
  registration_status : registration_status option;
      [@ocaml.doc
        "The registration status of the on-premises instances:\n\n\
        \ {ul\n\
        \       {-   [Deregistered]: Include deregistered on-premises instances in the resulting \
         list.\n\
        \           \n\
        \            }\n\
        \       {-   [Registered]: Include registered on-premises instances in the resulting list.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tag_filters : tag_filter_list option;
      [@ocaml.doc
        "The on-premises instance tags that are used to restrict the on-premises instance names \
         returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous list on-premises instances call. It can be used \
         to return the next set of on-premises instances in the list.\n"]
}
[@@ocaml.doc "Represents the input of a [ListOnPremisesInstances] operation.\n"]

type nonrec resource_validation_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified resource could not be validated.\n"]

type nonrec operation_not_supported_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The API used does not support the deployment.\n"]

type nonrec git_hub_account_token_name_list = git_hub_account_token_name list [@@ocaml.doc ""]

type nonrec list_git_hub_account_token_names_output = {
  token_name_list : git_hub_account_token_name_list option;
      [@ocaml.doc "A list of names of connections to GitHub accounts.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent [ListGitHubAccountTokenNames] call to return the next set of names \
         in the list. \n"]
}
[@@ocaml.doc "Represents the output of a [ListGitHubAccountTokenNames] operation.\n"]

type nonrec list_git_hub_account_token_names_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous [ListGitHubAccountTokenNames] call. It can be \
         used to return the next set of names in the list. \n"]
}
[@@ocaml.doc "Represents the input of a [ListGitHubAccountTokenNames] operation.\n"]

type nonrec invalid_target_filter_name_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The target filter name is invalid. \n"]

type nonrec invalid_instance_type_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "An invalid instance type was specified for instances in a blue/green deployment. Valid values \
   include \"Blue\" for an original environment and \"Green\" for a replacement environment.\n"]

type nonrec invalid_instance_status_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified instance status does not exist.\n"]

type nonrec invalid_deployment_instance_type_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "An instance type was specified for an in-place deployment. Instance types are supported for \
   blue/green deployments only.\n"]

type nonrec list_deployment_targets_output = {
  target_ids : target_id_list option; [@ocaml.doc " The unique IDs of deployment targets. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " If a large amount of information is returned, a token identifier is also returned. It \
         can be used in a subsequent [ListDeploymentTargets] call to return the next set of \
         deployment targets in the list. \n"]
}
[@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_value_list = filter_value list [@@ocaml.doc ""]

type nonrec target_filter_name =
  | TARGET_STATUS [@ocaml.doc ""]
  | SERVER_INSTANCE_LABEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_filters = (target_filter_name * filter_value_list) list [@@ocaml.doc ""]

type nonrec list_deployment_targets_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " A token identifier returned from the previous [ListDeploymentTargets] call. It can be \
         used to return the next set of deployment targets in the list. \n"]
  target_filters : target_filters option;
      [@ocaml.doc
        " A key used to filter the returned targets. The two valid values are:\n\n\
        \ {ul\n\
        \       {-   [TargetStatus] - A [TargetStatus] filter string can be [Failed], \
         [InProgress], [Pending], [Ready], [Skipped], [Succeeded], or [Unknown]. \n\
        \           \n\
        \            }\n\
        \       {-   [ServerInstanceLabel] - A [ServerInstanceLabel] filter string can be [Blue] \
         or [Green]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_time_range_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified time range was specified in an invalid format.\n"]

type nonrec invalid_external_id_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The external ID was specified in an invalid format.\n"]

type nonrec invalid_deployment_status_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified deployment status doesn't exist or cannot be determined.\n"]

type nonrec list_deployments_output = {
  deployments : deployments_list option; [@ocaml.doc "A list of deployment IDs.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list deployments call to return the next set of deployments in the \
         list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListDeployments] operation.\n"]

type nonrec time_range = {
  start : timestamp option;
      [@ocaml.doc
        "The start time of the time range.\n\n\
        \  Specify null to leave the start time open-ended.\n\
        \  \n\
        \   "]
  end_ : timestamp option;
      [@ocaml.doc
        "The end time of the time range.\n\n\
        \  Specify null to leave the end time open-ended.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Information about a time range.\n"]

type nonrec deployment_status_list = deployment_status list [@@ocaml.doc ""]

type nonrec list_deployments_input = {
  application_name : application_name option;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n\n\
        \  If [applicationName] is specified, then [deploymentGroupName] must be specified. If it \
         is not specified, then [deploymentGroupName] must not be specified. \n\
        \  \n\
        \   "]
  deployment_group_name : deployment_group_name option;
      [@ocaml.doc
        "The name of a deployment group for the specified application.\n\n\
        \  If [deploymentGroupName] is specified, then [applicationName] must be specified. If it \
         is not specified, then [applicationName] must not be specified. \n\
        \  \n\
        \   "]
  external_id : external_id option;
      [@ocaml.doc
        "The unique ID of an external resource for returning deployments linked to the external \
         resource.\n"]
  include_only_statuses : deployment_status_list option;
      [@ocaml.doc
        "A subset of deployments to list by status:\n\n\
        \ {ul\n\
        \       {-   [Created]: Include created deployments in the resulting list.\n\
        \           \n\
        \            }\n\
        \       {-   [Queued]: Include queued deployments in the resulting list.\n\
        \           \n\
        \            }\n\
        \       {-   [In Progress]: Include in-progress deployments in the resulting list.\n\
        \           \n\
        \            }\n\
        \       {-   [Succeeded]: Include successful deployments in the resulting list.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed]: Include failed deployments in the resulting list.\n\
        \           \n\
        \            }\n\
        \       {-   [Stopped]: Include stopped deployments in the resulting list.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  create_time_range : time_range option;
      [@ocaml.doc
        "A time range (start and end) for returning a subset of the list of deployments.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous list deployments call. It can be used to return \
         the next set of deployments in the list.\n"]
}
[@@ocaml.doc "Represents the input of a [ListDeployments] operation.\n"]

type nonrec list_deployment_instances_output = {
  instances_list : instances_list option; [@ocaml.doc "A list of instance IDs.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list deployment instances call to return the next set of deployment \
         instances in the list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListDeploymentInstances] operation.\n"]

type nonrec instance_type_list = instance_type list [@@ocaml.doc ""]

type nonrec instance_status_list = instance_status list [@@ocaml.doc ""]

type nonrec list_deployment_instances_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous list deployment instances call. It can be used \
         to return the next set of deployment instances in the list.\n"]
  instance_status_filter : instance_status_list option;
      [@ocaml.doc
        "A subset of instances to list by status:\n\n\
        \ {ul\n\
        \       {-   [Pending]: Include those instances with pending deployments.\n\
        \           \n\
        \            }\n\
        \       {-   [InProgress]: Include those instances where deployments are still in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [Succeeded]: Include those instances with successful deployments.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed]: Include those instances with failed deployments.\n\
        \           \n\
        \            }\n\
        \       {-   [Skipped]: Include those instances with skipped deployments.\n\
        \           \n\
        \            }\n\
        \       {-   [Unknown]: Include those instances with deployments in an unknown state.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  instance_type_filter : instance_type_list option;
      [@ocaml.doc
        "The set of instances in a blue/green deployment, either those in the original environment \
         (\"BLUE\") or those in the replacement environment (\"GREEN\"), for which you want to \
         view instance information.\n"]
}
[@@ocaml.doc " Represents the input of a [ListDeploymentInstances] operation. \n"]

type nonrec list_deployment_groups_output = {
  application_name : application_name option; [@ocaml.doc "The application name.\n"]
  deployment_groups : deployment_groups_list option;
      [@ocaml.doc "A list of deployment group names.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list deployment groups call to return the next set of deployment \
         groups in the list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListDeploymentGroups] operation.\n"]

type nonrec list_deployment_groups_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous list deployment groups call. It can be used to \
         return the next set of deployment groups in the list.\n"]
}
[@@ocaml.doc "Represents the input of a [ListDeploymentGroups] operation.\n"]

type nonrec deployment_configs_list = deployment_config_name list [@@ocaml.doc ""]

type nonrec list_deployment_configs_output = {
  deployment_configs_list : deployment_configs_list option;
      [@ocaml.doc
        "A list of deployment configurations, including built-in configurations such as \
         [CodeDeployDefault.OneAtATime].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list deployment configurations call to return the next set of \
         deployment configurations in the list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListDeploymentConfigs] operation.\n"]

type nonrec list_deployment_configs_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous [ListDeploymentConfigs] call. It can be used to \
         return the next set of deployment configurations in the list. \n"]
}
[@@ocaml.doc "Represents the input of a [ListDeploymentConfigs] operation.\n"]

type nonrec list_applications_output = {
  applications : applications_list option; [@ocaml.doc "A list of application names.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list applications call to return the next set of applications in the \
         list.\n"]
}
[@@ocaml.doc "Represents the output of a ListApplications operation.\n"]

type nonrec list_applications_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous list applications call. It can be used to return \
         the next set of applications in the list.\n"]
}
[@@ocaml.doc "Represents the input of a [ListApplications] operation.\n"]

type nonrec invalid_sort_order_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The sort order was specified in an invalid format.\n"]

type nonrec invalid_sort_by_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The column name to sort by is either not present or was specified in an invalid format.\n"]

type nonrec invalid_key_prefix_filter_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The specified key prefix filter was specified in an invalid format.\n"]

type nonrec invalid_deployed_state_filter_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployed state filter was specified in an invalid format.\n"]

type nonrec invalid_bucket_name_filter_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The bucket name either doesn't exist or was specified in an invalid format.\n"]

type nonrec list_application_revisions_output = {
  revisions : revision_location_list option;
      [@ocaml.doc "A list of locations that contain the matching revisions.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a large amount of information is returned, an identifier is also returned. It can be \
         used in a subsequent list application revisions call to return the next set of \
         application revisions in the list.\n"]
}
[@@ocaml.doc "Represents the output of a [ListApplicationRevisions] operation.\n"]

type nonrec list_state_filter_action =
  | Include [@ocaml.doc ""]
  | Exclude [@ocaml.doc ""]
  | Ignore [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_order = Ascending [@ocaml.doc ""] | Descending [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_application_revisions_input = {
  application_name : application_name;
      [@ocaml.doc
        " The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account. \n"]
  sort_by : application_revision_sort_by option;
      [@ocaml.doc
        "The column name to use to sort the list results:\n\n\
        \ {ul\n\
        \       {-   [registerTime]: Sort by the time the revisions were registered with CodeDeploy.\n\
        \           \n\
        \            }\n\
        \       {-   [firstUsedTime]: Sort by the time the revisions were first used in a \
         deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [lastUsedTime]: Sort by the time the revisions were last used in a deployment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If not specified or set to null, the results are returned in an arbitrary order. \n\
        \   "]
  sort_order : sort_order option;
      [@ocaml.doc
        " The order in which to sort the list results: \n\n\
        \ {ul\n\
        \       {-   [ascending]: ascending order.\n\
        \           \n\
        \            }\n\
        \       {-   [descending]: descending order.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If not specified, the results are sorted in ascending order.\n\
        \   \n\
        \    If set to null, the results are sorted in an arbitrary order.\n\
        \    "]
  s3_bucket : s3_bucket option;
      [@ocaml.doc
        " An Amazon S3 bucket name to limit the search for revisions. \n\n\
        \  If set to null, all of the user's buckets are searched. \n\
        \ "]
  s3_key_prefix : s3_key option;
      [@ocaml.doc
        " A key prefix for the set of Amazon S3 objects to limit the search for revisions. \n"]
  deployed : list_state_filter_action option;
      [@ocaml.doc
        " Whether to list revisions based on whether the revision is the target revision of a \
         deployment group: \n\n\
        \ {ul\n\
        \       {-   [include]: List revisions that are target revisions of a deployment group.\n\
        \           \n\
        \            }\n\
        \       {-   [exclude]: Do not list revisions that are target revisions of a deployment \
         group.\n\
        \           \n\
        \            }\n\
        \       {-   [ignore]: List all revisions.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "An identifier returned from the previous [ListApplicationRevisions] call. It can be used \
         to return the next set of applications in the list.\n"]
}
[@@ocaml.doc " Represents the input of a [ListApplicationRevisions] operation. \n"]

type nonrec get_on_premises_instance_output = {
  instance_info : instance_info option;
      [@ocaml.doc " Information about the on-premises instance. \n"]
}
[@@ocaml.doc " Represents the output of a [GetOnPremisesInstance] operation. \n"]

type nonrec get_on_premises_instance_input = {
  instance_name : instance_name;
      [@ocaml.doc " The name of the on-premises instance about which to get information. \n"]
}
[@@ocaml.doc " Represents the input of a [GetOnPremisesInstance] operation. \n"]

type nonrec get_deployment_target_output = {
  deployment_target : deployment_target option;
      [@ocaml.doc
        " A deployment target that contains information about a deployment such as its status, \
         lifecycle events, and when it was last updated. It also contains metadata about the \
         deployment target. The deployment target metadata depends on the deployment target's type \
         ([instanceTarget], [lambdaTarget], or [ecsTarget]). \n"]
}
[@@ocaml.doc ""]

type nonrec get_deployment_target_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  target_id : target_id; [@ocaml.doc " The unique ID of a deployment target. \n"]
}
[@@ocaml.doc ""]

type nonrec get_deployment_instance_output = {
  instance_summary : instance_summary option; [@ocaml.doc " Information about the instance. \n"]
}
[@@ocaml.doc " Represents the output of a [GetDeploymentInstance] operation. \n"]

type nonrec get_deployment_instance_input = {
  deployment_id : deployment_id; [@ocaml.doc " The unique ID of a deployment. \n"]
  instance_id : instance_id; [@ocaml.doc " The unique ID of an instance in the deployment group. \n"]
}
[@@ocaml.doc " Represents the input of a [GetDeploymentInstance] operation. \n"]

type nonrec get_deployment_group_output = {
  deployment_group_info : deployment_group_info option;
      [@ocaml.doc "Information about the deployment group.\n"]
}
[@@ocaml.doc "Represents the output of a [GetDeploymentGroup] operation.\n"]

type nonrec get_deployment_group_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
  deployment_group_name : deployment_group_name;
      [@ocaml.doc "The name of a deployment group for the specified application.\n"]
}
[@@ocaml.doc "Represents the input of a [GetDeploymentGroup] operation.\n"]

type nonrec deployment_config_name_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment configuration name was not specified.\n"]

type nonrec minimum_healthy_hosts_per_zone_value = int [@@ocaml.doc ""]

type nonrec minimum_healthy_hosts_per_zone_type =
  | HOST_COUNT [@ocaml.doc ""]
  | FLEET_PERCENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec minimum_healthy_hosts_per_zone = {
  type_ : minimum_healthy_hosts_per_zone_type option;
      [@ocaml.doc "The [type] associated with the [MinimumHealthyHostsPerZone] option.\n"]
  value : minimum_healthy_hosts_per_zone_value option;
      [@ocaml.doc "The [value] associated with the [MinimumHealthyHostsPerZone] option.\n"]
}
[@@ocaml.doc "Information about the minimum number of healthy instances per Availability Zone.\n"]

type nonrec wait_time_in_seconds = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec zonal_config = {
  first_zone_monitor_duration_in_seconds : wait_time_in_seconds option;
      [@ocaml.doc
        "The period of time, in seconds, that CodeDeploy must wait after completing a deployment \
         to the {i first} Availability Zone. CodeDeploy will wait this amount of time before \
         starting a deployment to the second Availability Zone. You might set this option if you \
         want to allow extra bake time for the first Availability Zone. If you don't specify a \
         value for [firstZoneMonitorDurationInSeconds], then CodeDeploy uses the \
         [monitorDurationInSeconds] value for the first Availability Zone.\n\n\
        \ For more information about the zonal configuration feature, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config}zonal \
         configuration} in the {i CodeDeploy User Guide}.\n\
        \ "]
  monitor_duration_in_seconds : wait_time_in_seconds option;
      [@ocaml.doc
        "The period of time, in seconds, that CodeDeploy must wait after completing a deployment \
         to an Availability Zone. CodeDeploy will wait this amount of time before starting a \
         deployment to the next Availability Zone. Consider adding a monitor duration to give the \
         deployment some time to prove itself (or 'bake') in one Availability Zone before it is \
         released in the next zone. If you don't specify a [monitorDurationInSeconds], CodeDeploy \
         starts deploying to the next Availability Zone immediately.\n\n\
        \ For more information about the zonal configuration feature, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config}zonal \
         configuration} in the {i CodeDeploy User Guide}.\n\
        \ "]
  minimum_healthy_hosts_per_zone : minimum_healthy_hosts_per_zone option;
      [@ocaml.doc
        "The number or percentage of instances that must remain available per Availability Zone \
         during a deployment. This option works in conjunction with the [MinimumHealthyHosts] \
         option. For more information, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html#minimum-healthy-hosts-az}About \
         the minimum number of healthy hosts per Availability Zone} in the {i CodeDeploy User \
         Guide}.\n\n\
        \ If you don't specify the [minimumHealthyHostsPerZone] option, then CodeDeploy uses a \
         default value of [0] percent.\n\
        \ \n\
        \  For more information about the zonal configuration feature, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config}zonal \
         configuration} in the {i CodeDeploy User Guide}.\n\
        \  "]
}
[@@ocaml.doc
  "Configure the [ZonalConfig] object if you want CodeDeploy to deploy your application to one \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-availability-zones}Availability \
   Zone} at a time, within an Amazon Web Services Region. By deploying to one Availability Zone at \
   a time, you can expose your deployment to a progressively larger audience as confidence in the \
   deployment's performance and viability grows. If you don't configure the [ZonalConfig] object, \
   CodeDeploy deploys your application to a random selection of hosts across a Region.\n\n\
  \ For more information about the zonal configuration feature, see \
   {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config}zonal \
   configuration} in the {i CodeDeploy User Guide}.\n\
  \ "]

type nonrec wait_time_in_mins = int [@@ocaml.doc ""]

type nonrec percentage = int [@@ocaml.doc ""]

type nonrec time_based_linear = {
  linear_percentage : percentage option;
      [@ocaml.doc
        "The percentage of traffic that is shifted at the start of each increment of a \
         [TimeBasedLinear] deployment.\n"]
  linear_interval : wait_time_in_mins option;
      [@ocaml.doc
        "The number of minutes between each incremental traffic shift of a [TimeBasedLinear] \
         deployment.\n"]
}
[@@ocaml.doc
  "A configuration that shifts traffic from one version of a Lambda function or ECS task set to \
   another in equal increments, with an equal number of minutes between each increment. The \
   original and target Lambda function versions or ECS task sets are specified in the deployment's \
   AppSpec file.\n"]

type nonrec time_based_canary = {
  canary_percentage : percentage option;
      [@ocaml.doc
        "The percentage of traffic to shift in the first increment of a [TimeBasedCanary] \
         deployment.\n"]
  canary_interval : wait_time_in_mins option;
      [@ocaml.doc
        "The number of minutes between the first and second traffic shifts of a [TimeBasedCanary] \
         deployment.\n"]
}
[@@ocaml.doc
  "A configuration that shifts traffic from one version of a Lambda function or Amazon ECS task \
   set to another in two increments. The original and target Lambda function versions or ECS task \
   sets are specified in the deployment's AppSpec file.\n"]

type nonrec traffic_routing_type =
  | TimeBasedCanary [@ocaml.doc ""]
  | TimeBasedLinear [@ocaml.doc ""]
  | AllAtOnce [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec traffic_routing_config = {
  type_ : traffic_routing_type option;
      [@ocaml.doc
        "The type of traffic shifting ([TimeBasedCanary] or [TimeBasedLinear]) used by a \
         deployment configuration.\n"]
  time_based_canary : time_based_canary option;
      [@ocaml.doc
        "A configuration that shifts traffic from one version of a Lambda function or ECS task set \
         to another in two increments. The original and target Lambda function versions or ECS \
         task sets are specified in the deployment's AppSpec file.\n"]
  time_based_linear : time_based_linear option;
      [@ocaml.doc
        "A configuration that shifts traffic from one version of a Lambda function or Amazon ECS \
         task set to another in equal increments, with an equal number of minutes between each \
         increment. The original and target Lambda function versions or Amazon ECS task sets are \
         specified in the deployment's AppSpec file.\n"]
}
[@@ocaml.doc
  "The configuration that specifies how traffic is shifted from one version of a Lambda function \
   to another version during an Lambda deployment, or from one Amazon ECS task set to another \
   during an Amazon ECS deployment.\n"]

type nonrec minimum_healthy_hosts_value = int [@@ocaml.doc ""]

type nonrec minimum_healthy_hosts_type =
  | HOST_COUNT [@ocaml.doc ""]
  | FLEET_PERCENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec minimum_healthy_hosts = {
  type_ : minimum_healthy_hosts_type option;
      [@ocaml.doc
        "The minimum healthy instance type:\n\n\
        \ {ul\n\
        \       {-   [HOST_COUNT]: The minimum number of healthy instances as an absolute value.\n\
        \           \n\
        \            }\n\
        \       {-   [FLEET_PERCENT]: The minimum number of healthy instances as a percentage of \
         the total number of instances in the deployment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   In an example of nine instances, if a HOST_COUNT of six is specified, deploy to up to \
         three instances at a time. The deployment is successful if six or more instances are \
         deployed to successfully. Otherwise, the deployment fails. If a FLEET_PERCENT of 40 is \
         specified, deploy to up to five instances at a time. The deployment is successful if four \
         or more instances are deployed to successfully. Otherwise, the deployment fails.\n\
        \   \n\
        \     In a call to the [GetDeploymentConfig], CodeDeployDefault.OneAtATime returns a \
         minimum healthy instance type of MOST_CONCURRENCY and a value of 1. This means a \
         deployment to only one instance at a time. (You cannot set the type to MOST_CONCURRENCY, \
         only to HOST_COUNT or FLEET_PERCENT.) In addition, with CodeDeployDefault.OneAtATime, \
         CodeDeploy attempts to ensure that all instances but one are kept in a healthy state \
         during the deployment. Although this allows one instance at a time to be taken offline \
         for a new deployment, it also means that if the deployment to the last instance fails, \
         the overall deployment is still successful.\n\
        \     \n\
        \       For more information, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html}CodeDeploy \
         Instance Health} in the {i CodeDeploy User Guide}.\n\
        \       "]
  value : minimum_healthy_hosts_value option; [@ocaml.doc "The minimum healthy instance value.\n"]
}
[@@ocaml.doc "Information about the minimum number of healthy instances.\n"]

type nonrec deployment_config_id = string [@@ocaml.doc ""]

type nonrec deployment_config_info = {
  deployment_config_id : deployment_config_id option;
      [@ocaml.doc "The deployment configuration ID.\n"]
  deployment_config_name : deployment_config_name option;
      [@ocaml.doc "The deployment configuration name.\n"]
  minimum_healthy_hosts : minimum_healthy_hosts option;
      [@ocaml.doc "Information about the number or percentage of minimum healthy instances.\n"]
  create_time : timestamp option;
      [@ocaml.doc "The time at which the deployment configuration was created.\n"]
  compute_platform : compute_platform option;
      [@ocaml.doc
        "The destination platform type for the deployment ([Lambda], [Server], or [ECS]).\n"]
  traffic_routing_config : traffic_routing_config option;
      [@ocaml.doc
        "The configuration that specifies how the deployment traffic is routed. Used for \
         deployments with a Lambda or Amazon ECS compute platform only.\n"]
  zonal_config : zonal_config option; [@ocaml.doc "Information about a zonal configuration.\n"]
}
[@@ocaml.doc "Information about a deployment configuration.\n"]

type nonrec get_deployment_config_output = {
  deployment_config_info : deployment_config_info option;
      [@ocaml.doc "Information about the deployment configuration.\n"]
}
[@@ocaml.doc "Represents the output of a [GetDeploymentConfig] operation.\n"]

type nonrec get_deployment_config_input = {
  deployment_config_name : deployment_config_name;
      [@ocaml.doc
        "The name of a deployment configuration associated with the user or Amazon Web Services \
         account.\n"]
}
[@@ocaml.doc "Represents the input of a [GetDeploymentConfig] operation.\n"]

type nonrec get_deployment_output = {
  deployment_info : deployment_info option; [@ocaml.doc "Information about the deployment.\n"]
}
[@@ocaml.doc "Represents the output of a [GetDeployment] operation.\n"]

type nonrec get_deployment_input = {
  deployment_id : deployment_id;
      [@ocaml.doc
        " The unique ID of a deployment associated with the user or Amazon Web Services account. \n"]
}
[@@ocaml.doc "Represents the input of a [GetDeployment] operation.\n"]

type nonrec revision_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The named revision does not exist with the user or Amazon Web Services account.\n"]

type nonrec get_application_revision_output = {
  application_name : application_name option;
      [@ocaml.doc "The name of the application that corresponds to the revision.\n"]
  revision : revision_location option;
      [@ocaml.doc "Additional information about the revision, including type and location.\n"]
  revision_info : generic_revision_info option;
      [@ocaml.doc "General information about the revision.\n"]
}
[@@ocaml.doc "Represents the output of a [GetApplicationRevision] operation.\n"]

type nonrec get_application_revision_input = {
  application_name : application_name;
      [@ocaml.doc "The name of the application that corresponds to the revision.\n"]
  revision : revision_location;
      [@ocaml.doc
        "Information about the application revision to get, including type and location.\n"]
}
[@@ocaml.doc "Represents the input of a [GetApplicationRevision] operation.\n"]

type nonrec get_application_output = {
  application : application_info option; [@ocaml.doc "Information about the application.\n"]
}
[@@ocaml.doc "Represents the output of a [GetApplication] operation.\n"]

type nonrec get_application_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
}
[@@ocaml.doc "Represents the input of a [GetApplication] operation.\n"]

type nonrec deregister_on_premises_instance_input = {
  instance_name : instance_name; [@ocaml.doc "The name of the on-premises instance to deregister.\n"]
}
[@@ocaml.doc "Represents the input of a [DeregisterOnPremisesInstance] operation.\n"]

type nonrec delete_resources_by_external_id_output = unit [@@ocaml.doc ""]

type nonrec delete_resources_by_external_id_input = {
  external_id : external_id option;
      [@ocaml.doc
        "The unique ID of an external resource (for example, a CloudFormation stack ID) that is \
         linked to one or more CodeDeploy resources.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_git_hub_account_token_name_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The format of the specified GitHub account connection name is invalid.\n"]

type nonrec git_hub_account_token_name_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The call is missing a required GitHub account connection name.\n"]

type nonrec git_hub_account_token_does_not_exist_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "No GitHub account connection exists with the named specified in the call.\n"]

type nonrec delete_git_hub_account_token_output = {
  token_name : git_hub_account_token_name option;
      [@ocaml.doc "The name of the GitHub account connection that was deleted.\n"]
}
[@@ocaml.doc "Represents the output of a [DeleteGitHubAccountToken] operation.\n"]

type nonrec delete_git_hub_account_token_input = {
  token_name : git_hub_account_token_name option;
      [@ocaml.doc "The name of the GitHub account connection to delete.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteGitHubAccount] operation.\n"]

type nonrec delete_deployment_group_output = {
  hooks_not_cleaned_up : auto_scaling_group_list option;
      [@ocaml.doc
        "If the output contains no data, and the corresponding deployment group contained at least \
         one Auto Scaling group, CodeDeploy successfully removed all corresponding Auto Scaling \
         lifecycle event hooks from the Amazon EC2 instances in the Auto Scaling group. If the \
         output contains data, CodeDeploy could not remove some Auto Scaling lifecycle event hooks \
         from the Amazon EC2 instances in the Auto Scaling group.\n"]
}
[@@ocaml.doc "Represents the output of a [DeleteDeploymentGroup] operation.\n"]

type nonrec delete_deployment_group_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
  deployment_group_name : deployment_group_name;
      [@ocaml.doc "The name of a deployment group for the specified application.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteDeploymentGroup] operation.\n"]

type nonrec invalid_operation_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "An invalid operation was detected.\n"]

type nonrec deployment_config_in_use_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment configuration is still in use.\n"]

type nonrec delete_deployment_config_input = {
  deployment_config_name : deployment_config_name;
      [@ocaml.doc
        "The name of a deployment configuration associated with the user or Amazon Web Services \
         account.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteDeploymentConfig] operation.\n"]

type nonrec delete_application_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteApplication] operation.\n"]

type nonrec role_required_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The role ID was not specified.\n"]

type nonrec deployment_group_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The deployment groups limit was exceeded.\n"]

type nonrec create_deployment_group_output = {
  deployment_group_id : deployment_group_id option; [@ocaml.doc "A unique deployment group ID.\n"]
}
[@@ocaml.doc "Represents the output of a [CreateDeploymentGroup] operation.\n"]

type nonrec create_deployment_group_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
  deployment_group_name : deployment_group_name;
      [@ocaml.doc "The name of a new deployment group for the specified application.\n"]
  deployment_config_name : deployment_config_name option;
      [@ocaml.doc
        "If specified, the deployment configuration name can be either one of the predefined \
         configurations provided with CodeDeploy or a custom deployment configuration that you \
         create by calling the create deployment configuration operation.\n\n\
        \  [CodeDeployDefault.OneAtATime] is the default deployment configuration. It is used if a \
         configuration isn't specified for the deployment or deployment group.\n\
        \ \n\
        \  For more information about the predefined deployment configurations in CodeDeploy, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html}Working \
         with Deployment Configurations in CodeDeploy} in the {i CodeDeploy User Guide}.\n\
        \  "]
  ec2_tag_filters : ec2_tag_filter_list option;
      [@ocaml.doc
        "The Amazon EC2 tags on which to filter. The deployment group includes Amazon EC2 \
         instances with any of the specified tags. Cannot be used in the same call as ec2TagSet.\n"]
  on_premises_instance_tag_filters : tag_filter_list option;
      [@ocaml.doc
        "The on-premises instance tags on which to filter. The deployment group includes \
         on-premises instances with any of the specified tags. Cannot be used in the same call as \
         [OnPremisesTagSet].\n"]
  auto_scaling_groups : auto_scaling_group_name_list option;
      [@ocaml.doc "A list of associated Amazon EC2 Auto Scaling groups.\n"]
  service_role_arn : role;
      [@ocaml.doc
        "A service role Amazon Resource Name (ARN) that allows CodeDeploy to act on the user's \
         behalf when interacting with Amazon Web Services services.\n"]
  trigger_configurations : trigger_config_list option;
      [@ocaml.doc
        "Information about triggers to create when the deployment group is created. For examples, \
         see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-sns.html}Create \
         a Trigger for an CodeDeploy Event} in the {i CodeDeploy User Guide}.\n"]
  alarm_configuration : alarm_configuration option;
      [@ocaml.doc
        "Information to add about Amazon CloudWatch alarms when the deployment group is created.\n"]
  auto_rollback_configuration : auto_rollback_configuration option;
      [@ocaml.doc
        "Configuration information for an automatic rollback that is added when a deployment group \
         is created.\n"]
  outdated_instances_strategy : outdated_instances_strategy option;
      [@ocaml.doc
        "Indicates what happens when new Amazon EC2 instances are launched mid-deployment and do \
         not receive the deployed application revision.\n\n\
        \ If this option is set to [UPDATE] or is unspecified, CodeDeploy initiates one or more \
         'auto-update outdated instances' deployments to apply the deployed application revision \
         to the new Amazon EC2 instances.\n\
        \ \n\
        \  If this option is set to [IGNORE], CodeDeploy does not initiate a deployment to update \
         the new Amazon EC2 instances. This may result in instances having different revisions.\n\
        \  "]
  deployment_style : deployment_style option;
      [@ocaml.doc
        "Information about the type of deployment, in-place or blue/green, that you want to run \
         and whether to route deployment traffic behind a load balancer.\n"]
  blue_green_deployment_configuration : blue_green_deployment_configuration option;
      [@ocaml.doc "Information about blue/green deployment options for a deployment group.\n"]
  load_balancer_info : load_balancer_info option;
      [@ocaml.doc "Information about the load balancer used in a deployment.\n"]
  ec2_tag_set : ec2_tag_set option;
      [@ocaml.doc
        "Information about groups of tags applied to Amazon EC2 instances. The deployment group \
         includes only Amazon EC2 instances identified by all the tag groups. Cannot be used in \
         the same call as [ec2TagFilters].\n"]
  ecs_services : ecs_service_list option;
      [@ocaml.doc
        " The target Amazon ECS services in the deployment group. This applies only to deployment \
         groups that use the Amazon ECS compute platform. A target Amazon ECS service is specified \
         as an Amazon ECS cluster and service name pair using the format \n\
         {[\n\
         :\n\
         ]}\n\
         . \n"]
  on_premises_tag_set : on_premises_tag_set option;
      [@ocaml.doc
        "Information about groups of tags applied to on-premises instances. The deployment group \
         includes only on-premises instances identified by all of the tag groups. Cannot be used \
         in the same call as [onPremisesInstanceTagFilters].\n"]
  tags : tag_list option;
      [@ocaml.doc
        " The metadata that you apply to CodeDeploy deployment groups to help you organize and \
         categorize them. Each tag consists of a key and an optional value, both of which you \
         define. \n"]
  termination_hook_enabled : nullable_boolean option;
      [@ocaml.doc
        "This parameter only applies if you are using CodeDeploy with Amazon EC2 Auto Scaling. For \
         more information, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html}Integrating \
         CodeDeploy with Amazon EC2 Auto Scaling} in the {i CodeDeploy User Guide}.\n\n\
        \ Set [terminationHookEnabled] to [true] to have CodeDeploy install a termination hook \
         into your Auto Scaling group when you create a deployment group. When this hook is \
         installed, CodeDeploy will perform termination deployments.\n\
        \ \n\
        \  For information about termination deployments, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors-hook-enable}Enabling \
         termination deployments during Auto Scaling scale-in events} in the {i CodeDeploy User \
         Guide}.\n\
        \  \n\
        \   For more information about Auto Scaling scale-in events, see the \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-lifecycle.html#as-lifecycle-scale-in}Scale \
         in} topic in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \   "]
}
[@@ocaml.doc "Represents the input of a [CreateDeploymentGroup] operation.\n"]

type nonrec invalid_zonal_deployment_configuration_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The [ZonalConfig] object is not valid.\n"]

type nonrec invalid_minimum_healthy_host_value_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The minimum healthy instance value was specified in an invalid format.\n"]

type nonrec deployment_config_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment configurations limit was exceeded.\n"]

type nonrec deployment_config_already_exists_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "A deployment configuration with the specified name with the user or Amazon Web Services account \
   already exists.\n"]

type nonrec create_deployment_config_output = {
  deployment_config_id : deployment_config_id option;
      [@ocaml.doc "A unique deployment configuration ID.\n"]
}
[@@ocaml.doc "Represents the output of a [CreateDeploymentConfig] operation.\n"]

type nonrec create_deployment_config_input = {
  deployment_config_name : deployment_config_name;
      [@ocaml.doc "The name of the deployment configuration to create.\n"]
  minimum_healthy_hosts : minimum_healthy_hosts option;
      [@ocaml.doc
        "The minimum number of healthy instances that should be available at any time during the \
         deployment. There are two parameters expected in the input: type and value.\n\n\
        \ The type parameter takes either of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  HOST_COUNT: The value parameter represents the minimum number of healthy \
         instances as an absolute value.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_PERCENT: The value parameter represents the minimum number of healthy \
         instances as a percentage of the total number of instances in the deployment. If you \
         specify FLEET_PERCENT, at the start of the deployment, CodeDeploy converts the percentage \
         to the equivalent number of instances and rounds up fractional instances.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The value parameter takes an integer.\n\
        \   \n\
        \    For example, to set a minimum of 95% healthy instance, specify a type of \
         FLEET_PERCENT and a value of 95.\n\
        \    "]
  traffic_routing_config : traffic_routing_config option;
      [@ocaml.doc "The configuration that specifies how the deployment traffic is routed.\n"]
  compute_platform : compute_platform option;
      [@ocaml.doc
        "The destination platform type for the deployment ([Lambda], [Server], or [ECS]).\n"]
  zonal_config : zonal_config option;
      [@ocaml.doc
        "Configure the [ZonalConfig] object if you want CodeDeploy to deploy your application to \
         one \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-availability-zones}Availability \
         Zone} at a time, within an Amazon Web Services Region.\n\n\
        \ For more information about the zonal configuration feature, see \
         {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config}zonal \
         configuration} in the {i CodeDeploy User Guide}.\n\
        \ "]
}
[@@ocaml.doc "Represents the input of a [CreateDeploymentConfig] operation.\n"]

type nonrec invalid_update_outdated_instances_only_value_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The UpdateOutdatedInstancesOnly value is invalid. For Lambda deployments, [false] is expected. \
   For EC2/On-premises deployments, [true] or [false] is expected.\n"]

type nonrec invalid_target_instances_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The target instance configuration is invalid. Possible causes include:\n\n\
  \ {ul\n\
  \       {-  Configuration data for target instances was entered for an in-place deployment.\n\
  \           \n\
  \            }\n\
  \       {-  The limit of 10 tags for a tag type was exceeded.\n\
  \           \n\
  \            }\n\
  \       {-  The combined length of the tag names exceeded the limit. \n\
  \           \n\
  \            }\n\
  \       {-  A specified tag is not currently applied to any instances.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec invalid_ignore_application_stop_failures_value_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "The IgnoreApplicationStopFailures value is invalid. For Lambda deployments, [false] is \
   expected. For EC2/On-premises deployments, [true] or [false] is expected.\n"]

type nonrec invalid_git_hub_account_token_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The GitHub token is not valid.\n"]

type nonrec invalid_file_exists_behavior_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc
  "An invalid fileExistsBehavior option was specified to determine how CodeDeploy handles files or \
   directories that already exist in a deployment target location, but weren't part of the \
   previous successful deployment. Valid values include \"DISALLOW,\" \"OVERWRITE,\" and \
   \"RETAIN.\"\n"]

type nonrec deployment_limit_exceeded_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The number of allowed deployments was exceeded.\n"]

type nonrec create_deployment_output = {
  deployment_id : deployment_id option; [@ocaml.doc " The unique ID of a deployment. \n"]
}
[@@ocaml.doc " Represents the output of a [CreateDeployment] operation. \n"]

type nonrec create_deployment_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of an CodeDeploy application associated with the user or Amazon Web Services \
         account.\n"]
  deployment_group_name : deployment_group_name option;
      [@ocaml.doc "The name of the deployment group.\n"]
  revision : revision_location option;
      [@ocaml.doc " The type and location of the revision to deploy. \n"]
  deployment_config_name : deployment_config_name option;
      [@ocaml.doc
        "The name of a deployment configuration associated with the user or Amazon Web Services \
         account.\n\n\
        \ If not specified, the value configured in the deployment group is used as the default. \
         If the deployment group does not have a deployment configuration associated with it, \
         [CodeDeployDefault].[OneAtATime] is used by default.\n\
        \ "]
  description : description option; [@ocaml.doc "A comment about the deployment.\n"]
  ignore_application_stop_failures : boolean_ option;
      [@ocaml.doc
        " If true, then if an [ApplicationStop], [BeforeBlockTraffic], or [AfterBlockTraffic] \
         deployment lifecycle event to an instance fails, then the deployment continues to the \
         next deployment lifecycle event. For example, if [ApplicationStop] fails, the deployment \
         continues with [DownloadBundle]. If [BeforeBlockTraffic] fails, the deployment continues \
         with [BlockTraffic]. If [AfterBlockTraffic] fails, the deployment continues with \
         [ApplicationStop]. \n\n\
        \  If false or not specified, then if a lifecycle event fails during a deployment to an \
         instance, that deployment fails. If deployment to that instance is part of an overall \
         deployment and the number of healthy hosts is not less than the minimum number of healthy \
         hosts, then a deployment to the next instance is attempted. \n\
        \ \n\
        \   During a deployment, the CodeDeploy agent runs the scripts specified for \
         [ApplicationStop], [BeforeBlockTraffic], and [AfterBlockTraffic] in the AppSpec file from \
         the previous successful deployment. (All other scripts are run from the AppSpec file in \
         the current deployment.) If one of these scripts contains an error and does not run \
         successfully, the deployment can fail. \n\
        \  \n\
        \    If the cause of the failure is a script from the last successful deployment that will \
         never run successfully, create a new deployment and use [ignoreApplicationStopFailures] \
         to specify that the [ApplicationStop], [BeforeBlockTraffic], and [AfterBlockTraffic] \
         failures should be ignored. \n\
        \   "]
  target_instances : target_instances option;
      [@ocaml.doc
        " Information about the instances that belong to the replacement environment in a \
         blue/green deployment. \n"]
  auto_rollback_configuration : auto_rollback_configuration option;
      [@ocaml.doc
        "Configuration information for an automatic rollback that is added when a deployment is \
         created.\n"]
  update_outdated_instances_only : boolean_ option;
      [@ocaml.doc
        " Indicates whether to deploy to all instances or only to instances that are not running \
         the latest application revision. \n"]
  file_exists_behavior : file_exists_behavior option;
      [@ocaml.doc
        "Information about how CodeDeploy handles files that already exist in a deployment target \
         location but weren't part of the previous successful deployment.\n\n\
        \ The [fileExistsBehavior] parameter takes any of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  DISALLOW: The deployment fails. This is also the default behavior if no \
         option is specified.\n\
        \            \n\
        \             }\n\
        \        {-  OVERWRITE: The version of the file from the application revision currently \
         being deployed replaces the version already on the instance.\n\
        \            \n\
        \             }\n\
        \        {-  RETAIN: The version of the file already on the instance is kept and used as \
         part of the new deployment.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  override_alarm_configuration : alarm_configuration option;
      [@ocaml.doc
        "Allows you to specify information about alarms associated with a deployment. The alarm \
         configuration that you specify here will override the alarm configuration at the \
         deployment group level. Consider overriding the alarm configuration if you have set up \
         alarms at the deployment group level that are causing deployment failures. In this case, \
         you would call [CreateDeployment] to create a new deployment that uses a previous \
         application revision that is known to work, and set its alarm configuration to turn off \
         alarm polling. Turning off alarm polling ensures that the new deployment proceeds without \
         being blocked by the alarm that was generated by the previous, failed, deployment.\n\n\
        \  If you specify an [overrideAlarmConfiguration], you need the [UpdateDeploymentGroup] \
         IAM permission when calling [CreateDeployment].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the input of a [CreateDeployment] operation.\n"]

type nonrec create_application_output = {
  application_id : application_id option; [@ocaml.doc "A unique application ID.\n"]
}
[@@ocaml.doc "Represents the output of a [CreateApplication] operation.\n"]

type nonrec create_application_input = {
  application_name : application_name;
      [@ocaml.doc
        "The name of the application. This name must be unique with the applicable user or Amazon \
         Web Services account.\n"]
  compute_platform : compute_platform option;
      [@ocaml.doc
        " The destination platform type for the deployment ([Lambda], [Server], or [ECS]).\n"]
  tags : tag_list option;
      [@ocaml.doc
        " The metadata that you apply to CodeDeploy applications to help you organize and \
         categorize them. Each tag consists of a key and an optional value, both of which you \
         define. \n"]
}
[@@ocaml.doc "Represents the input of a [CreateApplication] operation.\n"]

type nonrec invalid_deployment_wait_type_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc " The wait type is invalid. \n"]

type nonrec deployment_is_not_in_ready_state_exception = {
  message : message option;
      [@ocaml.doc "The message that corresponds to the exception thrown by CodeDeploy.\n"]
}
[@@ocaml.doc "The deployment does not have a status of Ready and can't continue yet.\n"]

type nonrec deployment_wait_type = READY_WAIT [@ocaml.doc ""] | TERMINATION_WAIT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec continue_deployment_input = {
  deployment_id : deployment_id option;
      [@ocaml.doc
        " The unique ID of a blue/green deployment for which you want to start rerouting traffic \
         to the replacement environment. \n"]
  deployment_wait_type : deployment_wait_type option;
      [@ocaml.doc
        " The status of the deployment's waiting period. [READY_WAIT] indicates that the \
         deployment is ready to start shifting traffic. [TERMINATION_WAIT] indicates that the \
         traffic is shifted, but the original target is not terminated. \n"]
}
[@@ocaml.doc ""]
