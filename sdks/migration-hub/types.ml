open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "mgh";
      endpointPrefix = "mgh";
      version = "2017-05-31";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec update_date_time = unit
type nonrec error_message = unit
type nonrec unauthorized_operation = {
  message: string option }
type nonrec token = unit
type nonrec retry_after_seconds = unit
type nonrec throttling_exception =
  {
  retry_after_seconds: int option ;
  message: string }
type nonrec base_unit = unit
type nonrec status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | NOT_STARTED 
type nonrec status_detail = unit
type nonrec progress_percent = unit
type nonrec task =
  {
  progress_percent: int option ;
  status_detail: string option ;
  status: status }
type nonrec service_unavailable_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource_name = unit
type nonrec resource_attribute_value = unit
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
  | IPV4_ADDRESS 
type nonrec resource_attribute =
  {
  value: string ;
  type_: resource_attribute_type }
type nonrec resource_attribute_list = unit
type nonrec put_resource_attributes_result = unit
type nonrec progress_update_stream = unit
type nonrec migration_task_name = unit
type nonrec dry_run = unit
type nonrec put_resource_attributes_request =
  {
  dry_run: bool option ;
  resource_attribute_list: resource_attribute list ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec invalid_input_exception = {
  message: string option }
type nonrec internal_server_error = {
  message: string option }
type nonrec home_region_not_set_exception = {
  message: string option }
type nonrec dry_run_operation = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec progress_update_stream_summary =
  {
  progress_update_stream_name: string option }
type nonrec progress_update_stream_summary_list = unit
type nonrec policy_error_exception = {
  message: string option }
type nonrec notify_migration_task_state_result = unit
type nonrec next_update_seconds = unit
type nonrec notify_migration_task_state_request =
  {
  dry_run: bool option ;
  next_update_seconds: int ;
  update_date_time: Timestamp.t ;
  task: task ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec notify_application_state_result = unit
type nonrec application_id = unit
type nonrec application_status =
  | COMPLETED 
  | IN_PROGRESS 
  | NOT_STARTED 
type nonrec notify_application_state_request =
  {
  dry_run: bool option ;
  update_date_time: Timestamp.t option ;
  status: application_status ;
  application_id: string }
type nonrec migration_task_summary =
  {
  update_date_time: Timestamp.t option ;
  status_detail: string option ;
  progress_percent: int option ;
  status: status option ;
  migration_task_name: string option ;
  progress_update_stream: string option }
type nonrec migration_task_summary_list = unit
type nonrec latest_resource_attribute_list = unit
type nonrec migration_task =
  {
  resource_attribute_list: resource_attribute list option ;
  update_date_time: Timestamp.t option ;
  task: task option ;
  migration_task_name: string option ;
  progress_update_stream: string option }
type nonrec max_results_resources = unit
type nonrec max_results_created_artifacts = unit
type nonrec max_results = unit
type nonrec list_progress_update_streams_result =
  {
  next_token: string option ;
  progress_update_stream_summary_list:
    progress_update_stream_summary list option }
type nonrec list_progress_update_streams_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec list_migration_tasks_result =
  {
  migration_task_summary_list: migration_task_summary list option ;
  next_token: string option }
type nonrec list_migration_tasks_request =
  {
  resource_name: string option ;
  max_results: int option ;
  next_token: string option }
type nonrec configuration_id = unit
type nonrec discovered_resource_description = unit
type nonrec discovered_resource =
  {
  description: string option ;
  configuration_id: string }
type nonrec discovered_resource_list = unit
type nonrec list_discovered_resources_result =
  {
  discovered_resource_list: discovered_resource list option ;
  next_token: string option }
type nonrec list_discovered_resources_request =
  {
  max_results: int option ;
  next_token: string option ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec created_artifact_name = unit
type nonrec created_artifact_description = unit
type nonrec created_artifact = {
  description: string option ;
  name: string }
type nonrec created_artifact_list = unit
type nonrec list_created_artifacts_result =
  {
  created_artifact_list: created_artifact list option ;
  next_token: string option }
type nonrec list_created_artifacts_request =
  {
  max_results: int option ;
  next_token: string option ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec application_state =
  {
  last_updated_time: Timestamp.t option ;
  application_status: application_status option ;
  application_id: string option }
type nonrec application_state_list = unit
type nonrec list_application_states_result =
  {
  next_token: string option ;
  application_state_list: application_state list option }
type nonrec application_ids = unit
type nonrec list_application_states_request =
  {
  max_results: int option ;
  next_token: string option ;
  application_ids: string list option }
type nonrec import_migration_task_result = unit
type nonrec import_migration_task_request =
  {
  dry_run: bool option ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec disassociate_discovered_resource_result = unit
type nonrec disassociate_discovered_resource_request =
  {
  dry_run: bool option ;
  configuration_id: string ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec disassociate_created_artifact_result = unit
type nonrec disassociate_created_artifact_request =
  {
  dry_run: bool option ;
  created_artifact_name: string ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec describe_migration_task_result =
  {
  migration_task: migration_task option }
type nonrec describe_migration_task_request =
  {
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec describe_application_state_result =
  {
  last_updated_time: Timestamp.t option ;
  application_status: application_status option }
type nonrec describe_application_state_request = {
  application_id: string }
type nonrec delete_progress_update_stream_result = unit
type nonrec delete_progress_update_stream_request =
  {
  dry_run: bool option ;
  progress_update_stream_name: string }
type nonrec create_progress_update_stream_result = unit
type nonrec create_progress_update_stream_request =
  {
  dry_run: bool option ;
  progress_update_stream_name: string }
type nonrec associate_discovered_resource_result = unit
type nonrec associate_discovered_resource_request =
  {
  dry_run: bool option ;
  discovered_resource: discovered_resource ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec associate_created_artifact_result = unit
type nonrec associate_created_artifact_request =
  {
  dry_run: bool option ;
  created_artifact: created_artifact ;
  migration_task_name: string ;
  progress_update_stream: string }
type nonrec aws_migration_hub = unit
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit