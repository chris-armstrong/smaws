type nonrec virtualization_type = string [@@ocaml.doc ""]

type nonrec version_label = string [@@ocaml.doc ""]

type nonrec version_labels_list = version_label list [@@ocaml.doc ""]

type nonrec version_labels = version_label list [@@ocaml.doc ""]

type nonrec validation_severity = Warning [@ocaml.doc ""] | Error_ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_message_string = string [@@ocaml.doc ""]

type nonrec option_namespace = string [@@ocaml.doc ""]

type nonrec configuration_option_name = string [@@ocaml.doc ""]

type nonrec validation_message = {
  option_name : configuration_option_name option; [@ocaml.doc "The name of the option.\n"]
  namespace : option_namespace option; [@ocaml.doc "The namespace to which the option belongs.\n"]
  severity : validation_severity option;
      [@ocaml.doc
        "An indication of the severity of this message:\n\n\
        \ {ul\n\
        \       {-   [error]: This message indicates that this is not a valid setting for an option.\n\
        \           \n\
        \            }\n\
        \       {-   [warning]: This message is providing information you should take into account.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : validation_message_string option;
      [@ocaml.doc "A message describing the error or warning.\n"]
}
[@@ocaml.doc "An error or warning for a desired configuration option value.\n"]

type nonrec validation_messages_list = validation_message list [@@ocaml.doc ""]

type nonrec application_name = string [@@ocaml.doc ""]

type nonrec configuration_template_name = string [@@ocaml.doc ""]

type nonrec environment_name = string [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec configuration_option_value = string [@@ocaml.doc ""]

type nonrec configuration_option_setting = {
  value : configuration_option_value option;
      [@ocaml.doc "The current value for the configuration option.\n"]
  option_name : configuration_option_name option;
      [@ocaml.doc "The name of the configuration option.\n"]
  namespace : option_namespace option;
      [@ocaml.doc "A unique namespace that identifies the option's associated AWS resource.\n"]
  resource_name : resource_name option;
      [@ocaml.doc
        "A unique resource name for the option setting. Use it for a time\226\128\147based scaling \
         configuration option.\n"]
}
[@@ocaml.doc
  "A specification identifying an individual configuration option along with its current value. \
   For a list of possible namespaces and option values, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html}Option Values} \
   in the {i AWS Elastic Beanstalk Developer Guide}. \n"]

type nonrec configuration_option_settings_list = configuration_option_setting list [@@ocaml.doc ""]

type nonrec validate_configuration_settings_message = {
  option_settings : configuration_option_settings_list;
      [@ocaml.doc "A list of the options and desired values to evaluate.\n"]
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to validate the settings against.\n\n\
        \ Condition: You cannot specify both this and a configuration template name.\n\
        \ "]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "The name of the configuration template to validate the settings against.\n\n\
        \ Condition: You cannot specify both this and an environment name.\n\
        \ "]
  application_name : application_name;
      [@ocaml.doc
        "The name of the application that the configuration template or environment belongs to.\n"]
}
[@@ocaml.doc "A list of validation messages for a specified configuration template.\n"]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec too_many_buckets_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "The specified account has reached its limit of Amazon S3 buckets.\n"]

type nonrec insufficient_privileges_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "The specified account does not have sufficient privileges for one or more AWS services.\n"]

type nonrec configuration_settings_validation_messages = {
  messages : validation_messages_list option; [@ocaml.doc " A list of [ValidationMessage]. \n"]
}
[@@ocaml.doc "Provides a list of validation messages.\n"]

type nonrec user_defined_option = bool [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "The value of the tag.\n"]
  key : tag_key option; [@ocaml.doc "The key of the tag.\n"]
}
[@@ocaml.doc "Describes a tag applied to a resource in an environment.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec update_tags_for_resource_message = {
  tags_to_remove : tag_key_list option;
      [@ocaml.doc
        "A list of tag keys to remove. If a tag key doesn't exist, it is silently ignored.\n\n\
        \ Specify at least one of these parameters: [TagsToAdd], [TagsToRemove].\n\
        \ "]
  tags_to_add : tag_list option;
      [@ocaml.doc
        "A list of tags to add or update. If a key of an existing tag is added, the tag's value is \
         updated.\n\n\
        \ Specify at least one of these parameters: [TagsToAdd], [TagsToRemove].\n\
        \ "]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resouce to be updated.\n\n\
        \ Must be the ARN of an Elastic Beanstalk resource.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "The number of tags in the resource would exceed the number of tags that each resource can have.\n\n\
  \ To calculate this, the operation considers both the number of tags the resource already has \
   and the tags this operation would add if it succeeded.\n\
  \ "]

type nonrec resource_type_not_supported_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "The type of the specified Amazon Resource Name (ARN) isn't supported for this operation.\n"]

type nonrec resource_not_found_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "A resource doesn't exist for the specified Amazon Resource Name (ARN).\n"]

type nonrec operation_in_progress_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "Unable to perform the specified operation because another operation that effects an element in \
   this activity is already in progress.\n"]

type nonrec environment_id = string [@@ocaml.doc ""]

type nonrec group_name = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec environment_tier = {
  version : string_ option;
      [@ocaml.doc
        "The version of this environment tier. When you don't set a value to it, Elastic Beanstalk \
         uses the latest compatible worker tier version.\n\n\
        \  This member is deprecated. Any specific version that you set may become out of date. We \
         recommend leaving it unspecified.\n\
        \  \n\
        \   "]
  type_ : string_ option;
      [@ocaml.doc
        "The type of this environment tier.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  For {i Web server tier} \226\128\147 [Standard] \n\
        \            \n\
        \             }\n\
        \        {-  For {i Worker tier} \226\128\147 [SQS/HTTP] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : string_ option;
      [@ocaml.doc
        "The name of this environment tier.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  For {i Web server tier} \226\128\147 [WebServer] \n\
        \            \n\
        \             }\n\
        \        {-  For {i Worker tier} \226\128\147 [Worker] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Describes the properties of an environment tier\n"]

type nonrec solution_stack_name = string [@@ocaml.doc ""]

type nonrec platform_arn = string [@@ocaml.doc ""]

type nonrec option_specification = {
  option_name : configuration_option_name option;
      [@ocaml.doc "The name of the configuration option.\n"]
  namespace : option_namespace option;
      [@ocaml.doc "A unique namespace identifying the option's associated AWS resource.\n"]
  resource_name : resource_name option;
      [@ocaml.doc "A unique resource name for a time-based scaling configuration option.\n"]
}
[@@ocaml.doc "A specification identifying an individual configuration option.\n"]

type nonrec options_specifier_list = option_specification list [@@ocaml.doc ""]

type nonrec update_environment_message = {
  options_to_remove : options_specifier_list option;
      [@ocaml.doc
        "A list of custom user-defined configuration options to remove from the configuration set \
         for this environment.\n"]
  option_settings : configuration_option_settings_list option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk updates the configuration set associated with the \
         running environment and sets the specified configuration options to the requested value.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform, if used.\n"]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc
        "This specifies the platform version that the environment will run after the environment \
         is updated.\n"]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "If this parameter is specified, AWS Elastic Beanstalk deploys this configuration template \
         to the environment. If no such configuration template is found, AWS Elastic Beanstalk \
         returns an [InvalidParameterValue] error. \n"]
  version_label : version_label option;
      [@ocaml.doc
        "If this parameter is specified, AWS Elastic Beanstalk deploys the named application \
         version to the environment. If no such application version is found, returns an \
         [InvalidParameterValue] error. \n"]
  tier : environment_tier option;
      [@ocaml.doc
        "This specifies the tier to use to update the environment.\n\n\
        \ Condition: At this time, if you change the tier version, name, or type, AWS Elastic \
         Beanstalk returns [InvalidParameterValue] error. \n\
        \ "]
  description : description option;
      [@ocaml.doc
        "If this parameter is specified, AWS Elastic Beanstalk updates the description of this \
         environment.\n"]
  group_name : group_name option;
      [@ocaml.doc
        "The name of the group to which the target environment belongs. Specify a group name only \
         if the environment's name is specified in an environment manifest and not with the \
         environment name or environment ID parameters. See \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html}Environment \
         Manifest (env.yaml)} for details.\n"]
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to update. If no environment with this name exists, AWS \
         Elastic Beanstalk returns an [InvalidParameterValue] error. \n\n\
        \ Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the environment to update.\n\n\
        \ If no environment with this ID exists, AWS Elastic Beanstalk returns an \
         [InvalidParameterValue] error.\n\
        \ \n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \  "]
  application_name : application_name option;
      [@ocaml.doc "The name of the application with which the environment is associated.\n"]
}
[@@ocaml.doc "Request to update an environment.\n"]

type nonrec endpoint_ur_l = string [@@ocaml.doc ""]

type nonrec dns_cname = string [@@ocaml.doc ""]

type nonrec creation_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec update_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec environment_status =
  | Terminated [@ocaml.doc ""]
  | Terminating [@ocaml.doc ""]
  | Ready [@ocaml.doc ""]
  | LinkingTo [@ocaml.doc ""]
  | LinkingFrom [@ocaml.doc ""]
  | Updating [@ocaml.doc ""]
  | Launching [@ocaml.doc ""]
  | Aborting [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec abortable_operation_in_progress = bool [@@ocaml.doc ""]

type nonrec environment_health =
  | Grey [@ocaml.doc ""]
  | Red [@ocaml.doc ""]
  | Yellow [@ocaml.doc ""]
  | Green [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_health_status =
  | Suspended [@ocaml.doc ""]
  | Severe [@ocaml.doc ""]
  | Degraded [@ocaml.doc ""]
  | Warning [@ocaml.doc ""]
  | Info [@ocaml.doc ""]
  | Ok_ [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Unknown [@ocaml.doc ""]
  | NoData [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec listener = {
  port : integer option; [@ocaml.doc "The port that is used by the Listener.\n"]
  protocol : string_ option; [@ocaml.doc "The protocol that is used by the Listener.\n"]
}
[@@ocaml.doc "Describes the properties of a Listener for the LoadBalancer.\n"]

type nonrec load_balancer_listeners_description = listener list [@@ocaml.doc ""]

type nonrec load_balancer_description = {
  listeners : load_balancer_listeners_description option;
      [@ocaml.doc "A list of Listeners used by the LoadBalancer.\n"]
  domain : string_ option; [@ocaml.doc "The domain name of the LoadBalancer.\n"]
  load_balancer_name : string_ option; [@ocaml.doc "The name of the LoadBalancer.\n"]
}
[@@ocaml.doc "Describes the details of a LoadBalancer.\n"]

type nonrec environment_resources_description = {
  load_balancer : load_balancer_description option; [@ocaml.doc "Describes the LoadBalancer.\n"]
}
[@@ocaml.doc
  "Describes the AWS resources in use by this environment. This data is not live data.\n"]

type nonrec environment_link = {
  environment_name : string_ option;
      [@ocaml.doc "The name of the linked environment (the dependency).\n"]
  link_name : string_ option; [@ocaml.doc "The name of the link.\n"]
}
[@@ocaml.doc
  "A link to another environment, defined in the environment's manifest. Links provide connection \
   information in system properties that can be used to connect to another environment in the same \
   group. See \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html}Environment \
   Manifest (env.yaml)} for details.\n"]

type nonrec environment_links = environment_link list [@@ocaml.doc ""]

type nonrec environment_arn = string [@@ocaml.doc ""]

type nonrec operations_role = string [@@ocaml.doc ""]

type nonrec environment_description = {
  operations_role : operations_role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the environment's operations role. For more \
         information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html}Operations \
         roles} in the {i AWS Elastic Beanstalk Developer Guide}.\n"]
  environment_arn : environment_arn option;
      [@ocaml.doc
        "The environment's Amazon Resource Name (ARN), which can be used in other API requests \
         that require an ARN.\n"]
  environment_links : environment_links option;
      [@ocaml.doc "A list of links to other environments in the same group.\n"]
  tier : environment_tier option; [@ocaml.doc "Describes the current tier of this environment.\n"]
  resources : environment_resources_description option;
      [@ocaml.doc "The description of the AWS resources used by this environment.\n"]
  health_status : environment_health_status option;
      [@ocaml.doc
        "Returns the health status of the application running in your environment. For more \
         information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html}Health \
         Colors and Statuses}.\n"]
  health : environment_health option;
      [@ocaml.doc
        "Describes the health status of the environment. AWS Elastic Beanstalk indicates the \
         failure levels for a running environment:\n\n\
        \ {ul\n\
        \       {-   [Red]: Indicates the environment is not responsive. Occurs when three or more \
         consecutive failures occur for an environment.\n\
        \           \n\
        \            }\n\
        \       {-   [Yellow]: Indicates that something is wrong. Occurs when two consecutive \
         failures occur for an environment.\n\
        \           \n\
        \            }\n\
        \       {-   [Green]: Indicates the environment is healthy and fully functional.\n\
        \           \n\
        \            }\n\
        \       {-   [Grey]: Default health for a new environment. The environment is not fully \
         launched and health checks have not started or health checks are suspended during an \
         [UpdateEnvironment] or [RestartEnvironment] request.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Default: [Grey] \n\
        \   "]
  abortable_operation_in_progress : abortable_operation_in_progress option;
      [@ocaml.doc
        "Indicates if there is an in-progress environment configuration update or application \
         version deployment that you can cancel.\n\n\
        \  [true:] There is an update in progress. \n\
        \ \n\
        \   [false:] There are no updates currently in progress. \n\
        \  "]
  status : environment_status option;
      [@ocaml.doc
        "The current operational status of the environment:\n\n\
        \ {ul\n\
        \       {-   [Launching]: Environment is in the process of initial deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [Updating]: Environment is in the process of updating its configuration \
         settings or application version.\n\
        \           \n\
        \            }\n\
        \       {-   [Ready]: Environment is available to have an action performed on it, such as \
         update or terminate.\n\
        \           \n\
        \            }\n\
        \       {-   [Terminating]: Environment is in the shut-down process.\n\
        \           \n\
        \            }\n\
        \       {-   [Terminated]: Environment is not running.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  date_updated : update_date option; [@ocaml.doc "The last modified date for this environment.\n"]
  date_created : creation_date option; [@ocaml.doc "The creation date for this environment.\n"]
  cnam_e : dns_cname option; [@ocaml.doc "The URL to the CNAME for this environment.\n"]
  endpoint_ur_l : endpoint_ur_l option;
      [@ocaml.doc
        "For load-balanced, autoscaling environments, the URL to the LoadBalancer. For \
         single-instance environments, the IP address of the instance.\n"]
  description : description option; [@ocaml.doc "Describes this environment.\n"]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "The name of the configuration template used to originally launch this environment.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc " The name of the [SolutionStack] deployed with this environment. \n"]
  version_label : version_label option;
      [@ocaml.doc "The application version deployed in this environment.\n"]
  application_name : application_name option;
      [@ocaml.doc "The name of the application associated with this environment.\n"]
  environment_id : environment_id option; [@ocaml.doc "The ID of this environment.\n"]
  environment_name : environment_name option; [@ocaml.doc "The name of this environment.\n"]
}
[@@ocaml.doc "Describes the properties of an environment.\n"]

type nonrec update_configuration_template_message = {
  options_to_remove : options_specifier_list option;
      [@ocaml.doc
        "A list of configuration options to remove from the configuration set.\n\n\
        \  Constraint: You can remove only [UserDefined] configuration options. \n\
        \ "]
  option_settings : configuration_option_settings_list option;
      [@ocaml.doc
        "A list of configuration option settings to update with the new specified option value.\n"]
  description : description option; [@ocaml.doc "A new description for the configuration.\n"]
  template_name : configuration_template_name;
      [@ocaml.doc
        "The name of the configuration template to update.\n\n\
        \  If no configuration template is found with this name, [UpdateConfigurationTemplate] \
         returns an [InvalidParameterValue] error. \n\
        \ "]
  application_name : application_name;
      [@ocaml.doc
        "The name of the application associated with the configuration template to update.\n\n\
        \  If no application is found with this name, [UpdateConfigurationTemplate] returns an \
         [InvalidParameterValue] error. \n\
        \ "]
}
[@@ocaml.doc "The result message containing the options for the specified solution stack.\n"]

type nonrec configuration_deployment_status =
  | Failed [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Deployed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec configuration_settings_description = {
  option_settings : configuration_option_settings_list option;
      [@ocaml.doc
        "A list of the configuration options and their values in this configuration set.\n"]
  date_updated : update_date option;
      [@ocaml.doc "The date (in UTC time) when this configuration set was last modified.\n"]
  date_created : creation_date option;
      [@ocaml.doc "The date (in UTC time) when this configuration set was created.\n"]
  deployment_status : configuration_deployment_status option;
      [@ocaml.doc
        " If this configuration set is associated with an environment, the [DeploymentStatus] \
         parameter indicates the deployment status of this configuration set: \n\n\
        \ {ul\n\
        \       {-   [null]: This configuration is not associated with a running environment.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: This is a draft configuration that is not deployed to the \
         associated environment but is in the process of deploying.\n\
        \           \n\
        \            }\n\
        \       {-   [deployed]: This is the configuration that is currently deployed to the \
         associated running environment.\n\
        \           \n\
        \            }\n\
        \       {-   [failed]: This is a draft configuration that failed to successfully deploy.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  environment_name : environment_name option;
      [@ocaml.doc " If not [null], the name of the environment for this configuration set. \n"]
  description : description option; [@ocaml.doc "Describes this configuration set.\n"]
  template_name : configuration_template_name option;
      [@ocaml.doc
        " If not [null], the name of the configuration template for this configuration set. \n"]
  application_name : application_name option;
      [@ocaml.doc "The name of the application associated with this configuration set.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc "The name of the solution stack this configuration set uses.\n"]
}
[@@ocaml.doc "Describes the settings for a configuration set.\n"]

type nonrec update_application_version_message = {
  description : description option; [@ocaml.doc "A new description for this version.\n"]
  version_label : version_label;
      [@ocaml.doc
        "The name of the version to update.\n\n\
        \ If no application version is found with this label, [UpdateApplication] returns an \
         [InvalidParameterValue] error. \n\
        \ "]
  application_name : application_name;
      [@ocaml.doc
        "The name of the application associated with this version.\n\n\
        \  If no application is found with this name, [UpdateApplication] returns an \
         [InvalidParameterValue] error.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec application_version_arn = string [@@ocaml.doc ""]

type nonrec source_type = Zip [@ocaml.doc ""] | Git [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec source_repository = S3 [@ocaml.doc ""] | CodeCommit [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec source_location = string [@@ocaml.doc ""]

type nonrec source_build_information = {
  source_location : source_location;
      [@ocaml.doc
        "The location of the source code, as a formatted string, depending on the value of \
         [SourceRepository] \n\n\
        \ {ul\n\
        \       {-  For [CodeCommit], the format is the repository name and commit ID, separated \
         by a forward slash. For example, [my-git-repo/265cfa0cf6af46153527f55d6503ec030551f57a].\n\
        \           \n\
        \            }\n\
        \       {-  For [S3], the format is the S3 bucket name and object key, separated by a \
         forward slash. For example, [my-s3-bucket/Folders/my-source-file].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  source_repository : source_repository;
      [@ocaml.doc
        "Location where the repository is stored.\n\n\
        \ {ul\n\
        \       {-   [CodeCommit] \n\
        \           \n\
        \            }\n\
        \       {-   [S3] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  source_type : source_type;
      [@ocaml.doc
        "The type of repository.\n\n\
        \ {ul\n\
        \       {-   [Git] \n\
        \           \n\
        \            }\n\
        \       {-   [Zip] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Location of the source code for an application version.\n"]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_location = {
  s3_key : s3_key option; [@ocaml.doc "The Amazon S3 key where the data is located.\n"]
  s3_bucket : s3_bucket option; [@ocaml.doc "The Amazon S3 bucket where the data is located.\n"]
}
[@@ocaml.doc "The bucket and key of an item stored in Amazon S3.\n"]

type nonrec application_version_status =
  | Building [@ocaml.doc ""]
  | Processing [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Unprocessed [@ocaml.doc ""]
  | Processed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec application_version_description = {
  status : application_version_status option;
      [@ocaml.doc
        "The processing status of the application version. Reflects the state of the application \
         version during its creation. Many of the values are only applicable if you specified \
         [True] for the [Process] parameter of the [CreateApplicationVersion] action. The \
         following list describes the possible values.\n\n\
        \ {ul\n\
        \       {-   [Unprocessed] \226\128\147 Application version wasn't pre-processed or \
         validated. Elastic Beanstalk will validate configuration files during deployment of the \
         application version to an environment.\n\
        \           \n\
        \            }\n\
        \       {-   [Processing] \226\128\147 Elastic Beanstalk is currently processing the \
         application version.\n\
        \           \n\
        \            }\n\
        \       {-   [Building] \226\128\147 Application version is currently undergoing an AWS \
         CodeBuild build.\n\
        \           \n\
        \            }\n\
        \       {-   [Processed] \226\128\147 Elastic Beanstalk was successfully pre-processed and \
         validated.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] \226\128\147 Either the AWS CodeBuild build failed or configuration \
         files didn't pass validation. This application version isn't usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  date_updated : update_date option;
      [@ocaml.doc "The last modified date of the application version.\n"]
  date_created : creation_date option;
      [@ocaml.doc "The creation date of the application version.\n"]
  source_bundle : s3_location option;
      [@ocaml.doc "The storage location of the application version's source bundle in Amazon S3.\n"]
  build_arn : string_ option;
      [@ocaml.doc "Reference to the artifact from the AWS CodeBuild build.\n"]
  source_build_information : source_build_information option;
      [@ocaml.doc
        "If the version's source code was retrieved from AWS CodeCommit, the location of the \
         source code for the application version.\n"]
  version_label : version_label option;
      [@ocaml.doc "A unique identifier for the application version.\n"]
  description : description option; [@ocaml.doc "The description of the application version.\n"]
  application_name : application_name option;
      [@ocaml.doc "The name of the application to which the application version belongs.\n"]
  application_version_arn : application_version_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the application version.\n"]
}
[@@ocaml.doc "Describes the properties of an application version.\n"]

type nonrec application_version_description_message = {
  application_version : application_version_description option;
      [@ocaml.doc " The [ApplicationVersionDescription] of the application version. \n"]
}
[@@ocaml.doc "Result message wrapping a single description of an application version.\n"]

type nonrec boxed_boolean = bool [@@ocaml.doc ""]

type nonrec boxed_int = int [@@ocaml.doc ""]

type nonrec max_count_rule = {
  delete_source_from_s3 : boxed_boolean option;
      [@ocaml.doc
        "Set to [true] to delete a version's source bundle from Amazon S3 when Elastic Beanstalk \
         deletes the application version.\n"]
  max_count : boxed_int option;
      [@ocaml.doc "Specify the maximum number of application versions to retain.\n"]
  enabled : boxed_boolean;
      [@ocaml.doc "Specify [true] to apply the rule, or [false] to disable it.\n"]
}
[@@ocaml.doc
  "A lifecycle rule that deletes the oldest application version when the maximum count is exceeded.\n"]

type nonrec max_age_rule = {
  delete_source_from_s3 : boxed_boolean option;
      [@ocaml.doc
        "Set to [true] to delete a version's source bundle from Amazon S3 when Elastic Beanstalk \
         deletes the application version.\n"]
  max_age_in_days : boxed_int option;
      [@ocaml.doc "Specify the number of days to retain an application versions.\n"]
  enabled : boxed_boolean;
      [@ocaml.doc "Specify [true] to apply the rule, or [false] to disable it.\n"]
}
[@@ocaml.doc
  "A lifecycle rule that deletes application versions after the specified number of days.\n"]

type nonrec application_version_lifecycle_config = {
  max_age_rule : max_age_rule option;
      [@ocaml.doc
        "Specify a max age rule to restrict the length of time that application versions are \
         retained for an application.\n"]
  max_count_rule : max_count_rule option;
      [@ocaml.doc
        "Specify a max count rule to restrict the number of application versions that are retained \
         for an application.\n"]
}
[@@ocaml.doc
  "The application version lifecycle settings for an application. Defines the rules that Elastic \
   Beanstalk applies to an application's versions in order to avoid hitting the per-region limit \
   for application versions.\n\n\
  \ When Elastic Beanstalk deletes an application version from its database, you can no longer \
   deploy that version to an environment. The source bundle remains in S3 unless you configure the \
   rule to delete it.\n\
  \ "]

type nonrec application_resource_lifecycle_config = {
  version_lifecycle_config : application_version_lifecycle_config option;
      [@ocaml.doc "Defines lifecycle settings for application versions.\n"]
  service_role : string_ option;
      [@ocaml.doc
        "The ARN of an IAM service role that Elastic Beanstalk has permission to assume.\n\n\
        \ The [ServiceRole] property is required the first time that you provide a \
         [VersionLifecycleConfig] for the application in one of the supporting calls \
         ([CreateApplication] or [UpdateApplicationResourceLifecycle]). After you provide it once, \
         in either one of the calls, Elastic Beanstalk persists the Service Role with the \
         application, and you don't need to specify it again in subsequent \
         [UpdateApplicationResourceLifecycle] calls. You can, however, specify it in subsequent \
         calls to change the Service Role to another value.\n\
        \ "]
}
[@@ocaml.doc
  "The resource lifecycle configuration for an application. Defines lifecycle settings for \
   resources that belong to the application, and the service role that AWS Elastic Beanstalk \
   assumes in order to apply lifecycle settings. The version lifecycle configuration defines \
   lifecycle settings for application versions.\n"]

type nonrec update_application_resource_lifecycle_message = {
  resource_lifecycle_config : application_resource_lifecycle_config;
      [@ocaml.doc "The lifecycle configuration.\n"]
  application_name : application_name; [@ocaml.doc "The name of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec application_resource_lifecycle_description_message = {
  resource_lifecycle_config : application_resource_lifecycle_config option;
      [@ocaml.doc "The lifecycle configuration.\n"]
  application_name : application_name option; [@ocaml.doc "The name of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec update_application_message = {
  description : description option;
      [@ocaml.doc
        "A new description for the application.\n\n\
        \ Default: If not specified, AWS Elastic Beanstalk does not update the description.\n\
        \ "]
  application_name : application_name;
      [@ocaml.doc
        "The name of the application to update. If no such application is found, \
         [UpdateApplication] returns an [InvalidParameterValue] error. \n"]
}
[@@ocaml.doc "Request to update an application.\n"]

type nonrec application_arn = string [@@ocaml.doc ""]

type nonrec configuration_template_names_list = configuration_template_name list [@@ocaml.doc ""]

type nonrec application_description = {
  resource_lifecycle_config : application_resource_lifecycle_config option;
      [@ocaml.doc "The lifecycle settings for the application.\n"]
  configuration_templates : configuration_template_names_list option;
      [@ocaml.doc "The names of the configuration templates associated with this application.\n"]
  versions : version_labels_list option;
      [@ocaml.doc "The names of the versions for this application.\n"]
  date_updated : update_date option;
      [@ocaml.doc "The date when the application was last modified.\n"]
  date_created : creation_date option; [@ocaml.doc "The date when the application was created.\n"]
  description : description option; [@ocaml.doc "User-defined description of the application.\n"]
  application_name : application_name option; [@ocaml.doc "The name of the application.\n"]
  application_arn : application_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]
}
[@@ocaml.doc "Describes the properties of an application.\n"]

type nonrec application_description_message = {
  application : application_description option;
      [@ocaml.doc " The [ApplicationDescription] of the application. \n"]
}
[@@ocaml.doc "Result message containing a single description of an application.\n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec trigger = { name : resource_id option [@ocaml.doc "The name of the trigger.\n"] }
[@@ocaml.doc "Describes a trigger.\n"]

type nonrec trigger_list = trigger list [@@ocaml.doc ""]

type nonrec too_many_platforms_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "You have exceeded the maximum number of allowed platforms associated with the account.\n"]

type nonrec too_many_environments_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "The specified account has reached its limit of environments.\n"]

type nonrec too_many_configuration_templates_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "The specified account has reached its limit of configuration templates.\n"]

type nonrec too_many_applications_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "The specified account has reached its limit of applications.\n"]

type nonrec too_many_application_versions_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "The specified account has reached its limit of application versions.\n"]

type nonrec token = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec time_filter_start = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec time_filter_end = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec terminate_environment_resources = bool [@@ocaml.doc ""]

type nonrec force_terminate = bool [@@ocaml.doc ""]

type nonrec terminate_environment_message = {
  force_terminate : force_terminate option;
      [@ocaml.doc
        "Terminates the target environment even if another environment in the same group is \
         dependent on it.\n"]
  terminate_resources : terminate_environment_resources option;
      [@ocaml.doc
        "Indicates whether the associated AWS resources should shut down when the environment is \
         terminated:\n\n\
        \ {ul\n\
        \       {-   [true]: The specified environment as well as the associated AWS resources, \
         such as Auto Scaling group and LoadBalancer, are terminated.\n\
        \           \n\
        \            }\n\
        \       {-   [false]: AWS Elastic Beanstalk resource management is removed from the \
         environment, but the AWS resources continue to operate.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see the \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/ug/} AWS Elastic Beanstalk User \
         Guide. } \n\
        \   \n\
        \     Default: [true] \n\
        \    \n\
        \      Valid Values: [true] | [false] \n\
        \     "]
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to terminate.\n\n\
        \  Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the environment to terminate.\n\n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
}
[@@ocaml.doc "Request to terminate an environment.\n"]

type nonrec terminate_env_force = bool [@@ocaml.doc ""]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec nullable_double = float [@@ocaml.doc ""]

type nonrec cpu_utilization = {
  privileged : nullable_double option;
      [@ocaml.doc
        "Available on Windows environments only.\n\n\
        \ Percentage of time that the CPU has spent in the [Privileged] state over the last 10 \
         seconds.\n\
        \ "]
  soft_ir_q : nullable_double option;
      [@ocaml.doc
        "Available on Linux environments only.\n\n\
        \ Percentage of time that the CPU has spent in the [SoftIRQ] state over the last 10 seconds.\n\
        \ "]
  ir_q : nullable_double option;
      [@ocaml.doc
        "Available on Linux environments only.\n\n\
        \ Percentage of time that the CPU has spent in the [IRQ] state over the last 10 seconds.\n\
        \ "]
  io_wait : nullable_double option;
      [@ocaml.doc
        "Available on Linux environments only.\n\n\
        \ Percentage of time that the CPU has spent in the [I/O Wait] state over the last 10 \
         seconds.\n\
        \ "]
  idle : nullable_double option;
      [@ocaml.doc
        "Percentage of time that the CPU has spent in the [Idle] state over the last 10 seconds.\n"]
  system : nullable_double option;
      [@ocaml.doc
        "Available on Linux environments only.\n\n\
        \ Percentage of time that the CPU has spent in the [System] state over the last 10 seconds.\n\
        \ "]
  nice : nullable_double option;
      [@ocaml.doc
        "Available on Linux environments only.\n\n\
        \ Percentage of time that the CPU has spent in the [Nice] state over the last 10 seconds.\n\
        \ "]
  user : nullable_double option;
      [@ocaml.doc
        "Percentage of time that the CPU has spent in the [User] state over the last 10 seconds.\n"]
}
[@@ocaml.doc "CPU utilization metrics for an instance.\n"]

type nonrec load_average_value = float [@@ocaml.doc ""]

type nonrec load_average = load_average_value list [@@ocaml.doc ""]

type nonrec system_status = {
  load_average : load_average option;
      [@ocaml.doc
        "Load average in the last 1-minute, 5-minute, and 15-minute periods. For more information, \
         see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-metrics.html#health-enhanced-metrics-os}Operating \
         System Metrics}.\n"]
  cpu_utilization : cpu_utilization option;
      [@ocaml.doc "CPU utilization metrics for the instance.\n"]
}
[@@ocaml.doc "CPU utilization and load average metrics for an Amazon EC2 instance.\n"]

type nonrec swap_environment_cnam_es_message = {
  destination_environment_name : environment_name option;
      [@ocaml.doc
        "The name of the destination environment.\n\n\
        \  Condition: You must specify at least the [DestinationEnvironmentID] or the \
         [DestinationEnvironmentName]. You may also specify both. You must specify the \
         [SourceEnvironmentName] with the [DestinationEnvironmentName]. \n\
        \ "]
  destination_environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the destination environment.\n\n\
        \  Condition: You must specify at least the [DestinationEnvironmentID] or the \
         [DestinationEnvironmentName]. You may also specify both. You must specify the \
         [SourceEnvironmentId] with the [DestinationEnvironmentId]. \n\
        \ "]
  source_environment_name : environment_name option;
      [@ocaml.doc
        "The name of the source environment.\n\n\
        \  Condition: You must specify at least the [SourceEnvironmentID] or the \
         [SourceEnvironmentName]. You may also specify both. If you specify the \
         [SourceEnvironmentName], you must specify the [DestinationEnvironmentName]. \n\
        \ "]
  source_environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the source environment.\n\n\
        \  Condition: You must specify at least the [SourceEnvironmentID] or the \
         [SourceEnvironmentName]. You may also specify both. If you specify the \
         [SourceEnvironmentId], you must specify the [DestinationEnvironmentId]. \n\
        \ "]
}
[@@ocaml.doc "Swaps the CNAMEs of two environments.\n"]

type nonrec supported_tier = string [@@ocaml.doc ""]

type nonrec supported_tier_list = supported_tier list [@@ocaml.doc ""]

type nonrec supported_addon = string [@@ocaml.doc ""]

type nonrec supported_addon_list = supported_addon list [@@ocaml.doc ""]

type nonrec nullable_integer = int [@@ocaml.doc ""]

type nonrec status_codes = {
  status5xx : nullable_integer option;
      [@ocaml.doc
        "The percentage of requests over the last 10 seconds that resulted in a 5xx (500, 501, \
         etc.) status code.\n"]
  status4xx : nullable_integer option;
      [@ocaml.doc
        "The percentage of requests over the last 10 seconds that resulted in a 4xx (400, 401, \
         etc.) status code.\n"]
  status3xx : nullable_integer option;
      [@ocaml.doc
        "The percentage of requests over the last 10 seconds that resulted in a 3xx (300, 301, \
         etc.) status code.\n"]
  status2xx : nullable_integer option;
      [@ocaml.doc
        "The percentage of requests over the last 10 seconds that resulted in a 2xx (200, 201, \
         etc.) status code.\n"]
}
[@@ocaml.doc
  "Represents the percentage of requests over the last 10 seconds that resulted in each type of \
   status code response. For more information, see \
   {{:http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html}Status Code Definitions}.\n"]

type nonrec source_configuration = {
  template_name : configuration_template_name option;
      [@ocaml.doc "The name of the configuration template.\n"]
  application_name : application_name option;
      [@ocaml.doc "The name of the application associated with the configuration.\n"]
}
[@@ocaml.doc "A specification for an environment configuration.\n"]

type nonrec source_bundle_deletion_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "Unable to delete the Amazon S3 source bundle associated with the application version. The \
   application version was deleted successfully.\n"]

type nonrec file_type_extension = string [@@ocaml.doc ""]

type nonrec solution_stack_file_type_list = file_type_extension list [@@ocaml.doc ""]

type nonrec solution_stack_description = {
  permitted_file_types : solution_stack_file_type_list option;
      [@ocaml.doc "The permitted file types allowed for a solution stack.\n"]
  solution_stack_name : solution_stack_name option; [@ocaml.doc "The name of the solution stack.\n"]
}
[@@ocaml.doc "Describes the solution stack.\n"]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec cause = string [@@ocaml.doc ""]

type nonrec causes = cause list [@@ocaml.doc ""]

type nonrec launched_at = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec request_count = int [@@ocaml.doc ""]

type nonrec latency = {
  p10 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 90 percent of requests over the last 10 seconds.\n"]
  p50 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 50 percent of requests over the last 10 seconds.\n"]
  p75 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 25 percent of requests over the last 10 seconds.\n"]
  p85 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 15 percent of requests over the last 10 seconds.\n"]
  p90 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 10 percent of requests over the last 10 seconds.\n"]
  p95 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 5 percent of requests over the last 10 seconds.\n"]
  p99 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 1 percent of requests over the last 10 seconds.\n"]
  p999 : nullable_double option;
      [@ocaml.doc
        "The average latency for the slowest 0.1 percent of requests over the last 10 seconds.\n"]
}
[@@ocaml.doc
  "Represents the average latency for the slowest X percent of requests over the last 10 seconds.\n"]

type nonrec application_metrics = {
  latency : latency option;
      [@ocaml.doc
        "Represents the average latency for the slowest X percent of requests over the last 10 \
         seconds. Latencies are in seconds with one millisecond resolution.\n"]
  status_codes : status_codes option;
      [@ocaml.doc
        "Represents the percentage of requests over the last 10 seconds that resulted in each type \
         of status code response.\n"]
  request_count : request_count option;
      [@ocaml.doc
        "Average number of requests handled by the web server per second over the last 10 seconds.\n"]
  duration : nullable_integer option;
      [@ocaml.doc
        "The amount of time that the metrics cover (usually 10 seconds). For example, you might \
         have 5 requests ([request_count]) within the most recent time slice of 10 seconds \
         ([duration]).\n"]
}
[@@ocaml.doc "Application request metrics for an AWS Elastic Beanstalk environment.\n"]

type nonrec nullable_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec deployment_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec deployment = {
  deployment_time : deployment_timestamp option;
      [@ocaml.doc
        "For in-progress deployments, the time that the deployment started.\n\n\
        \ For completed deployments, the time that the deployment ended.\n\
        \ "]
  status : string_ option;
      [@ocaml.doc
        "The status of the deployment:\n\n\
        \ {ul\n\
        \       {-   [In Progress] : The deployment is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [Deployed] : The deployment succeeded.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] : The deployment failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  deployment_id : nullable_long option;
      [@ocaml.doc
        "The ID of the deployment. This number increases by one each time that you deploy source \
         code or change instance configuration settings.\n"]
  version_label : string_ option;
      [@ocaml.doc "The version label of the application version in the deployment.\n"]
}
[@@ocaml.doc "Information about an application version deployment.\n"]

type nonrec single_instance_health = {
  instance_type : string_ option; [@ocaml.doc "The instance's type.\n"]
  availability_zone : string_ option;
      [@ocaml.doc "The availability zone in which the instance runs.\n"]
  deployment : deployment option;
      [@ocaml.doc "Information about the most recent deployment to an instance.\n"]
  system : system_status option; [@ocaml.doc "Operating system metrics from the instance.\n"]
  application_metrics : application_metrics option;
      [@ocaml.doc "Request metrics from your application.\n"]
  launched_at : launched_at option;
      [@ocaml.doc "The time at which the EC2 instance was launched.\n"]
  causes : causes option;
      [@ocaml.doc
        "Represents the causes, which provide more information about the current health status.\n"]
  color : string_ option;
      [@ocaml.doc
        "Represents the color indicator that gives you information about the health of the EC2 \
         instance. For more information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html}Health \
         Colors and Statuses}.\n"]
  health_status : string_ option;
      [@ocaml.doc
        "Returns the health status of the specified instance. For more information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html}Health \
         Colors and Statuses}.\n"]
  instance_id : instance_id option; [@ocaml.doc "The ID of the Amazon EC2 instance.\n"]
}
[@@ocaml.doc
  "Detailed health information about an Amazon EC2 instance in your Elastic Beanstalk environment.\n"]

type nonrec search_filter_attribute = string [@@ocaml.doc ""]

type nonrec search_filter_operator = string [@@ocaml.doc ""]

type nonrec search_filter_value = string [@@ocaml.doc ""]

type nonrec search_filter_values = search_filter_value list [@@ocaml.doc ""]

type nonrec search_filter = {
  values : search_filter_values option;
      [@ocaml.doc
        "The list of values applied to the [Attribute] and [Operator] attributes. Number of values \
         and valid values vary by [Attribute].\n"]
  operator : search_filter_operator option;
      [@ocaml.doc
        "The operator to apply to the [Attribute] with each of the [Values]. Valid values vary by \
         [Attribute].\n"]
  attribute : search_filter_attribute option;
      [@ocaml.doc
        "The result attribute to which the filter values are applied. Valid values vary by API \
         action.\n"]
}
[@@ocaml.doc
  "Describes criteria to restrict a list of results.\n\n\
  \ For operators that apply a single value to the attribute, the filter is evaluated as follows: \
   [Attribute Operator Values\\[1\\]] \n\
  \ \n\
  \  Some operators, e.g. [in], can apply multiple values. In this case, the filter is evaluated \
   as a logical union (OR) of applications of the operator to the attribute with each one of the \
   values: [(Attribute Operator Values\\[1\\]) OR (Attribute Operator Values\\[2\\])\n\
  \        OR ...] \n\
  \  \n\
  \   The valid values for attributes of [SearchFilter] depend on the API action. For valid \
   values, see the reference page for the API action you're calling that takes a [SearchFilter] \
   parameter.\n\
  \   "]

type nonrec search_filters = search_filter list [@@ocaml.doc ""]

type nonrec sample_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec s3_subscription_required_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "The specified account does not have a subscription to Amazon S3.\n"]

type nonrec s3_location_not_in_service_region_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "The specified S3 bucket does not belong to the S3 region in which the service is running. The \
   following regions are supported:\n\n\
  \ {ul\n\
  \       {-  IAD/us-east-1\n\
  \           \n\
  \            }\n\
  \       {-  PDX/us-west-2\n\
  \           \n\
  \            }\n\
  \       {-  DUB/eu-west-1\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec environment_info_type =
  | Analyze [@ocaml.doc ""]
  | Bundle [@ocaml.doc ""]
  | Tail [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ec2_instance_id = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec environment_info_description = {
  message : message option;
      [@ocaml.doc
        "The retrieved information. Currently contains a presigned Amazon S3 URL. The files are \
         deleted after 15 minutes.\n\n\
        \ Anyone in possession of this URL can access the files before they are deleted. Make the \
         URL available only to trusted parties.\n\
        \ "]
  sample_timestamp : sample_timestamp option;
      [@ocaml.doc "The time stamp when this information was retrieved.\n"]
  ec2_instance_id : ec2_instance_id option;
      [@ocaml.doc "The Amazon EC2 Instance ID for this information.\n"]
  info_type : environment_info_type option; [@ocaml.doc "The type of information retrieved.\n"]
}
[@@ocaml.doc "The information retrieved from the Amazon EC2 instances.\n"]

type nonrec environment_info_description_list = environment_info_description list [@@ocaml.doc ""]

type nonrec retrieve_environment_info_result_message = {
  environment_info : environment_info_description_list option;
      [@ocaml.doc " The [EnvironmentInfoDescription] of the environment. \n"]
}
[@@ocaml.doc "Result message containing a description of the requested environment info.\n"]

type nonrec retrieve_environment_info_message = {
  info_type : environment_info_type; [@ocaml.doc "The type of information to retrieve.\n"]
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the data's environment.\n\n\
        \  If no such environment is found, returns an [InvalidParameterValue] error. \n\
        \ \n\
        \   Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \  "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the data's environment.\n\n\
        \ If no such environment is found, returns an [InvalidParameterValue] error.\n\
        \ \n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error.\n\
        \  "]
}
[@@ocaml.doc "Request to download logs retrieved with [RequestEnvironmentInfo].\n"]

type nonrec restart_app_server_message = {
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to restart the server for.\n\n\
        \  Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the environment to restart the server for.\n\n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec resource_tags_description_message = {
  resource_tags : tag_list option; [@ocaml.doc "A list of tag key-value pairs.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which a tag list was requested.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_quota = {
  maximum : boxed_int option;
      [@ocaml.doc
        "The maximum number of instances of this Elastic Beanstalk resource type that an AWS \
         account can use.\n"]
}
[@@ocaml.doc
  "The AWS Elastic Beanstalk quota information for a single resource type in an AWS account. It \
   reflects the resource's limits for this account.\n"]

type nonrec resource_quotas = {
  custom_platform_quota : resource_quota option;
      [@ocaml.doc "The quota for custom platforms in the AWS account.\n"]
  configuration_template_quota : resource_quota option;
      [@ocaml.doc "The quota for configuration templates in the AWS account.\n"]
  environment_quota : resource_quota option;
      [@ocaml.doc "The quota for environments in the AWS account.\n"]
  application_version_quota : resource_quota option;
      [@ocaml.doc "The quota for application versions in the AWS account.\n"]
  application_quota : resource_quota option;
      [@ocaml.doc "The quota for applications in the AWS account.\n"]
}
[@@ocaml.doc
  "A set of per-resource AWS Elastic Beanstalk quotas associated with an AWS account. They reflect \
   Elastic Beanstalk resource limits for this account.\n"]

type nonrec request_id = string [@@ocaml.doc ""]

type nonrec request_environment_info_message = {
  info_type : environment_info_type; [@ocaml.doc "The type of information to request.\n"]
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment of the requested data.\n\n\
        \ If no such environment is found, [RequestEnvironmentInfo] returns an \
         [InvalidParameterValue] error. \n\
        \ \n\
        \  Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \  "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the environment of the requested data.\n\n\
        \ If no such environment is found, [RequestEnvironmentInfo] returns an \
         [InvalidParameterValue] error. \n\
        \ \n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \  "]
}
[@@ocaml.doc
  "Request to retrieve logs from an environment and store them in your Elastic Beanstalk storage \
   bucket.\n"]

type nonrec regex_pattern = string [@@ocaml.doc ""]

type nonrec regex_label = string [@@ocaml.doc ""]

type nonrec refreshed_at = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec rebuild_environment_message = {
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to rebuild.\n\n\
        \  Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the environment to rebuild.\n\n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec queue = {
  ur_l : string_ option; [@ocaml.doc "The URL of the queue.\n"]
  name : string_ option; [@ocaml.doc "The name of the queue.\n"]
}
[@@ocaml.doc "Describes a queue.\n"]

type nonrec queue_list = queue list [@@ocaml.doc ""]

type nonrec platform_version_still_referenced_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "You cannot delete the platform version because there are still environments running on it.\n"]

type nonrec platform_version = string [@@ocaml.doc ""]

type nonrec platform_owner = string [@@ocaml.doc ""]

type nonrec platform_status =
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Ready [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec platform_category = string [@@ocaml.doc ""]

type nonrec operating_system_name = string [@@ocaml.doc ""]

type nonrec operating_system_version = string [@@ocaml.doc ""]

type nonrec platform_lifecycle_state = string [@@ocaml.doc ""]

type nonrec branch_name = string [@@ocaml.doc ""]

type nonrec platform_branch_lifecycle_state = string [@@ocaml.doc ""]

type nonrec platform_summary = {
  platform_branch_lifecycle_state : platform_branch_lifecycle_state option;
      [@ocaml.doc
        "The state of the platform version's branch in its lifecycle.\n\n\
        \ Possible values: [beta] | [supported] | [deprecated] | [retired] \n\
        \ "]
  platform_branch_name : branch_name option;
      [@ocaml.doc "The platform branch to which the platform version belongs.\n"]
  platform_version : platform_version option;
      [@ocaml.doc "The version string of the platform version.\n"]
  platform_lifecycle_state : platform_lifecycle_state option;
      [@ocaml.doc
        "The state of the platform version in its lifecycle.\n\n\
        \ Possible values: [recommended] | empty\n\
        \ \n\
        \  If an empty value is returned, the platform version is supported but isn't the \
         recommended one for its branch.\n\
        \  "]
  supported_addon_list : supported_addon_list option;
      [@ocaml.doc "The additions associated with the platform version.\n"]
  supported_tier_list : supported_tier_list option;
      [@ocaml.doc "The tiers in which the platform version runs.\n"]
  operating_system_version : operating_system_version option;
      [@ocaml.doc "The version of the operating system used by the platform version.\n"]
  operating_system_name : operating_system_name option;
      [@ocaml.doc "The operating system used by the platform version.\n"]
  platform_category : platform_category option; [@ocaml.doc "The category of platform version.\n"]
  platform_status : platform_status option;
      [@ocaml.doc
        "The status of the platform version. You can create an environment from the platform \
         version once it is ready.\n"]
  platform_owner : platform_owner option;
      [@ocaml.doc "The AWS account ID of the person who created the platform version.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
}
[@@ocaml.doc "Summary information about a platform version.\n"]

type nonrec platform_summary_list = platform_summary list [@@ocaml.doc ""]

type nonrec platform_programming_language = {
  version : string_ option; [@ocaml.doc "The version of the programming language.\n"]
  name : string_ option; [@ocaml.doc "The name of the programming language.\n"]
}
[@@ocaml.doc "A programming language supported by the platform.\n"]

type nonrec platform_programming_languages = platform_programming_language list [@@ocaml.doc ""]

type nonrec platform_name = string [@@ocaml.doc ""]

type nonrec platform_max_records = int [@@ocaml.doc ""]

type nonrec platform_framework = {
  version : string_ option; [@ocaml.doc "The version of the framework.\n"]
  name : string_ option; [@ocaml.doc "The name of the framework.\n"]
}
[@@ocaml.doc "A framework supported by the platform.\n"]

type nonrec platform_frameworks = platform_framework list [@@ocaml.doc ""]

type nonrec platform_filter_type = string [@@ocaml.doc ""]

type nonrec platform_filter_operator = string [@@ocaml.doc ""]

type nonrec platform_filter_value = string [@@ocaml.doc ""]

type nonrec platform_filter_value_list = platform_filter_value list [@@ocaml.doc ""]

type nonrec platform_filter = {
  values : platform_filter_value_list option;
      [@ocaml.doc
        "The list of values applied to the filtering platform version attribute. Only one value is \
         supported for all current operators.\n\n\
        \ The following list shows valid filter values for some filter attributes.\n\
        \ \n\
        \  {ul\n\
        \        {-   [PlatformStatus]: [Creating] | [Failed] | [Ready] | [Deleting] | [Deleted] \n\
        \            \n\
        \             }\n\
        \        {-   [PlatformLifecycleState]: [recommended] \n\
        \            \n\
        \             }\n\
        \        {-   [SupportedTier]: [WebServer/Standard] | [Worker/SQS/HTTP] \n\
        \            \n\
        \             }\n\
        \        {-   [SupportedAddon]: [Log/S3] | [Monitoring/Healthd] | [WorkerDaemon/SQSD] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  operator : platform_filter_operator option;
      [@ocaml.doc
        "The operator to apply to the [Type] with each of the [Values].\n\n\
        \ Valid values: [=] | [!=] | [<] | [<=] | [>] | [>=] | [contains] | [begins_with] | \
         [ends_with] \n\
        \ "]
  type_ : platform_filter_type option;
      [@ocaml.doc
        "The platform version attribute to which the filter values are applied.\n\n\
        \ Valid values: [PlatformName] | [PlatformVersion] | [PlatformStatus] | \
         [PlatformBranchName] | [PlatformLifecycleState] | [PlatformOwner] | [SupportedTier] | \
         [SupportedAddon] | [ProgrammingLanguageName] | [OperatingSystemName] \n\
        \ "]
}
[@@ocaml.doc
  "Describes criteria to restrict the results when listing platform versions.\n\n\
  \ The filter is evaluated as follows: [Type Operator Values\\[1\\]] \n\
  \ "]

type nonrec platform_filters = platform_filter list [@@ocaml.doc ""]

type nonrec maintainer = string [@@ocaml.doc ""]

type nonrec image_id = string [@@ocaml.doc ""]

type nonrec custom_ami = {
  image_id : image_id option; [@ocaml.doc "THe ID of the image used to create the custom AMI.\n"]
  virtualization_type : virtualization_type option;
      [@ocaml.doc "The type of virtualization used to create the custom AMI.\n"]
}
[@@ocaml.doc "A custom AMI available to platforms.\n"]

type nonrec custom_ami_list = custom_ami list [@@ocaml.doc ""]

type nonrec platform_description = {
  platform_branch_lifecycle_state : platform_branch_lifecycle_state option;
      [@ocaml.doc
        "The state of the platform version's branch in its lifecycle.\n\n\
        \ Possible values: [Beta] | [Supported] | [Deprecated] | [Retired] \n\
        \ "]
  platform_branch_name : branch_name option;
      [@ocaml.doc "The platform branch to which the platform version belongs.\n"]
  platform_lifecycle_state : platform_lifecycle_state option;
      [@ocaml.doc
        "The state of the platform version in its lifecycle.\n\n\
        \ Possible values: [Recommended] | [null] \n\
        \ \n\
        \  If a null value is returned, the platform version isn't the recommended one for its \
         branch. Each platform branch has a single recommended platform version, typically the \
         most recent one.\n\
        \  "]
  supported_addon_list : supported_addon_list option;
      [@ocaml.doc "The additions supported by the platform version.\n"]
  supported_tier_list : supported_tier_list option;
      [@ocaml.doc "The tiers supported by the platform version.\n"]
  custom_ami_list : custom_ami_list option;
      [@ocaml.doc "The custom AMIs supported by the platform version.\n"]
  frameworks : platform_frameworks option;
      [@ocaml.doc "The frameworks supported by the platform version.\n"]
  programming_languages : platform_programming_languages option;
      [@ocaml.doc "The programming languages supported by the platform version.\n"]
  operating_system_version : operating_system_version option;
      [@ocaml.doc "The version of the operating system used by the platform version.\n"]
  operating_system_name : operating_system_name option;
      [@ocaml.doc "The operating system used by the platform version.\n"]
  maintainer : maintainer option;
      [@ocaml.doc "Information about the maintainer of the platform version.\n"]
  description : description option; [@ocaml.doc "The description of the platform version.\n"]
  platform_category : platform_category option;
      [@ocaml.doc "The category of the platform version.\n"]
  date_updated : update_date option;
      [@ocaml.doc "The date when the platform version was last updated.\n"]
  date_created : creation_date option;
      [@ocaml.doc "The date when the platform version was created.\n"]
  platform_status : platform_status option; [@ocaml.doc "The status of the platform version.\n"]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc "The name of the solution stack used by the platform version.\n"]
  platform_version : platform_version option; [@ocaml.doc "The version of the platform version.\n"]
  platform_name : platform_name option; [@ocaml.doc "The name of the platform version.\n"]
  platform_owner : platform_owner option;
      [@ocaml.doc "The AWS account ID of the person who created the platform version.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
}
[@@ocaml.doc "Detailed information about a platform version.\n"]

type nonrec branch_order = int [@@ocaml.doc ""]

type nonrec platform_branch_summary = {
  supported_tier_list : supported_tier_list option;
      [@ocaml.doc
        "The environment tiers that platform versions in this branch support.\n\n\
        \ Possible values: [WebServer/Standard] | [Worker/SQS/HTTP] \n\
        \ "]
  branch_order : branch_order option;
      [@ocaml.doc
        "An ordinal number that designates the order in which platform branches have been added to \
         a platform. This can be helpful, for example, if your code calls the \
         [ListPlatformBranches] action and then displays a list of platform branches.\n\n\
        \ A larger [BranchOrder] value designates a newer platform branch within the platform.\n\
        \ "]
  lifecycle_state : platform_branch_lifecycle_state option;
      [@ocaml.doc
        "The support life cycle state of the platform branch.\n\n\
        \ Possible values: [beta] | [supported] | [deprecated] | [retired] \n\
        \ "]
  branch_name : branch_name option; [@ocaml.doc "The name of the platform branch.\n"]
  platform_name : platform_name option;
      [@ocaml.doc "The name of the platform to which this platform branch belongs.\n"]
}
[@@ocaml.doc "Summary information about a platform branch.\n"]

type nonrec platform_branch_summary_list = platform_branch_summary list [@@ocaml.doc ""]

type nonrec platform_branch_max_records = int [@@ocaml.doc ""]

type nonrec option_restriction_regex = {
  label : regex_label option; [@ocaml.doc "A unique name representing this regular expression.\n"]
  pattern : regex_pattern option;
      [@ocaml.doc
        "The regular expression pattern that a string configuration option value with this \
         restriction must match.\n"]
}
[@@ocaml.doc
  "A regular expression representing a restriction on a string configuration option value.\n"]

type nonrec option_restriction_min_value = int [@@ocaml.doc ""]

type nonrec option_restriction_max_value = int [@@ocaml.doc ""]

type nonrec option_restriction_max_length = int [@@ocaml.doc ""]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_records = int [@@ocaml.doc ""]

type nonrec action_type =
  | Unknown [@ocaml.doc ""]
  | PlatformUpdate [@ocaml.doc ""]
  | InstanceRefresh [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_status =
  | Unknown [@ocaml.doc ""]
  | Running [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Scheduled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_action = {
  window_start_time : timestamp option;
      [@ocaml.doc
        "The start time of the maintenance window in which the managed action will execute.\n"]
  status : action_status option;
      [@ocaml.doc
        "The status of the managed action. If the action is [Scheduled], you can apply it \
         immediately with [ApplyEnvironmentManagedAction].\n"]
  action_type : action_type option; [@ocaml.doc "The type of managed action.\n"]
  action_description : string_ option; [@ocaml.doc "A description of the managed action.\n"]
  action_id : string_ option; [@ocaml.doc "A unique identifier for the managed action.\n"]
}
[@@ocaml.doc "The record of an upcoming or in-progress managed action.\n"]

type nonrec managed_actions = managed_action list [@@ocaml.doc ""]

type nonrec managed_action_invalid_state_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "Cannot modify the managed action in its current state.\n"]

type nonrec managed_action_history_max_items = int [@@ocaml.doc ""]

type nonrec failure_type =
  | PermissionsError [@ocaml.doc ""]
  | InvalidEnvironmentState [@ocaml.doc ""]
  | InternalFailure [@ocaml.doc ""]
  | RollbackSuccessful [@ocaml.doc ""]
  | RollbackFailed [@ocaml.doc ""]
  | CancellationFailed [@ocaml.doc ""]
  | UpdateCancelled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_history_status =
  | Unknown [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Completed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_action_history_item = {
  finished_time : timestamp option;
      [@ocaml.doc "The date and time that the action finished executing.\n"]
  executed_time : timestamp option;
      [@ocaml.doc "The date and time that the action started executing.\n"]
  failure_description : string_ option;
      [@ocaml.doc "If the action failed, a description of the failure.\n"]
  status : action_history_status option; [@ocaml.doc "The status of the action.\n"]
  failure_type : failure_type option; [@ocaml.doc "If the action failed, the type of failure.\n"]
  action_description : string_ option; [@ocaml.doc "A description of the managed action.\n"]
  action_type : action_type option; [@ocaml.doc "The type of the managed action.\n"]
  action_id : string_ option; [@ocaml.doc "A unique identifier for the managed action.\n"]
}
[@@ocaml.doc "The record of a completed or failed managed action.\n"]

type nonrec managed_action_history_items = managed_action_history_item list [@@ocaml.doc ""]

type nonrec load_balancer = {
  name : resource_id option; [@ocaml.doc "The name of the LoadBalancer.\n"]
}
[@@ocaml.doc "Describes a LoadBalancer.\n"]

type nonrec load_balancer_list = load_balancer list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_message = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resouce for which a tag list is requested.\n\n\
        \ Must be the ARN of an Elastic Beanstalk resource.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_platform_versions_result = {
  next_token : token option;
      [@ocaml.doc
        "In a paginated request, if this value isn't [null], it's the token that you can pass in a \
         subsequent request to get the next response page.\n"]
  platform_summary_list : platform_summary_list option;
      [@ocaml.doc "Summary information about the platform versions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_platform_versions_request = {
  next_token : token option;
      [@ocaml.doc
        "For a paginated request. Specify a token from a previous response page to retrieve the \
         next response page. All other parameter values must be identical to the ones specified in \
         the initial request.\n\n\
        \ If no [NextToken] is specified, the first page is retrieved.\n\
        \ "]
  max_records : platform_max_records option;
      [@ocaml.doc "The maximum number of platform version values returned in one call.\n"]
  filters : platform_filters option;
      [@ocaml.doc
        "Criteria for restricting the resulting list of platform versions. The filter is \
         interpreted as a logical conjunction (AND) of the separate [PlatformFilter] terms.\n"]
}
[@@ocaml.doc ""]

type nonrec elastic_beanstalk_service_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "A generic service exception has occurred.\n"]

type nonrec list_platform_branches_result = {
  next_token : token option;
      [@ocaml.doc
        "In a paginated request, if this value isn't [null], it's the token that you can pass in a \
         subsequent request to get the next response page.\n"]
  platform_branch_summary_list : platform_branch_summary_list option;
      [@ocaml.doc "Summary information about the platform branches.\n"]
}
[@@ocaml.doc ""]

type nonrec list_platform_branches_request = {
  next_token : token option;
      [@ocaml.doc
        "For a paginated request. Specify a token from a previous response page to retrieve the \
         next response page. All other parameter values must be identical to the ones specified in \
         the initial request.\n\n\
        \ If no [NextToken] is specified, the first page is retrieved.\n\
        \ "]
  max_records : platform_branch_max_records option;
      [@ocaml.doc "The maximum number of platform branch values returned in one call.\n"]
  filters : search_filters option;
      [@ocaml.doc
        "Criteria for restricting the resulting list of platform branches. The filter is evaluated \
         as a logical conjunction (AND) of the separate [SearchFilter] terms.\n\n\
        \ The following list shows valid attribute values for each of the [SearchFilter] terms. \
         Most operators take a single value. The [in] and [not_in] operators can take multiple \
         values.\n\
        \ \n\
        \  {ul\n\
        \        {-   [Attribute = BranchName]:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [Operator]: [=] | [!=] | [begins_with] | [ends_with] | [contains] \
         | [in] | [not_in] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [Attribute = LifecycleState]:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [Operator]: [=] | [!=] | [in] | [not_in] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [Values]: [beta] | [supported] | [deprecated] | [retired] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [Attribute = PlatformName]:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [Operator]: [=] | [!=] | [begins_with] | [ends_with] | [contains] \
         | [in] | [not_in] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [Attribute = TierType]:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [Operator]: [=] | [!=] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [Values]: [WebServer/Standard] | [Worker/SQS/HTTP] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \   Array size: limited to 10 [SearchFilter] objects.\n\
        \   \n\
        \    Within each [SearchFilter] item, the [Values] array is limited to 10 items.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec available_solution_stack_names_list = solution_stack_name list [@@ocaml.doc ""]

type nonrec available_solution_stack_details_list = solution_stack_description list [@@ocaml.doc ""]

type nonrec list_available_solution_stacks_result_message = {
  solution_stack_details : available_solution_stack_details_list option;
      [@ocaml.doc " A list of available solution stacks and their [SolutionStackDescription]. \n"]
  solution_stacks : available_solution_stack_names_list option;
      [@ocaml.doc "A list of available solution stacks.\n"]
}
[@@ocaml.doc "A list of available AWS Elastic Beanstalk solution stacks.\n"]

type nonrec launch_template = {
  id : resource_id option; [@ocaml.doc "The ID of the launch template.\n"]
}
[@@ocaml.doc "Describes an Amazon EC2 launch template.\n"]

type nonrec launch_template_list = launch_template list [@@ocaml.doc ""]

type nonrec launch_configuration = {
  name : resource_id option; [@ocaml.doc "The name of the launch configuration.\n"]
}
[@@ocaml.doc "Describes an Auto Scaling launch configuration.\n"]

type nonrec launch_configuration_list = launch_configuration list [@@ocaml.doc ""]

type nonrec invalid_request_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc
  "One or more input parameters is not valid. Please correct the input parameters and try the \
   operation again.\n"]

type nonrec instances_health_attribute =
  | All [@ocaml.doc ""]
  | InstanceType [@ocaml.doc ""]
  | AvailabilityZone [@ocaml.doc ""]
  | Deployment [@ocaml.doc ""]
  | System [@ocaml.doc ""]
  | LaunchedAt [@ocaml.doc ""]
  | RefreshedAt [@ocaml.doc ""]
  | ApplicationMetrics [@ocaml.doc ""]
  | Causes [@ocaml.doc ""]
  | Color [@ocaml.doc ""]
  | HealthStatus [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instances_health_attributes = instances_health_attribute list [@@ocaml.doc ""]

type nonrec instance = {
  id : resource_id option; [@ocaml.doc "The ID of the Amazon EC2 instance.\n"]
}
[@@ocaml.doc "The description of an Amazon EC2 instance.\n"]

type nonrec instance_list = instance list [@@ocaml.doc ""]

type nonrec instance_health_summary = {
  severe : nullable_integer option;
      [@ocaml.doc
        " {b Red.} The health agent is reporting a very high number of request failures or other \
         issues for an instance or environment.\n"]
  degraded : nullable_integer option;
      [@ocaml.doc
        " {b Red.} The health agent is reporting a high number of request failures or other issues \
         for an instance or environment.\n"]
  warning : nullable_integer option;
      [@ocaml.doc
        " {b Yellow.} The health agent is reporting a moderate number of request failures or other \
         issues for an instance or environment.\n"]
  info : nullable_integer option;
      [@ocaml.doc " {b Green.} An operation is in progress on an instance.\n"]
  ok : nullable_integer option;
      [@ocaml.doc
        " {b Green.} An instance is passing health checks and the health agent is not reporting \
         any problems.\n"]
  pending : nullable_integer option;
      [@ocaml.doc
        " {b Grey.} An operation is in progress on an instance within the command timeout.\n"]
  unknown : nullable_integer option;
      [@ocaml.doc
        " {b Grey.} AWS Elastic Beanstalk and the health agent are reporting an insufficient \
         amount of data on an instance.\n"]
  no_data : nullable_integer option;
      [@ocaml.doc
        " {b Grey.} AWS Elastic Beanstalk and the health agent are reporting no data on an instance.\n"]
}
[@@ocaml.doc
  "Represents summary information about the health of an instance. For more information, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html}Health \
   Colors and Statuses}.\n"]

type nonrec instance_health_list = single_instance_health list [@@ocaml.doc ""]

type nonrec include_deleted_back_to = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec include_deleted = bool [@@ocaml.doc ""]

type nonrec event_severity =
  | FATAL [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | WARN [@ocaml.doc ""]
  | INFO [@ocaml.doc ""]
  | DEBUG [@ocaml.doc ""]
  | TRACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_message = string [@@ocaml.doc ""]

type nonrec event_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec event_description = {
  severity : event_severity option; [@ocaml.doc "The severity level of this event.\n"]
  request_id : request_id option;
      [@ocaml.doc "The web service request ID for the activity of this event.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
  environment_name : environment_name option;
      [@ocaml.doc "The name of the environment associated with this event.\n"]
  template_name : configuration_template_name option;
      [@ocaml.doc "The name of the configuration associated with this event.\n"]
  version_label : version_label option;
      [@ocaml.doc "The release label for the application version associated with this event.\n"]
  application_name : application_name option;
      [@ocaml.doc "The application associated with the event.\n"]
  message : event_message option; [@ocaml.doc "The event message.\n"]
  event_date : event_date option; [@ocaml.doc "The date when the event occurred.\n"]
}
[@@ocaml.doc "Describes an event.\n"]

type nonrec event_description_list = event_description list [@@ocaml.doc ""]

type nonrec event_descriptions_message = {
  next_token : token option;
      [@ocaml.doc
        " If returned, this indicates that there are more results to obtain. Use this token in the \
         next [DescribeEvents] call to get the next batch of events. \n"]
  events : event_description_list option; [@ocaml.doc " A list of [EventDescription]. \n"]
}
[@@ocaml.doc "Result message wrapping a list of event descriptions.\n"]

type nonrec auto_scaling_group = {
  name : resource_id option; [@ocaml.doc "The name of the [AutoScalingGroup] . \n"]
}
[@@ocaml.doc "Describes an Auto Scaling launch configuration.\n"]

type nonrec auto_scaling_group_list = auto_scaling_group list [@@ocaml.doc ""]

type nonrec environment_resource_description = {
  queues : queue_list option; [@ocaml.doc "The queues used by this environment.\n"]
  triggers : trigger_list option;
      [@ocaml.doc "The [AutoScaling] triggers in use by this environment. \n"]
  load_balancers : load_balancer_list option;
      [@ocaml.doc "The LoadBalancers in use by this environment.\n"]
  launch_templates : launch_template_list option;
      [@ocaml.doc "The Amazon EC2 launch templates in use by this environment.\n"]
  launch_configurations : launch_configuration_list option;
      [@ocaml.doc "The Auto Scaling launch configurations in use by this environment.\n"]
  instances : instance_list option;
      [@ocaml.doc "The Amazon EC2 instances used by this environment.\n"]
  auto_scaling_groups : auto_scaling_group_list option;
      [@ocaml.doc " The [AutoScalingGroups] used by this environment. \n"]
  environment_name : environment_name option; [@ocaml.doc "The name of the environment.\n"]
}
[@@ocaml.doc "Describes the AWS resources in use by this environment. This data is live.\n"]

type nonrec environment_resource_descriptions_message = {
  environment_resources : environment_resource_description option;
      [@ocaml.doc " A list of [EnvironmentResourceDescription]. \n"]
}
[@@ocaml.doc "Result message containing a list of environment resource descriptions.\n"]

type nonrec environment_names_list = environment_name list [@@ocaml.doc ""]

type nonrec environment_id_list = environment_id list [@@ocaml.doc ""]

type nonrec environment_health_attribute =
  | RefreshedAt [@ocaml.doc ""]
  | HealthStatus [@ocaml.doc ""]
  | All [@ocaml.doc ""]
  | InstancesHealth [@ocaml.doc ""]
  | ApplicationMetrics [@ocaml.doc ""]
  | Causes [@ocaml.doc ""]
  | Color [@ocaml.doc ""]
  | Status [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_health_attributes = environment_health_attribute list [@@ocaml.doc ""]

type nonrec environment_descriptions_list = environment_description list [@@ocaml.doc ""]

type nonrec environment_descriptions_message = {
  next_token : token option;
      [@ocaml.doc
        "In a paginated request, the token that you can pass in a subsequent request to get the \
         next response page.\n"]
  environments : environment_descriptions_list option;
      [@ocaml.doc " Returns an [EnvironmentDescription] list. \n"]
}
[@@ocaml.doc "Result message containing a list of environment descriptions.\n"]

type nonrec disassociate_environment_operations_role_message = {
  environment_name : environment_name;
      [@ocaml.doc "The name of the environment from which to disassociate the operations role.\n"]
}
[@@ocaml.doc "Request to disassociate the operations role from an environment.\n"]

type nonrec describe_platform_version_result = {
  platform_description : platform_description option;
      [@ocaml.doc "Detailed information about the platform version.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_platform_version_request = {
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_instances_health_result = {
  next_token : next_token option;
      [@ocaml.doc "Pagination token for the next page of results, if available.\n"]
  refreshed_at : refreshed_at option;
      [@ocaml.doc "The date and time that the health information was retrieved.\n"]
  instance_health_list : instance_health_list option;
      [@ocaml.doc
        "Detailed health information about each instance.\n\n\
        \ The output differs slightly between Linux and Windows environments. There is a \
         difference in the members that are supported under the \n\
        \ {[\n\
        \ \n\
        \ ]}\n\
        \  type.\n\
        \ "]
}
[@@ocaml.doc
  "Detailed health information about the Amazon EC2 instances in an AWS Elastic Beanstalk \
   environment.\n"]

type nonrec describe_instances_health_request = {
  next_token : next_token option;
      [@ocaml.doc "Specify the pagination token returned by a previous call.\n"]
  attribute_names : instances_health_attributes option;
      [@ocaml.doc
        "Specifies the response elements you wish to receive. To retrieve all attributes, set to \
         [All]. If no attribute names are specified, returns a list of instances.\n"]
  environment_id : environment_id option;
      [@ocaml.doc "Specify the AWS Elastic Beanstalk environment by ID.\n"]
  environment_name : environment_name option;
      [@ocaml.doc "Specify the AWS Elastic Beanstalk environment by name.\n"]
}
[@@ocaml.doc "Parameters for a call to [DescribeInstancesHealth].\n"]

type nonrec describe_events_message = {
  next_token : token option;
      [@ocaml.doc "Pagination token. If specified, the events return the next batch of results.\n"]
  max_records : max_records option;
      [@ocaml.doc
        "Specifies the maximum number of events that can be returned, beginning with the most \
         recent event.\n"]
  end_time : time_filter_end option;
      [@ocaml.doc
        " If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that \
         occur up to, but not including, the [EndTime]. \n"]
  start_time : time_filter_start option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that \
         occur on or after this time.\n"]
  severity : event_severity option;
      [@ocaml.doc
        "If specified, limits the events returned from this call to include only those with the \
         specified severity or higher.\n"]
  request_id : request_id option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the described events to include only those \
         associated with this request ID.\n"]
  platform_arn : platform_arn option;
      [@ocaml.doc
        "The ARN of a custom platform version. If specified, AWS Elastic Beanstalk restricts the \
         returned descriptions to those associated with this custom platform version.\n"]
  environment_name : environment_name option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to those \
         associated with this environment.\n"]
  environment_id : environment_id option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to those \
         associated with this environment.\n"]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that are \
         associated with this environment configuration.\n"]
  version_label : version_label option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to those \
         associated with this application version.\n"]
  application_name : application_name option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only \
         those associated with this application.\n"]
}
[@@ocaml.doc "Request to retrieve a list of events for an environment.\n"]

type nonrec describe_environments_message = {
  next_token : token option;
      [@ocaml.doc
        "For a paginated request. Specify a token from a previous response page to retrieve the \
         next response page. All other parameter values must be identical to the ones specified in \
         the initial request.\n\n\
        \ If no [NextToken] is specified, the first page is retrieved.\n\
        \ "]
  max_records : max_records option;
      [@ocaml.doc
        "For a paginated request. Specify a maximum number of environments to include in each \
         response.\n\n\
        \ If no [MaxRecords] is specified, all available environments are retrieved in a single \
         response.\n\
        \ "]
  included_deleted_back_to : include_deleted_back_to option;
      [@ocaml.doc
        " If specified when [IncludeDeleted] is set to [true], then environments deleted after \
         this date are displayed. \n"]
  include_deleted : include_deleted option;
      [@ocaml.doc
        "Indicates whether to include deleted environments:\n\n\
        \  [true]: Environments that have been deleted after [IncludedDeletedBackTo] are displayed.\n\
        \ \n\
        \   [false]: Do not include deleted environments.\n\
        \  "]
  environment_names : environment_names_list option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only \
         those that have the specified names.\n"]
  environment_ids : environment_id_list option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only \
         those that have the specified IDs.\n"]
  version_label : version_label option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only \
         those that are associated with this application version.\n"]
  application_name : application_name option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only \
         those that are associated with this application.\n"]
}
[@@ocaml.doc "Request to describe one or more environments.\n"]

type nonrec describe_environment_resources_message = {
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to retrieve AWS resource usage data.\n\n\
        \  Condition: You must specify either this or an EnvironmentId, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of the environment to retrieve AWS resource usage data.\n\n\
        \  Condition: You must specify either this or an EnvironmentName, or both. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
}
[@@ocaml.doc "Request to describe the resources in an environment.\n"]

type nonrec describe_environment_managed_actions_result = {
  managed_actions : managed_actions option;
      [@ocaml.doc "A list of upcoming and in-progress managed actions.\n"]
}
[@@ocaml.doc "The result message containing a list of managed actions.\n"]

type nonrec describe_environment_managed_actions_request = {
  status : action_status option;
      [@ocaml.doc "To show only actions with a particular status, specify a status.\n"]
  environment_id : string_ option; [@ocaml.doc "The environment ID of the target environment.\n"]
  environment_name : string_ option; [@ocaml.doc "The name of the target environment.\n"]
}
[@@ocaml.doc "Request to list an environment's upcoming and in-progress managed actions.\n"]

type nonrec describe_environment_managed_action_history_result = {
  next_token : string_ option;
      [@ocaml.doc
        "A pagination token that you pass to [DescribeEnvironmentManagedActionHistory] to get the \
         next page of results.\n"]
  managed_action_history_items : managed_action_history_items option;
      [@ocaml.doc "A list of completed and failed managed actions.\n"]
}
[@@ocaml.doc "A result message containing a list of completed and failed managed actions.\n"]

type nonrec describe_environment_managed_action_history_request = {
  max_items : managed_action_history_max_items option;
      [@ocaml.doc "The maximum number of items to return for a single request.\n"]
  next_token : string_ option; [@ocaml.doc "The pagination token returned by a previous request.\n"]
  environment_name : environment_name option; [@ocaml.doc "The name of the target environment.\n"]
  environment_id : environment_id option;
      [@ocaml.doc "The environment ID of the target environment.\n"]
}
[@@ocaml.doc "Request to list completed and failed managed actions.\n"]

type nonrec describe_environment_health_result = {
  refreshed_at : refreshed_at option;
      [@ocaml.doc "The date and time that the health information was retrieved.\n"]
  instances_health : instance_health_summary option;
      [@ocaml.doc "Summary health information for the instances in the environment.\n"]
  application_metrics : application_metrics option;
      [@ocaml.doc "Application request metrics for the environment.\n"]
  causes : causes option;
      [@ocaml.doc
        "Descriptions of the data that contributed to the environment's current health status.\n"]
  color : string_ option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html}health \
         color} of the environment.\n"]
  status : environment_health option;
      [@ocaml.doc
        "The environment's operational status. [Ready], [Launching], [Updating], [Terminating], or \
         [Terminated].\n"]
  health_status : string_ option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html}health \
         status} of the environment. For example, [Ok].\n"]
  environment_name : environment_name option; [@ocaml.doc "The environment's name.\n"]
}
[@@ocaml.doc "Health details for an AWS Elastic Beanstalk environment.\n"]

type nonrec describe_environment_health_request = {
  attribute_names : environment_health_attributes option;
      [@ocaml.doc
        "Specify the response elements to return. To retrieve all attributes, set to [All]. If no \
         attribute names are specified, returns the name of the environment.\n"]
  environment_id : environment_id option;
      [@ocaml.doc
        "Specify the environment by ID.\n\n\
        \ You must specify either this or an EnvironmentName, or both.\n\
        \ "]
  environment_name : environment_name option;
      [@ocaml.doc
        "Specify the environment by name.\n\n\
        \ You must specify either this or an EnvironmentName, or both.\n\
        \ "]
}
[@@ocaml.doc "See the example below to learn how to create a request body.\n"]

type nonrec describe_configuration_settings_message = {
  environment_name : environment_name option;
      [@ocaml.doc
        "The name of the environment to describe.\n\n\
        \  Condition: You must specify either this or a TemplateName, but not both. If you specify \
         both, AWS Elastic Beanstalk returns an [InvalidParameterCombination] error. If you do not \
         specify either, AWS Elastic Beanstalk returns [MissingRequiredParameter] error. \n\
        \ "]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "The name of the configuration template to describe.\n\n\
        \  Conditional: You must specify either this parameter or an EnvironmentName, but not \
         both. If you specify both, AWS Elastic Beanstalk returns an [InvalidParameterCombination] \
         error. If you do not specify either, AWS Elastic Beanstalk returns a \
         [MissingRequiredParameter] error. \n\
        \ "]
  application_name : application_name;
      [@ocaml.doc "The application for the environment or configuration template.\n"]
}
[@@ocaml.doc
  "Result message containing all of the configuration settings for a specified solution stack or \
   configuration template.\n"]

type nonrec configuration_settings_description_list = configuration_settings_description list
[@@ocaml.doc ""]

type nonrec configuration_settings_descriptions = {
  configuration_settings : configuration_settings_description_list option;
      [@ocaml.doc " A list of [ConfigurationSettingsDescription]. \n"]
}
[@@ocaml.doc "The results from a request to change the configuration settings of an environment.\n"]

type nonrec describe_configuration_options_message = {
  options : options_specifier_list option;
      [@ocaml.doc "If specified, restricts the descriptions to only the specified options.\n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the custom platform.\n"]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc
        "The name of the solution stack whose configuration options you want to describe.\n"]
  environment_name : environment_name option;
      [@ocaml.doc "The name of the environment whose configuration options you want to describe.\n"]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "The name of the configuration template whose configuration options you want to describe.\n"]
  application_name : application_name option;
      [@ocaml.doc
        "The name of the application associated with the configuration template or environment. \
         Only needed if you want to describe the configuration options associated with either the \
         configuration template or environment.\n"]
}
[@@ocaml.doc "Result message containing a list of application version descriptions.\n"]

type nonrec configuration_option_default_value = string [@@ocaml.doc ""]

type nonrec configuration_option_severity = string [@@ocaml.doc ""]

type nonrec configuration_option_value_type = List [@ocaml.doc ""] | Scalar [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec configuration_option_possible_value = string [@@ocaml.doc ""]

type nonrec configuration_option_possible_values = configuration_option_possible_value list
[@@ocaml.doc ""]

type nonrec configuration_option_description = {
  regex : option_restriction_regex option;
      [@ocaml.doc
        "If specified, the configuration option must be a string value that satisfies this regular \
         expression.\n"]
  max_length : option_restriction_max_length option;
      [@ocaml.doc
        "If specified, the configuration option must be a string value no longer than this value.\n"]
  max_value : option_restriction_max_value option;
      [@ocaml.doc
        "If specified, the configuration option must be a numeric value less than this value.\n"]
  min_value : option_restriction_min_value option;
      [@ocaml.doc
        "If specified, the configuration option must be a numeric value greater than this value.\n"]
  value_options : configuration_option_possible_values option;
      [@ocaml.doc
        "If specified, values for the configuration option are selected from this list.\n"]
  value_type : configuration_option_value_type option;
      [@ocaml.doc
        "An indication of which type of values this option has and whether it is allowable to \
         select one or more than one of the possible values:\n\n\
        \ {ul\n\
        \       {-   [Scalar] : Values for this option are a single selection from the possible \
         values, or an unformatted string, or numeric value governed by the [MIN/MAX/Regex] \
         constraints.\n\
        \           \n\
        \            }\n\
        \       {-   [List] : Values for this option are multiple selections from the possible \
         values.\n\
        \           \n\
        \            }\n\
        \       {-   [Boolean] : Values for this option are either [true] or [false] .\n\
        \           \n\
        \            }\n\
        \       {-   [Json] : Values for this option are a JSON representation of a \
         [ConfigDocument].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  user_defined : user_defined_option option;
      [@ocaml.doc
        "An indication of whether the user defined this configuration option:\n\n\
        \ {ul\n\
        \       {-   [true] : This configuration option was defined by the user. It is a valid \
         choice for specifying if this as an [Option to Remove] when updating configuration \
         settings. \n\
        \           \n\
        \            }\n\
        \       {-   [false] : This configuration was not defined by the user.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Constraint: You can remove only [UserDefined] options from a configuration. \n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \    "]
  change_severity : configuration_option_severity option;
      [@ocaml.doc
        "An indication of which action is required if the value for this configuration option \
         changes:\n\n\
        \ {ul\n\
        \       {-   [NoInterruption] : There is no interruption to the environment or application \
         availability.\n\
        \           \n\
        \            }\n\
        \       {-   [RestartEnvironment] : The environment is entirely restarted, all AWS \
         resources are deleted and recreated, and the environment is unavailable during the \
         process.\n\
        \           \n\
        \            }\n\
        \       {-   [RestartApplicationServer] : The environment is available the entire time. \
         However, a short application outage occurs when the application servers on the running \
         Amazon EC2 instances are restarted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  default_value : configuration_option_default_value option;
      [@ocaml.doc "The default value for this configuration option.\n"]
  name : configuration_option_name option; [@ocaml.doc "The name of the configuration option.\n"]
  namespace : option_namespace option;
      [@ocaml.doc "A unique namespace identifying the option's associated AWS resource.\n"]
}
[@@ocaml.doc "Describes the possible values for a configuration option.\n"]

type nonrec configuration_option_descriptions_list = configuration_option_description list
[@@ocaml.doc ""]

type nonrec configuration_options_description = {
  options : configuration_option_descriptions_list option;
      [@ocaml.doc " A list of [ConfigurationOptionDescription]. \n"]
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the platform version.\n"]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc "The name of the solution stack these configuration options belong to.\n"]
}
[@@ocaml.doc "Describes the settings for a specified configuration set.\n"]

type nonrec application_names_list = application_name list [@@ocaml.doc ""]

type nonrec describe_applications_message = {
  application_names : application_names_list option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk restricts the returned descriptions to only include \
         those with the specified names.\n"]
}
[@@ocaml.doc "Request to describe one or more applications.\n"]

type nonrec application_description_list = application_description list [@@ocaml.doc ""]

type nonrec application_descriptions_message = {
  applications : application_description_list option;
      [@ocaml.doc "This parameter contains a list of [ApplicationDescription].\n"]
}
[@@ocaml.doc "Result message containing a list of application descriptions.\n"]

type nonrec describe_application_versions_message = {
  next_token : token option;
      [@ocaml.doc
        "For a paginated request. Specify a token from a previous response page to retrieve the \
         next response page. All other parameter values must be identical to the ones specified in \
         the initial request.\n\n\
        \ If no [NextToken] is specified, the first page is retrieved.\n\
        \ "]
  max_records : max_records option;
      [@ocaml.doc
        "For a paginated request. Specify a maximum number of application versions to include in \
         each response.\n\n\
        \ If no [MaxRecords] is specified, all available application versions are retrieved in a \
         single response.\n\
        \ "]
  version_labels : version_labels_list option;
      [@ocaml.doc "Specify a version label to show a specific application version.\n"]
  application_name : application_name option;
      [@ocaml.doc
        "Specify an application name to show only application versions for that application.\n"]
}
[@@ocaml.doc "Request to describe application versions.\n"]

type nonrec application_version_description_list = application_version_description list
[@@ocaml.doc ""]

type nonrec application_version_descriptions_message = {
  next_token : token option;
      [@ocaml.doc
        "In a paginated request, the token that you can pass in a subsequent request to get the \
         next response page.\n"]
  application_versions : application_version_description_list option;
      [@ocaml.doc "List of [ApplicationVersionDescription] objects sorted in order of creation.\n"]
}
[@@ocaml.doc "Result message wrapping a list of application version descriptions.\n"]

type nonrec describe_account_attributes_result = {
  resource_quotas : resource_quotas option;
      [@ocaml.doc
        "The Elastic Beanstalk resource quotas associated with the calling AWS account.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_source_bundle = bool [@@ocaml.doc ""]

type nonrec delete_platform_version_result = {
  platform_summary : platform_summary option;
      [@ocaml.doc "Detailed information about the version of the custom platform.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_platform_version_request = {
  platform_arn : platform_arn option; [@ocaml.doc "The ARN of the version of the custom platform.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_configuration_message = {
  environment_name : environment_name;
      [@ocaml.doc "The name of the environment to delete the draft configuration from.\n"]
  application_name : application_name;
      [@ocaml.doc "The name of the application the environment is associated with.\n"]
}
[@@ocaml.doc "Request to delete a draft environment configuration.\n"]

type nonrec delete_configuration_template_message = {
  template_name : configuration_template_name;
      [@ocaml.doc "The name of the configuration template to delete.\n"]
  application_name : application_name;
      [@ocaml.doc "The name of the application to delete the configuration template from.\n"]
}
[@@ocaml.doc "Request to delete a configuration template.\n"]

type nonrec delete_application_version_message = {
  delete_source_bundle : delete_source_bundle option;
      [@ocaml.doc
        "Set to [true] to delete the source bundle from your storage bucket. Otherwise, the \
         application version is deleted only from Elastic Beanstalk and the source bundle remains \
         in Amazon S3.\n"]
  version_label : version_label; [@ocaml.doc "The label of the version to delete.\n"]
  application_name : application_name;
      [@ocaml.doc "The name of the application to which the version belongs.\n"]
}
[@@ocaml.doc "Request to delete an application version.\n"]

type nonrec delete_application_message = {
  terminate_env_by_force : terminate_env_force option;
      [@ocaml.doc
        "When set to true, running environments will be terminated before deleting the application.\n"]
  application_name : application_name; [@ocaml.doc "The name of the application to delete.\n"]
}
[@@ocaml.doc "Request to delete an application.\n"]

type nonrec dns_cname_prefix = string [@@ocaml.doc ""]

type nonrec create_storage_location_result_message = {
  s3_bucket : s3_bucket option; [@ocaml.doc "The name of the Amazon S3 bucket created.\n"]
}
[@@ocaml.doc "Results of a [CreateStorageLocationResult] call.\n"]

type nonrec ar_n = string [@@ocaml.doc ""]

type nonrec builder = { ar_n : ar_n option [@ocaml.doc "The ARN of the builder.\n"] }
[@@ocaml.doc "The builder used to build the custom platform.\n"]

type nonrec create_platform_version_result = {
  builder : builder option; [@ocaml.doc "The builder used to create the custom platform.\n"]
  platform_summary : platform_summary option;
      [@ocaml.doc "Detailed information about the new version of the custom platform.\n"]
}
[@@ocaml.doc ""]

type nonrec create_platform_version_request = {
  tags : tags option;
      [@ocaml.doc
        "Specifies the tags applied to the new platform version.\n\n\
        \ Elastic Beanstalk applies these tags only to the platform version. Environments that you \
         create using the platform version don't inherit the tags.\n\
        \ "]
  option_settings : configuration_option_settings_list option;
      [@ocaml.doc "The configuration option settings to apply to the builder environment.\n"]
  environment_name : environment_name option; [@ocaml.doc "The name of the builder environment.\n"]
  platform_definition_bundle : s3_location;
      [@ocaml.doc "The location of the platform definition archive in Amazon S3.\n"]
  platform_version : platform_version;
      [@ocaml.doc "The number, such as 1.0.2, for the new platform version.\n"]
  platform_name : platform_name; [@ocaml.doc "The name of your custom platform.\n"]
}
[@@ocaml.doc "Request to create a new platform version.\n"]

type nonrec create_environment_message = {
  operations_role : operations_role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an existing IAM role to be used as the environment's \
         operations role. If specified, Elastic Beanstalk uses the operations role for permissions \
         to downstream services during this call and during subsequent calls acting on this \
         environment. To specify an operations role, you must have the [iam:PassRole] permission \
         for the role. For more information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html}Operations \
         roles} in the {i AWS Elastic Beanstalk Developer Guide}.\n"]
  options_to_remove : options_specifier_list option;
      [@ocaml.doc
        "A list of custom user-defined configuration options to remove from the configuration set \
         for this new environment.\n"]
  option_settings : configuration_option_settings_list option;
      [@ocaml.doc
        "If specified, AWS Elastic Beanstalk sets the specified configuration options to the \
         requested value in the configuration set for the new environment. These override the \
         values obtained from the solution stack or the configuration template.\n"]
  platform_arn : platform_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom platform to use with the environment. For \
         more information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html}Custom \
         Platforms} in the {i AWS Elastic Beanstalk Developer Guide}.\n\n\
        \  If you specify [PlatformArn], don't specify [SolutionStackName].\n\
        \  \n\
        \   "]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc
        "The name of an Elastic Beanstalk solution stack (platform version) to use with the \
         environment. If specified, Elastic Beanstalk sets the configuration values to the default \
         values associated with the specified solution stack. For a list of current solution \
         stacks, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html}Elastic \
         Beanstalk Supported Platforms} in the {i AWS Elastic Beanstalk Platforms} guide.\n\n\
        \  If you specify [SolutionStackName], don't specify [PlatformArn] or [TemplateName].\n\
        \  \n\
        \   "]
  template_name : configuration_template_name option;
      [@ocaml.doc
        "The name of the Elastic Beanstalk configuration template to use with the environment.\n\n\
        \  If you specify [TemplateName], then don't specify [SolutionStackName].\n\
        \  \n\
        \   "]
  version_label : version_label option;
      [@ocaml.doc
        "The name of the application version to deploy.\n\n\
        \ Default: If not specified, Elastic Beanstalk attempts to deploy the sample application.\n\
        \ "]
  tags : tags option; [@ocaml.doc "Specifies the tags applied to resources in the environment.\n"]
  tier : environment_tier option;
      [@ocaml.doc
        "Specifies the tier to use in creating this environment. The environment tier that you \
         choose determines whether Elastic Beanstalk provisions resources to support a web \
         application that handles HTTP(S) requests or a web application that handles \
         background-processing tasks.\n"]
  cname_prefix : dns_cname_prefix option;
      [@ocaml.doc
        "If specified, the environment attempts to use this value as the prefix for the CNAME in \
         your Elastic Beanstalk environment URL. If not specified, the CNAME is generated \
         automatically by appending a random alphanumeric string to the environment name.\n"]
  description : description option; [@ocaml.doc "Your description for this environment.\n"]
  group_name : group_name option;
      [@ocaml.doc
        "The name of the group to which the target environment belongs. Specify a group name only \
         if the environment's name is specified in an environment manifest and not with the \
         environment name parameter. See \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html}Environment \
         Manifest (env.yaml)} for details.\n"]
  environment_name : environment_name option;
      [@ocaml.doc
        "A unique name for the environment.\n\n\
        \ Constraint: Must be from 4 to 40 characters in length. The name can contain only \
         letters, numbers, and hyphens. It can't start or end with a hyphen. This name must be \
         unique within a region in your account. If the specified name already exists in the \
         region, Elastic Beanstalk returns an [InvalidParameterValue] error. \n\
        \ \n\
        \  If you don't specify the [CNAMEPrefix] parameter, the environment name becomes part of \
         the CNAME, and therefore part of the visible URL for your application.\n\
        \  "]
  application_name : application_name;
      [@ocaml.doc "The name of the application that is associated with this environment.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_configuration_template_message = {
  tags : tags option; [@ocaml.doc "Specifies the tags applied to the configuration template.\n"]
  option_settings : configuration_option_settings_list option;
      [@ocaml.doc
        "Option values for the Elastic Beanstalk configuration, such as the instance type. If \
         specified, these values override the values obtained from the solution stack or the \
         source configuration template. For a complete list of Elastic Beanstalk configuration \
         options, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html}Option \
         Values} in the {i AWS Elastic Beanstalk Developer Guide}.\n"]
  description : description option; [@ocaml.doc "An optional description for this configuration.\n"]
  environment_id : environment_id option;
      [@ocaml.doc
        "The ID of an environment whose settings you want to use to create the configuration \
         template. You must specify [EnvironmentId] if you don't specify [PlatformArn], \
         [SolutionStackName], or [SourceConfiguration].\n"]
  source_configuration : source_configuration option;
      [@ocaml.doc
        "An Elastic Beanstalk configuration template to base this one on. If specified, Elastic \
         Beanstalk uses the configuration values from the specified configuration template to \
         create a new configuration.\n\n\
        \ Values specified in [OptionSettings] override any values obtained from the \
         [SourceConfiguration].\n\
        \ \n\
        \  You must specify [SourceConfiguration] if you don't specify [PlatformArn], \
         [EnvironmentId], or [SolutionStackName].\n\
        \  \n\
        \   Constraint: If both solution stack name and source configuration are specified, the \
         solution stack of the source configuration template must match the specified solution \
         stack name.\n\
        \   "]
  platform_arn : platform_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom platform. For more information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html} Custom \
         Platforms} in the {i AWS Elastic Beanstalk Developer Guide}.\n\n\
        \  If you specify [PlatformArn], then don't specify [SolutionStackName].\n\
        \  \n\
        \   "]
  solution_stack_name : solution_stack_name option;
      [@ocaml.doc
        "The name of an Elastic Beanstalk solution stack (platform version) that this \
         configuration uses. For example, [64bit Amazon Linux 2013.09 running Tomcat 7 Java 7]. A \
         solution stack specifies the operating system, runtime, and application server for a \
         configuration template. It also determines the set of configuration options as well as \
         the possible and default values. For more information, see \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html}Supported \
         Platforms} in the {i AWS Elastic Beanstalk Developer Guide}.\n\n\
        \ You must specify [SolutionStackName] if you don't specify [PlatformArn], \
         [EnvironmentId], or [SourceConfiguration].\n\
        \ \n\
        \  Use the \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_ListAvailableSolutionStacks.html} \
         [ListAvailableSolutionStacks] } API to obtain a list of available solution stacks.\n\
        \  "]
  template_name : configuration_template_name;
      [@ocaml.doc
        "The name of the configuration template.\n\n\
        \ Constraint: This name must be unique per application.\n\
        \ "]
  application_name : application_name;
      [@ocaml.doc
        "The name of the Elastic Beanstalk application to associate with this configuration \
         template.\n"]
}
[@@ocaml.doc "Request to create a configuration template.\n"]

type nonrec compute_type =
  | BUILD_GENERAL1_LARGE [@ocaml.doc ""]
  | BUILD_GENERAL1_MEDIUM [@ocaml.doc ""]
  | BUILD_GENERAL1_SMALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec build_configuration = {
  timeout_in_minutes : boxed_int option;
      [@ocaml.doc
        "How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out \
         any related build that does not get marked as completed. The default is 60 minutes.\n"]
  image : non_empty_string;
      [@ocaml.doc "The ID of the Docker image to use for this build project.\n"]
  compute_type : compute_type option;
      [@ocaml.doc
        "Information about the compute resources the build project will use.\n\n\
        \ {ul\n\
        \       {-   [BUILD_GENERAL1_SMALL: Use up to 3 GB memory and 2 vCPUs for builds] \n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_MEDIUM: Use up to 7 GB memory and 4 vCPUs for builds] \n\
        \           \n\
        \            }\n\
        \       {-   [BUILD_GENERAL1_LARGE: Use up to 15 GB memory and 8 vCPUs for builds] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  code_build_service_role : non_empty_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that \
         enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS \
         account.\n"]
  artifact_name : string_ option;
      [@ocaml.doc
        "The name of the artifact of the CodeBuild build. If provided, Elastic Beanstalk stores \
         the build artifact in the S3 location {i S3-bucket}/resources/{i \
         application-name}/codebuild/codebuild-{i version-label}-{i artifact-name}.zip. If not \
         provided, Elastic Beanstalk stores the build artifact in the S3 location {i \
         S3-bucket}/resources/{i application-name}/codebuild/codebuild-{i version-label}.zip. \n"]
}
[@@ocaml.doc "Settings for an AWS CodeBuild build.\n"]

type nonrec auto_create_application = bool [@@ocaml.doc ""]

type nonrec application_version_proccess = bool [@@ocaml.doc ""]

type nonrec create_application_version_message = {
  tags : tags option;
      [@ocaml.doc
        "Specifies the tags applied to the application version.\n\n\
        \ Elastic Beanstalk applies these tags only to the application version. Environments that \
         use the application version don't inherit the tags.\n\
        \ "]
  process : application_version_proccess option;
      [@ocaml.doc
        "Pre-processes and validates the environment manifest ([env.yaml]) and configuration files \
         ([*.config] files in the [.ebextensions] folder) in the source bundle. Validating \
         configuration files can identify issues prior to deploying the application version to an \
         environment.\n\n\
        \ You must turn processing on for application versions that you create using AWS CodeBuild \
         or AWS CodeCommit. For application versions built from a source bundle in Amazon S3, \
         processing is optional.\n\
        \ \n\
        \   The [Process] option validates Elastic Beanstalk configuration files. It doesn't \
         validate your application's configuration files, like proxy server or Docker \
         configuration.\n\
        \   \n\
        \    "]
  auto_create_application : auto_create_application option;
      [@ocaml.doc
        "Set to [true] to create an application with the specified name if it doesn't already exist.\n"]
  build_configuration : build_configuration option;
      [@ocaml.doc "Settings for an AWS CodeBuild build.\n"]
  source_bundle : s3_location option;
      [@ocaml.doc
        "The Amazon S3 bucket and key that identify the location of the source bundle for this \
         version.\n\n\
        \  The Amazon S3 bucket must be in the same region as the environment.\n\
        \  \n\
        \    Specify a source bundle in S3 or a commit in an AWS CodeCommit repository (with \
         [SourceBuildInformation]), but not both. If neither [SourceBundle] nor \
         [SourceBuildInformation] are provided, Elastic Beanstalk uses a sample application.\n\
        \    "]
  source_build_information : source_build_information option;
      [@ocaml.doc
        "Specify a commit in an AWS CodeCommit Git repository to use as the source code for the \
         application version.\n"]
  description : description option; [@ocaml.doc "A description of this application version.\n"]
  version_label : version_label;
      [@ocaml.doc
        "A label identifying this version.\n\n\
        \ Constraint: Must be unique per application. If an application version already exists \
         with this label for the specified application, AWS Elastic Beanstalk returns an \
         [InvalidParameterValue] error. \n\
        \ "]
  application_name : application_name;
      [@ocaml.doc
        " The name of the application. If no application is found with this name, and \
         [AutoCreateApplication] is [false], returns an [InvalidParameterValue] error. \n"]
}
[@@ocaml.doc "\n"]

type nonrec code_build_not_in_service_region_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "AWS CodeBuild is not available in the specified region.\n"]

type nonrec create_application_message = {
  tags : tags option;
      [@ocaml.doc
        "Specifies the tags applied to the application.\n\n\
        \ Elastic Beanstalk applies these tags only to the application. Environments that you \
         create in the application don't inherit the tags.\n\
        \ "]
  resource_lifecycle_config : application_resource_lifecycle_config option;
      [@ocaml.doc
        "Specifies an application resource lifecycle configuration to prevent your application \
         from accumulating too many versions.\n"]
  description : description option; [@ocaml.doc "Your description of the application.\n"]
  application_name : application_name;
      [@ocaml.doc "The name of the application. Must be unique within your account.\n"]
}
[@@ocaml.doc "Request to create an application.\n"]

type nonrec compose_environments_message = {
  version_labels : version_labels option;
      [@ocaml.doc
        "A list of version labels, specifying one or more application source bundles that belong \
         to the target application. Each source bundle must include an environment manifest that \
         specifies the name of the environment and the name of the solution stack to use, and \
         optionally can specify environment links to create.\n"]
  group_name : group_name option;
      [@ocaml.doc
        "The name of the group to which the target environments belong. Specify a group name only \
         if the environment name defined in each target environment's manifest ends with a + \
         (plus) character. See \
         {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html}Environment \
         Manifest (env.yaml)} for details.\n"]
  application_name : application_name option;
      [@ocaml.doc "The name of the application to which the specified source bundles belong.\n"]
}
[@@ocaml.doc "Request to create or update a group of environments.\n"]

type nonrec cname_availability = bool [@@ocaml.doc ""]

type nonrec check_dns_availability_result_message = {
  fully_qualified_cnam_e : dns_cname option;
      [@ocaml.doc
        "The fully qualified CNAME to reserve when [CreateEnvironment] is called with the provided \
         prefix.\n"]
  available : cname_availability option;
      [@ocaml.doc
        "Indicates if the specified CNAME is available:\n\n\
        \ {ul\n\
        \       {-   [true] : The CNAME is available.\n\
        \           \n\
        \            }\n\
        \       {-   [false] : The CNAME is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Indicates if the specified CNAME is available.\n"]

type nonrec check_dns_availability_message = {
  cname_prefix : dns_cname_prefix; [@ocaml.doc "The prefix used when this CNAME is reserved.\n"]
}
[@@ocaml.doc "Results message indicating whether a CNAME is available.\n"]

type nonrec associate_environment_operations_role_message = {
  operations_role : operations_role;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an existing IAM role to be used as the environment's \
         operations role.\n"]
  environment_name : environment_name;
      [@ocaml.doc "The name of the environment to which to set the operations role.\n"]
}
[@@ocaml.doc "Request to add or change the operations role used by an environment.\n"]

type nonrec apply_environment_managed_action_result = {
  status : string_ option; [@ocaml.doc "The status of the managed action.\n"]
  action_type : action_type option; [@ocaml.doc "The type of managed action.\n"]
  action_description : string_ option; [@ocaml.doc "A description of the managed action.\n"]
  action_id : string_ option; [@ocaml.doc "The action ID of the managed action.\n"]
}
[@@ocaml.doc "The result message containing information about the managed action.\n"]

type nonrec apply_environment_managed_action_request = {
  action_id : string_; [@ocaml.doc "The action ID of the scheduled managed action to execute.\n"]
  environment_id : string_ option; [@ocaml.doc "The environment ID of the target environment.\n"]
  environment_name : string_ option; [@ocaml.doc "The name of the target environment.\n"]
}
[@@ocaml.doc "Request to execute a scheduled managed action immediately.\n"]

type nonrec abort_environment_update_message = {
  environment_name : environment_name option;
      [@ocaml.doc
        "This specifies the name of the environment with the in-progress update that you want to \
         cancel.\n"]
  environment_id : environment_id option;
      [@ocaml.doc
        "This specifies the ID of the environment with the in-progress update that you want to \
         cancel.\n"]
}
[@@ocaml.doc "\n"]
