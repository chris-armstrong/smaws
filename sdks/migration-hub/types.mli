open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec unauthorized_operation = {
  message: string option }[@@ocaml.doc
                            "Exception raised to indicate a request was not authorized when the [DryRun] flag is set to \"true\".\n"]
type nonrec throttling_exception =
  {
  retry_after_seconds: int option ;
  message: string }[@@ocaml.doc
                     "The request was denied due to request throttling.\n"]
type nonrec status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | NOT_STARTED [@@ocaml.doc ""]
type nonrec task =
  {
  progress_percent: int option ;
  status_detail: string option ;
  status: status }[@@ocaml.doc
                    "Task object encapsulating task information.\n"]
type nonrec service_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "Exception raised when there is an internal, configuration, or dependency error encountered.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Exception raised when the request references a resource (Application Discovery Service configuration, update stream, migration task, etc.) that does not exist in Application Discovery Service (Application Discovery Service) or in Migration Hub's repository.\n"]
type nonrec resource_attribute_type =
  | MOTHERBOARD_SERIAL_NUMBER 
  | BIOS_ID 
  | VM_PATH 
  | VM_NAME 
  | VM_MANAGED_OBJECT_REFERENCE 
  | VM_MANAGER_ID 
  | FQDN 
  | MAC_ADDRESS 
  | IPV6_ADDRESS 
  | IPV4_ADDRESS [@@ocaml.doc ""]
type nonrec resource_attribute =
  {
  value: string ;
  type_: resource_attribute_type }[@@ocaml.doc
                                    "Attribute associated with a resource.\n\n Note the corresponding format required per type listed below:\n \n   IPV4   [x.x.x.x] \n         \n           {i where x is an integer in the range \\[0,255\\]} \n          \n            IPV6   [y : y : y : y : y : y : y : y] \n                  \n                    {i where y is a hexadecimal between 0 and FFFF. \\[0, FFFF\\]} \n                   \n                     MAC_ADDRESS   [^(\\[0-9A-Fa-f\\]{2}\\[:-\\]){5}(\\[0-9A-Fa-f\\]{2})$] \n                                  \n                                    FQDN   [^\\[^<>{}\\\\\\\\/?,=\\\\p{Cntrl}\\]{1,256}$] \n                                          \n                                            "]
type nonrec put_resource_attributes_result = unit
type nonrec put_resource_attributes_request =
  {
  dry_run: bool option ;
  resource_attribute_list: resource_attribute list ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec invalid_input_exception = {
  message: string option }[@@ocaml.doc
                            "Exception raised when the provided input violates a policy constraint or is entered in the wrong format or data type.\n"]
type nonrec internal_server_error = {
  message: string option }[@@ocaml.doc
                            "Exception raised when an internal, configuration, or dependency error is encountered.\n"]
type nonrec home_region_not_set_exception = {
  message: string option }[@@ocaml.doc
                            "The home region is not set. Set the home region to continue.\n"]
type nonrec dry_run_operation = {
  message: string option }[@@ocaml.doc
                            "Exception raised to indicate a successfully authorized action when the [DryRun] flag is set to \"true\".\n"]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "You do not have sufficient access to perform this action.\n"]
type nonrec progress_update_stream_summary =
  {
  progress_update_stream_name: string option }[@@ocaml.doc
                                                "Summary of the AWS resource used for access control that is implicitly linked to your AWS account.\n"]
type nonrec policy_error_exception = {
  message: string option }[@@ocaml.doc
                            "Exception raised when there are problems accessing Application Discovery Service (Application Discovery Service); most likely due to a misconfigured policy or the [migrationhub-discovery] role is missing or not configured correctly.\n"]
type nonrec notify_migration_task_state_result = unit
type nonrec notify_migration_task_state_request =
  {
  dry_run: bool option ;
  next_update_seconds: int ;
  update_date_time: CoreTypes.Timestamp.t ;
  task: task ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec notify_application_state_result = unit
type nonrec application_status =
  | COMPLETED 
  | IN_PROGRESS 
  | NOT_STARTED [@@ocaml.doc ""]
type nonrec notify_application_state_request =
  {
  dry_run: bool option ;
  update_date_time: CoreTypes.Timestamp.t option ;
  status: application_status ;
  application_id: string }[@@ocaml.doc ""]
type nonrec migration_task_summary =
  {
  update_date_time: CoreTypes.Timestamp.t option ;
  status_detail: string option ;
  progress_percent: int option ;
  status: status option ;
  migration_task_name: string option ;
  progress_update_stream: string option }[@@ocaml.doc
                                           "MigrationTaskSummary includes [MigrationTaskName], [ProgressPercent], [ProgressUpdateStream], [Status], and [UpdateDateTime] for each task.\n"]
type nonrec migration_task =
  {
  resource_attribute_list: resource_attribute list option ;
  update_date_time: CoreTypes.Timestamp.t option ;
  task: task option ;
  migration_task_name: string option ;
  progress_update_stream: string option }[@@ocaml.doc
                                           "Represents a migration task in a migration tool.\n"]
type nonrec list_progress_update_streams_result =
  {
  next_token: string option ;
  progress_update_stream_summary_list:
    progress_update_stream_summary list option }[@@ocaml.doc ""]
type nonrec list_progress_update_streams_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_migration_tasks_result =
  {
  migration_task_summary_list: migration_task_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_migration_tasks_request =
  {
  resource_name: string option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec discovered_resource =
  {
  description: string option ;
  configuration_id: string }[@@ocaml.doc
                              "Object representing the on-premises resource being migrated.\n"]
type nonrec list_discovered_resources_result =
  {
  discovered_resource_list: discovered_resource list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_discovered_resources_request =
  {
  max_results: int option ;
  next_token: string option ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec created_artifact = {
  description: string option ;
  name: string }[@@ocaml.doc
                  "An ARN of the AWS cloud resource target receiving the migration (e.g., AMI, EC2 instance, RDS instance, etc.).\n"]
type nonrec list_created_artifacts_result =
  {
  created_artifact_list: created_artifact list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_created_artifacts_request =
  {
  max_results: int option ;
  next_token: string option ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec application_state =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  application_status: application_status option ;
  application_id: string option }[@@ocaml.doc
                                   "The state of an application discovered through Migration Hub import, the AWS Agentless Discovery Connector, or the AWS Application Discovery Agent.\n"]
type nonrec list_application_states_result =
  {
  next_token: string option ;
  application_state_list: application_state list option }[@@ocaml.doc ""]
type nonrec list_application_states_request =
  {
  max_results: int option ;
  next_token: string option ;
  application_ids: string list option }[@@ocaml.doc ""]
type nonrec import_migration_task_result = unit
type nonrec import_migration_task_request =
  {
  dry_run: bool option ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec disassociate_discovered_resource_result = unit
type nonrec disassociate_discovered_resource_request =
  {
  dry_run: bool option ;
  configuration_id: string ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec disassociate_created_artifact_result = unit
type nonrec disassociate_created_artifact_request =
  {
  dry_run: bool option ;
  created_artifact_name: string ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec describe_migration_task_result =
  {
  migration_task: migration_task option }[@@ocaml.doc ""]
type nonrec describe_migration_task_request =
  {
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec describe_application_state_result =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  application_status: application_status option }[@@ocaml.doc ""]
type nonrec describe_application_state_request = {
  application_id: string }[@@ocaml.doc ""]
type nonrec delete_progress_update_stream_result = unit
type nonrec delete_progress_update_stream_request =
  {
  dry_run: bool option ;
  progress_update_stream_name: string }[@@ocaml.doc ""]
type nonrec create_progress_update_stream_result = unit
type nonrec create_progress_update_stream_request =
  {
  dry_run: bool option ;
  progress_update_stream_name: string }[@@ocaml.doc ""]
type nonrec associate_discovered_resource_result = unit
type nonrec associate_discovered_resource_request =
  {
  dry_run: bool option ;
  discovered_resource: discovered_resource ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]
type nonrec associate_created_artifact_result = unit
type nonrec associate_created_artifact_request =
  {
  dry_run: bool option ;
  created_artifact: created_artifact ;
  migration_task_name: string ;
  progress_update_stream: string }[@@ocaml.doc ""]