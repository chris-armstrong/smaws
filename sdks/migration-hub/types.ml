open Smaws_Lib
type nonrec update_type =
  | MigrationTaskStateUpdated [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec unauthorized_operation = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised to indicate a request was not authorized when the [DryRun] flag is set to \"true\".\n"]
type nonrec throttling_exception =
  {
  retry_after_seconds: int option
    [@ocaml.doc
      "The number of seconds the caller should wait before retrying.\n"];
  message: string
    [@ocaml.doc "A message that provides information about the exception.\n"]}
[@@ocaml.doc "The request was denied due to request throttling.\n"]
type nonrec status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec task =
  {
  progress_percent: int option
    [@ocaml.doc "Indication of the percentage completion of the task.\n"];
  status_detail: string option
    [@ocaml.doc
      "Details of task status as notified by a migration tool. A tool might use this field to provide clarifying information about the status that is unique to that tool or that explains an error state.\n"];
  status: status
    [@ocaml.doc "Status of the task - Not Started, In-Progress, Complete.\n"]}
[@@ocaml.doc "Task object encapsulating task information.\n"]
type nonrec source_resource =
  {
  status_detail: string option
    [@ocaml.doc "A free-form description of the status of the resource.\n"];
  description: string option
    [@ocaml.doc
      "A description that can be free-form text to record additional detail about the resource for clarity or later reference.\n"];
  name: string
    [@ocaml.doc
      "This is the name that you want to use to identify the resource. If the resource is an AWS resource, we recommend that you set this parameter to the ARN of the resource.\n"]}
[@@ocaml.doc
  "A source resource can be a source server, a migration wave, an application, or any other resource that you track.\n"]
type nonrec service_unavailable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised when there is an internal, configuration, or dependency error encountered.\n"]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised when the request references a resource (Application Discovery Service configuration, update stream, migration task, etc.) that does not exist in Application Discovery Service (Application Discovery Service) or in Migration Hub's repository.\n"]
type nonrec resource_attribute_type =
  | MOTHERBOARD_SERIAL_NUMBER [@ocaml.doc ""]
  | BIOS_ID [@ocaml.doc ""]
  | VM_PATH [@ocaml.doc ""]
  | VM_NAME [@ocaml.doc ""]
  | VM_MANAGED_OBJECT_REFERENCE [@ocaml.doc ""]
  | VM_MANAGER_ID [@ocaml.doc ""]
  | FQDN [@ocaml.doc ""]
  | MAC_ADDRESS [@ocaml.doc ""]
  | IPV6_ADDRESS [@ocaml.doc ""]
  | IPV4_ADDRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_attribute =
  {
  value: string [@ocaml.doc "Value of the resource type.\n"];
  type_: resource_attribute_type [@ocaml.doc "Type of resource.\n"]}[@@ocaml.doc
                                                                    "Attribute associated with a resource.\n\n Note the corresponding format required per type listed below:\n \n   IPV4   [x.x.x.x] \n         \n           {i where x is an integer in the range \\[0,255\\]} \n          \n            IPV6   [y : y : y : y : y : y : y : y] \n                  \n                    {i where y is a hexadecimal between 0 and FFFF. \\[0, FFFF\\]} \n                   \n                     MAC_ADDRESS   [^(\\[0-9A-Fa-f\\]{2}\\[:-\\]){5}(\\[0-9A-Fa-f\\]{2})$] \n                                  \n                                    FQDN   [^\\[^<>{}\\\\\\\\/?,=\\\\p{Cntrl}\\]{1,256}$] \n                                          \n                                            "]
type nonrec put_resource_attributes_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  resource_attribute_list: resource_attribute list
    [@ocaml.doc
      "Information about the resource that is being migrated. This data will be used to map the task to a resource in the Application Discovery Service repository.\n\n  Takes the object array of [ResourceAttribute] where the [Type] field is reserved for the following values: [IPV4_ADDRESS | IPV6_ADDRESS |\n               MAC_ADDRESS | FQDN | VM_MANAGER_ID | VM_MANAGED_OBJECT_REFERENCE | VM_NAME | VM_PATH\n               | BIOS_ID | MOTHERBOARD_SERIAL_NUMBER] where the identifying value can be a string up to 256 characters.\n  \n     {ul\n           {-  If any \"VM\" related value is set for a [ResourceAttribute] object, it is required that [VM_MANAGER_ID], as a minimum, is always set. If [VM_MANAGER_ID] is not set, then all \"VM\" fields will be discarded and \"VM\" fields will not be used for matching the migration task to a server in Application Discovery Service repository. See the {{:https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#API_PutResourceAttributes_Examples}Example} section below for a use case of specifying \"VM\" related values.\n               \n                }\n           {-   If a server you are trying to match has multiple IP or MAC addresses, you should provide as many as you know in separate type/value pairs passed to the [ResourceAttributeList] parameter to maximize the chances of matching.\n               \n                }\n           }\n   "];
  migration_task_name: string
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. \n"]}[@@ocaml.doc ""]
type nonrec invalid_input_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised when the provided input violates a policy constraint or is entered in the wrong format or data type.\n"]
type nonrec internal_server_error = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised when an internal, configuration, or dependency error is encountered.\n"]
type nonrec home_region_not_set_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The home region is not set. Set the home region to continue.\n"]
type nonrec dry_run_operation = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised to indicate a successfully authorized action when the [DryRun] flag is set to \"true\".\n"]
type nonrec access_denied_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You do not have sufficient access to perform this action.\n"]
type nonrec progress_update_stream_summary =
  {
  progress_update_stream_name: string option
    [@ocaml.doc
      "The name of the ProgressUpdateStream. {i Do not store personal data in this field.} \n"]}
[@@ocaml.doc
  "Summary of the AWS resource used for access control that is implicitly linked to your AWS account.\n"]
type nonrec policy_error_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception raised when there are problems accessing Application Discovery Service (Application Discovery Service); most likely due to a misconfigured policy or the [migrationhub-discovery] role is missing or not configured correctly.\n"]
type nonrec notify_migration_task_state_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  next_update_seconds: int
    [@ocaml.doc
      "Number of seconds after the UpdateDateTime within which the Migration Hub can expect an update. If Migration Hub does not receive an update within the specified interval, then the migration task will be considered stale.\n"];
  update_date_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The timestamp when the task was gathered.\n"];
  task: task
    [@ocaml.doc "Information about the task's progress and status.\n"];
  migration_task_name: string
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. \n"]}[@@ocaml.doc ""]
type nonrec application_status =
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec notify_application_state_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  update_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the application state changed.\n"];
  status: application_status
    [@ocaml.doc
      "Status of the application - Not Started, In-Progress, Complete.\n"];
  application_id: string
    [@ocaml.doc
      "The configurationId in Application Discovery Service that uniquely identifies the grouped application.\n"]}
[@@ocaml.doc ""]
type nonrec migration_task_update =
  {
  migration_task_state: task option [@ocaml.doc ""];
  update_type: update_type option [@ocaml.doc "The type of the update.\n"];
  update_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp for the update.\n"]}[@@ocaml.doc
                                                     "A migration-task progress update.\n"]
type nonrec migration_task_summary =
  {
  update_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the task was gathered.\n"];
  status_detail: string option
    [@ocaml.doc
      "Detail information of what is being done within the overall status state.\n"];
  progress_percent: int option
    [@ocaml.doc "Indication of the percentage completion of the task.\n"];
  status: status option [@ocaml.doc "Status of the task.\n"];
  migration_task_name: string option
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string option
    [@ocaml.doc
      "An AWS resource used for access control. It should uniquely identify the migration tool as it is used for all updates made by the tool.\n"]}
[@@ocaml.doc
  "MigrationTaskSummary includes [MigrationTaskName], [ProgressPercent], [ProgressUpdateStream], [Status], and [UpdateDateTime] for each task.\n"]
type nonrec migration_task =
  {
  resource_attribute_list: resource_attribute list option
    [@ocaml.doc
      "Information about the resource that is being migrated. This data will be used to map the task to a resource in the Application Discovery Service repository.\n"];
  update_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the task was gathered.\n"];
  task: task option
    [@ocaml.doc "Task object encapsulating task information.\n"];
  migration_task_name: string option
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string option
    [@ocaml.doc
      "A name that identifies the vendor of the migration tool being used.\n"]}
[@@ocaml.doc "Represents a migration task in a migration tool.\n"]
type nonrec list_source_resources_result =
  {
  source_resource_list: source_resource list option
    [@ocaml.doc "The list of source resources.\n"];
  next_token: string option
    [@ocaml.doc
      "If the response includes a [NextToken] value, that means that there are more results available. The value of [NextToken] is a unique pagination token for each page. To retrieve the next page of results, call this API again and specify this [NextToken] value in the request. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.\n"]}
[@@ocaml.doc ""]
type nonrec list_source_resources_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the value that you specify here for [MaxResults], the response will include a token that you can use to retrieve the next set of results.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] was returned by a previous call, there are more results available. The value of [NextToken] is a unique pagination token for each page. To retrieve the next page of results, specify the [NextToken] value that the previous call returned. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.\n"];
  migration_task_name: string
    [@ocaml.doc
      "A unique identifier that references the migration task. {i Do not store confidential data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc
      "The name of the progress-update stream, which is used for access control as well as a namespace for migration-task names that is implicitly linked to your AWS account. The progress-update stream must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.\n"]}
[@@ocaml.doc ""]
type nonrec list_progress_update_streams_result =
  {
  next_token: string option
    [@ocaml.doc
      "If there are more streams created than the max result, return the next token to be passed to the next call as a bookmark of where to start from.\n"];
  progress_update_stream_summary_list:
    progress_update_stream_summary list option
    [@ocaml.doc
      "List of progress update streams up to the max number of results passed in the input.\n"]}
[@@ocaml.doc ""]
type nonrec list_progress_update_streams_request =
  {
  max_results: int option
    [@ocaml.doc
      "Filter to limit the maximum number of results to list per page.\n"];
  next_token: string option
    [@ocaml.doc
      "If a [NextToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [NextToken].\n"]}
[@@ocaml.doc ""]
type nonrec list_migration_tasks_result =
  {
  migration_task_summary_list: migration_task_summary list option
    [@ocaml.doc
      "Lists the migration task's summary which includes: [MigrationTaskName], [ProgressPercent], [ProgressUpdateStream], [Status], and the [UpdateDateTime] for each task.\n"];
  next_token: string option
    [@ocaml.doc
      "If there are more migration tasks than the max result, return the next token to be passed to the next call as a bookmark of where to start from.\n"]}
[@@ocaml.doc ""]
type nonrec list_migration_tasks_request =
  {
  resource_name: string option
    [@ocaml.doc "Filter migration tasks by discovered resource name.\n"];
  max_results: int option
    [@ocaml.doc "Value to specify how many results are returned per page.\n"];
  next_token: string option
    [@ocaml.doc
      "If a [NextToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [NextToken].\n"]}
[@@ocaml.doc ""]
type nonrec list_migration_task_updates_result =
  {
  migration_task_update_list: migration_task_update list option
    [@ocaml.doc "The list of migration-task updates.\n"];
  next_token: string option
    [@ocaml.doc
      "If the response includes a [NextToken] value, that means that there are more results available. The value of [NextToken] is a unique pagination token for each page. To retrieve the next page of results, call this API again and specify this [NextToken] value in the request. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.\n"]}
[@@ocaml.doc ""]
type nonrec list_migration_task_updates_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the value that you specify here for [MaxResults], the response will include a token that you can use to retrieve the next set of results.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] was returned by a previous call, there are more results available. The value of [NextToken] is a unique pagination token for each page. To retrieve the next page of results, specify the [NextToken] value that the previous call returned. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.\n"];
  migration_task_name: string
    [@ocaml.doc
      "A unique identifier that references the migration task. {i Do not include sensitive data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc
      "The name of the progress-update stream, which is used for access control as well as a namespace for migration-task names that is implicitly linked to your AWS account. The progress-update stream must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.\n"]}
[@@ocaml.doc ""]
type nonrec discovered_resource =
  {
  description: string option
    [@ocaml.doc
      "A description that can be free-form text to record additional detail about the discovered resource for clarity or later reference.\n"];
  configuration_id: string
    [@ocaml.doc
      "The configurationId in Application Discovery Service that uniquely identifies the on-premise resource.\n"]}
[@@ocaml.doc
  "Object representing the on-premises resource being migrated.\n"]
type nonrec list_discovered_resources_result =
  {
  discovered_resource_list: discovered_resource list option
    [@ocaml.doc
      "Returned list of discovered resources associated with the given MigrationTask.\n"];
  next_token: string option
    [@ocaml.doc
      "If there are more discovered resources than the max result, return the next token to be passed to the next call as a bookmark of where to start from.\n"]}
[@@ocaml.doc ""]
type nonrec list_discovered_resources_request =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of results returned per page.\n"];
  next_token: string option
    [@ocaml.doc
      "If a [NextToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [NextToken].\n"];
  migration_task_name: string
    [@ocaml.doc
      "The name of the MigrationTask. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream.\n"]}[@@ocaml.doc ""]
type nonrec created_artifact =
  {
  description: string option
    [@ocaml.doc
      "A description that can be free-form text to record additional detail about the artifact for clarity or for later reference.\n"];
  name: string
    [@ocaml.doc
      "An ARN that uniquely identifies the result of a migration task.\n"]}
[@@ocaml.doc
  "An ARN of the AWS cloud resource target receiving the migration (e.g., AMI, EC2 instance, RDS instance, etc.).\n"]
type nonrec list_created_artifacts_result =
  {
  created_artifact_list: created_artifact list option
    [@ocaml.doc
      "List of created artifacts up to the maximum number of results specified in the request.\n"];
  next_token: string option
    [@ocaml.doc
      "If there are more created artifacts than the max result, return the next token to be passed to the next call as a bookmark of where to start from.\n"]}
[@@ocaml.doc ""]
type nonrec list_created_artifacts_request =
  {
  max_results: int option
    [@ocaml.doc "Maximum number of results to be returned per page.\n"];
  next_token: string option
    [@ocaml.doc
      "If a [NextToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [NextToken].\n"];
  migration_task_name: string
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. \n"]}[@@ocaml.doc ""]
type nonrec application_state =
  {
  last_updated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the application status was last updated.\n"];
  application_status: application_status option
    [@ocaml.doc "The current status of an application.\n"];
  application_id: string option
    [@ocaml.doc
      "The configurationId from the Application Discovery Service that uniquely identifies an application.\n"]}
[@@ocaml.doc
  "The state of an application discovered through Migration Hub import, the AWS Agentless Discovery Connector, or the AWS Application Discovery Agent.\n"]
type nonrec list_application_states_result =
  {
  next_token: string option
    [@ocaml.doc
      "If a [NextToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [NextToken].\n"];
  application_state_list: application_state list option
    [@ocaml.doc
      "A list of Applications that exist in Application Discovery Service.\n"]}
[@@ocaml.doc ""]
type nonrec list_application_states_request =
  {
  max_results: int option
    [@ocaml.doc "Maximum number of results to be returned per page.\n"];
  next_token: string option
    [@ocaml.doc
      "If a [NextToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [NextToken].\n"];
  application_ids: string list option
    [@ocaml.doc
      "The configurationIds from the Application Discovery Service that uniquely identifies your applications.\n"]}
[@@ocaml.doc ""]
type nonrec import_migration_task_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  migration_task_name: string
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. >\n"]}[@@ocaml.doc ""]
type nonrec disassociate_source_resource_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "This is an optional parameter that you can use to test whether the call will succeed. Set this parameter to [true] to verify that you have the permissions that are required to make the call, and that you have specified the other parameters in the call correctly.\n"];
  source_resource_name: string
    [@ocaml.doc "The name that was specified for the source resource.\n"];
  migration_task_name: string
    [@ocaml.doc
      "A unique identifier that references the migration task. {i Do not include sensitive data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc
      "The name of the progress-update stream, which is used for access control as well as a namespace for migration-task names that is implicitly linked to your AWS account. The progress-update stream must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_discovered_resource_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  configuration_id: string
    [@ocaml.doc
      "ConfigurationId of the Application Discovery Service resource to be disassociated.\n"];
  migration_task_name: string
    [@ocaml.doc
      "The identifier given to the MigrationTask. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream.\n"]}[@@ocaml.doc ""]
type nonrec disassociate_created_artifact_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  created_artifact_name: string
    [@ocaml.doc
      "An ARN of the AWS resource related to the migration (e.g., AMI, EC2 instance, RDS instance, etc.)\n"];
  migration_task_name: string
    [@ocaml.doc
      "Unique identifier that references the migration task to be disassociated with the artifact. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. \n"]}[@@ocaml.doc ""]
type nonrec describe_migration_task_result =
  {
  migration_task: migration_task option
    [@ocaml.doc
      "Object encapsulating information about the migration task.\n"]}
[@@ocaml.doc ""]
type nonrec describe_migration_task_request =
  {
  migration_task_name: string
    [@ocaml.doc
      "The identifier given to the MigrationTask. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. \n"]}[@@ocaml.doc ""]
type nonrec describe_application_state_result =
  {
  last_updated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the application status was last updated.\n"];
  application_status: application_status option
    [@ocaml.doc
      "Status of the application - Not Started, In-Progress, Complete.\n"]}
[@@ocaml.doc ""]
type nonrec describe_application_state_request =
  {
  application_id: string
    [@ocaml.doc
      "The configurationId in Application Discovery Service that uniquely identifies the grouped application.\n"]}
[@@ocaml.doc ""]
type nonrec delete_progress_update_stream_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  progress_update_stream_name: string
    [@ocaml.doc
      "The name of the ProgressUpdateStream. {i Do not store personal data in this field.} \n"]}
[@@ocaml.doc ""]
type nonrec create_progress_update_stream_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  progress_update_stream_name: string
    [@ocaml.doc
      "The name of the ProgressUpdateStream. {i Do not store personal data in this field.} \n"]}
[@@ocaml.doc ""]
type nonrec associate_source_resource_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "This is an optional parameter that you can use to test whether the call will succeed. Set this parameter to [true] to verify that you have the permissions that are required to make the call, and that you have specified the other parameters in the call correctly.\n"];
  source_resource: source_resource
    [@ocaml.doc "The source resource that you want to associate.\n"];
  migration_task_name: string
    [@ocaml.doc
      "A unique identifier that references the migration task. {i Do not include sensitive data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc
      "The name of the progress-update stream, which is used for access control as well as a namespace for migration-task names that is implicitly linked to your AWS account. The progress-update stream must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.\n"]}
[@@ocaml.doc ""]
type nonrec associate_discovered_resource_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  discovered_resource: discovered_resource
    [@ocaml.doc "Object representing a Resource.\n"];
  migration_task_name: string
    [@ocaml.doc
      "The identifier given to the MigrationTask. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream.\n"]}[@@ocaml.doc ""]
type nonrec associate_created_artifact_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.\n"];
  created_artifact: created_artifact
    [@ocaml.doc
      "An ARN of the AWS resource related to the migration (e.g., AMI, EC2 instance, RDS instance, etc.) \n"];
  migration_task_name: string
    [@ocaml.doc
      "Unique identifier that references the migration task. {i Do not store personal data in this field.} \n"];
  progress_update_stream: string
    [@ocaml.doc "The name of the ProgressUpdateStream. \n"]}[@@ocaml.doc ""]