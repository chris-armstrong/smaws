open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "codeconnections";
      endpointPrefix = "codeconnections";
      version = "2023-12-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec vpc_id = unit
type nonrec subnet_id = unit
type nonrec subnet_ids = unit
type nonrec security_group_id = unit
type nonrec security_group_ids = unit
type nonrec tls_certificate = unit
type nonrec vpc_configuration =
  {
  tls_certificate: string option ;
  security_group_ids: string list ;
  subnet_ids: string list ;
  vpc_id: string }
type nonrec url = unit
type nonrec branch_name = unit
type nonrec deployment_file_path = unit
type nonrec owner_id = unit
type nonrec base_unit = unit
type nonrec provider_type =
  | GITLAB_SELF_MANAGED 
  | GITLAB 
  | GITHUB_ENTERPRISE_SERVER 
  | GITHUB 
  | BITBUCKET 
type nonrec repository_link_id = unit
type nonrec repository_name = unit
type nonrec resource_name = unit
type nonrec iam_role_arn = unit
type nonrec sync_configuration_type =
  | CFN_STACK_SYNC 
type nonrec publish_deployment_status =
  | DISABLED 
  | ENABLED 
type nonrec trigger_resource_update_on =
  | FILE_CHANGE 
  | ANY_CHANGE 
type nonrec sync_configuration =
  {
  trigger_resource_update_on: trigger_resource_update_on option ;
  publish_deployment_status: publish_deployment_status option ;
  sync_type: sync_configuration_type ;
  role_arn: string ;
  resource_name: string ;
  repository_name: string ;
  repository_link_id: string ;
  provider_type: provider_type ;
  owner_id: string ;
  config_file: string option ;
  branch: string }
type nonrec update_sync_configuration_output =
  {
  sync_configuration: sync_configuration }
type nonrec update_sync_configuration_input =
  {
  trigger_resource_update_on: trigger_resource_update_on option ;
  publish_deployment_status: publish_deployment_status option ;
  sync_type: sync_configuration_type ;
  role_arn: string option ;
  resource_name: string ;
  repository_link_id: string option ;
  config_file: string option ;
  branch: string option }
type nonrec error_message = unit
type nonrec update_out_of_sync_exception = {
  message: string option }
type nonrec throttling_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec invalid_input_exception = {
  message: string option }
type nonrec internal_server_exception = {
  message: string option }
type nonrec concurrent_modification_exception = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec id = unit
type nonrec blocker_type =
  | AUTOMATED 
type nonrec blocker_status =
  | RESOLVED 
  | ACTIVE 
type nonrec created_reason = unit
type nonrec timestamp_ = unit
type nonrec sync_blocker_context_key = unit
type nonrec sync_blocker_context_value = unit
type nonrec sync_blocker_context = {
  value: string ;
  key: string }
type nonrec sync_blocker_context_list = unit
type nonrec resolved_reason = unit
type nonrec sync_blocker =
  {
  resolved_at: Timestamp.t option ;
  resolved_reason: string option ;
  contexts: sync_blocker_context list option ;
  created_at: Timestamp.t ;
  created_reason: string ;
  status: blocker_status ;
  type_: blocker_type ;
  id: string }
type nonrec update_sync_blocker_output =
  {
  sync_blocker: sync_blocker ;
  parent_resource_name: string option ;
  resource_name: string }
type nonrec update_sync_blocker_input =
  {
  resolved_reason: string ;
  resource_name: string ;
  sync_type: sync_configuration_type ;
  id: string }
type nonrec sync_blocker_does_not_exist_exception = {
  message: string option }
type nonrec retry_latest_commit_failed_exception = {
  message: string option }
type nonrec connection_arn = unit
type nonrec kms_key_arn = unit
type nonrec repository_link_arn = unit
type nonrec repository_link_info =
  {
  repository_name: string ;
  repository_link_id: string ;
  repository_link_arn: string ;
  provider_type: provider_type ;
  owner_id: string ;
  encryption_key_arn: string option ;
  connection_arn: string }
type nonrec update_repository_link_output =
  {
  repository_link_info: repository_link_info }
type nonrec update_repository_link_input =
  {
  repository_link_id: string ;
  encryption_key_arn: string option ;
  connection_arn: string option }
type nonrec conditional_check_failed_exception = {
  message: string option }
type nonrec update_host_output = unit
type nonrec host_arn = unit
type nonrec update_host_input =
  {
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string option ;
  host_arn: string }
type nonrec unsupported_operation_exception = {
  message: string option }
type nonrec resource_unavailable_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec untag_resource_output = unit
type nonrec amazon_resource_name = unit
type nonrec tag_key = unit
type nonrec tag_key_list = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec unsupported_provider_type_exception = {
  message: string option }
type nonrec type_ = unit
type nonrec target = unit
type nonrec tag_value = unit
type nonrec tag_resource_output = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = unit
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec sync_configuration_still_exists_exception =
  {
  message: string option }
type nonrec sync_configuration_list = unit
type nonrec latest_sync_blocker_list = unit
type nonrec sync_blocker_summary =
  {
  latest_blockers: sync_blocker list option ;
  parent_resource_name: string option ;
  resource_name: string }
type nonrec sharp_next_token = unit
type nonrec sh_a = unit
type nonrec directory = unit
type nonrec revision =
  {
  sha: string ;
  provider_type: provider_type ;
  repository_name: string ;
  owner_id: string ;
  directory: string ;
  branch: string }
type nonrec resource_sync_status =
  | SUCCEEDED 
  | IN_PROGRESS 
  | INITIATED 
  | FAILED 
type nonrec event = unit
type nonrec external_id = unit
type nonrec resource_sync_event =
  {
  type_: string ;
  time: Timestamp.t ;
  external_id: string option ;
  event: string }
type nonrec resource_sync_event_list = unit
type nonrec resource_sync_attempt =
  {
  target: string ;
  target_revision: revision ;
  status: resource_sync_status ;
  started_at: Timestamp.t ;
  initial_revision: revision ;
  events: resource_sync_event list }
type nonrec resource_already_exists_exception = {
  message: string option }
type nonrec repository_sync_status =
  | QUEUED 
  | SUCCEEDED 
  | IN_PROGRESS 
  | INITIATED 
  | FAILED 
type nonrec repository_sync_event =
  {
  type_: string ;
  time: Timestamp.t ;
  external_id: string option ;
  event: string }
type nonrec repository_sync_event_list = unit
type nonrec parent = unit
type nonrec repository_sync_definition =
  {
  target: string ;
  parent: string ;
  directory: string ;
  branch: string }
type nonrec repository_sync_definition_list = unit
type nonrec repository_sync_attempt =
  {
  events: repository_sync_event list ;
  status: repository_sync_status ;
  started_at: Timestamp.t }
type nonrec repository_link_list = unit
type nonrec next_token = unit
type nonrec max_results = unit
type nonrec list_tags_for_resource_output = {
  tags: tag list option }
type nonrec list_tags_for_resource_input = {
  resource_arn: string }
type nonrec list_sync_configurations_output =
  {
  next_token: string option ;
  sync_configurations: sync_configuration list }
type nonrec list_sync_configurations_input =
  {
  sync_type: sync_configuration_type ;
  repository_link_id: string ;
  next_token: string option ;
  max_results: int option }
type nonrec list_repository_sync_definitions_output =
  {
  next_token: string option ;
  repository_sync_definitions: repository_sync_definition list }
type nonrec list_repository_sync_definitions_input =
  {
  sync_type: sync_configuration_type ;
  repository_link_id: string }
type nonrec list_repository_links_output =
  {
  next_token: string option ;
  repository_links: repository_link_info list }
type nonrec list_repository_links_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec host_name = unit
type nonrec host_status = unit
type nonrec host_status_message = unit
type nonrec host =
  {
  status_message: string option ;
  status: string option ;
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string option ;
  provider_type: provider_type option ;
  host_arn: string option ;
  name: string option }
type nonrec host_list = unit
type nonrec list_hosts_output =
  {
  next_token: string option ;
  hosts: host list option }
type nonrec list_hosts_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec connection_name = unit
type nonrec account_id = unit
type nonrec connection_status =
  | ERROR 
  | AVAILABLE 
  | PENDING 
type nonrec connection =
  {
  host_arn: string option ;
  connection_status: connection_status option ;
  owner_account_id: string option ;
  provider_type: provider_type option ;
  connection_arn: string option ;
  connection_name: string option }
type nonrec connection_list = unit
type nonrec list_connections_output =
  {
  next_token: string option ;
  connections: connection list option }
type nonrec list_connections_input =
  {
  next_token: string option ;
  max_results: int option ;
  host_arn_filter: string option ;
  provider_type_filter: provider_type option }
type nonrec get_sync_configuration_output =
  {
  sync_configuration: sync_configuration }
type nonrec get_sync_configuration_input =
  {
  resource_name: string ;
  sync_type: sync_configuration_type }
type nonrec get_sync_blocker_summary_output =
  {
  sync_blocker_summary: sync_blocker_summary }
type nonrec get_sync_blocker_summary_input =
  {
  resource_name: string ;
  sync_type: sync_configuration_type }
type nonrec get_resource_sync_status_output =
  {
  latest_sync: resource_sync_attempt ;
  latest_successful_sync: resource_sync_attempt option ;
  desired_state: revision option }
type nonrec get_resource_sync_status_input =
  {
  sync_type: sync_configuration_type ;
  resource_name: string }
type nonrec get_repository_sync_status_output =
  {
  latest_sync: repository_sync_attempt }
type nonrec get_repository_sync_status_input =
  {
  sync_type: sync_configuration_type ;
  repository_link_id: string ;
  branch: string }
type nonrec get_repository_link_output =
  {
  repository_link_info: repository_link_info }
type nonrec get_repository_link_input = {
  repository_link_id: string }
type nonrec get_host_output =
  {
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string option ;
  provider_type: provider_type option ;
  status: string option ;
  name: string option }
type nonrec get_host_input = {
  host_arn: string }
type nonrec get_connection_output = {
  connection: connection option }
type nonrec get_connection_input = {
  connection_arn: string }
type nonrec delete_sync_configuration_output = unit
type nonrec delete_sync_configuration_input =
  {
  resource_name: string ;
  sync_type: sync_configuration_type }
type nonrec delete_repository_link_output = unit
type nonrec delete_repository_link_input = {
  repository_link_id: string }
type nonrec delete_host_output = unit
type nonrec delete_host_input = {
  host_arn: string }
type nonrec delete_connection_output = unit
type nonrec delete_connection_input = {
  connection_arn: string }
type nonrec create_sync_configuration_output =
  {
  sync_configuration: sync_configuration }
type nonrec create_sync_configuration_input =
  {
  trigger_resource_update_on: trigger_resource_update_on option ;
  publish_deployment_status: publish_deployment_status option ;
  sync_type: sync_configuration_type ;
  role_arn: string ;
  resource_name: string ;
  repository_link_id: string ;
  config_file: string ;
  branch: string }
type nonrec create_repository_link_output =
  {
  repository_link_info: repository_link_info }
type nonrec create_repository_link_input =
  {
  tags: tag list option ;
  encryption_key_arn: string option ;
  repository_name: string ;
  owner_id: string ;
  connection_arn: string }
type nonrec create_host_output =
  {
  tags: tag list option ;
  host_arn: string option }
type nonrec create_host_input =
  {
  tags: tag list option ;
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string ;
  provider_type: provider_type ;
  name: string }
type nonrec create_connection_output =
  {
  tags: tag list option ;
  connection_arn: string }
type nonrec create_connection_input =
  {
  host_arn: string option ;
  tags: tag list option ;
  connection_name: string ;
  provider_type: provider_type option }
type nonrec code_connections_20231201 = unit
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit