type nonrec provision_state_enum =
  | ERROR_DEALLOCATING [@ocaml.doc ""]
  | ERROR_ALLOCATING [@ocaml.doc ""]
  | DEALLOCATED [@ocaml.doc ""]
  | DEALLOCATING [@ocaml.doc ""]
  | ALLOCATED [@ocaml.doc ""]
  | ALLOCATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspace_instance_id = string [@@ocaml.doc ""]

type nonrec ec2_managed_instance = {
  instance_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Unique identifier of the managed EC2 instance.\n"]
}
[@@ocaml.doc "Represents an EC2 instance managed by WorkSpaces.\n"]

type nonrec workspace_instance = {
  ec2_managed_instance : ec2_managed_instance option;
      [@ocaml.doc "Details of the associated EC2 managed instance.\n"]
  workspace_instance_id : workspace_instance_id option;
      [@ocaml.doc "Unique identifier for the WorkSpace Instance.\n"]
  provision_state : provision_state_enum option;
      [@ocaml.doc "Current provisioning state of the WorkSpace Instance.\n"]
}
[@@ocaml.doc "Represents a single WorkSpace Instance.\n"]

type nonrec workspace_instances = workspace_instance list [@@ocaml.doc ""]

type nonrec workspace_instance_error = {
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Detailed description of the WorkSpace Instance error.\n"]
  error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Unique error code for the WorkSpace Instance error.\n"]
}
[@@ocaml.doc "Captures errors specific to WorkSpace Instance operations.\n"]

type nonrec workspace_instance_errors = workspace_instance_error list [@@ocaml.doc ""]

type nonrec volume_type_enum =
  | GP3 [@ocaml.doc ""]
  | ST1 [@ocaml.doc ""]
  | SC1 [@ocaml.doc ""]
  | GP2 [@ocaml.doc ""]
  | IO2 [@ocaml.doc ""]
  | IO1 [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec volume_id = string [@@ocaml.doc ""]

type nonrec virtual_name = string [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | DEPENDENCY_FAILURE [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNSUPPORTED_OPERATION [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Detailed error message describing the validation issue.\n"]
  reason : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Reason for the validation failure.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Name of the field that failed validation.\n"]
}
[@@ocaml.doc "Represents a validation error field in an API request.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc "List of fields that failed validation.\n"]
  reason : validation_exception_reason; [@ocaml.doc "Specific reason for the validation failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Overall description of validation failures.\n"]
}
[@@ocaml.doc "Indicates invalid input parameters in the request.\n"]

type nonrec user_data = string [@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "Keys of tags to be removed.\n"]
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "Unique identifier of the WorkSpace Instance to untag.\n"]
}
[@@ocaml.doc "Specifies tags to remove from a WorkSpace Instance.\n"]

type nonrec throttling_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Recommended wait time before retrying the request.\n"]
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Specific code for the throttling quota.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Code identifying the service experiencing throttling.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Description of the throttling event.\n"]
}
[@@ocaml.doc "Indicates the request rate has exceeded limits.\n"]

type nonrec resource_not_found_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Type of the resource that was not found.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Identifier of the resource that was not found.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Details about the missing resource.\n"]
}
[@@ocaml.doc "Indicates the requested resource could not be found.\n"]

type nonrec internal_server_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Recommended wait time before retrying the request.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Description of the internal server error.\n"]
}
[@@ocaml.doc "Indicates an unexpected server-side error occurred.\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Detailed explanation of the access denial.\n"]
}
[@@ocaml.doc "Indicates insufficient permissions to perform the requested action.\n"]

type nonrec tenancy_enum =
  | HOST [@ocaml.doc ""]
  | DEDICATED [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec resource_type_enum =
  | NETWORK_INTERFACE [@ocaml.doc ""]
  | SPOT_INSTANCES_REQUEST [@ocaml.doc ""]
  | VOLUME [@ocaml.doc ""]
  | INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "Value associated with the tag key.\n"]
  key : tag_key option; [@ocaml.doc "Unique identifier for the tag.\n"]
}
[@@ocaml.doc "Represents a key-value metadata tag.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_specification = {
  tags : tag_list option; [@ocaml.doc "Collection of tags for the specified resource.\n"]
  resource_type : resource_type_enum option; [@ocaml.doc "Type of resource being tagged.\n"]
}
[@@ocaml.doc "Defines tagging configuration for a resource.\n"]

type nonrec tag_specifications = tag_specification list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "Tags to be added to the WorkSpace Instance.\n"]
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "Unique identifier of the WorkSpace Instance to tag.\n"]
}
[@@ocaml.doc "Specifies tags to add to a WorkSpace Instance.\n"]

type nonrec billing_mode = HOURLY [@ocaml.doc ""] | MONTHLY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec platform_type_enum =
  | SUSE [@ocaml.doc ""]
  | LINUX_BYOL [@ocaml.doc ""]
  | RHEL [@ocaml.doc ""]
  | UBUNTU_PRO [@ocaml.doc ""]
  | LINUX_UNIX [@ocaml.doc ""]
  | WINDOWS_BYOL [@ocaml.doc ""]
  | WINDOWS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_configuration_tenancy_enum =
  | DEDICATED [@ocaml.doc ""]
  | SHARED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec supported_instance_configuration = {
  tenancy : instance_configuration_tenancy_enum option;
      [@ocaml.doc "Specifies the tenancy model supported in this configuration combination.\n"]
  platform_type : platform_type_enum option;
      [@ocaml.doc
        "Specifies the operating system platform supported in this configuration combination.\n"]
  billing_mode : billing_mode option;
      [@ocaml.doc "Specifies the billing mode supported in this configuration combination.\n"]
}
[@@ocaml.doc
  "Represents a single valid configuration combination that an instance type supports, combining \
   tenancy, platform type, and billing mode into one complete configuration specification.\n"]

type nonrec supported_instance_configurations = supported_instance_configuration list
[@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec string64 = string [@@ocaml.doc ""]

type nonrec string128 = string [@@ocaml.doc ""]

type nonrec non_negative_integer = int [@@ocaml.doc ""]

type nonrec instance_interruption_behavior_enum = STOP [@ocaml.doc ""] | HIBERNATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec spot_instance_type_enum = PERSISTENT [@ocaml.doc ""] | ONE_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec spot_market_options = {
  valid_until_utc : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "Timestamp until which spot instance request is valid.\n"]
  spot_instance_type : spot_instance_type_enum option;
      [@ocaml.doc "Defines the type of spot instance request.\n"]
  max_price : string64 option; [@ocaml.doc "Maximum hourly price for spot instance.\n"]
  instance_interruption_behavior : instance_interruption_behavior_enum option;
      [@ocaml.doc "Specifies behavior when spot instance is interrupted.\n"]
  block_duration_minutes : non_negative_integer option;
      [@ocaml.doc "Duration of spot instance block reservation.\n"]
}
[@@ocaml.doc "Defines configuration for spot instance deployment.\n"]

type nonrec snapshot_id = string [@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Specific code for the exceeded quota.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Code identifying the service with the quota limitation.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Type of resource related to the quota.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Identifier of the resource related to the quota.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Description of the quota limitation.\n"]
}
[@@ocaml.doc "Indicates that a service quota has been exceeded.\n"]

type nonrec security_group_name = string [@@ocaml.doc ""]

type nonrec security_group_names = security_group_name list [@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_group_ids = security_group_id list [@@ocaml.doc ""]

type nonrec run_instances_monitoring_enabled = {
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables or disables detailed instance monitoring.\n"]
}
[@@ocaml.doc "Configures detailed monitoring for WorkSpace Instance.\n"]

type nonrec region_name = string [@@ocaml.doc ""]

type nonrec region = { region_name : region_name option [@ocaml.doc "Name of the AWS region.\n"] }
[@@ocaml.doc "Represents an AWS region supported by WorkSpaces Instances.\n"]

type nonrec region_list = region list [@@ocaml.doc ""]

type nonrec provision_states = provision_state_enum list [@@ocaml.doc ""]

type nonrec ipv4_address = string [@@ocaml.doc ""]

type nonrec private_ip_address_specification = {
  private_ip_address : ipv4_address option;
      [@ocaml.doc "Specific private IP address for the network interface.\n"]
  primary : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if this is the primary private IP address.\n"]
}
[@@ocaml.doc "Defines private IP address configuration for network interface.\n"]

type nonrec private_ip_addresses = private_ip_address_specification list [@@ocaml.doc ""]

type nonrec hostname_type_enum = RESOURCE_NAME [@ocaml.doc ""] | IP_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec private_dns_name_options_request = {
  enable_resource_name_dns_aaaa_record : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables DNS AAAA record for resource name resolution.\n"]
  enable_resource_name_dns_a_record : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables DNS A record for resource name resolution.\n"]
  hostname_type : hostname_type_enum option;
      [@ocaml.doc "Specifies the type of hostname configuration.\n"]
}
[@@ocaml.doc "Configures private DNS name settings for WorkSpace Instance.\n"]

type nonrec placement_group_id = string [@@ocaml.doc ""]

type nonrec availability_zone = string [@@ocaml.doc ""]

type nonrec host_id = string [@@ocaml.doc ""]

type nonrec ar_n = string [@@ocaml.doc ""]

type nonrec placement = {
  tenancy : tenancy_enum option; [@ocaml.doc "Defines instance tenancy configuration.\n"]
  partition_number : non_negative_integer option;
      [@ocaml.doc "Specifies partition number for partition placement groups.\n"]
  host_resource_group_arn : ar_n option; [@ocaml.doc "ARN of the host resource group.\n"]
  host_id : host_id option; [@ocaml.doc "Identifies the specific dedicated host.\n"]
  group_name : string64 option; [@ocaml.doc "Name of the placement group.\n"]
  group_id : placement_group_id option; [@ocaml.doc "Unique identifier for placement group.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc "Identifies the specific AWS availability zone.\n"]
  affinity : string64 option; [@ocaml.doc "Specifies host affinity for dedicated instances.\n"]
}
[@@ocaml.doc "Defines instance placement configuration for WorkSpace Instance.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec connection_tracking_specification_request = {
  udp_timeout : non_negative_integer option; [@ocaml.doc "General timeout for UDP connections.\n"]
  udp_stream_timeout : non_negative_integer option;
      [@ocaml.doc "Timeout for UDP stream connections.\n"]
  tcp_established_timeout : non_negative_integer option;
      [@ocaml.doc "Timeout for established TCP connections.\n"]
}
[@@ocaml.doc "Defines connection tracking parameters for network interfaces.\n"]

type nonrec description = string [@@ocaml.doc ""]

type nonrec ena_srd_udp_specification_request = {
  ena_srd_udp_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables or disables ENA SRD for UDP traffic.\n"]
}
[@@ocaml.doc "Specifies UDP configuration for ENA SRD.\n"]

type nonrec ena_srd_specification_request = {
  ena_srd_udp_specification : ena_srd_udp_specification_request option;
      [@ocaml.doc "Configures UDP-specific ENA SRD settings.\n"]
  ena_srd_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables or disables ENA SRD for network performance.\n"]
}
[@@ocaml.doc
  "Defines Elastic Network Adapter (ENA) Scalable Reliable Datagram (SRD) configuration.\n"]

type nonrec interface_type_enum =
  | EFA_ONLY [@ocaml.doc ""]
  | EFA [@ocaml.doc ""]
  | INTERFACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ipv4_prefix = string [@@ocaml.doc ""]

type nonrec ipv4_prefix_specification_request = {
  ipv4_prefix : ipv4_prefix option;
      [@ocaml.doc "Specific IPv4 prefix for network interface configuration.\n"]
}
[@@ocaml.doc "Specifies IPv4 prefix configuration for network interfaces.\n"]

type nonrec ipv4_prefixes = ipv4_prefix_specification_request list [@@ocaml.doc ""]

type nonrec ipv6_address = string [@@ocaml.doc ""]

type nonrec instance_ipv6_address = {
  is_primary_ipv6 : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if this is the primary IPv6 address for the instance.\n"]
  ipv6_address : ipv6_address option;
      [@ocaml.doc "Specific IPv6 address assigned to the instance.\n"]
}
[@@ocaml.doc "Represents an IPv6 address configuration for a WorkSpace Instance.\n"]

type nonrec ipv6_addresses = instance_ipv6_address list [@@ocaml.doc ""]

type nonrec ipv6_prefix = string [@@ocaml.doc ""]

type nonrec ipv6_prefix_specification_request = {
  ipv6_prefix : ipv6_prefix option;
      [@ocaml.doc "Specific IPv6 prefix for network interface configuration.\n"]
}
[@@ocaml.doc "Specifies IPv6 prefix configuration for network interfaces.\n"]

type nonrec ipv6_prefixes = ipv6_prefix_specification_request list [@@ocaml.doc ""]

type nonrec network_interface_id = string [@@ocaml.doc ""]

type nonrec instance_network_interface_specification = {
  subnet_id : subnet_id option; [@ocaml.doc "Subnet identifier for the network interface.\n"]
  groups : security_group_ids option;
      [@ocaml.doc "Security groups associated with the network interface.\n"]
  secondary_private_ip_address_count : non_negative_integer option;
      [@ocaml.doc "Number of additional private IP addresses to assign.\n"]
  private_ip_addresses : private_ip_addresses option;
      [@ocaml.doc "List of private IP addresses for the interface.\n"]
  private_ip_address : ipv4_address option;
      [@ocaml.doc "Primary private IP address for the interface.\n"]
  primary_ipv6 : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates the primary IPv6 configuration.\n"]
  network_interface_id : network_interface_id option;
      [@ocaml.doc "Unique identifier for the network interface.\n"]
  network_card_index : non_negative_integer option;
      [@ocaml.doc "Index of the network card for multiple network interfaces.\n"]
  ipv6_prefix_count : non_negative_integer option;
      [@ocaml.doc "Number of IPv6 prefixes to assign.\n"]
  ipv6_prefixes : ipv6_prefixes option;
      [@ocaml.doc "IPv6 prefix configurations for the interface.\n"]
  ipv6_addresses : ipv6_addresses option;
      [@ocaml.doc "Specific IPv6 addresses for the interface.\n"]
  ipv6_address_count : non_negative_integer option;
      [@ocaml.doc "Number of IPv6 addresses to assign.\n"]
  ipv4_prefix_count : non_negative_integer option;
      [@ocaml.doc "Number of IPv4 prefixes to assign.\n"]
  ipv4_prefixes : ipv4_prefixes option;
      [@ocaml.doc "IPv4 prefix configurations for the interface.\n"]
  interface_type : interface_type_enum option;
      [@ocaml.doc "Specifies the type of network interface.\n"]
  ena_srd_specification : ena_srd_specification_request option;
      [@ocaml.doc "Configures Elastic Network Adapter Scalable Reliable Datagram settings.\n"]
  device_index : non_negative_integer option;
      [@ocaml.doc "Unique index for the network interface.\n"]
  description : description option; [@ocaml.doc "Descriptive text for the network interface.\n"]
  connection_tracking_specification : connection_tracking_specification_request option;
      [@ocaml.doc "Configures network connection tracking parameters.\n"]
  associate_public_ip_address : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables public IP address assignment.\n"]
  associate_carrier_ip_address : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables carrier IP address association.\n"]
}
[@@ocaml.doc "Defines network interface configuration for WorkSpace Instance.\n"]

type nonrec network_interfaces = instance_network_interface_specification list [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec market_type_enum = CAPACITY_BLOCK [@ocaml.doc ""] | SPOT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec device_name = string [@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec ebs_block_device = {
  volume_size : non_negative_integer option; [@ocaml.doc "Size of the EBS volume in gigabytes.\n"]
  throughput : non_negative_integer option; [@ocaml.doc "Volume data transfer rate.\n"]
  iops : non_negative_integer option;
      [@ocaml.doc "Input/output operations per second for the volume.\n"]
  kms_key_id : kms_key_id option; [@ocaml.doc "KMS key used for volume encryption.\n"]
  encrypted : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the volume is encrypted.\n"]
  volume_type : volume_type_enum option; [@ocaml.doc "Type of EBS volume (e.g., gp2, io1).\n"]
}
[@@ocaml.doc "Defines configuration for an Elastic Block Store volume.\n"]

type nonrec block_device_mapping_request = {
  virtual_name : virtual_name option; [@ocaml.doc "Virtual device name for ephemeral storage.\n"]
  no_device : device_name option; [@ocaml.doc "Indicates device should not be mapped.\n"]
  ebs : ebs_block_device option; [@ocaml.doc "EBS volume configuration for the device.\n"]
  device_name : device_name option; [@ocaml.doc "Name of the device for storage mapping.\n"]
}
[@@ocaml.doc "Defines device mapping for WorkSpace Instance storage.\n"]

type nonrec block_device_mappings = block_device_mapping_request list [@@ocaml.doc ""]

type nonrec capacity_reservation_preference_enum =
  | NONE [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""]
  | CAPACITY_RESERVATIONS_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_reservation_target = {
  capacity_reservation_resource_group_arn : ar_n option;
      [@ocaml.doc "ARN of the capacity reservation resource group.\n"]
  capacity_reservation_id : string128 option;
      [@ocaml.doc "Unique identifier for the capacity reservation.\n"]
}
[@@ocaml.doc "Identifies a specific capacity reservation.\n"]

type nonrec capacity_reservation_specification = {
  capacity_reservation_target : capacity_reservation_target option;
      [@ocaml.doc "Specific capacity reservation target.\n"]
  capacity_reservation_preference : capacity_reservation_preference_enum option;
      [@ocaml.doc "Preference for using capacity reservation.\n"]
}
[@@ocaml.doc "Specifies capacity reservation preferences.\n"]

type nonrec amd_sev_snp_enum = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cpu_options_request = {
  threads_per_core : non_negative_integer option; [@ocaml.doc "Number of threads per CPU core.\n"]
  core_count : non_negative_integer option; [@ocaml.doc "Number of CPU cores to allocate.\n"]
  amd_sev_snp : amd_sev_snp_enum option;
      [@ocaml.doc "AMD Secure Encrypted Virtualization configuration.\n"]
}
[@@ocaml.doc "Configures CPU-specific settings for WorkSpace Instance.\n"]

type nonrec cpu_credits_enum = UNLIMITED [@ocaml.doc ""] | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec credit_specification_request = {
  cpu_credits : cpu_credits_enum option; [@ocaml.doc "CPU credit specification mode.\n"]
}
[@@ocaml.doc "Defines CPU credit configuration for burstable instances.\n"]

type nonrec enclave_options_request = {
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables or disables AWS Nitro Enclaves for enhanced security.\n"]
}
[@@ocaml.doc "Configures AWS Nitro Enclave options for the WorkSpace Instance.\n"]

type nonrec hibernation_options_request = {
  configured : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables or disables instance hibernation capability.\n"]
}
[@@ocaml.doc "Defines hibernation configuration for the WorkSpace Instance.\n"]

type nonrec iam_instance_profile_specification = {
  name : string64 option; [@ocaml.doc "Name of the IAM instance profile.\n"]
  arn : ar_n option; [@ocaml.doc "Amazon Resource Name (ARN) of the IAM instance profile.\n"]
}
[@@ocaml.doc "Defines IAM instance profile configuration for WorkSpace Instance.\n"]

type nonrec image_id = string [@@ocaml.doc ""]

type nonrec instance_market_options_request = {
  spot_options : spot_market_options option;
      [@ocaml.doc "Configuration options for spot instance deployment.\n"]
  market_type : market_type_enum option;
      [@ocaml.doc "Specifies the type of marketplace for instance deployment.\n"]
}
[@@ocaml.doc "Configures marketplace-specific instance deployment options.\n"]

type nonrec instance_type = string [@@ocaml.doc ""]

type nonrec license_configuration_request = {
  license_configuration_arn : ar_n option;
      [@ocaml.doc "ARN of the license configuration for the WorkSpace Instance.\n"]
}
[@@ocaml.doc "Specifies license configuration for WorkSpace Instance.\n"]

type nonrec license_specifications = license_configuration_request list [@@ocaml.doc ""]

type nonrec auto_recovery_enum = DEFAULT [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_maintenance_options_request = {
  auto_recovery : auto_recovery_enum option;
      [@ocaml.doc "Enables or disables automatic instance recovery.\n"]
}
[@@ocaml.doc "Configures automatic maintenance settings for WorkSpace Instance.\n"]

type nonrec http_endpoint_enum = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec http_protocol_ipv6_enum = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec http_put_response_hop_limit = int [@@ocaml.doc ""]

type nonrec http_tokens_enum = REQUIRED [@ocaml.doc ""] | OPTIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_metadata_tags_enum = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_metadata_options_request = {
  instance_metadata_tags : instance_metadata_tags_enum option;
      [@ocaml.doc "Enables or disables instance metadata tags retrieval.\n"]
  http_tokens : http_tokens_enum option;
      [@ocaml.doc "Configures token requirement for instance metadata retrieval.\n"]
  http_put_response_hop_limit : http_put_response_hop_limit option;
      [@ocaml.doc "Sets maximum number of network hops for metadata PUT responses.\n"]
  http_protocol_ipv6 : http_protocol_ipv6_enum option;
      [@ocaml.doc "Configures IPv6 support for instance metadata HTTP protocol.\n"]
  http_endpoint : http_endpoint_enum option;
      [@ocaml.doc "Enables or disables HTTP endpoint for instance metadata.\n"]
}
[@@ocaml.doc "Defines instance metadata service configuration.\n"]

type nonrec bandwidth_weighting_enum =
  | EBS_1 [@ocaml.doc ""]
  | VPC_1 [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_network_performance_options_request = {
  bandwidth_weighting : bandwidth_weighting_enum option;
      [@ocaml.doc "Defines bandwidth allocation strategy for network interfaces.\n"]
}
[@@ocaml.doc "Configures network performance settings for WorkSpace Instance.\n"]

type nonrec managed_instance_request = {
  user_data : user_data option;
      [@ocaml.doc "Provides custom initialization data for the instance.\n"]
  tag_specifications : tag_specifications option;
      [@ocaml.doc "Configures resource tagging specifications.\n"]
  subnet_id : subnet_id option; [@ocaml.doc "Identifies the subnet for the instance.\n"]
  security_groups : security_group_names option;
      [@ocaml.doc "Configures security group settings.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc "Specifies security group identifiers.\n"]
  ramdisk_id : string128 option; [@ocaml.doc "Identifies the ramdisk for the instance.\n"]
  private_ip_address : ipv4_address option;
      [@ocaml.doc "Specifies the primary private IP address.\n"]
  private_dns_name_options : private_dns_name_options_request option;
      [@ocaml.doc "Configures private DNS name settings.\n"]
  placement : placement option; [@ocaml.doc "Specifies instance placement preferences.\n"]
  network_performance_options : instance_network_performance_options_request option;
      [@ocaml.doc "Defines network performance configuration.\n"]
  network_interfaces : network_interfaces option;
      [@ocaml.doc "Configures network interface settings.\n"]
  monitoring : run_instances_monitoring_enabled option;
      [@ocaml.doc "Enables or disables detailed instance monitoring.\n"]
  metadata_options : instance_metadata_options_request option;
      [@ocaml.doc "Configures instance metadata service settings.\n"]
  maintenance_options : instance_maintenance_options_request option;
      [@ocaml.doc "Defines automatic maintenance settings.\n"]
  license_specifications : license_specifications option;
      [@ocaml.doc "Configures license-related settings.\n"]
  key_name : string64 option; [@ocaml.doc "Specifies the key pair for instance access.\n"]
  kernel_id : string128 option; [@ocaml.doc "Identifies the kernel for the instance.\n"]
  ipv6_address_count : non_negative_integer option;
      [@ocaml.doc "Specifies number of IPv6 addresses to assign.\n"]
  ipv6_addresses : ipv6_addresses option; [@ocaml.doc "Configures specific IPv6 addresses.\n"]
  instance_type : instance_type option; [@ocaml.doc "Specifies the WorkSpace Instance type.\n"]
  instance_market_options : instance_market_options_request option;
      [@ocaml.doc "Configures marketplace-specific deployment options.\n"]
  image_id : image_id option;
      [@ocaml.doc "Identifies the Amazon Machine Image (AMI) for the instance.\n"]
  iam_instance_profile : iam_instance_profile_specification option;
      [@ocaml.doc "Specifies IAM instance profile configuration.\n"]
  hibernation_options : hibernation_options_request option;
      [@ocaml.doc "Configures instance hibernation capabilities.\n"]
  enclave_options : enclave_options_request option;
      [@ocaml.doc "Configures AWS Nitro Enclave settings.\n"]
  enable_primary_ipv6 : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables primary IPv6 address configuration.\n"]
  ebs_optimized : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Enables optimized EBS performance.\n"]
  disable_api_stop : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Prevents API-initiated instance stop.\n"]
  credit_specification : credit_specification_request option;
      [@ocaml.doc "Defines CPU credit configuration for burstable instances.\n"]
  cpu_options : cpu_options_request option; [@ocaml.doc "Configures CPU-specific settings.\n"]
  capacity_reservation_specification : capacity_reservation_specification option;
      [@ocaml.doc "Specifies capacity reservation preferences.\n"]
  block_device_mappings : block_device_mappings option;
      [@ocaml.doc "Configures block device mappings for storage.\n"]
}
[@@ocaml.doc "Defines comprehensive configuration for a managed WorkSpace Instance.\n"]

type nonrec list_workspace_instances_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Token for retrieving additional WorkSpaces Instances if the result set is paginated.\n"]
  workspace_instances : workspace_instances;
      [@ocaml.doc "Collection of WorkSpaces Instances returned by the query.\n"]
}
[@@ocaml.doc "Contains the list of WorkSpaces Instances matching the specified criteria.\n"]

type nonrec list_workspace_instances_request = {
  next_token : next_token option;
      [@ocaml.doc "Pagination token for retrieving subsequent pages of WorkSpaces Instances.\n"]
  max_results : max_results option;
      [@ocaml.doc "Maximum number of WorkSpaces Instances to return in a single response.\n"]
  provision_states : provision_states option;
      [@ocaml.doc "Filter WorkSpaces Instances by their current provisioning states.\n"]
}
[@@ocaml.doc "Defines filters and pagination parameters for retrieving WorkSpaces Instances.\n"]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "Collection of tags associated with the WorkSpace Instance.\n"]
}
[@@ocaml.doc "Returns the list of tags for the specified WorkSpace Instance.\n"]

type nonrec list_tags_for_resource_request = {
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "Unique identifier of the WorkSpace Instance.\n"]
}
[@@ocaml.doc "Specifies the WorkSpace Instance to retrieve tags for.\n"]

type nonrec list_regions_response = {
  next_token : next_token option;
      [@ocaml.doc "Token for retrieving additional regions if the result set is paginated.\n"]
  regions : region_list;
      [@ocaml.doc "Collection of AWS regions supported by WorkSpaces Instances.\n"]
}
[@@ocaml.doc "Contains the list of supported AWS regions for WorkSpaces Instances.\n"]

type nonrec list_regions_request = {
  next_token : next_token option;
      [@ocaml.doc "Pagination token for retrieving subsequent pages of region results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of regions to return in a single API call. Enables pagination of region \
         results.\n"]
}
[@@ocaml.doc "Defines input parameters for retrieving supported WorkSpaces Instances regions.\n"]

type nonrec instance_type_info = {
  supported_instance_configurations : supported_instance_configurations option;
      [@ocaml.doc
        "Lists all valid combinations of tenancy, platform type, and billing mode supported for \
         the specific WorkSpace Instance type. Contains the complete set of configuration options \
         available for this instance type.\n"]
  instance_type : instance_type option;
      [@ocaml.doc "Unique identifier for the WorkSpace Instance type.\n"]
}
[@@ocaml.doc "Provides details about a specific WorkSpace Instance type.\n"]

type nonrec instance_types = instance_type_info list [@@ocaml.doc ""]

type nonrec list_instance_types_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Token for retrieving additional instance types if the result set is paginated.\n"]
  instance_types : instance_types;
      [@ocaml.doc "Collection of supported instance types for WorkSpaces Instances.\n"]
}
[@@ocaml.doc "Contains the list of instance types supported by WorkSpaces Instances.\n"]

type nonrec list_instance_types_max_results = int [@@ocaml.doc ""]

type nonrec instance_configuration_filter = {
  tenancy : instance_configuration_tenancy_enum;
      [@ocaml.doc
        "Filters WorkSpace Instance types by tenancy model. Allows customers to find instances \
         that match their tenancy requirements, such as SHARED or DEDICATED.\n"]
  platform_type : platform_type_enum;
      [@ocaml.doc
        "Filters WorkSpace Instance types by operating system platform. Allows customers to find \
         instances that support their desired OS, such as Windows, Linux/UNIX, Ubuntu Pro, RHEL, \
         or SUSE.\n"]
  billing_mode : billing_mode;
      [@ocaml.doc
        "Filters WorkSpace Instance types based on supported billing modes. Allows customers to \
         search for instance types that support their preferred billing model, such as HOURLY or \
         MONTHLY billing.\n"]
}
[@@ocaml.doc
  "Defines filtering criteria for WorkSpace Instance type searches. Combines multiple filter \
   conditions including billing mode, platform type, and tenancy to help customers find instance \
   types that meet their specific requirements.\n"]

type nonrec list_instance_types_request = {
  instance_configuration_filter : instance_configuration_filter option;
      [@ocaml.doc
        "Optional filter to narrow instance type results based on configuration requirements. Only \
         returns instance types that support the specified combination of tenancy, platform type, \
         and billing mode.\n"]
  next_token : next_token option;
      [@ocaml.doc "Pagination token for retrieving subsequent pages of instance type results.\n"]
  max_results : list_instance_types_max_results option;
      [@ocaml.doc
        "Maximum number of instance types to return in a single API call. Enables pagination of \
         instance type results.\n"]
}
[@@ocaml.doc
  "Defines input parameters for retrieving supported WorkSpaces Instances instance types.\n"]

type nonrec ec2_instance_error = {
  ec2_error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Detailed description of the EC2 instance error.\n"]
  ec2_exception_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Type of exception encountered during EC2 instance operation.\n"]
  ec2_error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Unique error code identifying the specific EC2 instance error.\n"]
}
[@@ocaml.doc "Captures detailed error information for EC2 instance operations.\n"]

type nonrec ec2_instance_errors = ec2_instance_error list [@@ocaml.doc ""]

type nonrec billing_configuration = {
  billing_mode : billing_mode;
      [@ocaml.doc
        "Specifies the billing mode for WorkSpace Instances. MONTHLY provides fixed monthly rates \
         for predictable budgeting, while HOURLY enables pay-per-second billing for actual usage.\n"]
}
[@@ocaml.doc
  "Defines billing configuration settings for WorkSpace Instances, containing the billing mode \
   selection.\n"]

type nonrec get_workspace_instance_response = {
  billing_configuration : billing_configuration option;
      [@ocaml.doc
        "Returns the current billing configuration for the WorkSpace Instance, indicating the \
         active billing mode.\n"]
  ec2_managed_instance : ec2_managed_instance option;
      [@ocaml.doc "Details of the associated EC2 managed instance.\n"]
  workspace_instance_id : workspace_instance_id option;
      [@ocaml.doc "Unique identifier of the retrieved WorkSpaces Instance.\n"]
  provision_state : provision_state_enum option;
      [@ocaml.doc "Current provisioning state of the WorkSpaces Instance.\n"]
  ec2_instance_errors : ec2_instance_errors option;
      [@ocaml.doc "Includes any underlying EC2 instance errors encountered.\n"]
  workspace_instance_errors : workspace_instance_errors option;
      [@ocaml.doc "Captures any errors specific to the WorkSpace Instance lifecycle.\n"]
}
[@@ocaml.doc "Provides comprehensive details about the requested WorkSpaces Instance.\n"]

type nonrec get_workspace_instance_request = {
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "Unique identifier of the WorkSpace Instance to retrieve.\n"]
}
[@@ocaml.doc "Identifies the WorkSpaces Instance to retrieve detailed information for.\n"]

type nonrec conflict_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Type of the conflicting resource.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Identifier of the conflicting resource.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Description of the conflict encountered.\n"]
}
[@@ocaml.doc "Signals a conflict with the current state of the resource.\n"]

type nonrec disassociate_volume_response = unit [@@ocaml.doc ""]

type nonrec disassociate_mode_enum = NO_FORCE [@ocaml.doc ""] | FORCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec disassociate_volume_request = {
  disassociate_mode : disassociate_mode_enum option; [@ocaml.doc "Mode for volume detachment.\n"]
  device : device_name option; [@ocaml.doc "Device path of volume to detach.\n"]
  volume_id : volume_id; [@ocaml.doc "Volume to be detached.\n"]
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "WorkSpace Instance to detach volume from.\n"]
}
[@@ocaml.doc "Specifies volume detachment parameters.\n"]

type nonrec delete_workspace_instance_response = unit [@@ocaml.doc ""]

type nonrec delete_workspace_instance_request = {
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "Unique identifier of the WorkSpaces Instance targeted for deletion.\n"]
}
[@@ocaml.doc "The WorkSpace to delete\n"]

type nonrec delete_volume_response = unit [@@ocaml.doc ""]

type nonrec delete_volume_request = {
  volume_id : volume_id; [@ocaml.doc "Identifier of the volume to delete.\n"]
}
[@@ocaml.doc "Specifies the volume to delete.\n"]

type nonrec create_workspace_instance_response = {
  workspace_instance_id : workspace_instance_id option;
      [@ocaml.doc "Unique identifier assigned to the newly created WorkSpaces Instance.\n"]
}
[@@ocaml.doc "Returns the unique identifier for the newly created WorkSpaces Instance.\n"]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec create_workspace_instance_request = {
  billing_configuration : billing_configuration option;
      [@ocaml.doc
        "Optional billing configuration for the WorkSpace Instance. Allows customers to specify \
         their preferred billing mode when creating a new instance. Defaults to hourly billing if \
         not specified.\n"]
  managed_instance : managed_instance_request;
      [@ocaml.doc
        "Comprehensive configuration settings for the WorkSpaces Instance, including network, \
         compute, and storage parameters.\n"]
  tags : tag_list option;
      [@ocaml.doc "Optional metadata tags for categorizing and managing WorkSpaces Instances.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique token to ensure idempotent instance creation, preventing duplicate workspace \
         launches.\n"]
}
[@@ocaml.doc "Defines the configuration parameters for creating a new WorkSpaces Instance.\n"]

type nonrec create_volume_response = {
  volume_id : volume_id option; [@ocaml.doc "Unique identifier for the new volume.\n"]
}
[@@ocaml.doc "Returns the created volume identifier.\n"]

type nonrec create_volume_request = {
  volume_type : volume_type_enum option; [@ocaml.doc "Type of EBS volume.\n"]
  throughput : non_negative_integer option; [@ocaml.doc "Volume throughput performance.\n"]
  tag_specifications : tag_specifications option; [@ocaml.doc "Metadata tags for the volume.\n"]
  snapshot_id : snapshot_id option; [@ocaml.doc "Source snapshot for volume creation.\n"]
  size_in_g_b : non_negative_integer option; [@ocaml.doc "Volume size in gigabytes.\n"]
  kms_key_id : kms_key_id option; [@ocaml.doc "KMS key for volume encryption.\n"]
  iops : non_negative_integer option;
      [@ocaml.doc "Input/output operations per second for the volume.\n"]
  encrypted : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the volume should be encrypted.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique token to prevent duplicate volume creation.\n"]
  availability_zone : string64; [@ocaml.doc "Availability zone for the volume.\n"]
}
[@@ocaml.doc "Specifies volume creation parameters.\n"]

type nonrec associate_volume_response = unit [@@ocaml.doc ""]

type nonrec associate_volume_request = {
  device : device_name; [@ocaml.doc "Device path for volume attachment.\n"]
  volume_id : volume_id; [@ocaml.doc "Volume to be attached.\n"]
  workspace_instance_id : workspace_instance_id;
      [@ocaml.doc "WorkSpace Instance to attach volume to.\n"]
}
[@@ocaml.doc "Specifies volume attachment parameters.\n"]
