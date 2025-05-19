open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "ssm";
      endpointPrefix = "ssm";
      version = "2014-11-06";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec update_service_setting_result = unit
type nonrec update_service_setting_request =
  {
  setting_value: string ;
  setting_id: string }[@@ocaml.doc
                        "The request body of the UpdateServiceSetting API operation.\n"]
type nonrec too_many_updates = {
  message: string option }[@@ocaml.doc
                            "There are concurrent updates for a resource that supports one update at a time.\n"]
type nonrec service_setting_not_found = {
  message: string option }[@@ocaml.doc
                            "The specified service setting wasn't found. Either the service name or the setting hasn't been provisioned by the Amazon Web Services service team.\n"]
type nonrec internal_server_error = {
  message: string option }[@@ocaml.doc
                            "An error occurred on the server side.\n"]
type nonrec update_resource_data_sync_result = unit
type nonrec resource_data_sync_organizational_unit =
  {
  organizational_unit_id: string option }[@@ocaml.doc
                                           "The Organizations organizational unit data source for the sync.\n"]
type nonrec resource_data_sync_aws_organizations_source =
  {
  organizational_units: resource_data_sync_organizational_unit list option ;
  organization_source_type: string }[@@ocaml.doc
                                      "Information about the [AwsOrganizationsSource] resource data sync source. A sync source of this type can synchronize data from Organizations or, if an Amazon Web Services organization isn't present, from multiple Amazon Web Services Regions.\n"]
type nonrec resource_data_sync_source =
  {
  enable_all_ops_data_sources: bool option ;
  include_future_regions: bool option ;
  source_regions: string list ;
  aws_organizations_source:
    resource_data_sync_aws_organizations_source option ;
  source_type: string }[@@ocaml.doc
                         "Information about the source of the data included in the resource data sync.\n"]
type nonrec update_resource_data_sync_request =
  {
  sync_source: resource_data_sync_source ;
  sync_type: string ;
  sync_name: string }[@@ocaml.doc ""]
type nonrec resource_data_sync_not_found_exception =
  {
  message: string option ;
  sync_type: string option ;
  sync_name: string option }[@@ocaml.doc
                              "The specified sync name wasn't found.\n"]
type nonrec resource_data_sync_invalid_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "The specified sync configuration is invalid.\n"]
type nonrec resource_data_sync_conflict_exception = {
  message: string option }[@@ocaml.doc
                            "Another [UpdateResourceDataSync] request is being processed. Wait a few minutes and try again.\n"]
type nonrec operating_system =
  | AmazonLinux2023 
  | AlmaLinux 
  | Rocky_Linux 
  | Raspbian 
  | MacOS 
  | Debian 
  | OracleLinux 
  | CentOS 
  | Suse 
  | RedhatEnterpriseLinux 
  | Ubuntu 
  | AmazonLinux2022 
  | AmazonLinux2 
  | AmazonLinux 
  | Windows [@@ocaml.doc ""]
type nonrec patch_filter_key =
  | Version 
  | Security 
  | Severity 
  | Release 
  | Repository 
  | Priority 
  | Section 
  | PatchId 
  | Name 
  | MsrcSeverity 
  | Epoch 
  | CVEId 
  | Classification 
  | ProductFamily 
  | Product 
  | PatchSet 
  | BugzillaId 
  | AdvisoryId 
  | Arch [@@ocaml.doc ""]
type nonrec patch_filter = {
  values: string list ;
  key: patch_filter_key }[@@ocaml.doc
                           " Defines which patches should be included in a patch baseline.\n\n A patch filter consists of a key and a set of values. The filter key is a patch property. For example, the available filter keys for [WINDOWS] are [PATCH_SET], [PRODUCT], [PRODUCT_FAMILY], [CLASSIFICATION], and [MSRC_SEVERITY].\n \n  The filter values define a matching criterion for the patch property indicated by the key. For example, if the filter key is [PRODUCT] and the filter values are [\\[\"Office\n    2013\", \"Office 2016\"\\]], then the filter accepts all patches where product name is either \"Office 2013\" or \"Office 2016\". The filter values can be exact values for the patch property given as a key, or a wildcard (*), which matches all values.\n  \n   You can view lists of valid values for the patch properties by running the [DescribePatchProperties] command. For information about which patch properties can be used with each major operating system, see [DescribePatchProperties].\n   "]
type nonrec patch_filter_group = {
  patch_filters: patch_filter list }[@@ocaml.doc
                                      "A set of patch filters, typically used for approval rules.\n"]
type nonrec patch_compliance_level =
  | Unspecified 
  | Informational 
  | Low 
  | Medium 
  | High 
  | Critical [@@ocaml.doc ""]
type nonrec patch_rule =
  {
  enable_non_security: bool option ;
  approve_until_date: string option ;
  approve_after_days: int option ;
  compliance_level: patch_compliance_level option ;
  patch_filter_group: patch_filter_group }[@@ocaml.doc
                                            "Defines an approval rule for a patch baseline.\n"]
type nonrec patch_rule_group = {
  patch_rules: patch_rule list }[@@ocaml.doc
                                  "A set of rules defining the approval rules for a patch baseline.\n"]
type nonrec patch_action =
  | Block 
  | AllowAsDependency [@@ocaml.doc ""]
type nonrec patch_source =
  {
  configuration: string ;
  products: string list ;
  name: string }[@@ocaml.doc
                  "Information about the patches to use to update the managed nodes, including target operating systems and source repository. Applies to Linux managed nodes only.\n"]
type nonrec update_patch_baseline_result =
  {
  sources: patch_source list option ;
  description: string option ;
  modified_date: CoreTypes.Timestamp.t option ;
  created_date: CoreTypes.Timestamp.t option ;
  rejected_patches_action: patch_action option ;
  rejected_patches: string list option ;
  approved_patches_enable_non_security: bool option ;
  approved_patches_compliance_level: patch_compliance_level option ;
  approved_patches: string list option ;
  approval_rules: patch_rule_group option ;
  global_filters: patch_filter_group option ;
  operating_system: operating_system option ;
  name: string option ;
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec update_patch_baseline_request =
  {
  replace: bool option ;
  sources: patch_source list option ;
  description: string option ;
  rejected_patches_action: patch_action option ;
  rejected_patches: string list option ;
  approved_patches_enable_non_security: bool option ;
  approved_patches_compliance_level: patch_compliance_level option ;
  approved_patches: string list option ;
  approval_rules: patch_rule_group option ;
  global_filters: patch_filter_group option ;
  name: string option ;
  baseline_id: string }[@@ocaml.doc ""]
type nonrec does_not_exist_exception = {
  message: string option }[@@ocaml.doc
                            "Error returned when the ID specified for a resource, such as a maintenance window or patch baseline, doesn't exist.\n\n For information about resource quotas in Amazon Web Services Systems Manager, see {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#limits_ssm}Systems Manager service quotas} in the {i Amazon Web Services General Reference}.\n "]
type nonrec update_ops_metadata_result = {
  ops_metadata_arn: string option }[@@ocaml.doc ""]
type nonrec metadata_value = {
  value: string option }[@@ocaml.doc
                          "Metadata to assign to an Application Manager application.\n"]
type nonrec metadata_map = (string * metadata_value) list[@@ocaml.doc ""]
type nonrec update_ops_metadata_request =
  {
  keys_to_delete: string list option ;
  metadata_to_update: metadata_map option ;
  ops_metadata_arn: string }[@@ocaml.doc ""]
type nonrec ops_metadata_too_many_updates_exception =
  {
  message: string option }[@@ocaml.doc
                            "The system is processing too many concurrent updates. Wait a few moments and try again.\n"]
type nonrec ops_metadata_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The OpsMetadata object doesn't exist. \n"]
type nonrec ops_metadata_key_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "The OpsMetadata object exceeds the maximum number of OpsMetadata keys that you can assign to an application in Application Manager.\n"]
type nonrec ops_metadata_invalid_argument_exception =
  {
  message: string option }[@@ocaml.doc
                            "One of the arguments passed is invalid. \n"]
type nonrec update_ops_item_response = unit
type nonrec ops_item_data_type =
  | STRING 
  | SEARCHABLE_STRING [@@ocaml.doc ""]
type nonrec ops_item_data_value =
  {
  type_: ops_item_data_type option ;
  value: string option }[@@ocaml.doc
                          "An object that defines the value of the key and its type in the OperationalData map.\n"]
type nonrec ops_item_operational_data = (string * ops_item_data_value) list
[@@ocaml.doc ""]
type nonrec ops_item_notification = {
  arn: string option }[@@ocaml.doc "A notification about the OpsItem.\n"]
type nonrec related_ops_item = {
  ops_item_id: string }[@@ocaml.doc
                         "An OpsItems that shares something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.\n"]
type nonrec ops_item_status =
  | CLOSED 
  | REJECTED 
  | APPROVED 
  | PENDING_APPROVAL 
  | CHANGE_CALENDAR_OVERRIDE_REJECTED 
  | CHANGE_CALENDAR_OVERRIDE_APPROVED 
  | PENDING_CHANGE_CALENDAR_OVERRIDE 
  | RUNBOOK_IN_PROGRESS 
  | SCHEDULED 
  | COMPLETED_WITH_FAILURE 
  | COMPLETED_WITH_SUCCESS 
  | FAILED 
  | CANCELLED 
  | CANCELLING 
  | TIMED_OUT 
  | PENDING 
  | RESOLVED 
  | IN_PROGRESS 
  | OPEN [@@ocaml.doc ""]
type nonrec update_ops_item_request =
  {
  ops_item_arn: string option ;
  planned_end_time: CoreTypes.Timestamp.t option ;
  planned_start_time: CoreTypes.Timestamp.t option ;
  actual_end_time: CoreTypes.Timestamp.t option ;
  actual_start_time: CoreTypes.Timestamp.t option ;
  severity: string option ;
  category: string option ;
  title: string option ;
  ops_item_id: string ;
  status: ops_item_status option ;
  related_ops_items: related_ops_item list option ;
  priority: int option ;
  notifications: ops_item_notification list option ;
  operational_data_to_delete: string list option ;
  operational_data: ops_item_operational_data option ;
  description: string option }[@@ocaml.doc ""]
type nonrec ops_item_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified OpsItem ID doesn't exist. Verify the ID and try again.\n"]
type nonrec ops_item_limit_exceeded_exception =
  {
  message: string option ;
  limit_type: string option ;
  limit: int option ;
  resource_types: string list option }[@@ocaml.doc
                                        "The request caused OpsItems to exceed one or more quotas.\n"]
type nonrec ops_item_invalid_parameter_exception =
  {
  message: string option ;
  parameter_names: string list option }[@@ocaml.doc
                                         "A specified parameter argument isn't valid. Verify the available arguments and try again.\n"]
type nonrec ops_item_conflict_exception = {
  message: string option }[@@ocaml.doc
                            "The specified OpsItem is in the process of being deleted.\n"]
type nonrec ops_item_already_exists_exception =
  {
  ops_item_id: string option ;
  message: string option }[@@ocaml.doc "The OpsItem already exists.\n"]
type nonrec ops_item_access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "You don't have permission to view OpsItems in the specified account. Verify that your account is configured either as a Systems Manager delegated administrator or that you are logged into the Organizations management account.\n"]
type nonrec update_managed_instance_role_result = unit
type nonrec update_managed_instance_role_request =
  {
  iam_role: string ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec invalid_instance_id = {
  message: string option }[@@ocaml.doc
                            "The following problems can cause this exception:\n\n {ul\n       {-  You don't have permission to access the managed node.\n           \n            }\n       {-  Amazon Web Services Systems Manager Agent (SSM Agent) isn't running. Verify that SSM Agent is running.\n           \n            }\n       {-  SSM Agent isn't registered with the SSM endpoint. Try reinstalling SSM Agent.\n           \n            }\n       {-  The managed node isn't in a valid state. Valid states are: [Running], [Pending], [Stopped], and [Stopping]. Invalid states are: [Shutting-down] and [Terminated].\n           \n            }\n       }\n  "]
type nonrec target = {
  values: string list option ;
  key: string option }[@@ocaml.doc
                        "An array of search criteria that targets managed nodes using a key-value pair that you specify.\n\n   One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n    Supported formats include the following.\n    \n      {b For all Systems Manager capabilities:} \n     \n      {ul\n            {-   [Key=tag-key,Values=tag-value-1,tag-value-2] \n                \n                 }\n            }\n    {b For Automation and Change Manager:} \n   \n    {ul\n          {-   [Key=tag:tag-key,Values=tag-value] \n              \n               }\n          {-   [Key=ResourceGroup,Values=resource-group-name] \n              \n               }\n          {-   [Key=ParameterValues,Values=value-1,value-2,value-3] \n              \n               }\n          {-  To target all instances in the Amazon Web Services Region:\n              \n               {ul\n                     {-   [Key=AWS::EC2::Instance,Values=*] \n                         \n                          }\n                     {-   [Key=InstanceIds,Values=*] \n                         \n                          }\n                     \n           }\n            }\n          }\n    {b For Run Command and Maintenance Windows:} \n   \n    {ul\n          {-   [Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3] \n              \n               }\n          {-   [Key=tag:tag-key,Values=tag-value-1,tag-value-2] \n              \n               }\n          {-   [Key=resource-groups:Name,Values=resource-group-name] \n              \n               }\n          {-  Additionally, Maintenance Windows support targeting resource types:\n              \n               {ul\n                     {-   [Key=resource-groups:ResourceTypeFilters,Values=resource-type-1,resource-type-2] \n                         \n                          }\n                     \n           }\n            }\n          }\n    {b For State Manager:} \n   \n    {ul\n          {-   [Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3] \n              \n               }\n          {-   [Key=tag:tag-key,Values=tag-value-1,tag-value-2] \n              \n               }\n          {-  To target all instances in the Amazon Web Services Region:\n              \n               {ul\n                     {-   [Key=InstanceIds,Values=*] \n                         \n                          }\n                     \n           }\n            }\n          }\n   For more information about how to send commands that target managed nodes using [Key,Value] parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting}Targeting multiple managed nodes} in the {i Amazon Web Services Systems Manager User Guide}.\n   "]
type nonrec maintenance_window_task_parameter_value_expression =
  {
  values: string list option }[@@ocaml.doc
                                "Defines the values for a task parameter.\n"]
type nonrec maintenance_window_task_parameters =
  (string * maintenance_window_task_parameter_value_expression) list[@@ocaml.doc
                                                                    ""]
type nonrec cloud_watch_output_config =
  {
  cloud_watch_output_enabled: bool option ;
  cloud_watch_log_group_name: string option }[@@ocaml.doc
                                               "Configuration options for sending command output to Amazon CloudWatch Logs.\n"]
type nonrec document_hash_type =
  | SHA1 
  | SHA256 [@@ocaml.doc ""]
type nonrec notification_event =
  | FAILED 
  | CANCELLED 
  | TIMED_OUT 
  | SUCCESS 
  | IN_PROGRESS 
  | ALL [@@ocaml.doc ""]
type nonrec notification_type =
  | Invocation 
  | Command [@@ocaml.doc ""]
type nonrec notification_config =
  {
  notification_type: notification_type option ;
  notification_events: notification_event list option ;
  notification_arn: string option }[@@ocaml.doc
                                     "Configurations for sending notifications.\n"]
type nonrec parameters = (string * string list) list[@@ocaml.doc ""]
type nonrec maintenance_window_run_command_parameters =
  {
  timeout_seconds: int option ;
  service_role_arn: string option ;
  parameters: parameters option ;
  output_s3_key_prefix: string option ;
  output_s3_bucket_name: string option ;
  notification_config: notification_config option ;
  document_version: string option ;
  document_hash_type: document_hash_type option ;
  document_hash: string option ;
  cloud_watch_output_config: cloud_watch_output_config option ;
  comment: string option }[@@ocaml.doc
                            "The parameters for a [RUN_COMMAND] task type.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For [RUN_COMMAND] tasks, Systems Manager uses specified values for [TaskParameters] and [LoggingInfo] only if no values are specified for [TaskInvocationParameters]. \n     \n      "]
type nonrec automation_parameter_map = (string * string list) list[@@ocaml.doc
                                                                    ""]
type nonrec maintenance_window_automation_parameters =
  {
  parameters: automation_parameter_map option ;
  document_version: string option }[@@ocaml.doc
                                     "The parameters for an [AUTOMATION] task type.\n"]
type nonrec maintenance_window_step_functions_parameters =
  {
  name: string option ;
  input: string option }[@@ocaml.doc
                          "The parameters for a [STEP_FUNCTIONS] task.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For Step Functions tasks, Systems Manager ignores any values specified for [TaskParameters] and [LoggingInfo].\n     \n      "]
type nonrec maintenance_window_lambda_parameters =
  {
  payload: bytes option ;
  qualifier: string option ;
  client_context: string option }[@@ocaml.doc
                                   "The parameters for a [LAMBDA] task type.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For Lambda tasks, Systems Manager ignores any values specified for TaskParameters and LoggingInfo.\n     \n      "]
type nonrec maintenance_window_task_invocation_parameters =
  {
  lambda: maintenance_window_lambda_parameters option ;
  step_functions: maintenance_window_step_functions_parameters option ;
  automation: maintenance_window_automation_parameters option ;
  run_command: maintenance_window_run_command_parameters option }[@@ocaml.doc
                                                                   "The parameters for task execution.\n"]
type nonrec logging_info =
  {
  s3_region: string ;
  s3_key_prefix: string option ;
  s3_bucket_name: string }[@@ocaml.doc
                            "Information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed node-level logs to.\n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "]
type nonrec maintenance_window_task_cutoff_behavior =
  | CancelTask 
  | ContinueTask [@@ocaml.doc ""]
type nonrec alarm = {
  name: string }[@@ocaml.doc
                  "A CloudWatch alarm you apply to an automation or command.\n"]
type nonrec alarm_configuration =
  {
  alarms: alarm list ;
  ignore_poll_alarm_failure: bool option }[@@ocaml.doc
                                            "The details for the CloudWatch alarm you want to apply to an automation or command.\n"]
type nonrec update_maintenance_window_task_result =
  {
  alarm_configuration: alarm_configuration option ;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option ;
  description: string option ;
  name: string option ;
  logging_info: logging_info option ;
  max_errors: string option ;
  max_concurrency: string option ;
  priority: int option ;
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option ;
  task_parameters: maintenance_window_task_parameters option ;
  service_role_arn: string option ;
  task_arn: string option ;
  targets: target list option ;
  window_task_id: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec update_maintenance_window_task_request =
  {
  alarm_configuration: alarm_configuration option ;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option ;
  replace: bool option ;
  description: string option ;
  name: string option ;
  logging_info: logging_info option ;
  max_errors: string option ;
  max_concurrency: string option ;
  priority: int option ;
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option ;
  task_parameters: maintenance_window_task_parameters option ;
  service_role_arn: string option ;
  task_arn: string option ;
  targets: target list option ;
  window_task_id: string ;
  window_id: string }[@@ocaml.doc ""]
type nonrec update_maintenance_window_target_result =
  {
  description: string option ;
  name: string option ;
  owner_information: string option ;
  targets: target list option ;
  window_target_id: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec update_maintenance_window_target_request =
  {
  replace: bool option ;
  description: string option ;
  name: string option ;
  owner_information: string option ;
  targets: target list option ;
  window_target_id: string ;
  window_id: string }[@@ocaml.doc ""]
type nonrec update_maintenance_window_result =
  {
  enabled: bool option ;
  allow_unassociated_targets: bool option ;
  cutoff: int option ;
  duration: int option ;
  schedule_offset: int option ;
  schedule_timezone: string option ;
  schedule: string option ;
  end_date: string option ;
  start_date: string option ;
  description: string option ;
  name: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec update_maintenance_window_request =
  {
  replace: bool option ;
  enabled: bool option ;
  allow_unassociated_targets: bool option ;
  cutoff: int option ;
  duration: int option ;
  schedule_offset: int option ;
  schedule_timezone: string option ;
  schedule: string option ;
  end_date: string option ;
  start_date: string option ;
  description: string option ;
  name: string option ;
  window_id: string }[@@ocaml.doc ""]
type nonrec document_status =
  | Failed 
  | Deleting 
  | Updating 
  | Active 
  | Creating [@@ocaml.doc "The status of a document.\n"]
type nonrec document_parameter_type =
  | StringList 
  | String [@@ocaml.doc ""]
type nonrec document_parameter =
  {
  default_value: string option ;
  description: string option ;
  type_: document_parameter_type option ;
  name: string option }[@@ocaml.doc
                         "Parameters specified in a Systems Manager document that run on the server when the command is run. \n"]
type nonrec platform_type =
  | MACOS 
  | LINUX 
  | WINDOWS [@@ocaml.doc ""]
type nonrec document_type =
  | QuickSetup 
  | ConformancePackTemplate 
  | CloudFormation 
  | ProblemAnalysisTemplate 
  | ProblemAnalysis 
  | ChangeTemplate 
  | ChangeCalendar 
  | DeploymentStrategy 
  | ApplicationConfigurationSchema 
  | ApplicationConfiguration 
  | Package 
  | Session 
  | Automation 
  | Policy 
  | Command [@@ocaml.doc ""]
type nonrec document_format =
  | TEXT 
  | JSON 
  | YAML [@@ocaml.doc ""]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Metadata that you assign to your Amazon Web Services resources. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. In Amazon Web Services Systems Manager, you can apply tags to Systems Manager documents (SSM documents), managed nodes, maintenance windows, parameters, patch baselines, OpsItems, and OpsMetadata.\n"]
type nonrec attachment_information = {
  name: string option }[@@ocaml.doc
                         "An attribute of an attachment, such as the attachment name.\n"]
type nonrec document_requires =
  {
  version_name: string option ;
  require_type: string option ;
  version: string option ;
  name: string }[@@ocaml.doc
                  "An SSM document required by the current document.\n"]
type nonrec review_status =
  | REJECTED 
  | PENDING 
  | NOT_REVIEWED 
  | APPROVED [@@ocaml.doc ""]
type nonrec review_information =
  {
  reviewer: string option ;
  status: review_status option ;
  reviewed_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                 "Information about the result of a document review request.\n"]
type nonrec document_description =
  {
  category_enum: string list option ;
  category: string list option ;
  review_status: review_status option ;
  pending_review_version: string option ;
  approved_version: string option ;
  review_information: review_information list option ;
  author: string option ;
  requires: document_requires list option ;
  attachments_information: attachment_information list option ;
  tags: tag list option ;
  target_type: string option ;
  document_format: document_format option ;
  default_version: string option ;
  latest_version: string option ;
  schema_version: string option ;
  document_type: document_type option ;
  platform_types: platform_type list option ;
  parameters: document_parameter list option ;
  description: string option ;
  document_version: string option ;
  status_information: string option ;
  status: document_status option ;
  created_date: CoreTypes.Timestamp.t option ;
  owner: string option ;
  version_name: string option ;
  display_name: string option ;
  name: string option ;
  hash_type: document_hash_type option ;
  hash: string option ;
  sha1: string option }[@@ocaml.doc
                         "Describes an Amazon Web Services Systems Manager document (SSM document). \n"]
type nonrec update_document_result =
  {
  document_description: document_description option }[@@ocaml.doc ""]
type nonrec attachments_source_key =
  | AttachmentReference 
  | S3FileUrl 
  | SourceUrl [@@ocaml.doc ""]
type nonrec attachments_source =
  {
  name: string option ;
  values: string list option ;
  key: attachments_source_key option }[@@ocaml.doc
                                        "Identifying information about a document attachment, including the file name and a key-value pair that identifies the location of an attachment to a document.\n"]
type nonrec update_document_request =
  {
  target_type: string option ;
  document_format: document_format option ;
  document_version: string option ;
  version_name: string option ;
  display_name: string option ;
  name: string ;
  attachments: attachments_source list option ;
  content: string }[@@ocaml.doc ""]
type nonrec update_document_metadata_response = unit
type nonrec document_review_action =
  | Reject 
  | Approve 
  | UpdateReview 
  | SendForReview [@@ocaml.doc ""]
type nonrec document_review_comment_type =
  | Comment [@@ocaml.doc ""]
type nonrec document_review_comment_source =
  {
  content: string option ;
  type_: document_review_comment_type option }[@@ocaml.doc
                                                "Information about comments added to a document review request.\n"]
type nonrec document_reviews =
  {
  comment: document_review_comment_source list option ;
  action: document_review_action }[@@ocaml.doc
                                    "Information about a document approval review.\n"]
type nonrec update_document_metadata_request =
  {
  document_reviews: document_reviews ;
  document_version: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec invalid_document_version = {
  message: string option }[@@ocaml.doc
                            "The document version isn't valid or doesn't exist.\n"]
type nonrec invalid_document_operation = {
  message: string option }[@@ocaml.doc
                            "You attempted to delete a document while it is still shared. You must stop sharing the document before you can delete it.\n"]
type nonrec invalid_document = {
  message: string option }[@@ocaml.doc
                            "The specified SSM document doesn't exist.\n"]
type nonrec document_default_version_description =
  {
  default_version_name: string option ;
  default_version: string option ;
  name: string option }[@@ocaml.doc "A default version of a document.\n"]
type nonrec update_document_default_version_result =
  {
  description: document_default_version_description option }[@@ocaml.doc ""]
type nonrec update_document_default_version_request =
  {
  document_version: string ;
  name: string }[@@ocaml.doc ""]
type nonrec invalid_document_schema_version = {
  message: string option }[@@ocaml.doc
                            "The version of the document schema isn't supported.\n"]
type nonrec max_document_size_exceeded = {
  message: string option }[@@ocaml.doc
                            "The size limit of a document is 64 KB.\n"]
type nonrec invalid_document_content = {
  message: string option }[@@ocaml.doc
                            "The content for the document isn't valid.\n"]
type nonrec duplicate_document_version_name = {
  message: string option }[@@ocaml.doc
                            "The version name has already been used in this document. Specify a different version name, and then try again.\n"]
type nonrec duplicate_document_content = {
  message: string option }[@@ocaml.doc
                            "The content of the association document matches another document. Change the content of the document and try again.\n"]
type nonrec document_version_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The document has too many versions. Delete one or more document versions and try again.\n"]
type nonrec association_status_name =
  | Failed 
  | Success 
  | Pending [@@ocaml.doc ""]
type nonrec association_status =
  {
  additional_info: string option ;
  message: string ;
  name: association_status_name ;
  date: CoreTypes.Timestamp.t }[@@ocaml.doc
                                 "Describes an association status.\n"]
type nonrec association_status_aggregated_count = (string * int) list
[@@ocaml.doc ""]
type nonrec association_overview =
  {
  association_status_aggregated_count:
    association_status_aggregated_count option ;
  detailed_status: string option ;
  status: string option }[@@ocaml.doc "Information about the association.\n"]
type nonrec s3_output_location =
  {
  output_s3_key_prefix: string option ;
  output_s3_bucket_name: string option ;
  output_s3_region: string option }[@@ocaml.doc
                                     "An S3 bucket where you want to store the results of this request.\n"]
type nonrec instance_association_output_location =
  {
  s3_location: s3_output_location option }[@@ocaml.doc
                                            "An S3 bucket where you want to store the results of this request.\n\n For the minimal permissions required to enable Amazon S3 output for an association, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-associations-creating.html#state-manager-associations-console}Create an association (console)} in the {i Systems Manager User Guide}. \n "]
type nonrec association_compliance_severity =
  | Unspecified 
  | Low 
  | Medium 
  | High 
  | Critical [@@ocaml.doc ""]
type nonrec association_sync_compliance =
  | Manual 
  | Auto [@@ocaml.doc ""]
type nonrec target_location =
  {
  target_location_alarm_configuration: alarm_configuration option ;
  execution_role_name: string option ;
  target_location_max_errors: string option ;
  target_location_max_concurrency: string option ;
  regions: string list option ;
  accounts: string list option }[@@ocaml.doc
                                  "The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Automation execution.\n"]
type nonrec target_map = (string * string list) list[@@ocaml.doc ""]
type nonrec external_alarm_state =
  | ALARM 
  | UNKNOWN [@@ocaml.doc ""]
type nonrec alarm_state_information =
  {
  state: external_alarm_state ;
  name: string }[@@ocaml.doc
                  "The details about the state of your CloudWatch alarm.\n"]
type nonrec association_description =
  {
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  target_maps: target_map list option ;
  duration: int option ;
  schedule_offset: int option ;
  target_locations: target_location list option ;
  calendar_names: string list option ;
  apply_only_at_cron_interval: bool option ;
  sync_compliance: association_sync_compliance option ;
  compliance_severity: association_compliance_severity option ;
  max_concurrency: string option ;
  max_errors: string option ;
  association_name: string option ;
  last_successful_execution_date: CoreTypes.Timestamp.t option ;
  last_execution_date: CoreTypes.Timestamp.t option ;
  output_location: instance_association_output_location option ;
  schedule_expression: string option ;
  targets: target list option ;
  association_id: string option ;
  parameters: parameters option ;
  automation_target_parameter_name: string option ;
  document_version: string option ;
  overview: association_overview option ;
  status: association_status option ;
  last_update_association_date: CoreTypes.Timestamp.t option ;
  date: CoreTypes.Timestamp.t option ;
  association_version: string option ;
  instance_id: string option ;
  name: string option }[@@ocaml.doc
                         "Describes the parameters for a document.\n"]
type nonrec update_association_status_result =
  {
  association_description: association_description option }[@@ocaml.doc ""]
type nonrec update_association_status_request =
  {
  association_status: association_status ;
  instance_id: string ;
  name: string }[@@ocaml.doc ""]
type nonrec status_unchanged = unit
type nonrec association_does_not_exist = {
  message: string option }[@@ocaml.doc
                            "The specified association doesn't exist.\n"]
type nonrec update_association_result =
  {
  association_description: association_description option }[@@ocaml.doc ""]
type nonrec update_association_request =
  {
  alarm_configuration: alarm_configuration option ;
  target_maps: target_map list option ;
  duration: int option ;
  schedule_offset: int option ;
  target_locations: target_location list option ;
  calendar_names: string list option ;
  apply_only_at_cron_interval: bool option ;
  sync_compliance: association_sync_compliance option ;
  compliance_severity: association_compliance_severity option ;
  max_concurrency: string option ;
  max_errors: string option ;
  automation_target_parameter_name: string option ;
  association_version: string option ;
  association_name: string option ;
  targets: target list option ;
  name: string option ;
  output_location: instance_association_output_location option ;
  schedule_expression: string option ;
  document_version: string option ;
  parameters: parameters option ;
  association_id: string }[@@ocaml.doc ""]
type nonrec invalid_update = {
  message: string option }[@@ocaml.doc "The update isn't valid.\n"]
type nonrec invalid_target_maps = {
  message: string option }[@@ocaml.doc "TargetMap parameter isn't valid.\n"]
type nonrec invalid_target = {
  message: string option }[@@ocaml.doc
                            "The target isn't valid or doesn't exist. It might not be configured for Systems Manager or you might not have permission to perform the operation.\n"]
type nonrec invalid_schedule = {
  message: string option }[@@ocaml.doc
                            "The schedule is invalid. Verify your cron or rate expression and try again.\n"]
type nonrec invalid_parameters = {
  message: string option }[@@ocaml.doc
                            "You must specify values for all required parameters in the Amazon Web Services Systems Manager document (SSM document). You can only supply values to parameters defined in the SSM document.\n"]
type nonrec invalid_output_location = unit
type nonrec invalid_association_version = {
  message: string option }[@@ocaml.doc
                            "The version you specified isn't valid. Use ListAssociationVersions to view all versions of an association according to the association ID. Or, use the [$LATEST] parameter to view the latest version of the association.\n"]
type nonrec association_version_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "You have reached the maximum number versions allowed for an association. Each association has a limit of 1,000 versions. \n"]
type nonrec unsupported_platform_type = {
  message: string option }[@@ocaml.doc
                            "The document doesn't support the platform type of the given managed node IDs. For example, you sent an document for a Windows managed node to a Linux node.\n"]
type nonrec unsupported_parameter_type = {
  message: string option }[@@ocaml.doc
                            "The parameter type isn't supported.\n"]
type nonrec unsupported_operating_system = {
  message: string option }[@@ocaml.doc
                            "The operating systems you specified isn't supported, or the operation isn't supported for the operating system.\n"]
type nonrec unsupported_inventory_schema_version_exception =
  {
  message: string option }[@@ocaml.doc
                            "Inventory item type schema version has to match supported versions in the service. Check output of GetInventorySchema to see the available schema version for each type.\n"]
type nonrec unsupported_inventory_item_context_exception =
  {
  message: string option ;
  type_name: string option }[@@ocaml.doc
                              "The [Context] attribute that you specified for the [InventoryItem] isn't allowed for this inventory type. You can only use the [Context] attribute with inventory types like [AWS:ComplianceItem].\n"]
type nonrec unsupported_feature_required_exception =
  {
  message: string option }[@@ocaml.doc
                            "Patching for applications released by Microsoft is only available on EC2 instances and advanced instances. To patch applications released by Microsoft on on-premises servers and VMs, you must enable advanced instances. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances-advanced.html}Turning on the advanced-instances tier} in the {i Amazon Web Services Systems Manager User Guide}.\n"]
type nonrec unsupported_calendar_exception = {
  message: string option }[@@ocaml.doc
                            "The calendar entry contained in the specified SSM document isn't supported.\n"]
type nonrec unlabel_parameter_version_result =
  {
  invalid_labels: string list option ;
  removed_labels: string list option }[@@ocaml.doc ""]
type nonrec unlabel_parameter_version_request =
  {
  labels: string list ;
  parameter_version: int ;
  name: string }[@@ocaml.doc ""]
type nonrec parameter_version_not_found = {
  message: string option }[@@ocaml.doc
                            "The specified parameter version wasn't found. Verify the parameter name and version, and try again.\n"]
type nonrec parameter_not_found = {
  message: string option }[@@ocaml.doc
                            "The parameter couldn't be found. Verify the name and try again.\n"]
type nonrec total_size_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The size of inventory data has exceeded the total size limit for the resource.\n"]
type nonrec too_many_tags_error = unit
type nonrec terminate_session_response = {
  session_id: string option }[@@ocaml.doc ""]
type nonrec terminate_session_request = {
  session_id: string }[@@ocaml.doc ""]
type nonrec target_not_connected = {
  message: string option }[@@ocaml.doc
                            "The specified target managed node for the session isn't fully configured for use with Session Manager. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started.html}Getting started with Session Manager} in the {i Amazon Web Services Systems Manager User Guide}. This error is also returned if you attempt to start a session on a managed node that is located in a different account or Region\n"]
type nonrec target_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "You specified the [Safe] option for the DeregisterTargetFromMaintenanceWindow operation, but the target is still referenced in a task.\n"]
type nonrec sub_type_count_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "The sub-type count exceeded the limit for the inventory type.\n"]
type nonrec stop_type =
  | CANCEL 
  | COMPLETE [@@ocaml.doc ""]
type nonrec stop_automation_execution_result = unit
type nonrec stop_automation_execution_request =
  {
  type_: stop_type option ;
  automation_execution_id: string }[@@ocaml.doc ""]
type nonrec invalid_automation_status_update_exception =
  {
  message: string option }[@@ocaml.doc
                            "The specified update status operation isn't valid.\n"]
type nonrec automation_execution_not_found_exception =
  {
  message: string option }[@@ocaml.doc
                            "There is no automation execution information for the requested automation execution ID.\n"]
type nonrec automation_execution_status =
  | EXITED 
  | COMPLETED_WITH_FAILURE 
  | COMPLETED_WITH_SUCCESS 
  | CHANGE_CALENDAR_OVERRIDE_REJECTED 
  | CHANGE_CALENDAR_OVERRIDE_APPROVED 
  | PENDING_CHANGE_CALENDAR_OVERRIDE 
  | RUNBOOK_INPROGRESS 
  | SCHEDULED 
  | REJECTED 
  | APPROVED 
  | PENDING_APPROVAL 
  | FAILED 
  | CANCELLED 
  | CANCELLING 
  | TIMEDOUT 
  | SUCCESS 
  | WAITING 
  | INPROGRESS 
  | PENDING [@@ocaml.doc ""]
type nonrec normal_string_map = (string * string) list[@@ocaml.doc ""]
type nonrec failure_details =
  {
  details: automation_parameter_map option ;
  failure_type: string option ;
  failure_stage: string option }[@@ocaml.doc
                                  "Information about an Automation failure.\n"]
type nonrec parent_step_details =
  {
  iterator_value: string option ;
  iteration: int option ;
  action: string option ;
  step_name: string option ;
  step_execution_id: string option }[@@ocaml.doc
                                      "A detailed status of the parent step.\n"]
type nonrec step_execution =
  {
  parent_step_details: parent_step_details option ;
  triggered_alarms: alarm_state_information list option ;
  target_location: target_location option ;
  targets: target list option ;
  valid_next_steps: string list option ;
  is_critical: bool option ;
  next_step: string option ;
  is_end: bool option ;
  overridden_parameters: automation_parameter_map option ;
  step_execution_id: string option ;
  failure_details: failure_details option ;
  failure_message: string option ;
  response: string option ;
  outputs: automation_parameter_map option ;
  inputs: normal_string_map option ;
  response_code: string option ;
  step_status: automation_execution_status option ;
  execution_end_time: CoreTypes.Timestamp.t option ;
  execution_start_time: CoreTypes.Timestamp.t option ;
  max_attempts: int option ;
  on_failure: string option ;
  timeout_seconds: int option ;
  action: string option ;
  step_name: string option }[@@ocaml.doc
                              "Detailed information about an the execution state of an Automation step.\n"]
type nonrec step_execution_filter_key =
  | PARENT_STEP_ITERATOR_VALUE 
  | PARENT_STEP_ITERATION 
  | PARENT_STEP_EXECUTION_ID 
  | ACTION 
  | STEP_NAME 
  | STEP_EXECUTION_ID 
  | STEP_EXECUTION_STATUS 
  | START_TIME_AFTER 
  | START_TIME_BEFORE [@@ocaml.doc ""]
type nonrec step_execution_filter =
  {
  values: string list ;
  key: step_execution_filter_key }[@@ocaml.doc
                                    "A filter to limit the amount of step execution information returned by the call.\n"]
type nonrec start_session_response =
  {
  stream_url: string option ;
  token_value: string option ;
  session_id: string option }[@@ocaml.doc ""]
type nonrec session_manager_parameters = (string * string list) list[@@ocaml.doc
                                                                    ""]
type nonrec start_session_request =
  {
  parameters: session_manager_parameters option ;
  reason: string option ;
  document_name: string option ;
  target: string }[@@ocaml.doc ""]
type nonrec start_change_request_execution_result =
  {
  automation_execution_id: string option }[@@ocaml.doc ""]
type nonrec runbook =
  {
  target_locations: target_location list option ;
  max_errors: string option ;
  max_concurrency: string option ;
  target_maps: target_map list option ;
  targets: target list option ;
  target_parameter_name: string option ;
  parameters: automation_parameter_map option ;
  document_version: string option ;
  document_name: string }[@@ocaml.doc
                           "Information about an Automation runbook used in a runbook workflow in Change Manager.\n\n  The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.\n  \n   "]
type nonrec start_change_request_execution_request =
  {
  change_details: string option ;
  scheduled_end_time: CoreTypes.Timestamp.t option ;
  tags: tag list option ;
  runbooks: runbook list ;
  auto_approve: bool option ;
  client_token: string option ;
  change_request_name: string option ;
  parameters: automation_parameter_map option ;
  document_version: string option ;
  document_name: string ;
  scheduled_time: CoreTypes.Timestamp.t option }[@@ocaml.doc ""]
type nonrec invalid_automation_execution_parameters_exception =
  {
  message: string option }[@@ocaml.doc
                            "The supplied parameters for invoking the specified Automation runbook are incorrect. For example, they may not match the set of parameters permitted for the specified Automation document.\n"]
type nonrec idempotent_parameter_mismatch = {
  message: string option }[@@ocaml.doc
                            "Error returned when an idempotent operation is retried and the parameters don't match the original call to the API with the same idempotency token. \n"]
type nonrec automation_execution_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "The number of simultaneously running Automation executions exceeded the allowable limit.\n"]
type nonrec automation_definition_version_not_found_exception =
  {
  message: string option }[@@ocaml.doc
                            "An Automation runbook with the specified name and version couldn't be found.\n"]
type nonrec automation_definition_not_found_exception =
  {
  message: string option }[@@ocaml.doc
                            "An Automation runbook with the specified name couldn't be found.\n"]
type nonrec automation_definition_not_approved_exception =
  {
  message: string option }[@@ocaml.doc
                            "Indicates that the Change Manager change template used in the change request was rejected or is still in a pending state.\n"]
type nonrec start_automation_execution_result =
  {
  automation_execution_id: string option }[@@ocaml.doc ""]
type nonrec execution_mode =
  | Interactive 
  | Auto [@@ocaml.doc ""]
type nonrec start_automation_execution_request =
  {
  alarm_configuration: alarm_configuration option ;
  tags: tag list option ;
  target_locations: target_location list option ;
  max_errors: string option ;
  max_concurrency: string option ;
  target_maps: target_map list option ;
  targets: target list option ;
  target_parameter_name: string option ;
  mode: execution_mode option ;
  client_token: string option ;
  parameters: automation_parameter_map option ;
  document_version: string option ;
  document_name: string }[@@ocaml.doc ""]
type nonrec start_associations_once_result = unit
type nonrec start_associations_once_request = {
  association_ids: string list }[@@ocaml.doc ""]
type nonrec invalid_association = {
  message: string option }[@@ocaml.doc
                            "The association isn't valid or doesn't exist. \n"]
type nonrec source_type =
  | AWS_SSM_MANAGEDINSTANCE 
  | AWS_IOT_THING 
  | AWS_EC2_INSTANCE [@@ocaml.doc ""]
type nonrec signal_type =
  | RESUME 
  | STOP_STEP 
  | START_STEP 
  | REJECT 
  | APPROVE [@@ocaml.doc ""]
type nonrec severity_summary =
  {
  unspecified_count: int option ;
  informational_count: int option ;
  low_count: int option ;
  medium_count: int option ;
  high_count: int option ;
  critical_count: int option }[@@ocaml.doc
                                "The number of managed nodes found for each patch severity level defined in the request filter.\n"]
type nonrec session_status =
  | FAILED 
  | TERMINATING 
  | TERMINATED 
  | DISCONNECTED 
  | CONNECTING 
  | CONNECTED [@@ocaml.doc ""]
type nonrec session_state =
  | HISTORY 
  | ACTIVE [@@ocaml.doc ""]
type nonrec session_manager_output_url =
  {
  cloud_watch_output_url: string option ;
  s3_output_url: string option }[@@ocaml.doc "Reserved for future use.\n"]
type nonrec session =
  {
  max_session_duration: string option ;
  output_url: session_manager_output_url option ;
  details: string option ;
  reason: string option ;
  owner: string option ;
  document_name: string option ;
  end_date: CoreTypes.Timestamp.t option ;
  start_date: CoreTypes.Timestamp.t option ;
  status: session_status option ;
  target: string option ;
  session_id: string option }[@@ocaml.doc
                               "Information about a Session Manager connection to a managed node.\n"]
type nonrec session_filter_key =
  | SESSION_ID 
  | STATUS 
  | OWNER 
  | TARGET_ID 
  | INVOKED_BEFORE 
  | INVOKED_AFTER [@@ocaml.doc ""]
type nonrec session_filter = {
  value: string ;
  key: session_filter_key }[@@ocaml.doc
                             "Describes a filter for Session Manager information.\n"]
type nonrec service_setting =
  {
  status: string option ;
  ar_n: string option ;
  last_modified_user: string option ;
  last_modified_date: CoreTypes.Timestamp.t option ;
  setting_value: string option ;
  setting_id: string option }[@@ocaml.doc
                               "The service setting data structure.\n\n  [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of \"false\". This means the user can't use this feature unless they change the setting to \"true\" and intentionally opt in for a paid feature.\n \n  Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or, use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.\n  "]
type nonrec command_status =
  | CANCELLING 
  | TIMED_OUT 
  | FAILED 
  | CANCELLED 
  | SUCCESS 
  | IN_PROGRESS 
  | PENDING [@@ocaml.doc ""]
type nonrec command =
  {
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  timeout_seconds: int option ;
  cloud_watch_output_config: cloud_watch_output_config option ;
  notification_config: notification_config option ;
  service_role: string option ;
  delivery_timed_out_count: int option ;
  error_count: int option ;
  completed_count: int option ;
  target_count: int option ;
  max_errors: string option ;
  max_concurrency: string option ;
  output_s3_key_prefix: string option ;
  output_s3_bucket_name: string option ;
  output_s3_region: string option ;
  status_details: string option ;
  status: command_status option ;
  requested_date_time: CoreTypes.Timestamp.t option ;
  targets: target list option ;
  instance_ids: string list option ;
  parameters: parameters option ;
  expires_after: CoreTypes.Timestamp.t option ;
  comment: string option ;
  document_version: string option ;
  document_name: string option ;
  command_id: string option }[@@ocaml.doc "Describes a command request.\n"]
type nonrec send_command_result = {
  command: command option }[@@ocaml.doc ""]
type nonrec send_command_request =
  {
  alarm_configuration: alarm_configuration option ;
  cloud_watch_output_config: cloud_watch_output_config option ;
  notification_config: notification_config option ;
  service_role_arn: string option ;
  max_errors: string option ;
  max_concurrency: string option ;
  output_s3_key_prefix: string option ;
  output_s3_bucket_name: string option ;
  output_s3_region: string option ;
  parameters: parameters option ;
  comment: string option ;
  timeout_seconds: int option ;
  document_hash_type: document_hash_type option ;
  document_hash: string option ;
  document_version: string option ;
  document_name: string ;
  targets: target list option ;
  instance_ids: string list option }[@@ocaml.doc ""]
type nonrec invalid_role = {
  message: string option }[@@ocaml.doc
                            "The role name can't contain invalid characters. Also verify that you specified an IAM role for notifications that includes the required trust policy. For information about configuring the IAM role for Run Command notifications, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.\n"]
type nonrec invalid_output_folder = unit
type nonrec invalid_notification_config = {
  message: string option }[@@ocaml.doc
                            "One or more configuration items isn't valid. Verify that a valid Amazon Resource Name (ARN) was provided for an Amazon Simple Notification Service topic.\n"]
type nonrec duplicate_instance_id = unit
type nonrec send_automation_signal_result = unit
type nonrec send_automation_signal_request =
  {
  payload: automation_parameter_map option ;
  signal_type: signal_type ;
  automation_execution_id: string }[@@ocaml.doc ""]
type nonrec invalid_automation_signal_exception = {
  message: string option }[@@ocaml.doc
                            "The signal isn't valid for the current Automation execution.\n"]
type nonrec automation_step_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified step name and execution ID don't exist. Verify the information and try again.\n"]
type nonrec scheduled_window_execution =
  {
  execution_time: string option ;
  name: string option ;
  window_id: string option }[@@ocaml.doc
                              "Information about a scheduled execution for a maintenance window.\n"]
type nonrec s3_output_url = {
  output_url: string option }[@@ocaml.doc
                               "A URL for the Amazon Web Services Systems Manager (Systems Manager) bucket where you want to store the results of this request.\n"]
type nonrec resume_session_response =
  {
  stream_url: string option ;
  token_value: string option ;
  session_id: string option }[@@ocaml.doc ""]
type nonrec resume_session_request = {
  session_id: string }[@@ocaml.doc ""]
type nonrec result_attribute = {
  type_name: string }[@@ocaml.doc "The inventory item result attribute.\n"]
type nonrec resource_type_for_tagging =
  | ASSOCIATION 
  | AUTOMATION 
  | OPSMETADATA 
  | OPS_ITEM 
  | PATCH_BASELINE 
  | PARAMETER 
  | MAINTENANCE_WINDOW 
  | MANAGED_INSTANCE 
  | DOCUMENT [@@ocaml.doc ""]
type nonrec resource_type =
  | EC2_INSTANCE 
  | MANAGED_INSTANCE [@@ocaml.doc ""]
type nonrec resource_policy_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "No policies with the specified policy ID and hash could be found.\n"]
type nonrec resource_policy_limit_exceeded_exception =
  {
  message: string option ;
  limit_type: string option ;
  limit: int option }[@@ocaml.doc
                       "The [PutResourcePolicy] API action enforces two limits. A policy can't be greater than 1024 bytes in size. And only one policy can be attached to [OpsItemGroup]. Verify these limits and try again.\n"]
type nonrec resource_policy_invalid_parameter_exception =
  {
  message: string option ;
  parameter_names: string list option }[@@ocaml.doc
                                         "One or more parameters specified for the call aren't valid. Verify the parameters and their values and try again.\n"]
type nonrec resource_policy_conflict_exception = {
  message: string option }[@@ocaml.doc
                            "The hash provided in the call doesn't match the stored hash. This exception is thrown when trying to update an obsolete policy version or when multiple requests to update a policy are sent.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified parameter to be shared could not be found.\n"]
type nonrec resource_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "Error returned when the caller has exceeded the default resource quotas. For example, too many maintenance windows or patch baselines have been created.\n\n For information about resource quotas in Systems Manager, see {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#limits_ssm}Systems Manager service quotas} in the {i Amazon Web Services General Reference}.\n "]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "Error returned if an attempt is made to delete a patch baseline that is registered for a patch group.\n"]
type nonrec resource_data_sync_source_with_state =
  {
  enable_all_ops_data_sources: bool option ;
  state: string option ;
  include_future_regions: bool option ;
  source_regions: string list option ;
  aws_organizations_source:
    resource_data_sync_aws_organizations_source option ;
  source_type: string option }[@@ocaml.doc
                                "The data type name for including resource data sync state. There are four sync states:\n\n  [OrganizationNotExists] (Your organization doesn't exist)\n \n   [NoPermissions] (The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Amazon Web Services Systems Manager Explorer.)\n  \n    [InvalidOrganizationalUnit] (You specified or selected an invalid unit in the resource data sync configuration.)\n   \n     [TrustedAccessDisabled] (You disabled Systems Manager access in the organization in Organizations.)\n    "]
type nonrec resource_data_sync_s3_format =
  | JSON_SERDE [@@ocaml.doc ""]
type nonrec resource_data_sync_destination_data_sharing =
  {
  destination_data_sharing_type: string option }[@@ocaml.doc
                                                  "Synchronize Amazon Web Services Systems Manager Inventory data from multiple Amazon Web Services accounts defined in Organizations to a centralized Amazon S3 bucket. Data is synchronized to individual key prefixes in the central bucket. Each key prefix represents a different Amazon Web Services account ID.\n"]
type nonrec resource_data_sync_s3_destination =
  {
  destination_data_sharing:
    resource_data_sync_destination_data_sharing option ;
  awskms_key_ar_n: string option ;
  region: string ;
  sync_format: resource_data_sync_s3_format ;
  prefix: string option ;
  bucket_name: string }[@@ocaml.doc
                         "Information about the target S3 bucket for the resource data sync.\n"]
type nonrec last_resource_data_sync_status =
  | INPROGRESS 
  | FAILED 
  | SUCCESSFUL [@@ocaml.doc ""]
type nonrec resource_data_sync_item =
  {
  last_sync_status_message: string option ;
  sync_created_time: CoreTypes.Timestamp.t option ;
  last_status: last_resource_data_sync_status option ;
  sync_last_modified_time: CoreTypes.Timestamp.t option ;
  last_successful_sync_time: CoreTypes.Timestamp.t option ;
  last_sync_time: CoreTypes.Timestamp.t option ;
  s3_destination: resource_data_sync_s3_destination option ;
  sync_source: resource_data_sync_source_with_state option ;
  sync_type: string option ;
  sync_name: string option }[@@ocaml.doc
                              "Information about a resource data sync configuration, including its current status and last successful sync.\n"]
type nonrec resource_data_sync_count_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have exceeded the allowed maximum sync configurations.\n"]
type nonrec resource_data_sync_already_exists_exception =
  {
  sync_name: string option }[@@ocaml.doc
                              "A sync configuration with the same name already exists.\n"]
type nonrec compliance_status =
  | NonCompliant 
  | Compliant [@@ocaml.doc ""]
type nonrec compliance_severity =
  | Unspecified 
  | Informational 
  | Low 
  | Medium 
  | High 
  | Critical [@@ocaml.doc ""]
type nonrec compliance_execution_summary =
  {
  execution_type: string option ;
  execution_id: string option ;
  execution_time: CoreTypes.Timestamp.t }[@@ocaml.doc
                                           "A summary of the call execution that includes an execution ID, the type of execution (for example, [Command]), and the date/time of the execution using a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z'] \n"]
type nonrec compliant_summary =
  {
  severity_summary: severity_summary option ;
  compliant_count: int option }[@@ocaml.doc
                                 "A summary of resources that are compliant. The summary is organized according to the resource count for each compliance type.\n"]
type nonrec non_compliant_summary =
  {
  severity_summary: severity_summary option ;
  non_compliant_count: int option }[@@ocaml.doc
                                     "A summary of resources that aren't compliant. The summary is organized according to resource type.\n"]
type nonrec resource_compliance_summary_item =
  {
  non_compliant_summary: non_compliant_summary option ;
  compliant_summary: compliant_summary option ;
  execution_summary: compliance_execution_summary option ;
  overall_severity: compliance_severity option ;
  status: compliance_status option ;
  resource_id: string option ;
  resource_type: string option ;
  compliance_type: string option }[@@ocaml.doc
                                    "Compliance summary information for a specific resource. \n"]
type nonrec resolved_targets =
  {
  truncated: bool option ;
  parameter_values: string list option }[@@ocaml.doc
                                          "Information about targets that resolved during the Automation execution.\n"]
type nonrec reset_service_setting_result =
  {
  service_setting: service_setting option }[@@ocaml.doc
                                             "The result body of the ResetServiceSetting API operation.\n"]
type nonrec reset_service_setting_request = {
  setting_id: string }[@@ocaml.doc
                        "The request body of the ResetServiceSetting API operation.\n"]
type nonrec remove_tags_from_resource_result = unit
type nonrec remove_tags_from_resource_request =
  {
  tag_keys: string list ;
  resource_id: string ;
  resource_type: resource_type_for_tagging }[@@ocaml.doc ""]
type nonrec invalid_resource_type = unit
type nonrec invalid_resource_id = unit
type nonrec registration_metadata_item = {
  value: string ;
  key: string }[@@ocaml.doc "Reserved for internal use.\n"]
type nonrec register_task_with_maintenance_window_result =
  {
  window_task_id: string option }[@@ocaml.doc ""]
type nonrec maintenance_window_task_type =
  | Lambda 
  | StepFunctions 
  | Automation 
  | RunCommand [@@ocaml.doc ""]
type nonrec register_task_with_maintenance_window_request =
  {
  alarm_configuration: alarm_configuration option ;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option ;
  client_token: string option ;
  description: string option ;
  name: string option ;
  logging_info: logging_info option ;
  max_errors: string option ;
  max_concurrency: string option ;
  priority: int option ;
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option ;
  task_parameters: maintenance_window_task_parameters option ;
  task_type: maintenance_window_task_type ;
  service_role_arn: string option ;
  task_arn: string ;
  targets: target list option ;
  window_id: string }[@@ocaml.doc ""]
type nonrec feature_not_available_exception = {
  message: string option }[@@ocaml.doc
                            "You attempted to register a [LAMBDA] or [STEP_FUNCTIONS] task in a region where the corresponding service isn't available. \n"]
type nonrec register_target_with_maintenance_window_result =
  {
  window_target_id: string option }[@@ocaml.doc ""]
type nonrec maintenance_window_resource_type =
  | ResourceGroup 
  | Instance [@@ocaml.doc ""]
type nonrec register_target_with_maintenance_window_request =
  {
  client_token: string option ;
  description: string option ;
  name: string option ;
  owner_information: string option ;
  targets: target list ;
  resource_type: maintenance_window_resource_type ;
  window_id: string }[@@ocaml.doc ""]
type nonrec register_patch_baseline_for_patch_group_result =
  {
  patch_group: string option ;
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec register_patch_baseline_for_patch_group_request =
  {
  patch_group: string ;
  baseline_id: string }[@@ocaml.doc ""]
type nonrec already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "Error returned if an attempt is made to register a patch group with a patch baseline that is already registered with a different patch baseline.\n"]
type nonrec register_default_patch_baseline_result =
  {
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec register_default_patch_baseline_request = {
  baseline_id: string }[@@ocaml.doc ""]
type nonrec reboot_option =
  | NO_REBOOT 
  | REBOOT_IF_NEEDED [@@ocaml.doc ""]
type nonrec put_resource_policy_response =
  {
  policy_hash: string option ;
  policy_id: string option }[@@ocaml.doc ""]
type nonrec put_resource_policy_request =
  {
  policy_hash: string option ;
  policy_id: string option ;
  policy: string ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec malformed_resource_policy_document_exception =
  {
  message: string option }[@@ocaml.doc
                            "The specified policy document is malformed or invalid, or excessive [PutResourcePolicy] or [DeleteResourcePolicy] calls have been made.\n"]
type nonrec parameter_tier =
  | INTELLIGENT_TIERING 
  | ADVANCED 
  | STANDARD [@@ocaml.doc ""]
type nonrec put_parameter_result =
  {
  tier: parameter_tier option ;
  version: int option }[@@ocaml.doc ""]
type nonrec parameter_type =
  | SECURE_STRING 
  | STRING_LIST 
  | STRING [@@ocaml.doc ""]
type nonrec put_parameter_request =
  {
  data_type: string option ;
  policies: string option ;
  tier: parameter_tier option ;
  tags: tag list option ;
  allowed_pattern: string option ;
  overwrite: bool option ;
  key_id: string option ;
  type_: parameter_type option ;
  value: string ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec policies_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "You specified more than the maximum number of allowed policies for the parameter. The maximum is 10.\n"]
type nonrec parameter_pattern_mismatch_exception = {
  message: string option }[@@ocaml.doc "The parameter name isn't valid.\n"]
type nonrec parameter_max_version_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "Parameter Store retains the 100 most recently created versions of a parameter. After this number of versions has been created, Parameter Store deletes the oldest version when a new one is created. However, if the oldest version has a {i label} attached to it, Parameter Store won't delete the version and instead presents this error message:\n\n  \n {[\n An error occurred (ParameterMaxVersionLimitExceeded) when calling the PutParameter operation: You attempted to create a new version of {i parameter-name} by calling the PutParameter API with the overwrite flag. Version {i version-number}, the oldest version, can't be deleted because it has a label associated with it. Move the label to another version of the parameter, and try again.\n ]}\n  \n \n  This safeguard is to prevent parameter versions with mission critical labels assigned to them from being deleted. To continue creating new parameters, first move the label from the oldest version of the parameter to a newer one for use in your operations. For information about moving parameter labels, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html#sysman-paramstore-labels-console-move}Move a parameter label (console)} or {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html#sysman-paramstore-labels-cli-move}Move a parameter label (CLI)} in the {i Amazon Web Services Systems Manager User Guide}. \n  "]
type nonrec parameter_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "You have exceeded the number of parameters for this Amazon Web Services account. Delete one or more parameters and try again.\n"]
type nonrec parameter_already_exists = {
  message: string option }[@@ocaml.doc
                            "The parameter already exists. You can't create duplicate parameters.\n"]
type nonrec invalid_policy_type_exception = {
  message: string option }[@@ocaml.doc
                            "The policy type isn't supported. Parameter Store supports the following policy types: Expiration, ExpirationNotification, and NoChangeNotification.\n"]
type nonrec invalid_policy_attribute_exception = {
  message: string option }[@@ocaml.doc
                            "A policy attribute or its value is invalid. \n"]
type nonrec invalid_key_id = {
  message: string option }[@@ocaml.doc "The query key ID isn't valid.\n"]
type nonrec invalid_allowed_pattern_exception = {
  message: string option }[@@ocaml.doc
                            "The request doesn't meet the regular expression requirement.\n"]
type nonrec incompatible_policy_exception = {
  message: string option }[@@ocaml.doc
                            "There is a conflict in the policies specified for this parameter. You can't, for example, specify two Expiration policies for a parameter. Review your policies, and try again.\n"]
type nonrec hierarchy_type_mismatch_exception = {
  message: string option }[@@ocaml.doc
                            "Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't change a parameter from a [String] type to a [SecureString] type. You must create a new, unique parameter.\n"]
type nonrec hierarchy_level_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "A hierarchy can have a maximum of 15 levels. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html}Requirements and constraints for parameter names} in the {i Amazon Web Services Systems Manager User Guide}. \n"]
type nonrec put_inventory_result = {
  message: string option }[@@ocaml.doc ""]
type nonrec inventory_item_entry = (string * string) list[@@ocaml.doc ""]
type nonrec inventory_item_content_context = (string * string) list[@@ocaml.doc
                                                                    ""]
type nonrec inventory_item =
  {
  context: inventory_item_content_context option ;
  content: inventory_item_entry list option ;
  content_hash: string option ;
  capture_time: string ;
  schema_version: string ;
  type_name: string }[@@ocaml.doc
                       "Information collected from managed nodes based on your inventory policy document\n"]
type nonrec put_inventory_request =
  {
  items: inventory_item list ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec item_size_limit_exceeded_exception =
  {
  message: string option ;
  type_name: string option }[@@ocaml.doc
                              "The inventory item size has exceeded the size limit.\n"]
type nonrec item_content_mismatch_exception =
  {
  message: string option ;
  type_name: string option }[@@ocaml.doc
                              "The inventory item has invalid content. \n"]
type nonrec invalid_type_name_exception = {
  message: string option }[@@ocaml.doc
                            "The parameter type name isn't valid.\n"]
type nonrec invalid_item_content_exception =
  {
  message: string option ;
  type_name: string option }[@@ocaml.doc
                              "One or more content items isn't valid.\n"]
type nonrec invalid_inventory_item_context_exception =
  {
  message: string option }[@@ocaml.doc
                            "You specified invalid keys or values in the [Context] attribute for [InventoryItem]. Verify the keys and values, and try again.\n"]
type nonrec custom_schema_count_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have exceeded the limit for custom schemas. Delete one or more custom schemas and try again.\n"]
type nonrec put_compliance_items_result = unit
type nonrec compliance_item_details = (string * string) list[@@ocaml.doc ""]
type nonrec compliance_item_entry =
  {
  details: compliance_item_details option ;
  status: compliance_status ;
  severity: compliance_severity ;
  title: string option ;
  id: string option }[@@ocaml.doc "Information about a compliance item.\n"]
type nonrec compliance_upload_type =
  | Partial 
  | Complete [@@ocaml.doc ""]
type nonrec put_compliance_items_request =
  {
  upload_type: compliance_upload_type option ;
  item_content_hash: string option ;
  items: compliance_item_entry list ;
  execution_summary: compliance_execution_summary ;
  compliance_type: string ;
  resource_type: string ;
  resource_id: string }[@@ocaml.doc ""]
type nonrec compliance_type_count_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You specified too many custom compliance types. You can specify a maximum of 10 different types. \n"]
type nonrec progress_counters =
  {
  timed_out_steps: int option ;
  cancelled_steps: int option ;
  failed_steps: int option ;
  success_steps: int option ;
  total_steps: int option }[@@ocaml.doc
                             "An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console for a multi-Region and multi-account Automation execution.\n"]
type nonrec ping_status =
  | INACTIVE 
  | CONNECTION_LOST 
  | ONLINE [@@ocaml.doc ""]
type nonrec patch_deployment_status =
  | ExplicitRejected 
  | ExplicitApproved 
  | PendingApproval 
  | Approved [@@ocaml.doc ""]
type nonrec patch_status =
  {
  approval_date: CoreTypes.Timestamp.t option ;
  compliance_level: patch_compliance_level option ;
  deployment_status: patch_deployment_status option }[@@ocaml.doc
                                                       "Information about the approval status of a patch.\n"]
type nonrec patch_set =
  | Application 
  | Os [@@ocaml.doc ""]
type nonrec patch_property_entry = (string * string) list[@@ocaml.doc ""]
type nonrec patch_property =
  | PatchSeverity 
  | PatchPriority 
  | PatchMsrcSeverity 
  | PatchClassification 
  | PatchProductFamily 
  | Product [@@ocaml.doc ""]
type nonrec patch_orchestrator_filter =
  {
  values: string list option ;
  key: string option }[@@ocaml.doc
                        "Defines a filter used in Patch Manager APIs. Supported filter keys depend on the API operation that includes the filter. Patch Manager API operations that use [PatchOrchestratorFilter] include the following:\n\n {ul\n       {-   [DescribeAvailablePatches] \n           \n            }\n       {-   [DescribeInstancePatches] \n           \n            }\n       {-   [DescribePatchBaselines] \n           \n            }\n       {-   [DescribePatchGroups] \n           \n            }\n       }\n  "]
type nonrec patch_operation_type =
  | INSTALL 
  | SCAN [@@ocaml.doc ""]
type nonrec patch =
  {
  repository: string option ;
  severity: string option ;
  arch: string option ;
  release: string option ;
  version: string option ;
  epoch: int option ;
  name: string option ;
  cve_ids: string list option ;
  bugzilla_ids: string list option ;
  advisory_ids: string list option ;
  language: string option ;
  msrc_number: string option ;
  kb_number: string option ;
  msrc_severity: string option ;
  classification: string option ;
  product: string option ;
  product_family: string option ;
  vendor: string option ;
  content_url: string option ;
  description: string option ;
  title: string option ;
  release_date: CoreTypes.Timestamp.t option ;
  id: string option }[@@ocaml.doc "Represents metadata about a patch.\n"]
type nonrec patch_baseline_identity =
  {
  default_baseline: bool option ;
  baseline_description: string option ;
  operating_system: operating_system option ;
  baseline_name: string option ;
  baseline_id: string option }[@@ocaml.doc
                                "Defines the basic information about a patch baseline.\n"]
type nonrec patch_group_patch_baseline_mapping =
  {
  baseline_identity: patch_baseline_identity option ;
  patch_group: string option }[@@ocaml.doc
                                "The mapping between a patch group and the patch baseline the patch group is registered with.\n"]
type nonrec patch_compliance_data_state =
  | Failed 
  | NotApplicable 
  | Missing 
  | InstalledRejected 
  | InstalledPendingReboot 
  | InstalledOther 
  | Installed [@@ocaml.doc ""]
type nonrec patch_compliance_data =
  {
  cve_ids: string option ;
  installed_time: CoreTypes.Timestamp.t ;
  state: patch_compliance_data_state ;
  severity: string ;
  classification: string ;
  kb_id: string ;
  title: string }[@@ocaml.doc
                   "Information about the state of a patch on a particular managed node as it relates to the patch baseline used to patch the node.\n"]
type nonrec parameters_filter_key =
  | KEY_ID 
  | TYPE 
  | NAME [@@ocaml.doc ""]
type nonrec parameters_filter =
  {
  values: string list ;
  key: parameters_filter_key }[@@ocaml.doc
                                "This data type is deprecated. Instead, use [ParameterStringFilter].\n"]
type nonrec parameter_version_label_limit_exceeded =
  {
  message: string option }[@@ocaml.doc
                            "A parameter version can have a maximum of ten labels.\n"]
type nonrec parameter_string_filter =
  {
  values: string list option ;
  option_: string option ;
  key: string }[@@ocaml.doc
                 "One or more filters. Use a filter to return a more specific list of results.\n"]
type nonrec parameter_inline_policy =
  {
  policy_status: string option ;
  policy_type: string option ;
  policy_text: string option }[@@ocaml.doc
                                "One or more policies assigned to a parameter.\n"]
type nonrec parameter_metadata =
  {
  data_type: string option ;
  policies: parameter_inline_policy list option ;
  tier: parameter_tier option ;
  version: int option ;
  allowed_pattern: string option ;
  description: string option ;
  last_modified_user: string option ;
  last_modified_date: CoreTypes.Timestamp.t option ;
  key_id: string option ;
  type_: parameter_type option ;
  ar_n: string option ;
  name: string option }[@@ocaml.doc
                         "Metadata includes information like the Amazon Resource Name (ARN) of the last user to update the parameter and the date and time the parameter was last used.\n"]
type nonrec parameter =
  {
  data_type: string option ;
  ar_n: string option ;
  last_modified_date: CoreTypes.Timestamp.t option ;
  source_result: string option ;
  selector: string option ;
  version: int option ;
  value: string option ;
  type_: parameter_type option ;
  name: string option }[@@ocaml.doc
                         "An Amazon Web Services Systems Manager parameter in Parameter Store.\n"]
type nonrec parameter_history =
  {
  data_type: string option ;
  policies: parameter_inline_policy list option ;
  tier: parameter_tier option ;
  labels: string list option ;
  version: int option ;
  allowed_pattern: string option ;
  value: string option ;
  description: string option ;
  last_modified_user: string option ;
  last_modified_date: CoreTypes.Timestamp.t option ;
  key_id: string option ;
  type_: parameter_type option ;
  name: string option }[@@ocaml.doc "Information about parameter usage.\n"]
type nonrec output_source =
  {
  output_source_type: string option ;
  output_source_id: string option }[@@ocaml.doc
                                     "Information about the source where the association execution details are stored.\n"]
type nonrec ops_result_attribute = {
  type_name: string }[@@ocaml.doc "The OpsItem data type to return.\n"]
type nonrec ops_metadata =
  {
  creation_date: CoreTypes.Timestamp.t option ;
  last_modified_user: string option ;
  last_modified_date: CoreTypes.Timestamp.t option ;
  ops_metadata_arn: string option ;
  resource_id: string option }[@@ocaml.doc
                                "Operational metadata for an application in Application Manager.\n"]
type nonrec ops_metadata_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "Your account reached the maximum number of OpsMetadata objects allowed by Application Manager. The maximum is 200 OpsMetadata objects. Delete one or more OpsMetadata object and try again.\n"]
type nonrec ops_metadata_filter = {
  values: string list ;
  key: string }[@@ocaml.doc
                 "A filter to limit the number of OpsMetadata objects displayed.\n"]
type nonrec ops_metadata_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "An OpsMetadata object already exists for the selected resource.\n"]
type nonrec ops_item_summary =
  {
  planned_end_time: CoreTypes.Timestamp.t option ;
  planned_start_time: CoreTypes.Timestamp.t option ;
  actual_end_time: CoreTypes.Timestamp.t option ;
  actual_start_time: CoreTypes.Timestamp.t option ;
  ops_item_type: string option ;
  severity: string option ;
  category: string option ;
  operational_data: ops_item_operational_data option ;
  title: string option ;
  ops_item_id: string option ;
  status: ops_item_status option ;
  source: string option ;
  priority: int option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  last_modified_by: string option ;
  created_time: CoreTypes.Timestamp.t option ;
  created_by: string option }[@@ocaml.doc "A count of OpsItems.\n"]
type nonrec ops_item_related_items_filter_key =
  | RESOURCE_URI 
  | ASSOCIATION_ID 
  | RESOURCE_TYPE [@@ocaml.doc ""]
type nonrec ops_item_related_items_filter_operator =
  | EQUAL [@@ocaml.doc ""]
type nonrec ops_item_related_items_filter =
  {
  operator: ops_item_related_items_filter_operator ;
  values: string list ;
  key: ops_item_related_items_filter_key }[@@ocaml.doc
                                            "Describes a filter for a specific list of related-item resources. \n"]
type nonrec ops_item_identity = {
  arn: string option }[@@ocaml.doc
                        "Information about the user or resource that created an OpsItem event.\n"]
type nonrec ops_item_related_item_summary =
  {
  last_modified_time: CoreTypes.Timestamp.t option ;
  last_modified_by: ops_item_identity option ;
  created_time: CoreTypes.Timestamp.t option ;
  created_by: ops_item_identity option ;
  resource_uri: string option ;
  association_type: string option ;
  resource_type: string option ;
  association_id: string option ;
  ops_item_id: string option }[@@ocaml.doc
                                "Summary information about related-item resources for an OpsItem.\n"]
type nonrec ops_item_related_item_association_not_found_exception =
  {
  message: string option }[@@ocaml.doc
                            "The association wasn't found using the parameters you specified in the call. Verify the information and try again.\n"]
type nonrec ops_item_related_item_already_exists_exception =
  {
  ops_item_id: string option ;
  resource_uri: string option ;
  message: string option }[@@ocaml.doc
                            "The Amazon Resource Name (ARN) is already associated with the OpsItem.\n"]
type nonrec ops_item_filter_key =
  | ACCOUNT_ID 
  | INSIGHT_TYPE 
  | CHANGE_REQUEST_TARGETS_RESOURCE_GROUP 
  | CHANGE_REQUEST_TEMPLATE 
  | CHANGE_REQUEST_APPROVER_NAME 
  | CHANGE_REQUEST_APPROVER_ARN 
  | CHANGE_REQUEST_REQUESTER_NAME 
  | CHANGE_REQUEST_REQUESTER_ARN 
  | OPSITEM_TYPE 
  | SEVERITY 
  | CATEGORY 
  | AUTOMATION_ID 
  | RESOURCE_ID 
  | OPERATIONAL_DATA_VALUE 
  | OPERATIONAL_DATA_KEY 
  | OPERATIONAL_DATA 
  | PLANNED_END_TIME 
  | PLANNED_START_TIME 
  | ACTUAL_END_TIME 
  | ACTUAL_START_TIME 
  | LAST_MODIFIED_TIME 
  | CREATED_TIME 
  | OPSITEM_ID 
  | TITLE 
  | PRIORITY 
  | SOURCE 
  | CREATED_BY 
  | STATUS [@@ocaml.doc ""]
type nonrec ops_item_filter_operator =
  | LESS_THAN 
  | GREATER_THAN 
  | CONTAINS 
  | EQUAL [@@ocaml.doc ""]
type nonrec ops_item_filter =
  {
  operator: ops_item_filter_operator ;
  values: string list ;
  key: ops_item_filter_key }[@@ocaml.doc "Describes an OpsItem filter.\n"]
type nonrec ops_item_event_summary =
  {
  created_time: CoreTypes.Timestamp.t option ;
  created_by: ops_item_identity option ;
  detail: string option ;
  detail_type: string option ;
  source: string option ;
  event_id: string option ;
  ops_item_id: string option }[@@ocaml.doc
                                "Summary information about an OpsItem event or that associated an OpsItem with a related item.\n"]
type nonrec ops_item_event_filter_key =
  | OPSITEM_ID [@@ocaml.doc ""]
type nonrec ops_item_event_filter_operator =
  | EQUAL [@@ocaml.doc ""]
type nonrec ops_item_event_filter =
  {
  operator: ops_item_event_filter_operator ;
  values: string list ;
  key: ops_item_event_filter_key }[@@ocaml.doc
                                    "Describes a filter for a specific list of OpsItem events. You can filter event information by using tags. You specify tags by using a key-value pair mapping. \n"]
type nonrec ops_item =
  {
  ops_item_arn: string option ;
  planned_end_time: CoreTypes.Timestamp.t option ;
  planned_start_time: CoreTypes.Timestamp.t option ;
  actual_end_time: CoreTypes.Timestamp.t option ;
  actual_start_time: CoreTypes.Timestamp.t option ;
  severity: string option ;
  category: string option ;
  operational_data: ops_item_operational_data option ;
  source: string option ;
  title: string option ;
  version: string option ;
  ops_item_id: string option ;
  status: ops_item_status option ;
  related_ops_items: related_ops_item list option ;
  priority: int option ;
  notifications: ops_item_notification list option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  last_modified_by: string option ;
  description: string option ;
  created_time: CoreTypes.Timestamp.t option ;
  ops_item_type: string option ;
  created_by: string option }[@@ocaml.doc
                               "Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational work items (OpsItems) impacting the performance and health of their Amazon Web Services resources. OpsCenter is integrated with Amazon EventBridge and Amazon CloudWatch. This means you can configure these services to automatically create an OpsItem in OpsCenter when a CloudWatch alarm enters the ALARM state or when EventBridge processes an event from any Amazon Web Services service that publishes events. Configuring Amazon CloudWatch alarms and EventBridge events to automatically create OpsItems allows you to quickly diagnose and remediate issues with Amazon Web Services resources from a single console.\n\n To help you diagnose issues, each OpsItem includes contextually relevant information such as the name and ID of the Amazon Web Services resource that generated the OpsItem, alarm or event details, alarm history, and an alarm timeline graph. For the Amazon Web Services resource, OpsCenter aggregates information from Config, CloudTrail logs, and EventBridge, so you don't have to navigate across multiple console pages during your investigation. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n "]
type nonrec ops_filter_operator_type =
  | EXISTS 
  | GREATER_THAN 
  | LESS_THAN 
  | BEGIN_WITH 
  | NOT_EQUAL 
  | EQUAL [@@ocaml.doc ""]
type nonrec ops_filter =
  {
  type_: ops_filter_operator_type option ;
  values: string list ;
  key: string }[@@ocaml.doc "A filter for viewing OpsData summaries.\n"]
type nonrec ops_entity_item_entry = (string * string) list[@@ocaml.doc ""]
type nonrec ops_entity_item =
  {
  content: ops_entity_item_entry list option ;
  capture_time: string option }[@@ocaml.doc "The OpsData summary.\n"]
type nonrec ops_entity_item_map = (string * ops_entity_item) list[@@ocaml.doc
                                                                   ""]
type nonrec ops_entity =
  {
  data: ops_entity_item_map option ;
  id: string option }[@@ocaml.doc "The result of the query.\n"]
type nonrec ops_aggregator_value_map = (string * string) list[@@ocaml.doc ""]
type ops_aggregator =
  {
  aggregators: ops_aggregator list option ;
  filters: ops_filter list option ;
  values: ops_aggregator_value_map option ;
  attribute_name: string option ;
  type_name: string option ;
  aggregator_type: string option }[@@ocaml.doc
                                    "One or more aggregators for viewing counts of OpsData using different dimensions such as [Source], [CreatedTime], or [Source and CreatedTime], to name a few.\n"]
type nonrec modify_document_permission_response = unit
type nonrec document_permission_type =
  | SHARE [@@ocaml.doc ""]
type nonrec modify_document_permission_request =
  {
  shared_document_version: string option ;
  account_ids_to_remove: string list option ;
  account_ids_to_add: string list option ;
  permission_type: document_permission_type ;
  name: string }[@@ocaml.doc ""]
type nonrec invalid_permission_type = {
  message: string option }[@@ocaml.doc
                            "The permission type isn't supported. {i Share} is the only supported permission type.\n"]
type nonrec document_permission_limit = {
  message: string option }[@@ocaml.doc
                            "The document can't be shared with more Amazon Web Services accounts. You can specify a maximum of 20 accounts per API operation to share a private document.\n\n By default, you can share a private document with a maximum of 1,000 accounts and publicly share up to five documents.\n \n  If you need to increase the quota for privately or publicly shared Systems Manager documents, contact Amazon Web Services Support.\n  "]
type nonrec document_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "You can have at most 500 active SSM documents.\n"]
type nonrec maintenance_window_identity_for_target =
  {
  name: string option ;
  window_id: string option }[@@ocaml.doc
                              "The maintenance window to which the specified target belongs.\n"]
type nonrec maintenance_window_task =
  {
  alarm_configuration: alarm_configuration option ;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option ;
  description: string option ;
  name: string option ;
  max_errors: string option ;
  max_concurrency: string option ;
  service_role_arn: string option ;
  logging_info: logging_info option ;
  priority: int option ;
  task_parameters: maintenance_window_task_parameters option ;
  targets: target list option ;
  type_: maintenance_window_task_type option ;
  task_arn: string option ;
  window_task_id: string option ;
  window_id: string option }[@@ocaml.doc
                              "Information about a task defined for a maintenance window.\n"]
type nonrec maintenance_window_target =
  {
  description: string option ;
  name: string option ;
  owner_information: string option ;
  targets: target list option ;
  resource_type: maintenance_window_resource_type option ;
  window_target_id: string option ;
  window_id: string option }[@@ocaml.doc
                              "The target registered with the maintenance window.\n"]
type nonrec maintenance_window_identity =
  {
  next_execution_time: string option ;
  start_date: string option ;
  end_date: string option ;
  schedule_offset: int option ;
  schedule_timezone: string option ;
  schedule: string option ;
  cutoff: int option ;
  duration: int option ;
  enabled: bool option ;
  description: string option ;
  name: string option ;
  window_id: string option }[@@ocaml.doc
                              "Information about the maintenance window.\n"]
type nonrec maintenance_window_filter =
  {
  values: string list option ;
  key: string option }[@@ocaml.doc
                        "Filter used in the request. Supported filter keys depend on the API operation that includes the filter. API operations that use [MaintenanceWindowFilter>] include the following:\n\n {ul\n       {-   [DescribeMaintenanceWindowExecutions] \n           \n            }\n       {-   [DescribeMaintenanceWindowExecutionTaskInvocations] \n           \n            }\n       {-   [DescribeMaintenanceWindowExecutionTasks] \n           \n            }\n       {-   [DescribeMaintenanceWindows] \n           \n            }\n       {-   [DescribeMaintenanceWindowTargets] \n           \n            }\n       {-   [DescribeMaintenanceWindowTasks] \n           \n            }\n       }\n  "]
type nonrec maintenance_window_execution_status =
  | SkippedOverlapping 
  | Cancelled 
  | Cancelling 
  | TimedOut 
  | Failed 
  | Success 
  | InProgress 
  | Pending [@@ocaml.doc ""]
type nonrec maintenance_window_execution_task_invocation_identity =
  {
  window_target_id: string option ;
  owner_information: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  status_details: string option ;
  status: maintenance_window_execution_status option ;
  parameters: string option ;
  task_type: maintenance_window_task_type option ;
  execution_id: string option ;
  invocation_id: string option ;
  task_execution_id: string option ;
  window_execution_id: string option }[@@ocaml.doc
                                        "Describes the information about a task invocation for a particular target as part of a task execution performed as part of a maintenance window execution.\n"]
type nonrec maintenance_window_execution_task_identity =
  {
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  task_type: maintenance_window_task_type option ;
  task_arn: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  status_details: string option ;
  status: maintenance_window_execution_status option ;
  task_execution_id: string option ;
  window_execution_id: string option }[@@ocaml.doc
                                        "Information about a task execution performed as part of a maintenance window execution.\n"]
type nonrec maintenance_window_execution =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  status_details: string option ;
  status: maintenance_window_execution_status option ;
  window_execution_id: string option ;
  window_id: string option }[@@ocaml.doc
                              "Describes the information about an execution of a maintenance window. \n"]
type nonrec list_tags_for_resource_result = {
  tag_list: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_id: string ;
  resource_type: resource_type_for_tagging }[@@ocaml.doc ""]
type nonrec list_resource_data_sync_result =
  {
  next_token: string option ;
  resource_data_sync_items: resource_data_sync_item list option }[@@ocaml.doc
                                                                   ""]
type nonrec list_resource_data_sync_request =
  {
  max_results: int option ;
  next_token: string option ;
  sync_type: string option }[@@ocaml.doc ""]
type nonrec invalid_next_token = {
  message: string option }[@@ocaml.doc "The specified token isn't valid.\n"]
type nonrec list_resource_compliance_summaries_result =
  {
  next_token: string option ;
  resource_compliance_summary_items:
    resource_compliance_summary_item list option }[@@ocaml.doc ""]
type nonrec compliance_query_operator_type =
  | GreaterThan 
  | LessThan 
  | BeginWith 
  | NotEqual 
  | Equal [@@ocaml.doc ""]
type nonrec compliance_string_filter =
  {
  type_: compliance_query_operator_type option ;
  values: string list option ;
  key: string option }[@@ocaml.doc
                        "One or more filters. Use a filter to return a more specific list of results.\n"]
type nonrec list_resource_compliance_summaries_request =
  {
  max_results: int option ;
  next_token: string option ;
  filters: compliance_string_filter list option }[@@ocaml.doc ""]
type nonrec invalid_filter = {
  message: string option }[@@ocaml.doc
                            "The filter name isn't valid. Verify the you entered the correct name and try again.\n"]
type nonrec list_ops_metadata_result =
  {
  next_token: string option ;
  ops_metadata_list: ops_metadata list option }[@@ocaml.doc ""]
type nonrec list_ops_metadata_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: ops_metadata_filter list option }[@@ocaml.doc ""]
type nonrec list_ops_item_related_items_response =
  {
  summaries: ops_item_related_item_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_ops_item_related_items_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: ops_item_related_items_filter list option ;
  ops_item_id: string option }[@@ocaml.doc ""]
type nonrec list_ops_item_events_response =
  {
  summaries: ops_item_event_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_ops_item_events_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: ops_item_event_filter list option }[@@ocaml.doc ""]
type nonrec list_inventory_entries_result =
  {
  next_token: string option ;
  entries: inventory_item_entry list option ;
  capture_time: string option ;
  schema_version: string option ;
  instance_id: string option ;
  type_name: string option }[@@ocaml.doc ""]
type nonrec inventory_query_operator_type =
  | EXISTS 
  | GREATER_THAN 
  | LESS_THAN 
  | BEGIN_WITH 
  | NOT_EQUAL 
  | EQUAL [@@ocaml.doc ""]
type nonrec inventory_filter =
  {
  type_: inventory_query_operator_type option ;
  values: string list ;
  key: string }[@@ocaml.doc
                 "One or more filters. Use a filter to return a more specific list of results.\n"]
type nonrec list_inventory_entries_request =
  {
  max_results: int option ;
  next_token: string option ;
  filters: inventory_filter list option ;
  type_name: string ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec document_identifier =
  {
  author: string option ;
  review_status: review_status option ;
  requires: document_requires list option ;
  tags: tag list option ;
  target_type: string option ;
  document_format: document_format option ;
  schema_version: string option ;
  document_type: document_type option ;
  document_version: string option ;
  platform_types: platform_type list option ;
  version_name: string option ;
  owner: string option ;
  display_name: string option ;
  created_date: CoreTypes.Timestamp.t option ;
  name: string option }[@@ocaml.doc
                         "Describes the name of a SSM document.\n"]
type nonrec list_documents_result =
  {
  next_token: string option ;
  document_identifiers: document_identifier list option }[@@ocaml.doc ""]
type nonrec document_filter_key =
  | DocumentType 
  | PlatformTypes 
  | Owner 
  | Name [@@ocaml.doc ""]
type nonrec document_filter = {
  value: string ;
  key: document_filter_key }[@@ocaml.doc
                              "This data type is deprecated. Instead, use [DocumentKeyValuesFilter].\n"]
type nonrec document_key_values_filter =
  {
  values: string list option ;
  key: string option }[@@ocaml.doc
                        "One or more filters. Use a filter to return a more specific list of documents.\n\n For keys, you can specify one or more tags that have been applied to a document. \n \n  You can also use Amazon Web Services-provided keys, some of which have specific allowed values. These keys and their associated values are as follows:\n  \n    DocumentType  {ul\n                        {-   [ApplicationConfiguration] \n                            \n                             }\n                        {-   [ApplicationConfigurationSchema] \n                            \n                             }\n                        {-   [Automation] \n                            \n                             }\n                        {-   [ChangeCalendar] \n                            \n                             }\n                        {-   [Command] \n                            \n                             }\n                        {-   [Package] \n                            \n                             }\n                        {-   [Policy] \n                            \n                             }\n                        {-   [Session] \n                            \n                             }\n                        }\n    Owner  Note that only one [Owner] can be specified in a request. For example: [Key=Owner,Values=Self].\n           \n            {ul\n                  {-   [Amazon] \n                      \n                       }\n                  {-   [Private] \n                      \n                       }\n                  {-   [Public] \n                      \n                       }\n                  {-   [Self] \n                      \n                       }\n                  {-   [ThirdParty] \n                      \n                       }\n                  }  PlatformTypes  {ul\n                                          {-   [Linux] \n                                              \n                                               }\n                                          {-   [Windows] \n                                              \n                                               }\n                                          }\n      [Name] is another Amazon Web Services-provided key. If you use [Name] as a key, you can use a name prefix to return a list of documents. For example, in the Amazon Web Services CLI, to return a list of all documents that begin with [Te], run the following command:\n     \n       [aws ssm list-documents --filters Key=Name,Values=Te] \n      \n       You can also use the [TargetType] Amazon Web Services-provided key. For a list of valid resource type values that can be used with this key, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n       \n        If you specify more than two keys, only documents that are identified by all the tags are returned in the results. If you specify more than two values for a key, documents that are identified by any of the values are returned in the results.\n        \n         To specify a custom key-value pair, use the format [Key=tag:tagName,Values=valueName].\n         \n          For example, if you created a key called region and are using the Amazon Web Services CLI to call the [list-documents] command: \n          \n            [aws ssm list-documents --filters Key=tag:region,Values=east,west\n    Key=Owner,Values=Self] \n           "]
type nonrec list_documents_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: document_key_values_filter list option ;
  document_filter_list: document_filter list option }[@@ocaml.doc ""]
type nonrec invalid_filter_key = unit
type nonrec document_version_info =
  {
  review_status: review_status option ;
  status_information: string option ;
  status: document_status option ;
  document_format: document_format option ;
  is_default_version: bool option ;
  created_date: CoreTypes.Timestamp.t option ;
  version_name: string option ;
  document_version: string option ;
  display_name: string option ;
  name: string option }[@@ocaml.doc
                         "Version information about the document.\n"]
type nonrec list_document_versions_result =
  {
  next_token: string option ;
  document_versions: document_version_info list option }[@@ocaml.doc ""]
type nonrec list_document_versions_request =
  {
  next_token: string option ;
  max_results: int option ;
  name: string }[@@ocaml.doc ""]
type nonrec document_reviewer_response_source =
  {
  reviewer: string option ;
  comment: document_review_comment_source list option ;
  review_status: review_status option ;
  updated_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                               "Information about a reviewer's response to a document review request.\n"]
type nonrec document_metadata_response_info =
  {
  reviewer_response: document_reviewer_response_source list option }[@@ocaml.doc
                                                                    "Details about the response to a document review request.\n"]
type nonrec list_document_metadata_history_response =
  {
  next_token: string option ;
  metadata: document_metadata_response_info option ;
  author: string option ;
  document_version: string option ;
  name: string option }[@@ocaml.doc ""]
type nonrec document_metadata_enum =
  | DocumentReviews [@@ocaml.doc ""]
type nonrec list_document_metadata_history_request =
  {
  max_results: int option ;
  next_token: string option ;
  metadata: document_metadata_enum ;
  document_version: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec compliance_summary_item =
  {
  non_compliant_summary: non_compliant_summary option ;
  compliant_summary: compliant_summary option ;
  compliance_type: string option }[@@ocaml.doc
                                    "A summary of compliance information by compliance type.\n"]
type nonrec list_compliance_summaries_result =
  {
  next_token: string option ;
  compliance_summary_items: compliance_summary_item list option }[@@ocaml.doc
                                                                   ""]
type nonrec list_compliance_summaries_request =
  {
  max_results: int option ;
  next_token: string option ;
  filters: compliance_string_filter list option }[@@ocaml.doc ""]
type nonrec compliance_item =
  {
  details: compliance_item_details option ;
  execution_summary: compliance_execution_summary option ;
  severity: compliance_severity option ;
  status: compliance_status option ;
  title: string option ;
  id: string option ;
  resource_id: string option ;
  resource_type: string option ;
  compliance_type: string option }[@@ocaml.doc
                                    "Information about the compliance as defined by the resource type. For example, for a patch resource type, [Items] includes information about the PatchSeverity, Classification, and so on.\n"]
type nonrec list_compliance_items_result =
  {
  next_token: string option ;
  compliance_items: compliance_item list option }[@@ocaml.doc ""]
type nonrec list_compliance_items_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource_types: string list option ;
  resource_ids: string list option ;
  filters: compliance_string_filter list option }[@@ocaml.doc ""]
type nonrec list_commands_result =
  {
  next_token: string option ;
  commands: command list option }[@@ocaml.doc ""]
type nonrec command_filter_key =
  | DOCUMENT_NAME 
  | EXECUTION_STAGE 
  | STATUS 
  | INVOKED_BEFORE 
  | INVOKED_AFTER [@@ocaml.doc ""]
type nonrec command_filter = {
  value: string ;
  key: command_filter_key }[@@ocaml.doc
                             "Describes a command filter.\n\n  A managed node ID can't be specified when a command status is [Pending] because the command hasn't run on the node yet.\n  \n   "]
type nonrec list_commands_request =
  {
  filters: command_filter list option ;
  next_token: string option ;
  max_results: int option ;
  instance_id: string option ;
  command_id: string option }[@@ocaml.doc ""]
type nonrec invalid_command_id = unit
type nonrec command_invocation_status =
  | CANCELLING 
  | FAILED 
  | TIMED_OUT 
  | CANCELLED 
  | SUCCESS 
  | DELAYED 
  | IN_PROGRESS 
  | PENDING [@@ocaml.doc ""]
type nonrec command_plugin_status =
  | FAILED 
  | CANCELLED 
  | TIMED_OUT 
  | SUCCESS 
  | IN_PROGRESS 
  | PENDING [@@ocaml.doc ""]
type nonrec command_plugin =
  {
  output_s3_key_prefix: string option ;
  output_s3_bucket_name: string option ;
  output_s3_region: string option ;
  standard_error_url: string option ;
  standard_output_url: string option ;
  output: string option ;
  response_finish_date_time: CoreTypes.Timestamp.t option ;
  response_start_date_time: CoreTypes.Timestamp.t option ;
  response_code: int option ;
  status_details: string option ;
  status: command_plugin_status option ;
  name: string option }[@@ocaml.doc "Describes plugin details.\n"]
type nonrec command_invocation =
  {
  cloud_watch_output_config: cloud_watch_output_config option ;
  notification_config: notification_config option ;
  service_role: string option ;
  command_plugins: command_plugin list option ;
  standard_error_url: string option ;
  standard_output_url: string option ;
  trace_output: string option ;
  status_details: string option ;
  status: command_invocation_status option ;
  requested_date_time: CoreTypes.Timestamp.t option ;
  document_version: string option ;
  document_name: string option ;
  comment: string option ;
  instance_name: string option ;
  instance_id: string option ;
  command_id: string option }[@@ocaml.doc
                               "An invocation is a copy of a command sent to a specific managed node. A command can apply to one or more managed nodes. A command invocation applies to one managed node. For example, if a user runs [SendCommand] against three managed nodes, then a command invocation is created for each requested managed node ID. A command invocation returns status and detail information about a command you ran. \n"]
type nonrec list_command_invocations_result =
  {
  next_token: string option ;
  command_invocations: command_invocation list option }[@@ocaml.doc ""]
type nonrec list_command_invocations_request =
  {
  details: bool option ;
  filters: command_filter list option ;
  next_token: string option ;
  max_results: int option ;
  instance_id: string option ;
  command_id: string option }[@@ocaml.doc ""]
type nonrec association =
  {
  target_maps: target_map list option ;
  duration: int option ;
  schedule_offset: int option ;
  association_name: string option ;
  schedule_expression: string option ;
  overview: association_overview option ;
  last_execution_date: CoreTypes.Timestamp.t option ;
  targets: target list option ;
  document_version: string option ;
  association_version: string option ;
  association_id: string option ;
  instance_id: string option ;
  name: string option }[@@ocaml.doc
                         "Describes an association of a Amazon Web Services Systems Manager document (SSM document) and a managed node.\n"]
type nonrec list_associations_result =
  {
  next_token: string option ;
  associations: association list option }[@@ocaml.doc ""]
type nonrec association_filter_key =
  | ResourceGroupName 
  | AssociationName 
  | LastExecutedAfter 
  | LastExecutedBefore 
  | Status 
  | AssociationId 
  | Name 
  | InstanceId [@@ocaml.doc ""]
type nonrec association_filter =
  {
  value: string ;
  key: association_filter_key }[@@ocaml.doc "Describes a filter.\n"]
type nonrec list_associations_request =
  {
  next_token: string option ;
  max_results: int option ;
  association_filter_list: association_filter list option }[@@ocaml.doc ""]
type nonrec association_version_info =
  {
  target_maps: target_map list option ;
  duration: int option ;
  schedule_offset: int option ;
  target_locations: target_location list option ;
  calendar_names: string list option ;
  apply_only_at_cron_interval: bool option ;
  sync_compliance: association_sync_compliance option ;
  compliance_severity: association_compliance_severity option ;
  max_concurrency: string option ;
  max_errors: string option ;
  association_name: string option ;
  output_location: instance_association_output_location option ;
  schedule_expression: string option ;
  targets: target list option ;
  parameters: parameters option ;
  document_version: string option ;
  name: string option ;
  created_date: CoreTypes.Timestamp.t option ;
  association_version: string option ;
  association_id: string option }[@@ocaml.doc
                                   "Information about the association version.\n"]
type nonrec list_association_versions_result =
  {
  next_token: string option ;
  association_versions: association_version_info list option }[@@ocaml.doc
                                                                ""]
type nonrec list_association_versions_request =
  {
  next_token: string option ;
  max_results: int option ;
  association_id: string }[@@ocaml.doc ""]
type nonrec label_parameter_version_result =
  {
  parameter_version: int option ;
  invalid_labels: string list option }[@@ocaml.doc ""]
type nonrec label_parameter_version_request =
  {
  labels: string list ;
  parameter_version: int option ;
  name: string }[@@ocaml.doc ""]
type nonrec invocation_does_not_exist = unit
type nonrec inventory_schema_delete_option =
  | DELETE_SCHEMA 
  | DISABLE_SCHEMA [@@ocaml.doc ""]
type nonrec inventory_result_item =
  {
  content: inventory_item_entry list ;
  content_hash: string option ;
  capture_time: string option ;
  schema_version: string ;
  type_name: string }[@@ocaml.doc "The inventory result item.\n"]
type nonrec inventory_result_item_map = (string * inventory_result_item) list
[@@ocaml.doc ""]
type nonrec inventory_result_entity =
  {
  data: inventory_result_item_map option ;
  id: string option }[@@ocaml.doc "Inventory query results.\n"]
type nonrec inventory_attribute_data_type =
  | NUMBER 
  | STRING [@@ocaml.doc ""]
type nonrec inventory_item_attribute =
  {
  data_type: inventory_attribute_data_type ;
  name: string }[@@ocaml.doc
                  "Attributes are the entries within the inventory item content. It contains name and value.\n"]
type nonrec inventory_item_schema =
  {
  display_name: string option ;
  attributes: inventory_item_attribute list ;
  version: string option ;
  type_name: string }[@@ocaml.doc
                       "The inventory item schema definition. Users can use this to compose inventory query filters.\n"]
type nonrec inventory_group = {
  filters: inventory_filter list ;
  name: string }[@@ocaml.doc
                  "A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.\n"]
type nonrec inventory_deletion_status =
  | COMPLETE 
  | IN_PROGRESS [@@ocaml.doc ""]
type nonrec inventory_deletion_summary_item =
  {
  remaining_count: int option ;
  count: int option ;
  version: string option }[@@ocaml.doc
                            "Either a count, remaining count, or a version number in a delete inventory summary.\n"]
type nonrec inventory_deletion_summary =
  {
  summary_items: inventory_deletion_summary_item list option ;
  remaining_count: int option ;
  total_count: int option }[@@ocaml.doc
                             "Information about the delete operation.\n"]
type nonrec inventory_deletion_status_item =
  {
  last_status_update_time: CoreTypes.Timestamp.t option ;
  deletion_summary: inventory_deletion_summary option ;
  last_status_message: string option ;
  last_status: inventory_deletion_status option ;
  deletion_start_time: CoreTypes.Timestamp.t option ;
  type_name: string option ;
  deletion_id: string option }[@@ocaml.doc
                                "Status information returned by the [DeleteInventory] operation.\n"]
type inventory_aggregator =
  {
  groups: inventory_group list option ;
  aggregators: inventory_aggregator list option ;
  expression: string option }[@@ocaml.doc
                               "Specifies the inventory type and attribute for the aggregation execution.\n"]
type nonrec invalid_tag = {
  message: string option }[@@ocaml.doc
                            "The specified tag key or value isn't valid.\n"]
type nonrec invalid_result_attribute_exception = {
  message: string option }[@@ocaml.doc
                            "The specified inventory item result attribute isn't valid.\n"]
type nonrec invalid_plugin_name = unit
type nonrec invalid_option_exception = {
  message: string option }[@@ocaml.doc
                            "The delete inventory option specified isn't valid. Verify the option and try again.\n"]
type nonrec invalid_inventory_request_exception = {
  message: string option }[@@ocaml.doc "The request isn't valid.\n"]
type nonrec invalid_inventory_group_exception = {
  message: string option }[@@ocaml.doc
                            "The specified inventory group isn't valid.\n"]
type nonrec invalid_instance_property_filter_value =
  {
  message: string option }[@@ocaml.doc
                            "The specified filter value isn't valid.\n"]
type nonrec invalid_instance_information_filter_value =
  {
  message: string option }[@@ocaml.doc
                            "The specified filter value isn't valid.\n"]
type nonrec invalid_filter_value = {
  message: string option }[@@ocaml.doc
                            "The filter value isn't valid. Verify the value and try again.\n"]
type nonrec invalid_filter_option = {
  message: string option }[@@ocaml.doc
                            "The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter, valid options are Recursive and OneLevel.\n"]
type nonrec invalid_document_type = {
  message: string option }[@@ocaml.doc
                            "The SSM document type isn't valid. Valid document types are described in the [DocumentType] property.\n"]
type nonrec invalid_deletion_id_exception = {
  message: string option }[@@ocaml.doc
                            "The ID specified for the delete operation doesn't exist or isn't valid. Verify the ID and try again.\n"]
type nonrec invalid_delete_inventory_parameters_exception =
  {
  message: string option }[@@ocaml.doc
                            "One or more of the parameters specified for the delete operation isn't valid. Verify all parameters and try again.\n"]
type nonrec invalid_aggregator_exception = {
  message: string option }[@@ocaml.doc
                            "The specified aggregator isn't valid for inventory groups. Verify that the aggregator uses a valid inventory type such as [AWS:Application] or [AWS:InstanceInformation].\n"]
type nonrec invalid_activation_id = {
  message: string option }[@@ocaml.doc
                            "The activation ID isn't valid. Verify the you entered the correct ActivationId or ActivationCode and try again.\n"]
type nonrec invalid_activation = {
  message: string option }[@@ocaml.doc
                            "The activation isn't valid. The activation might have been deleted, or the ActivationId and the ActivationCode don't match.\n"]
type nonrec instance_property_filter_operator =
  | GREATER_THAN 
  | LESS_THAN 
  | BEGIN_WITH 
  | NOT_EQUAL 
  | EQUAL [@@ocaml.doc ""]
type nonrec instance_property_string_filter =
  {
  operator: instance_property_filter_operator option ;
  values: string list ;
  key: string }[@@ocaml.doc
                 "The filters to describe or get information about your managed nodes.\n"]
type nonrec instance_property_filter_key =
  | ASSOCIATION_STATUS 
  | RESOURCE_TYPE 
  | IAM_ROLE 
  | ACTIVATION_IDS 
  | DOCUMENT_NAME 
  | PLATFORM_TYPES 
  | PING_STATUS 
  | AGENT_VERSION 
  | INSTANCE_IDS [@@ocaml.doc ""]
type nonrec instance_property_filter =
  {
  value_set: string list ;
  key: instance_property_filter_key }[@@ocaml.doc
                                       "Describes a filter for a specific list of managed nodes. You can filter node information by using tags. You specify tags by using a key-value mapping.\n"]
type nonrec instance_association_status_aggregated_count =
  (string * int) list[@@ocaml.doc ""]
type nonrec instance_aggregated_association_overview =
  {
  instance_association_status_aggregated_count:
    instance_association_status_aggregated_count option ;
  detailed_status: string option }[@@ocaml.doc
                                    "Status information about the aggregated associations.\n"]
type nonrec instance_property =
  {
  source_type: source_type option ;
  source_id: string option ;
  association_overview: instance_aggregated_association_overview option ;
  last_successful_association_execution_date: CoreTypes.Timestamp.t option ;
  last_association_execution_date: CoreTypes.Timestamp.t option ;
  association_status: string option ;
  computer_name: string option ;
  resource_type: string option ;
  registration_date: CoreTypes.Timestamp.t option ;
  iam_role: string option ;
  activation_id: string option ;
  platform_version: string option ;
  platform_name: string option ;
  platform_type: platform_type option ;
  agent_version: string option ;
  last_ping_date_time: CoreTypes.Timestamp.t option ;
  ping_status: ping_status option ;
  launch_time: CoreTypes.Timestamp.t option ;
  ip_address: string option ;
  architecture: string option ;
  instance_state: string option ;
  key_name: string option ;
  instance_role: string option ;
  instance_type: string option ;
  instance_id: string option ;
  name: string option }[@@ocaml.doc
                         "An object containing various properties of a managed node.\n"]
type nonrec instance_patch_state =
  {
  other_non_compliant_count: int option ;
  security_non_compliant_count: int option ;
  critical_non_compliant_count: int option ;
  reboot_option: reboot_option option ;
  last_no_reboot_install_operation_time: CoreTypes.Timestamp.t option ;
  operation: patch_operation_type ;
  operation_end_time: CoreTypes.Timestamp.t ;
  operation_start_time: CoreTypes.Timestamp.t ;
  not_applicable_count: int option ;
  unreported_not_applicable_count: int option ;
  failed_count: int option ;
  missing_count: int option ;
  installed_rejected_count: int option ;
  installed_pending_reboot_count: int option ;
  installed_other_count: int option ;
  installed_count: int option ;
  owner_information: string option ;
  install_override_list: string option ;
  snapshot_id: string option ;
  baseline_id: string ;
  patch_group: string ;
  instance_id: string }[@@ocaml.doc
                         "Defines the high-level patch compliance state for a managed node, providing information about the number of installed, missing, not applicable, and failed patches along with metadata about the operation when this information was gathered for the managed node.\n"]
type nonrec instance_patch_state_operator_type =
  | GREATER_THAN 
  | LESS_THAN 
  | NOT_EQUAL 
  | EQUAL [@@ocaml.doc ""]
type nonrec instance_patch_state_filter =
  {
  type_: instance_patch_state_operator_type ;
  values: string list ;
  key: string }[@@ocaml.doc
                 "Defines a filter used in [DescribeInstancePatchStatesForPatchGroup] to scope down the information returned by the API.\n\n  {b Example}: To filter for all managed nodes in a patch group having more than three patches with a [FailedCount] status, use the following for the filter:\n \n  {ul\n        {-  Value for [Key]: [FailedCount] \n            \n             }\n        {-  Value for [Type]: [GreaterThan] \n            \n             }\n        {-  Value for [Values]: [3] \n            \n             }\n        }\n  "]
type nonrec instance_information_string_filter =
  {
  values: string list ;
  key: string }[@@ocaml.doc
                 "The filters to describe or get information about your managed nodes.\n"]
type nonrec instance_information =
  {
  source_type: source_type option ;
  source_id: string option ;
  association_overview: instance_aggregated_association_overview option ;
  last_successful_association_execution_date: CoreTypes.Timestamp.t option ;
  last_association_execution_date: CoreTypes.Timestamp.t option ;
  association_status: string option ;
  computer_name: string option ;
  ip_address: string option ;
  name: string option ;
  resource_type: resource_type option ;
  registration_date: CoreTypes.Timestamp.t option ;
  iam_role: string option ;
  activation_id: string option ;
  platform_version: string option ;
  platform_name: string option ;
  platform_type: platform_type option ;
  is_latest_version: bool option ;
  agent_version: string option ;
  last_ping_date_time: CoreTypes.Timestamp.t option ;
  ping_status: ping_status option ;
  instance_id: string option }[@@ocaml.doc
                                "Describes a filter for a specific list of managed nodes. \n"]
type nonrec instance_information_filter_key =
  | ASSOCIATION_STATUS 
  | RESOURCE_TYPE 
  | IAM_ROLE 
  | ACTIVATION_IDS 
  | PLATFORM_TYPES 
  | PING_STATUS 
  | AGENT_VERSION 
  | INSTANCE_IDS [@@ocaml.doc ""]
type nonrec instance_information_filter =
  {
  value_set: string list ;
  key: instance_information_filter_key }[@@ocaml.doc
                                          "Describes a filter for a specific list of managed nodes. You can filter node information by using tags. You specify tags by using a key-value mapping.\n\n Use this operation instead of the [DescribeInstanceInformationRequest$InstanceInformationFilterList] method. The [InstanceInformationFilterList] method is a legacy method and doesn't support tags. \n "]
type nonrec instance_association_output_url =
  {
  s3_output_url: s3_output_url option }[@@ocaml.doc
                                         "The URL of S3 bucket where you want to store the results of this request.\n"]
type nonrec instance_association_status_info =
  {
  association_name: string option ;
  output_url: instance_association_output_url option ;
  error_code: string option ;
  execution_summary: string option ;
  detailed_status: string option ;
  status: string option ;
  execution_date: CoreTypes.Timestamp.t option ;
  instance_id: string option ;
  association_version: string option ;
  document_version: string option ;
  name: string option ;
  association_id: string option }[@@ocaml.doc
                                   "Status information about the association.\n"]
type nonrec instance_association =
  {
  association_version: string option ;
  content: string option ;
  instance_id: string option ;
  association_id: string option }[@@ocaml.doc
                                   "One or more association documents on the managed node. \n"]
type nonrec get_service_setting_result =
  {
  service_setting: service_setting option }[@@ocaml.doc
                                             "The query result body of the GetServiceSetting API operation.\n"]
type nonrec get_service_setting_request = {
  setting_id: string }[@@ocaml.doc
                        "The request body of the GetServiceSetting API operation.\n"]
type nonrec get_resource_policies_response_entry =
  {
  policy: string option ;
  policy_hash: string option ;
  policy_id: string option }[@@ocaml.doc
                              "A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. Currently, [OpsItemGroup] is the only resource that supports Systems Manager resource policies. The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).\n"]
type nonrec get_resource_policies_response =
  {
  policies: get_resource_policies_response_entry list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec get_resource_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_patch_baseline_result =
  {
  sources: patch_source list option ;
  description: string option ;
  modified_date: CoreTypes.Timestamp.t option ;
  created_date: CoreTypes.Timestamp.t option ;
  patch_groups: string list option ;
  rejected_patches_action: patch_action option ;
  rejected_patches: string list option ;
  approved_patches_enable_non_security: bool option ;
  approved_patches_compliance_level: patch_compliance_level option ;
  approved_patches: string list option ;
  approval_rules: patch_rule_group option ;
  global_filters: patch_filter_group option ;
  operating_system: operating_system option ;
  name: string option ;
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec get_patch_baseline_request = {
  baseline_id: string }[@@ocaml.doc ""]
type nonrec get_patch_baseline_for_patch_group_result =
  {
  operating_system: operating_system option ;
  patch_group: string option ;
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec get_patch_baseline_for_patch_group_request =
  {
  operating_system: operating_system option ;
  patch_group: string }[@@ocaml.doc ""]
type nonrec get_parameters_result =
  {
  invalid_parameters: string list option ;
  parameters: parameter list option }[@@ocaml.doc ""]
type nonrec get_parameters_request =
  {
  with_decryption: bool option ;
  names: string list }[@@ocaml.doc ""]
type nonrec get_parameters_by_path_result =
  {
  next_token: string option ;
  parameters: parameter list option }[@@ocaml.doc ""]
type nonrec get_parameters_by_path_request =
  {
  next_token: string option ;
  max_results: int option ;
  with_decryption: bool option ;
  parameter_filters: parameter_string_filter list option ;
  recursive: bool option ;
  path: string }[@@ocaml.doc ""]
type nonrec get_parameter_result = {
  parameter: parameter option }[@@ocaml.doc ""]
type nonrec get_parameter_request =
  {
  with_decryption: bool option ;
  name: string }[@@ocaml.doc ""]
type nonrec get_parameter_history_result =
  {
  next_token: string option ;
  parameters: parameter_history list option }[@@ocaml.doc ""]
type nonrec get_parameter_history_request =
  {
  next_token: string option ;
  max_results: int option ;
  with_decryption: bool option ;
  name: string }[@@ocaml.doc ""]
type nonrec get_ops_summary_result =
  {
  next_token: string option ;
  entities: ops_entity list option }[@@ocaml.doc ""]
type nonrec get_ops_summary_request =
  {
  max_results: int option ;
  next_token: string option ;
  result_attributes: ops_result_attribute list option ;
  aggregators: ops_aggregator list option ;
  filters: ops_filter list option ;
  sync_name: string option }[@@ocaml.doc ""]
type nonrec get_ops_metadata_result =
  {
  next_token: string option ;
  metadata: metadata_map option ;
  resource_id: string option }[@@ocaml.doc ""]
type nonrec get_ops_metadata_request =
  {
  next_token: string option ;
  max_results: int option ;
  ops_metadata_arn: string }[@@ocaml.doc ""]
type nonrec get_ops_item_response = {
  ops_item: ops_item option }[@@ocaml.doc ""]
type nonrec get_ops_item_request =
  {
  ops_item_arn: string option ;
  ops_item_id: string }[@@ocaml.doc ""]
type nonrec get_maintenance_window_task_result =
  {
  alarm_configuration: alarm_configuration option ;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option ;
  description: string option ;
  name: string option ;
  logging_info: logging_info option ;
  max_errors: string option ;
  max_concurrency: string option ;
  priority: int option ;
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option ;
  task_parameters: maintenance_window_task_parameters option ;
  task_type: maintenance_window_task_type option ;
  service_role_arn: string option ;
  task_arn: string option ;
  targets: target list option ;
  window_task_id: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec get_maintenance_window_task_request =
  {
  window_task_id: string ;
  window_id: string }[@@ocaml.doc ""]
type nonrec get_maintenance_window_result =
  {
  modified_date: CoreTypes.Timestamp.t option ;
  created_date: CoreTypes.Timestamp.t option ;
  enabled: bool option ;
  allow_unassociated_targets: bool option ;
  cutoff: int option ;
  duration: int option ;
  next_execution_time: string option ;
  schedule_offset: int option ;
  schedule_timezone: string option ;
  schedule: string option ;
  end_date: string option ;
  start_date: string option ;
  description: string option ;
  name: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec get_maintenance_window_request = {
  window_id: string }[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_result =
  {
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  status_details: string option ;
  status: maintenance_window_execution_status option ;
  max_errors: string option ;
  max_concurrency: string option ;
  priority: int option ;
  task_parameters: maintenance_window_task_parameters list option ;
  type_: maintenance_window_task_type option ;
  service_role: string option ;
  task_arn: string option ;
  task_execution_id: string option ;
  window_execution_id: string option }[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_request =
  {
  task_id: string ;
  window_execution_id: string }[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_invocation_result =
  {
  window_target_id: string option ;
  owner_information: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  status_details: string option ;
  status: maintenance_window_execution_status option ;
  parameters: string option ;
  task_type: maintenance_window_task_type option ;
  execution_id: string option ;
  invocation_id: string option ;
  task_execution_id: string option ;
  window_execution_id: string option }[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_invocation_request =
  {
  invocation_id: string ;
  task_id: string ;
  window_execution_id: string }[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_result =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  status_details: string option ;
  status: maintenance_window_execution_status option ;
  task_ids: string list option ;
  window_execution_id: string option }[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_request =
  {
  window_execution_id: string }[@@ocaml.doc ""]
type nonrec get_inventory_schema_result =
  {
  next_token: string option ;
  schemas: inventory_item_schema list option }[@@ocaml.doc ""]
type nonrec get_inventory_schema_request =
  {
  sub_type: bool option ;
  aggregator: bool option ;
  max_results: int option ;
  next_token: string option ;
  type_name: string option }[@@ocaml.doc ""]
type nonrec get_inventory_result =
  {
  next_token: string option ;
  entities: inventory_result_entity list option }[@@ocaml.doc ""]
type nonrec get_inventory_request =
  {
  max_results: int option ;
  next_token: string option ;
  result_attributes: result_attribute list option ;
  aggregators: inventory_aggregator list option ;
  filters: inventory_filter list option }[@@ocaml.doc ""]
type nonrec attachment_hash_type =
  | SHA256 [@@ocaml.doc ""]
type nonrec attachment_content =
  {
  url: string option ;
  hash_type: attachment_hash_type option ;
  hash: string option ;
  size: int option ;
  name: string option }[@@ocaml.doc
                         "A structure that includes attributes that describe a document attachment.\n"]
type nonrec get_document_result =
  {
  review_status: review_status option ;
  attachments_content: attachment_content list option ;
  requires: document_requires list option ;
  document_format: document_format option ;
  document_type: document_type option ;
  content: string option ;
  status_information: string option ;
  status: document_status option ;
  document_version: string option ;
  version_name: string option ;
  display_name: string option ;
  created_date: CoreTypes.Timestamp.t option ;
  name: string option }[@@ocaml.doc ""]
type nonrec get_document_request =
  {
  document_format: document_format option ;
  document_version: string option ;
  version_name: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec get_deployable_patch_snapshot_for_instance_result =
  {
  product: string option ;
  snapshot_download_url: string option ;
  snapshot_id: string option ;
  instance_id: string option }[@@ocaml.doc ""]
type nonrec baseline_override =
  {
  sources: patch_source list option ;
  approved_patches_enable_non_security: bool option ;
  rejected_patches_action: patch_action option ;
  rejected_patches: string list option ;
  approved_patches_compliance_level: patch_compliance_level option ;
  approved_patches: string list option ;
  approval_rules: patch_rule_group option ;
  global_filters: patch_filter_group option ;
  operating_system: operating_system option }[@@ocaml.doc
                                               "Defines the basic information about a patch baseline override.\n"]
type nonrec get_deployable_patch_snapshot_for_instance_request =
  {
  baseline_override: baseline_override option ;
  snapshot_id: string ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec get_default_patch_baseline_result =
  {
  operating_system: operating_system option ;
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec get_default_patch_baseline_request =
  {
  operating_system: operating_system option }[@@ocaml.doc ""]
type nonrec connection_status =
  | NOT_CONNECTED 
  | CONNECTED [@@ocaml.doc ""]
type nonrec get_connection_status_response =
  {
  status: connection_status option ;
  target: string option }[@@ocaml.doc ""]
type nonrec get_connection_status_request = {
  target: string }[@@ocaml.doc ""]
type nonrec get_command_invocation_result =
  {
  cloud_watch_output_config: cloud_watch_output_config option ;
  standard_error_url: string option ;
  standard_error_content: string option ;
  standard_output_url: string option ;
  standard_output_content: string option ;
  status_details: string option ;
  status: command_invocation_status option ;
  execution_end_date_time: string option ;
  execution_elapsed_time: string option ;
  execution_start_date_time: string option ;
  response_code: int option ;
  plugin_name: string option ;
  document_version: string option ;
  document_name: string option ;
  comment: string option ;
  instance_id: string option ;
  command_id: string option }[@@ocaml.doc ""]
type nonrec get_command_invocation_request =
  {
  plugin_name: string option ;
  instance_id: string ;
  command_id: string }[@@ocaml.doc ""]
type nonrec calendar_state =
  | CLOSED 
  | OPEN [@@ocaml.doc ""]
type nonrec get_calendar_state_response =
  {
  next_transition_time: string option ;
  at_time: string option ;
  state: calendar_state option }[@@ocaml.doc ""]
type nonrec get_calendar_state_request =
  {
  at_time: string option ;
  calendar_names: string list }[@@ocaml.doc ""]
type nonrec automation_subtype =
  | ChangeRequest [@@ocaml.doc ""]
type nonrec automation_execution =
  {
  variables: automation_parameter_map option ;
  change_request_name: string option ;
  association_id: string option ;
  ops_item_id: string option ;
  runbooks: runbook list option ;
  scheduled_time: CoreTypes.Timestamp.t option ;
  automation_subtype: automation_subtype option ;
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  progress_counters: progress_counters option ;
  target_locations: target_location list option ;
  target: string option ;
  max_errors: string option ;
  max_concurrency: string option ;
  resolved_targets: resolved_targets option ;
  target_maps: target_map list option ;
  targets: target list option ;
  target_parameter_name: string option ;
  current_action: string option ;
  current_step_name: string option ;
  executed_by: string option ;
  parent_automation_execution_id: string option ;
  mode: execution_mode option ;
  failure_message: string option ;
  outputs: automation_parameter_map option ;
  parameters: automation_parameter_map option ;
  step_executions_truncated: bool option ;
  step_executions: step_execution list option ;
  automation_execution_status: automation_execution_status option ;
  execution_end_time: CoreTypes.Timestamp.t option ;
  execution_start_time: CoreTypes.Timestamp.t option ;
  document_version: string option ;
  document_name: string option ;
  automation_execution_id: string option }[@@ocaml.doc
                                            "Detailed information about the current state of an individual Automation execution.\n"]
type nonrec get_automation_execution_result =
  {
  automation_execution: automation_execution option }[@@ocaml.doc ""]
type nonrec get_automation_execution_request =
  {
  automation_execution_id: string }[@@ocaml.doc ""]
type nonrec fault =
  | Unknown 
  | Server 
  | Client [@@ocaml.doc ""]
type nonrec create_association_batch_request_entry =
  {
  alarm_configuration: alarm_configuration option ;
  target_maps: target_map list option ;
  duration: int option ;
  schedule_offset: int option ;
  target_locations: target_location list option ;
  calendar_names: string list option ;
  apply_only_at_cron_interval: bool option ;
  sync_compliance: association_sync_compliance option ;
  compliance_severity: association_compliance_severity option ;
  max_concurrency: string option ;
  max_errors: string option ;
  association_name: string option ;
  output_location: instance_association_output_location option ;
  schedule_expression: string option ;
  targets: target list option ;
  document_version: string option ;
  automation_target_parameter_name: string option ;
  parameters: parameters option ;
  instance_id: string option ;
  name: string }[@@ocaml.doc
                  "Describes the association of a Amazon Web Services Systems Manager document (SSM document) and a managed node.\n"]
type nonrec failed_create_association =
  {
  fault: fault option ;
  message: string option ;
  entry: create_association_batch_request_entry option }[@@ocaml.doc
                                                          "Describes a failed association.\n"]
type nonrec effective_patch =
  {
  patch_status: patch_status option ;
  patch: patch option }[@@ocaml.doc
                         "The [EffectivePatch] structure defines metadata about a patch along with the approval state of the patch in a particular patch baseline. The approval state includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.\n"]
type nonrec document_already_exists = {
  message: string option }[@@ocaml.doc
                            "The specified document already exists.\n"]
type nonrec disassociate_ops_item_related_item_response = unit
type nonrec disassociate_ops_item_related_item_request =
  {
  association_id: string ;
  ops_item_id: string }[@@ocaml.doc ""]
type nonrec describe_sessions_response =
  {
  next_token: string option ;
  sessions: session list option }[@@ocaml.doc ""]
type nonrec describe_sessions_request =
  {
  filters: session_filter list option ;
  next_token: string option ;
  max_results: int option ;
  state: session_state }[@@ocaml.doc ""]
type nonrec describe_patch_properties_result =
  {
  next_token: string option ;
  properties: patch_property_entry list option }[@@ocaml.doc ""]
type nonrec describe_patch_properties_request =
  {
  next_token: string option ;
  max_results: int option ;
  patch_set: patch_set option ;
  property: patch_property ;
  operating_system: operating_system }[@@ocaml.doc ""]
type nonrec describe_patch_groups_result =
  {
  next_token: string option ;
  mappings: patch_group_patch_baseline_mapping list option }[@@ocaml.doc ""]
type nonrec describe_patch_groups_request =
  {
  next_token: string option ;
  filters: patch_orchestrator_filter list option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec describe_patch_group_state_result =
  {
  instances_with_other_non_compliant_patches: int option ;
  instances_with_security_non_compliant_patches: int option ;
  instances_with_critical_non_compliant_patches: int option ;
  instances_with_unreported_not_applicable_patches: int option ;
  instances_with_not_applicable_patches: int option ;
  instances_with_failed_patches: int option ;
  instances_with_missing_patches: int option ;
  instances_with_installed_rejected_patches: int option ;
  instances_with_installed_pending_reboot_patches: int option ;
  instances_with_installed_other_patches: int option ;
  instances_with_installed_patches: int option ;
  instances: int option }[@@ocaml.doc ""]
type nonrec describe_patch_group_state_request = {
  patch_group: string }[@@ocaml.doc ""]
type nonrec describe_patch_baselines_result =
  {
  next_token: string option ;
  baseline_identities: patch_baseline_identity list option }[@@ocaml.doc ""]
type nonrec describe_patch_baselines_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: patch_orchestrator_filter list option }[@@ocaml.doc ""]
type nonrec describe_parameters_result =
  {
  next_token: string option ;
  parameters: parameter_metadata list option }[@@ocaml.doc ""]
type nonrec describe_parameters_request =
  {
  shared: bool option ;
  next_token: string option ;
  max_results: int option ;
  parameter_filters: parameter_string_filter list option ;
  filters: parameters_filter list option }[@@ocaml.doc ""]
type nonrec describe_ops_items_response =
  {
  ops_item_summaries: ops_item_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_ops_items_request =
  {
  next_token: string option ;
  max_results: int option ;
  ops_item_filters: ops_item_filter list option }[@@ocaml.doc ""]
type nonrec describe_maintenance_windows_result =
  {
  next_token: string option ;
  window_identities: maintenance_window_identity list option }[@@ocaml.doc
                                                                ""]
type nonrec describe_maintenance_windows_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: maintenance_window_filter list option }[@@ocaml.doc ""]
type nonrec describe_maintenance_windows_for_target_result =
  {
  next_token: string option ;
  window_identities: maintenance_window_identity_for_target list option }
[@@ocaml.doc ""]
type nonrec describe_maintenance_windows_for_target_request =
  {
  next_token: string option ;
  max_results: int option ;
  resource_type: maintenance_window_resource_type ;
  targets: target list }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_tasks_result =
  {
  next_token: string option ;
  tasks: maintenance_window_task list option }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_tasks_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: maintenance_window_filter list option ;
  window_id: string }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_targets_result =
  {
  next_token: string option ;
  targets: maintenance_window_target list option }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_targets_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: maintenance_window_filter list option ;
  window_id: string }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_schedule_result =
  {
  next_token: string option ;
  scheduled_window_executions: scheduled_window_execution list option }
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_schedule_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: patch_orchestrator_filter list option ;
  resource_type: maintenance_window_resource_type option ;
  targets: target list option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_executions_result =
  {
  next_token: string option ;
  window_executions: maintenance_window_execution list option }[@@ocaml.doc
                                                                 ""]
type nonrec describe_maintenance_window_executions_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: maintenance_window_filter list option ;
  window_id: string }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_tasks_result =
  {
  next_token: string option ;
  window_execution_task_identities:
    maintenance_window_execution_task_identity list option }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_tasks_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: maintenance_window_filter list option ;
  window_execution_id: string }[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_task_invocations_result =
  {
  next_token: string option ;
  window_execution_task_invocation_identities:
    maintenance_window_execution_task_invocation_identity list option }
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_task_invocations_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: maintenance_window_filter list option ;
  task_id: string ;
  window_execution_id: string }[@@ocaml.doc ""]
type nonrec describe_inventory_deletions_result =
  {
  next_token: string option ;
  inventory_deletions: inventory_deletion_status_item list option }[@@ocaml.doc
                                                                    ""]
type nonrec describe_inventory_deletions_request =
  {
  max_results: int option ;
  next_token: string option ;
  deletion_id: string option }[@@ocaml.doc ""]
type nonrec describe_instance_properties_result =
  {
  next_token: string option ;
  instance_properties: instance_property list option }[@@ocaml.doc ""]
type nonrec describe_instance_properties_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters_with_operator: instance_property_string_filter list option ;
  instance_property_filter_list: instance_property_filter list option }
[@@ocaml.doc ""]
type nonrec describe_instance_patches_result =
  {
  next_token: string option ;
  patches: patch_compliance_data list option }[@@ocaml.doc ""]
type nonrec describe_instance_patches_request =
  {
  max_results: int option ;
  next_token: string option ;
  filters: patch_orchestrator_filter list option ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_result =
  {
  next_token: string option ;
  instance_patch_states: instance_patch_state list option }[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_request =
  {
  max_results: int option ;
  next_token: string option ;
  instance_ids: string list }[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_for_patch_group_result =
  {
  next_token: string option ;
  instance_patch_states: instance_patch_state list option }[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_for_patch_group_request =
  {
  max_results: int option ;
  next_token: string option ;
  filters: instance_patch_state_filter list option ;
  patch_group: string }[@@ocaml.doc ""]
type nonrec describe_instance_information_result =
  {
  next_token: string option ;
  instance_information_list: instance_information list option }[@@ocaml.doc
                                                                 ""]
type nonrec describe_instance_information_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: instance_information_string_filter list option ;
  instance_information_filter_list: instance_information_filter list option }
[@@ocaml.doc ""]
type nonrec describe_instance_associations_status_result =
  {
  next_token: string option ;
  instance_association_status_infos:
    instance_association_status_info list option }[@@ocaml.doc ""]
type nonrec describe_instance_associations_status_request =
  {
  next_token: string option ;
  max_results: int option ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec describe_effective_patches_for_patch_baseline_result =
  {
  next_token: string option ;
  effective_patches: effective_patch list option }[@@ocaml.doc ""]
type nonrec describe_effective_patches_for_patch_baseline_request =
  {
  next_token: string option ;
  max_results: int option ;
  baseline_id: string }[@@ocaml.doc ""]
type nonrec describe_effective_instance_associations_result =
  {
  next_token: string option ;
  associations: instance_association list option }[@@ocaml.doc ""]
type nonrec describe_effective_instance_associations_request =
  {
  next_token: string option ;
  max_results: int option ;
  instance_id: string }[@@ocaml.doc ""]
type nonrec describe_document_result =
  {
  document: document_description option }[@@ocaml.doc ""]
type nonrec describe_document_request =
  {
  version_name: string option ;
  document_version: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec account_sharing_info =
  {
  shared_document_version: string option ;
  account_id: string option }[@@ocaml.doc
                               "Information includes the Amazon Web Services account ID where the current document is shared and the version shared with that account.\n"]
type nonrec describe_document_permission_response =
  {
  next_token: string option ;
  account_sharing_info_list: account_sharing_info list option ;
  account_ids: string list option }[@@ocaml.doc ""]
type nonrec describe_document_permission_request =
  {
  next_token: string option ;
  max_results: int option ;
  permission_type: document_permission_type ;
  name: string }[@@ocaml.doc ""]
type nonrec describe_available_patches_result =
  {
  next_token: string option ;
  patches: patch list option }[@@ocaml.doc ""]
type nonrec describe_available_patches_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: patch_orchestrator_filter list option }[@@ocaml.doc ""]
type nonrec describe_automation_step_executions_result =
  {
  next_token: string option ;
  step_executions: step_execution list option }[@@ocaml.doc ""]
type nonrec describe_automation_step_executions_request =
  {
  reverse_order: bool option ;
  max_results: int option ;
  next_token: string option ;
  filters: step_execution_filter list option ;
  automation_execution_id: string }[@@ocaml.doc ""]
type nonrec automation_type =
  | Local 
  | CrossAccount [@@ocaml.doc ""]
type nonrec automation_execution_metadata =
  {
  change_request_name: string option ;
  association_id: string option ;
  ops_item_id: string option ;
  runbooks: runbook list option ;
  scheduled_time: CoreTypes.Timestamp.t option ;
  automation_subtype: automation_subtype option ;
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  automation_type: automation_type option ;
  target: string option ;
  max_errors: string option ;
  max_concurrency: string option ;
  resolved_targets: resolved_targets option ;
  target_maps: target_map list option ;
  targets: target list option ;
  target_parameter_name: string option ;
  failure_message: string option ;
  current_action: string option ;
  current_step_name: string option ;
  parent_automation_execution_id: string option ;
  mode: execution_mode option ;
  outputs: automation_parameter_map option ;
  log_file: string option ;
  executed_by: string option ;
  execution_end_time: CoreTypes.Timestamp.t option ;
  execution_start_time: CoreTypes.Timestamp.t option ;
  automation_execution_status: automation_execution_status option ;
  document_version: string option ;
  document_name: string option ;
  automation_execution_id: string option }[@@ocaml.doc
                                            "Details about a specific Automation execution.\n"]
type nonrec describe_automation_executions_result =
  {
  next_token: string option ;
  automation_execution_metadata_list:
    automation_execution_metadata list option }[@@ocaml.doc ""]
type nonrec automation_execution_filter_key =
  | OPS_ITEM_ID 
  | AUTOMATION_SUBTYPE 
  | TARGET_RESOURCE_GROUP 
  | TAG_KEY 
  | AUTOMATION_TYPE 
  | START_TIME_AFTER 
  | START_TIME_BEFORE 
  | CURRENT_ACTION 
  | PARENT_EXECUTION_ID 
  | EXECUTION_ID 
  | EXECUTION_STATUS 
  | DOCUMENT_NAME_PREFIX [@@ocaml.doc ""]
type nonrec automation_execution_filter =
  {
  values: string list ;
  key: automation_execution_filter_key }[@@ocaml.doc
                                          "A filter used to match specific automation executions. This is used to limit the scope of Automation execution information returned.\n"]
type nonrec describe_automation_executions_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: automation_execution_filter list option }[@@ocaml.doc ""]
type nonrec describe_association_result =
  {
  association_description: association_description option }[@@ocaml.doc ""]
type nonrec describe_association_request =
  {
  association_version: string option ;
  association_id: string option ;
  instance_id: string option ;
  name: string option }[@@ocaml.doc ""]
type nonrec association_execution =
  {
  triggered_alarms: alarm_state_information list option ;
  alarm_configuration: alarm_configuration option ;
  resource_count_by_status: string option ;
  last_execution_date: CoreTypes.Timestamp.t option ;
  created_time: CoreTypes.Timestamp.t option ;
  detailed_status: string option ;
  status: string option ;
  execution_id: string option ;
  association_version: string option ;
  association_id: string option }[@@ocaml.doc
                                   "Includes information about the specified association.\n"]
type nonrec describe_association_executions_result =
  {
  next_token: string option ;
  association_executions: association_execution list option }[@@ocaml.doc ""]
type nonrec association_execution_filter_key =
  | CreatedTime 
  | Status 
  | ExecutionId [@@ocaml.doc ""]
type nonrec association_filter_operator_type =
  | GreaterThan 
  | LessThan 
  | Equal [@@ocaml.doc ""]
type nonrec association_execution_filter =
  {
  type_: association_filter_operator_type ;
  value: string ;
  key: association_execution_filter_key }[@@ocaml.doc
                                           "Filters used in the request.\n"]
type nonrec describe_association_executions_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: association_execution_filter list option ;
  association_id: string }[@@ocaml.doc ""]
type nonrec association_execution_target =
  {
  output_source: output_source option ;
  last_execution_date: CoreTypes.Timestamp.t option ;
  detailed_status: string option ;
  status: string option ;
  resource_type: string option ;
  resource_id: string option ;
  execution_id: string option ;
  association_version: string option ;
  association_id: string option }[@@ocaml.doc
                                   "Includes information about the specified association execution.\n"]
type nonrec describe_association_execution_targets_result =
  {
  next_token: string option ;
  association_execution_targets: association_execution_target list option }
[@@ocaml.doc ""]
type nonrec association_execution_targets_filter_key =
  | ResourceType 
  | ResourceId 
  | Status [@@ocaml.doc ""]
type nonrec association_execution_targets_filter =
  {
  value: string ;
  key: association_execution_targets_filter_key }[@@ocaml.doc
                                                   "Filters for the association execution.\n"]
type nonrec describe_association_execution_targets_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: association_execution_targets_filter list option ;
  execution_id: string ;
  association_id: string }[@@ocaml.doc ""]
type nonrec association_execution_does_not_exist = {
  message: string option }[@@ocaml.doc
                            "The specified execution ID doesn't exist. Verify the ID number and try again.\n"]
type nonrec activation =
  {
  tags: tag list option ;
  created_date: CoreTypes.Timestamp.t option ;
  expired: bool option ;
  expiration_date: CoreTypes.Timestamp.t option ;
  registrations_count: int option ;
  registration_limit: int option ;
  iam_role: string option ;
  default_instance_name: string option ;
  description: string option ;
  activation_id: string option }[@@ocaml.doc
                                  "An activation registers one or more on-premises servers or virtual machines (VMs) with Amazon Web Services so that you can configure those servers or VMs using Run Command. A server or VM that has been registered with Amazon Web Services Systems Manager is called a managed node.\n"]
type nonrec describe_activations_result =
  {
  next_token: string option ;
  activation_list: activation list option }[@@ocaml.doc ""]
type nonrec describe_activations_filter_keys =
  | IAM_ROLE 
  | DEFAULT_INSTANCE_NAME 
  | ACTIVATION_IDS [@@ocaml.doc ""]
type nonrec describe_activations_filter =
  {
  filter_values: string list option ;
  filter_key: describe_activations_filter_keys option }[@@ocaml.doc
                                                         "Filter for the DescribeActivation API.\n"]
type nonrec describe_activations_request =
  {
  next_token: string option ;
  max_results: int option ;
  filters: describe_activations_filter list option }[@@ocaml.doc ""]
type nonrec deregister_task_from_maintenance_window_result =
  {
  window_task_id: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec deregister_task_from_maintenance_window_request =
  {
  window_task_id: string ;
  window_id: string }[@@ocaml.doc ""]
type nonrec deregister_target_from_maintenance_window_result =
  {
  window_target_id: string option ;
  window_id: string option }[@@ocaml.doc ""]
type nonrec deregister_target_from_maintenance_window_request =
  {
  safe: bool option ;
  window_target_id: string ;
  window_id: string }[@@ocaml.doc ""]
type nonrec deregister_patch_baseline_for_patch_group_result =
  {
  patch_group: string option ;
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec deregister_patch_baseline_for_patch_group_request =
  {
  patch_group: string ;
  baseline_id: string }[@@ocaml.doc ""]
type nonrec deregister_managed_instance_result = unit
type nonrec deregister_managed_instance_request = {
  instance_id: string }[@@ocaml.doc ""]
type nonrec delete_resource_policy_response = unit
type nonrec delete_resource_policy_request =
  {
  policy_hash: string ;
  policy_id: string ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_resource_data_sync_result = unit
type nonrec delete_resource_data_sync_request =
  {
  sync_type: string option ;
  sync_name: string }[@@ocaml.doc ""]
type nonrec delete_patch_baseline_result = {
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec delete_patch_baseline_request = {
  baseline_id: string }[@@ocaml.doc ""]
type nonrec delete_parameters_result =
  {
  invalid_parameters: string list option ;
  deleted_parameters: string list option }[@@ocaml.doc ""]
type nonrec delete_parameters_request = {
  names: string list }[@@ocaml.doc ""]
type nonrec delete_parameter_result = unit
type nonrec delete_parameter_request = {
  name: string }[@@ocaml.doc ""]
type nonrec delete_ops_metadata_result = unit
type nonrec delete_ops_metadata_request = {
  ops_metadata_arn: string }[@@ocaml.doc ""]
type nonrec delete_ops_item_response = unit
type nonrec delete_ops_item_request = {
  ops_item_id: string }[@@ocaml.doc ""]
type nonrec delete_maintenance_window_result = {
  window_id: string option }[@@ocaml.doc ""]
type nonrec delete_maintenance_window_request = {
  window_id: string }[@@ocaml.doc ""]
type nonrec delete_inventory_result =
  {
  deletion_summary: inventory_deletion_summary option ;
  type_name: string option ;
  deletion_id: string option }[@@ocaml.doc ""]
type nonrec delete_inventory_request =
  {
  client_token: string option ;
  dry_run: bool option ;
  schema_delete_option: inventory_schema_delete_option option ;
  type_name: string }[@@ocaml.doc ""]
type nonrec delete_document_result = unit
type nonrec delete_document_request =
  {
  force: bool option ;
  version_name: string option ;
  document_version: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec associated_instances = unit
type nonrec delete_association_result = unit
type nonrec delete_association_request =
  {
  association_id: string option ;
  instance_id: string option ;
  name: string option }[@@ocaml.doc ""]
type nonrec delete_activation_result = unit
type nonrec delete_activation_request = {
  activation_id: string }[@@ocaml.doc ""]
type nonrec create_resource_data_sync_result = unit
type nonrec create_resource_data_sync_request =
  {
  sync_source: resource_data_sync_source option ;
  sync_type: string option ;
  s3_destination: resource_data_sync_s3_destination option ;
  sync_name: string }[@@ocaml.doc ""]
type nonrec create_patch_baseline_result = {
  baseline_id: string option }[@@ocaml.doc ""]
type nonrec create_patch_baseline_request =
  {
  tags: tag list option ;
  client_token: string option ;
  sources: patch_source list option ;
  description: string option ;
  rejected_patches_action: patch_action option ;
  rejected_patches: string list option ;
  approved_patches_enable_non_security: bool option ;
  approved_patches_compliance_level: patch_compliance_level option ;
  approved_patches: string list option ;
  approval_rules: patch_rule_group option ;
  global_filters: patch_filter_group option ;
  name: string ;
  operating_system: operating_system option }[@@ocaml.doc ""]
type nonrec create_ops_metadata_result = {
  ops_metadata_arn: string option }[@@ocaml.doc ""]
type nonrec create_ops_metadata_request =
  {
  tags: tag list option ;
  metadata: metadata_map option ;
  resource_id: string }[@@ocaml.doc ""]
type nonrec create_ops_item_response =
  {
  ops_item_arn: string option ;
  ops_item_id: string option }[@@ocaml.doc ""]
type nonrec create_ops_item_request =
  {
  account_id: string option ;
  planned_end_time: CoreTypes.Timestamp.t option ;
  planned_start_time: CoreTypes.Timestamp.t option ;
  actual_end_time: CoreTypes.Timestamp.t option ;
  actual_start_time: CoreTypes.Timestamp.t option ;
  severity: string option ;
  category: string option ;
  tags: tag list option ;
  title: string ;
  source: string ;
  related_ops_items: related_ops_item list option ;
  priority: int option ;
  notifications: ops_item_notification list option ;
  operational_data: ops_item_operational_data option ;
  ops_item_type: string option ;
  description: string }[@@ocaml.doc ""]
type nonrec create_maintenance_window_result = {
  window_id: string option }[@@ocaml.doc ""]
type nonrec create_maintenance_window_request =
  {
  tags: tag list option ;
  client_token: string option ;
  allow_unassociated_targets: bool ;
  cutoff: int ;
  duration: int ;
  schedule_offset: int option ;
  schedule_timezone: string option ;
  schedule: string ;
  end_date: string option ;
  start_date: string option ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_document_result =
  {
  document_description: document_description option }[@@ocaml.doc ""]
type nonrec create_document_request =
  {
  tags: tag list option ;
  target_type: string option ;
  document_format: document_format option ;
  document_type: document_type option ;
  version_name: string option ;
  display_name: string option ;
  name: string ;
  attachments: attachments_source list option ;
  requires: document_requires list option ;
  content: string }[@@ocaml.doc ""]
type nonrec create_association_result =
  {
  association_description: association_description option }[@@ocaml.doc ""]
type nonrec create_association_request =
  {
  alarm_configuration: alarm_configuration option ;
  tags: tag list option ;
  target_maps: target_map list option ;
  duration: int option ;
  schedule_offset: int option ;
  target_locations: target_location list option ;
  calendar_names: string list option ;
  apply_only_at_cron_interval: bool option ;
  sync_compliance: association_sync_compliance option ;
  compliance_severity: association_compliance_severity option ;
  max_concurrency: string option ;
  max_errors: string option ;
  automation_target_parameter_name: string option ;
  association_name: string option ;
  output_location: instance_association_output_location option ;
  schedule_expression: string option ;
  targets: target list option ;
  parameters: parameters option ;
  instance_id: string option ;
  document_version: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_association_batch_result =
  {
  failed: failed_create_association list option ;
  successful: association_description list option }[@@ocaml.doc ""]
type nonrec create_association_batch_request =
  {
  entries: create_association_batch_request_entry list }[@@ocaml.doc ""]
type nonrec association_limit_exceeded = unit
type nonrec association_already_exists = unit
type nonrec create_activation_result =
  {
  activation_code: string option ;
  activation_id: string option }[@@ocaml.doc ""]
type nonrec create_activation_request =
  {
  registration_metadata: registration_metadata_item list option ;
  tags: tag list option ;
  expiration_date: CoreTypes.Timestamp.t option ;
  registration_limit: int option ;
  iam_role: string ;
  default_instance_name: string option ;
  description: string option }[@@ocaml.doc ""]
type nonrec cancel_maintenance_window_execution_result =
  {
  window_execution_id: string option }[@@ocaml.doc ""]
type nonrec cancel_maintenance_window_execution_request =
  {
  window_execution_id: string }[@@ocaml.doc ""]
type nonrec cancel_command_result = unit
type nonrec cancel_command_request =
  {
  instance_ids: string list option ;
  command_id: string }[@@ocaml.doc "\n"]
type nonrec associate_ops_item_related_item_response =
  {
  association_id: string option }[@@ocaml.doc ""]
type nonrec associate_ops_item_related_item_request =
  {
  resource_uri: string ;
  resource_type: string ;
  association_type: string ;
  ops_item_id: string }[@@ocaml.doc ""]
type nonrec add_tags_to_resource_result = unit
type nonrec add_tags_to_resource_request =
  {
  tags: tag list ;
  resource_id: string ;
  resource_type: resource_type_for_tagging }[@@ocaml.doc ""]