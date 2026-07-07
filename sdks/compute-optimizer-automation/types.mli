type nonrec enrollment_status =
  | FAILED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_enrollment_configuration_response = {
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc " The timestamp when the enrollment configuration was last updated. \n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The reason for the updated enrollment status. \n"]
  status : enrollment_status; [@ocaml.doc " The updated enrollment status. \n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec update_enrollment_configuration_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Must be 1-64 characters long and contain only alphanumeric characters, \
         underscores, and hyphens.\n"]
  status : enrollment_status;
      [@ocaml.doc
        "The desired enrollment status. \n\n\
        \ {ul\n\
        \       {-  Active - Enables the Automation feature for your account.\n\
        \           \n\
        \            }\n\
        \       {-  Inactive - Disables the Automation feature for your account and stops all of \
         your automation rules. If you opt in again later, all rules will be inactive, and you \
         must enable the rules you want to run. You must wait at least 24 hours after opting out \
         to opt in again.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Pending] and [Failed] options cannot be used to update the enrollment status of \
         an account. They are returned in the response of a request to update the enrollment \
         status of an account.\n\
        \    \n\
        \     If you are a member account, your account must be disassociated from your \
         organization\226\128\153s management account before you can disable Automation. Contact \
         your administrator to make this change.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The request was denied due to request throttling. \n"]

type nonrec service_unavailable_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The service is temporarily unavailable. \n"]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The specified resource was not found. \n"]

type nonrec opt_in_required_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The account must be opted in to Compute Optimizer Automation before performing this action. \n"]

type nonrec not_management_account_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The operation can only be performed by a management account. \n"]

type nonrec invalid_parameter_value_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " One or more parameter values are not valid. \n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " An internal error occurred while processing the request. \n"]

type nonrec idempotent_parameter_mismatch_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Exception thrown when the same client token is used with different parameters, indicating a \
   mismatch in idempotent request parameters.\n"]

type nonrec idempotency_token_in_use_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The specified client token is already in use. \n"]

type nonrec forbidden_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " You are not authorized to perform this action. \n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " You do not have sufficient permissions to perform this action. \n"]

type nonrec rule_arn = string [@@ocaml.doc ""]

type nonrec rule_name = string [@@ocaml.doc ""]

type nonrec rule_type = ACCOUNT_RULE [@ocaml.doc ""] | ORGANIZATIONAL_RULE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_apply_order =
  | AFTER_ACCOUNT_RULES [@ocaml.doc ""]
  | BEFORE_ACCOUNT_RULES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec organization_configuration_account_ids = account_id list [@@ocaml.doc ""]

type nonrec organization_configuration = {
  account_ids : organization_configuration_account_ids option;
      [@ocaml.doc
        "List of specific Amazon Web Services account IDs where the organization rule should be \
         applied.\n"]
  rule_apply_order : rule_apply_order option;
      [@ocaml.doc
        "Specifies when organization rules should be applied relative to account rules.\n"]
}
[@@ocaml.doc "Configuration settings for organization-wide automation rules.\n"]

type nonrec recommended_action_type =
  | UPGRADE_EBS_VOLUME_TYPE [@ocaml.doc ""]
  | SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME [@ocaml.doc ""]
[@@ocaml.doc "Recommended action type enumeration"]

type nonrec recommended_action_type_list = recommended_action_type list [@@ocaml.doc ""]

type nonrec comparison_operator =
  | NUMERIC_GREATER_THAN_EQUALS_IF_EXISTS [@ocaml.doc ""]
  | NUMERIC_GREATER_THAN_IF_EXISTS [@ocaml.doc ""]
  | NUMERIC_LESS_THAN_EQUALS_IF_EXISTS [@ocaml.doc ""]
  | NUMERIC_LESS_THAN_IF_EXISTS [@ocaml.doc ""]
  | NUMERIC_NOT_EQUALS_IF_EXISTS [@ocaml.doc ""]
  | NUMERIC_EQUALS_IF_EXISTS [@ocaml.doc ""]
  | STRING_NOT_LIKE_IF_EXISTS [@ocaml.doc ""]
  | STRING_LIKE_IF_EXISTS [@ocaml.doc ""]
  | STRING_NOT_EQUALS_IGNORE_CASE_IF_EXISTS [@ocaml.doc ""]
  | STRING_EQUALS_IGNORE_CASE_IF_EXISTS [@ocaml.doc ""]
  | STRING_NOT_EQUALS_IF_EXISTS [@ocaml.doc ""]
  | STRING_EQUALS_IF_EXISTS [@ocaml.doc ""]
  | NUMERIC_GREATER_THAN_EQUALS [@ocaml.doc ""]
  | NUMERIC_GREATER_THAN [@ocaml.doc ""]
  | NUMERIC_LESS_THAN_EQUALS [@ocaml.doc ""]
  | NUMERIC_LESS_THAN [@ocaml.doc ""]
  | NUMERIC_NOT_EQUALS [@ocaml.doc ""]
  | NUMERIC_EQUALS [@ocaml.doc ""]
  | STRING_NOT_LIKE [@ocaml.doc ""]
  | STRING_LIKE [@ocaml.doc ""]
  | STRING_NOT_EQUALS_IGNORE_CASE [@ocaml.doc ""]
  | STRING_EQUALS_IGNORE_CASE [@ocaml.doc ""]
  | STRING_NOT_EQUALS [@ocaml.doc ""]
  | STRING_EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_criteria_value = string [@@ocaml.doc ""]

type nonrec string_criteria_values = string_criteria_value list [@@ocaml.doc ""]

type nonrec string_criteria_condition = {
  values : string_criteria_values option;
      [@ocaml.doc
        "List of string values to compare against when applying the criteria condition.\n"]
  comparison : comparison_operator option;
      [@ocaml.doc
        "The comparison operator used to evaluate the attribute against the specified values.\n"]
}
[@@ocaml.doc
  "Criteria condition for filtering based on string values, including comparison operators and \
   target values.\n"]

type nonrec string_criteria_condition_list = string_criteria_condition list [@@ocaml.doc ""]

type nonrec integer_list = Smaws_Lib.Smithy_api.Types.integer list [@@ocaml.doc ""]

type nonrec integer_criteria_condition = {
  values : integer_list option;
      [@ocaml.doc
        "The list of integer values to compare against using the specified comparison operator.\n"]
  comparison : comparison_operator option;
      [@ocaml.doc
        "The comparison operator used to evaluate the attribute against the specified values.\n"]
}
[@@ocaml.doc
  "Defines a condition for filtering based on integer values with comparison operators.\n"]

type nonrec integer_criteria_condition_list = integer_criteria_condition list [@@ocaml.doc ""]

type nonrec double_list = Smaws_Lib.Smithy_api.Types.double list [@@ocaml.doc ""]

type nonrec double_criteria_condition = {
  values : double_list option;
      [@ocaml.doc
        "The list of double values to compare against using the specified comparison operator.\n"]
  comparison : comparison_operator option;
      [@ocaml.doc
        "The comparison operator used to evaluate the attribute against the specified values.\n"]
}
[@@ocaml.doc
  "Defines a condition for filtering based on double/floating-point numeric values with comparison \
   operators.\n"]

type nonrec double_criteria_condition_list = double_criteria_condition list [@@ocaml.doc ""]

type nonrec resource_tags_criteria_condition = {
  values : string_criteria_values option;
      [@ocaml.doc "List of tag values to compare against when filtering resources.\n"]
  key : string_criteria_value option;
      [@ocaml.doc "The tag key to use for comparison when filtering resources.\n"]
  comparison : comparison_operator option;
      [@ocaml.doc
        "The comparison operator used to evaluate the attribute against the specified values.\n"]
}
[@@ocaml.doc
  "Criteria condition for filtering resources based on their tags, including comparison operators \
   and values.\n"]

type nonrec resource_tags_criteria_condition_list = resource_tags_criteria_condition list
[@@ocaml.doc ""]

type nonrec criteria = {
  restart_needed : string_criteria_condition_list option;
      [@ocaml.doc
        "Filter criteria indicating whether the recommended action requires a resource restart.\n"]
  look_back_period_in_days : integer_criteria_condition_list option;
      [@ocaml.doc
        "Filter criteria for the lookback period in days used to analyze resource utilization.\n"]
  resource_tag : resource_tags_criteria_condition_list option;
      [@ocaml.doc
        "Filter criteria for resource tags, allowing filtering by tag key and value combinations.\n"]
  estimated_monthly_savings : double_criteria_condition_list option;
      [@ocaml.doc
        "Filter criteria for estimated monthly cost savings from the recommended action.\n"]
  ebs_volume_size_in_gib : integer_criteria_condition_list option;
      [@ocaml.doc "Filter criteria for EBS volume sizes in gibibytes (GiB).\n"]
  ebs_volume_type : string_criteria_condition_list option;
      [@ocaml.doc
        "Filter criteria for EBS volume types, such as gp2, gp3, io1, io2, st1, or sc1.\n"]
  resource_arn : string_criteria_condition_list option;
      [@ocaml.doc "Filter criteria for specific resource ARNs to include or exclude.\n"]
  region : string_criteria_condition_list option;
      [@ocaml.doc
        "Filter criteria for Amazon Web Services regions where resources must be located.\n"]
}
[@@ocaml.doc
  " A set of conditions that specify which recommended action qualify for implementation. When a \
   rule is active and a recommended action matches these criteria, Compute Optimizer implements \
   the action at the scheduled run time. You can specify up to 20 conditions per filter criteria \
   and 20 values per condition. \n"]

type nonrec schedule = {
  execution_window_in_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time window in minutes during which the automation rule can start implementing \
         recommended actions.\n"]
  schedule_expression_timezone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The timezone to use when interpreting the schedule expression.\n"]
  schedule_expression : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The expression that defines when the schedule runs. [cron] expression is supported. A \
         [cron] expression consists of six fields separated by white spaces: ([minutes] [hours] \
         [day_of_month] [month] [day_of_week] [year])\n\n\
        \  You can schedule rules to run at most once per day. Your cron expression must use \
         specific values (not wildcards) for the minutes and hours fields. For example: ([30 12 * \
         * *]) runs daily at 12:30 PM UTC.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Configuration for scheduling when automation rules should execute, including timing and \
   execution windows.\n"]

type nonrec rule_status = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_automation_rule_response = {
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was last updated.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was originally created.\n"]
  status : rule_status option; [@ocaml.doc "The updated status of the automation rule.\n"]
  schedule : schedule option; [@ocaml.doc "The updated schedule configuration.\n"]
  criteria : criteria option; [@ocaml.doc ""]
  recommended_action_types : recommended_action_type_list option;
      [@ocaml.doc "The updated list of recommended action types.\n"]
  priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The updated priority level of the automation rule.\n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc "The updated organization configuration settings.\n"]
  rule_type : rule_type option; [@ocaml.doc "The updated type of automation rule.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The updated description of the automation rule.\n"]
  name : rule_name option; [@ocaml.doc "The updated name of the automation rule.\n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc " The new revision number of the updated rule. \n"]
  rule_arn : rule_arn option; [@ocaml.doc " The ARN of the updated rule. \n"]
}
[@@ocaml.doc ""]

type nonrec rule_description = string [@@ocaml.doc ""]

type nonrec update_automation_rule_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Must be 1-64 characters long and contain only alphanumeric characters, \
         underscores, and hyphens.\n"]
  status : rule_status option;
      [@ocaml.doc "The updated status of the automation rule. Can be Active or Inactive.\n"]
  schedule : schedule option;
      [@ocaml.doc
        "The updated schedule configuration for when the automation rule should execute, including \
         cron expression, timezone, and execution window.\n"]
  criteria : criteria option; [@ocaml.doc ""]
  recommended_action_types : recommended_action_type_list option;
      [@ocaml.doc
        "Updated list of recommended action types that this rule can execute, such as \
         SnapshotAndDeleteUnattachedEbsVolume or UpgradeEbsVolumeType.\n"]
  priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The updated priority level of the automation rule, used to determine execution order when \
         multiple rules apply to the same resource.\n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc
        "Updated configuration settings for organization-wide rules, including rule application \
         order and target account IDs.\n"]
  rule_type : rule_type option;
      [@ocaml.doc
        "The updated type of automation rule. Can be either OrganizationRule for organization-wide \
         rules or AccountRule for account-specific rules.\n"]
  description : rule_description option;
      [@ocaml.doc
        "The updated description of the automation rule. Can be up to 1024 characters long and \
         contain alphanumeric characters, underscores, hyphens, spaces, and certain special \
         characters.\n"]
  name : rule_name option;
      [@ocaml.doc
        "The updated name of the automation rule. Must be 1-128 characters long and contain only \
         alphanumeric characters, underscores, and hyphens.\n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc " The revision number of the rule to update. \n"]
  rule_arn : rule_arn; [@ocaml.doc " The ARN of the rule to update. \n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Must be 1-64 characters long and contain only alphanumeric characters, \
         underscores, and hyphens.\n"]
  tag_keys : tag_key_list; [@ocaml.doc " The keys of the tags to remove from the resource. \n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc
        "The revision number of the automation rule to untag. This ensures you're untagging the \
         correct version of the rule.\n"]
  resource_arn : rule_arn; [@ocaml.doc " The ARN of the resource to untag. \n"]
}
[@@ocaml.doc ""]

type nonrec time_period = {
  end_time_exclusive : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The end time of the period, exclusive. Events before this time are included.\n"]
  start_time_inclusive : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The start time of the period, inclusive. Events at or after this time are included.\n"]
}
[@@ocaml.doc
  "Defines a time range with inclusive start time and exclusive end time for filtering and analysis.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The tag value, which can be up to 256 characters long.\n"]
  key : tag_key; [@ocaml.doc "The tag key, which can be up to 128 characters long.\n"]
}
[@@ocaml.doc
  "A key-value pair used to categorize and organize Amazon Web Services resources and automation \
   rules.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Must be 1-64 characters long and contain only alphanumeric characters, \
         underscores, and hyphens.\n"]
  tags : tag_list; [@ocaml.doc " The tags to add to the resource. \n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc
        "The revision number of the automation rule to tag. This ensures you're tagging the \
         correct version of the rule.\n"]
  resource_arn : rule_arn; [@ocaml.doc " The ARN of the resource to tag. \n"]
}
[@@ocaml.doc ""]

type nonrec savings_estimation_mode =
  | AFTER_DISCOUNT [@ocaml.doc ""]
  | BEFORE_DISCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec estimated_monthly_savings = {
  savings_estimation_mode : savings_estimation_mode;
      [@ocaml.doc "The mode used to calculate savings, either BeforeDiscount or AfterDiscount.\n"]
  after_discount_savings : Smaws_Lib.Smithy_api.Types.double;
      [@ocaml.doc " The estimated monthly savings after applying any discounts. \n"]
  before_discount_savings : Smaws_Lib.Smithy_api.Types.double;
      [@ocaml.doc " The estimated monthly savings before applying any discounts. \n"]
  currency : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The currency of the estimated savings. \n"]
}
[@@ocaml.doc " Contains information about estimated monthly cost savings. \n"]

type nonrec summary_totals = {
  estimated_monthly_savings : estimated_monthly_savings option; [@ocaml.doc ""]
  automation_event_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of automation events in this summary group.\n"]
}
[@@ocaml.doc "Aggregate totals for automation events, including counts and estimated savings.\n"]

type nonrec summary_dimension_key = EVENT_STATUS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec summary_dimension = {
  value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The specific value for this dimension key used in the summary grouping.\n"]
  key : summary_dimension_key; [@ocaml.doc "The dimension key used for categorizing summary data.\n"]
}
[@@ocaml.doc
  "A key-value pair used to categorize and group summary data for analysis and reporting.\n"]

type nonrec summary_dimensions = summary_dimension list [@@ocaml.doc ""]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec step_type =
  | CREATE_EBS_VOLUME [@ocaml.doc ""]
  | MODIFY_EBS_VOLUME [@ocaml.doc ""]
  | DELETE_EBS_VOLUME [@ocaml.doc ""]
  | CREATE_EBS_SNAPSHOT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_id = string [@@ocaml.doc ""]

type nonrec recommended_action_id = string [@@ocaml.doc ""]

type nonrec event_id = string [@@ocaml.doc ""]

type nonrec event_status =
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_COMPLETE [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | ROLLBACK_READY [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_automation_event_response = {
  event_status : event_status option; [@ocaml.doc "The current status of the automation event.\n"]
  event_id : event_id option; [@ocaml.doc "The ID of the automation event.\n"]
  recommended_action_id : recommended_action_id option;
      [@ocaml.doc "The ID of the recommended action being automated.\n"]
}
[@@ocaml.doc ""]

type nonrec start_automation_event_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Must be 1-64 characters long and contain only alphanumeric characters, \
         underscores, and hyphens.\n"]
  recommended_action_id : recommended_action_id;
      [@ocaml.doc " The ID of the recommended action to automate. \n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The request would exceed service quotas. \n"]

type nonrec rule_preview_total = {
  estimated_monthly_savings : estimated_monthly_savings; [@ocaml.doc ""]
  recommended_action_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The total number of recommended actions matching the rule preview configuration.\n"]
}
[@@ocaml.doc
  "Aggregate totals for automation rule preview results, including count and estimated savings.\n"]

type nonrec rule_id = string [@@ocaml.doc ""]

type nonrec rollback_automation_event_response = {
  event_status : event_status option;
      [@ocaml.doc " The current status of the rollback operation. \n"]
  event_id : event_id option; [@ocaml.doc " The ID of the automation event being rolled back. \n"]
}
[@@ocaml.doc ""]

type nonrec rollback_automation_event_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Must be 1-64 characters long and contain only alphanumeric characters, \
         underscores, and hyphens.\n"]
  event_id : event_id; [@ocaml.doc " The ID of the automation event to roll back. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_type = EBS_VOLUME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec ebs_volume_configuration = {
  throughput : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The throughput in MiB/s provisioned for the volume (applicable to gp3, io1, and io2bx \
         volumes).\n"]
  iops : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of I/O operations per second (IOPS) provisioned for the volume.\n"]
  size_in_gib : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The size of the EBS volume in gibibytes (GiB).\n"]
  type_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The EBS volume type, such as gp2, gp3, io1, io2, st1, or sc1.\n"]
}
[@@ocaml.doc "Configuration details for an Amazon EBS volume.\n"]

type nonrec ebs_volume = {
  configuration : ebs_volume_configuration option;
      [@ocaml.doc
        "The configuration details of the EBS volume, including type, size, IOPS, and throughput.\n"]
}
[@@ocaml.doc
  "Represents an Amazon EBS volume with its configuration and snapshot usage information.\n"]

type nonrec resource_details =
  | EbsVolume of ebs_volume
      [@ocaml.doc
        "Detailed configuration information specific to EBS volumes, including volume type, size, \
         IOPS, and throughput settings.\n"]
[@@ocaml.doc
  "Detailed configuration information for a specific Amazon Web Services resource, with \
   type-specific details.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec recommended_action = {
  resource_tags : tag_list option; [@ocaml.doc "The tags associated with the resource.\n"]
  estimated_monthly_savings : estimated_monthly_savings option; [@ocaml.doc ""]
  restart_needed : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether implementing the recommended action requires a resource restart.\n"]
  recommended_resource_details : resource_details option; [@ocaml.doc ""]
  recommended_resource_summary : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A summary of the resource's recommended configuration.\n"]
  current_resource_details : resource_details option; [@ocaml.doc ""]
  current_resource_summary : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A summary of the resource's current configuration.\n"]
  recommended_action_type : recommended_action_type option;
      [@ocaml.doc "The type of action being recommended.\n"]
  look_back_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of days of historical data used to generate the recommendation.\n"]
  resource_type : resource_type option; [@ocaml.doc "The type of resource being evaluated.\n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region where the resource is located.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID that owns the resource.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The ID of the resource that the recommendation applies to.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that the recommendation applies to.\n"]
  recommended_action_id : recommended_action_id option;
      [@ocaml.doc "The unique identifier of the recommended action.\n"]
}
[@@ocaml.doc
  "Contains information about a recommended action that can be applied to optimize an Amazon Web \
   Services resource.\n"]

type nonrec recommended_actions = recommended_action list [@@ocaml.doc ""]

type nonrec recommended_action_total = {
  estimated_monthly_savings : estimated_monthly_savings; [@ocaml.doc ""]
  recommended_action_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The total number of recommended actions in this group.\n"]
}
[@@ocaml.doc
  "Aggregate totals for a group of recommended actions, including count and estimated monthly \
   savings.\n"]

type nonrec recommended_action_summary = {
  total : recommended_action_total;
      [@ocaml.doc
        "Aggregate totals for the recommended actions in this group, including count and estimated \
         savings.\n"]
  key : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The grouping key used to categorize the recommended actions in this summary.\n"]
}
[@@ocaml.doc
  "Summary information about recommended actions, grouped by specific criteria with totals and \
   counts.\n"]

type nonrec recommended_action_summaries = recommended_action_summary list [@@ocaml.doc ""]

type nonrec recommended_action_filter_name =
  | RESOURCE_TYPE [@ocaml.doc ""]
  | RECOMMENDED_ACTION_TYPE [@ocaml.doc ""]
  | RESOURCE_ID [@ocaml.doc ""]
  | LOOK_BACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | CURRENT_RESOURCE_DETAILS_EBS_VOLUME_TYPE [@ocaml.doc ""]
  | RESOURCE_TAGS_KEY [@ocaml.doc ""]
  | RESOURCE_TAGS_VALUE [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
  | RESTART_NEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec recommended_action_filter = {
  values : filter_values;
      [@ocaml.doc
        "List of filter values to match against the specified filter name. Used to narrow down \
         recommended actions based on specific criteria.\n"]
  name : recommended_action_filter_name; [@ocaml.doc "The name of the filter field to apply.\n"]
}
[@@ocaml.doc
  "A filter used to narrow down recommended action results based on specific criteria.\n"]

type nonrec recommended_action_filter_list = recommended_action_filter list [@@ocaml.doc ""]

type nonrec preview_result = {
  resource_tags : tag_list option; [@ocaml.doc "The tags associated with the resource.\n"]
  estimated_monthly_savings : estimated_monthly_savings option; [@ocaml.doc ""]
  restart_needed : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether implementing the recommended action requires a resource restart.\n"]
  recommended_resource_details : resource_details option; [@ocaml.doc ""]
  recommended_resource_summary : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A summary of the resource's recommended configuration.\n"]
  current_resource_details : resource_details option; [@ocaml.doc ""]
  current_resource_summary : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A summary of the resource's current configuration.\n"]
  recommended_action_type : recommended_action_type option;
      [@ocaml.doc "The type of recommended action being previewed.\n"]
  look_back_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of days of historical data used to analyze the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "The type of resource being evaluated.\n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region where the resource is located.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the resource.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The ID of the resource affected by the recommended action.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource affected by the recommended action.\n"]
  recommended_action_id : recommended_action_id option;
      [@ocaml.doc "The ID of the recommended action being previewed.\n"]
}
[@@ocaml.doc
  "Contains the results of previewing an automation rule against available recommendations.\n"]

type nonrec preview_results = preview_result list [@@ocaml.doc ""]

type nonrec preview_result_summary = {
  total : rule_preview_total; [@ocaml.doc ""]
  key : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The key identifier for this preview result summary.\n"]
}
[@@ocaml.doc "Contains a summary of preview results for an automation rule.\n"]

type nonrec preview_result_summaries = preview_result_summary list [@@ocaml.doc ""]

type nonrec organization_scope = {
  account_ids : organization_configuration_account_ids option;
      [@ocaml.doc "List of Amazon Web Services account IDs to include in the organization scope.\n"]
}
[@@ocaml.doc " Defines the scope for organization-level rules when previewing matching actions.\n"]

type nonrec organization_rule_mode = NONE_ALLOWED [@ocaml.doc ""] | ANY_ALLOWED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc " The list of tags associated with the specified resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : rule_arn; [@ocaml.doc " The ARN of the resource to list tags for. \n"]
}
[@@ocaml.doc ""]

type nonrec list_recommended_actions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  recommended_actions : recommended_actions option;
      [@ocaml.doc " The list of recommended actions that match the specified criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec list_recommended_actions_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of recommended actions to return in a single response. Valid range is \
         1-1000.\n"]
  filters : recommended_action_filter_list option;
      [@ocaml.doc " The filters to apply to the list of recommended actions. \n"]
}
[@@ocaml.doc ""]

type nonrec list_recommended_action_summaries_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  recommended_action_summaries : recommended_action_summaries option;
      [@ocaml.doc " The summary of recommended actions that match the specified criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec list_recommended_action_summaries_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of recommended action summaries to return in a single response. Valid \
         range is 1-1000.\n"]
  filters : recommended_action_filter_list option;
      [@ocaml.doc
        "A list of filters to apply when retrieving recommended action summaries. Filters can be \
         based on resource type, action type, account ID, and other criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec automation_rule = {
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was last updated.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was created.\n"]
  status : rule_status option;
      [@ocaml.doc "The current status of the automation rule (Active or Inactive).\n"]
  schedule : schedule option;
      [@ocaml.doc "The schedule configuration for when the automation rule should execute.\n"]
  recommended_action_types : recommended_action_type_list option;
      [@ocaml.doc "List of recommended action types that this rule can execute.\n"]
  priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A string representation of a decimal number between 0 and 1 (having up to 30 digits after \
         the decimal point) that determines the priority of the rule. When multiple rules match \
         the same recommended action, Compute Optimizer assigns the action to the rule with the \
         lowest priority value (highest priority), even if that rule is scheduled to run later \
         than other matching rules.\n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc "Configuration settings for organization-wide rules.\n"]
  account_id : account_id option;
      [@ocaml.doc "The 12-digit Amazon Web Services account ID that owns this automation rule.\n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The revision number of the automation rule.\n"]
  rule_type : rule_type option;
      [@ocaml.doc "The type of automation rule (OrganizationRule or AccountRule).\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the automation rule.\n"]
  name : rule_name option; [@ocaml.doc "The name of the automation rule.\n"]
  rule_id : rule_id option; [@ocaml.doc "The unique identifier of the automation rule.\n"]
  rule_arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the automation rule.\n"]
}
[@@ocaml.doc
  "Represents a complete automation rule configuration including criteria, schedule, and execution \
   settings.\n"]

type nonrec automation_rules = automation_rule list [@@ocaml.doc ""]

type nonrec list_automation_rules_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  automation_rules : automation_rules option;
      [@ocaml.doc " The list of automation rules that match the specified criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec automation_rule_filter_name =
  | NAME [@ocaml.doc ""]
  | RECOMMENDED_ACTION_TYPE [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | RULE_TYPE [@ocaml.doc ""]
  | ORGANIZATION_CONFIGURATION_RULE_APPLY_ORDER [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter = {
  values : filter_values;
      [@ocaml.doc "The list of values to filter by for the specified filter field.\n"]
  name : automation_rule_filter_name; [@ocaml.doc "The name of the filter field to apply.\n"]
}
[@@ocaml.doc "A filter used to narrow down results based on specific criteria.\n"]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec list_automation_rules_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of automation rules to return in a single response. Valid range is \
         1-1000.\n"]
  filters : filter_list option;
      [@ocaml.doc " The filters to apply to the list of automation rules. \n"]
}
[@@ocaml.doc ""]

type nonrec list_automation_rule_preview_summaries_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  preview_result_summaries : preview_result_summaries option;
      [@ocaml.doc
        "The list of automation rule preview summaries that match the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec list_automation_rule_preview_summaries_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of automation rule preview summaries to return in a single response. \
         Valid range is 1-1000.\n"]
  criteria : criteria option; [@ocaml.doc ""]
  recommended_action_types : recommended_action_type_list;
      [@ocaml.doc "The types of recommended actions to include in the preview.\n"]
  organization_scope : organization_scope option;
      [@ocaml.doc "The organizational scope for the rule preview.\n"]
  rule_type : rule_type; [@ocaml.doc "The type of rule.\n"]
}
[@@ocaml.doc ""]

type nonrec list_automation_rule_preview_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  preview_results : preview_results option;
      [@ocaml.doc " The list of actions that would be taken based on the specified criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec list_automation_rule_preview_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of automation rule preview results to return in a single response. \
         Valid range is 1-1000.\n"]
  criteria : criteria option;
      [@ocaml.doc
        "A set of conditions that specify which recommended action qualify for implementation. \
         When a rule is active and a recommended action matches these criteria, Compute Optimizer \
         implements the action at the scheduled run time. \n"]
  recommended_action_types : recommended_action_type_list;
      [@ocaml.doc " The types of recommended actions to include in the preview. \n"]
  organization_scope : organization_scope option;
      [@ocaml.doc " The organizational scope for the rule preview. \n"]
  rule_type : rule_type;
      [@ocaml.doc
        " The type of rule. \n\n\
        \  Only the management account or a delegated administrator can set the ruleType to be \
         OrganizationRule.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec event_type =
  | UPGRADE_EBS_VOLUME_TYPE [@ocaml.doc ""]
  | SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME [@ocaml.doc ""]
[@@ocaml.doc "Event type enumeration"]

type nonrec automation_event = {
  estimated_monthly_savings : estimated_monthly_savings option;
      [@ocaml.doc " The estimated monthly cost savings associated with this automation event. \n"]
  completed_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the automation event completed. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation event was created.\n"]
  resource_type : resource_type option;
      [@ocaml.doc " The type of resource affected by the automation event. \n"]
  rule_id : rule_id option;
      [@ocaml.doc " The ID of the automation rule that triggered this event. \n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The Amazon Web Services Region where the automation event occurred. \n"]
  account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID associated with the automation event. \n"]
  recommended_action_id : recommended_action_id option;
      [@ocaml.doc " The ID of the recommended action associated with this automation event. \n"]
  resource_id : resource_id option;
      [@ocaml.doc " The ID of the resource affected by the automation event. \n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the resource affected by the automation event. \n"]
  event_status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The reason for the current event status. \n"]
  event_status : event_status option; [@ocaml.doc " The current status of the automation event. \n"]
  event_type : event_type option; [@ocaml.doc " The type of automation event. \n"]
  event_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " A description of the automation event. \n"]
  event_id : event_id option; [@ocaml.doc " The unique identifier for the automation event. \n"]
}
[@@ocaml.doc " Contains information about an automation event. \n"]

type nonrec automation_events = automation_event list [@@ocaml.doc ""]

type nonrec list_automation_events_response = {
  next_token : next_token option;
      [@ocaml.doc " The token to use to retrieve the next page of results. \n"]
  automation_events : automation_events option;
      [@ocaml.doc " The list of automation events that match the specified criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec automation_event_filter_name =
  | ACCOUNT_ID [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | EVENT_TYPE [@ocaml.doc ""]
  | EVENT_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec automation_event_filter = {
  values : filter_values; [@ocaml.doc " The values to use for the specified filter. \n"]
  name : automation_event_filter_name; [@ocaml.doc " The name of the filter to apply. \n"]
}
[@@ocaml.doc " A filter to apply when listing automation events. \n"]

type nonrec automation_event_filter_list = automation_event_filter list [@@ocaml.doc ""]

type nonrec list_automation_events_request = {
  next_token : next_token option; [@ocaml.doc " The token for the next page of results. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc " The maximum number of results to return in a single call. \n"]
  end_time_exclusive : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The end of the time range to query for events. \n"]
  start_time_inclusive : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The start of the time range to query for events. \n"]
  filters : automation_event_filter_list option;
      [@ocaml.doc " The filters to apply to the list of automation events. \n"]
}
[@@ocaml.doc ""]

type nonrec automation_event_summary = {
  total : summary_totals option;
      [@ocaml.doc
        "The aggregated totals for this summary, including event count and estimated savings.\n"]
  time_period : time_period option;
      [@ocaml.doc
        "The time period covered by this summary, with inclusive start time and exclusive end time.\n"]
  dimensions : summary_dimensions option;
      [@ocaml.doc "The dimensions used to group this summary, such as event status.\n"]
  key : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The key identifier for this summary grouping.\n"]
}
[@@ocaml.doc " A summary of automation events grouped by specified dimensions. \n"]

type nonrec automation_event_summary_list = automation_event_summary list [@@ocaml.doc ""]

type nonrec list_automation_event_summaries_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  automation_event_summaries : automation_event_summary_list option;
      [@ocaml.doc " The list of automation event summaries that match the specified criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec list_automation_event_summaries_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of automation event summaries to return in a single response. Valid \
         range is 1-1000.\n"]
  end_date_exclusive : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The end date for filtering automation event summaries, exclusive. Events created before \
         this date will be included.\n"]
  start_date_inclusive : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The start date for filtering automation event summaries, inclusive. Events created on or \
         after this date will be included.\n"]
  filters : automation_event_filter_list option;
      [@ocaml.doc " The filters to apply to the list of automation event summaries. \n"]
}
[@@ocaml.doc ""]

type nonrec automation_event_step = {
  estimated_monthly_savings : estimated_monthly_savings option; [@ocaml.doc ""]
  completed_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when this automation event step completed execution.\n"]
  start_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when this automation event step started execution.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The unique identifier of the resource being acted upon in this step.\n"]
  step_status : step_status option; [@ocaml.doc " The current status of the step. \n"]
  step_type : step_type option; [@ocaml.doc " The type of step. \n"]
  step_id : step_id option; [@ocaml.doc " The unique identifier for this step. \n"]
  event_id : event_id option; [@ocaml.doc " The ID of the automation event this step belongs to. \n"]
}
[@@ocaml.doc " Contains information about a step in an automation event. \n"]

type nonrec automation_event_steps = automation_event_step list [@@ocaml.doc ""]

type nonrec list_automation_event_steps_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination. If present, indicates there are more results available and \
         can be used in subsequent requests.\n"]
  automation_event_steps : automation_event_steps option;
      [@ocaml.doc " The list of steps for the specified automation event. \n"]
}
[@@ocaml.doc ""]

type nonrec list_automation_event_steps_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next set of results when the response is \
         truncated.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of automation event steps to return in a single response. Valid range \
         is 1-1000.\n"]
  event_id : event_id; [@ocaml.doc " The ID of the automation event. \n"]
}
[@@ocaml.doc ""]

type nonrec account_info = {
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The timestamp when the account's Automation enrollment status was last updated. \n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for the current Automation enrollment status. \n"]
  organization_rule_mode : organization_rule_mode;
      [@ocaml.doc
        "Specifies whether the management account can create Automation rules that implement \
         optimization actions for this account. \n"]
  status : enrollment_status;
      [@ocaml.doc " The enrollment status of the account: Active, Inactive, Pending, or Failed. \n"]
  account_id : account_id; [@ocaml.doc " The ID of the Amazon Web Services account. \n"]
}
[@@ocaml.doc
  " Contains information about an Amazon Web Services account's enrollment and association status \
   with Compute Optimizer Automation. \n"]

type nonrec account_info_list = account_info list [@@ocaml.doc ""]

type nonrec list_accounts_response = {
  next_token : next_token option;
      [@ocaml.doc " The token to use to retrieve the next page of results. \n"]
  accounts : account_info_list;
      [@ocaml.doc " The list of accounts in your organization enrolled in Compute Optimizer \n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_request = {
  next_token : next_token option; [@ocaml.doc " The token for the next page of results. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc " The maximum number of results to return in a single call. \n"]
}
[@@ocaml.doc ""]

type nonrec get_enrollment_configuration_response = {
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp of the last update to the enrollment configuration. \n"]
  organization_rule_mode : organization_rule_mode option;
      [@ocaml.doc
        "Specifies whether the management account can create Automation rules that implement \
         optimization actions for this account. \n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The reason for the current enrollment status. \n"]
  status : enrollment_status; [@ocaml.doc " The current enrollment status. \n"]
}
[@@ocaml.doc ""]

type nonrec get_enrollment_configuration_request = unit [@@ocaml.doc ""]

type nonrec get_automation_rule_response = {
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was last updated.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was created.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the automation rule.\n"]
  status : rule_status option;
      [@ocaml.doc "The current status of the automation rule (Active or Inactive).\n"]
  schedule : schedule option; [@ocaml.doc ""]
  criteria : criteria option; [@ocaml.doc ""]
  recommended_action_types : recommended_action_type_list option;
      [@ocaml.doc "List of recommended action types that this rule can execute.\n"]
  priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A string representation of a decimal number between 0 and 1 (having up to 30 digits after \
         the decimal point) that determines the priority of the rule.\n"]
  organization_configuration : organization_configuration option; [@ocaml.doc ""]
  account_id : account_id option;
      [@ocaml.doc "The 12-digit Amazon Web Services account ID that owns this automation rule.\n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The revision number of the automation rule.\n"]
  rule_type : rule_type option; [@ocaml.doc "The type of automation rule.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the automation rule.\n"]
  name : rule_name option; [@ocaml.doc "The name of the automation rule.\n"]
  rule_id : rule_id option; [@ocaml.doc "The unique identifier of the automation rule.\n"]
  rule_arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the automation rule.\n"]
}
[@@ocaml.doc ""]

type nonrec get_automation_rule_request = {
  rule_arn : rule_arn; [@ocaml.doc " The ARN of the rule to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec get_automation_event_response = {
  estimated_monthly_savings : estimated_monthly_savings option; [@ocaml.doc ""]
  completed_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation event completed.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation event was created.\n"]
  resource_type : resource_type option;
      [@ocaml.doc "The type of resource affected by the automation event.\n"]
  rule_id : rule_id option;
      [@ocaml.doc "The ID of the automation rule that triggered this event.\n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region where the automation event occurred.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the automation event.\n"]
  recommended_action_id : recommended_action_id option;
      [@ocaml.doc "The ID of the recommended action associated with this automation event.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The ID of the resource affected by the automation event.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource affected by the automation event.\n"]
  event_status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for the current event status.\n"]
  event_status : event_status option; [@ocaml.doc "The current status of the automation event.\n"]
  event_type : event_type option; [@ocaml.doc "The type of automation event.\n"]
  event_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the automation event.\n"]
  event_id : event_id option; [@ocaml.doc "The ID of the automation event to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_automation_event_request = {
  event_id : event_id; [@ocaml.doc " The ID of the automation event to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec account_id_list = account_id list [@@ocaml.doc ""]

type nonrec disassociate_accounts_response = {
  errors : string_list option;
      [@ocaml.doc " Any errors that occurred during the disassociation process. \n"]
  account_ids : account_id_list option;
      [@ocaml.doc " The IDs of the member accounts that were successfully disassociated. \n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_accounts_request = {
  client_token : client_token option;
      [@ocaml.doc " A unique identifier to ensure idempotency of the request. \n"]
  account_ids : account_id_list; [@ocaml.doc " The IDs of the member accounts to disassociate. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_automation_rule_response = unit [@@ocaml.doc ""]

type nonrec delete_automation_rule_request = {
  client_token : client_token option;
      [@ocaml.doc " A unique identifier to ensure idempotency of the request. \n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc " The revision number of the rule to delete. \n"]
  rule_arn : rule_arn; [@ocaml.doc " The ARN of the rule to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec create_automation_rule_response = {
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the automation rule was created.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs used to categorize and organize the automation rule. Maximum of \
         200 tags allowed.\n"]
  status : rule_status option;
      [@ocaml.doc "The current status of the automation rule. Can be Active or Inactive.\n"]
  schedule : schedule option;
      [@ocaml.doc
        "The schedule configuration for when the automation rule should execute, including cron \
         expression, timezone, and execution window.\n"]
  criteria : criteria option; [@ocaml.doc ""]
  recommended_action_types : recommended_action_type_list option;
      [@ocaml.doc
        "List of recommended action types that this rule can execute, such as \
         SnapshotAndDeleteUnattachedEbsVolume or UpgradeEbsVolumeType.\n"]
  priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The priority level of the automation rule, used to determine execution order when \
         multiple rules apply to the same resource.\n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc
        "Configuration settings for organization-wide rules, including rule application order and \
         target account IDs.\n"]
  rule_revision : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "The revision number of the automation rule. This is incremented each time the rule is \
         updated.\n"]
  rule_type : rule_type option;
      [@ocaml.doc
        "The type of automation rule. Can be either OrganizationRule for organization-wide rules \
         or AccountRule for account-specific rules.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A description of the automation rule. Can be up to 1024 characters long and contain \
         alphanumeric characters, underscores, hyphens, spaces, and certain special characters.\n"]
  name : rule_name option;
      [@ocaml.doc
        "The name of the automation rule. Must be 1-128 characters long and contain only \
         alphanumeric characters, underscores, and hyphens.\n"]
  rule_id : rule_id option; [@ocaml.doc " The unique identifier of the created rule. \n"]
  rule_arn : rule_arn option; [@ocaml.doc " The Amazon Resource Name (ARN) of the created rule. \n"]
}
[@@ocaml.doc ""]

type nonrec create_automation_rule_request = {
  client_token : client_token option;
      [@ocaml.doc " A unique identifier to ensure idempotency of the request. \n"]
  tags : tag_list option; [@ocaml.doc " The tags to associate with the rule. \n"]
  status : rule_status; [@ocaml.doc "The status of the rule \n"]
  schedule : schedule; [@ocaml.doc " The schedule for when the rule should run. \n"]
  criteria : criteria option;
      [@ocaml.doc
        "A set of conditions that specify which recommended action qualify for implementation. \
         When a rule is active and a recommended action matches these criteria, Compute Optimizer \
         implements the action at the scheduled run time. \n"]
  recommended_action_types : recommended_action_type_list;
      [@ocaml.doc " The types of recommended actions this rule will automate. \n"]
  priority : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A string representation of a decimal number between 0 and 1 (having up to 30 digits after \
         the decimal point) that determines the priority of the rule. When multiple rules match \
         the same recommended action, Compute Optimizer assigns the action to the rule with the \
         lowest priority value (highest priority), even if that rule is scheduled to run later \
         than other matching rules. \n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc
        " Configuration for organization-level rules. Required for OrganizationRule type. \n"]
  rule_type : rule_type;
      [@ocaml.doc
        " The type of rule. \n\n\
        \  Only the management account or a delegated administrator can set the ruleType to be \
         OrganizationRule.\n\
        \  \n\
        \   "]
  description : rule_description option; [@ocaml.doc " A description of the automation rule. \n"]
  name : rule_name; [@ocaml.doc " The name of the automation rule. \n"]
}
[@@ocaml.doc ""]

type nonrec associate_accounts_response = {
  errors : string_list option;
      [@ocaml.doc " Any errors that occurred during the association process. \n"]
  account_ids : account_id_list option;
      [@ocaml.doc " The IDs of the member accounts that were successfully associated. \n"]
}
[@@ocaml.doc ""]

type nonrec associate_accounts_request = {
  client_token : client_token option;
      [@ocaml.doc
        " A unique identifier to ensure idempotency of the request. Valid for 24 hours after \
         creation. \n"]
  account_ids : account_id_list;
      [@ocaml.doc
        " The IDs of the member accounts to associate. You can specify up to 50 account IDs. \n"]
}
[@@ocaml.doc ""]
