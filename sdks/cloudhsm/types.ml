type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec timestamp = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
}
[@@ocaml.doc
  "A key-value pair that identifies or specifies metadata about an AWS CloudHSM resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec subscription_type = PRODUCTION [@ocaml.doc ""]
[@@ocaml.doc
  "Specifies the type of subscription for the HSM.\n\n\
  \ {ul\n\
  \       {-   {b PRODUCTION} - The HSM is being used in a production environment.\n\
  \           \n\
  \            }\n\
  \       {-   {b TRIAL} - The HSM is being used in a product trial.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec ssh_key = string [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_response = {
  status : string_; [@ocaml.doc "The status of the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_tags_from_resource_request = {
  tag_key_list : tag_key_list;
      [@ocaml.doc
        "The tag key or keys to remove.\n\n\
        \ Specify only the tag key to remove (not the value). To overwrite the value for an \
         existing tag, use [AddTagsToResource].\n\
        \ "]
  resource_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the AWS CloudHSM resource.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec invalid_request_exception = {
  retryable : boolean_ option; [@ocaml.doc "Indicates if the action can be retried.\n"]
  message : string_ option; [@ocaml.doc "Additional information about the error.\n"]
}
[@@ocaml.doc "Indicates that one or more of the request parameters are not valid.\n"]

type nonrec cloud_hsm_service_exception = {
  retryable : boolean_ option; [@ocaml.doc "Indicates if the action can be retried.\n"]
  message : string_ option; [@ocaml.doc "Additional information about the error.\n"]
}
[@@ocaml.doc "Indicates that an exception occurred in the AWS CloudHSM service.\n"]

type nonrec cloud_hsm_internal_exception = {
  retryable : boolean_ option; [@ocaml.doc "Indicates if the action can be retried.\n"]
  message : string_ option; [@ocaml.doc "Additional information about the error.\n"]
}
[@@ocaml.doc "Indicates that an internal error occurred.\n"]

type nonrec partition_serial = string [@@ocaml.doc ""]

type nonrec partition_serial_list = partition_serial list [@@ocaml.doc ""]

type nonrec partition_arn = string [@@ocaml.doc ""]

type nonrec partition_list = partition_arn list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec client_arn = string [@@ocaml.doc ""]

type nonrec modify_luna_client_response = {
  client_arn : client_arn option; [@ocaml.doc "The ARN of the client.\n"]
}
[@@ocaml.doc ""]

type nonrec certificate = string [@@ocaml.doc ""]

type nonrec modify_luna_client_request = {
  certificate : certificate; [@ocaml.doc "The new certificate for the client.\n"]
  client_arn : client_arn; [@ocaml.doc "The ARN of the client.\n"]
}
[@@ocaml.doc ""]

type nonrec hsm_arn = string [@@ocaml.doc ""]

type nonrec modify_hsm_response = { hsm_arn : hsm_arn option [@ocaml.doc "The ARN of the HSM.\n"] }
[@@ocaml.doc "Contains the output of the [ModifyHsm] operation.\n"]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec external_id = string [@@ocaml.doc ""]

type nonrec modify_hsm_request = {
  syslog_ip : ip_address option;
      [@ocaml.doc
        "The new IP address for the syslog monitoring server. The AWS CloudHSM service only \
         supports one syslog monitoring server.\n"]
  external_id : external_id option; [@ocaml.doc "The new external ID.\n"]
  iam_role_arn : iam_role_arn option; [@ocaml.doc "The new IAM role ARN.\n"]
  eni_ip : ip_address option;
      [@ocaml.doc
        "The new IP address for the elastic network interface (ENI) attached to the HSM.\n\n\
        \ If the HSM is moved to a different subnet, and an IP address is not specified, an IP \
         address will be randomly chosen from the CIDR range of the new subnet.\n\
        \ "]
  subnet_id : subnet_id option;
      [@ocaml.doc
        "The new identifier of the subnet that the HSM is in. The new subnet must be in the same \
         Availability Zone as the current subnet.\n"]
  hsm_arn : hsm_arn; [@ocaml.doc "The ARN of the HSM to modify.\n"]
}
[@@ocaml.doc "Contains the inputs for the [ModifyHsm] operation.\n"]

type nonrec hapg_arn = string [@@ocaml.doc ""]

type nonrec modify_hapg_response = {
  hapg_arn : hapg_arn option; [@ocaml.doc "The ARN of the high-availability partition group.\n"]
}
[@@ocaml.doc ""]

type nonrec label = string [@@ocaml.doc ""]

type nonrec modify_hapg_request = {
  partition_serial_list : partition_serial_list option;
      [@ocaml.doc
        "The list of partition serial numbers to make members of the high-availability partition \
         group.\n"]
  label : label option; [@ocaml.doc "The new label for the high-availability partition group.\n"]
  hapg_arn : hapg_arn; [@ocaml.doc "The ARN of the high-availability partition group to modify.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tag_list : tag_list; [@ocaml.doc "One or more tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the AWS CloudHSM resource.\n"]
}
[@@ocaml.doc ""]

type nonrec client_list = client_arn list [@@ocaml.doc ""]

type nonrec list_luna_clients_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If not null, more results are available. Pass this to [ListLunaClients] to retrieve the \
         next set of items.\n"]
  client_list : client_list; [@ocaml.doc "The list of clients.\n"]
}
[@@ocaml.doc ""]

type nonrec list_luna_clients_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The [NextToken] value from a previous call to [ListLunaClients]. Pass null if this is the \
         first call.\n"]
}
[@@ocaml.doc ""]

type nonrec hsm_list = hsm_arn list [@@ocaml.doc ""]

type nonrec list_hsms_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If not null, more results are available. Pass this value to [ListHsms] to retrieve the \
         next set of items.\n"]
  hsm_list : hsm_list option; [@ocaml.doc "The list of ARNs that identify the HSMs.\n"]
}
[@@ocaml.doc "Contains the output of the [ListHsms] operation.\n"]

type nonrec list_hsms_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The [NextToken] value from a previous call to [ListHsms]. Pass null if this is the first \
         call.\n"]
}
[@@ocaml.doc ""]

type nonrec hapg_list = hapg_arn list [@@ocaml.doc ""]

type nonrec list_hapgs_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If not null, more results are available. Pass this value to [ListHapgs] to retrieve the \
         next set of items.\n"]
  hapg_list : hapg_list; [@ocaml.doc "The list of high-availability partition groups.\n"]
}
[@@ocaml.doc ""]

type nonrec list_hapgs_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The [NextToken] value from a previous call to [ListHapgs]. Pass null if this is the first \
         call.\n"]
}
[@@ocaml.doc ""]

type nonrec a_z = string [@@ocaml.doc ""]

type nonrec az_list = a_z list [@@ocaml.doc ""]

type nonrec list_available_zones_response = {
  az_list : az_list option;
      [@ocaml.doc "The list of Availability Zones that have available AWS CloudHSM capacity.\n"]
}
[@@ocaml.doc ""]

type nonrec list_available_zones_request = unit [@@ocaml.doc ""]

type nonrec hsm_status =
  | DEGRADED [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hsm_serial_number = string [@@ocaml.doc ""]

type nonrec get_config_response = {
  config_cred : string_ option;
      [@ocaml.doc "The certificate file containing the server.pem files of the HSMs.\n"]
  config_file : string_ option; [@ocaml.doc "The chrystoki.conf configuration file.\n"]
  config_type : string_ option; [@ocaml.doc "The type of credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec client_version = FIVE_THREE [@ocaml.doc ""] | FIVE_ONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_config_request = {
  hapg_list : hapg_list;
      [@ocaml.doc
        "A list of ARNs that identify the high-availability partition groups that are associated \
         with the client.\n"]
  client_version : client_version; [@ocaml.doc "The client version.\n"]
  client_arn : client_arn; [@ocaml.doc "The ARN of the client.\n"]
}
[@@ocaml.doc ""]

type nonrec eni_id = string [@@ocaml.doc ""]

type nonrec certificate_fingerprint = string [@@ocaml.doc ""]

type nonrec describe_luna_client_response = {
  label : label option; [@ocaml.doc "The label of the client.\n"]
  last_modified_timestamp : timestamp option;
      [@ocaml.doc "The date and time the client was last modified.\n"]
  certificate_fingerprint : certificate_fingerprint option;
      [@ocaml.doc "The certificate fingerprint.\n"]
  certificate : certificate option;
      [@ocaml.doc "The certificate installed on the HSMs used by this client.\n"]
  client_arn : client_arn option; [@ocaml.doc "The ARN of the client.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_luna_client_request = {
  certificate_fingerprint : certificate_fingerprint option;
      [@ocaml.doc "The certificate fingerprint.\n"]
  client_arn : client_arn option; [@ocaml.doc "The ARN of the client.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_hsm_response = {
  partitions : partition_list option; [@ocaml.doc "The list of partitions on the HSM.\n"]
  server_cert_last_updated : timestamp option;
      [@ocaml.doc "The date and time that the server certificate was last updated.\n"]
  server_cert_uri : string_ option; [@ocaml.doc "The URI of the certificate server.\n"]
  ssh_key_last_updated : timestamp option;
      [@ocaml.doc "The date and time that the SSH key was last updated.\n"]
  ssh_public_key : ssh_key option; [@ocaml.doc "The public SSH key.\n"]
  software_version : string_ option; [@ocaml.doc "The HSM software version.\n"]
  hsm_type : string_ option; [@ocaml.doc "The HSM model type.\n"]
  vendor_name : string_ option; [@ocaml.doc "The name of the HSM vendor.\n"]
  serial_number : hsm_serial_number option; [@ocaml.doc "The serial number of the HSM.\n"]
  iam_role_arn : iam_role_arn option; [@ocaml.doc "The ARN of the IAM role assigned to the HSM.\n"]
  subnet_id : subnet_id option; [@ocaml.doc "The identifier of the subnet that the HSM is in.\n"]
  vpc_id : vpc_id option; [@ocaml.doc "The identifier of the VPC that the HSM is in.\n"]
  subscription_end_date : timestamp option; [@ocaml.doc "The subscription end date.\n"]
  subscription_start_date : timestamp option; [@ocaml.doc "The subscription start date.\n"]
  subscription_type : subscription_type option; [@ocaml.doc ""]
  eni_ip : ip_address option; [@ocaml.doc "The IP address assigned to the HSM's ENI.\n"]
  eni_id : eni_id option;
      [@ocaml.doc "The identifier of the elastic network interface (ENI) attached to the HSM.\n"]
  availability_zone : a_z option; [@ocaml.doc "The Availability Zone that the HSM is in.\n"]
  status_details : string_ option;
      [@ocaml.doc "Contains additional information about the status of the HSM.\n"]
  status : hsm_status option; [@ocaml.doc "The status of the HSM.\n"]
  hsm_arn : hsm_arn option; [@ocaml.doc "The ARN of the HSM.\n"]
}
[@@ocaml.doc "Contains the output of the [DescribeHsm] operation.\n"]

type nonrec describe_hsm_request = {
  hsm_serial_number : hsm_serial_number option;
      [@ocaml.doc
        "The serial number of the HSM. Either the [HsmArn] or the [HsmSerialNumber] parameter must \
         be specified.\n"]
  hsm_arn : hsm_arn option;
      [@ocaml.doc
        "The ARN of the HSM. Either the [HsmArn] or the [SerialNumber] parameter must be specified.\n"]
}
[@@ocaml.doc "Contains the inputs for the [DescribeHsm] operation.\n"]

type nonrec cloud_hsm_object_state =
  | DEGRADED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_hapg_response = {
  state : cloud_hsm_object_state option;
      [@ocaml.doc "The state of the high-availability partition group.\n"]
  partition_serial_list : partition_serial_list option;
      [@ocaml.doc
        "The list of partition serial numbers that belong to the high-availability partition group.\n"]
  last_modified_timestamp : timestamp option;
      [@ocaml.doc "The date and time the high-availability partition group was last modified.\n"]
  label : label option; [@ocaml.doc "The label for the high-availability partition group.\n"]
  hsms_pending_registration : hsm_list option; [@ocaml.doc "\n"]
  hsms_pending_deletion : hsm_list option; [@ocaml.doc "\n"]
  hsms_last_action_failed : hsm_list option; [@ocaml.doc "\n"]
  hapg_serial : string_ option;
      [@ocaml.doc "The serial number of the high-availability partition group.\n"]
  hapg_arn : hapg_arn option; [@ocaml.doc "The ARN of the high-availability partition group.\n"]
}
[@@ocaml.doc "Contains the output of the [DescribeHapg] action.\n"]

type nonrec describe_hapg_request = {
  hapg_arn : hapg_arn; [@ocaml.doc "The ARN of the high-availability partition group to describe.\n"]
}
[@@ocaml.doc "Contains the inputs for the [DescribeHapg] action.\n"]

type nonrec delete_luna_client_response = {
  status : string_; [@ocaml.doc "The status of the action.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_luna_client_request = {
  client_arn : client_arn; [@ocaml.doc "The ARN of the client to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_hsm_response = { status : string_ [@ocaml.doc "The status of the operation.\n"] }
[@@ocaml.doc "Contains the output of the [DeleteHsm] operation.\n"]

type nonrec delete_hsm_request = {
  hsm_arn : hsm_arn; [@ocaml.doc "The ARN of the HSM to delete.\n"]
}
[@@ocaml.doc "Contains the inputs for the [DeleteHsm] operation.\n"]

type nonrec delete_hapg_response = { status : string_ [@ocaml.doc "The status of the action.\n"] }
[@@ocaml.doc "Contains the output of the [DeleteHapg] action.\n"]

type nonrec delete_hapg_request = {
  hapg_arn : hapg_arn; [@ocaml.doc "The ARN of the high-availability partition group to delete.\n"]
}
[@@ocaml.doc "Contains the inputs for the [DeleteHapg] action.\n"]

type nonrec create_luna_client_response = {
  client_arn : client_arn option; [@ocaml.doc "The ARN of the client.\n"]
}
[@@ocaml.doc "Contains the output of the [CreateLunaClient] action.\n"]

type nonrec client_label = string [@@ocaml.doc ""]

type nonrec create_luna_client_request = {
  certificate : certificate;
      [@ocaml.doc
        "The contents of a Base64-Encoded X.509 v3 certificate to be installed on the HSMs used by \
         this client.\n"]
  label : client_label option; [@ocaml.doc "The label for the client.\n"]
}
[@@ocaml.doc "Contains the inputs for the [CreateLunaClient] action.\n"]

type nonrec create_hsm_response = { hsm_arn : hsm_arn option [@ocaml.doc "The ARN of the HSM.\n"] }
[@@ocaml.doc "Contains the output of the [CreateHsm] operation.\n"]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec create_hsm_request = {
  syslog_ip : ip_address option;
      [@ocaml.doc
        "The IP address for the syslog monitoring server. The AWS CloudHSM service only supports \
         one syslog monitoring server.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A user-defined token to ensure idempotence. Subsequent calls to this operation with the \
         same token will be ignored.\n"]
  subscription_type : subscription_type; [@ocaml.doc ""]
  external_id : external_id option; [@ocaml.doc "The external ID from [IamRoleArn], if present.\n"]
  iam_role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of an IAM role to enable the AWS CloudHSM service to allocate an ENI on your \
         behalf.\n"]
  eni_ip : ip_address option;
      [@ocaml.doc
        "The IP address to assign to the HSM's ENI.\n\n\
        \ If an IP address is not specified, an IP address will be randomly chosen from the CIDR \
         range of the subnet.\n\
        \ "]
  ssh_key : ssh_key; [@ocaml.doc "The SSH public key to install on the HSM.\n"]
  subnet_id : subnet_id;
      [@ocaml.doc "The identifier of the subnet in your VPC in which to place the HSM.\n"]
}
[@@ocaml.doc "Contains the inputs for the [CreateHsm] operation.\n"]

type nonrec create_hapg_response = {
  hapg_arn : hapg_arn option; [@ocaml.doc "The ARN of the high-availability partition group.\n"]
}
[@@ocaml.doc "Contains the output of the [CreateHAPartitionGroup] action.\n"]

type nonrec create_hapg_request = {
  label : label; [@ocaml.doc "The label of the new high-availability partition group.\n"]
}
[@@ocaml.doc "Contains the inputs for the [CreateHapgRequest] action.\n"]

type nonrec add_tags_to_resource_response = {
  status : string_; [@ocaml.doc "The status of the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec add_tags_to_resource_request = {
  tag_list : tag_list; [@ocaml.doc "One or more tags.\n"]
  resource_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the AWS CloudHSM resource to tag.\n"]
}
[@@ocaml.doc ""]
