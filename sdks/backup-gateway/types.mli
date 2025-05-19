open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec vmware_to_aws_tag_mapping =
  {
  aws_tag_value: string ;
  aws_tag_key: string ;
  vmware_tag_name: string ;
  vmware_category: string }[@@ocaml.doc
                             "This displays the mapping of on-premises VMware tags to the corresponding Amazon Web Services tags.\n"]
type nonrec vmware_tag =
  {
  vmware_tag_description: string option ;
  vmware_tag_name: string option ;
  vmware_category: string option }[@@ocaml.doc
                                    "A VMware tag is a tag attached to a specific virtual machine. A {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_Tag.html}tag} is a key-value pair you can use to manage, filter, and search for your resources.\n\n The content of VMware tags can be matched to Amazon Web Services tags.\n "]
type nonrec virtual_machine =
  {
  last_backup_date: CoreTypes.Timestamp.t option ;
  resource_arn: string option ;
  path: string option ;
  name: string option ;
  hypervisor_id: string option ;
  host_name: string option }[@@ocaml.doc
                              "A virtual machine that is on a hypervisor.\n"]
type nonrec virtual_machine_details =
  {
  vmware_tags: vmware_tag list option ;
  last_backup_date: CoreTypes.Timestamp.t option ;
  resource_arn: string option ;
  path: string option ;
  name: string option ;
  hypervisor_id: string option ;
  host_name: string option }[@@ocaml.doc
                              "Your [VirtualMachine] objects, ordered by their Amazon Resource Names (ARNs).\n"]
type nonrec validation_exception =
  {
  message: string option ;
  error_code: string option }[@@ocaml.doc
                               "The operation did not succeed because a validation error occurred.\n"]
type nonrec update_hypervisor_output = {
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec update_hypervisor_input =
  {
  log_group_arn: string option ;
  name: string option ;
  password: string option ;
  username: string option ;
  host: string option ;
  hypervisor_arn: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option ;
  error_code: string option }[@@ocaml.doc
                               "A resource that is required for the action wasn't found.\n"]
type nonrec conflict_exception =
  {
  message: string option ;
  error_code: string }[@@ocaml.doc
                        "The operation cannot proceed because it is not supported.\n"]
type nonrec access_denied_exception =
  {
  message: string option ;
  error_code: string }[@@ocaml.doc
                        "The operation cannot proceed because you have insufficient permissions.\n"]
type nonrec update_gateway_software_now_output =
  {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec update_gateway_software_now_input = {
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec update_gateway_information_output = {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec update_gateway_information_input =
  {
  gateway_display_name: string option ;
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec untag_resource_output = {
  resource_ar_n: string option }[@@ocaml.doc ""]
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  message: string option ;
  error_code: string }[@@ocaml.doc
                        "TPS has been limited to protect against intentional or unintentional high request volumes.\n"]
type nonrec test_hypervisor_configuration_output = unit
type nonrec test_hypervisor_configuration_input =
  {
  password: string option ;
  username: string option ;
  host: string ;
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A key-value pair you can use to manage, filter, and search for your resources. Allowed characters include UTF-8 letters, numbers, spaces, and the following characters: + - = . _ : /.\n"]
type nonrec tag_resource_output = {
  resource_ar_n: string option }[@@ocaml.doc ""]
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec sync_metadata_status =
  | CREATED 
  | RUNNING 
  | FAILED 
  | PARTIALLY_FAILED 
  | SUCCEEDED [@@ocaml.doc ""]
type nonrec start_virtual_machines_metadata_sync_output =
  {
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec start_virtual_machines_metadata_sync_input =
  {
  hypervisor_arn: string }[@@ocaml.doc ""]
type nonrec put_maintenance_start_time_output = {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec put_maintenance_start_time_input =
  {
  day_of_month: int option ;
  day_of_week: int option ;
  minute_of_hour: int ;
  hour_of_day: int ;
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec put_hypervisor_property_mappings_output =
  {
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec put_hypervisor_property_mappings_input =
  {
  iam_role_arn: string ;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list ;
  hypervisor_arn: string }[@@ocaml.doc ""]
type nonrec put_bandwidth_rate_limit_schedule_output =
  {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec bandwidth_rate_limit_interval =
  {
  days_of_week: int list ;
  end_minute_of_hour: int ;
  start_minute_of_hour: int ;
  end_hour_of_day: int ;
  start_hour_of_day: int ;
  average_upload_rate_limit_in_bits_per_sec: int option }[@@ocaml.doc
                                                           "Describes a bandwidth rate limit interval for a gateway. A bandwidth rate limit schedule consists of one or more bandwidth rate limit intervals. A bandwidth rate limit interval defines a period of time on one or more days of the week, during which bandwidth rate limits are specified for uploading, downloading, or both.\n"]
type nonrec put_bandwidth_rate_limit_schedule_input =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list ;
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec maintenance_start_time =
  {
  minute_of_hour: int ;
  hour_of_day: int ;
  day_of_week: int option ;
  day_of_month: int option }[@@ocaml.doc
                              "This is your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone. Can be weekly or monthly.\n"]
type nonrec list_virtual_machines_output =
  {
  next_token: string option ;
  virtual_machines: virtual_machine list option }[@@ocaml.doc ""]
type nonrec list_virtual_machines_input =
  {
  next_token: string option ;
  max_results: int option ;
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option ;
  resource_arn: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec hypervisor_state =
  | PENDING 
  | ONLINE 
  | OFFLINE 
  | ERROR [@@ocaml.doc ""]
type nonrec hypervisor =
  {
  state: hypervisor_state option ;
  name: string option ;
  kms_key_arn: string option ;
  hypervisor_arn: string option ;
  host: string option }[@@ocaml.doc
                         "Represents the hypervisor's permissions to which the gateway will connect.\n\n A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.\n "]
type nonrec list_hypervisors_output =
  {
  next_token: string option ;
  hypervisors: hypervisor list option }[@@ocaml.doc ""]
type nonrec list_hypervisors_input =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec gateway_type =
  | BACKUP_VM [@@ocaml.doc ""]
type nonrec gateway =
  {
  last_seen_time: CoreTypes.Timestamp.t option ;
  hypervisor_id: string option ;
  gateway_type: gateway_type option ;
  gateway_display_name: string option ;
  gateway_arn: string option }[@@ocaml.doc
                                "A gateway is an Backup Gateway appliance that runs on the customer's network to provide seamless connectivity to backup storage in the Amazon Web Services Cloud.\n"]
type nonrec list_gateways_output =
  {
  next_token: string option ;
  gateways: gateway list option }[@@ocaml.doc ""]
type nonrec list_gateways_input =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  message: string option ;
  error_code: string option }[@@ocaml.doc
                               "The operation did not succeed because an internal error occurred. Try again later.\n"]
type nonrec import_hypervisor_configuration_output =
  {
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec import_hypervisor_configuration_input =
  {
  tags: tag list option ;
  kms_key_arn: string option ;
  password: string option ;
  username: string option ;
  host: string ;
  name: string }[@@ocaml.doc ""]
type nonrec hypervisor_details =
  {
  latest_metadata_sync_status: sync_metadata_status option ;
  latest_metadata_sync_status_message: string option ;
  last_successful_metadata_sync_time: CoreTypes.Timestamp.t option ;
  state: hypervisor_state option ;
  log_group_arn: string option ;
  name: string option ;
  kms_key_arn: string option ;
  hypervisor_arn: string option ;
  host: string option }[@@ocaml.doc
                         "These are the details of the specified hypervisor. A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.\n"]
type nonrec get_virtual_machine_output =
  {
  virtual_machine: virtual_machine_details option }[@@ocaml.doc ""]
type nonrec get_virtual_machine_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_hypervisor_property_mappings_output =
  {
  iam_role_arn: string option ;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list option ;
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec get_hypervisor_property_mappings_input =
  {
  hypervisor_arn: string }[@@ocaml.doc ""]
type nonrec get_hypervisor_output = {
  hypervisor: hypervisor_details option }[@@ocaml.doc ""]
type nonrec get_hypervisor_input = {
  hypervisor_arn: string }[@@ocaml.doc ""]
type nonrec gateway_details =
  {
  vpc_endpoint: string option ;
  next_update_availability_time: CoreTypes.Timestamp.t option ;
  maintenance_start_time: maintenance_start_time option ;
  last_seen_time: CoreTypes.Timestamp.t option ;
  hypervisor_id: string option ;
  gateway_type: gateway_type option ;
  gateway_display_name: string option ;
  gateway_arn: string option }[@@ocaml.doc "The details of gateway.\n"]
type nonrec get_gateway_output = {
  gateway: gateway_details option }[@@ocaml.doc ""]
type nonrec get_gateway_input = {
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec get_bandwidth_rate_limit_schedule_output =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list option ;
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec get_bandwidth_rate_limit_schedule_input = {
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec disassociate_gateway_from_server_output =
  {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec disassociate_gateway_from_server_input = {
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec delete_hypervisor_output = {
  hypervisor_arn: string option }[@@ocaml.doc ""]
type nonrec delete_hypervisor_input = {
  hypervisor_arn: string }[@@ocaml.doc ""]
type nonrec delete_gateway_output = {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec delete_gateway_input = {
  gateway_arn: string }[@@ocaml.doc ""]
type nonrec create_gateway_output = {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec create_gateway_input =
  {
  tags: tag list option ;
  gateway_type: gateway_type ;
  gateway_display_name: string ;
  activation_key: string }[@@ocaml.doc ""]
type nonrec associate_gateway_to_server_output =
  {
  gateway_arn: string option }[@@ocaml.doc ""]
type nonrec associate_gateway_to_server_input =
  {
  server_arn: string ;
  gateway_arn: string }[@@ocaml.doc ""]