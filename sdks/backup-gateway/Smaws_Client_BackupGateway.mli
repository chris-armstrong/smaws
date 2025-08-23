(** 
    Backup Gateway client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

type nonrec vmware_to_aws_tag_mapping =
  {
  aws_tag_value: string
    [@ocaml.doc
      "The value part of the Amazon Web Services tag's key-value pair.\n"];
  aws_tag_key: string
    [@ocaml.doc
      "The key part of the Amazon Web Services tag's key-value pair.\n"];
  vmware_tag_name: string
    [@ocaml.doc "This is the user-defined name of a VMware tag.\n"];
  vmware_category: string [@ocaml.doc "The is the category of VMware.\n"]}
[@@ocaml.doc
  "This displays the mapping of on-premises VMware tags to the corresponding Amazon Web Services tags.\n"]
type nonrec vmware_tag =
  {
  vmware_tag_description: string option
    [@ocaml.doc "This is a user-defined description of a VMware tag.\n"];
  vmware_tag_name: string option
    [@ocaml.doc "This is the user-defined name of a VMware tag.\n"];
  vmware_category: string option
    [@ocaml.doc "The is the category of VMware.\n"]}[@@ocaml.doc
                                                      "A VMware tag is a tag attached to a specific virtual machine. A {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_Tag.html}tag} is a key-value pair you can use to manage, filter, and search for your resources.\n\n The content of VMware tags can be matched to Amazon Web Services tags.\n "]
type nonrec virtual_machine =
  {
  last_backup_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The most recent date a virtual machine was backed up, in Unix format and UTC time.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the virtual machine. For example, [arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL].\n"];
  path: string option [@ocaml.doc "The path of the virtual machine.\n"];
  name: string option [@ocaml.doc "The name of the virtual machine.\n"];
  hypervisor_id: string option
    [@ocaml.doc "The ID of the virtual machine's hypervisor.\n"];
  host_name: string option
    [@ocaml.doc "The host name of the virtual machine.\n"]}[@@ocaml.doc
                                                             "A virtual machine that is on a hypervisor.\n"]
type nonrec virtual_machine_details =
  {
  vmware_tags: vmware_tag list option
    [@ocaml.doc
      "These are the details of the VMware tags associated with the specified virtual machine.\n"];
  last_backup_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The most recent date a virtual machine was backed up, in Unix format and UTC time.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the virtual machine. For example, [arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL].\n"];
  path: string option [@ocaml.doc "The path of the virtual machine.\n"];
  name: string option [@ocaml.doc "The name of the virtual machine.\n"];
  hypervisor_id: string option
    [@ocaml.doc "The ID of the virtual machine's hypervisor.\n"];
  host_name: string option
    [@ocaml.doc "The host name of the virtual machine.\n"]}[@@ocaml.doc
                                                             "Your [VirtualMachine] objects, ordered by their Amazon Resource Names (ARNs).\n"]
type nonrec validation_exception =
  {
  message: string option [@ocaml.doc ""];
  error_code: string option
    [@ocaml.doc "A description of what caused the validation error.\n"]}
[@@ocaml.doc
  "The operation did not succeed because a validation error occurred.\n"]
type nonrec update_hypervisor_output =
  {
  hypervisor_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the hypervisor you updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_hypervisor_input =
  {
  log_group_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the group of gateways within the requested log.\n"];
  name: string option [@ocaml.doc "The updated name for the hypervisor\n"];
  password: string option
    [@ocaml.doc "The updated password for the hypervisor.\n"];
  username: string option
    [@ocaml.doc "The updated username for the hypervisor.\n"];
  host: string option
    [@ocaml.doc
      "The updated host of the hypervisor. This can be either an IP address or a fully-qualified domain name (FQDN).\n"];
  hypervisor_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the hypervisor to update.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""];
  error_code: string option
    [@ocaml.doc "A description of which resource wasn't found.\n"]}[@@ocaml.doc
                                                                    "A resource that is required for the action wasn't found.\n"]
type nonrec conflict_exception =
  {
  message: string option [@ocaml.doc ""];
  error_code: string
    [@ocaml.doc "A description of why the operation is not supported.\n"]}
[@@ocaml.doc "The operation cannot proceed because it is not supported.\n"]
type nonrec access_denied_exception =
  {
  message: string option [@ocaml.doc ""];
  error_code: string
    [@ocaml.doc "A description of why you have insufficient permissions.\n"]}
[@@ocaml.doc
  "The operation cannot proceed because you have insufficient permissions.\n"]
type nonrec update_gateway_software_now_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway you updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_gateway_software_now_input =
  {
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_gateway_information_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway you updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_gateway_information_input =
  {
  gateway_display_name: string option
    [@ocaml.doc "The updated display name of the gateway.\n"];
  gateway_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to update.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_output =
  {
  resource_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource from which you removed tags.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_input =
  {
  tag_keys: string list
    [@ocaml.doc "The list of tag keys specifying which tags to remove.\n"];
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource from which to remove tags.\n"]}
[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  message: string option [@ocaml.doc ""];
  error_code: string
    [@ocaml.doc
      "Error: TPS has been limited to protect against intentional or unintentional high request volumes.\n"]}
[@@ocaml.doc
  "TPS has been limited to protect against intentional or unintentional high request volumes.\n"]
type nonrec test_hypervisor_configuration_input =
  {
  password: string option [@ocaml.doc "The password for the hypervisor.\n"];
  username: string option [@ocaml.doc "The username for the hypervisor.\n"];
  host: string
    [@ocaml.doc
      "The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name (FQDN).\n"];
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway to the hypervisor to test.\n"]}
[@@ocaml.doc ""]
type nonrec tag =
  {
  value: string [@ocaml.doc "The value part of a tag's key-value pair.\n"];
  key: string
    [@ocaml.doc
      "The key part of a tag's key-value pair. The key can't start with [aws:].\n"]}
[@@ocaml.doc
  "A key-value pair you can use to manage, filter, and search for your resources. Allowed characters include UTF-8 letters, numbers, spaces, and the following characters: + - = . _ : /.\n"]
type nonrec tag_resource_output =
  {
  resource_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource you tagged.\n"]}
[@@ocaml.doc ""]
type nonrec tag_resource_input =
  {
  tags: tag list [@ocaml.doc "A list of tags to assign to the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to tag.\n"]}
[@@ocaml.doc ""]
type nonrec sync_metadata_status =
  | CREATED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PARTIALLY_FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_virtual_machines_metadata_sync_output =
  {
  hypervisor_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec start_virtual_machines_metadata_sync_input =
  {
  hypervisor_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec put_maintenance_start_time_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a gateway for which you set the maintenance start time.\n"]}
[@@ocaml.doc ""]
type nonrec put_maintenance_start_time_input =
  {
  day_of_month: int option
    [@ocaml.doc
      "The day of the month start maintenance on a gateway.\n\n Valid values range from [Sunday] to [Saturday].\n "];
  day_of_week: int option
    [@ocaml.doc "The day of the week to start maintenance on a gateway.\n"];
  minute_of_hour: int
    [@ocaml.doc
      "The minute of the hour to start maintenance on a gateway.\n"];
  hour_of_day: int
    [@ocaml.doc "The hour of the day to start maintenance on a gateway.\n"];
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the gateway, used to specify its maintenance start time.\n"]}
[@@ocaml.doc ""]
type nonrec put_hypervisor_property_mappings_output =
  {
  hypervisor_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec put_hypervisor_property_mappings_input =
  {
  iam_role_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role.\n"];
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list
    [@ocaml.doc
      "This action requests the mappings of on-premises VMware tags to the Amazon Web Services tags.\n"];
  hypervisor_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec put_bandwidth_rate_limit_schedule_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} [ListGateways] } operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc ""]
type nonrec bandwidth_rate_limit_interval =
  {
  days_of_week: int list
    [@ocaml.doc
      "The days of the week component of the bandwidth rate limit interval, represented as ordinal numbers from 0 to 6, where 0 represents Sunday and 6 represents Saturday.\n"];
  end_minute_of_hour: int
    [@ocaml.doc
      "The minute of the hour to end the bandwidth rate limit interval.\n\n  The bandwidth rate limit interval ends at the end of the minute. To end an interval at the end of an hour, use the value [59].\n  \n   "];
  start_minute_of_hour: int
    [@ocaml.doc
      "The minute of the hour to start the bandwidth rate limit interval. The interval begins at the start of that minute. To begin an interval exactly at the start of the hour, use the value [0].\n"];
  end_hour_of_day: int
    [@ocaml.doc
      "The hour of the day to end the bandwidth rate limit interval.\n"];
  start_hour_of_day: int
    [@ocaml.doc
      "The hour of the day to start the bandwidth rate limit interval.\n"];
  average_upload_rate_limit_in_bits_per_sec: int option
    [@ocaml.doc
      "The average upload rate limit component of the bandwidth rate limit interval, in bits per second. This field does not appear in the response if the upload rate limit is not set.\n\n  For Backup Gateway, the minimum value is [(Value)].\n  \n   "]}
[@@ocaml.doc
  "Describes a bandwidth rate limit interval for a gateway. A bandwidth rate limit schedule consists of one or more bandwidth rate limit intervals. A bandwidth rate limit interval defines a period of time on one or more days of the week, during which bandwidth rate limits are specified for uploading, downloading, or both.\n"]
type nonrec put_bandwidth_rate_limit_schedule_input =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list
    [@ocaml.doc
      "An array containing bandwidth rate limit schedule intervals for a gateway. When no bandwidth rate limit intervals have been scheduled, the array is empty.\n"];
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} [ListGateways] } operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc ""]
type nonrec maintenance_start_time =
  {
  minute_of_hour: int
    [@ocaml.doc
      "The minute component of the maintenance start time represented as {i mm}, where {i mm} is the minute (0 to 59). The minute of the hour is in the time zone of the gateway.\n"];
  hour_of_day: int
    [@ocaml.doc
      "The hour component of the maintenance start time represented as {i hh}, where {i hh} is the hour (0 to 23). The hour of the day is in the time zone of the gateway.\n"];
  day_of_week: int option
    [@ocaml.doc
      "An ordinal number between 0 and 6 that represents the day of the week, where 0 represents Sunday and 6 represents Saturday. The day of week is in the time zone of the gateway.\n"];
  day_of_month: int option
    [@ocaml.doc
      "The day of the month component of the maintenance start time represented as an ordinal number from 1 to 28, where 1 represents the first day of the month and 28 represents the last day of the month.\n"]}
[@@ocaml.doc
  "This is your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone. Can be weekly or monthly.\n"]
type nonrec list_virtual_machines_output =
  {
  next_token: string option
    [@ocaml.doc
      "The next item following a partial list of returned resources. For example, if a request is made to return [maxResults] number of resources, [NextToken] allows you to return more items in your list starting at the location pointed to by the next token.\n"];
  virtual_machines: virtual_machine list option
    [@ocaml.doc
      "A list of your [VirtualMachine] objects, ordered by their Amazon Resource Names (ARNs).\n"]}
[@@ocaml.doc ""]
type nonrec list_virtual_machines_input =
  {
  next_token: string option
    [@ocaml.doc
      "The next item following a partial list of returned resources. For example, if a request is made to return [maxResults] number of resources, [NextToken] allows you to return more items in your list starting at the location pointed to by the next token.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of virtual machines to list.\n"];
  hypervisor_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the hypervisor connected to your virtual machine.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option [@ocaml.doc "A list of the resource's tags.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource's tags that you listed.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource's tags to list.\n"]}
[@@ocaml.doc ""]
type nonrec hypervisor_state =
  | PENDING [@ocaml.doc ""]
  | ONLINE [@ocaml.doc ""]
  | OFFLINE [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec hypervisor =
  {
  state: hypervisor_state option
    [@ocaml.doc "The state of the hypervisor.\n"];
  name: string option [@ocaml.doc "The name of the hypervisor.\n"];
  kms_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Key Management Service used to encrypt the hypervisor.\n"];
  hypervisor_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"];
  host: string option
    [@ocaml.doc
      "The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name (FQDN).\n"]}
[@@ocaml.doc
  "Represents the hypervisor's permissions to which the gateway will connect.\n\n A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.\n "]
type nonrec list_hypervisors_output =
  {
  next_token: string option
    [@ocaml.doc
      "The next item following a partial list of returned resources. For example, if a request is made to return [maxResults] number of resources, [NextToken] allows you to return more items in your list starting at the location pointed to by the next token.\n"];
  hypervisors: hypervisor list option
    [@ocaml.doc
      "A list of your [Hypervisor] objects, ordered by their Amazon Resource Names (ARNs).\n"]}
[@@ocaml.doc ""]
type nonrec list_hypervisors_input =
  {
  next_token: string option
    [@ocaml.doc
      "The next item following a partial list of returned resources. For example, if a request is made to return [maxResults] number of resources, [NextToken] allows you to return more items in your list starting at the location pointed to by the next token.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of hypervisors to list.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec gateway_type =
  | BACKUP_VM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec gateway =
  {
  last_seen_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The last time Backup gateway communicated with the gateway, in Unix format and UTC time.\n"];
  hypervisor_id: string option
    [@ocaml.doc "The hypervisor ID of the gateway.\n"];
  gateway_type: gateway_type option [@ocaml.doc "The type of the gateway.\n"];
  gateway_display_name: string option
    [@ocaml.doc "The display name of the gateway.\n"];
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc
  "A gateway is an Backup Gateway appliance that runs on the customer's network to provide seamless connectivity to backup storage in the Amazon Web Services Cloud.\n"]
type nonrec list_gateways_output =
  {
  next_token: string option
    [@ocaml.doc
      "The next item following a partial list of returned resources. For example, if a request is made to return [maxResults] number of resources, [NextToken] allows you to return more items in your list starting at the location pointed to by the next token.\n"];
  gateways: gateway list option [@ocaml.doc "A list of your gateways.\n"]}
[@@ocaml.doc ""]
type nonrec list_gateways_input =
  {
  next_token: string option
    [@ocaml.doc
      "The next item following a partial list of returned resources. For example, if a request is made to return [MaxResults] number of resources, [NextToken] allows you to return more items in your list starting at the location pointed to by the next token.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of gateways to list.\n"]}[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  message: string option [@ocaml.doc ""];
  error_code: string option
    [@ocaml.doc "A description of which internal error occured.\n"]}[@@ocaml.doc
                                                                    "The operation did not succeed because an internal error occurred. Try again later.\n"]
type nonrec import_hypervisor_configuration_output =
  {
  hypervisor_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the hypervisor you disassociated.\n"]}
[@@ocaml.doc ""]
type nonrec import_hypervisor_configuration_input =
  {
  tags: tag list option
    [@ocaml.doc "The tags of the hypervisor configuration to import.\n"];
  kms_key_arn: string option
    [@ocaml.doc "The Key Management Service for the hypervisor.\n"];
  password: string option [@ocaml.doc "The password for the hypervisor.\n"];
  username: string option [@ocaml.doc "The username for the hypervisor.\n"];
  host: string
    [@ocaml.doc
      "The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name (FQDN).\n"];
  name: string [@ocaml.doc "The name of the hypervisor.\n"]}[@@ocaml.doc ""]
type nonrec hypervisor_details =
  {
  latest_metadata_sync_status: sync_metadata_status option
    [@ocaml.doc
      "This is the most recent status for the indicated metadata sync.\n"];
  latest_metadata_sync_status_message: string option
    [@ocaml.doc
      "This is the most recent status for the indicated metadata sync.\n"];
  last_successful_metadata_sync_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "This is the time when the most recent successful sync of metadata occurred.\n"];
  state: hypervisor_state option
    [@ocaml.doc
      "This is the current state of the specified hypervisor.\n\n The possible states are [PENDING], [ONLINE], [OFFLINE], or [ERROR].\n "];
  log_group_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the group of gateways within the requested log.\n"];
  name: string option
    [@ocaml.doc "This is the name of the specified hypervisor.\n"];
  kms_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the KMS used to encrypt the hypervisor.\n"];
  hypervisor_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"];
  host: string option
    [@ocaml.doc
      "The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name (FQDN).\n"]}
[@@ocaml.doc
  "These are the details of the specified hypervisor. A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.\n"]
type nonrec get_virtual_machine_output =
  {
  virtual_machine: virtual_machine_details option
    [@ocaml.doc
      "This object contains the basic attributes of [VirtualMachine] contained by the output of [GetVirtualMachine] \n"]}
[@@ocaml.doc ""]
type nonrec get_virtual_machine_input =
  {
  resource_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the virtual machine.\n"]}
[@@ocaml.doc ""]
type nonrec get_hypervisor_property_mappings_output =
  {
  iam_role_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role.\n"];
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list option
    [@ocaml.doc
      "This is a display of the mappings of on-premises VMware tags to the Amazon Web Services tags.\n"];
  hypervisor_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec get_hypervisor_property_mappings_input =
  {
  hypervisor_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec get_hypervisor_output =
  {
  hypervisor: hypervisor_details option
    [@ocaml.doc "Details about the requested hypervisor.\n"]}[@@ocaml.doc ""]
type nonrec get_hypervisor_input =
  {
  hypervisor_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]}
[@@ocaml.doc ""]
type nonrec gateway_details =
  {
  vpc_endpoint: string option
    [@ocaml.doc
      "The DNS name for the virtual private cloud (VPC) endpoint the gateway uses to connect to the cloud for backup gateway.\n"];
  next_update_availability_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Details showing the next update availability time of the gateway.\n"];
  maintenance_start_time: maintenance_start_time option
    [@ocaml.doc
      "Returns your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone. Can be weekly or monthly.\n"];
  last_seen_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Details showing the last time Backup gateway communicated with the cloud, in Unix format and UTC time.\n"];
  hypervisor_id: string option
    [@ocaml.doc "The hypervisor ID of the gateway.\n"];
  gateway_type: gateway_type option
    [@ocaml.doc "The type of the gateway type.\n"];
  gateway_display_name: string option
    [@ocaml.doc "The display name of the gateway.\n"];
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc "The details of gateway.\n"]
type nonrec get_gateway_output =
  {
  gateway: gateway_details option
    [@ocaml.doc
      "By providing the ARN (Amazon Resource Name), this API returns the gateway.\n"]}
[@@ocaml.doc ""]
type nonrec get_gateway_input =
  {
  gateway_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_bandwidth_rate_limit_schedule_output =
  {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list option
    [@ocaml.doc
      "An array containing bandwidth rate limit schedule intervals for a gateway. When no bandwidth rate limit intervals have been scheduled, the array is empty.\n"];
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} [ListGateways] } operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc ""]
type nonrec get_bandwidth_rate_limit_schedule_input =
  {
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} [ListGateways] } operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_gateway_from_server_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway you disassociated.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_gateway_from_server_input =
  {
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway to disassociate.\n"]}
[@@ocaml.doc ""]
type nonrec delete_hypervisor_output =
  {
  hypervisor_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the hypervisor you deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_hypervisor_input =
  {
  hypervisor_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the hypervisor to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_gateway_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway you deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_gateway_input =
  {
  gateway_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to delete.\n"]}
[@@ocaml.doc ""]
type nonrec create_gateway_output =
  {
  gateway_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway you create.\n"]}
[@@ocaml.doc ""]
type nonrec create_gateway_input =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of up to 50 tags to assign to the gateway. Each tag is a key-value pair.\n"];
  gateway_type: gateway_type [@ocaml.doc "The type of created gateway.\n"];
  gateway_display_name: string
    [@ocaml.doc "The display name of the created gateway.\n"];
  activation_key: string
    [@ocaml.doc "The activation key of the created gateway.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec associate_gateway_to_server_output =
  {
  gateway_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of a gateway.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec associate_gateway_to_server_input =
  {
  server_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the server that hosts your virtual machines.\n"];
  gateway_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return a list of gateways for your account and Amazon Web Services Region.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_vmware_to_aws_tag_mapping :
  aws_tag_value:string ->
    aws_tag_key:string ->
      vmware_tag_name:string ->
        vmware_category:string -> unit -> vmware_to_aws_tag_mapping
val make_vmware_tag :
  ?vmware_tag_description:string ->
    ?vmware_tag_name:string -> ?vmware_category:string -> unit -> vmware_tag
val make_virtual_machine :
  ?last_backup_date:CoreTypes.Timestamp.t ->
    ?resource_arn:string ->
      ?path:string ->
        ?name:string ->
          ?hypervisor_id:string ->
            ?host_name:string -> unit -> virtual_machine
val make_virtual_machine_details :
  ?vmware_tags:vmware_tag list ->
    ?last_backup_date:CoreTypes.Timestamp.t ->
      ?resource_arn:string ->
        ?path:string ->
          ?name:string ->
            ?hypervisor_id:string ->
              ?host_name:string -> unit -> virtual_machine_details
val make_update_hypervisor_output :
  ?hypervisor_arn:string -> unit -> update_hypervisor_output
val make_update_hypervisor_input :
  ?log_group_arn:string ->
    ?name:string ->
      ?password:string ->
        ?username:string ->
          ?host:string ->
            hypervisor_arn:string -> unit -> update_hypervisor_input
val make_update_gateway_software_now_output :
  ?gateway_arn:string -> unit -> update_gateway_software_now_output
val make_update_gateway_software_now_input :
  gateway_arn:string -> unit -> update_gateway_software_now_input
val make_update_gateway_information_output :
  ?gateway_arn:string -> unit -> update_gateway_information_output
val make_update_gateway_information_input :
  ?gateway_display_name:string ->
    gateway_arn:string -> unit -> update_gateway_information_input
val make_untag_resource_output :
  ?resource_ar_n:string -> unit -> untag_resource_output
val make_untag_resource_input :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_input
val make_test_hypervisor_configuration_output : unit -> unit
val make_test_hypervisor_configuration_input :
  ?password:string ->
    ?username:string ->
      host:string ->
        gateway_arn:string -> unit -> test_hypervisor_configuration_input
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_output :
  ?resource_ar_n:string -> unit -> tag_resource_output
val make_tag_resource_input :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_input
val make_start_virtual_machines_metadata_sync_output :
  ?hypervisor_arn:string ->
    unit -> start_virtual_machines_metadata_sync_output
val make_start_virtual_machines_metadata_sync_input :
  hypervisor_arn:string -> unit -> start_virtual_machines_metadata_sync_input
val make_put_maintenance_start_time_output :
  ?gateway_arn:string -> unit -> put_maintenance_start_time_output
val make_put_maintenance_start_time_input :
  ?day_of_month:int ->
    ?day_of_week:int ->
      minute_of_hour:int ->
        hour_of_day:int ->
          gateway_arn:string -> unit -> put_maintenance_start_time_input
val make_put_hypervisor_property_mappings_output :
  ?hypervisor_arn:string -> unit -> put_hypervisor_property_mappings_output
val make_put_hypervisor_property_mappings_input :
  iam_role_arn:string ->
    vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
      hypervisor_arn:string -> unit -> put_hypervisor_property_mappings_input
val make_put_bandwidth_rate_limit_schedule_output :
  ?gateway_arn:string -> unit -> put_bandwidth_rate_limit_schedule_output
val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:int ->
    days_of_week:int list ->
      end_minute_of_hour:int ->
        start_minute_of_hour:int ->
          end_hour_of_day:int ->
            start_hour_of_day:int -> unit -> bandwidth_rate_limit_interval
val make_put_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
    gateway_arn:string -> unit -> put_bandwidth_rate_limit_schedule_input
val make_maintenance_start_time :
  ?day_of_week:int ->
    ?day_of_month:int ->
      minute_of_hour:int -> hour_of_day:int -> unit -> maintenance_start_time
val make_list_virtual_machines_output :
  ?next_token:string ->
    ?virtual_machines:virtual_machine list ->
      unit -> list_virtual_machines_output
val make_list_virtual_machines_input :
  ?next_token:string ->
    ?max_results:int ->
      ?hypervisor_arn:string -> unit -> list_virtual_machines_input
val make_list_tags_for_resource_output :
  ?tags:tag list ->
    ?resource_arn:string -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:string -> unit -> list_tags_for_resource_input
val make_hypervisor :
  ?state:hypervisor_state ->
    ?name:string ->
      ?kms_key_arn:string ->
        ?hypervisor_arn:string -> ?host:string -> unit -> hypervisor
val make_list_hypervisors_output :
  ?next_token:string ->
    ?hypervisors:hypervisor list -> unit -> list_hypervisors_output
val make_list_hypervisors_input :
  ?next_token:string -> ?max_results:int -> unit -> list_hypervisors_input
val make_gateway :
  ?last_seen_time:CoreTypes.Timestamp.t ->
    ?hypervisor_id:string ->
      ?gateway_type:gateway_type ->
        ?gateway_display_name:string ->
          ?gateway_arn:string -> unit -> gateway
val make_list_gateways_output :
  ?next_token:string ->
    ?gateways:gateway list -> unit -> list_gateways_output
val make_list_gateways_input :
  ?next_token:string -> ?max_results:int -> unit -> list_gateways_input
val make_import_hypervisor_configuration_output :
  ?hypervisor_arn:string -> unit -> import_hypervisor_configuration_output
val make_import_hypervisor_configuration_input :
  ?tags:tag list ->
    ?kms_key_arn:string ->
      ?password:string ->
        ?username:string ->
          host:string ->
            name:string -> unit -> import_hypervisor_configuration_input
val make_hypervisor_details :
  ?latest_metadata_sync_status:sync_metadata_status ->
    ?latest_metadata_sync_status_message:string ->
      ?last_successful_metadata_sync_time:CoreTypes.Timestamp.t ->
        ?state:hypervisor_state ->
          ?log_group_arn:string ->
            ?name:string ->
              ?kms_key_arn:string ->
                ?hypervisor_arn:string ->
                  ?host:string -> unit -> hypervisor_details
val make_get_virtual_machine_output :
  ?virtual_machine:virtual_machine_details ->
    unit -> get_virtual_machine_output
val make_get_virtual_machine_input :
  resource_arn:string -> unit -> get_virtual_machine_input
val make_get_hypervisor_property_mappings_output :
  ?iam_role_arn:string ->
    ?vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
      ?hypervisor_arn:string ->
        unit -> get_hypervisor_property_mappings_output
val make_get_hypervisor_property_mappings_input :
  hypervisor_arn:string -> unit -> get_hypervisor_property_mappings_input
val make_get_hypervisor_output :
  ?hypervisor:hypervisor_details -> unit -> get_hypervisor_output
val make_get_hypervisor_input :
  hypervisor_arn:string -> unit -> get_hypervisor_input
val make_gateway_details :
  ?vpc_endpoint:string ->
    ?next_update_availability_time:CoreTypes.Timestamp.t ->
      ?maintenance_start_time:maintenance_start_time ->
        ?last_seen_time:CoreTypes.Timestamp.t ->
          ?hypervisor_id:string ->
            ?gateway_type:gateway_type ->
              ?gateway_display_name:string ->
                ?gateway_arn:string -> unit -> gateway_details
val make_get_gateway_output :
  ?gateway:gateway_details -> unit -> get_gateway_output
val make_get_gateway_input : gateway_arn:string -> unit -> get_gateway_input
val make_get_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
    ?gateway_arn:string -> unit -> get_bandwidth_rate_limit_schedule_output
val make_get_bandwidth_rate_limit_schedule_input :
  gateway_arn:string -> unit -> get_bandwidth_rate_limit_schedule_input
val make_disassociate_gateway_from_server_output :
  ?gateway_arn:string -> unit -> disassociate_gateway_from_server_output
val make_disassociate_gateway_from_server_input :
  gateway_arn:string -> unit -> disassociate_gateway_from_server_input
val make_delete_hypervisor_output :
  ?hypervisor_arn:string -> unit -> delete_hypervisor_output
val make_delete_hypervisor_input :
  hypervisor_arn:string -> unit -> delete_hypervisor_input
val make_delete_gateway_output :
  ?gateway_arn:string -> unit -> delete_gateway_output
val make_delete_gateway_input :
  gateway_arn:string -> unit -> delete_gateway_input
val make_create_gateway_output :
  ?gateway_arn:string -> unit -> create_gateway_output
val make_create_gateway_input :
  ?tags:tag list ->
    gateway_type:gateway_type ->
      gateway_display_name:string ->
        activation_key:string -> unit -> create_gateway_input
val make_associate_gateway_to_server_output :
  ?gateway_arn:string -> unit -> associate_gateway_to_server_output
val make_associate_gateway_to_server_input :
  server_arn:string ->
    gateway_arn:string -> unit -> associate_gateway_to_server_input(** {1:operations Operations} *)

module AssociateGatewayToServer :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_gateway_to_server_input ->
        (associate_gateway_to_server_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception ]) result
end[@@ocaml.doc
     "Associates a backup gateway with your server. After you complete the association process, you can back up and restore your VMs through the gateway.\n"]
module CreateGateway :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_gateway_input ->
        (create_gateway_output, [> Smaws_Lib.Protocols.AwsJson.error]) result
end[@@ocaml.doc
     "Creates a backup gateway. After you create a gateway, you can associate it with a server using the [AssociateGatewayToServer] operation.\n"]
module DeleteGateway :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_gateway_input ->
        (delete_gateway_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes a backup gateway.\n"]
module DeleteHypervisor :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_hypervisor_input ->
        (delete_hypervisor_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes a hypervisor.\n"]
module DisassociateGatewayFromServer :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_gateway_from_server_input ->
        (disassociate_gateway_from_server_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disassociates a backup gateway from the specified server. After the disassociation process finishes, the gateway can no longer access the virtual machines on the server.\n"]
module GetBandwidthRateLimitSchedule :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_bandwidth_rate_limit_schedule_input ->
        (get_bandwidth_rate_limit_schedule_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. Use this to get a gateway's bandwidth rate limit schedule.\n"]
module GetGateway :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_gateway_input ->
        (get_gateway_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "By providing the ARN (Amazon Resource Name), this API returns the gateway.\n"]
module GetHypervisor :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_input ->
        (get_hypervisor_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action requests information about the specified hypervisor to which the gateway will connect. A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and allocates resources to them.\n"]
module GetHypervisorPropertyMappings :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_property_mappings_input ->
        (get_hypervisor_property_mappings_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action retrieves the property mappings for the specified hypervisor. A hypervisor property mapping displays the relationship of entity properties available from the on-premises hypervisor to the properties available in Amazon Web Services.\n"]
module GetVirtualMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_virtual_machine_input ->
        (get_virtual_machine_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "By providing the ARN (Amazon Resource Name), this API returns the virtual machine.\n"]
module ImportHypervisorConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      import_hypervisor_configuration_input ->
        (import_hypervisor_configuration_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception ]) result
end[@@ocaml.doc "Connect to a hypervisor by importing its configuration.\n"]
module ListGateways :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_gateways_input ->
        (list_gateways_output, [> Smaws_Lib.Protocols.AwsJson.error]) result
end[@@ocaml.doc
     "Lists backup gateways owned by an Amazon Web Services account in an Amazon Web Services Region. The returned list is ordered by gateway Amazon Resource Name (ARN).\n"]
module ListHypervisors :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_hypervisors_input ->
        (list_hypervisors_output, [> Smaws_Lib.Protocols.AwsJson.error])
          result
end[@@ocaml.doc "Lists your hypervisors.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the tags applied to the resource identified by its Amazon Resource Name (ARN).\n"]
module ListVirtualMachines :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_virtual_machines_input ->
        (list_virtual_machines_output, [> Smaws_Lib.Protocols.AwsJson.error])
          result
end[@@ocaml.doc "Lists your virtual machines.\n"]
module PutBandwidthRateLimitSchedule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_bandwidth_rate_limit_schedule_input ->
        (put_bandwidth_rate_limit_schedule_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action sets the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have a bandwidth rate limit schedule, which means no bandwidth rate limiting is in effect. Use this to initiate a gateway's bandwidth rate limit schedule.\n"]
module PutHypervisorPropertyMappings :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_hypervisor_property_mappings_input ->
        (put_hypervisor_property_mappings_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action sets the property mappings for the specified hypervisor. A hypervisor property mapping displays the relationship of entity properties available from the on-premises hypervisor to the properties available in Amazon Web Services.\n"]
module PutMaintenanceStartTime :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_maintenance_start_time_input ->
        (put_maintenance_start_time_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Set the maintenance start time for a gateway.\n"]
module StartVirtualMachinesMetadataSync :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_virtual_machines_metadata_sync_input ->
        (start_virtual_machines_metadata_sync_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This action sends a request to sync metadata across the specified virtual machines.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Tag the resource.\n"]
module TestHypervisorConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_hypervisor_configuration_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Tests your hypervisor configuration to validate that backup gateway can connect with the hypervisor and its resources.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Removes tags from the resource.\n"]
module UpdateGatewayInformation :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_information_input ->
        (update_gateway_information_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates a gateway's name. Specify which gateway to update using the Amazon Resource Name (ARN) of the gateway in your request.\n"]
module UpdateGatewaySoftwareNow :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_software_now_input ->
        (update_gateway_software_now_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.\n\n  When you make this request, you get a [200 OK] success response immediately. However, it might take some time for the update to complete.\n  \n   "]
module UpdateHypervisor :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_hypervisor_input ->
        (update_hypervisor_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates a hypervisor metadata, including its host, username, and password. Specify which hypervisor to update using the Amazon Resource Name (ARN) of the hypervisor in your request.\n"]