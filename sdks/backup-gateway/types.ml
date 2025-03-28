open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "backup-gateway";
      endpointPrefix = "backup-gateway";
      version = "2021-01-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec string_ = unit
type nonrec vpc_endpoint = unit
type nonrec vmware_category = unit
type nonrec vmware_tag_name = unit
type nonrec tag_key = unit
type nonrec tag_value = unit
type nonrec vmware_to_aws_tag_mapping =
  {
  aws_tag_value: string ;
  aws_tag_key: string ;
  vmware_tag_name: string ;
  vmware_category: string }
type nonrec vmware_to_aws_tag_mappings = unit
type nonrec vmware_tag =
  {
  vmware_tag_description: string option ;
  vmware_tag_name: string option ;
  vmware_category: string option }
type nonrec vmware_tags = unit
type nonrec name = unit
type nonrec path = unit
type nonrec resource_arn = unit
type nonrec time = unit
type nonrec virtual_machine =
  {
  last_backup_date: Timestamp.t option ;
  resource_arn: string option ;
  path: string option ;
  name: string option ;
  hypervisor_id: string option ;
  host_name: string option }
type nonrec virtual_machines = unit
type nonrec virtual_machine_resource = unit
type nonrec virtual_machine_details =
  {
  vmware_tags: vmware_tag list option ;
  last_backup_date: Timestamp.t option ;
  resource_arn: string option ;
  path: string option ;
  name: string option ;
  hypervisor_id: string option ;
  host_name: string option }
type nonrec validation_exception =
  {
  message: string option ;
  error_code: string option }
type nonrec username = unit
type nonrec server_arn = unit
type nonrec update_hypervisor_output = {
  hypervisor_arn: string option }
type nonrec host = unit
type nonrec password = unit
type nonrec log_group_arn = unit
type nonrec update_hypervisor_input =
  {
  log_group_arn: string option ;
  name: string option ;
  password: string option ;
  username: string option ;
  host: string option ;
  hypervisor_arn: string }
type nonrec resource_not_found_exception =
  {
  message: string option ;
  error_code: string option }
type nonrec conflict_exception =
  {
  message: string option ;
  error_code: string }
type nonrec access_denied_exception =
  {
  message: string option ;
  error_code: string }
type nonrec gateway_arn = unit
type nonrec update_gateway_software_now_output =
  {
  gateway_arn: string option }
type nonrec update_gateway_software_now_input = {
  gateway_arn: string }
type nonrec update_gateway_information_output = {
  gateway_arn: string option }
type nonrec update_gateway_information_input =
  {
  gateway_display_name: string option ;
  gateway_arn: string }
type nonrec untag_resource_output = {
  resource_ar_n: string option }
type nonrec tag_keys = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec throttling_exception =
  {
  message: string option ;
  error_code: string }
type nonrec test_hypervisor_configuration_output = unit
type nonrec test_hypervisor_configuration_input =
  {
  password: string option ;
  username: string option ;
  host: string ;
  gateway_arn: string }
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tags = unit
type nonrec tag_resource_output = {
  resource_ar_n: string option }
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec base_unit = unit
type nonrec sync_metadata_status =
  | CREATED 
  | RUNNING 
  | FAILED 
  | PARTIALLY_FAILED 
  | SUCCEEDED 
type nonrec start_virtual_machines_metadata_sync_output =
  {
  hypervisor_arn: string option }
type nonrec start_virtual_machines_metadata_sync_input =
  {
  hypervisor_arn: string }
type nonrec put_maintenance_start_time_output = {
  gateway_arn: string option }
type nonrec hour_of_day = unit
type nonrec minute_of_hour = unit
type nonrec day_of_week = unit
type nonrec day_of_month = unit
type nonrec put_maintenance_start_time_input =
  {
  day_of_month: int option ;
  day_of_week: int option ;
  minute_of_hour: int ;
  hour_of_day: int ;
  gateway_arn: string }
type nonrec put_hypervisor_property_mappings_output =
  {
  hypervisor_arn: string option }
type nonrec iam_role_arn = unit
type nonrec put_hypervisor_property_mappings_input =
  {
  iam_role_arn: string ;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list ;
  hypervisor_arn: string }
type nonrec put_bandwidth_rate_limit_schedule_output =
  {
  gateway_arn: string option }
type nonrec average_upload_rate_limit = unit
type nonrec days_of_week = unit
type nonrec bandwidth_rate_limit_interval =
  {
  days_of_week: int list ;
  end_minute_of_hour: int ;
  start_minute_of_hour: int ;
  end_hour_of_day: int ;
  start_hour_of_day: int ;
  average_upload_rate_limit_in_bits_per_sec: int option }
type nonrec bandwidth_rate_limit_intervals = unit
type nonrec put_bandwidth_rate_limit_schedule_input =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list ;
  gateway_arn: string }
type nonrec next_token = unit
type nonrec max_results = unit
type nonrec maintenance_start_time =
  {
  minute_of_hour: int ;
  hour_of_day: int ;
  day_of_week: int option ;
  day_of_month: int option }
type nonrec list_virtual_machines_output =
  {
  next_token: string option ;
  virtual_machines: virtual_machine list option }
type nonrec list_virtual_machines_input =
  {
  next_token: string option ;
  max_results: int option ;
  hypervisor_arn: string option }
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option ;
  resource_arn: string option }
type nonrec list_tags_for_resource_input = {
  resource_arn: string }
type nonrec kms_key_arn = unit
type nonrec hypervisor_state =
  | PENDING 
  | ONLINE 
  | OFFLINE 
  | ERROR 
type nonrec hypervisor =
  {
  state: hypervisor_state option ;
  name: string option ;
  kms_key_arn: string option ;
  hypervisor_arn: string option ;
  host: string option }
type nonrec hypervisors = unit
type nonrec list_hypervisors_output =
  {
  next_token: string option ;
  hypervisors: hypervisor list option }
type nonrec list_hypervisors_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec gateway_type =
  | BACKUP_VM 
type nonrec hypervisor_id = unit
type nonrec gateway =
  {
  last_seen_time: Timestamp.t option ;
  hypervisor_id: string option ;
  gateway_type: gateway_type option ;
  gateway_display_name: string option ;
  gateway_arn: string option }
type nonrec gateways = unit
type nonrec list_gateways_output =
  {
  next_token: string option ;
  gateways: gateway list option }
type nonrec list_gateways_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec internal_server_exception =
  {
  message: string option ;
  error_code: string option }
type nonrec import_hypervisor_configuration_output =
  {
  hypervisor_arn: string option }
type nonrec import_hypervisor_configuration_input =
  {
  tags: tag list option ;
  kms_key_arn: string option ;
  password: string option ;
  username: string option ;
  host: string ;
  name: string }
type nonrec hypervisor_resource = unit
type nonrec hypervisor_property_mapping_resource = unit
type nonrec hypervisor_details =
  {
  latest_metadata_sync_status: sync_metadata_status option ;
  latest_metadata_sync_status_message: string option ;
  last_successful_metadata_sync_time: Timestamp.t option ;
  state: hypervisor_state option ;
  log_group_arn: string option ;
  name: string option ;
  kms_key_arn: string option ;
  hypervisor_arn: string option ;
  host: string option }
type nonrec get_virtual_machine_output =
  {
  virtual_machine: virtual_machine_details option }
type nonrec get_virtual_machine_input = {
  resource_arn: string }
type nonrec get_hypervisor_property_mappings_output =
  {
  iam_role_arn: string option ;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list option ;
  hypervisor_arn: string option }
type nonrec get_hypervisor_property_mappings_input =
  {
  hypervisor_arn: string }
type nonrec get_hypervisor_output = {
  hypervisor: hypervisor_details option }
type nonrec get_hypervisor_input = {
  hypervisor_arn: string }
type nonrec gateway_details =
  {
  vpc_endpoint: string option ;
  next_update_availability_time: Timestamp.t option ;
  maintenance_start_time: maintenance_start_time option ;
  last_seen_time: Timestamp.t option ;
  hypervisor_id: string option ;
  gateway_type: gateway_type option ;
  gateway_display_name: string option ;
  gateway_arn: string option }
type nonrec get_gateway_output = {
  gateway: gateway_details option }
type nonrec get_gateway_input = {
  gateway_arn: string }
type nonrec get_bandwidth_rate_limit_schedule_output =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list option ;
  gateway_arn: string option }
type nonrec get_bandwidth_rate_limit_schedule_input = {
  gateway_arn: string }
type nonrec gateway_resource = unit
type nonrec disassociate_gateway_from_server_output =
  {
  gateway_arn: string option }
type nonrec disassociate_gateway_from_server_input = {
  gateway_arn: string }
type nonrec delete_hypervisor_output = {
  hypervisor_arn: string option }
type nonrec delete_hypervisor_input = {
  hypervisor_arn: string }
type nonrec delete_gateway_output = {
  gateway_arn: string option }
type nonrec delete_gateway_input = {
  gateway_arn: string }
type nonrec create_gateway_output = {
  gateway_arn: string option }
type nonrec activation_key = unit
type nonrec create_gateway_input =
  {
  tags: tag list option ;
  gateway_type: gateway_type ;
  gateway_display_name: string ;
  activation_key: string }
type nonrec bandwidth_rate_limit_schedule_resource = unit
type nonrec backup_on_premises_v20210101 = unit
type nonrec associate_gateway_to_server_output =
  {
  gateway_arn: string option }
type nonrec associate_gateway_to_server_input =
  {
  server_arn: string ;
  gateway_arn: string }
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit