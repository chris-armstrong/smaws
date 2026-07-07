type nonrec version = string [@@ocaml.doc ""]

type nonrec attribute_key = string [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute = {
  value : attribute_value option; [@ocaml.doc "The value assigned to the attribute key.\n"]
  key : attribute_key; [@ocaml.doc "The attribute key.\n"]
}
[@@ocaml.doc
  "This data type is used as a request parameter in the [AddAttributesToFindings] and \
   [CreateAssessmentTemplate] actions.\n"]

type nonrec user_attribute_list = attribute list [@@ocaml.doc ""]

type nonrec user_attribute_key_list = attribute_key list [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec assessment_target_name = string [@@ocaml.doc ""]

type nonrec update_assessment_target_request = {
  resource_group_arn : arn option;
      [@ocaml.doc
        "The ARN of the resource group that is used to specify the new resource group to associate \
         with the assessment target.\n"]
  assessment_target_name : assessment_target_name;
      [@ocaml.doc "The name of the assessment target that you want to update.\n"]
  assessment_target_arn : arn;
      [@ocaml.doc "The ARN of the assessment target that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec bool_ = bool [@@ocaml.doc ""]

type nonrec service_temporarily_unavailable_exception = {
  can_retry : bool_; [@ocaml.doc "You can wait and then retry your request.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc "The serice is temporary unavailable.\n"]

type nonrec no_such_entity_error_code =
  | IAM_ROLE_DOES_NOT_EXIST [@ocaml.doc ""]
  | SNS_TOPIC_DOES_NOT_EXIST [@ocaml.doc ""]
  | RULES_PACKAGE_DOES_NOT_EXIST [@ocaml.doc ""]
  | RESOURCE_GROUP_DOES_NOT_EXIST [@ocaml.doc ""]
  | FINDING_DOES_NOT_EXIST [@ocaml.doc ""]
  | ASSESSMENT_RUN_DOES_NOT_EXIST [@ocaml.doc ""]
  | ASSESSMENT_TEMPLATE_DOES_NOT_EXIST [@ocaml.doc ""]
  | ASSESSMENT_TARGET_DOES_NOT_EXIST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec no_such_entity_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  error_code : no_such_entity_error_code;
      [@ocaml.doc "Code that indicates the type of error that is generated.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc
  "The request was rejected because it referenced an entity that does not exist. The error code \
   describes the entity.\n"]

type nonrec invalid_input_error_code =
  | INVALID_NUMBER_OF_SEVERITIES [@ocaml.doc ""]
  | INVALID_NUMBER_OF_RULE_NAMES [@ocaml.doc ""]
  | INVALID_NUMBER_OF_AUTO_SCALING_GROUPS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_AGENT_IDS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_USER_ATTRIBUTES [@ocaml.doc ""]
  | INVALID_NUMBER_OF_ATTRIBUTES [@ocaml.doc ""]
  | INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_TAGS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES [@ocaml.doc ""]
  | INVALID_NUMBER_OF_RULES_PACKAGE_ARNS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_FINDING_ARNS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS [@ocaml.doc ""]
  | INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS [@ocaml.doc ""]
  | ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN [@ocaml.doc ""]
  | ASSESSMENT_TARGET_NAME_ALREADY_TAKEN [@ocaml.doc ""]
  | INVALID_EVENT [@ocaml.doc ""]
  | INVALID_LOCALE [@ocaml.doc ""]
  | INVALID_SEVERITY [@ocaml.doc ""]
  | INVALID_RULE_NAME [@ocaml.doc ""]
  | INVALID_AUTO_SCALING_GROUP [@ocaml.doc ""]
  | INVALID_AGENT_ID [@ocaml.doc ""]
  | INVALID_MAX_RESULTS [@ocaml.doc ""]
  | INVALID_PAGINATION_TOKEN [@ocaml.doc ""]
  | INVALID_USER_ATTRIBUTE_VALUE [@ocaml.doc ""]
  | INVALID_USER_ATTRIBUTE_KEY [@ocaml.doc ""]
  | INVALID_USER_ATTRIBUTE [@ocaml.doc ""]
  | INVALID_ATTRIBUTE [@ocaml.doc ""]
  | INVALID_RESOURCE_GROUP_TAG_VALUE [@ocaml.doc ""]
  | INVALID_RESOURCE_GROUP_TAG_KEY [@ocaml.doc ""]
  | INVALID_TAG_VALUE [@ocaml.doc ""]
  | INVALID_TAG_KEY [@ocaml.doc ""]
  | INVALID_TAG [@ocaml.doc ""]
  | INVALID_ASSESSMENT_RUN_STATE [@ocaml.doc ""]
  | INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE [@ocaml.doc ""]
  | INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE [@ocaml.doc ""]
  | INVALID_ASSESSMENT_RUN_START_TIME_RANGE [@ocaml.doc ""]
  | INVALID_ASSESSMENT_RUN_DURATION_RANGE [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TEMPLATE_DURATION [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TEMPLATE_NAME [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TARGET_NAME_PATTERN [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TARGET_NAME [@ocaml.doc ""]
  | INVALID_IAM_ROLE_ARN [@ocaml.doc ""]
  | INVALID_SNS_TOPIC_ARN [@ocaml.doc ""]
  | INVALID_RESOURCE_ARN [@ocaml.doc ""]
  | INVALID_RULES_PACKAGE_ARN [@ocaml.doc ""]
  | INVALID_RESOURCE_GROUP_ARN [@ocaml.doc ""]
  | INVALID_FINDING_ARN [@ocaml.doc ""]
  | INVALID_ASSESSMENT_RUN_ARN [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TEMPLATE_ARN [@ocaml.doc ""]
  | INVALID_ASSESSMENT_TARGET_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invalid_input_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  error_code : invalid_input_error_code;
      [@ocaml.doc "Code that indicates the type of error that is generated.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc
  "The request was rejected because an invalid or out-of-range value was supplied for an input \
   parameter.\n"]

type nonrec internal_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc "Internal server error.\n"]

type nonrec access_denied_error_code =
  | ACCESS_DENIED_TO_IAM_ROLE [@ocaml.doc ""]
  | ACCESS_DENIED_TO_SNS_TOPIC [@ocaml.doc ""]
  | ACCESS_DENIED_TO_RULES_PACKAGE [@ocaml.doc ""]
  | ACCESS_DENIED_TO_RESOURCE_GROUP [@ocaml.doc ""]
  | ACCESS_DENIED_TO_FINDING [@ocaml.doc ""]
  | ACCESS_DENIED_TO_ASSESSMENT_RUN [@ocaml.doc ""]
  | ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE [@ocaml.doc ""]
  | ACCESS_DENIED_TO_ASSESSMENT_TARGET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  error_code : access_denied_error_code;
      [@ocaml.doc "Code that indicates the type of error that is generated.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc "You do not have required permissions to access the requested resource.\n"]

type nonrec unsupported_feature_exception = {
  can_retry : bool_; [@ocaml.doc ""]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Used by the [GetAssessmentReport] API. The request was rejected because you tried to generate a \
   report for an assessment run that existed before reporting was supported in Amazon Inspector. \
   You can only generate reports for assessment runs that took place or will take place after \
   generating reports in Amazon Inspector became available.\n"]

type nonrec inspector_event =
  | OTHER [@ocaml.doc ""]
  | FINDING_REPORTED [@ocaml.doc ""]
  | ASSESSMENT_RUN_STATE_CHANGED [@ocaml.doc ""]
  | ASSESSMENT_RUN_COMPLETED [@ocaml.doc ""]
  | ASSESSMENT_RUN_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec unsubscribe_from_event_request = {
  topic_arn : arn; [@ocaml.doc "The ARN of the SNS topic to which SNS notifications are sent.\n"]
  event : inspector_event;
      [@ocaml.doc "The event for which you want to stop receiving SNS notifications.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment template that is used during the event for which you want to \
         stop receiving SNS notifications.\n"]
}
[@@ocaml.doc ""]

type nonrec uui_d = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec timestamp_range = {
  end_date : timestamp option; [@ocaml.doc "The maximum value of the timestamp range.\n"]
  begin_date : timestamp option; [@ocaml.doc "The minimum value of the timestamp range.\n"]
}
[@@ocaml.doc "This data type is used in the [AssessmentRunFilter] data type.\n"]

type nonrec text = string [@@ocaml.doc ""]

type nonrec message_type = string [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec telemetry_metadata = {
  data_size : long option;
      [@ocaml.doc
        "The data size of messages that the agent sends to the Amazon Inspector service.\n"]
  count : long;
      [@ocaml.doc "The count of messages that the agent sends to the Amazon Inspector service.\n"]
  message_type : message_type;
      [@ocaml.doc "A specific type of behavioral data that is collected by the agent.\n"]
}
[@@ocaml.doc
  "The metadata about the Amazon Inspector application data metrics collected by the agent. This \
   data type is used as the response element in the [GetTelemetryMetadata] action.\n"]

type nonrec telemetry_metadata_list = telemetry_metadata list [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "A value assigned to a tag key.\n"]
  key : tag_key; [@ocaml.doc "A tag key.\n"]
}
[@@ocaml.doc
  "A key and value pair. This data type is used as a request parameter in the [SetTagsForResource] \
   action and a response element in the [ListTagsForResource] action.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec event_subscription = {
  subscribed_at : timestamp; [@ocaml.doc "The time at which [SubscribeToEvent] is called.\n"]
  event : inspector_event;
      [@ocaml.doc
        "The event for which Amazon Simple Notification Service (SNS) notifications are sent.\n"]
}
[@@ocaml.doc "This data type is used in the [Subscription] data type.\n"]

type nonrec event_subscription_list = event_subscription list [@@ocaml.doc ""]

type nonrec subscription = {
  event_subscriptions : event_subscription_list;
      [@ocaml.doc "The list of existing event subscriptions.\n"]
  topic_arn : arn;
      [@ocaml.doc
        "The ARN of the Amazon Simple Notification Service (SNS) topic to which the SNS \
         notifications are sent.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment template that is used during the event for which the SNS \
         notification is sent.\n"]
}
[@@ocaml.doc
  "This data type is used as a response element in the [ListEventSubscriptions] action.\n"]

type nonrec subscription_list = subscription list [@@ocaml.doc ""]

type nonrec subscribe_to_event_request = {
  topic_arn : arn;
      [@ocaml.doc "The ARN of the SNS topic to which the SNS notifications are sent.\n"]
  event : inspector_event;
      [@ocaml.doc "The event for which you want to receive SNS notifications.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment template that is used during the event for which you want to \
         receive SNS notifications.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_error_code =
  | EVENT_SUBSCRIPTION_LIMIT_EXCEEDED [@ocaml.doc ""]
  | RESOURCE_GROUP_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ASSESSMENT_RUN_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ASSESSMENT_TARGET_LIMIT_EXCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  error_code : limit_exceeded_error_code;
      [@ocaml.doc "Code that indicates the type of error that is generated.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc
  "The request was rejected because it attempted to create resources beyond the current AWS \
   account limits. The error code describes the limit exceeded.\n"]

type nonrec stop_action = SKIP_EVALUATION [@ocaml.doc ""] | START_EVALUATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_assessment_run_request = {
  stop_action : stop_action option;
      [@ocaml.doc
        "An input option that can be set to either START_EVALUATION or SKIP_EVALUATION. \
         START_EVALUATION (the default value), stops the AWS agent from collecting data and begins \
         the results evaluation and the findings generation process. SKIP_EVALUATION cancels the \
         assessment run immediately, after which no findings are generated.\n"]
  assessment_run_arn : arn; [@ocaml.doc "The ARN of the assessment run that you want to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec start_assessment_run_response = {
  assessment_run_arn : arn; [@ocaml.doc "The ARN of the assessment run that has been started.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_run_name = string [@@ocaml.doc ""]

type nonrec start_assessment_run_request = {
  assessment_run_name : assessment_run_name option;
      [@ocaml.doc
        "You can specify the name for the assessment run. The name must be unique for the \
         assessment template whose ARN is used to start the assessment run.\n"]
  assessment_template_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment template of the assessment run that you want to start.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_cross_account_role_error_code =
  | ROLE_DOES_NOT_HAVE_CORRECT_POLICY [@ocaml.doc ""]
  | ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invalid_cross_account_role_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  error_code : invalid_cross_account_role_error_code;
      [@ocaml.doc "Code that indicates the type of error that is generated.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc
  "Amazon Inspector cannot assume the cross-account role that it needs to list your EC2 instances \
   during the assessment run.\n"]

type nonrec agent_id = string [@@ocaml.doc ""]

type nonrec agent_already_running_assessment = {
  assessment_run_arn : arn;
      [@ocaml.doc "The ARN of the assessment run that has already been started.\n"]
  agent_id : agent_id;
      [@ocaml.doc
        "ID of the agent that is running on an EC2 instance that is already participating in \
         another started assessment run.\n"]
}
[@@ocaml.doc
  "Used in the exception error that is thrown if you start an assessment run for an assessment \
   target that includes an EC2 instance that is already participating in another started \
   assessment run.\n"]

type nonrec agent_already_running_assessment_list = agent_already_running_assessment list
[@@ocaml.doc ""]

type nonrec agents_already_running_assessment_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  agents_truncated : bool_; [@ocaml.doc "\n"]
  agents : agent_already_running_assessment_list; [@ocaml.doc "\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc
  "You started an assessment run, but one of the instances is already participating in another \
   assessment run.\n"]

type nonrec severity =
  | UNDEFINED [@ocaml.doc ""]
  | INFORMATIONAL [@ocaml.doc ""]
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec severity_list = severity list [@@ocaml.doc ""]

type nonrec set_tags_for_resource_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A collection of key and value pairs that you want to set to the assessment template.\n"]
  resource_arn : arn;
      [@ocaml.doc "The ARN of the assessment template that you want to set tags to.\n"]
}
[@@ocaml.doc ""]

type nonrec service_name = string [@@ocaml.doc ""]

type nonrec security_group = {
  group_id : text option; [@ocaml.doc "The ID of the security group.\n"]
  group_name : text option; [@ocaml.doc "The name of the security group.\n"]
}
[@@ocaml.doc
  "Contains information about a security group associated with a network interface. This data type \
   is used as one of the elements of the [NetworkInterface] data type.\n"]

type nonrec security_groups = security_group list [@@ocaml.doc ""]

type nonrec scope_value = string [@@ocaml.doc ""]

type nonrec scope_type = RULES_PACKAGE_ARN [@ocaml.doc ""] | INSTANCE_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scope = {
  value : scope_value option; [@ocaml.doc "The resource identifier for the specified scope type.\n"]
  key : scope_type option; [@ocaml.doc "The type of the scope.\n"]
}
[@@ocaml.doc "This data type contains key-value pairs that identify various Amazon resources.\n"]

type nonrec scope_list = scope list [@@ocaml.doc ""]

type nonrec rules_package_name = string [@@ocaml.doc ""]

type nonrec provider_name = string [@@ocaml.doc ""]

type nonrec rules_package = {
  description : text option; [@ocaml.doc "The description of the rules package.\n"]
  provider : provider_name; [@ocaml.doc "The provider of the rules package.\n"]
  version : version; [@ocaml.doc "The version ID of the rules package.\n"]
  name : rules_package_name; [@ocaml.doc "The name of the rules package.\n"]
  arn : arn; [@ocaml.doc "The ARN of the rules package.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Inspector rules package. This data type is used as the \
   response element in the [DescribeRulesPackages] action.\n"]

type nonrec rules_package_list = rules_package list [@@ocaml.doc ""]

type nonrec rule_name = string [@@ocaml.doc ""]

type nonrec rule_name_list = rule_name list [@@ocaml.doc ""]

type nonrec resource_group_tag = {
  value : tag_value option; [@ocaml.doc "The value assigned to a tag key.\n"]
  key : tag_key; [@ocaml.doc "A tag key.\n"]
}
[@@ocaml.doc "This data type is used as one of the elements of the [ResourceGroup] data type.\n"]

type nonrec resource_group_tags = resource_group_tag list [@@ocaml.doc ""]

type nonrec resource_group = {
  created_at : timestamp; [@ocaml.doc "The time at which resource group is created.\n"]
  tags : resource_group_tags;
      [@ocaml.doc
        "The tags (key and value pairs) of the resource group. This data type property is used in \
         the [CreateResourceGroup] action.\n"]
  arn : arn; [@ocaml.doc "The ARN of the resource group.\n"]
}
[@@ocaml.doc
  "Contains information about a resource group. The resource group defines a set of tags that, \
   when queried, identify the AWS resources that make up the assessment target. This data type is \
   used as the response element in the [DescribeResourceGroups] action.\n"]

type nonrec resource_group_list = resource_group list [@@ocaml.doc ""]

type nonrec report_type = FULL [@ocaml.doc ""] | FINDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec report_status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | WORK_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_file_format = PDF [@ocaml.doc ""] | HTML [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec failed_item_error_code =
  | INTERNAL_ERROR [@ocaml.doc ""]
  | LIMIT_EXCEEDED [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
  | ITEM_DOES_NOT_EXIST [@ocaml.doc ""]
  | DUPLICATE_ARN [@ocaml.doc ""]
  | INVALID_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failed_item_details = {
  retryable : bool_;
      [@ocaml.doc
        "Indicates whether you can immediately retry a request for this item for a specified \
         resource.\n"]
  failure_code : failed_item_error_code; [@ocaml.doc "The status code of a failed item.\n"]
}
[@@ocaml.doc "Includes details about the failed items.\n"]

type nonrec failed_items = (arn * failed_item_details) list [@@ocaml.doc ""]

type nonrec remove_attributes_from_findings_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Attributes details that cannot be described. An error code is provided for each failed \
         item.\n"]
}
[@@ocaml.doc ""]

type nonrec add_remove_attributes_finding_arn_list = arn list [@@ocaml.doc ""]

type nonrec remove_attributes_from_findings_request = {
  attribute_keys : user_attribute_key_list;
      [@ocaml.doc "The array of attribute keys that you want to remove from specified findings.\n"]
  finding_arns : add_remove_attributes_finding_arn_list;
      [@ocaml.doc "The ARNs that specify the findings that you want to remove attributes from.\n"]
}
[@@ocaml.doc ""]

type nonrec register_cross_account_access_role_request = {
  role_arn : arn;
      [@ocaml.doc
        "The ARN of the IAM role that grants Amazon Inspector access to AWS Services needed to \
         perform security assessments. \n"]
}
[@@ocaml.doc ""]

type nonrec private_ip = {
  private_ip_address : text option; [@ocaml.doc "The full IP address of the network inteface.\n"]
  private_dns_name : text option; [@ocaml.doc "The DNS name of the private IP address.\n"]
}
[@@ocaml.doc
  "Contains information about a private IP address associated with a network interface. This data \
   type is used as a response element in the [DescribeFindings] action.\n"]

type nonrec private_ip_addresses = private_ip list [@@ocaml.doc ""]

type nonrec preview_status = COMPLETED [@ocaml.doc ""] | WORK_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec preview_generation_in_progress_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  "The request is rejected. The specified assessment template is currently generating an \
   exclusions preview.\n"]

type nonrec hostname = string [@@ocaml.doc ""]

type nonrec auto_scaling_group = string [@@ocaml.doc ""]

type nonrec agent_health =
  | UNKNOWN [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec agent_version = string [@@ocaml.doc ""]

type nonrec operating_system = string [@@ocaml.doc ""]

type nonrec kernel_version = string [@@ocaml.doc ""]

type nonrec ipv4_address = string [@@ocaml.doc ""]

type nonrec agent_preview = {
  ipv4_address : ipv4_address option;
      [@ocaml.doc
        "The IP address of the EC2 instance on which the Amazon Inspector Agent is installed.\n"]
  kernel_version : kernel_version option;
      [@ocaml.doc
        "The kernel version of the operating system running on the EC2 instance on which the \
         Amazon Inspector Agent is installed.\n"]
  operating_system : operating_system option;
      [@ocaml.doc
        "The operating system running on the EC2 instance on which the Amazon Inspector Agent is \
         installed.\n"]
  agent_version : agent_version option; [@ocaml.doc "The version of the Amazon Inspector Agent.\n"]
  agent_health : agent_health option;
      [@ocaml.doc "The health status of the Amazon Inspector Agent.\n"]
  auto_scaling_group : auto_scaling_group option;
      [@ocaml.doc "The Auto Scaling group for the EC2 instance where the agent is installed.\n"]
  agent_id : agent_id; [@ocaml.doc "The ID of the EC2 instance where the agent is installed.\n"]
  hostname : hostname option;
      [@ocaml.doc
        "The hostname of the EC2 instance on which the Amazon Inspector Agent is installed.\n"]
}
[@@ocaml.doc "Used as a response element in the [PreviewAgents] action.\n"]

type nonrec agent_preview_list = agent_preview list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec preview_agents_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  agent_previews : agent_preview_list; [@ocaml.doc "The resulting list of agents.\n"]
}
[@@ocaml.doc ""]

type nonrec preview_agents_max_results = int [@@ocaml.doc ""]

type nonrec preview_agents_request = {
  max_results : preview_agents_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b PreviewAgents} action. Subsequent calls to the action \
         fill {b nextToken} in the request with the value of {b NextToken} from the previous \
         response to continue listing data.\n"]
  preview_agents_arn : arn;
      [@ocaml.doc "The ARN of the assessment target whose agents you want to preview.\n"]
}
[@@ocaml.doc ""]

type nonrec numeric_version = int [@@ocaml.doc ""]

type nonrec numeric_severity = float [@@ocaml.doc ""]

type nonrec ipv6_addresses = text list [@@ocaml.doc ""]

type nonrec network_interface = {
  security_groups : security_groups option;
      [@ocaml.doc
        "A list of the security groups associated with the network interface. Includes the groupId \
         and groupName.\n"]
  ipv6_addresses : ipv6_addresses option;
      [@ocaml.doc "The IP addresses associated with the network interface.\n"]
  public_ip : text option;
      [@ocaml.doc "The public IP address from which the network interface is reachable.\n"]
  public_dns_name : text option;
      [@ocaml.doc "The name of a public DNS associated with the network interface.\n"]
  private_ip_addresses : private_ip_addresses option;
      [@ocaml.doc
        "A list of the private IP addresses associated with the network interface. Includes the \
         privateDnsName and privateIpAddress.\n"]
  private_ip_address : text option;
      [@ocaml.doc "The private IP address associated with the network interface.\n"]
  private_dns_name : text option;
      [@ocaml.doc "The name of a private DNS associated with the network interface.\n"]
  vpc_id : text option; [@ocaml.doc "The ID of a VPC associated with the network interface.\n"]
  subnet_id : text option;
      [@ocaml.doc "The ID of a subnet associated with the network interface.\n"]
  network_interface_id : text option; [@ocaml.doc "The ID of the network interface.\n"]
}
[@@ocaml.doc
  "Contains information about the network interfaces interacting with an EC2 instance. This data \
   type is used as one of the elements of the [AssetAttributes] data type.\n"]

type nonrec network_interfaces = network_interface list [@@ocaml.doc ""]

type nonrec name_pattern = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec locale = EN_US [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment template whose tags you want to list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_returned_arn_list = arn list [@@ocaml.doc ""]

type nonrec list_rules_packages_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  rules_package_arns : list_returned_arn_list;
      [@ocaml.doc "The list of ARNs that specifies the rules packages returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec list_max_results = int [@@ocaml.doc ""]

type nonrec list_rules_packages_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListRulesPackages} action. Subsequent calls to the \
         action fill {b nextToken} in the request with the value of {b NextToken} from the \
         previous response to continue listing data.\n"]
}
[@@ocaml.doc ""]

type nonrec list_parent_arn_list = arn list [@@ocaml.doc ""]

type nonrec list_findings_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  finding_arns : list_returned_arn_list;
      [@ocaml.doc "A list of ARNs that specifies the findings returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec agent_id_list = agent_id list [@@ocaml.doc ""]

type nonrec auto_scaling_group_list = auto_scaling_group list [@@ocaml.doc ""]

type nonrec filter_rules_package_arn_list = arn list [@@ocaml.doc ""]

type nonrec attribute_list = attribute list [@@ocaml.doc ""]

type nonrec finding_filter = {
  creation_time_range : timestamp_range option;
      [@ocaml.doc "The time range during which the finding is generated.\n"]
  user_attributes : attribute_list option;
      [@ocaml.doc
        "For a record to match a filter, the value that is specified for this data type property \
         must be contained in the list of values of the {b userAttributes} property of the \
         [Finding] data type.\n"]
  attributes : attribute_list option;
      [@ocaml.doc
        "For a record to match a filter, the list of values that are specified for this data type \
         property must be contained in the list of values of the {b attributes} property of the \
         [Finding] data type.\n"]
  rules_package_arns : filter_rules_package_arn_list option;
      [@ocaml.doc
        "For a record to match a filter, one of the values that is specified for this data type \
         property must be the exact match of the value of the {b rulesPackageArn} property of the \
         [Finding] data type.\n"]
  severities : severity_list option;
      [@ocaml.doc
        "For a record to match a filter, one of the values that is specified for this data type \
         property must be the exact match of the value of the {b severity} property of the \
         [Finding] data type.\n"]
  rule_names : rule_name_list option;
      [@ocaml.doc
        "For a record to match a filter, one of the values that is specified for this data type \
         property must be the exact match of the value of the {b ruleName} property of the \
         [Finding] data type.\n"]
  auto_scaling_groups : auto_scaling_group_list option;
      [@ocaml.doc
        "For a record to match a filter, one of the values that is specified for this data type \
         property must be the exact match of the value of the {b autoScalingGroup} property of the \
         [Finding] data type.\n"]
  agent_ids : agent_id_list option;
      [@ocaml.doc
        "For a record to match a filter, one of the values that is specified for this data type \
         property must be the exact match of the value of the {b agentId} property of the \
         [Finding] data type.\n"]
}
[@@ocaml.doc "This data type is used as a request parameter in the [ListFindings] action.\n"]

type nonrec list_findings_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListFindings} action. Subsequent calls to the action \
         fill {b nextToken} in the request with the value of {b NextToken} from the previous \
         response to continue listing data.\n"]
  filter : finding_filter option;
      [@ocaml.doc
        "You can use this parameter to specify a subset of data to be included in the action's \
         response.\n\n\
        \ For a record to match a filter, all specified filter attributes must match. When \
         multiple values are specified for a filter attribute, any of the values can match.\n\
        \ "]
  assessment_run_arns : list_parent_arn_list option;
      [@ocaml.doc
        "The ARNs of the assessment runs that generate the findings that you want to list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_exclusions_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When a response is generated, if there is more data to be listed, this parameters is \
         present in the response and contains the value to use for the nextToken parameter in a \
         subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  exclusion_arns : list_returned_arn_list;
      [@ocaml.doc "A list of exclusions' ARNs returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec list_exclusions_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 100. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the ListExclusionsRequest action. Subsequent calls to the \
         action fill nextToken in the request with the value of nextToken from the previous \
         response to continue listing data.\n"]
  assessment_run_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment run that generated the exclusions that you want to list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_event_subscriptions_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  subscriptions : subscription_list; [@ocaml.doc "Details of the returned event subscriptions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_event_subscriptions_max_results = int [@@ocaml.doc ""]

type nonrec list_event_subscriptions_request = {
  max_results : list_event_subscriptions_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListEventSubscriptions} action. Subsequent calls to the \
         action fill {b nextToken} in the request with the value of {b NextToken} from the \
         previous response to continue listing data.\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The ARN of the assessment template for which you want to list the existing event \
         subscriptions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_assessment_templates_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  assessment_template_arns : list_returned_arn_list;
      [@ocaml.doc
        "A list of ARNs that specifies the assessment templates returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_run_duration = int [@@ocaml.doc ""]

type nonrec duration_range = {
  max_seconds : assessment_run_duration option;
      [@ocaml.doc
        "The maximum value of the duration range. Must be less than or equal to 604800 seconds (1 \
         week).\n"]
  min_seconds : assessment_run_duration option;
      [@ocaml.doc "The minimum value of the duration range. Must be greater than zero.\n"]
}
[@@ocaml.doc "This data type is used in the [AssessmentTemplateFilter] data type.\n"]

type nonrec assessment_template_filter = {
  rules_package_arns : filter_rules_package_arn_list option;
      [@ocaml.doc
        "For a record to match a filter, the values that are specified for this data type property \
         must be contained in the list of values of the {b rulesPackageArns} property of the \
         [AssessmentTemplate] data type.\n"]
  duration_range : duration_range option;
      [@ocaml.doc
        "For a record to match a filter, the value specified for this data type property must \
         inclusively match any value between the specified minimum and maximum values of the {b \
         durationInSeconds} property of the [AssessmentTemplate] data type.\n"]
  name_pattern : name_pattern option;
      [@ocaml.doc
        "For a record to match a filter, an explicit value or a string that contains a wildcard \
         that is specified for this data type property must match the value of the {b \
         assessmentTemplateName} property of the [AssessmentTemplate] data type.\n"]
}
[@@ocaml.doc "Used as the request parameter in the [ListAssessmentTemplates] action.\n"]

type nonrec list_assessment_templates_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListAssessmentTemplates} action. Subsequent calls to \
         the action fill {b nextToken} in the request with the value of {b NextToken} from the \
         previous response to continue listing data.\n"]
  filter : assessment_template_filter option;
      [@ocaml.doc
        "You can use this parameter to specify a subset of data to be included in the action's \
         response.\n\n\
        \ For a record to match a filter, all specified filter attributes must match. When \
         multiple values are specified for a filter attribute, any of the values can match.\n\
        \ "]
  assessment_target_arns : list_parent_arn_list option;
      [@ocaml.doc
        "A list of ARNs that specifies the assessment targets whose assessment templates you want \
         to list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_assessment_targets_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  assessment_target_arns : list_returned_arn_list;
      [@ocaml.doc
        "A list of ARNs that specifies the assessment targets that are returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_target_filter = {
  assessment_target_name_pattern : name_pattern option;
      [@ocaml.doc
        "For a record to match a filter, an explicit value or a string that contains a wildcard \
         that is specified for this data type property must match the value of the {b \
         assessmentTargetName} property of the [AssessmentTarget] data type.\n"]
}
[@@ocaml.doc "Used as the request parameter in the [ListAssessmentTargets] action.\n"]

type nonrec list_assessment_targets_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListAssessmentTargets} action. Subsequent calls to the \
         action fill {b nextToken} in the request with the value of {b NextToken} from the \
         previous response to continue listing data.\n"]
  filter : assessment_target_filter option;
      [@ocaml.doc
        "You can use this parameter to specify a subset of data to be included in the action's \
         response.\n\n\
        \ For a record to match a filter, all specified filter attributes must match. When \
         multiple values are specified for a filter attribute, any of the values can match.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_assessment_runs_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  assessment_run_arns : list_returned_arn_list;
      [@ocaml.doc
        "A list of ARNs that specifies the assessment runs that are returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_run_state =
  | CANCELED [@ocaml.doc ""]
  | COMPLETED_WITH_ERRORS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | EVALUATING_RULES [@ocaml.doc ""]
  | START_EVALUATING_RULES_PENDING [@ocaml.doc ""]
  | DATA_COLLECTED [@ocaml.doc ""]
  | STOP_DATA_COLLECTION_PENDING [@ocaml.doc ""]
  | COLLECTING_DATA [@ocaml.doc ""]
  | START_DATA_COLLECTION_IN_PROGRESS [@ocaml.doc ""]
  | START_DATA_COLLECTION_PENDING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec assessment_run_state_list = assessment_run_state list [@@ocaml.doc ""]

type nonrec assessment_run_filter = {
  state_change_time_range : timestamp_range option;
      [@ocaml.doc
        "For a record to match a filter, the value that is specified for this data type property \
         must match the {b stateChangedAt} property of the [AssessmentRun] data type.\n"]
  completion_time_range : timestamp_range option;
      [@ocaml.doc
        "For a record to match a filter, the value that is specified for this data type property \
         must inclusively match any value between the specified minimum and maximum values of the \
         {b completedAt} property of the [AssessmentRun] data type.\n"]
  start_time_range : timestamp_range option;
      [@ocaml.doc
        "For a record to match a filter, the value that is specified for this data type property \
         must inclusively match any value between the specified minimum and maximum values of the \
         {b startTime} property of the [AssessmentRun] data type.\n"]
  rules_package_arns : filter_rules_package_arn_list option;
      [@ocaml.doc
        "For a record to match a filter, the value that is specified for this data type property \
         must be contained in the list of values of the {b rulesPackages} property of the \
         [AssessmentRun] data type.\n"]
  duration_range : duration_range option;
      [@ocaml.doc
        "For a record to match a filter, the value that is specified for this data type property \
         must inclusively match any value between the specified minimum and maximum values of the \
         {b durationInSeconds} property of the [AssessmentRun] data type.\n"]
  states : assessment_run_state_list option;
      [@ocaml.doc
        "For a record to match a filter, one of the values specified for this data type property \
         must be the exact match of the value of the {b assessmentRunState} property of the \
         [AssessmentRun] data type.\n"]
  name_pattern : name_pattern option;
      [@ocaml.doc
        "For a record to match a filter, an explicit value or a string containing a wildcard that \
         is specified for this data type property must match the value of the {b \
         assessmentRunName} property of the [AssessmentRun] data type.\n"]
}
[@@ocaml.doc "Used as the request parameter in the [ListAssessmentRuns] action.\n"]

type nonrec list_assessment_runs_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items that you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListAssessmentRuns} action. Subsequent calls to the \
         action fill {b nextToken} in the request with the value of {b NextToken} from the \
         previous response to continue listing data.\n"]
  filter : assessment_run_filter option;
      [@ocaml.doc
        "You can use this parameter to specify a subset of data to be included in the action's \
         response.\n\n\
        \ For a record to match a filter, all specified filter attributes must match. When \
         multiple values are specified for a filter attribute, any of the values can match.\n\
        \ "]
  assessment_template_arns : list_parent_arn_list option;
      [@ocaml.doc
        "The ARNs that specify the assessment templates whose assessment runs you want to list.\n"]
}
[@@ocaml.doc ""]

type nonrec agent_health_code =
  | UNKNOWN [@ocaml.doc ""]
  | THROTTLED [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | SHUTDOWN [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | IDLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec assessment_run_agent = {
  telemetry_metadata : telemetry_metadata_list;
      [@ocaml.doc
        "The Amazon Inspector application data metrics that are collected by the agent.\n"]
  auto_scaling_group : auto_scaling_group option;
      [@ocaml.doc "The Auto Scaling group of the EC2 instance that is specified by the agent ID.\n"]
  agent_health_details : message option; [@ocaml.doc "The description for the agent health code.\n"]
  agent_health_code : agent_health_code; [@ocaml.doc "The detailed health state of the agent.\n"]
  agent_health : agent_health; [@ocaml.doc "The current health state of the agent.\n"]
  assessment_run_arn : arn;
      [@ocaml.doc "The ARN of the assessment run that is associated with the agent.\n"]
  agent_id : agent_id;
      [@ocaml.doc "The AWS account of the EC2 instance where the agent is installed.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Inspector agent. This data type is used as a response \
   element in the [ListAssessmentRunAgents] action.\n"]

type nonrec assessment_run_agent_list = assessment_run_agent list [@@ocaml.doc ""]

type nonrec list_assessment_run_agents_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        " When a response is generated, if there is more data to be listed, this parameter is \
         present in the response and contains the value to use for the {b nextToken} parameter in \
         a subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  assessment_run_agents : assessment_run_agent_list;
      [@ocaml.doc "A list of ARNs that specifies the agents returned by the action.\n"]
}
[@@ocaml.doc ""]

type nonrec agent_health_list = agent_health list [@@ocaml.doc ""]

type nonrec agent_health_code_list = agent_health_code list [@@ocaml.doc ""]

type nonrec agent_filter = {
  agent_health_codes : agent_health_code_list;
      [@ocaml.doc
        "The detailed health state of the agent. Values can be set to {b IDLE}, {b RUNNING}, {b \
         SHUTDOWN}, {b UNHEALTHY}, {b THROTTLED}, and {b UNKNOWN}. \n"]
  agent_healths : agent_health_list;
      [@ocaml.doc
        "The current health state of the agent. Values can be set to {b HEALTHY} or {b UNHEALTHY}.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Inspector agent. This data type is used as a request \
   parameter in the [ListAssessmentRunAgents] action.\n"]

type nonrec list_assessment_run_agents_request = {
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items that you want in the \
         response. The default value is 10. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the {b ListAssessmentRunAgents} action. Subsequent calls to \
         the action fill {b nextToken} in the request with the value of {b NextToken} from the \
         previous response to continue listing data.\n"]
  filter : agent_filter option;
      [@ocaml.doc
        "You can use this parameter to specify a subset of data to be included in the action's \
         response.\n\n\
        \ For a record to match a filter, all specified filter attributes must match. When \
         multiple values are specified for a filter attribute, any of the values can match.\n\
        \ "]
  assessment_run_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment run whose agents you want to list.\n"]
}
[@@ocaml.doc ""]

type nonrec ipv4_address_list = ipv4_address list [@@ocaml.doc ""]

type nonrec ioc_confidence = int [@@ocaml.doc ""]

type nonrec inspector_service_attributes = {
  rules_package_arn : arn option;
      [@ocaml.doc "The ARN of the rules package that is used to generate the finding.\n"]
  assessment_run_arn : arn option;
      [@ocaml.doc "The ARN of the assessment run during which the finding is generated.\n"]
  schema_version : numeric_version; [@ocaml.doc "The schema version of this data type.\n"]
}
[@@ocaml.doc "This data type is used in the [Finding] data type.\n"]

type nonrec get_telemetry_metadata_response = {
  telemetry_metadata : telemetry_metadata_list; [@ocaml.doc "Telemetry details.\n"]
}
[@@ocaml.doc ""]

type nonrec get_telemetry_metadata_request = {
  assessment_run_arn : arn;
      [@ocaml.doc
        "The ARN that specifies the assessment run that has the telemetry data that you want to \
         obtain.\n"]
}
[@@ocaml.doc ""]

type nonrec exclusion_preview = {
  attributes : attribute_list option;
      [@ocaml.doc "The system-defined attributes for the exclusion preview.\n"]
  scopes : scope_list; [@ocaml.doc "The AWS resources for which the exclusion preview pertains.\n"]
  recommendation : text; [@ocaml.doc "The recommendation for the exclusion preview.\n"]
  description : text; [@ocaml.doc "The description of the exclusion preview.\n"]
  title : text; [@ocaml.doc "The name of the exclusion preview.\n"]
}
[@@ocaml.doc
  "Contains information about what is excluded from an assessment run given the current state of \
   the assessment template.\n"]

type nonrec exclusion_preview_list = exclusion_preview list [@@ocaml.doc ""]

type nonrec get_exclusions_preview_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When a response is generated, if there is more data to be listed, this parameters is \
         present in the response and contains the value to use for the nextToken parameter in a \
         subsequent pagination request. If there is no more data to be listed, this parameter is \
         set to null.\n"]
  exclusion_previews : exclusion_preview_list option;
      [@ocaml.doc "Information about the exclusions included in the preview.\n"]
  preview_status : preview_status;
      [@ocaml.doc "Specifies the status of the request to generate an exclusions preview.\n"]
}
[@@ocaml.doc ""]

type nonrec get_exclusions_preview_request = {
  locale : locale option;
      [@ocaml.doc
        "The locale into which you want to translate the exclusion's title, description, and \
         recommendation.\n"]
  max_results : list_max_results option;
      [@ocaml.doc
        "You can use this parameter to indicate the maximum number of items you want in the \
         response. The default value is 100. The maximum value is 500.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "You can use this parameter when paginating results. Set the value of this parameter to \
         null on your first call to the GetExclusionsPreviewRequest action. Subsequent calls to \
         the action fill nextToken in the request with the value of nextToken from the previous \
         response to continue listing data.\n"]
  preview_token : uui_d;
      [@ocaml.doc "The unique identifier associated of the exclusions preview.\n"]
  assessment_template_arn : arn;
      [@ocaml.doc
        "The ARN that specifies the assessment template for which the exclusions preview was \
         requested.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_run_in_progress_arn_list = arn list [@@ocaml.doc ""]

type nonrec assessment_run_in_progress_exception = {
  can_retry : bool_; [@ocaml.doc "You can immediately retry your request.\n"]
  assessment_run_arns_truncated : bool_;
      [@ocaml.doc
        "Boolean value that indicates whether the ARN list of the assessment runs is truncated.\n"]
  assessment_run_arns : assessment_run_in_progress_arn_list;
      [@ocaml.doc "The ARNs of the assessment runs that are currently in progress.\n"]
  message : error_message; [@ocaml.doc "Details of the exception error.\n"]
}
[@@ocaml.doc
  "You cannot perform a specified action if an assessment run is currently in progress.\n"]

type nonrec get_assessment_report_response = {
  url : url option;
      [@ocaml.doc
        "Specifies the URL where you can find the generated assessment report. This parameter is \
         only returned if the report is successfully generated.\n"]
  status : report_status;
      [@ocaml.doc "Specifies the status of the request to generate an assessment report. \n"]
}
[@@ocaml.doc ""]

type nonrec get_assessment_report_request = {
  report_type : report_type;
      [@ocaml.doc
        "Specifies the type of the assessment report that you want to generate. There are two \
         types of assessment reports: a finding report and a full report. For more information, \
         see \
         {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_reports.html}Assessment \
         Reports}. \n"]
  report_file_format : report_file_format;
      [@ocaml.doc
        "Specifies the file format (html or pdf) of the assessment report that you want to generate.\n"]
  assessment_run_arn : arn;
      [@ocaml.doc
        "The ARN that specifies the assessment run for which you want to generate a report.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rules_packages_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Rules package details that cannot be described. An error code is provided for each failed \
         item.\n"]
  rules_packages : rules_package_list; [@ocaml.doc "Information about the rules package.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_describe_arn_list = arn list [@@ocaml.doc ""]

type nonrec describe_rules_packages_request = {
  locale : locale option;
      [@ocaml.doc "The locale that you want to translate a rules package description into.\n"]
  rules_package_arns : batch_describe_arn_list;
      [@ocaml.doc "The ARN that specifies the rules package that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_groups_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Resource group details that cannot be described. An error code is provided for each \
         failed item.\n"]
  resource_groups : resource_group_list; [@ocaml.doc "Information about a resource group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_groups_request = {
  resource_group_arns : batch_describe_arn_list;
      [@ocaml.doc "The ARN that specifies the resource group that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec asset_type = EC2_INSTANCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ami_id = string [@@ocaml.doc ""]

type nonrec asset_attributes = {
  network_interfaces : network_interfaces option;
      [@ocaml.doc
        "An array of the network interfaces interacting with the EC2 instance where the finding is \
         generated.\n"]
  tags : tags option;
      [@ocaml.doc "The tags related to the EC2 instance where the finding is generated.\n"]
  ipv4_addresses : ipv4_address_list option;
      [@ocaml.doc
        "The list of IP v4 addresses of the EC2 instance where the finding is generated.\n"]
  hostname : hostname option;
      [@ocaml.doc "The hostname of the EC2 instance where the finding is generated.\n"]
  ami_id : ami_id option;
      [@ocaml.doc
        "The ID of the Amazon Machine Image (AMI) that is installed on the EC2 instance where the \
         finding is generated.\n"]
  auto_scaling_group : auto_scaling_group option;
      [@ocaml.doc "The Auto Scaling group of the EC2 instance where the finding is generated.\n"]
  agent_id : agent_id option;
      [@ocaml.doc
        "The ID of the agent that is installed on the EC2 instance where the finding is generated.\n"]
  schema_version : numeric_version; [@ocaml.doc "The schema version of this data type.\n"]
}
[@@ocaml.doc "A collection of attributes of the host from which the finding is generated.\n"]

type nonrec finding_id = string [@@ocaml.doc ""]

type nonrec finding = {
  updated_at : timestamp; [@ocaml.doc "The time when [AddAttributesToFindings] is called.\n"]
  created_at : timestamp; [@ocaml.doc "The time when the finding was generated.\n"]
  user_attributes : user_attribute_list;
      [@ocaml.doc "The user-defined attributes that are assigned to the finding.\n"]
  attributes : attribute_list; [@ocaml.doc "The system-defined attributes for the finding.\n"]
  indicator_of_compromise : bool_ option; [@ocaml.doc "This data element is currently not used.\n"]
  confidence : ioc_confidence option; [@ocaml.doc "This data element is currently not used.\n"]
  numeric_severity : numeric_severity option;
      [@ocaml.doc "The numeric value of the finding severity.\n"]
  severity : severity option;
      [@ocaml.doc
        "The finding severity. Values can be set to High, Medium, Low, and Informational.\n"]
  recommendation : text option; [@ocaml.doc "The recommendation for the finding.\n"]
  description : text option; [@ocaml.doc "The description of the finding.\n"]
  title : text option; [@ocaml.doc "The name of the finding.\n"]
  id : finding_id option; [@ocaml.doc "The ID of the finding.\n"]
  asset_attributes : asset_attributes option;
      [@ocaml.doc "A collection of attributes of the host from which the finding is generated.\n"]
  asset_type : asset_type option;
      [@ocaml.doc "The type of the host from which the finding is generated.\n"]
  service_attributes : inspector_service_attributes option;
      [@ocaml.doc "This data type is used in the [Finding] data type.\n"]
  service : service_name option; [@ocaml.doc "The data element is set to \"Inspector\".\n"]
  schema_version : numeric_version option; [@ocaml.doc "The schema version of this data type.\n"]
  arn : arn; [@ocaml.doc "The ARN that specifies the finding.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Inspector finding. This data type is used as the response \
   element in the [DescribeFindings] action.\n"]

type nonrec finding_list = finding list [@@ocaml.doc ""]

type nonrec describe_findings_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Finding details that cannot be described. An error code is provided for each failed item.\n"]
  findings : finding_list; [@ocaml.doc "Information about the finding.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_findings_request = {
  locale : locale option;
      [@ocaml.doc
        "The locale into which you want to translate a finding description, recommendation, and \
         the short description that identifies the finding.\n"]
  finding_arns : batch_describe_arn_list;
      [@ocaml.doc "The ARN that specifies the finding that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec exclusion = {
  attributes : attribute_list option;
      [@ocaml.doc "The system-defined attributes for the exclusion.\n"]
  scopes : scope_list; [@ocaml.doc "The AWS resources for which the exclusion pertains.\n"]
  recommendation : text; [@ocaml.doc "The recommendation for the exclusion.\n"]
  description : text; [@ocaml.doc "The description of the exclusion.\n"]
  title : text; [@ocaml.doc "The name of the exclusion.\n"]
  arn : arn; [@ocaml.doc "The ARN that specifies the exclusion.\n"]
}
[@@ocaml.doc "Contains information about what was excluded from an assessment run.\n"]

type nonrec exclusion_map = (arn * exclusion) list [@@ocaml.doc ""]

type nonrec describe_exclusions_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Exclusion details that cannot be described. An error code is provided for each failed item.\n"]
  exclusions : exclusion_map; [@ocaml.doc "Information about the exclusions.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_describe_exclusions_arn_list = arn list [@@ocaml.doc ""]

type nonrec describe_exclusions_request = {
  locale : locale option;
      [@ocaml.doc
        "The locale into which you want to translate the exclusion's title, description, and \
         recommendation.\n"]
  exclusion_arns : batch_describe_exclusions_arn_list;
      [@ocaml.doc "The list of ARNs that specify the exclusions that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cross_account_access_role_response = {
  registered_at : timestamp;
      [@ocaml.doc "The date when the cross-account access role was registered.\n"]
  valid : bool_;
      [@ocaml.doc
        "A Boolean value that specifies whether the IAM role has the necessary policies attached \
         to enable Amazon Inspector to access your AWS account.\n"]
  role_arn : arn;
      [@ocaml.doc
        "The ARN that specifies the IAM role that Amazon Inspector uses to access your AWS account.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_template_name = string [@@ocaml.doc ""]

type nonrec assessment_template_rules_package_arn_list = arn list [@@ocaml.doc ""]

type nonrec arn_count = int [@@ocaml.doc ""]

type nonrec assessment_template = {
  created_at : timestamp; [@ocaml.doc "The time at which the assessment template is created.\n"]
  assessment_run_count : arn_count;
      [@ocaml.doc
        "The number of existing assessment runs associated with this assessment template. This \
         value can be zero or a positive integer.\n"]
  last_assessment_run_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the most recent assessment run associated with this \
         assessment template. This value exists only when the value of assessmentRunCount is \
         greaterpa than zero.\n"]
  user_attributes_for_findings : user_attribute_list;
      [@ocaml.doc
        "The user-defined attributes that are assigned to every generated finding from the \
         assessment run that uses this assessment template.\n"]
  rules_package_arns : assessment_template_rules_package_arn_list;
      [@ocaml.doc "The rules packages that are specified for this assessment template.\n"]
  duration_in_seconds : assessment_run_duration;
      [@ocaml.doc
        "The duration in seconds specified for this assessment template. The default value is 3600 \
         seconds (one hour). The maximum value is 86400 seconds (one day).\n"]
  assessment_target_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment target that corresponds to this assessment template.\n"]
  name : assessment_template_name; [@ocaml.doc "The name of the assessment template.\n"]
  arn : arn; [@ocaml.doc "The ARN of the assessment template.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Inspector assessment template. This data type is used as \
   the response element in the [DescribeAssessmentTemplates] action.\n"]

type nonrec assessment_template_list = assessment_template list [@@ocaml.doc ""]

type nonrec describe_assessment_templates_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Assessment template details that cannot be described. An error code is provided for each \
         failed item.\n"]
  assessment_templates : assessment_template_list;
      [@ocaml.doc "Information about the assessment templates.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_assessment_templates_request = {
  assessment_template_arns : batch_describe_arn_list; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec assessment_target = {
  updated_at : timestamp; [@ocaml.doc "The time at which [UpdateAssessmentTarget] is called.\n"]
  created_at : timestamp; [@ocaml.doc "The time at which the assessment target is created.\n"]
  resource_group_arn : arn option;
      [@ocaml.doc
        "The ARN that specifies the resource group that is associated with the assessment target.\n"]
  name : assessment_target_name;
      [@ocaml.doc "The name of the Amazon Inspector assessment target.\n"]
  arn : arn; [@ocaml.doc "The ARN that specifies the Amazon Inspector assessment target.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Inspector application. This data type is used as the \
   response element in the [DescribeAssessmentTargets] action.\n"]

type nonrec assessment_target_list = assessment_target list [@@ocaml.doc ""]

type nonrec describe_assessment_targets_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Assessment target details that cannot be described. An error code is provided for each \
         failed item.\n"]
  assessment_targets : assessment_target_list;
      [@ocaml.doc "Information about the assessment targets.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_assessment_targets_request = {
  assessment_target_arns : batch_describe_arn_list;
      [@ocaml.doc "The ARNs that specifies the assessment targets that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_rules_package_arn_list = arn list [@@ocaml.doc ""]

type nonrec assessment_run_state_change = {
  state : assessment_run_state; [@ocaml.doc "The assessment run state.\n"]
  state_changed_at : timestamp; [@ocaml.doc "The last time the assessment run state changed.\n"]
}
[@@ocaml.doc "Used as one of the elements of the [AssessmentRun] data type.\n"]

type nonrec assessment_run_state_change_list = assessment_run_state_change list [@@ocaml.doc ""]

type nonrec assessment_run_notification_sns_status_code =
  | INTERNAL_ERROR [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
  | TOPIC_DOES_NOT_EXIST [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec assessment_run_notification = {
  sns_publish_status_code : assessment_run_notification_sns_status_code option;
      [@ocaml.doc "The status code of the SNS notification.\n"]
  sns_topic_arn : arn option; [@ocaml.doc "The SNS topic to which the SNS notification is sent.\n"]
  error : bool_;
      [@ocaml.doc
        "The Boolean value that specifies whether the notification represents an error.\n"]
  message : message option; [@ocaml.doc "The message included in the notification.\n"]
  event : inspector_event; [@ocaml.doc "The event for which a notification is sent.\n"]
  date : timestamp; [@ocaml.doc "The date of the notification.\n"]
}
[@@ocaml.doc "Used as one of the elements of the [AssessmentRun] data type.\n"]

type nonrec assessment_run_notification_list = assessment_run_notification list [@@ocaml.doc ""]

type nonrec finding_count = int [@@ocaml.doc ""]

type nonrec assessment_run_finding_counts = (severity * finding_count) list [@@ocaml.doc ""]

type nonrec assessment_run = {
  finding_counts : assessment_run_finding_counts;
      [@ocaml.doc "Provides a total count of generated findings per severity.\n"]
  notifications : assessment_run_notification_list;
      [@ocaml.doc
        "A list of notifications for the event subscriptions. A notification about a particular \
         generated finding is added to this list only once.\n"]
  state_changes : assessment_run_state_change_list;
      [@ocaml.doc "A list of the assessment run state changes.\n"]
  data_collected : bool_;
      [@ocaml.doc
        "A Boolean value (true or false) that specifies whether the process of collecting data \
         from the agents is completed.\n"]
  state_changed_at : timestamp;
      [@ocaml.doc "The last time when the assessment run's state changed.\n"]
  completed_at : timestamp option;
      [@ocaml.doc
        "The assessment run completion time that corresponds to the rules packages evaluation \
         completion time or failure.\n"]
  started_at : timestamp option; [@ocaml.doc "The time when [StartAssessmentRun] was called.\n"]
  created_at : timestamp; [@ocaml.doc "The time when [StartAssessmentRun] was called.\n"]
  user_attributes_for_findings : user_attribute_list;
      [@ocaml.doc "The user-defined attributes that are assigned to every generated finding.\n"]
  rules_package_arns : assessment_rules_package_arn_list;
      [@ocaml.doc "The rules packages selected for the assessment run.\n"]
  duration_in_seconds : assessment_run_duration;
      [@ocaml.doc "The duration of the assessment run.\n"]
  state : assessment_run_state; [@ocaml.doc "The state of the assessment run.\n"]
  assessment_template_arn : arn;
      [@ocaml.doc
        "The ARN of the assessment template that is associated with the assessment run.\n"]
  name : assessment_run_name; [@ocaml.doc "The auto-generated name for the assessment run.\n"]
  arn : arn; [@ocaml.doc "The ARN of the assessment run.\n"]
}
[@@ocaml.doc
  "A snapshot of an Amazon Inspector assessment run that contains the findings of the assessment \
   run .\n\n\
  \ Used as the response element in the [DescribeAssessmentRuns] action.\n\
  \ "]

type nonrec assessment_run_list = assessment_run list [@@ocaml.doc ""]

type nonrec describe_assessment_runs_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Assessment run details that cannot be described. An error code is provided for each \
         failed item.\n"]
  assessment_runs : assessment_run_list; [@ocaml.doc "Information about the assessment run.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_assessment_runs_request = {
  assessment_run_arns : batch_describe_arn_list;
      [@ocaml.doc "The ARN that specifies the assessment run that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_assessment_template_request = {
  assessment_template_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment template that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_assessment_target_request = {
  assessment_target_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment target that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_assessment_run_request = {
  assessment_run_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment run that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_group_response = {
  resource_group_arn : arn;
      [@ocaml.doc "The ARN that specifies the resource group that is created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_group_request = {
  resource_group_tags : resource_group_tags;
      [@ocaml.doc
        "A collection of keys and an array of possible values, \
         '\\[\\{\"key\":\"key1\",\"values\":\\[\"Value1\",\"Value2\"\\]\\},\\{\"key\":\"Key2\",\"values\":\\[\"Value3\"\\]\\}\\]'.\n\n\
        \ For example,'\\[\\{\"key\":\"Name\",\"values\":\\[\"TestEC2Instance\"\\]\\}\\]'.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_exclusions_preview_response = {
  preview_token : uui_d;
      [@ocaml.doc
        "Specifies the unique identifier of the requested exclusions preview. You can use the \
         unique identifier to retrieve the exclusions preview when running the \
         GetExclusionsPreview API.\n"]
}
[@@ocaml.doc ""]

type nonrec create_exclusions_preview_request = {
  assessment_template_arn : arn;
      [@ocaml.doc
        "The ARN that specifies the assessment template for which you want to create an exclusions \
         preview.\n"]
}
[@@ocaml.doc ""]

type nonrec create_assessment_template_response = {
  assessment_template_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment template that is created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_assessment_template_request = {
  user_attributes_for_findings : user_attribute_list option;
      [@ocaml.doc
        "The user-defined attributes that are assigned to every finding that is generated by the \
         assessment run that uses this assessment template. An attribute is a key and value pair \
         (an [Attribute] object). Within an assessment template, each key must be unique.\n"]
  rules_package_arns : assessment_template_rules_package_arn_list;
      [@ocaml.doc
        "The ARNs that specify the rules packages that you want to attach to the assessment \
         template.\n"]
  duration_in_seconds : assessment_run_duration;
      [@ocaml.doc "The duration of the assessment run in seconds.\n"]
  assessment_template_name : assessment_template_name;
      [@ocaml.doc
        "The user-defined name that identifies the assessment template that you want to create. \
         You can create several assessment templates for an assessment target. The names of the \
         assessment templates that correspond to a particular assessment target must be unique.\n"]
  assessment_target_arn : arn;
      [@ocaml.doc
        "The ARN that specifies the assessment target for which you want to create the assessment \
         template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_assessment_target_response = {
  assessment_target_arn : arn;
      [@ocaml.doc "The ARN that specifies the assessment target that is created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_assessment_target_request = {
  resource_group_arn : arn option;
      [@ocaml.doc
        "The ARN that specifies the resource group that is used to create the assessment target. \
         If resourceGroupArn is not specified, all EC2 instances in the current AWS account and \
         region are included in the assessment target.\n"]
  assessment_target_name : assessment_target_name;
      [@ocaml.doc
        "The user-defined name that identifies the assessment target that you want to create. The \
         name must be unique within the AWS account.\n"]
}
[@@ocaml.doc ""]

type nonrec add_attributes_to_findings_response = {
  failed_items : failed_items;
      [@ocaml.doc
        "Attribute details that cannot be described. An error code is provided for each failed item.\n"]
}
[@@ocaml.doc ""]

type nonrec add_attributes_to_findings_request = {
  attributes : user_attribute_list;
      [@ocaml.doc "The array of attributes that you want to assign to specified findings.\n"]
  finding_arns : add_remove_attributes_finding_arn_list;
      [@ocaml.doc "The ARNs that specify the findings that you want to assign attributes to.\n"]
}
[@@ocaml.doc ""]
