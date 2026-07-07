type nonrec x_ray_throttle_percent = int [@@ocaml.doc ""]

type nonrec x_ray_request_count = int [@@ocaml.doc ""]

type nonrec x_ray_request_average_latency = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec x_ray_node_type = string [@@ocaml.doc ""]

type nonrec x_ray_node_name = string [@@ocaml.doc ""]

type nonrec x_ray_fault_percent = int [@@ocaml.doc ""]

type nonrec x_ray_error_percent = int [@@ocaml.doc ""]

type nonrec workload_name = string [@@ocaml.doc ""]

type nonrec meta_data_value = string [@@ocaml.doc ""]

type nonrec meta_data_key = string [@@ocaml.doc ""]

type nonrec workload_meta_data = (meta_data_key * meta_data_value) list [@@ocaml.doc ""]

type nonrec workload_id = string [@@ocaml.doc ""]

type nonrec component_name = string [@@ocaml.doc ""]

type nonrec tier =
  | SAP_NETWEAVER_HIGH_AVAILABILITY [@ocaml.doc ""]
  | SAP_NETWEAVER_DISTRIBUTED [@ocaml.doc ""]
  | SAP_NETWEAVER_STANDARD [@ocaml.doc ""]
  | ACTIVE_DIRECTORY [@ocaml.doc ""]
  | SHAREPOINT [@ocaml.doc ""]
  | SQL_SERVER_FAILOVER_CLUSTER_INSTANCE [@ocaml.doc ""]
  | SAP_ASE_HIGH_AVAILABILITY [@ocaml.doc ""]
  | SAP_ASE_SINGLE_NODE [@ocaml.doc ""]
  | SAP_HANA_HIGH_AVAILABILITY [@ocaml.doc ""]
  | SAP_HANA_SINGLE_NODE [@ocaml.doc ""]
  | SAP_HANA_MULTI_NODE [@ocaml.doc ""]
  | ORACLE [@ocaml.doc ""]
  | JAVA_JMX [@ocaml.doc ""]
  | POSTGRESQL [@ocaml.doc ""]
  | MYSQL [@ocaml.doc ""]
  | SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP [@ocaml.doc ""]
  | SQL_SERVER [@ocaml.doc ""]
  | DOT_NET_WEB [@ocaml.doc ""]
  | DOT_NET_WEB_TIER [@ocaml.doc ""]
  | DOT_NET_WORKER [@ocaml.doc ""]
  | DOT_NET_CORE [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec remarks = string [@@ocaml.doc ""]

type nonrec missing_workload_config = bool [@@ocaml.doc ""]

type nonrec workload = {
  missing_workload_config : missing_workload_config option;
      [@ocaml.doc
        "Indicates whether all of the component configurations required to monitor a workload were \
         provided.\n"]
  workload_remarks : remarks option;
      [@ocaml.doc
        "If logging is supported for the resource type, shows whether the component has configured \
         logs to be monitored.\n"]
  tier : tier option; [@ocaml.doc "The tier of the workload.\n"]
  workload_name : workload_name option; [@ocaml.doc "The name of the workload.\n"]
  component_name : component_name option; [@ocaml.doc "The name of the component.\n"]
  workload_id : workload_id option; [@ocaml.doc "The ID of the workload.\n"]
}
[@@ocaml.doc "Describes the workloads on a component.\n"]

type nonrec workload_list = workload list [@@ocaml.doc ""]

type nonrec component_configuration = string [@@ocaml.doc ""]

type nonrec workload_configuration = {
  configuration : component_configuration option;
      [@ocaml.doc "The configuration settings of the workload.\n"]
  tier : tier option; [@ocaml.doc "The configuration of the workload tier.\n"]
  workload_name : workload_name option; [@ocaml.doc "The name of the workload.\n"]
}
[@@ocaml.doc "The configuration of the workload.\n"]

type nonrec visibility = VISIBLE [@ocaml.doc ""] | IGNORED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec value = float [@@ocaml.doc ""]

type nonrec error_msg = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_msg option [@ocaml.doc ""] }
[@@ocaml.doc "The parameter is not valid.\n"]

type nonrec update_workload_response = {
  workload_configuration : workload_configuration option;
      [@ocaml.doc
        "The configuration settings of the workload. The value is the escaped JSON of the \
         configuration.\n"]
  workload_id : workload_id option; [@ocaml.doc "The ID of the workload.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_group_name = string [@@ocaml.doc ""]

type nonrec update_workload_request = {
  workload_configuration : workload_configuration;
      [@ocaml.doc
        "The configuration settings of the workload. The value is the escaped JSON of the \
         configuration.\n"]
  workload_id : workload_id option; [@ocaml.doc "The ID of the workload.\n"]
  component_name : component_name; [@ocaml.doc " The name of the component. \n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_msg option [@ocaml.doc ""] }
[@@ocaml.doc "The resource does not exist in the customer account.\n"]

type nonrec internal_server_exception = { message : error_msg option [@ocaml.doc ""] }
[@@ocaml.doc "The server encountered an internal error and is unable to complete the request.\n"]

type nonrec update_status = RESOLVED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_problem_response = unit [@@ocaml.doc ""]

type nonrec problem_id = string [@@ocaml.doc ""]

type nonrec update_problem_request = {
  visibility : visibility option;
      [@ocaml.doc
        "The visibility of a problem. When you pass a value of [IGNORED], the problem is removed \
         from the default view, and all notifications for the problem are suspended. When \
         [VISIBLE] is passed, the [IGNORED] action is reversed.\n"]
  update_status : update_status option;
      [@ocaml.doc
        "The status of the problem. Arguments can be passed for only problems that show a status \
         of [RECOVERING].\n"]
  problem_id : problem_id; [@ocaml.doc "The ID of the problem.\n"]
}
[@@ocaml.doc ""]

type nonrec log_pattern_set_name = string [@@ocaml.doc ""]

type nonrec log_pattern_name = string [@@ocaml.doc ""]

type nonrec log_pattern_regex = string [@@ocaml.doc ""]

type nonrec log_pattern_rank = int [@@ocaml.doc ""]

type nonrec log_pattern = {
  rank : log_pattern_rank option;
      [@ocaml.doc
        "Rank of the log pattern. Must be a value between [1] and [1,000,000]. The patterns are \
         sorted by rank, so we recommend that you set your highest priority patterns with the \
         lowest rank. A pattern of rank [1] will be the first to get matched to a log line. A \
         pattern of rank [1,000,000] will be last to get matched. When you configure custom log \
         patterns from the console, a [Low] severity pattern translates to a [750,000] rank. A \
         [Medium] severity pattern translates to a [500,000] rank. And a [High] severity pattern \
         translates to a [250,000] rank. Rank values less than [1] or greater than [1,000,000] are \
         reserved for Amazon Web Services provided patterns. \n"]
  pattern : log_pattern_regex option;
      [@ocaml.doc
        "A regular expression that defines the log pattern. A log pattern can contain as many as \
         50 characters, and it cannot be empty. The pattern must be DFA compatible. Patterns that \
         utilize forward lookahead or backreference constructions are not supported.\n"]
  pattern_name : log_pattern_name option;
      [@ocaml.doc
        "The name of the log pattern. A log pattern name can contain as many as 50 characters, and \
         it cannot be empty. The characters can be Unicode letters, digits, or one of the \
         following symbols: period, dash, underscore.\n"]
  pattern_set_name : log_pattern_set_name option;
      [@ocaml.doc
        "The name of the log pattern. A log pattern name can contain as many as 30 characters, and \
         it cannot be empty. The characters can be Unicode letters, digits, or one of the \
         following symbols: period, dash, underscore.\n"]
}
[@@ocaml.doc "An object that defines the log patterns that belongs to a [LogPatternSet].\n"]

type nonrec update_log_pattern_response = {
  log_pattern : log_pattern option; [@ocaml.doc "The successfully created log pattern.\n"]
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec update_log_pattern_request = {
  rank : log_pattern_rank option;
      [@ocaml.doc
        "Rank of the log pattern. Must be a value between [1] and [1,000,000]. The patterns are \
         sorted by rank, so we recommend that you set your highest priority patterns with the \
         lowest rank. A pattern of rank [1] will be the first to get matched to a log line. A \
         pattern of rank [1,000,000] will be last to get matched. When you configure custom log \
         patterns from the console, a [Low] severity pattern translates to a [750,000] rank. A \
         [Medium] severity pattern translates to a [500,000] rank. And a [High] severity pattern \
         translates to a [250,000] rank. Rank values less than [1] or greater than [1,000,000] are \
         reserved for Amazon Web Services provided patterns. \n"]
  pattern : log_pattern_regex option;
      [@ocaml.doc
        "The log pattern. The pattern must be DFA compatible. Patterns that utilize forward \
         lookahead or backreference constructions are not supported.\n"]
  pattern_name : log_pattern_name; [@ocaml.doc "The name of the log pattern.\n"]
  pattern_set_name : log_pattern_set_name; [@ocaml.doc "The name of the log pattern set.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_exception = { message : error_msg option [@ocaml.doc ""] }
[@@ocaml.doc "The resource is already created or in use.\n"]

type nonrec update_component_response = unit [@@ocaml.doc ""]

type nonrec custom_component_name = string [@@ocaml.doc ""]

type nonrec resource_ar_n = string [@@ocaml.doc ""]

type nonrec resource_list = resource_ar_n list [@@ocaml.doc ""]

type nonrec update_component_request = {
  resource_list : resource_list option;
      [@ocaml.doc "The list of resource ARNs that belong to the component.\n"]
  new_component_name : custom_component_name option; [@ocaml.doc "The new name of the component.\n"]
  component_name : custom_component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec update_component_configuration_response = unit [@@ocaml.doc ""]

type nonrec monitor = bool [@@ocaml.doc ""]

type nonrec auto_config_enabled = bool [@@ocaml.doc ""]

type nonrec update_component_configuration_request = {
  auto_config_enabled : auto_config_enabled option;
      [@ocaml.doc
        " Automatically configures the component by applying the recommended configurations. \n"]
  component_configuration : component_configuration option;
      [@ocaml.doc
        "The configuration settings of the component. The value is the escaped JSON of the \
         configuration. For more information about the JSON format, see \
         {{:https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/working-with-json.html}Working \
         with JSON}. You can send a request to [DescribeComponentConfigurationRecommendation] to \
         see the recommended configuration for a component. For the complete format of the \
         component configuration file, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/component-config.html}Component \
         Configuration}.\n"]
  tier : tier option; [@ocaml.doc "The tier of the application component.\n"]
  monitor : monitor option;
      [@ocaml.doc "Indicates whether the application component is monitored.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec life_cycle = string [@@ocaml.doc ""]

type nonrec ops_item_sns_topic_arn = string [@@ocaml.doc ""]

type nonrec sns_notification_arn = string [@@ocaml.doc ""]

type nonrec ops_center_enabled = bool [@@ocaml.doc ""]

type nonrec cwe_monitor_enabled = bool [@@ocaml.doc ""]

type nonrec discovery_type = ACCOUNT_BASED [@ocaml.doc ""] | RESOURCE_GROUP_BASED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec attach_missing_permission = bool [@@ocaml.doc ""]

type nonrec application_info = {
  attach_missing_permission : attach_missing_permission option;
      [@ocaml.doc
        "If set to true, the managed policies for SSM and CW will be attached to the instance \
         roles if they are missing.\n"]
  discovery_type : discovery_type option;
      [@ocaml.doc " The method used by Application Insights to onboard your resources. \n"]
  auto_config_enabled : auto_config_enabled option;
      [@ocaml.doc " Indicates whether auto-configuration is turned on for this application. \n"]
  remarks : remarks option;
      [@ocaml.doc
        "The issues on the user side that block Application Insights from successfully monitoring \
         an application. Example remarks include:\n\n\
        \ {ul\n\
        \       {-  \226\128\156Configuring application, detected 1 Errors, 3 Warnings\226\128\157\n\
        \           \n\
        \            }\n\
        \       {-  \226\128\156Configuring application, detected 1 Unconfigured \
         Components\226\128\157\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  cwe_monitor_enabled : cwe_monitor_enabled option;
      [@ocaml.doc
        " Indicates whether Application Insights can listen to CloudWatch events for the \
         application resources, such as [instance terminated], [failed\n\
        \            deployment], and others. \n"]
  ops_center_enabled : ops_center_enabled option;
      [@ocaml.doc
        " Indicates whether Application Insights will create opsItems for any problem detected by \
         Application Insights for an application. \n"]
  sns_notification_arn : sns_notification_arn option;
      [@ocaml.doc
        " The SNS topic ARN that is associated with SNS notifications for updates or issues. \n"]
  ops_item_sns_topic_arn : ops_item_sns_topic_arn option;
      [@ocaml.doc
        " The SNS topic provided to Application Insights that is associated to the created \
         opsItems to receive SNS notifications for opsItem updates. \n"]
  life_cycle : life_cycle option; [@ocaml.doc "The lifecycle of the application. \n"]
  resource_group_name : resource_group_name option;
      [@ocaml.doc "The name of the resource group used for the application.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the owner of the application.\n"]
}
[@@ocaml.doc "Describes the status of the application.\n"]

type nonrec update_application_response = {
  application_info : application_info option; [@ocaml.doc "Information about the application. \n"]
}
[@@ocaml.doc ""]

type nonrec remove_sns_topic = bool [@@ocaml.doc ""]

type nonrec update_application_request = {
  attach_missing_permission : attach_missing_permission option;
      [@ocaml.doc
        "If set to true, the managed policies for SSM and CW will be attached to the instance \
         roles if they are missing.\n"]
  auto_config_enabled : auto_config_enabled option;
      [@ocaml.doc " Turns auto-configuration on or off. \n"]
  remove_sns_topic : remove_sns_topic option;
      [@ocaml.doc " Disassociates the SNS topic from the opsItem created for detected problems.\n"]
  sns_notification_arn : sns_notification_arn option;
      [@ocaml.doc
        " The SNS topic ARN. Allows you to receive SNS notifications for updates and issues with \
         an application. \n"]
  ops_item_sns_topic_arn : ops_item_sns_topic_arn option;
      [@ocaml.doc
        " The SNS topic provided to Application Insights that is associated to the created \
         opsItem. Allows you to receive notifications for updates to the opsItem.\n"]
  cwe_monitor_enabled : cwe_monitor_enabled option;
      [@ocaml.doc
        " Indicates whether Application Insights can listen to CloudWatch events for the \
         application resources, such as [instance terminated], [failed\n\
        \            deployment], and others. \n"]
  ops_center_enabled : ops_center_enabled option;
      [@ocaml.doc
        " When set to [true], creates opsItems for any problems detected on an application. \n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "The tags (tag keys) that you want to remove from the resource. When you specify a tag \
         key, the action removes both that key and its associated tag value.\n\n\
        \ To remove more than one tag from the application, append the [TagKeys] parameter and \
         argument for each additional tag to remove, separated by an ampersand. \n\
        \ "]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the application that you want to remove one or more \
         tags from.\n"]
}
[@@ocaml.doc ""]

type nonrec unit_ = string [@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  resource_name : amazon_resource_name option;
      [@ocaml.doc "The name of the resource with too many tags.\n"]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The number of the provided tags is beyond the limit, or the number of total tags you are trying \
   to attach to the specified resource exceeds the limit.\n"]

type nonrec title = string [@@ocaml.doc ""]

type nonrec tags_already_exist_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Tags are already registered for the specified application ARN.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "The optional part of a key-value pair that defines a tag. The maximum length of a tag \
         value is 256 characters. The minimum length is 0 characters. If you don't want an \
         application to have a specific tag value, don't specify a value for this parameter.\n"]
  key : tag_key;
      [@ocaml.doc
        "One part of a key-value pair that defines a tag. The maximum length of a tag key is 128 \
         characters. The minimum length is 1 character.\n"]
}
[@@ocaml.doc
  "An object that defines the tags associated with an application. A {i tag} is a label that you \
   optionally define and associate with an application. Tags can help you categorize and manage \
   resources in different ways, such as by purpose, owner, environment, or other criteria.\n\n\
  \ Each tag consists of a required {i tag key} and an associated {i tag value}, both of which you \
   define. A tag key is a general label that acts as a category for a more specific tag value. A \
   tag value acts as a descriptor within a tag key. A tag key can contain as many as 128 \
   characters. A tag value can contain as many as 256 characters. The characters can be Unicode \
   letters, digits, white space, or one of the following symbols: _ . : / = + -. The following \
   additional restrictions apply to tags:\n\
  \ \n\
  \  {ul\n\
  \        {-  Tag keys and values are case sensitive.\n\
  \            \n\
  \             }\n\
  \        {-  For each associated resource, each tag key must be unique and it can have only one \
   value.\n\
  \            \n\
  \             }\n\
  \        {-  The [aws:] prefix is reserved for use by Amazon Web Services; you can\226\128\153t \
   use it in any tag keys or values that you define. In addition, you can't edit or remove tag \
   keys or values that use this prefix. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "A list of tags that to add to the application. A tag consists of a required tag key \
         ([Key]) and an associated tag value ([Value]). The maximum length of a tag key is 128 \
         characters. The maximum length of a tag value is 256 characters.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the application that you want to add one or more tags to.\n"]
}
[@@ocaml.doc ""]

type nonrec status =
  | RECOVERING [@ocaml.doc ""]
  | RECURRING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | RESOLVED [@ocaml.doc ""]
  | IGNORE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec states_status = string [@@ocaml.doc ""]

type nonrec states_input = string [@@ocaml.doc ""]

type nonrec states_execution_arn = string [@@ocaml.doc ""]

type nonrec states_arn = string [@@ocaml.doc ""]

type nonrec start_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec source_type = string [@@ocaml.doc ""]

type nonrec source_ar_n = string [@@ocaml.doc ""]

type nonrec short_name = string [@@ocaml.doc ""]

type nonrec severity_level =
  | High [@ocaml.doc ""]
  | Medium [@ocaml.doc ""]
  | Low [@ocaml.doc ""]
  | Informative [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_event_name = string [@@ocaml.doc ""]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec resolution_method =
  | UNRESOLVED [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""]
  | MANUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec remove_workload_response = unit [@@ocaml.doc ""]

type nonrec remove_workload_request = {
  workload_id : workload_id; [@ocaml.doc "The ID of the workload.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec observation_id = string [@@ocaml.doc ""]

type nonrec end_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec log_group = string [@@ocaml.doc ""]

type nonrec line_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec log_text = string [@@ocaml.doc ""]

type nonrec log_filter = INFO [@ocaml.doc ""] | WARN [@ocaml.doc ""] | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_namespace = string [@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec cloud_watch_event_id = string [@@ocaml.doc ""]

type nonrec cloud_watch_event_source =
  | RDS [@ocaml.doc ""]
  | HEALTH [@ocaml.doc ""]
  | CODE_DEPLOY [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cloud_watch_event_detail_type = string [@@ocaml.doc ""]

type nonrec health_event_arn = string [@@ocaml.doc ""]

type nonrec health_service = string [@@ocaml.doc ""]

type nonrec health_event_type_code = string [@@ocaml.doc ""]

type nonrec health_event_type_category = string [@@ocaml.doc ""]

type nonrec health_event_description = string [@@ocaml.doc ""]

type nonrec code_deploy_deployment_id = string [@@ocaml.doc ""]

type nonrec code_deploy_deployment_group = string [@@ocaml.doc ""]

type nonrec code_deploy_state = string [@@ocaml.doc ""]

type nonrec code_deploy_application = string [@@ocaml.doc ""]

type nonrec code_deploy_instance_group_id = string [@@ocaml.doc ""]

type nonrec ec2_state = string [@@ocaml.doc ""]

type nonrec rds_event_categories = string [@@ocaml.doc ""]

type nonrec rds_event_message = string [@@ocaml.doc ""]

type nonrec ebs_event = string [@@ocaml.doc ""]

type nonrec ebs_result = string [@@ocaml.doc ""]

type nonrec ebs_cause = string [@@ocaml.doc ""]

type nonrec ebs_request_id = string [@@ocaml.doc ""]

type nonrec observation = {
  x_ray_node_type : x_ray_node_type option; [@ocaml.doc " The type of the X-Ray node. \n"]
  x_ray_node_name : x_ray_node_name option; [@ocaml.doc " The name of the X-Ray node. \n"]
  x_ray_request_average_latency : x_ray_request_average_latency option;
      [@ocaml.doc " The X-Ray node request average latency for this node. \n"]
  x_ray_request_count : x_ray_request_count option;
      [@ocaml.doc " The X-Ray request count for this node. \n"]
  x_ray_error_percent : x_ray_error_percent option;
      [@ocaml.doc " The X-Ray request error percentage for this node. \n"]
  x_ray_throttle_percent : x_ray_throttle_percent option;
      [@ocaml.doc " The X-Ray request throttle percentage for this node. \n"]
  x_ray_fault_percent : x_ray_fault_percent option;
      [@ocaml.doc " The X-Ray request fault percentage for this node. \n"]
  ebs_request_id : ebs_request_id option;
      [@ocaml.doc " The request ID of an EBS CloudWatch event. \n"]
  ebs_cause : ebs_cause option; [@ocaml.doc " The cause of an EBS CloudWatch event. \n"]
  ebs_result : ebs_result option;
      [@ocaml.doc " The result of an EBS CloudWatch event, such as [failed] or [succeeded]. \n"]
  ebs_event : ebs_event option;
      [@ocaml.doc
        " The type of EBS CloudWatch event, such as [createVolume], [deleteVolume] or \
         [attachVolume]. \n"]
  states_input : states_input option;
      [@ocaml.doc " The input to the step function-based observation. \n"]
  states_status : states_status option;
      [@ocaml.doc " The status of the step function-related observation. \n"]
  states_arn : states_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the step function-based observation. \n"]
  states_execution_arn : states_execution_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the step function execution-based observation. \n"]
  s3_event_name : s3_event_name option;
      [@ocaml.doc " The name of the S3 CloudWatch Event-based observation. \n"]
  rds_event_message : rds_event_message option; [@ocaml.doc " The message of an RDS event. \n"]
  rds_event_categories : rds_event_categories option;
      [@ocaml.doc " The category of an RDS event. \n"]
  ec2_state : ec2_state option;
      [@ocaml.doc " The state of the instance, such as [STOPPING] or [TERMINATING]. \n"]
  code_deploy_instance_group_id : code_deploy_instance_group_id option;
      [@ocaml.doc " The instance group to which the CodeDeploy instance belongs. \n"]
  code_deploy_application : code_deploy_application option;
      [@ocaml.doc " The CodeDeploy application to which the deployment belongs. \n"]
  code_deploy_state : code_deploy_state option;
      [@ocaml.doc
        " The status of the CodeDeploy deployment, for example [SUCCESS] or [\n\
        \            FAILURE]. \n"]
  code_deploy_deployment_group : code_deploy_deployment_group option;
      [@ocaml.doc " The deployment group to which the CodeDeploy deployment belongs. \n"]
  code_deploy_deployment_id : code_deploy_deployment_id option;
      [@ocaml.doc
        " The deployment ID of the CodeDeploy-based observation related to the detected problem. \n"]
  health_event_description : health_event_description option;
      [@ocaml.doc
        " The description of the Health event provided by the service, such as Amazon EC2. \n"]
  health_event_type_category : health_event_type_category option;
      [@ocaml.doc " The category of the Health event, such as [issue]. \n"]
  health_event_type_code : health_event_type_code option;
      [@ocaml.doc
        " The type of the Health event, for example, [AWS_EC2_POWER_CONNECTIVITY_ISSUE]. \n"]
  health_service : health_service option;
      [@ocaml.doc " The service to which the Health Event belongs, such as EC2. \n"]
  health_event_arn : health_event_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the Health Event-based observation.\n"]
  cloud_watch_event_detail_type : cloud_watch_event_detail_type option;
      [@ocaml.doc
        " The detail type of the CloudWatch Event-based observation, for example, [EC2\n\
        \            Instance State-change Notification]. \n"]
  cloud_watch_event_source : cloud_watch_event_source option;
      [@ocaml.doc " The source of the CloudWatch Event. \n"]
  cloud_watch_event_id : cloud_watch_event_id option;
      [@ocaml.doc
        " The ID of the CloudWatch Event-based observation related to the detected problem. \n"]
  value : value option; [@ocaml.doc "The value of the source observation metric.\n"]
  unit_ : unit_ option; [@ocaml.doc "The unit of the source observation metric.\n"]
  metric_name : metric_name option; [@ocaml.doc "The name of the observation metric.\n"]
  metric_namespace : metric_namespace option;
      [@ocaml.doc "The namespace of the observation metric.\n"]
  log_filter : log_filter option; [@ocaml.doc "The log filter of the observation.\n"]
  log_text : log_text option; [@ocaml.doc "The log text of the observation.\n"]
  line_time : line_time option;
      [@ocaml.doc
        "The timestamp in the CloudWatch Logs that specifies when the matched line occurred.\n"]
  log_group : log_group option; [@ocaml.doc "The log group name.\n"]
  source_ar_n : source_ar_n option; [@ocaml.doc "The source resource ARN of the observation.\n"]
  source_type : source_type option; [@ocaml.doc "The source type of the observation.\n"]
  end_time : end_time option;
      [@ocaml.doc "The time when the observation ended, in epoch seconds.\n"]
  start_time : start_time option;
      [@ocaml.doc "The time when the observation was first detected, in epoch seconds.\n"]
  id : observation_id option; [@ocaml.doc "The ID of the observation type.\n"]
}
[@@ocaml.doc "Describes an anomaly or error with the application.\n"]

type nonrec observation_list = observation list [@@ocaml.doc ""]

type nonrec related_observations = {
  observation_list : observation_list option;
      [@ocaml.doc "The list of observations related to the problem.\n"]
}
[@@ocaml.doc "Describes observations related to the problem.\n"]

type nonrec recurring_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec recommendation_type =
  | ALL [@ocaml.doc ""]
  | WORKLOAD_ONLY [@ocaml.doc ""]
  | INFRA_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec insights = string [@@ocaml.doc ""]

type nonrec affected_resource = string [@@ocaml.doc ""]

type nonrec feedback_value =
  | NOT_USEFUL [@ocaml.doc ""]
  | USEFUL [@ocaml.doc ""]
  | NOT_SPECIFIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec feedback_key = INSIGHTS_FEEDBACK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec feedback = (feedback_key * feedback_value) list [@@ocaml.doc ""]

type nonrec last_recurrence_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec problem = {
  resolution_method : resolution_method option;
      [@ocaml.doc
        "Specifies how the problem was resolved. If the value is [AUTOMATIC], the system resolved \
         the problem. If the value is [MANUAL], the user resolved the problem. If the value is \
         [UNRESOLVED], then the problem is not resolved.\n"]
  visibility : visibility option;
      [@ocaml.doc
        "Specifies whether or not you can view the problem. Updates to ignored problems do not \
         generate notifications.\n"]
  last_recurrence_time : last_recurrence_time option;
      [@ocaml.doc " The last time that the problem reoccurred after its last resolution. \n"]
  recurring_count : recurring_count option;
      [@ocaml.doc
        " The number of times that the same problem reoccurred after the first time it was \
         resolved. \n"]
  feedback : feedback option; [@ocaml.doc "Feedback provided by the user about the problem.\n"]
  resource_group_name : resource_group_name option;
      [@ocaml.doc "The name of the resource group affected by the problem.\n"]
  account_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID for the owner of the resource group affected by the \
         problem.\n"]
  severity_level : severity_level option;
      [@ocaml.doc "A measure of the level of impact of the problem.\n"]
  end_time : end_time option; [@ocaml.doc "The time when the problem ended, in epoch seconds.\n"]
  start_time : start_time option;
      [@ocaml.doc "The time when the problem started, in epoch seconds.\n"]
  affected_resource : affected_resource option;
      [@ocaml.doc "The resource affected by the problem.\n"]
  status : status option; [@ocaml.doc "The status of the problem.\n"]
  insights : insights option;
      [@ocaml.doc "A detailed analysis of the problem using machine learning.\n"]
  short_name : short_name option;
      [@ocaml.doc " The short name of the problem associated with the SNS notification. \n"]
  title : title option; [@ocaml.doc "The name of the problem.\n"]
  id : problem_id option; [@ocaml.doc "The ID of the problem.\n"]
}
[@@ocaml.doc "Describes a problem that is detected by correlating observations.\n"]

type nonrec problem_list = problem list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec os_type = LINUX [@ocaml.doc ""] | WINDOWS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec max_entities = int [@@ocaml.doc ""]

type nonrec log_pattern_set_list = log_pattern_set_name list [@@ocaml.doc ""]

type nonrec log_pattern_list = log_pattern list [@@ocaml.doc ""]

type nonrec list_workloads_response = {
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  workload_list : workload_list option; [@ocaml.doc "The list of workloads.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workloads_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the owner of the workload.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned [NextToken] value.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc
        "An array that lists all the tags that are associated with the application. Each tag \
         consists of a required tag key ([Key]) and an associated tag value ([Value]).\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the application that you want to retrieve tag \
         information for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_problems_response = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  resource_group_name : resource_group_name option;
      [@ocaml.doc " The name of the resource group. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token used to retrieve the next page of results. This value is [null] when there are \
         no more results to return. \n"]
  problem_list : problem_list option; [@ocaml.doc "The list of problems. \n"]
}
[@@ocaml.doc ""]

type nonrec list_problems_request = {
  visibility : visibility option;
      [@ocaml.doc
        "Specifies whether or not you can view the problem. If not specified, visible and ignored \
         problems are returned.\n"]
  component_name : component_name option; [@ocaml.doc " The name of the component. \n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned [NextToken] value.\n"]
  end_time : end_time option;
      [@ocaml.doc
        "The time when the problem ended, in epoch seconds. If not specified, problems within the \
         past seven days are returned.\n"]
  start_time : start_time option;
      [@ocaml.doc
        "The time when the problem was detected, in epoch seconds. If you don't specify a time \
         frame for the request, problems within the past seven days are returned.\n"]
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_patterns_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token used to retrieve the next page of results. This value is [null] when there are \
         no more results to return. \n"]
  log_patterns : log_pattern_list option; [@ocaml.doc "The list of log patterns.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_patterns_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned [NextToken] value.\n"]
  pattern_set_name : log_pattern_set_name option; [@ocaml.doc "The name of the log pattern set.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_pattern_sets_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token used to retrieve the next page of results. This value is [null] when there are \
         no more results to return. \n"]
  log_pattern_sets : log_pattern_set_list option; [@ocaml.doc "The list of log pattern sets.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec list_log_pattern_sets_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned [NextToken] value.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec configuration_event_monitored_resource_ar_n = string [@@ocaml.doc ""]

type nonrec configuration_event_status =
  | ERROR [@ocaml.doc ""]
  | WARN [@ocaml.doc ""]
  | INFO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec configuration_event_resource_type =
  | SSM_ASSOCIATION [@ocaml.doc ""]
  | CLOUDFORMATION [@ocaml.doc ""]
  | CLOUDWATCH_LOG [@ocaml.doc ""]
  | CLOUDWATCH_ALARM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec configuration_event_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec configuration_event_detail = string [@@ocaml.doc ""]

type nonrec configuration_event_resource_name = string [@@ocaml.doc ""]

type nonrec configuration_event = {
  event_resource_name : configuration_event_resource_name option;
      [@ocaml.doc " The name of the resource Application Insights attempted to configure. \n"]
  event_detail : configuration_event_detail option;
      [@ocaml.doc " The details of the event in plain text. \n"]
  event_time : configuration_event_time option; [@ocaml.doc " The timestamp of the event. \n"]
  event_resource_type : configuration_event_resource_type option;
      [@ocaml.doc
        " The resource type that Application Insights attempted to configure, for example, \
         CLOUDWATCH_ALARM. \n"]
  event_status : configuration_event_status option;
      [@ocaml.doc
        " The status of the configuration update event. Possible values include INFO, WARN, and \
         ERROR. \n"]
  monitored_resource_ar_n : configuration_event_monitored_resource_ar_n option;
      [@ocaml.doc " The resource monitored by Application Insights. \n"]
  account_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID for the owner of the application to which the \
         configuration event belongs.\n"]
  resource_group_name : resource_group_name option;
      [@ocaml.doc
        "The name of the resource group of the application to which the configuration event belongs.\n"]
}
[@@ocaml.doc " The event information. \n"]

type nonrec configuration_event_list = configuration_event list [@@ocaml.doc ""]

type nonrec list_configuration_history_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The [NextToken] value to include in a future [ListConfigurationHistory] request. When the \
         results of a [ListConfigurationHistory] request exceed [MaxResults], this value can be \
         used to retrieve the next page of results. This value is [null] when there are no more \
         results to return.\n"]
  event_list : configuration_event_list option;
      [@ocaml.doc " The list of configuration events and their corresponding details. \n"]
}
[@@ocaml.doc ""]

type nonrec list_configuration_history_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The [NextToken] value returned from a previous paginated [ListConfigurationHistory] \
         request where [MaxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [NextToken] \
         value. This value is [null] when there are no more results to return.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        " The maximum number of results returned by [ListConfigurationHistory] in paginated \
         output. When this parameter is used, [ListConfigurationHistory] returns only [MaxResults] \
         in a single page along with a [NextToken] response element. The remaining results of the \
         initial request can be seen by sending another [ListConfigurationHistory] request with \
         the returned [NextToken] value. If this parameter is not used, then \
         [ListConfigurationHistory] returns all results. \n"]
  event_status : configuration_event_status option;
      [@ocaml.doc
        "The status of the configuration update event. Possible values include INFO, WARN, and \
         ERROR.\n"]
  end_time : end_time option; [@ocaml.doc "The end time of the event.\n"]
  start_time : start_time option; [@ocaml.doc "The start time of the event. \n"]
  resource_group_name : resource_group_name option;
      [@ocaml.doc "Resource group to which the application belongs. \n"]
}
[@@ocaml.doc ""]

type nonrec detected_workload = (tier * workload_meta_data) list [@@ocaml.doc ""]

type nonrec application_component = {
  detected_workload : detected_workload option;
      [@ocaml.doc " Workloads detected in the application component. \n"]
  monitor : monitor option;
      [@ocaml.doc "Indicates whether the application component is monitored. \n"]
  tier : tier option; [@ocaml.doc "The stack tier of the application component.\n"]
  os_type : os_type option; [@ocaml.doc " The operating system of the component. \n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The resource type. Supported resource types include EC2 instances, Auto Scaling group, \
         Classic ELB, Application ELB, and SQS Queue.\n"]
  component_remarks : remarks option;
      [@ocaml.doc
        " If logging is supported for the resource type, indicates whether the component has \
         configured logs to be monitored. \n"]
  component_name : component_name option; [@ocaml.doc "The name of the component.\n"]
}
[@@ocaml.doc
  "Describes a standalone resource or similarly grouped resources that the application is made up \
   of.\n"]

type nonrec application_component_list = application_component list [@@ocaml.doc ""]

type nonrec list_components_response = {
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  application_component_list : application_component_list option;
      [@ocaml.doc "The list of application components.\n"]
}
[@@ocaml.doc ""]

type nonrec list_components_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned [NextToken] value.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec application_info_list = application_info list [@@ocaml.doc ""]

type nonrec list_applications_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token used to retrieve the next page of results. This value is [null] when there are \
         no more results to return. \n"]
  application_info_list : application_info_list option; [@ocaml.doc "The list of applications.\n"]
}
[@@ocaml.doc ""]

type nonrec list_applications_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_entities option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned [NextToken] value.\n"]
}
[@@ocaml.doc ""]

type nonrec grouping_type = ACCOUNT_BASED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec describe_workload_response = {
  workload_configuration : workload_configuration option;
      [@ocaml.doc
        "The configuration settings of the workload. The value is the escaped JSON of the \
         configuration.\n"]
  workload_remarks : remarks option;
      [@ocaml.doc
        "If logging is supported for the resource type, shows whether the component has configured \
         logs to be monitored.\n"]
  workload_id : workload_id option; [@ocaml.doc "The ID of the workload.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workload_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the workload owner.\n"]
  workload_id : workload_id; [@ocaml.doc "The ID of the workload.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_problem_observations_response = {
  related_observations : related_observations option;
      [@ocaml.doc "Observations related to the problem.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_problem_observations_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  problem_id : problem_id; [@ocaml.doc "The ID of the problem.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_problem_response = {
  sns_notification_arn : sns_notification_arn option;
      [@ocaml.doc " The SNS notification topic ARN of the problem. \n"]
  problem : problem option; [@ocaml.doc "Information about the problem. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_problem_request = {
  account_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID for the owner of the resource group affected by the \
         problem.\n"]
  problem_id : problem_id; [@ocaml.doc "The ID of the problem.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_observation_response = {
  observation : observation option; [@ocaml.doc "Information about the observation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_observation_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  observation_id : observation_id; [@ocaml.doc "The ID of the observation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_log_pattern_response = {
  log_pattern : log_pattern option; [@ocaml.doc "The successfully created log pattern.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_log_pattern_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  pattern_name : log_pattern_name; [@ocaml.doc "The name of the log pattern.\n"]
  pattern_set_name : log_pattern_set_name; [@ocaml.doc "The name of the log pattern set.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_component_configuration_recommendation_response = {
  component_configuration : component_configuration option;
      [@ocaml.doc
        "The recommended configuration settings of the component. The value is the escaped JSON of \
         the configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_component_configuration_recommendation_request = {
  recommendation_type : recommendation_type option;
      [@ocaml.doc "The recommended configuration type.\n"]
  workload_name : workload_name option;
      [@ocaml.doc
        "The name of the workload. The name of the workload is required when the tier of the \
         application component is [SAP_ASE_SINGLE_NODE] or [SAP_ASE_HIGH_AVAILABILITY].\n"]
  tier : tier; [@ocaml.doc "The tier of the application component.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_component_configuration_response = {
  component_configuration : component_configuration option;
      [@ocaml.doc
        "The configuration settings of the component. The value is the escaped JSON of the \
         configuration.\n"]
  tier : tier option;
      [@ocaml.doc
        "The tier of the application component. Supported tiers include [DOT_NET_CORE], \
         [DOT_NET_WORKER], [DOT_NET_WEB], [SQL_SERVER], and [DEFAULT] \n"]
  monitor : monitor option;
      [@ocaml.doc "Indicates whether the application component is monitored.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_component_configuration_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_component_response = {
  resource_list : resource_list option;
      [@ocaml.doc "The list of resource ARNs that belong to the component.\n"]
  application_component : application_component option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_component_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_response = {
  application_info : application_info option; [@ocaml.doc "Information about the application.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_request = {
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID for the resource group owner.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec bad_request_exception = { message : error_msg option [@ocaml.doc ""] }
[@@ocaml.doc "The request is not understood by the server.\n"]

type nonrec delete_log_pattern_response = unit [@@ocaml.doc ""]

type nonrec delete_log_pattern_request = {
  pattern_name : log_pattern_name; [@ocaml.doc "The name of the log pattern.\n"]
  pattern_set_name : log_pattern_set_name; [@ocaml.doc "The name of the log pattern set.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_component_response = unit [@@ocaml.doc ""]

type nonrec delete_component_request = {
  component_name : custom_component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_application_response = unit [@@ocaml.doc ""]

type nonrec delete_application_request = {
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_log_pattern_response = {
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
  log_pattern : log_pattern option; [@ocaml.doc "The successfully created log pattern.\n"]
}
[@@ocaml.doc ""]

type nonrec create_log_pattern_request = {
  rank : log_pattern_rank;
      [@ocaml.doc
        "Rank of the log pattern. Must be a value between [1] and [1,000,000]. The patterns are \
         sorted by rank, so we recommend that you set your highest priority patterns with the \
         lowest rank. A pattern of rank [1] will be the first to get matched to a log line. A \
         pattern of rank [1,000,000] will be last to get matched. When you configure custom log \
         patterns from the console, a [Low] severity pattern translates to a [750,000] rank. A \
         [Medium] severity pattern translates to a [500,000] rank. And a [High] severity pattern \
         translates to a [250,000] rank. Rank values less than [1] or greater than [1,000,000] are \
         reserved for Amazon Web Services provided patterns. \n"]
  pattern : log_pattern_regex;
      [@ocaml.doc
        "The log pattern. The pattern must be DFA compatible. Patterns that utilize forward \
         lookahead or backreference constructions are not supported.\n"]
  pattern_name : log_pattern_name; [@ocaml.doc "The name of the log pattern.\n"]
  pattern_set_name : log_pattern_set_name; [@ocaml.doc "The name of the log pattern set.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_component_response = unit [@@ocaml.doc ""]

type nonrec create_component_request = {
  resource_list : resource_list;
      [@ocaml.doc "The list of resource ARNs that belong to the component.\n"]
  component_name : custom_component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec access_denied_exception = { message : error_msg option [@ocaml.doc ""] }
[@@ocaml.doc " User does not have permissions to perform this action. \n"]

type nonrec create_application_response = {
  application_info : application_info option; [@ocaml.doc "Information about the application.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_create = bool [@@ocaml.doc ""]

type nonrec create_application_request = {
  attach_missing_permission : attach_missing_permission option;
      [@ocaml.doc
        "If set to true, the managed policies for SSM and CW will be attached to the instance \
         roles if they are missing.\n"]
  grouping_type : grouping_type option;
      [@ocaml.doc
        "Application Insights can create applications based on a resource group or on an account. \
         To create an account-based application using all of the resources in the account, set \
         this parameter to [ACCOUNT_BASED]. \n"]
  auto_create : auto_create option;
      [@ocaml.doc
        " Configures all of the resources in the resource group by applying the recommended \
         configurations. \n"]
  auto_config_enabled : auto_config_enabled option;
      [@ocaml.doc
        " Indicates whether Application Insights automatically configures unmonitored resources in \
         the resource group. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "List of tags to add to the application. tag key ([Key]) and an associated tag value \
         ([Value]). The maximum length of a tag key is 128 characters. The maximum length of a tag \
         value is 256 characters.\n"]
  sns_notification_arn : sns_notification_arn option;
      [@ocaml.doc " The SNS notification topic ARN. \n"]
  ops_item_sns_topic_arn : ops_item_sns_topic_arn option;
      [@ocaml.doc
        " The SNS topic provided to Application Insights that is associated to the created \
         opsItem. Allows you to receive notifications for updates to the opsItem. \n"]
  cwe_monitor_enabled : cwe_monitor_enabled option;
      [@ocaml.doc
        " Indicates whether Application Insights can listen to CloudWatch events for the \
         application resources, such as [instance terminated], [failed\n\
        \            deployment], and others. \n"]
  ops_center_enabled : ops_center_enabled option;
      [@ocaml.doc
        " When set to [true], creates opsItems for any problems detected on an application. \n"]
  resource_group_name : resource_group_name option; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec add_workload_response = {
  workload_configuration : workload_configuration option;
      [@ocaml.doc
        "The configuration settings of the workload. The value is the escaped JSON of the \
         configuration.\n"]
  workload_id : workload_id option; [@ocaml.doc "The ID of the workload.\n"]
}
[@@ocaml.doc ""]

type nonrec add_workload_request = {
  workload_configuration : workload_configuration;
      [@ocaml.doc
        "The configuration settings of the workload. The value is the escaped JSON of the \
         configuration.\n"]
  component_name : component_name; [@ocaml.doc "The name of the component.\n"]
  resource_group_name : resource_group_name; [@ocaml.doc "The name of the resource group.\n"]
}
[@@ocaml.doc ""]
