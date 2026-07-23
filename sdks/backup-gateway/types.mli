type nonrec string_ = string [@@ocaml.doc ""]

type nonrec access_denied_exception = {
  error_code : string_; [@ocaml.doc "A description of why you have insufficient permissions.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation cannot proceed because you have insufficient permissions.\n"]

type nonrec activation_key = string [@@ocaml.doc ""]

type nonrec conflict_exception = {
  error_code : string_; [@ocaml.doc "A description of why the operation is not supported.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation cannot proceed because it is not supported.\n"]

type nonrec gateway_arn = string [@@ocaml.doc ""]

type nonrec associate_gateway_to_server_output = {
  gateway_arn : gateway_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec server_arn = string [@@ocaml.doc ""]

type nonrec associate_gateway_to_server_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return \
         a list of gateways for your account and Amazon Web Services Region.\n"]
  server_arn : server_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the server that hosts your virtual machines.\n"]
}
[@@ocaml.doc ""]

type nonrec average_upload_rate_limit = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  error_code : string_ option; [@ocaml.doc "A description of which resource wasn't found.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "A resource that is required for the action wasn't found.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec untag_resource_output = {
  resource_ar_n : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource from which you removed tags.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  resource_ar_n : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource from which to remove tags.\n"]
  tag_keys : tag_keys; [@ocaml.doc "The list of tag keys specifying which tags to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_output = {
  resource_ar_n : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource you tagged.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc "The key part of a tag's key-value pair. The key can't start with [aws:].\n"]
  value : tag_value; [@ocaml.doc "The value part of a tag's key-value pair.\n"]
}
[@@ocaml.doc
  "A key-value pair you can use to manage, filter, and search for your resources. Allowed \
   characters include UTF-8 letters, numbers, and the following characters: + - = . _ : /. Spaces \
   are not allowed in tag values.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  resource_ar_n : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to tag.\n"]
  tags : tags; [@ocaml.doc "A list of tags to assign to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  resource_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource's tags that you listed.\n"]
  tags : tags option; [@ocaml.doc "A list of the resource's tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource's tags to list.\n"]
}
[@@ocaml.doc ""]

type nonrec day_of_week = int [@@ocaml.doc ""]

type nonrec days_of_week = day_of_week list [@@ocaml.doc ""]

type nonrec minute_of_hour = int [@@ocaml.doc ""]

type nonrec hour_of_day = int [@@ocaml.doc ""]

type nonrec bandwidth_rate_limit_interval = {
  average_upload_rate_limit_in_bits_per_sec : average_upload_rate_limit option;
      [@ocaml.doc
        "The average upload rate limit component of the bandwidth rate limit interval, in bits per \
         second. This field does not appear in the response if the upload rate limit is not set.\n"]
  start_hour_of_day : hour_of_day;
      [@ocaml.doc "The hour of the day to start the bandwidth rate limit interval.\n"]
  end_hour_of_day : hour_of_day;
      [@ocaml.doc "The hour of the day to end the bandwidth rate limit interval.\n"]
  start_minute_of_hour : minute_of_hour;
      [@ocaml.doc
        "The minute of the hour to start the bandwidth rate limit interval. The interval begins at \
         the start of that minute. To begin an interval exactly at the start of the hour, use the \
         value [0].\n"]
  end_minute_of_hour : minute_of_hour;
      [@ocaml.doc
        "The minute of the hour to end the bandwidth rate limit interval.\n\n\
        \  The bandwidth rate limit interval ends at the end of the minute. To end an interval at \
         the end of an hour, use the value [59].\n\
        \  \n\
        \   "]
  days_of_week : days_of_week;
      [@ocaml.doc
        "The days of the week component of the bandwidth rate limit interval, represented as \
         ordinal numbers from 0 to 6, where 0 represents Sunday and 6 represents Saturday.\n"]
}
[@@ocaml.doc
  "Describes a bandwidth rate limit interval for a gateway. A bandwidth rate limit schedule \
   consists of one or more bandwidth rate limit intervals. A bandwidth rate limit interval defines \
   a period of time on one or more days of the week, during which bandwidth rate limits are \
   specified for uploading, downloading, or both.\n"]

type nonrec bandwidth_rate_limit_intervals = bandwidth_rate_limit_interval list [@@ocaml.doc ""]

type nonrec bandwidth_rate_limit_schedule_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec create_gateway_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway you create.\n"]
}
[@@ocaml.doc ""]

type nonrec gateway_type = BACKUP_VM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec create_gateway_input = {
  activation_key : activation_key; [@ocaml.doc "The activation key of the created gateway.\n"]
  gateway_display_name : name; [@ocaml.doc "The display name of the created gateway.\n"]
  gateway_type : gateway_type; [@ocaml.doc "The type of created gateway.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags to assign to the gateway. Each tag is a key-value pair.\n"]
}
[@@ocaml.doc ""]

type nonrec day_of_month = int [@@ocaml.doc ""]

type nonrec delete_gateway_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway you deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_gateway_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_hypervisor_output = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor you deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_hypervisor_input = {
  hypervisor_arn : server_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_gateway_from_server_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway you disassociated.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_gateway_from_server_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to disassociate.\n"]
}
[@@ocaml.doc ""]

type nonrec time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec hypervisor_id = string [@@ocaml.doc ""]

type nonrec gateway = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return \
         a list of gateways for your account and Amazon Web Services Region.\n"]
  gateway_display_name : name option; [@ocaml.doc "The display name of the gateway.\n"]
  gateway_type : gateway_type option; [@ocaml.doc "The type of the gateway.\n"]
  hypervisor_id : hypervisor_id option; [@ocaml.doc "The hypervisor ID of the gateway.\n"]
  last_seen_time : time option;
      [@ocaml.doc
        "The last time Backup gateway communicated with the gateway, in Unix format and UTC time.\n"]
}
[@@ocaml.doc
  "A gateway is an Backup Gateway appliance that runs on the customer's network to provide \
   seamless connectivity to backup storage in the Amazon Web Services Cloud.\n"]

type nonrec vpc_endpoint = string [@@ocaml.doc ""]

type nonrec maintenance_start_time = {
  day_of_month : day_of_month option;
      [@ocaml.doc
        "The day of the month component of the maintenance start time represented as an ordinal \
         number from 1 to 28, where 1 represents the first day of the month and 28 represents the \
         last day of the month.\n"]
  day_of_week : day_of_week option;
      [@ocaml.doc
        "An ordinal number between 0 and 6 that represents the day of the week, where 0 represents \
         Sunday and 6 represents Saturday. The day of week is in the time zone of the gateway.\n"]
  hour_of_day : hour_of_day;
      [@ocaml.doc
        "The hour component of the maintenance start time represented as {i hh}, where {i hh} is \
         the hour (0 to 23). The hour of the day is in the time zone of the gateway.\n"]
  minute_of_hour : minute_of_hour;
      [@ocaml.doc
        "The minute component of the maintenance start time represented as {i mm}, where {i mm} is \
         the minute (0 to 59). The minute of the hour is in the time zone of the gateway.\n"]
}
[@@ocaml.doc
  "This is your gateway's weekly maintenance start time including the day and time of the week. \
   Note that values are in terms of the gateway's time zone. Can be weekly or monthly.\n"]

type nonrec gateway_details = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return \
         a list of gateways for your account and Amazon Web Services Region.\n"]
  gateway_display_name : name option; [@ocaml.doc "The display name of the gateway.\n"]
  gateway_type : gateway_type option; [@ocaml.doc "The type of the gateway type.\n"]
  hypervisor_id : hypervisor_id option; [@ocaml.doc "The hypervisor ID of the gateway.\n"]
  last_seen_time : time option;
      [@ocaml.doc
        "Details showing the last time Backup gateway communicated with the cloud, in Unix format \
         and UTC time.\n"]
  maintenance_start_time : maintenance_start_time option;
      [@ocaml.doc
        "Returns your gateway's weekly maintenance start time including the day and time of the \
         week. Note that values are in terms of the gateway's time zone. Can be weekly or monthly.\n"]
  next_update_availability_time : time option;
      [@ocaml.doc "Details showing the next update availability time of the gateway.\n"]
  vpc_endpoint : vpc_endpoint option;
      [@ocaml.doc
        "The DNS name for the virtual private cloud (VPC) endpoint the gateway uses to connect to \
         the cloud for backup gateway.\n"]
  deprecation_date : time option;
      [@ocaml.doc
        "Date after which this gateway will not receive software updates for new features and bug \
         fixes.\n"]
  software_version : name option;
      [@ocaml.doc "The version number of the software running on the gateway appliance.\n"]
}
[@@ocaml.doc "The details of gateway.\n"]

type nonrec gateway_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec gateways = gateway list [@@ocaml.doc ""]

type nonrec get_bandwidth_rate_limit_schedule_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the \
         {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} \
         [ListGateways] } operation to return a list of gateways for your account and Amazon Web \
         Services Region.\n"]
  bandwidth_rate_limit_intervals : bandwidth_rate_limit_intervals option;
      [@ocaml.doc
        "An array containing bandwidth rate limit schedule intervals for a gateway. When no \
         bandwidth rate limit intervals have been scheduled, the array is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bandwidth_rate_limit_schedule_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the \
         {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} \
         [ListGateways] } operation to return a list of gateways for your account and Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec get_gateway_output = {
  gateway : gateway_details option;
      [@ocaml.doc "By providing the ARN (Amazon Resource Name), this API returns the gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec get_gateway_input = {
  gateway_arn : gateway_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec sync_metadata_status =
  | CREATED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PARTIALLY_FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hypervisor_state =
  | PENDING [@ocaml.doc ""]
  | ONLINE [@ocaml.doc ""]
  | OFFLINE [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_group_arn = string [@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec host = string [@@ocaml.doc ""]

type nonrec hypervisor_details = {
  host : host option;
      [@ocaml.doc
        "The server host of the hypervisor. This can be either an IP address or a fully-qualified \
         domain name (FQDN).\n"]
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS used to encrypt the hypervisor.\n"]
  name : name option; [@ocaml.doc "This is the name of the specified hypervisor.\n"]
  log_group_arn : log_group_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the group of gateways within the requested log.\n"]
  state : hypervisor_state option;
      [@ocaml.doc
        "This is the current state of the specified hypervisor.\n\n\
        \ The possible states are [PENDING], [ONLINE], [OFFLINE], or [ERROR].\n\
        \ "]
  last_successful_metadata_sync_time : time option;
      [@ocaml.doc "This is the time when the most recent successful sync of metadata occurred.\n"]
  latest_metadata_sync_status_message : string_ option;
      [@ocaml.doc "This is the most recent status for the indicated metadata sync.\n"]
  latest_metadata_sync_status : sync_metadata_status option;
      [@ocaml.doc "This is the most recent status for the indicated metadata sync.\n"]
}
[@@ocaml.doc
  "These are the details of the specified hypervisor. A hypervisor is hardware, software, or \
   firmware that creates and manages virtual machines, and allocates resources to them.\n"]

type nonrec get_hypervisor_output = {
  hypervisor : hypervisor_details option; [@ocaml.doc "Details about the requested hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec get_hypervisor_input = {
  hypervisor_arn : server_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec vmware_tag_name = string [@@ocaml.doc ""]

type nonrec vmware_category = string [@@ocaml.doc ""]

type nonrec vmware_to_aws_tag_mapping = {
  vmware_category : vmware_category; [@ocaml.doc "The is the category of VMware.\n"]
  vmware_tag_name : vmware_tag_name; [@ocaml.doc "This is the user-defined name of a VMware tag.\n"]
  aws_tag_key : tag_key;
      [@ocaml.doc "The key part of the Amazon Web Services tag's key-value pair.\n"]
  aws_tag_value : tag_value;
      [@ocaml.doc "The value part of the Amazon Web Services tag's key-value pair.\n"]
}
[@@ocaml.doc
  "This displays the mapping of VMware tags to the corresponding Amazon Web Services tags.\n"]

type nonrec vmware_to_aws_tag_mappings = vmware_to_aws_tag_mapping list [@@ocaml.doc ""]

type nonrec get_hypervisor_property_mappings_output = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
  vmware_to_aws_tag_mappings : vmware_to_aws_tag_mappings option;
      [@ocaml.doc
        "This is a display of the mappings of VMware tags to the Amazon Web Services tags.\n"]
  iam_role_arn : iam_role_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role.\n"]
}
[@@ocaml.doc ""]

type nonrec get_hypervisor_property_mappings_input = {
  hypervisor_arn : server_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec vmware_tag = {
  vmware_category : vmware_category option; [@ocaml.doc "The is the category of VMware.\n"]
  vmware_tag_name : vmware_tag_name option;
      [@ocaml.doc "This is the user-defined name of a VMware tag.\n"]
  vmware_tag_description : string_ option;
      [@ocaml.doc "This is a user-defined description of a VMware tag.\n"]
}
[@@ocaml.doc
  "A VMware tag is a tag attached to a specific virtual machine. A \
   {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_Tag.html}tag} is a key-value \
   pair you can use to manage, filter, and search for your resources.\n\n\
  \ The content of VMware tags can be matched to Amazon Web Services tags.\n\
  \ "]

type nonrec vmware_tags = vmware_tag list [@@ocaml.doc ""]

type nonrec path = string [@@ocaml.doc ""]

type nonrec virtual_machine_details = {
  host_name : name option; [@ocaml.doc "The host name of the virtual machine.\n"]
  hypervisor_id : string_ option; [@ocaml.doc "The ID of the virtual machine's hypervisor.\n"]
  name : name option; [@ocaml.doc "The name of the virtual machine.\n"]
  path : path option; [@ocaml.doc "The path of the virtual machine.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual machine. For example, \
         [arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL].\n"]
  last_backup_date : time option;
      [@ocaml.doc
        "The most recent date a virtual machine was backed up, in Unix format and UTC time.\n"]
  vmware_tags : vmware_tags option;
      [@ocaml.doc
        "These are the details of the VMware tags associated with the specified virtual machine.\n"]
}
[@@ocaml.doc "Your [VirtualMachine] objects, ordered by their Amazon Resource Names (ARNs).\n"]

type nonrec get_virtual_machine_output = {
  virtual_machine : virtual_machine_details option;
      [@ocaml.doc
        "This object contains the basic attributes of [VirtualMachine] contained by the output of \
         [GetVirtualMachine] \n"]
}
[@@ocaml.doc ""]

type nonrec get_virtual_machine_input = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the virtual machine.\n"]
}
[@@ocaml.doc ""]

type nonrec hypervisor = {
  host : host option;
      [@ocaml.doc
        "The server host of the hypervisor. This can be either an IP address or a fully-qualified \
         domain name (FQDN).\n"]
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Key Management Service used to encrypt the \
         hypervisor.\n"]
  name : name option; [@ocaml.doc "The name of the hypervisor.\n"]
  state : hypervisor_state option; [@ocaml.doc "The state of the hypervisor.\n"]
}
[@@ocaml.doc
  "Represents the hypervisor's permissions to which the gateway will connect.\n\n\
  \ A hypervisor is hardware, software, or firmware that creates and manages virtual machines, and \
   allocates resources to them.\n\
  \ "]

type nonrec hypervisor_property_mapping_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec hypervisor_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec hypervisors = hypervisor list [@@ocaml.doc ""]

type nonrec import_hypervisor_configuration_output = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor you disassociated.\n"]
}
[@@ocaml.doc ""]

type nonrec password = string [@@ocaml.doc ""]

type nonrec username = string [@@ocaml.doc ""]

type nonrec import_hypervisor_configuration_input = {
  name : name; [@ocaml.doc "The name of the hypervisor.\n"]
  host : host;
      [@ocaml.doc
        "The server host of the hypervisor. This can be either an IP address or a fully-qualified \
         domain name (FQDN).\n"]
  username : username option; [@ocaml.doc "The username for the hypervisor.\n"]
  password : password option; [@ocaml.doc "The password for the hypervisor.\n"]
  kms_key_arn : kms_key_arn option; [@ocaml.doc "The Key Management Service for the hypervisor.\n"]
  tags : tags option; [@ocaml.doc "The tags of the hypervisor configuration to import.\n"]
}
[@@ocaml.doc ""]

type nonrec internal_server_exception = {
  error_code : string_ option; [@ocaml.doc "A description of which internal error occured.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation did not succeed because an internal error occurred. Try again later.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_gateways_output = {
  gateways : gateways option; [@ocaml.doc "A list of your gateways.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The next item following a partial list of returned resources. For example, if a request \
         is made to return [maxResults] number of resources, [NextToken] allows you to return more \
         items in your list starting at the location pointed to by the next token.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_gateways_input = {
  max_results : max_results option; [@ocaml.doc "The maximum number of gateways to list.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The next item following a partial list of returned resources. For example, if a request \
         is made to return [MaxResults] number of resources, [NextToken] allows you to return more \
         items in your list starting at the location pointed to by the next token.\n"]
}
[@@ocaml.doc ""]

type nonrec list_hypervisors_output = {
  hypervisors : hypervisors option;
      [@ocaml.doc
        "A list of your [Hypervisor] objects, ordered by their Amazon Resource Names (ARNs).\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The next item following a partial list of returned resources. For example, if a request \
         is made to return [maxResults] number of resources, [NextToken] allows you to return more \
         items in your list starting at the location pointed to by the next token.\n"]
}
[@@ocaml.doc ""]

type nonrec list_hypervisors_input = {
  max_results : max_results option; [@ocaml.doc "The maximum number of hypervisors to list.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The next item following a partial list of returned resources. For example, if a request \
         is made to return [maxResults] number of resources, [NextToken] allows you to return more \
         items in your list starting at the location pointed to by the next token.\n"]
}
[@@ocaml.doc ""]

type nonrec virtual_machine = {
  host_name : name option; [@ocaml.doc "The host name of the virtual machine.\n"]
  hypervisor_id : string_ option; [@ocaml.doc "The ID of the virtual machine's hypervisor.\n"]
  name : name option; [@ocaml.doc "The name of the virtual machine.\n"]
  path : path option; [@ocaml.doc "The path of the virtual machine.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual machine. For example, \
         [arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL].\n"]
  last_backup_date : time option;
      [@ocaml.doc
        "The most recent date a virtual machine was backed up, in Unix format and UTC time.\n"]
}
[@@ocaml.doc "A virtual machine that is on a hypervisor.\n"]

type nonrec virtual_machines = virtual_machine list [@@ocaml.doc ""]

type nonrec list_virtual_machines_output = {
  virtual_machines : virtual_machines option;
      [@ocaml.doc
        "A list of your [VirtualMachine] objects, ordered by their Amazon Resource Names (ARNs).\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The next item following a partial list of returned resources. For example, if a request \
         is made to return [maxResults] number of resources, [NextToken] allows you to return more \
         items in your list starting at the location pointed to by the next token.\n"]
}
[@@ocaml.doc ""]

type nonrec list_virtual_machines_input = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the hypervisor connected to your virtual machine.\n"]
  max_results : max_results option; [@ocaml.doc "The maximum number of virtual machines to list.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The next item following a partial list of returned resources. For example, if a request \
         is made to return [maxResults] number of resources, [NextToken] allows you to return more \
         items in your list starting at the location pointed to by the next token.\n"]
}
[@@ocaml.doc ""]

type nonrec put_bandwidth_rate_limit_schedule_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the \
         {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} \
         [ListGateways] } operation to return a list of gateways for your account and Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec put_bandwidth_rate_limit_schedule_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the \
         {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html} \
         [ListGateways] } operation to return a list of gateways for your account and Amazon Web \
         Services Region.\n"]
  bandwidth_rate_limit_intervals : bandwidth_rate_limit_intervals;
      [@ocaml.doc
        "An array containing bandwidth rate limit schedule intervals for a gateway. When no \
         bandwidth rate limit intervals have been scheduled, the array is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec put_hypervisor_property_mappings_output = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec put_hypervisor_property_mappings_input = {
  hypervisor_arn : server_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
  vmware_to_aws_tag_mappings : vmware_to_aws_tag_mappings;
      [@ocaml.doc
        "This action requests the mappings of VMware tags to the Amazon Web Services tags.\n"]
  iam_role_arn : iam_role_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role.\n"]
}
[@@ocaml.doc ""]

type nonrec put_maintenance_start_time_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a gateway for which you set the maintenance start time.\n"]
}
[@@ocaml.doc ""]

type nonrec put_maintenance_start_time_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the gateway, used to specify its maintenance start time.\n"]
  hour_of_day : hour_of_day; [@ocaml.doc "The hour of the day to start maintenance on a gateway.\n"]
  minute_of_hour : minute_of_hour;
      [@ocaml.doc "The minute of the hour to start maintenance on a gateway.\n"]
  day_of_week : day_of_week option;
      [@ocaml.doc "The day of the week to start maintenance on a gateway.\n"]
  day_of_month : day_of_month option;
      [@ocaml.doc
        "The day of the month start maintenance on a gateway.\n\n\
        \ Valid values range from [Sunday] to [Saturday].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec start_virtual_machines_metadata_sync_output = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec start_virtual_machines_metadata_sync_input = {
  hypervisor_arn : server_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec test_hypervisor_configuration_output = unit [@@ocaml.doc ""]

type nonrec test_hypervisor_configuration_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to the hypervisor to test.\n"]
  host : host;
      [@ocaml.doc
        "The server host of the hypervisor. This can be either an IP address or a fully-qualified \
         domain name (FQDN).\n"]
  username : username option; [@ocaml.doc "The username for the hypervisor.\n"]
  password : password option; [@ocaml.doc "The password for the hypervisor.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  error_code : string_;
      [@ocaml.doc
        "Error: TPS has been limited to protect against intentional or unintentional high request \
         volumes.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "TPS has been limited to protect against intentional or unintentional high request volumes.\n"]

type nonrec update_gateway_information_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway you updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_gateway_information_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to update.\n"]
  gateway_display_name : name option; [@ocaml.doc "The updated display name of the gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec update_gateway_software_now_output = {
  gateway_arn : gateway_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway you updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_gateway_software_now_input = {
  gateway_arn : gateway_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the gateway to be updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_hypervisor_output = {
  hypervisor_arn : server_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor you updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_hypervisor_input = {
  hypervisor_arn : server_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the hypervisor to update.\n"]
  host : host option;
      [@ocaml.doc
        "The updated host of the hypervisor. This can be either an IP address or a fully-qualified \
         domain name (FQDN).\n"]
  username : username option; [@ocaml.doc "The updated username for the hypervisor.\n"]
  password : password option; [@ocaml.doc "The updated password for the hypervisor.\n"]
  name : name option; [@ocaml.doc "The updated name for the hypervisor\n"]
  log_group_arn : log_group_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the group of gateways within the requested log.\n"]
}
[@@ocaml.doc ""]

type nonrec validation_exception = {
  error_code : string_ option; [@ocaml.doc "A description of what caused the validation error.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation did not succeed because a validation error occurred.\n"]

type nonrec virtual_machine_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
