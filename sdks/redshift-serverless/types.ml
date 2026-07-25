type nonrec access_denied_exception = {
  code : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec account_id_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec workgroup_name = string [@@ocaml.doc ""]

type nonrec custom_domain_name = string [@@ocaml.doc ""]

type nonrec custom_domain_certificate_arn_string = string [@@ocaml.doc ""]

type nonrec association = {
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
  custom_domain_certificate_expiry_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration time for the certificate.\n"]
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  workgroup_name : workgroup_name option;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
}
[@@ocaml.doc "An object that represents the custom domain name association.\n"]

type nonrec association_list = association list [@@ocaml.doc ""]

type nonrec capacity = int [@@ocaml.doc ""]

type nonrec catalog_name_string = string [@@ocaml.doc ""]

type nonrec charge = float [@@ocaml.doc ""]

type nonrec parameter_value = string [@@ocaml.doc ""]

type nonrec parameter_key = string [@@ocaml.doc ""]

type nonrec config_parameter = {
  parameter_key : parameter_key option;
      [@ocaml.doc
        "The key of the parameter. The options are [auto_mv], [datestyle], \
         [enable_case_sensitive_identifier], [enable_user_activity_logging], [query_group], \
         [search_path], [require_ssl], [use_fips_ssl], and either [wlm_json_configuration] or \
         query monitoring metrics that let you define performance boundaries. You can either \
         specify individual query monitoring metrics (such as [max_scan_row_count], \
         [max_query_execution_time]) or use [wlm_json_configuration] to define query queues with \
         rules, but not both. For more information about query monitoring rules and available \
         metrics, see \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless}Query \
         monitoring metrics for Amazon Redshift Serverless}.\n"]
  parameter_value : parameter_value option; [@ocaml.doc "The value of the parameter to set.\n"]
}
[@@ocaml.doc
  "An array of key-value pairs to set for advanced control over Amazon Redshift Serverless.\n"]

type nonrec config_parameter_list = config_parameter list [@@ocaml.doc ""]

type nonrec conflict_exception = { message : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc "The submitted action has conflicts.\n"]

type nonrec validation_exception = { message : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc
  "The input failed to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec too_many_tags_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  resource_name : amazon_resource_name option;
      [@ocaml.doc
        "The name of the resource that exceeded the number of tags allowed for a resource.\n"]
}
[@@ocaml.doc "The request exceeded the number of tags allowed for a resource.\n"]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The service limit was exceeded.\n"]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  resource_name : amazon_resource_name option;
      [@ocaml.doc "The name of the resource that could not be found.\n"]
}
[@@ocaml.doc "The resource could not be found.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception or failure.\n"]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec snapshot_status =
  | AVAILABLE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COPYING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot = {
  namespace_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the namepsace.\n"]
  namespace_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the namespace the snapshot was created from.\n"]
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the snapshot.\n"]
  snapshot_create_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the snapshot was created.\n"]
  admin_username : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The username of the database within a snapshot.\n"]
  status : snapshot_status option; [@ocaml.doc "The status of the snapshot.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc "The unique identifier of the KMS key used to encrypt the snapshot.\n"]
  owner_account : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The owner Amazon Web Services; account of the snapshot.\n"]
  total_backup_size_in_mega_bytes : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total size, in megabytes, of how big the snapshot is.\n"]
  actual_incremental_backup_size_in_mega_bytes : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The size of the incremental backup in megabytes.\n"]
  backup_progress_in_mega_bytes : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The size in megabytes of the data that has been backed up to a snapshot.\n"]
  current_backup_rate_in_mega_bytes_per_second : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The rate at which data is backed up into a snapshot in megabytes per second.\n"]
  estimated_seconds_to_completion : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The estimated amount of seconds until the snapshot completes backup.\n"]
  elapsed_time_in_seconds : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The amount of time it took to back up data into a snapshot.\n"]
  snapshot_retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The period of time, in days, of how long the snapshot is retained.\n"]
  snapshot_remaining_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of days until the snapshot is deleted.\n"]
  snapshot_retention_start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when data within the snapshot started getting retained.\n"]
  snapshot_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the snapshot.\n"]
  accounts_with_restore_access : account_id_list option;
      [@ocaml.doc
        "All of the Amazon Web Services accounts that have access to restore a snapshot to a \
         namespace.\n"]
  accounts_with_provisioned_restore_access : account_id_list option;
      [@ocaml.doc
        "All of the Amazon Web Services accounts that have access to restore a snapshot to a \
         provisioned cluster.\n"]
  admin_password_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the namespace's admin user credentials secret.\n"]
  admin_password_secret_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's \
         admin credentials secret.\n"]
}
[@@ocaml.doc "A snapshot object that contains databases.\n"]

type nonrec convert_recovery_point_to_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The snapshot converted from the recovery point.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key to use in the tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc "A map of key-value pairs.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec convert_recovery_point_to_snapshot_request = {
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the recovery point.\n"]
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the snapshot.\n"]
  retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "How long to retain the snapshot.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of \
         {{:https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_Tag.html}Tag \
         objects} to associate with the created snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  code : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec create_custom_domain_association_response = {
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc "The custom domain name to associate with the workgroup.\n"]
  workgroup_name : workgroup_name option;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
  custom_domain_certificate_expiry_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration time for the certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_domain_association_request = {
  workgroup_name : workgroup_name;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_name : custom_domain_name;
      [@ocaml.doc "The custom domain name to associate with the workgroup.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec network_interface = {
  network_interface_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the network interface.\n"]
  subnet_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the subnet.\n"]
  private_ip_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The IPv4 address of the network interface within the subnet.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The availability Zone.\n"]
  ipv6_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The IPv6 address of the network interface within the subnet.\n"]
}
[@@ocaml.doc
  "Contains information about a network interface in an Amazon Redshift Serverless managed VPC \
   endpoint. \n"]

type nonrec network_interface_list = network_interface list [@@ocaml.doc ""]

type nonrec vpc_endpoint = {
  vpc_endpoint_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The connection endpoint ID for connecting to Amazon Redshift Serverless.\n"]
  vpc_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The VPC identifier that the endpoint is associated with.\n"]
  network_interfaces : network_interface_list option;
      [@ocaml.doc
        "One or more network interfaces of the endpoint. Also known as an interface endpoint.\n"]
}
[@@ocaml.doc
  "The connection endpoint for connecting to Amazon Redshift Serverless through the proxy.\n"]

type nonrec vpc_security_group_id = string [@@ocaml.doc ""]

type nonrec vpc_security_group_membership = {
  vpc_security_group_id : vpc_security_group_id option;
      [@ocaml.doc "The unique identifier of the VPC security group.\n"]
  status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The status of the VPC security group.\n"]
}
[@@ocaml.doc "Describes the members of a VPC security group.\n"]

type nonrec vpc_security_group_membership_list = vpc_security_group_membership list [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnet_id_list = subnet_id list [@@ocaml.doc ""]

type nonrec endpoint_access = {
  endpoint_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the VPC endpoint.\n"]
  endpoint_status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The status of the VPC endpoint.\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the workgroup associated with the endpoint.\n"]
  endpoint_create_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time that the endpoint was created.\n"]
  port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The port number on which Amazon Redshift Serverless accepts incoming connections.\n"]
  address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The DNS address of the endpoint.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc
        "The unique identifier of subnets where Amazon Redshift Serverless choose to deploy the \
         VPC endpoint.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc "The security groups associated with the endpoint.\n"]
  vpc_endpoint : vpc_endpoint option;
      [@ocaml.doc "The connection endpoint for connecting to Amazon Redshift Serverless.\n"]
  endpoint_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the VPC endpoint.\n"]
}
[@@ocaml.doc "Information about an Amazon Redshift Serverless VPC endpoint.\n"]

type nonrec create_endpoint_access_response = {
  endpoint : endpoint_access option; [@ocaml.doc "The created VPC endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec owner_account = string [@@ocaml.doc ""]

type nonrec vpc_security_group_id_list = vpc_security_group_id list [@@ocaml.doc ""]

type nonrec create_endpoint_access_request = {
  endpoint_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The name of the VPC endpoint. An endpoint name must contain 1-30 characters. Valid \
         characters are A-Z, a-z, 0-9, and hyphen(-). The first character must be a letter. The \
         name can't contain two consecutive hyphens or end with a hyphen.\n"]
  subnet_ids : subnet_id_list;
      [@ocaml.doc
        "The unique identifers of subnets from which Amazon Redshift Serverless chooses one to \
         deploy a VPC endpoint.\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the workgroup to associate with the VPC endpoint.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "The unique identifiers of the security group that defines the ports, protocols, and \
         sources for inbound traffic that you are authorizing into your endpoint.\n"]
  owner_account : owner_account option;
      [@ocaml.doc
        "The owner Amazon Web Services account for the Amazon Redshift Serverless workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_status =
  | AVAILABLE [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_export =
  | USER_ACTIVITY_LOG [@ocaml.doc ""]
  | USER_LOG [@ocaml.doc ""]
  | CONNECTION_LOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_export_list = log_export list [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec iam_role_arn_list = iam_role_arn list [@@ocaml.doc ""]

type nonrec db_user = string [@@ocaml.doc ""]

type nonrec namespace_name = string [@@ocaml.doc ""]

type nonrec namespace = {
  namespace_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with a namespace.\n"]
  namespace_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of a namespace.\n"]
  namespace_name : namespace_name option;
      [@ocaml.doc
        "The name of the namespace. Must be between 3-64 alphanumeric characters in lowercase, and \
         it cannot be a reserved word. A list of reserved words can be found in \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words} in \
         the Amazon Redshift Database Developer Guide.\n"]
  admin_username : db_user option;
      [@ocaml.doc
        "The username of the administrator for the first database created in the namespace.\n"]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the first database created in the namespace.\n"]
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Key Management Service key used to encrypt your data.\n"]
  default_iam_role_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to set as a default in the namespace.\n"]
  iam_roles : iam_role_arn_list option;
      [@ocaml.doc "A list of IAM roles to associate with the namespace.\n"]
  log_exports : log_export_list option;
      [@ocaml.doc
        "The types of logs the namespace can export. Available export types are User log, \
         Connection log, and User activity log.\n"]
  status : namespace_status option; [@ocaml.doc "The status of the namespace.\n"]
  creation_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date of when the namespace was created.\n"]
  admin_password_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the namespace's admin user credentials secret.\n"]
  admin_password_secret_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's \
         admin credentials secret.\n"]
  lakehouse_registration_status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The status of the lakehouse registration for the namespace. Indicates whether the \
         namespace is successfully registered with Amazon Redshift federated permissions.\n"]
  catalog_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Glue Data Catalog associated with the namespace \
         enabled with Amazon Redshift federated permissions.\n"]
}
[@@ocaml.doc "A collection of database objects and users.\n"]

type nonrec create_namespace_response = {
  namespace : namespace option; [@ocaml.doc "The created namespace object.\n"]
}
[@@ocaml.doc ""]

type nonrec redshift_idc_application_arn = string [@@ocaml.doc ""]

type nonrec db_password = string [@@ocaml.doc ""]

type nonrec create_namespace_request = {
  namespace_name : namespace_name; [@ocaml.doc "The name of the namespace.\n"]
  admin_username : db_user option;
      [@ocaml.doc
        "The username of the administrator for the first database created in the namespace.\n"]
  admin_user_password : db_password option;
      [@ocaml.doc
        "The password of the administrator for the first database created in the namespace.\n\n\
        \ You can't use [adminUserPassword] if [manageAdminPassword] is true. \n\
        \ "]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the first database created in the namespace.\n"]
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Key Management Service key used to encrypt your data.\n"]
  default_iam_role_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to set as a default in the namespace.\n"]
  iam_roles : iam_role_arn_list option;
      [@ocaml.doc "A list of IAM roles to associate with the namespace.\n"]
  log_exports : log_export_list option;
      [@ocaml.doc
        "The types of logs the namespace can export. Available export types are [userlog], \
         [connectionlog], and [useractivitylog].\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
  manage_admin_password : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "If [true], Amazon Redshift uses Secrets Manager to manage the namespace's admin \
         credentials. You can't use [adminUserPassword] if [manageAdminPassword] is true. If \
         [manageAdminPassword] is false or not set, Amazon Redshift uses [adminUserPassword] for \
         the admin user account's password. \n"]
  admin_password_secret_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's \
         admin credentials secret. You can only use this parameter if [manageAdminPassword] is \
         true.\n"]
  redshift_idc_application_arn : redshift_idc_application_arn option;
      [@ocaml.doc
        "The ARN for the Redshift application that integrates with IAM Identity Center.\n"]
}
[@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec offering_type = ALL_UPFRONT [@ocaml.doc ""] | NO_UPFRONT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec currency_code = string [@@ocaml.doc ""]

type nonrec duration = int [@@ocaml.doc ""]

type nonrec offering_id = string [@@ocaml.doc ""]

type nonrec reservation_offering = {
  offering_id : offering_id option; [@ocaml.doc "The offering identifier.\n"]
  duration : duration option;
      [@ocaml.doc "The duration, in seconds, for which the reservation reserves the RPUs.\n"]
  upfront_charge : charge option;
      [@ocaml.doc "The up-front price you are charged for the reservation.\n"]
  hourly_charge : charge option;
      [@ocaml.doc "The rate you are charged for each hour the reservation is active.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the offering.\n"]
  offering_type : offering_type option;
      [@ocaml.doc "Determines the payment schedule for the reservation.\n"]
}
[@@ocaml.doc
  "The class of offering for the reservation. The offering class determines the payment schedule \
   for the reservation.\n"]

type nonrec reservation_arn = string [@@ocaml.doc ""]

type nonrec reservation_id = string [@@ocaml.doc ""]

type nonrec reservation = {
  reservation_id : reservation_id option;
      [@ocaml.doc "The identifier that uniquely identifies the serverless reservation.\n"]
  reservation_arn : reservation_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies the serverless reservation.\n"]
  start_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The start date for the serverless reservation. This is the date you created the \
         reservation.\n"]
  end_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The end date for the serverless reservation. This date is one year after the start date \
         that you specify.\n"]
  capacity : capacity option;
      [@ocaml.doc "The number of Redshift Processing Units (RPUs) to reserve.\n"]
  offering : reservation_offering option;
      [@ocaml.doc
        "The type of offering for the reservation. The offering class determines the payment \
         schedule for the reservation.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the reservation. Possible values include the following:\n\n\
        \ {ul\n\
        \       {-   [payment-pending] \n\
        \           \n\
        \            }\n\
        \       {-   [active] \n\
        \           \n\
        \            }\n\
        \       {-   [payment-failed] \n\
        \           \n\
        \            }\n\
        \       {-   [retired] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Represents an Amazon Redshift Serverless reservation, which gives you the option to commit to a \
   specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless \
   on-demand (OD) rates.\n"]

type nonrec create_reservation_response = {
  reservation : reservation option;
      [@ocaml.doc "The reservation object that the [CreateReservation] action created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_reservation_request = {
  capacity : capacity; [@ocaml.doc "The number of Redshift Processing Units (RPUs) to reserve.\n"]
  offering_id : offering_id;
      [@ocaml.doc
        "The ID of the offering associated with the reservation. The offering determines the \
         payment schedule for the reservation.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If not provided, the Amazon Web Services SDK populates this field. This token \
         must be a valid UUIDv4 value. For more information about idempotency, see \
         {{:https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/} \
         Making retries safe with idempotent APIs }.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_name_prefix = string [@@ocaml.doc ""]

type nonrec create_snapshot_schedule_action_parameters = {
  namespace_name : namespace_name;
      [@ocaml.doc
        "The name of the namespace for which you want to configure a scheduled action to create a \
         snapshot.\n"]
  snapshot_name_prefix : snapshot_name_prefix;
      [@ocaml.doc
        "A string prefix that is attached to the name of the snapshot created by the scheduled \
         action. The final name of the snapshot is the string prefix appended by the date and time \
         of when the snapshot was created.\n"]
  retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The retention period of the snapshot created by the scheduled action.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of \
         {{:https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_Tag.html}Tag \
         objects} to associate with the snapshot.\n"]
}
[@@ocaml.doc
  "The parameters that you can use to configure a \
   {{:https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_CreateScheduledAction.html}scheduled \
   action} to create a snapshot. For more information about creating a scheduled action, see \
   {{:https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_CreateScheduledAction.html}CreateScheduledAction}.\n"]

type nonrec target_action =
  | CreateSnapshot of create_snapshot_schedule_action_parameters [@ocaml.doc ""]
[@@ocaml.doc
  "A JSON format string of the Amazon Redshift Serverless API operation with input parameters. The \
   following is an example of a target action.\n\n\
  \  [\"{\"CreateSnapshot\": {\"NamespaceName\": \"sampleNamespace\",\"SnapshotName\": \
   \"sampleSnapshot\", \"retentionPeriod\": \"1\"}}\"] \n\
  \ "]

type nonrec state = ACTIVE [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec next_invocations_list = Smaws_Lib.Smithy_api.Types.timestamp list [@@ocaml.doc ""]

type nonrec schedule =
  | At of Smaws_Lib.Smithy_api.Types.timestamp
      [@ocaml.doc
        "The timestamp of when Amazon Redshift Serverless should run the scheduled action. \
         Timestamp is in UTC. Format of at expression is [yyyy-mm-ddThh:mm:ss]. For example, \
         [2016-03-04T17:27:00].\n"]
  | Cron of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc
        "The cron expression to use to schedule a recurring scheduled action. Schedule invocations \
         must be separated by at least one hour. Times are in UTC.\n\n\
        \ Format of cron expressions is [(Minutes Hours Day-of-month Month Day-of-week Year)]. For \
         example, [\"(0 10 ? * MON *)\"]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions}Cron \
         Expressions} in the {i Amazon CloudWatch Events User Guide}.\n\
        \ "]
[@@ocaml.doc "The schedule of when Amazon Redshift Serverless should run the scheduled action.\n"]

type nonrec scheduled_action_name = string [@@ocaml.doc ""]

type nonrec scheduled_action_response = {
  scheduled_action_name : scheduled_action_name option;
      [@ocaml.doc "The name of the scheduled action.\n"]
  schedule : schedule option;
      [@ocaml.doc
        "The schedule for a one-time (at timestamp format) or recurring (cron format) scheduled \
         action. Schedule invocations must be separated by at least one hour. Times are in UTC.\n\n\
        \ {ul\n\
        \       {-  Format of at timestamp is [yyyy-mm-ddThh:mm:ss]. For example, \
         [2016-03-04T17:27:00].\n\
        \           \n\
        \            }\n\
        \       {-  Format of cron expression is [(Minutes Hours Day-of-month Month Day-of-week \
         Year)]. For example, [\"(0 10 ? * MON *)\"]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions}Cron \
         Expressions} in the {i Amazon CloudWatch Events User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scheduled_action_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the scheduled action.\n"]
  next_invocations : next_invocations_list option;
      [@ocaml.doc "An array of timestamps of when the next scheduled actions will trigger.\n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role to assume to run the scheduled action. This IAM role must have \
         permission to run the Amazon Redshift Serverless API operation in the scheduled action. \
         This IAM role must allow the Amazon Redshift scheduler to schedule creating snapshots. \
         (Principal scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For \
         more information about the IAM role to use with the Amazon Redshift scheduler, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html}Using \
         Identity-Based Policies for Amazon Redshift} in the Amazon Redshift Management Guide\n"]
  state : state option; [@ocaml.doc "The state of the scheduled action.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The start time in UTC when the schedule is active. Before this time, the scheduled action \
         does not trigger.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc "The end time of \n"]
  target_action : target_action option; [@ocaml.doc ""]
  namespace_name : namespace_name option;
      [@ocaml.doc
        "The end time in UTC when the schedule is no longer active. After this time, the scheduled \
         action does not trigger.\n"]
  scheduled_action_uuid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The uuid of the scheduled action.\n"]
}
[@@ocaml.doc "The returned scheduled action object.\n"]

type nonrec create_scheduled_action_response = {
  scheduled_action : scheduled_action_response option;
      [@ocaml.doc
        "The returned [ScheduledAction] object that describes the properties of a scheduled action.\n"]
}
[@@ocaml.doc ""]

type nonrec create_scheduled_action_request = {
  scheduled_action_name : scheduled_action_name; [@ocaml.doc "The name of the scheduled action.\n"]
  target_action : target_action; [@ocaml.doc ""]
  schedule : schedule;
      [@ocaml.doc
        "The schedule for a one-time (at timestamp format) or recurring (cron format) scheduled \
         action. Schedule invocations must be separated by at least one hour. Times are in UTC.\n\n\
        \ {ul\n\
        \       {-  Format of at timestamp is [yyyy-mm-ddThh:mm:ss]. For example, \
         [2016-03-04T17:27:00].\n\
        \           \n\
        \            }\n\
        \       {-  Format of cron expression is [(Minutes Hours Day-of-month Month Day-of-week \
         Year)]. For example, [\"(0 10 ? * MON *)\"]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions}Cron \
         Expressions} in the {i Amazon CloudWatch Events User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role to assume to run the scheduled action. This IAM role must have \
         permission to run the Amazon Redshift Serverless API operation in the scheduled action. \
         This IAM role must allow the Amazon Redshift scheduler to schedule creating snapshots. \
         (Principal scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For \
         more information about the IAM role to use with the Amazon Redshift scheduler, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html}Using \
         Identity-Based Policies for Amazon Redshift} in the Amazon Redshift Management Guide\n"]
  namespace_name : namespace_name;
      [@ocaml.doc "The name of the namespace for which to create a scheduled action.\n"]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether the schedule is enabled. If false, the scheduled action does not \
         trigger. For more information about [state] of the scheduled action, see \
         {{:https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_ScheduledAction.html}ScheduledAction}.\n"]
  scheduled_action_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the scheduled action.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The start time in UTC when the schedule is active. Before this time, the scheduled action \
         does not trigger.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The end time in UTC when the schedule is no longer active. After this time, the scheduled \
         action does not trigger.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The created snapshot object.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_request = {
  namespace_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The namespace to create a snapshot for.\n"]
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the snapshot.\n"]
  retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "How long to retain the created snapshot.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of \
         {{:https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_Tag.html}Tag \
         objects} to associate with the snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_copy_configuration = {
  snapshot_copy_configuration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the snapshot copy configuration object.\n"]
  snapshot_copy_configuration_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ARN of the snapshot copy configuration object.\n"]
  namespace_name : namespace_name option;
      [@ocaml.doc
        "The name of the namespace to copy snapshots from in the source Amazon Web Services Region.\n"]
  destination_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The destination Amazon Web Services Region to copy snapshots to.\n"]
  snapshot_retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The retention period of snapshots that are copied to the destination Amazon Web Services \
         Region.\n"]
  destination_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the KMS key to use to encrypt your snapshots in the destination Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc
  "The object that you configure to copy snapshots from one namespace to a namespace in another \
   Amazon Web Services Region.\n"]

type nonrec create_snapshot_copy_configuration_response = {
  snapshot_copy_configuration : snapshot_copy_configuration;
      [@ocaml.doc "The snapshot copy configuration object that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_copy_configuration_request = {
  namespace_name : namespace_name;
      [@ocaml.doc "The name of the namespace to copy snapshots from.\n"]
  destination_region : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The destination Amazon Web Services Region that you want to copy snapshots to.\n"]
  snapshot_retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The retention period of the snapshots that you copy to the destination Amazon Web \
         Services Region.\n"]
  destination_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The KMS key to use to encrypt your snapshots in the destination Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec usage_limit_breach_action =
  | LOG [@ocaml.doc ""]
  | EMIT_METRIC [@ocaml.doc ""]
  | DEACTIVATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit_period =
  | DAILY [@ocaml.doc ""]
  | WEEKLY [@ocaml.doc ""]
  | MONTHLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit_usage_type =
  | SERVERLESS_COMPUTE [@ocaml.doc ""]
  | CROSS_REGION_DATASHARING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit = {
  usage_limit_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the usage limit.\n"]
  usage_limit_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource associated with the usage limit.\n"]
  resource_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the Amazon Redshift Serverless resource.\n"]
  usage_type : usage_limit_usage_type option;
      [@ocaml.doc "The Amazon Redshift Serverless feature to limit.\n"]
  amount : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "The limit amount. If time-based, this amount is in RPUs consumed per hour. If data-based, \
         this amount is in terabytes (TB). The value must be a positive number.\n"]
  period : usage_limit_period option;
      [@ocaml.doc
        "The time period that the amount applies to. A weekly period begins on Sunday. The default \
         is monthly.\n"]
  breach_action : usage_limit_breach_action option;
      [@ocaml.doc "The action that Amazon Redshift Serverless takes when the limit is reached.\n"]
}
[@@ocaml.doc "The usage limit object.\n"]

type nonrec create_usage_limit_response = {
  usage_limit : usage_limit option; [@ocaml.doc "The returned usage limit object.\n"]
}
[@@ocaml.doc ""]

type nonrec create_usage_limit_request = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Redshift Serverless resource to create the \
         usage limit for.\n"]
  usage_type : usage_limit_usage_type;
      [@ocaml.doc "The type of Amazon Redshift Serverless usage to create a usage limit for.\n"]
  amount : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc
        "The limit amount. If time-based, this amount is in Redshift Processing Units (RPU) \
         consumed per hour. If data-based, this amount is in terabytes (TB) of data transferred \
         between Regions in cross-account sharing. The value must be a positive number.\n"]
  period : usage_limit_period option;
      [@ocaml.doc
        "The time period that the amount applies to. A weekly period begins on Sunday. The default \
         is monthly.\n"]
  breach_action : usage_limit_breach_action option;
      [@ocaml.doc
        "The action that Amazon Redshift Serverless takes when the limit is reached. The default \
         is log.\n"]
}
[@@ocaml.doc ""]

type nonrec ipv6_cidr_block_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "There are no subnets in your VPC with associated IPv6 CIDR blocks. To use dual-stack mode, \
   associate an IPv6 CIDR block with each subnet in your VPC.\n"]

type nonrec insufficient_capacity_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "There is an insufficient capacity to perform the action.\n"]

type nonrec track_name = string [@@ocaml.doc ""]

type nonrec performance_target_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec performance_target = {
  status : performance_target_status option;
      [@ocaml.doc "Whether the price performance target is enabled for the workgroup.\n"]
  level : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The target price performance level for the workgroup. Valid values include 1, 25, 50, 75, \
         and 100. These correspond to the price performance levels LOW_COST, ECONOMICAL, BALANCED, \
         RESOURCEFUL, and HIGH_PERFORMANCE.\n"]
}
[@@ocaml.doc "An object that represents the price performance target settings for the workgroup.\n"]

type nonrec ip_address_type = string [@@ocaml.doc ""]

type nonrec vpc_ids = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec vpc_endpoint_list = vpc_endpoint list [@@ocaml.doc ""]

type nonrec endpoint = {
  address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The DNS address of the VPC endpoint.\n"]
  port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The port that Amazon Redshift Serverless listens on.\n"]
  vpc_endpoints : vpc_endpoint_list option; [@ocaml.doc "An array of [VpcEndpoint] objects.\n"]
}
[@@ocaml.doc "The VPC endpoint object.\n"]

type nonrec workgroup_status =
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_group_id_list = security_group_id list [@@ocaml.doc ""]

type nonrec workgroup = {
  workgroup_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the workgroup.\n"]
  workgroup_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that links to the workgroup.\n"]
  workgroup_name : workgroup_name option; [@ocaml.doc "The name of the workgroup.\n"]
  namespace_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The namespace the workgroup is associated with.\n"]
  base_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The base data warehouse capacity of the workgroup in Redshift Processing Units (RPUs).\n"]
  enhanced_vpc_routing : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "The value that specifies whether to enable enhanced virtual private cloud (VPC) routing, \
         which forces Amazon Redshift Serverless to route traffic through your VPC.\n"]
  config_parameters : config_parameter_list option;
      [@ocaml.doc
        "An array of parameters to set for advanced control over a database. The options are \
         [auto_mv], [datestyle], [enable_case_sensitive_identifier], \
         [enable_user_activity_logging], [query_group], [search_path], [require_ssl], \
         [use_fips_ssl], and either [wlm_json_configuration] or query monitoring metrics that let \
         you define performance boundaries. You can either specify individual query monitoring \
         metrics (such as [max_scan_row_count], [max_query_execution_time]) or use \
         [wlm_json_configuration] to define query queues with rules, but not both. If you're using \
         [wlm_json_configuration], the maximum size of [parameterValue] is 8000 characters. For \
         more information about query monitoring rules and available metrics, see \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless} \
         Query monitoring metrics for Amazon Redshift Serverless}.\n"]
  security_group_ids : security_group_id_list option;
      [@ocaml.doc "An array of security group IDs to associate with the workgroup.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc "An array of subnet IDs the workgroup is associated with.\n"]
  status : workgroup_status option; [@ocaml.doc "The status of the workgroup.\n"]
  endpoint : endpoint option; [@ocaml.doc "The endpoint that is created from the workgroup.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "A value that specifies whether the workgroup can be accessible from a public network.\n"]
  creation_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The creation date of the workgroup.\n"]
  port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The custom port to use when connecting to a workgroup. Valid port ranges are 5431-5455 \
         and 8191-8215. The default is 5439.\n"]
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
  custom_domain_certificate_expiry_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration time for the certificate.\n"]
  workgroup_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Redshift Serverless version of your workgroup. For more information about \
         Amazon Redshift Serverless versions, \
         see{{:https://docs.aws.amazon.com/redshift/latest/mgmt/cluster-versions.html}Cluster \
         versions for Amazon Redshift}.\n"]
  patch_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The patch version of your Amazon Redshift Serverless workgroup. For more information \
         about patch versions, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/cluster-versions.html}Cluster \
         versions for Amazon Redshift}.\n"]
  max_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve queries. The \
         max capacity is specified in RPUs.\n"]
  cross_account_vpcs : vpc_ids option;
      [@ocaml.doc
        "A list of VPCs. Each entry is the unique identifier of a virtual private cloud with \
         access to Amazon Redshift Serverless. If all of the VPCs for the grantee are allowed, it \
         shows an asterisk.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that the workgroup supports. Possible values are [ipv4] and \
         [dualstack].\n"]
  price_performance_target : performance_target option;
      [@ocaml.doc
        "An object that represents the price performance target settings for the workgroup.\n"]
  track_name : track_name option; [@ocaml.doc "The name of the track for the workgroup.\n"]
  pending_track_name : track_name option;
      [@ocaml.doc
        "The name for the track that you want to assign to the workgroup. When the track changes, \
         the workgroup is switched to the latest workgroup release available for the track. At \
         this point, the track name is applied.\n"]
  extra_compute_for_automatic_optimization : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "A boolean value that, if [true], indicates that the workgroup allocates additional \
         compute resources to run automatic optimization operations.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc "The collection of computing resources from which an endpoint is created.\n"]

type nonrec create_workgroup_response = {
  workgroup : workgroup option; [@ocaml.doc "The created workgroup object.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workgroup_request = {
  workgroup_name : workgroup_name; [@ocaml.doc "The name of the created workgroup.\n"]
  namespace_name : namespace_name;
      [@ocaml.doc "The name of the namespace to associate with the workgroup.\n"]
  base_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The base data warehouse capacity of the workgroup in Redshift Processing Units (RPUs).\n"]
  enhanced_vpc_routing : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "The value that specifies whether to turn on enhanced virtual private cloud (VPC) routing, \
         which forces Amazon Redshift Serverless to route traffic through your VPC instead of over \
         the internet.\n"]
  config_parameters : config_parameter_list option;
      [@ocaml.doc
        "An array of parameters to set for advanced control over a database. The options are \
         [auto_mv], [datestyle], [enable_case_sensitive_identifier], \
         [enable_user_activity_logging], [query_group], [search_path], [require_ssl], \
         [use_fips_ssl], and either [wlm_json_configuration] or query monitoring metrics that let \
         you define performance boundaries. You can either specify individual query monitoring \
         metrics (such as [max_scan_row_count], [max_query_execution_time]) or use \
         [wlm_json_configuration] to define query queues with rules, but not both. If you're using \
         [wlm_json_configuration], the maximum size of [parameterValue] is 8000 characters. For \
         more information about query monitoring rules and available metrics, see \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless} \
         Query monitoring metrics for Amazon Redshift Serverless}.\n"]
  security_group_ids : security_group_id_list option;
      [@ocaml.doc "An array of security group IDs to associate with the workgroup.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc "An array of VPC subnet IDs to associate with the workgroup.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "A value that specifies whether the workgroup can be accessed from a public network.\n"]
  tags : tag_list option; [@ocaml.doc "A array of tag instances.\n"]
  port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The custom port to use when connecting to a workgroup. Valid port ranges are 5431-5455 \
         and 8191-8215. The default is 5439.\n"]
  max_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve queries. The \
         max capacity is specified in RPUs.\n"]
  price_performance_target : performance_target option;
      [@ocaml.doc
        "An object that represents the price performance target settings for the workgroup.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that the workgroup supports. Possible values are [ipv4] and \
         [dualstack].\n"]
  track_name : track_name option;
      [@ocaml.doc
        "An optional parameter for the name of the track for the workgroup. If you don't provide a \
         track name, the workgroup is assigned to the [current] track.\n"]
  extra_compute_for_automatic_optimization : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "If [true], allocates additional compute resources for running automatic optimization \
         operations.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec cross_vpc_endpoint_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec db_name = string [@@ocaml.doc ""]

type nonrec delete_custom_domain_association_response = unit [@@ocaml.doc ""]

type nonrec delete_custom_domain_association_request = {
  workgroup_name : workgroup_name;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_name : custom_domain_name;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_endpoint_access_response = {
  endpoint : endpoint_access option; [@ocaml.doc "The deleted VPC endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_endpoint_access_request = {
  endpoint_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the VPC endpoint to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_namespace_response = {
  namespace : namespace; [@ocaml.doc "The deleted namespace object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_namespace_request = {
  namespace_name : namespace_name; [@ocaml.doc "The name of the namespace to delete.\n"]
  final_snapshot_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the snapshot to be created before the namespace is deleted.\n"]
  final_snapshot_retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "How long to retain the final snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the policy to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scheduled_action_response = {
  scheduled_action : scheduled_action_response option;
      [@ocaml.doc "The deleted scheduled action object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scheduled_action_request = {
  scheduled_action_name : scheduled_action_name;
      [@ocaml.doc "The name of the scheduled action to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The deleted snapshot object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_request = {
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the snapshot to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_copy_configuration_response = {
  snapshot_copy_configuration : snapshot_copy_configuration;
      [@ocaml.doc "The deleted snapshot copy configuration object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_copy_configuration_request = {
  snapshot_copy_configuration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the snapshot copy configuration to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_usage_limit_response = {
  usage_limit : usage_limit option; [@ocaml.doc "The deleted usage limit object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_usage_limit_request = {
  usage_limit_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the usage limit to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workgroup_response = {
  workgroup : workgroup; [@ocaml.doc "The deleted workgroup object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workgroup_request = {
  workgroup_name : workgroup_name; [@ocaml.doc "The name of the workgroup to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec dry_run_exception = { message : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when the request was successful, but dry run was enabled so no action \
   was taken.\n"]

type nonrec endpoint_access_list = endpoint_access list [@@ocaml.doc ""]

type nonrec get_credentials_response = {
  db_user : db_user option;
      [@ocaml.doc
        "A database user name that is authorized to log on to the database [DbName] using the \
         password [DbPassword]. If the specified [DbUser] exists in the database, the new user \
         name has the same database privileges as the the user named in [DbUser]. By default, the \
         user is added to PUBLIC.\n"]
  db_password : db_password option;
      [@ocaml.doc
        "A temporary password that authorizes the user name returned by [DbUser] to log on to the \
         database [DbName].\n"]
  expiration : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time the password in [DbPassword] expires.\n"]
  next_refresh_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of when the [DbUser] and [DbPassword] authorization refreshes.\n"]
}
[@@ocaml.doc ""]

type nonrec get_credentials_request = {
  db_name : db_name option;
      [@ocaml.doc
        "The name of the database to get temporary authorization to log on to.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 64 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must contain only uppercase or lowercase letters, numbers, underscore, plus \
         sign, period (dot), at symbol (\\@), or hyphen.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Must not contain a colon ( : ) or slash ( / ).\n\
        \            \n\
        \             }\n\
        \        {-  Cannot be a reserved word. A list of reserved words can be found in \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words } in \
         the Amazon Redshift Database Developer Guide\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  duration_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of seconds until the returned temporary password expires. The minimum is 900 \
         seconds, and the maximum is 3600 seconds.\n"]
  workgroup_name : workgroup_name option;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc
        "The custom domain name associated with the workgroup. The custom domain name or the \
         workgroup name must be included in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_custom_domain_association_response = {
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  workgroup_name : workgroup_name option;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
  custom_domain_certificate_expiry_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration time for the certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec get_custom_domain_association_request = {
  custom_domain_name : custom_domain_name;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  workgroup_name : workgroup_name;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
}
[@@ocaml.doc ""]

type nonrec get_endpoint_access_response = {
  endpoint : endpoint_access option; [@ocaml.doc "The returned VPC endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec get_endpoint_access_request = {
  endpoint_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the VPC endpoint to return information for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_identity_center_auth_token_response = {
  token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Identity Center authentication token that can be used to access data in the specified \
         workgroups.\n\n\
        \ This token contains the Identity Center identity information and is encrypted for secure \
         transmission.\n\
        \ "]
  expiration_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the Identity Center authentication token expires.\n\n\
        \ After this time, a new token must be requested for continued access.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec workgroup_name_list = workgroup_name list [@@ocaml.doc ""]

type nonrec get_identity_center_auth_token_request = {
  workgroup_names : workgroup_name_list;
      [@ocaml.doc
        "A list of workgroup names for which to generate the Identity Center authentication token.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain between 1 and 20 workgroup names.\n\
        \            \n\
        \             }\n\
        \        {-  Each workgroup name must be a valid Amazon Redshift Serverless workgroup \
         identifier.\n\
        \            \n\
        \             }\n\
        \        {-  All specified workgroups must have Identity Center integration enabled.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_namespace_response = {
  namespace : namespace; [@ocaml.doc "The returned namespace object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_namespace_request = {
  namespace_name : namespace_name;
      [@ocaml.doc "The name of the namespace to retrieve information for.\n"]
}
[@@ocaml.doc ""]

type nonrec recovery_point = {
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the recovery point.\n"]
  recovery_point_create_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time the recovery point is created.\n"]
  total_size_in_mega_bytes : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total size of the data in the recovery point in megabytes.\n"]
  namespace_name : namespace_name option;
      [@ocaml.doc "The name of the namespace the recovery point is associated with.\n"]
  workgroup_name : workgroup_name option;
      [@ocaml.doc "The name of the workgroup the recovery point is associated with.\n"]
  namespace_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the namespace the recovery point is associated with.\n"]
}
[@@ocaml.doc
  "The automatically created recovery point of a namespace. Recovery points are created every 30 \
   minutes and kept for 24 hours.\n"]

type nonrec get_recovery_point_response = {
  recovery_point : recovery_point option; [@ocaml.doc "The returned recovery point object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_recovery_point_request = {
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the recovery point to return information for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_response = {
  reservation : reservation; [@ocaml.doc "The returned reservation object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_request = {
  reservation_id : reservation_id; [@ocaml.doc "The ID of the reservation to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_offering_response = {
  reservation_offering : reservation_offering;
      [@ocaml.doc
        "The returned reservation offering. The offering determines the payment schedule for the \
         reservation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_offering_request = {
  offering_id : offering_id; [@ocaml.doc "The identifier for the offering..\n"]
}
[@@ocaml.doc ""]

type nonrec resource_policy = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the policy.\n"]
  policy : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The resource policy.\n"]
}
[@@ocaml.doc
  "The resource policy object. Currently, you can use policies to share snapshots across Amazon \
   Web Services accounts.\n"]

type nonrec get_resource_policy_response = {
  resource_policy : resource_policy option; [@ocaml.doc "The returned resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to return.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_action_response = {
  scheduled_action : scheduled_action_response option;
      [@ocaml.doc "The returned scheduled action object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_action_request = {
  scheduled_action_name : scheduled_action_name; [@ocaml.doc "The name of the scheduled action.\n"]
}
[@@ocaml.doc ""]

type nonrec get_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The returned snapshot object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_snapshot_request = {
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the snapshot to return.\n"]
  owner_account : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The owner Amazon Web Services account of a snapshot shared with another user.\n"]
  snapshot_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the snapshot to return.\n"]
}
[@@ocaml.doc ""]

type nonrec table_restore_status = {
  table_restore_request_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the RestoreTableFromSnapshot request.\n"]
  status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A value that describes the current state of the table restore request. Possible values \
         are [SUCCEEDED], [FAILED], [CANCELED], [PENDING], and [IN_PROGRESS].\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A message that explains the returned status. For example, if the status of the operation \
         is [FAILED], the message explains why the operation failed.\n"]
  request_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time that the table restore request was made, in Universal Coordinated Time (UTC).\n"]
  namespace_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The namespace of the table being restored from.\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the workgroup being restored from.\n"]
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the snapshot being restored from.\n"]
  progress_in_mega_bytes : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The amount of data restored to the new table so far, in megabytes (MB).\n"]
  total_data_in_mega_bytes : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The total amount of data to restore to the new table, in megabytes (MB).\n"]
  source_database_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the source database being restored from.\n"]
  source_schema_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the source schema being restored from.\n"]
  source_table_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the source table being restored from.\n"]
  target_database_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the database to restore to.\n"]
  target_schema_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the schema to restore to.\n"]
  new_table_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the table to create from the restore operation.\n"]
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the recovery point being restored from.\n"]
}
[@@ocaml.doc "Contains information about a table restore request.\n"]

type nonrec get_table_restore_status_response = {
  table_restore_status : table_restore_status option;
      [@ocaml.doc
        "The returned [TableRestoreStatus] object that contains information about the status of \
         your [RestoreTableFromSnapshot] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_restore_status_request = {
  table_restore_request_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the [RestoreTableFromSnapshot] request to return status for.\n"]
}
[@@ocaml.doc ""]

type nonrec update_target = {
  track_name : track_name option; [@ocaml.doc "The name of the new track.\n"]
  workgroup_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The workgroup version for the new track.\n"]
}
[@@ocaml.doc "A track that you can switch the current track to.\n"]

type nonrec update_targets_list = update_target list [@@ocaml.doc ""]

type nonrec serverless_track = {
  track_name : track_name option;
      [@ocaml.doc "The name of the track. Valid values are [current] and [trailing].\n"]
  workgroup_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The workgroup version number for the workgroup release.\n"]
  update_targets : update_targets_list option;
      [@ocaml.doc "An array of [UpdateTarget] objects to update with the track.\n"]
}
[@@ocaml.doc
  "Defines a track that determines which Amazon Redshift version to apply after a new version is \
   released. If the value for [ServerlessTrack] is [current], the workgroup is updated to the most \
   recently certified release. If the value is [trailing], the workgroup is updated to the \
   previously certified release.\n"]

type nonrec get_track_response = {
  track : serverless_track option; [@ocaml.doc "The version of the specified track.\n"]
}
[@@ocaml.doc ""]

type nonrec get_track_request = {
  track_name : track_name; [@ocaml.doc "The name of the track of which its version is fetched.\n"]
}
[@@ocaml.doc ""]

type nonrec get_usage_limit_response = {
  usage_limit : usage_limit option; [@ocaml.doc "The returned usage limit object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_usage_limit_request = {
  usage_limit_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the usage limit to return information for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workgroup_response = {
  workgroup : workgroup; [@ocaml.doc "The returned workgroup object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_workgroup_request = {
  workgroup_name : workgroup_name;
      [@ocaml.doc "The name of the workgroup to return information for.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_pagination_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The provided pagination token is invalid.\n"]

type nonrec lakehouse_idc_registration = ASSOCIATE [@ocaml.doc ""] | DISASSOCIATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lakehouse_registration = REGISTER [@ocaml.doc ""] | DEREGISTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_custom_domain_associations_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
  associations : association_list option; [@ocaml.doc "A list of Association objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_domain_associations_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec list_endpoint_access_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
  endpoints : endpoint_access_list; [@ocaml.doc "The returned VPC endpoints.\n"]
}
[@@ocaml.doc ""]

type nonrec list_endpoint_access_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListEndpointAccess] operation returns a [nextToken], you can include the \
         returned [nextToken] in following [ListEndpointAccess] operations, which returns results \
         in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the workgroup associated with the VPC endpoint to return.\n"]
  vpc_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the virtual private cloud with access to Amazon Redshift \
         Serverless.\n"]
  owner_account : owner_account option;
      [@ocaml.doc
        "The owner Amazon Web Services account for the Amazon Redshift Serverless workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec managed_workgroup_status =
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | NOT_AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_arn = string [@@ocaml.doc ""]

type nonrec managed_workgroup_name = string [@@ocaml.doc ""]

type nonrec managed_workgroup_list_item = {
  managed_workgroup_name : managed_workgroup_name option;
      [@ocaml.doc "The name of the managed workgroup.\n"]
  managed_workgroup_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the managed workgroup.\n"]
  source_arn : source_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the managed workgroup in the Glue Data Catalog.\n"]
  status : managed_workgroup_status option; [@ocaml.doc "The status of the managed workgroup.\n"]
  creation_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The creation date of the managed workgroup.\n"]
}
[@@ocaml.doc "A collection of Amazon Redshift compute resources managed by Glue.\n"]

type nonrec managed_workgroups = managed_workgroup_list_item list [@@ocaml.doc ""]

type nonrec list_managed_workgroups_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If nextToken is returned, there are more results available. The value of nextToken is a \
         unique pagination token for each page. To retrieve the next page, make the call again \
         using the returned token.\n"]
  managed_workgroups : managed_workgroups option;
      [@ocaml.doc "The returned array of managed workgroups.\n"]
}
[@@ocaml.doc ""]

type nonrec list_managed_workgroups_request = {
  source_arn : source_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the managed workgroup in the Glue Data Catalog.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If your initial ListManagedWorkgroups operation returns a nextToken, you can include the \
         returned nextToken in following ListManagedWorkgroups operations, which returns results \
         in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         nextToken to display the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_list = namespace list [@@ocaml.doc ""]

type nonrec list_namespaces_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
  namespaces : namespace_list; [@ocaml.doc "The list of returned namespaces.\n"]
}
[@@ocaml.doc ""]

type nonrec list_namespaces_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListNamespaces] operation returns a [nextToken], you can include the \
         returned [nextToken] in following [ListNamespaces] operations, which returns results in \
         the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec recovery_point_list = recovery_point list [@@ocaml.doc ""]

type nonrec list_recovery_points_response = {
  recovery_points : recovery_point_list option;
      [@ocaml.doc "The returned recovery point objects.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If [nextToken] is returned, there are more results available. The value of [nextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_recovery_points_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListRecoveryPoints] operation returns a [nextToken], you can include the \
         returned [nextToken] in following [ListRecoveryPoints] operations, which returns results \
         in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the recovery point's creation was initiated.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when creation of the recovery point finished.\n"]
  namespace_name : namespace_name option;
      [@ocaml.doc "The name of the namespace to list recovery points for.\n"]
  namespace_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the namespace from which to list recovery points.\n"]
}
[@@ocaml.doc ""]

type nonrec reservation_offerings_list = reservation_offering list [@@ocaml.doc ""]

type nonrec list_reservation_offerings_response = {
  reservation_offerings_list : reservation_offerings_list;
      [@ocaml.doc "The returned list of reservation offerings.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to use when requesting the next set of items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_reservation_offerings_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this call. The call also returns a token that \
         you can specify in a subsequent call to get the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec reservations_list = reservation list [@@ocaml.doc ""]

type nonrec list_reservations_response = {
  reservations_list : reservations_list;
      [@ocaml.doc "The serverless reservations returned by the request.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token to use when requesting the next set of items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_reservations_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this call. The call also returns a token that \
         you can specify in a subsequent call to get the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_action_association = {
  namespace_name : namespace_name option;
      [@ocaml.doc "Name of associated Amazon Redshift Serverless namespace.\n"]
  scheduled_action_name : scheduled_action_name option;
      [@ocaml.doc "Name of associated scheduled action.\n"]
}
[@@ocaml.doc "Contains names of objects associated with a scheduled action.\n"]

type nonrec scheduled_actions_list = scheduled_action_association list [@@ocaml.doc ""]

type nonrec list_scheduled_actions_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If nextToken is returned, there are more results available. The value of nextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
  scheduled_actions : scheduled_actions_list option;
      [@ocaml.doc "All of the returned scheduled action association objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_scheduled_actions_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If [nextToken] is returned, there are more results available. The value of [nextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. Use \
         [nextToken] to display the next page of results.\n"]
  namespace_name : namespace_name option;
      [@ocaml.doc "The name of namespace associated with the scheduled action to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_copy_configurations = snapshot_copy_configuration list [@@ocaml.doc ""]

type nonrec list_snapshot_copy_configurations_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If [nextToken] is returned, there are more results available. The value of [nextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
  snapshot_copy_configurations : snapshot_copy_configurations;
      [@ocaml.doc "All of the returned snapshot copy configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec list_snapshot_copy_configurations_request = {
  namespace_name : namespace_name option;
      [@ocaml.doc "The namespace from which to list all snapshot copy configurations.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If [nextToken] is returned, there are more results available. The value of [nextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_list = snapshot list [@@ocaml.doc ""]

type nonrec list_snapshots_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If [nextToken] is returned, there are more results available. The value of [nextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
  snapshots : snapshot_list option; [@ocaml.doc "All of the returned snapshot objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_snapshots_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If [nextToken] is returned, there are more results available. The value of [nextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
  namespace_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The namespace from which to list all snapshots.\n"]
  namespace_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the namespace from which to list all snapshots.\n"]
  owner_account : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The owner Amazon Web Services account of the snapshot.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the creation of the snapshot was initiated.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp showing when the snapshot creation finished.\n"]
}
[@@ocaml.doc ""]

type nonrec table_restore_status_list = table_restore_status list [@@ocaml.doc ""]

type nonrec list_table_restore_status_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If your initial [ListTableRestoreStatus] operation returns a [nextToken], you can include \
         the returned [nextToken] in following [ListTableRestoreStatus] operations. This will \
         returns results on the next page.\n"]
  table_restore_statuses : table_restore_status_list option;
      [@ocaml.doc "The array of returned [TableRestoreStatus] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_table_restore_status_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If your initial [ListTableRestoreStatus] operation returns a nextToken, you can include \
         the returned [nextToken] in following [ListTableRestoreStatus] operations. This will \
         return results on the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         nextToken to display the next page of results.\n"]
  namespace_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The namespace from which to list all of the statuses of [RestoreTableFromSnapshot] \
         operations .\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The workgroup from which to list all of the statuses of [RestoreTableFromSnapshot] \
         operations.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "A map of the key-value pairs assigned to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec track_list = serverless_track list [@@ocaml.doc ""]

type nonrec list_tracks_response = {
  tracks : track_list option; [@ocaml.doc "The returned tracks.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tracks_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If your initial [ListTracksRequest] operation returns a [nextToken], you can include the \
         returned [nextToken] in following [ListTracksRequest] operations, which returns results \
         in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified MaxRecords value, a value is returned in a marker \
         field of the response. You can retrieve the next set of records by retrying the command \
         with the returned marker value.\n"]
}
[@@ocaml.doc ""]

type nonrec usage_limits = usage_limit list [@@ocaml.doc ""]

type nonrec list_usage_limits_response = {
  usage_limits : usage_limits option; [@ocaml.doc "An array of returned usage limit objects.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_usage_limits_request = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) associated with the resource whose usage limits you want \
         to list.\n"]
  usage_type : usage_limit_usage_type option;
      [@ocaml.doc "The Amazon Redshift Serverless feature whose limits you want to see.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If your initial [ListUsageLimits] operation returns a [nextToken], you can include the \
         returned [nextToken] in following [ListUsageLimits] operations, which returns results in \
         the next page. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to get the next page of results. The default is 100.\n"]
}
[@@ocaml.doc ""]

type nonrec workgroup_list = workgroup list [@@ocaml.doc ""]

type nonrec list_workgroups_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " If [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. To retrieve the next page, make the call \
         again using the returned token.\n"]
  workgroups : workgroup_list; [@ocaml.doc "The returned array of workgroups.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workgroups_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial ListWorkgroups operation returns a [nextToken], you can include the \
         returned [nextToken] in following ListNamespaces operations, which returns results in the \
         next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to display the next page of results.\n"]
  owner_account : owner_account option;
      [@ocaml.doc
        "The owner Amazon Web Services account for the Amazon Redshift Serverless workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec managed_workgroup_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec namespace_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec put_resource_policy_response = {
  resource_policy : resource_policy option; [@ocaml.doc "The policy that was created or updated.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the account to create or update a resource policy for.\n"]
  policy : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The policy to create or update. For example, the following policy grants a user \
         authorization to restore a snapshot.\n\n\
        \  [\"{\\\"Version\\\": \\\"2012-10-17\\\", \\\"Statement\\\" : \\[{ \\\"Sid\\\": \
         \\\"AllowUserRestoreFromSnapshot\\\", \\\"Principal\\\":{\\\"AWS\\\": \
         \\[\\\"739247239426\\\"\\]}, \\\"Action\\\": \
         \\[\\\"redshift-serverless:RestoreFromSnapshot\\\"\\] , \\\"Effect\\\": \\\"Allow\\\" \
         }\\]}\"] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec recovery_point_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec update_custom_domain_association_response = {
  custom_domain_name : custom_domain_name option;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  workgroup_name : workgroup_name option;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The custom domain name\226\128\153s certificate Amazon resource name (ARN).\n"]
  custom_domain_certificate_expiry_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration time for the certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec update_custom_domain_association_request = {
  workgroup_name : workgroup_name;
      [@ocaml.doc "The name of the workgroup associated with the database.\n"]
  custom_domain_name : custom_domain_name;
      [@ocaml.doc "The custom domain name associated with the workgroup.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string;
      [@ocaml.doc
        "The custom domain name\226\128\153s certificate Amazon resource name (ARN). This is \
         optional.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The tag or set of tags to remove from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to tag.\n"]
  tags : tag_list; [@ocaml.doc "The map of the key-value pairs used to tag the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec reservation_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec restore_from_recovery_point_response = {
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the recovery point used for the restore.\n"]
  namespace : namespace option; [@ocaml.doc "The namespace that data was restored into.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_from_recovery_point_request = {
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the recovery point to restore from.\n"]
  namespace_name : namespace_name; [@ocaml.doc "The name of the namespace to restore data into.\n"]
  workgroup_name : workgroup_name; [@ocaml.doc "The name of the workgroup used to restore data.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_from_snapshot_response = {
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the snapshot used to restore the namespace.\n"]
  owner_account : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The owner Amazon Web Services; account of the snapshot that was restored.\n"]
  namespace : namespace option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec restore_from_snapshot_request = {
  namespace_name : namespace_name;
      [@ocaml.doc "The name of the namespace to restore the snapshot to.\n"]
  workgroup_name : workgroup_name;
      [@ocaml.doc "The name of the workgroup used to restore the snapshot.\n"]
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the snapshot to restore from. Must not be specified at the same time as \
         [snapshotArn].\n"]
  snapshot_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the snapshot to restore from. Required if restoring \
         from a provisioned cluster to Amazon Redshift Serverless. Must not be specified at the \
         same time as [snapshotName].\n\n\
        \ The format of the ARN is \
         arn:aws:redshift:<region>:<account_id>:snapshot:<cluster_identifier>/<snapshot_identifier>.\n\
        \ "]
  owner_account : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services account that owns the snapshot.\n"]
  manage_admin_password : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "If [true], Amazon Redshift uses Secrets Manager to manage the restored snapshot's admin \
         credentials. If [MmanageAdminPassword] is false or not set, Amazon Redshift uses the \
         admin credentials that the namespace or cluster had at the time the snapshot was taken.\n"]
  admin_password_secret_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's \
         admin credentials secret.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_table_from_recovery_point_response = {
  table_restore_status : table_restore_status option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec restore_table_from_recovery_point_request = {
  namespace_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Namespace of the recovery point to restore from.\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The workgroup to restore the table to.\n"]
  recovery_point_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the recovery point to restore the table from.\n"]
  source_database_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the source database that contains the table being restored.\n"]
  source_schema_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the source schema that contains the table being restored.\n"]
  source_table_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the source table being restored.\n"]
  target_database_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the database to restore the table to.\n"]
  target_schema_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the schema to restore the table to.\n"]
  new_table_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the table to create from the restore operation.\n"]
  activate_case_sensitive_identifier : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether name identifiers for database, schema, and table are case sensitive. If \
         true, the names are case sensitive. If false, the names are not case sensitive. The \
         default is false.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_table_from_snapshot_response = {
  table_restore_status : table_restore_status option;
      [@ocaml.doc
        "The TableRestoreStatus object that contains the status of the restore operation.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_table_from_snapshot_request = {
  namespace_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The namespace of the snapshot to restore from.\n"]
  workgroup_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The workgroup to restore the table to.\n"]
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the snapshot to restore the table from.\n"]
  source_database_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the source database that contains the table being restored.\n"]
  source_schema_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the source schema that contains the table being restored.\n"]
  source_table_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the source table being restored.\n"]
  target_database_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the database to restore the table to.\n"]
  target_schema_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the schema to restore the table to.\n"]
  new_table_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the table to create from the restore operation.\n"]
  activate_case_sensitive_identifier : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether name identifiers for database, schema, and table are case sensitive. If \
         true, the names are case sensitive. If false, the names are not case sensitive. The \
         default is false.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_action_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec snapshot_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec update_endpoint_access_response = {
  endpoint : endpoint_access option; [@ocaml.doc "The updated VPC endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec update_endpoint_access_request = {
  endpoint_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the VPC endpoint to update.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "The list of VPC security groups associated with the endpoint after the endpoint is \
         modified.\n"]
}
[@@ocaml.doc ""]

type nonrec update_lakehouse_configuration_response = {
  namespace_name : namespace_name option; [@ocaml.doc "The name of the namespace.\n"]
  lakehouse_idc_application_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling \
         Amazon Web Services IAM Identity Center trusted identity propagation.\n"]
  lakehouse_registration_status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The current status of the lakehouse registration. Indicates whether the namespace is \
         successfully registered with Amazon Redshift federated permissions.\n"]
  catalog_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Glue Data Catalog associated with the lakehouse \
         configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec update_lakehouse_configuration_request = {
  namespace_name : namespace_name;
      [@ocaml.doc "The name of the namespace whose lakehouse configuration you want to modify.\n"]
  lakehouse_registration : lakehouse_registration option;
      [@ocaml.doc
        "Specifies whether to register or deregister the namespace with Amazon Redshift federated \
         permissions. Valid values are [Register] or [Deregister].\n"]
  catalog_name : catalog_name_string option;
      [@ocaml.doc
        "The name of the Glue Data Catalog that will be associated with the namespace enabled with \
         Amazon Redshift federated permissions.\n\n\
        \ Pattern: [^\\[a-z0-9_-\\]*\\[a-z\\]+\\[a-z0-9_-\\]*$] \n\
        \ "]
  lakehouse_idc_registration : lakehouse_idc_registration option;
      [@ocaml.doc
        "Modifies the Amazon Web Services IAM Identity Center trusted identity propagation on a \
         namespace enabled with Amazon Redshift federated permissions. Valid values are \
         [Associate] or [Disassociate].\n"]
  lakehouse_idc_application_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling \
         Amazon Web Services IAM Identity Center trusted identity propagation on a namespace \
         enabled with Amazon Redshift federated permissions.\n"]
  dry_run : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "A boolean value that, if [true], validates the request without actually updating the \
         lakehouse configuration. Use this to check for errors before making changes.\n"]
}
[@@ocaml.doc ""]

type nonrec update_namespace_response = {
  namespace : namespace; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc ""]

type nonrec update_namespace_request = {
  namespace_name : namespace_name;
      [@ocaml.doc
        "The name of the namespace to update. You can't update the name of a namespace once it is \
         created.\n"]
  admin_user_password : db_password option;
      [@ocaml.doc
        "The password of the administrator for the first database created in the namespace. This \
         parameter must be updated together with [adminUsername].\n\n\
        \ You can't use [adminUserPassword] if [manageAdminPassword] is true. \n\
        \ "]
  admin_username : db_user option;
      [@ocaml.doc
        "The username of the administrator for the first database created in the namespace. This \
         parameter must be updated together with [adminUserPassword].\n"]
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Key Management Service key used to encrypt your data.\n"]
  default_iam_role_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to set as a default in the namespace. This \
         parameter must be updated together with [iamRoles].\n"]
  iam_roles : iam_role_arn_list option;
      [@ocaml.doc
        "A list of IAM roles to associate with the namespace. This parameter must be updated \
         together with [defaultIamRoleArn].\n"]
  log_exports : log_export_list option;
      [@ocaml.doc
        "The types of logs the namespace can export. The export types are [userlog], \
         [connectionlog], and [useractivitylog].\n"]
  manage_admin_password : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "If [true], Amazon Redshift uses Secrets Manager to manage the namespace's admin \
         credentials. You can't use [adminUserPassword] if [manageAdminPassword] is true. If \
         [manageAdminPassword] is false or not set, Amazon Redshift uses [adminUserPassword] for \
         the admin user account's password. \n"]
  admin_password_secret_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's \
         admin credentials secret. You can only use this parameter if [manageAdminPassword] is \
         true.\n"]
}
[@@ocaml.doc ""]

type nonrec update_scheduled_action_response = {
  scheduled_action : scheduled_action_response option;
      [@ocaml.doc "The ScheduledAction object that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_scheduled_action_request = {
  scheduled_action_name : scheduled_action_name;
      [@ocaml.doc "The name of the scheduled action to update to.\n"]
  target_action : target_action option; [@ocaml.doc ""]
  schedule : schedule option;
      [@ocaml.doc
        "The schedule for a one-time (at timestamp format) or recurring (cron format) scheduled \
         action. Schedule invocations must be separated by at least one hour. Times are in UTC.\n\n\
        \ {ul\n\
        \       {-  Format of at timestamp is [yyyy-mm-ddThh:mm:ss]. For example, \
         [2016-03-04T17:27:00].\n\
        \           \n\
        \            }\n\
        \       {-  Format of cron expression is [(Minutes Hours Day-of-month Month Day-of-week \
         Year)]. For example, [\"(0 10 ? * MON *)\"]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions}Cron \
         Expressions} in the {i Amazon CloudWatch Events User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role to assume to run the scheduled action. This IAM role must have \
         permission to run the Amazon Redshift Serverless API operation in the scheduled action. \
         This IAM role must allow the Amazon Redshift scheduler to schedule creating snapshots \
         (Principal scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For \
         more information about the IAM role to use with the Amazon Redshift scheduler, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html}Using \
         Identity-Based Policies for Amazon Redshift} in the Amazon Redshift Management Guide\n"]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Specifies whether to enable the scheduled action.\n"]
  scheduled_action_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The descripion of the scheduled action to update to.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The start time in UTC of the scheduled action to update to.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The end time in UTC of the scheduled action to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The updated snapshot object.\n"]
}
[@@ocaml.doc ""]

type nonrec update_snapshot_request = {
  snapshot_name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the snapshot.\n"]
  retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The new retention period of the snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec update_snapshot_copy_configuration_response = {
  snapshot_copy_configuration : snapshot_copy_configuration;
      [@ocaml.doc "The updated snapshot copy configuration object.\n"]
}
[@@ocaml.doc ""]

type nonrec update_snapshot_copy_configuration_request = {
  snapshot_copy_configuration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the snapshot copy configuration to update.\n"]
  snapshot_retention_period : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The new retention period of how long to keep a snapshot in the destination Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec update_usage_limit_response = {
  usage_limit : usage_limit option; [@ocaml.doc "The updated usage limit object.\n"]
}
[@@ocaml.doc ""]

type nonrec update_usage_limit_request = {
  usage_limit_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the usage limit to update.\n"]
  amount : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "The new limit amount. If time-based, this amount is in Redshift Processing Units (RPU) \
         consumed per hour. If data-based, this amount is in terabytes (TB) of data transferred \
         between Regions in cross-account sharing. The value must be a positive number.\n"]
  breach_action : usage_limit_breach_action option;
      [@ocaml.doc
        "The new action that Amazon Redshift Serverless takes when the limit is reached.\n"]
}
[@@ocaml.doc ""]

type nonrec update_workgroup_response = {
  workgroup : workgroup; [@ocaml.doc "The updated workgroup object.\n"]
}
[@@ocaml.doc ""]

type nonrec update_workgroup_request = {
  workgroup_name : workgroup_name;
      [@ocaml.doc
        "The name of the workgroup to update. You can't update the name of a workgroup once it is \
         created.\n"]
  base_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The new base data warehouse capacity in Redshift Processing Units (RPUs).\n"]
  enhanced_vpc_routing : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "The value that specifies whether to turn on enhanced virtual private cloud (VPC) routing, \
         which forces Amazon Redshift Serverless to route traffic through your VPC.\n"]
  config_parameters : config_parameter_list option;
      [@ocaml.doc
        "An array of parameters to set for advanced control over a database. The options are \
         [auto_mv], [datestyle], [enable_case_sensitive_identifier], \
         [enable_user_activity_logging], [query_group], [search_path], [require_ssl], \
         [use_fips_ssl], and either [wlm_json_configuration] or query monitoring metrics that let \
         you define performance boundaries. You can either specify individual query monitoring \
         metrics (such as [max_scan_row_count], [max_query_execution_time]) or use \
         [wlm_json_configuration] to define query queues with rules, but not both. If you're using \
         [wlm_json_configuration], the maximum size of [parameterValue] is 8000 characters. For \
         more information about query monitoring rules and available metrics, see \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless} \
         Query monitoring metrics for Amazon Redshift Serverless}.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "A value that specifies whether the workgroup can be accessible from a public network.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc "An array of VPC subnet IDs to associate with the workgroup.\n"]
  security_group_ids : security_group_id_list option;
      [@ocaml.doc "An array of security group IDs to associate with the workgroup.\n"]
  port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The custom port to use when connecting to a workgroup. Valid port ranges are 5431-5455 \
         and 8191-8215. The default is 5439.\n"]
  max_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve queries. The \
         max capacity is specified in RPUs.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that the workgroup supports. Possible values are [ipv4] and \
         [dualstack].\n"]
  price_performance_target : performance_target option;
      [@ocaml.doc
        "An object that represents the price performance target settings for the workgroup.\n"]
  track_name : track_name option;
      [@ocaml.doc
        "An optional parameter for the name of the track for the workgroup. If you don't provide a \
         track name, the workgroup is assigned to the [current] track.\n"]
  extra_compute_for_automatic_optimization : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "If [true], allocates additional compute resources for running automatic optimization \
         operations.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec usage_limit_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec workgroup_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
