type nonrec flag = bool [@@ocaml.doc ""]

type nonrec general_ar_n = string [@@ocaml.doc ""]

type nonrec windows_fsrm_configuration = {
  event_log_destination : general_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the destination of the FSRM event logs. The \
         destination can be any Amazon CloudWatch Logs log group ARN or Amazon Kinesis Data \
         Firehose delivery stream ARN.\n\n\
        \ The name of the Amazon CloudWatch Logs log group must begin with the [/aws/fsx] prefix. \
         The name of the Amazon Kinesis Data Firehose delivery stream must begin with the \
         [aws-fsx] prefix.\n\
        \ \n\
        \  The destination ARN (either CloudWatch Logs log group or Kinesis Data Firehose delivery \
         stream) must be in the same Amazon Web Services partition, Amazon Web Services Region, \
         and Amazon Web Services account as your Amazon FSx file system.\n\
        \  "]
  fsrm_service_enabled : flag;
      [@ocaml.doc
        "Specifies whether FSRM is enabled or disabled on the file system. When [TRUE], the FSRM \
         service is enabled and monitor file operations according to configured policies. When \
         [FALSE] or omitted, FSRM is disabled. The default value is [FALSE]. \n"]
}
[@@ocaml.doc
  "The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File Server \
   uses for the file system. When FSRM is enabled, you can manage and monitor storage quotas, file \
   screening, storage reports, and file classification.\n"]

type nonrec directory_id = string [@@ocaml.doc ""]

type nonrec active_directory_fully_qualified_name = string [@@ocaml.doc ""]

type nonrec organizational_unit_distinguished_name = string [@@ocaml.doc ""]

type nonrec file_system_administrators_group_name = string [@@ocaml.doc ""]

type nonrec directory_user_name = string [@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec dns_ips = ip_address list [@@ocaml.doc ""]

type nonrec customer_secrets_manager_ar_n = string [@@ocaml.doc ""]

type nonrec self_managed_active_directory_attributes = {
  domain_join_service_account_secret : customer_secrets_manager_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         containing the service account credentials used to join the file system to your \
         self-managed Active Directory domain.\n"]
  dns_ips : dns_ips option;
      [@ocaml.doc
        "A list of up to three IP addresses of DNS servers or domain controllers in the \
         self-managed AD directory.\n"]
  user_name : directory_user_name option;
      [@ocaml.doc
        "The user name for the service account on your self-managed AD domain that FSx uses to \
         join to your AD domain.\n"]
  file_system_administrators_group : file_system_administrators_group_name option;
      [@ocaml.doc
        "The name of the domain group whose members have administrative privileges for the FSx \
         file system.\n"]
  organizational_unit_distinguished_name : organizational_unit_distinguished_name option;
      [@ocaml.doc
        "The fully qualified distinguished name of the organizational unit within the self-managed \
         AD directory to which the Windows File Server or ONTAP storage virtual machine (SVM) \
         instance is joined.\n"]
  domain_name : active_directory_fully_qualified_name option;
      [@ocaml.doc "The fully qualified domain name of the self-managed AD directory.\n"]
}
[@@ocaml.doc
  "The configuration of the self-managed Microsoft Active Directory (AD) directory to which the \
   Windows File Server or ONTAP storage virtual machine (SVM) instance is joined.\n"]

type nonrec windows_deployment_type =
  | SINGLE_AZ_2 [@ocaml.doc ""]
  | SINGLE_AZ_1 [@ocaml.doc ""]
  | MULTI_AZ_1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dns_name = string [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec megabytes_per_second = int [@@ocaml.doc ""]

type nonrec file_system_maintenance_operation =
  | BACKING_UP [@ocaml.doc ""]
  | PATCHING [@ocaml.doc ""]
[@@ocaml.doc "An enumeration specifying the currently ongoing maintenance operation.\n"]

type nonrec file_system_maintenance_operations = file_system_maintenance_operation list
[@@ocaml.doc ""]

type nonrec weekly_time = string [@@ocaml.doc ""]

type nonrec daily_time = string [@@ocaml.doc ""]

type nonrec automatic_backup_retention_days = int [@@ocaml.doc ""]

type nonrec alternate_dns_name = string [@@ocaml.doc ""]

type nonrec alias_lifecycle =
  | DELETE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec alias = {
  lifecycle : alias_lifecycle option;
      [@ocaml.doc
        "Describes the state of the DNS alias.\n\n\
        \ {ul\n\
        \       {-  AVAILABLE - The DNS alias is associated with an Amazon FSx file system.\n\
        \           \n\
        \            }\n\
        \       {-  CREATING - Amazon FSx is creating the DNS alias and associating it with the \
         file system.\n\
        \           \n\
        \            }\n\
        \       {-  CREATE_FAILED - Amazon FSx was unable to associate the DNS alias with the file \
         system.\n\
        \           \n\
        \            }\n\
        \       {-  DELETING - Amazon FSx is disassociating the DNS alias from the file system and \
         deleting it.\n\
        \           \n\
        \            }\n\
        \       {-  DELETE_FAILED - Amazon FSx was unable to disassociate the DNS alias from the \
         file system.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : alternate_dns_name option;
      [@ocaml.doc
        "The name of the DNS alias. The alias name has to meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Formatted as a fully-qualified domain name (FQDN), [hostname.domain], for \
         example, [accounting.example.com].\n\
        \           \n\
        \            }\n\
        \       {-  Can contain alphanumeric characters, the underscore (_), and the hyphen (-).\n\
        \           \n\
        \            }\n\
        \       {-  Cannot start or end with a hyphen.\n\
        \           \n\
        \            }\n\
        \       {-  Can start with a numeric.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For DNS names, Amazon FSx stores alphabetic characters as lowercase letters (a-z), \
         regardless of how you specify them: as uppercase letters, lowercase letters, or the \
         corresponding letters in escape codes.\n\
        \   "]
}
[@@ocaml.doc
  "A DNS alias that is associated with the file system. You can use a DNS alias to access a file \
   system using user-defined DNS names, in addition to the default DNS name that Amazon FSx \
   assigns to the file system. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html}DNS aliases} \
   in the {i FSx for Windows File Server User Guide}.\n"]

type nonrec aliases = alias list [@@ocaml.doc ""]

type nonrec windows_access_audit_log_level =
  | SUCCESS_AND_FAILURE [@ocaml.doc ""]
  | FAILURE_ONLY [@ocaml.doc ""]
  | SUCCESS_ONLY [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec windows_audit_log_configuration = {
  audit_log_destination : general_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the destination of the audit logs. The destination can \
         be any Amazon CloudWatch Logs log group ARN or Amazon Kinesis Data Firehose delivery \
         stream ARN.\n\n\
        \ The name of the Amazon CloudWatch Logs log group must begin with the [/aws/fsx] prefix. \
         The name of the Amazon Kinesis Data Firehose delivery stream must begin with the \
         [aws-fsx] prefix.\n\
        \ \n\
        \  The destination ARN (either CloudWatch Logs log group or Kinesis Data Firehose delivery \
         stream) must be in the same Amazon Web Services partition, Amazon Web Services Region, \
         and Amazon Web Services account as your Amazon FSx file system.\n\
        \  "]
  file_share_access_audit_log_level : windows_access_audit_log_level;
      [@ocaml.doc
        "Sets which attempt type is logged by Amazon FSx for file share accesses.\n\n\
        \ {ul\n\
        \       {-   [SUCCESS_ONLY] - only successful attempts to access file shares are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILURE_ONLY] - only failed attempts to access file shares are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS_AND_FAILURE] - both successful attempts and failed attempts to \
         access file shares are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - access auditing of file shares is turned off.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_access_audit_log_level : windows_access_audit_log_level;
      [@ocaml.doc
        "Sets which attempt type is logged by Amazon FSx for file and folder accesses.\n\n\
        \ {ul\n\
        \       {-   [SUCCESS_ONLY] - only successful attempts to access files or folders are \
         logged.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILURE_ONLY] - only failed attempts to access files or folders are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS_AND_FAILURE] - both successful attempts and failed attempts to \
         access files or folders are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - access auditing of files and folders is turned off.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The configuration that Amazon FSx for Windows File Server uses to audit and log user accesses \
   of files, folders, and file shares on the Amazon FSx for Windows File Server file system. For \
   more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/file-access-auditing.html} File access \
   auditing}.\n"]

type nonrec disk_iops_configuration_mode =
  | USER_PROVISIONED [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iops = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec disk_iops_configuration = {
  iops : iops option;
      [@ocaml.doc
        "The total number of SSD IOPS provisioned for the file system.\n\n\
        \ The minimum and maximum values for this property depend on the value of [HAPairs] and \
         [StorageCapacity]. The minimum value is calculated as [StorageCapacity] * 3 * [HAPairs] \
         (3 IOPS per GB of [StorageCapacity]). The maximum value is calculated as 200,000 * \
         [HAPairs].\n\
        \ \n\
        \  Amazon FSx responds with an HTTP status code 400 (Bad Request) if the value of [Iops] \
         is outside of the minimum or maximum values.\n\
        \  "]
  mode : disk_iops_configuration_mode option;
      [@ocaml.doc
        "Specifies whether the file system is using the [AUTOMATIC] setting of SSD IOPS of 3 IOPS \
         per GB of storage capacity, or if it using a [USER_PROVISIONED] value.\n"]
}
[@@ocaml.doc
  "The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for NetApp \
   ONTAP, Amazon FSx for Windows File Server, or FSx for OpenZFS file system. By default, Amazon \
   FSx automatically provisions 3 IOPS per GB of storage capacity. You can provision additional \
   IOPS per GB of storage. The configuration consists of the total number of provisioned SSD IOPS \
   and how it is was provisioned, or the mode (by the customer or by Amazon FSx).\n"]

type nonrec windows_file_system_configuration = {
  fsrm_configuration : windows_fsrm_configuration option;
      [@ocaml.doc
        "The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File \
         Server uses for the file system. FSRM is disabled by default.\n"]
  preferred_file_server_ipv6 : ip_address option;
      [@ocaml.doc
        "For MULTI_AZ_1 deployment types, the IPv6 address of the primary, or preferred, file \
         server. Use this IP address when mounting the file system on Linux SMB clients or Windows \
         SMB clients that are not joined to a Microsoft Active Directory. Applicable for all \
         Windows file system deployment types. This IPv6 address is temporarily unavailable when \
         the file system is undergoing maintenance. For Linux and Windows SMB clients that are \
         joined to an Active Directory, use the file system's DNSName instead.\n"]
  disk_iops_configuration : disk_iops_configuration option;
      [@ocaml.doc
        "The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for \
         Windows file system. By default, Amazon FSx automatically provisions 3 IOPS per GiB of \
         storage capacity. You can provision additional IOPS per GiB of storage, up to the maximum \
         limit associated with your chosen throughput capacity.\n"]
  audit_log_configuration : windows_audit_log_configuration option;
      [@ocaml.doc
        "The configuration that Amazon FSx for Windows File Server uses to audit and log user \
         accesses of files, folders, and file shares on the Amazon FSx for Windows File Server \
         file system.\n"]
  aliases : aliases option; [@ocaml.doc ""]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A boolean flag indicating whether tags on the file system should be copied to backups. \
         This value defaults to false. If it's set to true, all tags on the file system are copied \
         to all automatic backups and any user-initiated backups where the user doesn't specify \
         any tags. If this value is true, and you specify one or more tags, only the specified \
         tags are copied to backups. If you specify one or more tags when creating a \
         user-initiated backup, no tags are copied from the file system, regardless of this value.\n"]
  automatic_backup_retention_days : automatic_backup_retention_days option;
      [@ocaml.doc
        "The number of days to retain automatic backups. Setting this to 0 disables automatic \
         backups. You can retain automatic backups for a maximum of 90 days.\n"]
  daily_automatic_backup_start_time : daily_time option;
      [@ocaml.doc "The preferred time to take daily automatic backups, in the UTC time zone.\n"]
  weekly_maintenance_start_time : weekly_time option;
      [@ocaml.doc
        "The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time \
         zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with \
         Sunday.\n"]
  maintenance_operations_in_progress : file_system_maintenance_operations option;
      [@ocaml.doc "The list of maintenance operations in progress for this file system.\n"]
  throughput_capacity : megabytes_per_second option;
      [@ocaml.doc
        "The throughput of the Amazon FSx file system, measured in megabytes per second.\n"]
  preferred_file_server_ip : ip_address option;
      [@ocaml.doc
        "For [MULTI_AZ_1] deployment types, the IPv4 address of the primary, or preferred, file \
         server.\n\n\
        \ Use this IP address when mounting the file system on Linux SMB clients or Windows SMB \
         clients that are not joined to a Microsoft Active Directory. Applicable for all Windows \
         file system deployment types. This IPv4 address is temporarily unavailable when the file \
         system is undergoing maintenance. For Linux and Windows SMB clients that are joined to an \
         Active Directory, use the file system's DNSName instead. For more information on mapping \
         and mounting file shares, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-file-shares.html}Accessing \
         data using file shares}.\n\
        \ "]
  preferred_subnet_id : subnet_id option;
      [@ocaml.doc
        "For [MULTI_AZ_1] deployment types, it specifies the ID of the subnet where the preferred \
         file server is located. Must be one of the two subnet IDs specified in [SubnetIds] \
         property. Amazon FSx serves traffic from this subnet except in the event of a failover to \
         the secondary file server.\n\n\
        \ For [SINGLE_AZ_1] and [SINGLE_AZ_2] deployment types, this value is the same as that for \
         [SubnetIDs]. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html#single-multi-az-resources}Availability \
         and durability: Single-AZ and Multi-AZ file systems}.\n\
        \ "]
  remote_administration_endpoint : dns_name option;
      [@ocaml.doc
        "For [MULTI_AZ_1] deployment types, use this endpoint when performing administrative tasks \
         on the file system using Amazon FSx Remote PowerShell.\n\n\
        \ For [SINGLE_AZ_1] and [SINGLE_AZ_2] deployment types, this is the DNS name of the file \
         system.\n\
        \ \n\
        \  This endpoint is temporarily unavailable when the file system is undergoing maintenance.\n\
        \  "]
  deployment_type : windows_deployment_type option;
      [@ocaml.doc
        "Specifies the file system deployment type, valid values are the following:\n\n\
        \ {ul\n\
        \       {-   [MULTI_AZ_1] - Specifies a high availability file system that is configured \
         for Multi-AZ redundancy to tolerate temporary Availability Zone (AZ) unavailability, and \
         supports SSD and HDD storage.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_1] - (Default) Specifies a file system that is configured for \
         single AZ redundancy, only supports SSD storage.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_2] - Latest generation Single AZ file system. Specifies a file \
         system that is configured for single AZ redundancy and supports SSD and HDD storage.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html}Single-AZ \
         and Multi-AZ File Systems}.\n\
        \   "]
  self_managed_active_directory_configuration : self_managed_active_directory_attributes option;
      [@ocaml.doc ""]
  active_directory_id : directory_id option;
      [@ocaml.doc
        "The ID for an existing Amazon Web Services Managed Microsoft Active Directory instance \
         that the file system is joined to.\n"]
}
[@@ocaml.doc "The configuration for this Microsoft Windows file system.\n"]

type nonrec windows_audit_log_create_configuration = {
  audit_log_destination : general_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that specifies the destination of the audit logs.\n\n\
        \ The destination can be any Amazon CloudWatch Logs log group ARN or Amazon Kinesis Data \
         Firehose delivery stream ARN, with the following requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  The destination ARN that you provide (either CloudWatch Logs log group or \
         Kinesis Data Firehose delivery stream) must be in the same Amazon Web Services partition, \
         Amazon Web Services Region, and Amazon Web Services account as your Amazon FSx file \
         system.\n\
        \            \n\
        \             }\n\
        \        {-  The name of the Amazon CloudWatch Logs log group must begin with the \
         [/aws/fsx] prefix. The name of the Amazon Kinesis Data Firehose delivery stream must \
         begin with the [aws-fsx] prefix.\n\
        \            \n\
        \             }\n\
        \        {-  If you do not provide a destination in [AuditLogDestination], Amazon FSx will \
         create and use a log stream in the CloudWatch Logs [/aws/fsx/windows] log group.\n\
        \            \n\
        \             }\n\
        \        {-  If [AuditLogDestination] is provided and the resource does not exist, the \
         request will fail with a [BadRequest] error.\n\
        \            \n\
        \             }\n\
        \        {-  If [FileAccessAuditLogLevel] and [FileShareAccessAuditLogLevel] are both set \
         to [DISABLED], you cannot specify a destination in [AuditLogDestination].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  file_share_access_audit_log_level : windows_access_audit_log_level;
      [@ocaml.doc
        "Sets which attempt type is logged by Amazon FSx for file share accesses.\n\n\
        \ {ul\n\
        \       {-   [SUCCESS_ONLY] - only successful attempts to access file shares are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILURE_ONLY] - only failed attempts to access file shares are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS_AND_FAILURE] - both successful attempts and failed attempts to \
         access file shares are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - access auditing of file shares is turned off.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_access_audit_log_level : windows_access_audit_log_level;
      [@ocaml.doc
        "Sets which attempt type is logged by Amazon FSx for file and folder accesses.\n\n\
        \ {ul\n\
        \       {-   [SUCCESS_ONLY] - only successful attempts to access files or folders are \
         logged.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILURE_ONLY] - only failed attempts to access files or folders are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS_AND_FAILURE] - both successful attempts and failed attempts to \
         access files or folders are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - access auditing of files and folders is turned off.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The Windows file access auditing configuration used when creating or updating an Amazon FSx for \
   Windows File Server file system.\n"]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec creation_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec file_system_id = string [@@ocaml.doc ""]

type nonrec volume_lifecycle =
  | AVAILABLE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | MISCONFIGURED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec volume_name = string [@@ocaml.doc ""]

type nonrec flex_cache_endpoint_type =
  | CACHE [@ocaml.doc ""]
  | ORIGIN [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec junction_path = string [@@ocaml.doc ""]

type nonrec security_style = MIXED [@ocaml.doc ""] | NTFS [@ocaml.doc ""] | UNIX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec volume_capacity = int [@@ocaml.doc ""]

type nonrec storage_virtual_machine_id = string [@@ocaml.doc ""]

type nonrec cooling_period = int [@@ocaml.doc ""]

type nonrec tiering_policy_name =
  | NONE [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""]
  | SNAPSHOT_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tiering_policy = {
  name : tiering_policy_name option;
      [@ocaml.doc
        "Specifies the tiering policy used to transition data. Default value is [SNAPSHOT_ONLY].\n\n\
        \ {ul\n\
        \       {-   [SNAPSHOT_ONLY] - moves cold snapshots to the capacity pool storage tier.\n\
        \           \n\
        \            }\n\
        \       {-   [AUTO] - moves cold user data and snapshots to the capacity pool storage tier \
         based on your access patterns.\n\
        \           \n\
        \            }\n\
        \       {-   [ALL] - moves all user data blocks in both the active file system and \
         Snapshot copies to the storage pool tier.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] - keeps a volume's data in the primary storage tier, preventing it \
         from being moved to the capacity pool tier.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  cooling_period : cooling_period option;
      [@ocaml.doc
        "Specifies the number of days that user data in a volume must remain inactive before it is \
         considered \"cold\" and moved to the capacity pool. Used with the [AUTO] and \
         [SNAPSHOT_ONLY] tiering policies. Enter a whole number between 2 and 183. Default values \
         are 31 days for [AUTO] and 2 days for [SNAPSHOT_ONLY].\n"]
}
[@@ocaml.doc
  "Describes the data tiering policy for an ONTAP volume. When enabled, Amazon FSx for ONTAP's \
   intelligent tiering automatically transitions a volume's data between the file system's primary \
   storage and capacity pool storage based on your access patterns.\n\n\
  \ Valid tiering policies are the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   [SNAPSHOT_ONLY] - (Default value) moves cold snapshots to the capacity pool \
   storage tier.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   {ul\n\
  \         {-   [AUTO] - moves cold user data and snapshots to the capacity pool storage tier \
   based on your access patterns.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   {ul\n\
  \         {-   [ALL] - moves all user data blocks in both the active file system and Snapshot \
   copies to the storage pool tier.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   {ul\n\
  \         {-   [NONE] - keeps a volume's data in the primary storage tier, preventing it from \
   being moved to the capacity pool tier.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec uui_d = string [@@ocaml.doc ""]

type nonrec ontap_volume_type = LS [@ocaml.doc ""] | DP [@ocaml.doc ""] | RW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot_policy = string [@@ocaml.doc ""]

type nonrec autocommit_period_type =
  | NONE [@ocaml.doc ""]
  | YEARS [@ocaml.doc ""]
  | MONTHS [@ocaml.doc ""]
  | DAYS [@ocaml.doc ""]
  | HOURS [@ocaml.doc ""]
  | MINUTES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec autocommit_period_value = int [@@ocaml.doc ""]

type nonrec autocommit_period = {
  value : autocommit_period_value option;
      [@ocaml.doc
        "Defines the amount of time for the autocommit period of a file in an FSx for ONTAP \
         SnapLock volume. The following ranges are valid: \n\n\
        \ {ul\n\
        \       {-   [Minutes]: 5 - 65,535\n\
        \           \n\
        \            }\n\
        \       {-   [Hours]: 1 - 65,535\n\
        \           \n\
        \            }\n\
        \       {-   [Days]: 1 - 3,650\n\
        \           \n\
        \            }\n\
        \       {-   [Months]: 1 - 120\n\
        \           \n\
        \            }\n\
        \       {-   [Years]: 1 - 10\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_ : autocommit_period_type;
      [@ocaml.doc
        "Defines the type of time for the autocommit period of a file in an FSx for ONTAP SnapLock \
         volume. Setting this value to [NONE] disables autocommit. The default value is [NONE]. \n"]
}
[@@ocaml.doc
  "Sets the autocommit period of files in an FSx for ONTAP SnapLock volume, which determines how \
   long the files must remain unmodified before they're automatically transitioned to the write \
   once, read many (WORM) state. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-autocommit}Autocommit}. \n\
  \ "]

type nonrec privileged_delete =
  | PERMANENTLY_DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec retention_period_type =
  | UNSPECIFIED [@ocaml.doc ""]
  | INFINITE [@ocaml.doc ""]
  | YEARS [@ocaml.doc ""]
  | MONTHS [@ocaml.doc ""]
  | DAYS [@ocaml.doc ""]
  | HOURS [@ocaml.doc ""]
  | MINUTES [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec retention_period_value = int [@@ocaml.doc ""]

type nonrec retention_period = {
  value : retention_period_value option;
      [@ocaml.doc
        "Defines the amount of time for the retention period of an FSx for ONTAP SnapLock volume. \
         You can't set a value for [INFINITE] or [UNSPECIFIED]. For all other options, the \
         following ranges are valid: \n\n\
        \ {ul\n\
        \       {-   [Seconds]: 0 - 65,535\n\
        \           \n\
        \            }\n\
        \       {-   [Minutes]: 0 - 65,535\n\
        \           \n\
        \            }\n\
        \       {-   [Hours]: 0 - 24\n\
        \           \n\
        \            }\n\
        \       {-   [Days]: 0 - 365\n\
        \           \n\
        \            }\n\
        \       {-   [Months]: 0 - 12\n\
        \           \n\
        \            }\n\
        \       {-   [Years]: 0 - 100\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_ : retention_period_type;
      [@ocaml.doc
        "Defines the type of time for the retention period of an FSx for ONTAP SnapLock volume. \
         Set it to one of the valid types. If you set it to [INFINITE], the files are retained \
         forever. If you set it to [UNSPECIFIED], the files are retained until you set an explicit \
         retention period. \n"]
}
[@@ocaml.doc
  "Specifies the retention period of an FSx for ONTAP SnapLock volume. After it is set, it can't \
   be changed. Files can't be deleted or modified during the retention period. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-retention.html}Working with the \
   retention period in SnapLock}. \n\
  \ "]

type nonrec snaplock_retention_period = {
  maximum_retention : retention_period;
      [@ocaml.doc
        "The longest retention period that can be assigned to a WORM file on an FSx for ONTAP \
         SnapLock volume. \n"]
  minimum_retention : retention_period;
      [@ocaml.doc
        "The shortest retention period that can be assigned to a WORM file on an FSx for ONTAP \
         SnapLock volume. \n"]
  default_retention : retention_period;
      [@ocaml.doc
        "The retention period assigned to a write once, read many (WORM) file by default if an \
         explicit retention period is not set for an FSx for ONTAP SnapLock volume. The default \
         retention period must be greater than or equal to the minimum retention period and less \
         than or equal to the maximum retention period. \n"]
}
[@@ocaml.doc
  "The configuration to set the retention period of an FSx for ONTAP SnapLock volume. The \
   retention period includes default, maximum, and minimum settings. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-retention.html}Working with the \
   retention period in SnapLock}. \n"]

type nonrec snaplock_type = ENTERPRISE [@ocaml.doc ""] | COMPLIANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snaplock_configuration = {
  volume_append_mode_enabled : flag option;
      [@ocaml.doc
        "Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume. Volume-append \
         mode allows you to create WORM-appendable files and write data to them incrementally. The \
         default value is [false]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-append}Volume-append \
         mode}. \n\
        \ "]
  snaplock_type : snaplock_type option;
      [@ocaml.doc
        "Specifies the retention mode of an FSx for ONTAP SnapLock volume. After it is set, it \
         can't be changed. You can choose one of the following retention modes: \n\n\
        \ {ul\n\
        \       {-   [COMPLIANCE]: Files transitioned to write once, read many (WORM) on a \
         Compliance volume can't be deleted until their retention periods expire. This retention \
         mode is used to address government or industry-specific mandates or to protect against \
         ransomware attacks. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-compliance.html}SnapLock \
         Compliance}. \n\
        \           \n\
        \            }\n\
        \       {-   [ENTERPRISE]: Files transitioned to WORM on an Enterprise volume can be \
         deleted by authorized users before their retention periods expire using privileged \
         delete. This retention mode is used to advance an organization's data integrity and \
         internal compliance or to test retention settings before using SnapLock Compliance. For \
         more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html}SnapLock \
         Enterprise}. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retention_period : snaplock_retention_period option;
      [@ocaml.doc "Specifies the retention period of an FSx for ONTAP SnapLock volume. \n"]
  privileged_delete : privileged_delete option;
      [@ocaml.doc
        "Enables, disables, or permanently disables privileged delete on an FSx for ONTAP SnapLock \
         Enterprise volume. Enabling privileged delete allows SnapLock administrators to delete \
         write once, read many (WORM) files even if they have active retention periods. \
         [PERMANENTLY_DISABLED] is a terminal state. If privileged delete is permanently disabled \
         on a SnapLock volume, you can't re-enable it. The default value is [DISABLED]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html#privileged-delete}Privileged \
         delete}. \n\
        \ "]
  autocommit_period : autocommit_period option;
      [@ocaml.doc
        "The configuration object for setting the autocommit period of files in an FSx for ONTAP \
         SnapLock volume. \n"]
  audit_log_volume : flag option;
      [@ocaml.doc
        "Enables or disables the audit log volume for an FSx for ONTAP SnapLock volume. The \
         default value is [false]. If you set [AuditLogVolume] to [true], the SnapLock volume is \
         created as an audit log volume. The minimum retention period for an audit log volume is \
         six months. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/how-snaplock-works.html#snaplock-audit-log-volume} \
         SnapLock audit log volumes}. \n\
        \ "]
}
[@@ocaml.doc "Specifies the SnapLock configuration for an FSx for ONTAP SnapLock volume. \n"]

type nonrec volume_style = FLEXGROUP [@ocaml.doc ""] | FLEXVOL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec aggregate = string [@@ocaml.doc ""]

type nonrec aggregates = aggregate list [@@ocaml.doc ""]

type nonrec total_constituents = int [@@ocaml.doc ""]

type nonrec aggregate_configuration = {
  total_constituents : total_constituents option;
      [@ocaml.doc
        "The total number of constituents this FlexGroup volume has. Not applicable for FlexVols.\n"]
  aggregates : aggregates option;
      [@ocaml.doc
        "The list of aggregates that this volume resides on. Aggregates are storage pools which \
         make up your primary storage tier. Each high-availability (HA) pair has one aggregate. \
         The names of the aggregates map to the names of the aggregates in the ONTAP CLI and REST \
         API. For FlexVols, there will always be a single entry.\n\n\
        \ Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \ \n\
        \  {ul\n\
        \        {-  The strings in the value of [Aggregates] are not are not formatted as \
         [aggrX], where X is a number between 1 and 12.\n\
        \            \n\
        \             }\n\
        \        {-  The value of [Aggregates] contains aggregates that are not present.\n\
        \            \n\
        \             }\n\
        \        {-  One or more of the aggregates supplied are too close to the volume limit to \
         support adding more volumes.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Used to specify configuration options for a volume\226\128\153s storage aggregate or aggregates.\n"]

type nonrec volume_capacity_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec ontap_volume_configuration = {
  size_in_bytes : volume_capacity_bytes option;
      [@ocaml.doc "The configured size of the volume, in bytes.\n"]
  aggregate_configuration : aggregate_configuration option;
      [@ocaml.doc
        "This structure specifies configuration options for a volume\226\128\153s storage \
         aggregate or aggregates.\n"]
  volume_style : volume_style option;
      [@ocaml.doc
        "Use to specify the style of an ONTAP volume. For more information about FlexVols and \
         FlexGroups, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-types.html}Volume types} in \
         Amazon FSx for NetApp ONTAP User Guide.\n"]
  snaplock_configuration : snaplock_configuration option;
      [@ocaml.doc "The SnapLock configuration object for an FSx for ONTAP SnapLock volume. \n"]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A boolean flag indicating whether tags for the volume should be copied to backups. This \
         value defaults to false. If it's set to true, all tags for the volume are copied to all \
         automatic and user-initiated backups where the user doesn't specify tags. If this value \
         is true, and you specify one or more tags, only the specified tags are copied to backups. \
         If you specify one or more tags when creating a user-initiated backup, no tags are copied \
         from the volume, regardless of this value.\n"]
  snapshot_policy : snapshot_policy option;
      [@ocaml.doc
        "Specifies the snapshot policy for the volume. There are three built-in snapshot policies:\n\n\
        \ {ul\n\
        \       {-   [default]: This is the default policy. A maximum of six hourly snapshots \
         taken five minutes past the hour. A maximum of two daily snapshots taken Monday through \
         Saturday at 10 minutes after midnight. A maximum of two weekly snapshots taken every \
         Sunday at 15 minutes after midnight.\n\
        \           \n\
        \            }\n\
        \       {-   [default-1weekly]: This policy is the same as the [default] policy except \
         that it only retains one snapshot from the weekly schedule.\n\
        \           \n\
        \            }\n\
        \       {-   [none]: This policy does not take any snapshots. This policy can be assigned \
         to volumes to prevent automatic snapshots from being taken.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can also provide the name of a custom policy that you created with the ONTAP CLI \
         or REST API.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snapshots-ontap.html#snapshot-policies}Snapshot \
         policies} in the Amazon FSx for NetApp ONTAP User Guide.\n\
        \    "]
  ontap_volume_type : ontap_volume_type option;
      [@ocaml.doc
        "Specifies the type of volume. Valid values are the following:\n\n\
        \ {ul\n\
        \       {-   [RW] specifies a read/write volume. [RW] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [DP] specifies a data-protection volume. You can protect data by replicating \
         it to data-protection mirror copies. If a disaster occurs, you can use these \
         data-protection mirror copies to recover data.\n\
        \           \n\
        \            }\n\
        \       {-   [LS] specifies a load-sharing mirror volume. A load-sharing mirror reduces \
         the network traffic to a FlexVol volume by providing additional read-only access to \
         clients.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  uui_d : uui_d option; [@ocaml.doc "The volume's universally unique identifier (UUID).\n"]
  tiering_policy : tiering_policy option; [@ocaml.doc "The volume's [TieringPolicy] setting.\n"]
  storage_virtual_machine_root : flag option;
      [@ocaml.doc
        "A Boolean flag indicating whether this volume is the root volume for its storage virtual \
         machine (SVM). Only one volume on an SVM can be the root volume. This value defaults to \
         [false]. If this value is [true], then this is the SVM root volume.\n\n\
        \ This flag is useful when you're deleting an SVM, because you must first delete all \
         non-root volumes. This flag, when set to [false], helps you identify which volumes to \
         delete before you can delete the SVM.\n\
        \ "]
  storage_virtual_machine_id : storage_virtual_machine_id option;
      [@ocaml.doc "The ID of the volume's storage virtual machine.\n"]
  storage_efficiency_enabled : flag option;
      [@ocaml.doc "The volume's storage efficiency setting.\n"]
  size_in_megabytes : volume_capacity option;
      [@ocaml.doc "The configured size of the volume, in megabytes (MBs).\n"]
  security_style : security_style option;
      [@ocaml.doc "The security style for the volume, which can be [UNIX], [NTFS], or [MIXED].\n"]
  junction_path : junction_path option;
      [@ocaml.doc
        "Specifies the directory that network-attached storage (NAS) clients use to mount the \
         volume, along with the storage virtual machine (SVM) Domain Name System (DNS) name or IP \
         address. You can create a [JunctionPath] directly below a parent volume junction or on a \
         directory within a volume. A [JunctionPath] for a volume named [vol3] might be \
         [/vol1/vol2/vol3], or [/vol1/dir2/vol3], or even [/dir1/dir2/vol3].\n"]
  flex_cache_endpoint_type : flex_cache_endpoint_type option;
      [@ocaml.doc
        "Specifies the FlexCache endpoint type of the volume. Valid values are the following:\n\n\
        \ {ul\n\
        \       {-   [NONE] specifies that the volume doesn't have a FlexCache configuration. \
         [NONE] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [ORIGIN] specifies that the volume is the origin volume for a FlexCache volume.\n\
        \           \n\
        \            }\n\
        \       {-   [CACHE] specifies that the volume is a FlexCache volume.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The configuration of an Amazon FSx for NetApp ONTAP volume.\n"]

type nonrec resource_ar_n = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "A value that specifies the [TagValue], the value assigned to the corresponding tag key. \
         Tag values can be null and don't have to be unique in a tag set. For example, you can \
         have a key-value pair in a tag set of [finances : April] and also of [payroll : April].\n"]
  key : tag_key;
      [@ocaml.doc
        "A value that specifies the [TagKey], the name of the tag. Tag keys must be unique for the \
         resource to which they are attached.\n"]
}
[@@ocaml.doc "Specifies a key-value pair for a resource tag.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec volume_id = string [@@ocaml.doc ""]

type nonrec volume_type = OPENZFS [@ocaml.doc ""] | ONTAP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec lifecycle_transition_reason = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Describes why a resource lifecycle state changed.\n"]

type nonrec administrative_action_type =
  | DOWNLOAD_DATA_FROM_BACKUP [@ocaml.doc ""]
  | VOLUME_INITIALIZE_WITH_SNAPSHOT [@ocaml.doc ""]
  | VOLUME_UPDATE_WITH_SNAPSHOT [@ocaml.doc ""]
  | MISCONFIGURED_STATE_RECOVERY [@ocaml.doc ""]
  | STORAGE_TYPE_OPTIMIZATION [@ocaml.doc ""]
  | IOPS_OPTIMIZATION [@ocaml.doc ""]
  | THROUGHPUT_OPTIMIZATION [@ocaml.doc ""]
  | VOLUME_RESTORE [@ocaml.doc ""]
  | RELEASE_NFS_V3_LOCKS [@ocaml.doc ""]
  | SNAPSHOT_UPDATE [@ocaml.doc ""]
  | VOLUME_UPDATE [@ocaml.doc ""]
  | FILE_SYSTEM_ALIAS_DISASSOCIATION [@ocaml.doc ""]
  | FILE_SYSTEM_ALIAS_ASSOCIATION [@ocaml.doc ""]
  | STORAGE_OPTIMIZATION [@ocaml.doc ""]
  | FILE_SYSTEM_UPDATE [@ocaml.doc ""]
[@@ocaml.doc
  "Describes the type of administrative action, as follows:\n\n\
  \ {ul\n\
  \       {-   [FILE_SYSTEM_UPDATE] - A file system update administrative action initiated from \
   the Amazon FSx console, API ([UpdateFileSystem]), or CLI ([update-file-system]).\n\
  \           \n\
  \            }\n\
  \       {-   [THROUGHPUT_OPTIMIZATION] - After the [FILE_SYSTEM_UPDATE] task to increase a file \
   system's throughput capacity has been completed successfully, a [THROUGHPUT_OPTIMIZATION] task \
   starts.\n\
  \           \n\
  \            You can track the storage-optimization progress using the [ProgressPercent] \
   property. When [THROUGHPUT_OPTIMIZATION] has been completed successfully, the parent \
   [FILE_SYSTEM_UPDATE] action status changes to [COMPLETED]. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-throughput-capacity.html}Managing \
   throughput capacity} in the {i Amazon FSx for Windows File Server User Guide}.\n\
  \            \n\
  \             }\n\
  \       {-   [STORAGE_OPTIMIZATION] - After the [FILE_SYSTEM_UPDATE] task to increase a file \
   system's storage capacity has completed successfully, a [STORAGE_OPTIMIZATION] task starts. \n\
  \           \n\
  \            {ul\n\
  \                  {-  For Windows and ONTAP, storage optimization is the process of migrating \
   the file system data to newer larger disks.\n\
  \                      \n\
  \                       }\n\
  \                  {-  For Lustre, storage optimization consists of rebalancing the data across \
   the existing and newly added file servers.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         You can track the storage-optimization progress using the [ProgressPercent] property. \
   When [STORAGE_OPTIMIZATION] has been completed successfully, the parent [FILE_SYSTEM_UPDATE] \
   action status changes to [COMPLETED]. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html}Managing \
   storage capacity} in the {i Amazon FSx for Windows File Server User Guide}, \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-storage-capacity.html}Managing \
   storage capacity} in the {i Amazon FSx for Lustre User Guide}, and \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-storage-capacity.html}Managing \
   storage capacity and provisioned IOPS} in the {i Amazon FSx for NetApp ONTAP User Guide}.\n\
  \         \n\
  \          }\n\
  \       {-   [FILE_SYSTEM_ALIAS_ASSOCIATION] - A file system update to associate a new Domain \
   Name System (DNS) alias with the file system. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_AssociateFileSystemAliases.html} \
   AssociateFileSystemAliases}.\n\
  \           \n\
  \            }\n\
  \       {-   [FILE_SYSTEM_ALIAS_DISASSOCIATION] - A file system update to disassociate a DNS \
   alias from the file system. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DisassociateFileSystemAliases.html}DisassociateFileSystemAliases}.\n\
  \           \n\
  \            }\n\
  \       {-   [IOPS_OPTIMIZATION] - After the [FILE_SYSTEM_UPDATE] task to increase a file \
   system's throughput capacity has been completed successfully, a [IOPS_OPTIMIZATION] task starts.\n\
  \           \n\
  \            You can track the storage-optimization progress using the [ProgressPercent] \
   property. When [IOPS_OPTIMIZATION] has been completed successfully, the parent \
   [FILE_SYSTEM_UPDATE] action status changes to [COMPLETED]. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-provisioned-ssd-iops.html}Managing \
   provisioned SSD IOPS} in the Amazon FSx for Windows File Server User Guide.\n\
  \            \n\
  \             }\n\
  \       {-   [STORAGE_TYPE_OPTIMIZATION] - After the [FILE_SYSTEM_UPDATE] task to increase a \
   file system's throughput capacity has been completed successfully, a \
   [STORAGE_TYPE_OPTIMIZATION] task starts.\n\
  \           \n\
  \            You can track the storage-optimization progress using the [ProgressPercent] \
   property. When [STORAGE_TYPE_OPTIMIZATION] has been completed successfully, the parent \
   [FILE_SYSTEM_UPDATE] action status changes to [COMPLETED].\n\
  \            \n\
  \             }\n\
  \       {-   [VOLUME_UPDATE] - A volume update to an Amazon FSx for OpenZFS volume initiated \
   from the Amazon FSx console, API ([UpdateVolume]), or CLI ([update-volume]).\n\
  \           \n\
  \            }\n\
  \       {-   [VOLUME_RESTORE] - An Amazon FSx for OpenZFS volume is returned to the state saved \
   by the specified snapshot, initiated from an API ([RestoreVolumeFromSnapshot]) or CLI \
   ([restore-volume-from-snapshot]).\n\
  \           \n\
  \            }\n\
  \       {-   [SNAPSHOT_UPDATE] - A snapshot update to an Amazon FSx for OpenZFS volume initiated \
   from the Amazon FSx console, API ([UpdateSnapshot]), or CLI ([update-snapshot]).\n\
  \           \n\
  \            }\n\
  \       {-   [RELEASE_NFS_V3_LOCKS] - Tracks the release of Network File System (NFS) V3 locks \
   on an Amazon FSx for OpenZFS file system.\n\
  \           \n\
  \            }\n\
  \       {-   [DOWNLOAD_DATA_FROM_BACKUP] - An FSx for ONTAP backup is being restored to a new \
   volume on a second-generation file system. Once the all the file metadata is loaded onto the \
   volume, you can mount the volume with read-only access. during this process.\n\
  \           \n\
  \            }\n\
  \       {-   [VOLUME_INITIALIZE_WITH_SNAPSHOT] - A volume is being created from a snapshot on a \
   different FSx for OpenZFS file system. You can initiate this from the Amazon FSx console, API \
   ([CreateVolume]), or CLI ([create-volume]) when using the using the [FULL_COPY] strategy.\n\
  \           \n\
  \            }\n\
  \       {-   [VOLUME_UPDATE_WITH_SNAPSHOT] - A volume is being updated from a snapshot on a \
   different FSx for OpenZFS file system. You can initiate this from the Amazon FSx console, API \
   ([CopySnapshotAndUpdateVolume]), or CLI ([copy-snapshot-and-update-volume]).\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec progress_percent = int [@@ocaml.doc ""]

type nonrec request_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec status =
  | CANCELLED [@ocaml.doc ""]
  | PAUSED [@ocaml.doc ""]
  | OPTIMIZING [@ocaml.doc ""]
  | UPDATED_OPTIMIZING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec file_system_type =
  | OPENZFS [@ocaml.doc ""]
  | ONTAP [@ocaml.doc ""]
  | LUSTRE [@ocaml.doc ""]
  | WINDOWS [@ocaml.doc ""]
[@@ocaml.doc "The type of Amazon FSx file system.\n"]

type nonrec file_system_lifecycle =
  | MISCONFIGURED_UNAVAILABLE [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | MISCONFIGURED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc "The lifecycle status of the file system.\n"]

type nonrec file_system_failure_details = {
  message : error_message option; [@ocaml.doc "A message describing any failures that occurred.\n"]
}
[@@ocaml.doc "A structure providing details of any failures that occurred.\n"]

type nonrec storage_capacity = int [@@ocaml.doc ""]

type nonrec storage_type =
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | HDD [@ocaml.doc ""]
  | SSD [@ocaml.doc ""]
[@@ocaml.doc "Specifies the file system's storage type.\n"]

type nonrec subnet_ids = subnet_id list [@@ocaml.doc ""]

type nonrec network_interface_id = string [@@ocaml.doc ""]

type nonrec network_interface_ids = network_interface_id list [@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec data_repository_lifecycle =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | MISCONFIGURED [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec archive_path = string [@@ocaml.doc ""]

type nonrec megabytes = int [@@ocaml.doc ""]

type nonrec auto_import_policy_type =
  | NEW_CHANGED_DELETED [@ocaml.doc ""]
  | NEW_CHANGED [@ocaml.doc ""]
  | NEW [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_repository_failure_details = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Provides detailed information about the data repository if its [Lifecycle] is set to \
   [MISCONFIGURED] or [FAILED].\n"]

type nonrec data_repository_configuration = {
  failure_details : data_repository_failure_details option; [@ocaml.doc ""]
  auto_import_policy : auto_import_policy_type option;
      [@ocaml.doc
        "Describes the file system's linked S3 data repository's [AutoImportPolicy]. The \
         AutoImportPolicy configures how Amazon FSx keeps your file and directory listings up to \
         date as you add or modify objects in your linked S3 bucket. [AutoImportPolicy] can have \
         the following values:\n\n\
        \ {ul\n\
        \       {-   [NONE] - (Default) AutoImport is off. Amazon FSx only updates file and \
         directory listings from the linked S3 bucket when the file system is created. FSx does \
         not update file and directory listings for any new or changed objects after choosing this \
         option.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW] - AutoImport is on. Amazon FSx automatically imports directory listings \
         of any new objects added to the linked S3 bucket that do not currently exist in the FSx \
         file system. \n\
        \           \n\
        \            }\n\
        \       {-   [NEW_CHANGED] - AutoImport is on. Amazon FSx automatically imports file and \
         directory listings of any new objects added to the S3 bucket and any existing objects \
         that are changed in the S3 bucket after you choose this option.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_CHANGED_DELETED] - AutoImport is on. Amazon FSx automatically imports \
         file and directory listings of any new objects added to the S3 bucket, any existing \
         objects that are changed in the S3 bucket, and any objects that were deleted in the S3 \
         bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  imported_file_chunk_size : megabytes option;
      [@ocaml.doc
        "For files imported from a data repository, this value determines the stripe count and \
         maximum amount of data per file (in MiB) stored on a single physical disk. The maximum \
         number of disks that a single file can be striped across is limited by the total number \
         of disks that make up the file system.\n\n\
        \ The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). \
         Amazon S3 objects have a maximum size of 5 TB.\n\
        \ "]
  export_path : archive_path option;
      [@ocaml.doc
        "The export path to the Amazon S3 bucket (and prefix) that you are using to store new and \
         changed Lustre file system files in S3.\n"]
  import_path : archive_path option;
      [@ocaml.doc
        "The import path to the Amazon S3 bucket (and optional prefix) that you're using as the \
         data repository for your FSx for Lustre file system, for example \
         [s3://import-bucket/optional-prefix]. If a prefix is specified after the Amazon S3 bucket \
         name, only object keys with that prefix are loaded into the file system.\n"]
  lifecycle : data_repository_lifecycle option;
      [@ocaml.doc
        "Describes the state of the file system's S3 durable data repository, if it is configured \
         with an S3 repository. The lifecycle can have the following values:\n\n\
        \ {ul\n\
        \       {-   [CREATING] - The data repository configuration between the FSx file system \
         and the linked S3 data repository is being created. The data repository is unavailable.\n\
        \           \n\
        \            }\n\
        \       {-   [AVAILABLE] - The data repository is available for use.\n\
        \           \n\
        \            }\n\
        \       {-   [MISCONFIGURED] - Amazon FSx cannot automatically import updates from the S3 \
         bucket until the data repository configuration is corrected. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/troubleshooting.html#troubleshooting-misconfigured-data-repository}Troubleshooting \
         a Misconfigured linked S3 bucket}. \n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] - The data repository is undergoing a customer initiated update \
         and availability may be impacted.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The data repository is in a terminal state that cannot be recovered.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The data repository configuration object for Lustre file systems returned in the response of \
   the [CreateFileSystem] operation.\n\n\
  \ This data type is not supported on file systems with a data repository association. For file \
   systems with a data repository association, see .\n\
  \ "]

type nonrec lustre_deployment_type =
  | PERSISTENT_2 [@ocaml.doc ""]
  | PERSISTENT_1 [@ocaml.doc ""]
  | SCRATCH_2 [@ocaml.doc ""]
  | SCRATCH_1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec per_unit_storage_throughput = int [@@ocaml.doc ""]

type nonrec lustre_file_system_mount_name = string [@@ocaml.doc ""]

type nonrec drive_cache_type = READ [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec data_compression_type = LZ4 [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec lustre_access_audit_log_level =
  | WARN_ERROR [@ocaml.doc ""]
  | ERROR_ONLY [@ocaml.doc ""]
  | WARN_ONLY [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lustre_log_configuration = {
  destination : general_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that specifies the destination of the logs. The \
         destination can be any Amazon CloudWatch Logs log group ARN. The destination ARN must be \
         in the same Amazon Web Services partition, Amazon Web Services Region, and Amazon Web \
         Services account as your Amazon FSx file system.\n"]
  level : lustre_access_audit_log_level;
      [@ocaml.doc
        "The data repository events that are logged by Amazon FSx.\n\n\
        \ {ul\n\
        \       {-   [WARN_ONLY] - only warning events are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR_ONLY] - only error events are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [WARN_ERROR] - both warning events and error events are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - logging of data repository events is turned off.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Note that Amazon File Cache uses a default setting of [WARN_ERROR], which can't be \
         changed.\n\
        \   "]
}
[@@ocaml.doc
  "The configuration for Lustre logging used to write the enabled logging events for your Amazon \
   FSx for Lustre file system or Amazon File Cache resource to Amazon CloudWatch Logs.\n"]

type nonrec lustre_root_squash = string [@@ocaml.doc ""]

type nonrec lustre_no_squash_nid = string [@@ocaml.doc ""]

type nonrec lustre_no_squash_nids = lustre_no_squash_nid list [@@ocaml.doc ""]

type nonrec lustre_root_squash_configuration = {
  no_squash_nids : lustre_no_squash_nids option;
      [@ocaml.doc
        "When root squash is enabled, you can optionally specify an array of NIDs of clients for \
         which root squash does not apply. A client NID is a Lustre Network Identifier used to \
         uniquely identify a client. You can specify the NID as either a single address or a range \
         of addresses:\n\n\
        \ {ul\n\
        \       {-  A single address is described in standard Lustre NID format by specifying the \
         client\226\128\153s IP address followed by the Lustre network ID (for example, \
         [10.0.1.6@tcp]).\n\
        \           \n\
        \            }\n\
        \       {-  An address range is described using a dash to separate the range (for example, \
         [10.0.\\[2-10\\].\\[1-255\\]@tcp]).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  root_squash : lustre_root_squash option;
      [@ocaml.doc
        "You enable root squash by setting a user ID (UID) and group ID (GID) for the file system \
         in the format [UID:GID] (for example, [365534:65534]). The UID and GID values can range \
         from [0] to [4294967294]:\n\n\
        \ {ul\n\
        \       {-  A non-zero value for UID and GID enables root squash. The UID and GID values \
         can be different, but each must be a non-zero value.\n\
        \           \n\
        \            }\n\
        \       {-  A value of [0] (zero) for UID and GID indicates root, and therefore disables \
         root squash.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When root squash is enabled, the user ID and group ID of a root user accessing the \
         file system are re-mapped to the UID and GID you provide.\n\
        \   "]
}
[@@ocaml.doc
  "The configuration for Lustre root squash used to restrict root-level access from clients that \
   try to access your FSx for Lustre file system as root. Use the [RootSquash] parameter to enable \
   root squash. To learn more about Lustre root squash, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/root-squash.html}Lustre root squash}.\n\n\
  \ You can also use the [NoSquashNids] parameter to provide an array of clients who are not \
   affected by the root squash setting. These clients will access the file system as root, with \
   unrestricted privileges.\n\
  \ "]

type nonrec metadata_iops = int [@@ocaml.doc ""]

type nonrec metadata_configuration_mode =
  | USER_PROVISIONED [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec file_system_lustre_metadata_configuration = {
  mode : metadata_configuration_mode;
      [@ocaml.doc
        "The metadata configuration mode for provisioning Metadata IOPS for the file system.\n\n\
        \ {ul\n\
        \       {-  In AUTOMATIC mode (supported only on SSD file systems), FSx for Lustre \
         automatically provisions and scales the number of Metadata IOPS on your file system based \
         on your file system storage capacity.\n\
        \           \n\
        \            }\n\
        \       {-  In USER_PROVISIONED mode, you can choose to specify the number of Metadata \
         IOPS to provision for your file system.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  iops : metadata_iops option;
      [@ocaml.doc
        "The number of Metadata IOPS provisioned for the file system.\n\n\
        \ {ul\n\
        \       {-  For SSD file systems, valid values are [1500], [3000], [6000], [12000], and \
         multiples of [12000] up to a maximum of [192000].\n\
        \           \n\
        \            }\n\
        \       {-  For Intelligent-Tiering file systems, valid values are [6000] and [12000].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The Lustre metadata performance configuration of an Amazon FSx for Lustre file system using a \
   [PERSISTENT_2] deployment type. The configuration enables the file system to support increasing \
   metadata performance.\n"]

type nonrec throughput_capacity_mbps = int [@@ocaml.doc ""]

type nonrec lustre_read_cache_sizing_mode =
  | PROPORTIONAL_TO_THROUGHPUT_CAPACITY [@ocaml.doc ""]
  | USER_PROVISIONED [@ocaml.doc ""]
  | NO_CACHE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lustre_read_cache_configuration = {
  size_gi_b : storage_capacity option;
      [@ocaml.doc
        " Required if [SizingMode] is set to [USER_PROVISIONED]. Specifies the size of the file \
         system's SSD read cache, in gibibytes (GiB). \n\n\
        \ The SSD read cache size is distributed across provisioned file servers in your file \
         system. Intelligent-Tiering file systems support a minimum of 32 GiB and maximum of \
         131072 GiB for SSD read cache size for every 4,000 MB/s of throughput capacity \
         provisioned.\n\
        \ "]
  sizing_mode : lustre_read_cache_sizing_mode option;
      [@ocaml.doc
        " Specifies how the provisioned SSD read cache is sized, as follows: \n\n\
        \ {ul\n\
        \       {-  Set to [NO_CACHE] if you do not want to use an SSD read cache with your \
         Intelligent-Tiering file system.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [USER_PROVISIONED] to specify the exact size of your SSD read cache.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [PROPORTIONAL_TO_THROUGHPUT_CAPACITY] to have your SSD read cache \
         automatically sized based on your throughput capacity.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " The configuration for the optional provisioned SSD read cache on Amazon FSx for Lustre file \
   systems that use the Intelligent-Tiering storage class. \n"]

type nonrec lustre_file_system_configuration = {
  data_read_cache_configuration : lustre_read_cache_configuration option;
      [@ocaml.doc
        "Required when [StorageType] is set to [INTELLIGENT_TIERING]. Specifies the optional \
         provisioned SSD read cache.\n"]
  throughput_capacity : throughput_capacity_mbps option;
      [@ocaml.doc
        "The throughput of an Amazon FSx for Lustre file system using the Intelligent-Tiering \
         storage class, measured in megabytes per second (MBps).\n"]
  efa_enabled : flag option;
      [@ocaml.doc
        "Specifies whether Elastic Fabric Adapter (EFA) and GPUDirect Storage (GDS) support is \
         enabled for the Amazon FSx for Lustre file system.\n"]
  metadata_configuration : file_system_lustre_metadata_configuration option;
      [@ocaml.doc
        "The Lustre metadata performance configuration for an Amazon FSx for Lustre file system \
         using a [PERSISTENT_2] deployment type.\n"]
  root_squash_configuration : lustre_root_squash_configuration option;
      [@ocaml.doc
        "The Lustre root squash configuration for an Amazon FSx for Lustre file system. When \
         enabled, root squash restricts root-level access from clients that try to access your \
         file system as a root user.\n"]
  log_configuration : lustre_log_configuration option;
      [@ocaml.doc
        "The Lustre logging configuration. Lustre logging writes the enabled log events for your \
         file system to Amazon CloudWatch Logs.\n"]
  data_compression_type : data_compression_type option;
      [@ocaml.doc
        "The data compression configuration for the file system. [DataCompressionType] can have \
         the following values:\n\n\
        \ {ul\n\
        \       {-   [NONE] - Data compression is turned off for the file system.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Data compression is turned on with the LZ4 algorithm.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-compression.html}Lustre data \
         compression}.\n\
        \   "]
  drive_cache_type : drive_cache_type option;
      [@ocaml.doc
        "The type of drive cache used by [PERSISTENT_1] file systems that are provisioned with HDD \
         storage devices. This parameter is required when [StorageType] is HDD. When set to [READ] \
         the file system has an SSD storage cache that is sized to 20% of the file system's \
         storage capacity. This improves the performance for frequently accessed files by caching \
         up to 20% of the total storage capacity.\n\n\
        \ This parameter is required when [StorageType] is set to HDD.\n\
        \ "]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A boolean flag indicating whether tags on the file system are copied to backups. If it's \
         set to true, all tags on the file system are copied to all automatic backups and any \
         user-initiated backups where the user doesn't specify any tags. If this value is true, \
         and you specify one or more tags, only the specified tags are copied to backups. If you \
         specify one or more tags when creating a user-initiated backup, no tags are copied from \
         the file system, regardless of this value. (Default = false)\n"]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  mount_name : lustre_file_system_mount_name option;
      [@ocaml.doc
        "You use the [MountName] value when mounting the file system.\n\n\
        \ For the [SCRATCH_1] deployment type, this value is always \"[fsx]\". For [SCRATCH_2], \
         [PERSISTENT_1], and [PERSISTENT_2] deployment types, this value is a string that is \
         unique within an Amazon Web Services Region. \n\
        \ "]
  per_unit_storage_throughput : per_unit_storage_throughput option;
      [@ocaml.doc
        "Per unit storage throughput represents the megabytes per second of read or write \
         throughput per 1 tebibyte of storage provisioned. File system throughput capacity is \
         equal to Storage capacity (TiB) * PerUnitStorageThroughput (MB/s/TiB). This option is \
         only valid for [PERSISTENT_1] and [PERSISTENT_2] deployment types. \n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  For [PERSISTENT_1] SSD storage: 50, 100, 200.\n\
        \            \n\
        \             }\n\
        \        {-  For [PERSISTENT_1] HDD storage: 12, 40.\n\
        \            \n\
        \             }\n\
        \        {-  For [PERSISTENT_2] SSD storage: 125, 250, 500, 1000.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  deployment_type : lustre_deployment_type option;
      [@ocaml.doc
        "The deployment type of the FSx for Lustre file system. {i Scratch deployment type} is \
         designed for temporary storage and shorter-term processing of data.\n\n\
        \  [SCRATCH_1] and [SCRATCH_2] deployment types are best suited for when you need \
         temporary storage and shorter-term processing of data. The [SCRATCH_2] deployment type \
         provides in-transit encryption of data and higher burst throughput capacity than \
         [SCRATCH_1].\n\
        \ \n\
        \  The [PERSISTENT_1] and [PERSISTENT_2] deployment type is used for longer-term storage \
         and workloads and encryption of data in transit. [PERSISTENT_2] offers higher \
         [PerUnitStorageThroughput] (up to 1000 MB/s/TiB) along with a lower minimum storage \
         capacity requirement (600 GiB). To learn more about FSx for Lustre deployment types, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-fsx-lustre.html}Deployment \
         and storage class options for FSx for Lustre file systems}.\n\
        \  \n\
        \   The default is [SCRATCH_1].\n\
        \   "]
  data_repository_configuration : data_repository_configuration option; [@ocaml.doc ""]
  weekly_maintenance_start_time : weekly_time option;
      [@ocaml.doc
        "The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time \
         zone. Here, [d] is the weekday number, from 1 through 7, beginning with Monday and ending \
         with Sunday.\n"]
}
[@@ocaml.doc "The configuration for the Amazon FSx for Lustre file system.\n"]

type nonrec ontap_deployment_type =
  | MULTI_AZ_2 [@ocaml.doc ""]
  | SINGLE_AZ_2 [@ocaml.doc ""]
  | SINGLE_AZ_1 [@ocaml.doc ""]
  | MULTI_AZ_1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ip_address_range = string [@@ocaml.doc ""]

type nonrec ontap_endpoint_ip_addresses = ip_address list [@@ocaml.doc ""]

type nonrec file_system_endpoint = {
  ipv6_addresses : ontap_endpoint_ip_addresses option;
      [@ocaml.doc "The IPv6 addresses of the file system endpoint.\n"]
  ip_addresses : ontap_endpoint_ip_addresses option;
      [@ocaml.doc "The IPv4 addresses of the file system endpoint.\n"]
  dns_name : dns_name option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An Amazon FSx for NetApp ONTAP file system has two endpoints that are used to access data or to \
   manage the file system using the NetApp ONTAP CLI, REST API, or NetApp SnapMirror. They are the \
   [Management] and [Intercluster] endpoints.\n"]

type nonrec file_system_endpoints = {
  management : file_system_endpoint option;
      [@ocaml.doc
        "An endpoint for managing your file system using the NetApp ONTAP CLI and NetApp ONTAP API.\n"]
  intercluster : file_system_endpoint option;
      [@ocaml.doc
        "An endpoint for managing your file system by setting up NetApp SnapMirror with other \
         ONTAP systems.\n"]
}
[@@ocaml.doc
  "An Amazon FSx for NetApp ONTAP file system has the following endpoints that are used to access \
   data or to manage the file system using the NetApp ONTAP CLI, REST API, or NetApp SnapMirror.\n"]

type nonrec route_table_id = string [@@ocaml.doc ""]

type nonrec route_table_ids = route_table_id list [@@ocaml.doc ""]

type nonrec admin_password = string [@@ocaml.doc ""]

type nonrec ha_pairs = int [@@ocaml.doc ""]

type nonrec throughput_capacity_per_ha_pair = int [@@ocaml.doc ""]

type nonrec ipv6_address_range = string [@@ocaml.doc ""]

type nonrec ontap_file_system_configuration = {
  endpoint_ipv6_address_range : ipv6_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /118 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  throughput_capacity_per_ha_pair : throughput_capacity_per_ha_pair option;
      [@ocaml.doc
        "Use to choose the throughput capacity per HA pair. When the value of [HAPairs] is equal \
         to 1, the value of [ThroughputCapacityPerHAPair] is the total throughput for the file \
         system.\n\n\
        \ This field and [ThroughputCapacity] cannot be defined in the same API call, but one is \
         required.\n\
        \ \n\
        \  This field and [ThroughputCapacity] are the same for file systems with one HA pair.\n\
        \  \n\
        \   {ul\n\
        \         {-  For [SINGLE_AZ_1] and [MULTI_AZ_1] file systems, valid values are 128, 256, \
         512, 1024, 2048, or 4096 MBps.\n\
        \             \n\
        \              }\n\
        \         {-  For [SINGLE_AZ_2], valid values are 1536, 3072, or 6144 MBps.\n\
        \             \n\
        \              }\n\
        \         {-  For [MULTI_AZ_2], valid values are 384, 768, 1536, 3072, or 6144 MBps.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \   \n\
        \    {ul\n\
        \          {-  The value of [ThroughputCapacity] and [ThroughputCapacityPerHAPair] are not \
         the same value.\n\
        \              \n\
        \               }\n\
        \          {-  The value of deployment type is [SINGLE_AZ_2] and [ThroughputCapacity] / \
         [ThroughputCapacityPerHAPair] is not a valid HA pair (a value between 1 and 12).\n\
        \              \n\
        \               }\n\
        \          {-  The value of [ThroughputCapacityPerHAPair] is not a valid value.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  ha_pairs : ha_pairs option;
      [@ocaml.doc
        "Specifies how many high-availability (HA) file server pairs the file system will have. \
         The default value is 1. The value of this property affects the values of \
         [StorageCapacity], [Iops], and [ThroughputCapacity]. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/HA-pairs.html}High-availability (HA) \
         pairs} in the FSx for ONTAP user guide.\n\n\
        \ Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \ \n\
        \  {ul\n\
        \        {-  The value of [HAPairs] is less than 1 or greater than 12.\n\
        \            \n\
        \             }\n\
        \        {-  The value of [HAPairs] is greater than 1 and the value of [DeploymentType] is \
         [SINGLE_AZ_1], [MULTI_AZ_1], or [MULTI_AZ_2].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  fsx_admin_password : admin_password option;
      [@ocaml.doc
        "You can use the [fsxadmin] user account to access the NetApp ONTAP CLI and REST API. The \
         password value is always redacted in the response.\n"]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  throughput_capacity : megabytes_per_second option; [@ocaml.doc ""]
  route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) The VPC route tables in which your file system's endpoints are created.\n"]
  preferred_subnet_id : subnet_id option; [@ocaml.doc ""]
  disk_iops_configuration : disk_iops_configuration option;
      [@ocaml.doc
        "The SSD IOPS configuration for the ONTAP file system, specifying the number of \
         provisioned IOPS and the provision mode.\n"]
  endpoints : file_system_endpoints option;
      [@ocaml.doc
        "The [Management] and [Intercluster] endpoints that are used to access data or to manage \
         the file system using the NetApp ONTAP CLI, REST API, or NetApp SnapMirror.\n"]
  endpoint_ip_address_range : ip_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API, Amazon FSx selects an \
         unused IP address range for you from the 198.19.* range. By default in the Amazon FSx \
         console, Amazon FSx chooses the last 64 IP addresses from the VPC\226\128\153s primary \
         CIDR range to use as the endpoint IP address range for the file system. You can have \
         overlapping endpoint IP addresses for file systems deployed in the same VPC/route tables.\n"]
  deployment_type : ontap_deployment_type option;
      [@ocaml.doc
        "Specifies the FSx for ONTAP file system deployment type in use in the file system. \n\n\
        \ {ul\n\
        \       {-   [MULTI_AZ_1] - A high availability file system configured for Multi-AZ \
         redundancy to tolerate temporary Availability Zone (AZ) unavailability. This is a \
         first-generation FSx for ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       {-   [MULTI_AZ_2] - A high availability file system configured for Multi-AZ \
         redundancy to tolerate temporary AZ unavailability. This is a second-generation FSx for \
         ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_1] - A file system configured for Single-AZ redundancy. This is a \
         first-generation FSx for ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_2] - A file system configured with multiple high-availability (HA) \
         pairs for Single-AZ redundancy. This is a second-generation FSx for ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For information about the use cases for Multi-AZ and Single-AZ deployments, refer to \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-multiAZ.html}Choosing \
         Multi-AZ or Single-AZ file system deployment}. \n\
        \   "]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
}
[@@ocaml.doc "Configuration for the FSx for NetApp ONTAP file system.\n"]

type nonrec file_system_type_version = string [@@ocaml.doc ""]

type nonrec open_zfs_deployment_type =
  | MULTI_AZ_1 [@ocaml.doc ""]
  | SINGLE_AZ_HA_2 [@ocaml.doc ""]
  | SINGLE_AZ_HA_1 [@ocaml.doc ""]
  | SINGLE_AZ_2 [@ocaml.doc ""]
  | SINGLE_AZ_1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec open_zfs_read_cache_sizing_mode =
  | PROPORTIONAL_TO_THROUGHPUT_CAPACITY [@ocaml.doc ""]
  | USER_PROVISIONED [@ocaml.doc ""]
  | NO_CACHE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec open_zfs_read_cache_configuration = {
  size_gi_b : storage_capacity option;
      [@ocaml.doc
        " Required if [SizingMode] is set to [USER_PROVISIONED]. Specifies the size of the file \
         system's SSD read cache, in gibibytes (GiB). \n"]
  sizing_mode : open_zfs_read_cache_sizing_mode option;
      [@ocaml.doc
        " Specifies how the provisioned SSD read cache is sized, as follows: \n\n\
        \ {ul\n\
        \       {-  Set to [NO_CACHE] if you do not want to use an SSD read cache with your \
         Intelligent-Tiering file system.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [USER_PROVISIONED] to specify the exact size of your SSD read cache.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [PROPORTIONAL_TO_THROUGHPUT_CAPACITY] to have your SSD read cache \
         automatically sized based on your throughput capacity.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " The configuration for the optional provisioned SSD read cache on Amazon FSx for OpenZFS file \
   systems that use the Intelligent-Tiering storage class. \n"]

type nonrec open_zfs_file_system_configuration = {
  read_cache_configuration : open_zfs_read_cache_configuration option;
      [@ocaml.doc
        " Required when [StorageType] is set to [INTELLIGENT_TIERING]. Specifies the optional \
         provisioned SSD read cache. \n"]
  endpoint_ipv6_address : ip_address option;
      [@ocaml.doc
        "The IPv6 address of the endpoint that is used to access data or to manage the file system.\n"]
  endpoint_ip_address : ip_address option;
      [@ocaml.doc
        "The IPv4 address of the endpoint that is used to access data or to manage the file system.\n"]
  route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) The VPC route tables in which your file system's endpoints are created.\n"]
  endpoint_ipv6_address_range : ipv6_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /118 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  endpoint_ip_address_range : ip_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /28 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables.\n"]
  preferred_subnet_id : subnet_id option;
      [@ocaml.doc
        "Required when [DeploymentType] is set to [MULTI_AZ_1]. This specifies the subnet in which \
         you want the preferred file server to be located.\n"]
  root_volume_id : volume_id option;
      [@ocaml.doc "The ID of the root volume of the OpenZFS file system. \n"]
  disk_iops_configuration : disk_iops_configuration option; [@ocaml.doc ""]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  throughput_capacity : megabytes_per_second option;
      [@ocaml.doc
        "The throughput of an Amazon FSx file system, measured in megabytes per second (MBps).\n"]
  deployment_type : open_zfs_deployment_type option;
      [@ocaml.doc
        "Specifies the file-system deployment type. Amazon FSx for OpenZFS supports\226\128\168 \
         [MULTI_AZ_1], [SINGLE_AZ_HA_2], [SINGLE_AZ_HA_1], [SINGLE_AZ_2], and [SINGLE_AZ_1].\n"]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  copy_tags_to_volumes : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the volume should be copied to snapshots. \
         This value defaults to [false]. If it's set to [true], all tags for the volume are copied \
         to snapshots where the user doesn't specify tags. If this value is [true] and you specify \
         one or more tags, only the specified tags are copied to snapshots. If you specify one or \
         more tags when creating the snapshot, no tags are copied from the volume, regardless of \
         this value. \n"]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags on the file system should be copied to backups. \
         If it's set to [true], all tags on the file system are copied to all automatic backups \
         and any user-initiated backups where the user doesn't specify any tags. If this value is \
         [true] and you specify one or more tags, only the specified tags are copied to backups. \
         If you specify one or more tags when creating a user-initiated backup, no tags are copied \
         from the file system, regardless of this value. \n"]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
}
[@@ocaml.doc "The configuration for the Amazon FSx for OpenZFS file system. \n"]

type nonrec network_type = DUAL [@ocaml.doc ""] | IPV4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec administrative_action_failure_details = {
  message : error_message option;
      [@ocaml.doc "Error message providing details about the failed administrative action.\n"]
}
[@@ocaml.doc "Provides information about a failed administrative action.\n"]

type nonrec snapshot_id = string [@@ocaml.doc ""]

type nonrec snapshot_name = string [@@ocaml.doc ""]

type nonrec snapshot_lifecycle =
  | AVAILABLE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec total_transfer_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec remaining_transfer_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec volume_path = string [@@ocaml.doc ""]

type nonrec integer_no_max = int [@@ocaml.doc ""]

type nonrec integer_record_size_ki_b = int [@@ocaml.doc ""]

type nonrec open_zfs_data_compression_type =
  | LZ4 [@ocaml.doc ""]
  | ZSTD [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec open_zfs_copy_strategy =
  | INCREMENTAL_COPY [@ocaml.doc ""]
  | FULL_COPY [@ocaml.doc ""]
  | CLONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec open_zfs_origin_snapshot_configuration = {
  copy_strategy : open_zfs_copy_strategy option;
      [@ocaml.doc
        "The strategy used when copying data from the snapshot to the new volume. \n\n\
        \ {ul\n\
        \       {-   [CLONE] - The new volume references the data in the origin snapshot. Cloning \
         a snapshot is faster than copying the data from a snapshot to a new volume and doesn't \
         consume disk throughput. However, the origin snapshot can't be deleted if there is a \
         volume using its copied data. \n\
        \           \n\
        \            }\n\
        \       {-   [FULL_COPY] - Copies all data from the snapshot to the new volume.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [INCREMENTAL_COPY] option is only for updating an existing volume by using a \
         snapshot from another FSx for OpenZFS file system. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_CopySnapshotAndUpdateVolume.html}CopySnapshotAndUpdateVolume}.\n\
        \    \n\
        \     "]
  snapshot_ar_n : resource_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The snapshot configuration used when creating an Amazon FSx for OpenZFS volume from a snapshot.\n"]

type nonrec read_only = bool [@@ocaml.doc ""]

type nonrec open_zfs_clients = string [@@ocaml.doc ""]

type nonrec open_zfs_nfs_export_option = string [@@ocaml.doc ""]

type nonrec open_zfs_nfs_export_options = open_zfs_nfs_export_option list [@@ocaml.doc ""]

type nonrec open_zfs_client_configuration = {
  options : open_zfs_nfs_export_options;
      [@ocaml.doc
        "The options to use when mounting the file system. For a list of options that you can use \
         with Network File System (NFS), see the {{:https://linux.die.net/man/5/exports}exports(5) \
         - Linux man page}. When choosing your options, consider the following:\n\n\
        \ {ul\n\
        \       {-   [crossmnt] is used by default. If you don't specify [crossmnt] when changing \
         the client configuration, you won't be able to see or access snapshots in your file \
         system's snapshot directory.\n\
        \           \n\
        \            }\n\
        \       {-   [sync] is used by default. If you instead specify [async], the system \
         acknowledges writes before writing to disk. If the system crashes before the writes are \
         finished, you lose the unwritten data. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  clients : open_zfs_clients;
      [@ocaml.doc
        "A value that specifies who can mount the file system. You can provide a wildcard \
         character ([*]), an IP address ([0.0.0.0]), or a CIDR address ([192.0.2.0/24]). By \
         default, Amazon FSx uses the wildcard character when specifying the client. \n"]
}
[@@ocaml.doc
  "Specifies who can mount an OpenZFS file system and the options available while mounting the \
   file system.\n"]

type nonrec open_zfs_client_configurations = open_zfs_client_configuration list [@@ocaml.doc ""]

type nonrec open_zfs_nfs_export = {
  client_configurations : open_zfs_client_configurations;
      [@ocaml.doc
        "A list of configuration objects that contain the client and options for mounting the \
         OpenZFS file system. \n"]
}
[@@ocaml.doc
  "The Network File System (NFS) configurations for mounting an Amazon FSx for OpenZFS file system. \n"]

type nonrec open_zfs_nfs_exports = open_zfs_nfs_export list [@@ocaml.doc ""]

type nonrec open_zfs_quota_type = GROUP [@ocaml.doc ""] | USER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec open_zfs_user_or_group_quota = {
  storage_capacity_quota_gi_b : integer_no_max;
      [@ocaml.doc "The user or group's storage quota, in gibibytes (GiB).\n"]
  id : integer_no_max; [@ocaml.doc "The ID of the user or group that the quota applies to.\n"]
  type_ : open_zfs_quota_type;
      [@ocaml.doc "Specifies whether the quota applies to a user or group.\n"]
}
[@@ocaml.doc
  "Used to configure quotas that define how much storage a user or group can use on an FSx for \
   OpenZFS volume. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-volumes.html#volume-properties}Volume \
   properties} in the FSx for OpenZFS User Guide. \n"]

type nonrec open_zfs_user_and_group_quotas = open_zfs_user_or_group_quota list [@@ocaml.doc ""]

type nonrec open_zfs_volume_configuration = {
  copy_strategy : open_zfs_copy_strategy option;
      [@ocaml.doc
        "Specifies the strategy used when copying data from the snapshot to the new volume. \n\n\
        \ {ul\n\
        \       {-   [CLONE] - The new volume references the data in the origin snapshot. Cloning \
         a snapshot is faster than copying data from the snapshot to a new volume and doesn't \
         consume disk throughput. However, the origin snapshot can't be deleted if there is a \
         volume using its copied data.\n\
        \           \n\
        \            }\n\
        \       {-   [FULL_COPY] - Copies all data from the snapshot to the new volume.\n\
        \           \n\
        \            Specify this option to create the volume from a snapshot on another FSx for \
         OpenZFS file system.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \    The [INCREMENTAL_COPY] option is only for updating an existing volume by using a \
         snapshot from another FSx for OpenZFS file system. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_CopySnapshotAndUpdateVolume.html}CopySnapshotAndUpdateVolume}.\n\
        \    \n\
        \     "]
  destination_snapshot : snapshot_id option;
      [@ocaml.doc
        "The ID of the snapshot that's being copied or was most recently copied to the destination \
         volume.\n"]
  source_snapshot_ar_n : resource_ar_n option; [@ocaml.doc ""]
  delete_intermediate_data : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether snapshot data that differs between the current state \
         and the specified snapshot should be overwritten when a volume is restored from a \
         snapshot.\n"]
  delete_cloned_volumes : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether dependent clone volumes created from intermediate \
         snapshots should be deleted when a volume is restored from snapshot.\n"]
  delete_intermediate_snaphots : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether snapshots between the current state and the specified \
         snapshot should be deleted when a volume is restored from snapshot.\n"]
  restore_to_snapshot : snapshot_id option;
      [@ocaml.doc "Specifies the ID of the snapshot to which the volume was restored.\n"]
  user_and_group_quotas : open_zfs_user_and_group_quotas option;
      [@ocaml.doc "An object specifying how much storage users or groups can use on the volume.\n"]
  nfs_exports : open_zfs_nfs_exports option;
      [@ocaml.doc
        "The configuration object for mounting a Network File System (NFS) file system.\n"]
  read_only : read_only option;
      [@ocaml.doc "A Boolean value indicating whether the volume is read-only.\n"]
  origin_snapshot : open_zfs_origin_snapshot_configuration option;
      [@ocaml.doc
        "The configuration object that specifies the snapshot to use as the origin of the data for \
         the volume.\n"]
  copy_tags_to_snapshots : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the volume should be copied to snapshots. \
         This value defaults to [false]. If it's set to [true], all tags for the volume are copied \
         to snapshots where the user doesn't specify tags. If this value is [true] and you specify \
         one or more tags, only the specified tags are copied to snapshots. If you specify one or \
         more tags when creating the snapshot, no tags are copied from the volume, regardless of \
         this value.\n"]
  data_compression_type : open_zfs_data_compression_type option;
      [@ocaml.doc
        "Specifies the method used to compress the data on the volume. The compression type is \
         [NONE] by default.\n\n\
        \ {ul\n\
        \       {-   [NONE] - Doesn't compress the data on the volume. [NONE] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [ZSTD] - Compresses the data in the volume using the Zstandard (ZSTD) \
         compression algorithm. Compared to LZ4, Z-Standard provides a better compression ratio to \
         minimize on-disk storage utilization.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Compresses the data in the volume using the LZ4 compression \
         algorithm. Compared to Z-Standard, LZ4 is less compute-intensive and delivers higher \
         write throughput speeds.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  record_size_ki_b : integer_record_size_ki_b option;
      [@ocaml.doc
        "The record size of an OpenZFS volume, in kibibytes (KiB). Valid values are 4, 8, 16, 32, \
         64, 128, 256, 512, or 1024 KiB. The default is 128 KiB. Most workloads should use the \
         default record size. For guidance on when to set a custom record size, see the {i Amazon \
         FSx for OpenZFS User Guide}.\n"]
  storage_capacity_quota_gi_b : integer_no_max option;
      [@ocaml.doc
        "The maximum amount of storage in gibibytes (GiB) that the volume can use from its parent. \
         You can specify a quota larger than the storage on the parent volume.\n"]
  storage_capacity_reservation_gi_b : integer_no_max option;
      [@ocaml.doc
        "The amount of storage in gibibytes (GiB) to reserve from the parent volume. You can't \
         reserve more storage than the parent volume has reserved.\n"]
  volume_path : volume_path option;
      [@ocaml.doc
        "The path to the volume from the root volume. For example, [fsx/parentVolume/volume1].\n"]
  parent_volume_id : volume_id option; [@ocaml.doc "The ID of the parent volume.\n"]
}
[@@ocaml.doc "The configuration of an Amazon FSx for OpenZFS volume.\n"]

type administrative_action = {
  message : error_message option; [@ocaml.doc ""]
  remaining_transfer_bytes : remaining_transfer_bytes option;
      [@ocaml.doc
        "The remaining bytes to transfer for the FSx for OpenZFS snapshot that you're copying.\n"]
  total_transfer_bytes : total_transfer_bytes option;
      [@ocaml.doc
        "The number of bytes that have transferred for the FSx for OpenZFS snapshot that you're \
         copying.\n"]
  target_snapshot_values : snapshot option; [@ocaml.doc ""]
  target_volume_values : volume option; [@ocaml.doc ""]
  failure_details : administrative_action_failure_details option; [@ocaml.doc ""]
  target_file_system_values : file_system option;
      [@ocaml.doc
        "The target value for the administration action, provided in the [UpdateFileSystem] \
         operation. Returned for [FILE_SYSTEM_UPDATE] administrative actions. \n"]
  status : status option;
      [@ocaml.doc
        "The status of the administrative action, as follows:\n\n\
        \ {ul\n\
        \       {-   [FAILED] - Amazon FSx failed to process the administrative action successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS] - Amazon FSx is processing the administrative action.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - Amazon FSx is waiting to process the administrative action.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - Amazon FSx has finished processing the administrative task.\n\
        \           \n\
        \            For a backup restore to a second-generation FSx for ONTAP file system, \
         indicates that all data has been downloaded to the volume, and clients now have \
         read-write access to volume.\n\
        \            \n\
        \             }\n\
        \       {-   [UPDATED_OPTIMIZING] - For a storage-capacity increase update, Amazon FSx has \
         updated the file system with the new storage capacity, and is now performing the \
         storage-optimization process.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - For a backup restore to a second-generation FSx for ONTAP file \
         system, indicates that the file metadata is being downloaded onto the volume. The \
         volume's Lifecycle state is CREATING.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS] - For a backup restore to a second-generation FSx for ONTAP \
         file system, indicates that all metadata has been downloaded to the new volume and client \
         can access data with read-only access while Amazon FSx downloads the file data to the \
         volume. Track the progress of this process with the [ProgressPercent] element.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  request_time : request_time option;
      [@ocaml.doc "The time that the administrative action request was received.\n"]
  progress_percent : progress_percent option;
      [@ocaml.doc
        "The percentage-complete status of a [STORAGE_OPTIMIZATION] or [DOWNLOAD_DATA_FROM_BACKUP] \
         administrative action. Does not apply to any other administrative action type.\n"]
  administrative_action_type : administrative_action_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Describes a specific Amazon FSx administrative action for the current Windows, Lustre, OpenZFS, \
   or ONTAP file system or volume.\n"]

and administrative_actions = administrative_action list [@@ocaml.doc ""]

and file_system = {
  network_type : network_type option; [@ocaml.doc "The network type of the file system.\n"]
  open_zfs_configuration : open_zfs_file_system_configuration option;
      [@ocaml.doc "The configuration for this Amazon FSx for OpenZFS file system.\n"]
  file_system_type_version : file_system_type_version option;
      [@ocaml.doc
        "The Lustre version of the Amazon FSx for Lustre file system, which can be [2.10], [2.12], \
         or [2.15].\n"]
  ontap_configuration : ontap_file_system_configuration option;
      [@ocaml.doc "The configuration for this Amazon FSx for NetApp ONTAP file system.\n"]
  administrative_actions : administrative_actions option;
      [@ocaml.doc
        "A list of administrative actions for the file system that are in process or waiting to be \
         processed. Administrative actions describe changes to the Amazon FSx system that you have \
         initiated using the [UpdateFileSystem] operation.\n"]
  lustre_configuration : lustre_file_system_configuration option; [@ocaml.doc ""]
  windows_configuration : windows_file_system_configuration option;
      [@ocaml.doc "The configuration for this Amazon FSx for Windows File Server file system.\n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to associate with the file system. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/tag-resources.html}Tagging your \
         Amazon FSx resources} in the {i Amazon FSx for Lustre User Guide}.\n"]
  resource_ar_n : resource_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file system resource.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt Amazon FSx file system \
         data. Used as follows with Amazon FSx file system types:\n\n\
        \ {ul\n\
        \       {-  Amazon FSx for Lustre [PERSISTENT_1] and [PERSISTENT_2] deployment types only.\n\
        \           \n\
        \             [SCRATCH_1] and [SCRATCH_2] types are encrypted using the Amazon FSx service \
         KMS key for your account.\n\
        \            \n\
        \             }\n\
        \       {-  Amazon FSx for NetApp ONTAP\n\
        \           \n\
        \            }\n\
        \       {-  Amazon FSx for OpenZFS\n\
        \           \n\
        \            }\n\
        \       {-  Amazon FSx for Windows File Server\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dns_name : dns_name option;
      [@ocaml.doc "The Domain Name System (DNS) name for the file system.\n"]
  network_interface_ids : network_interface_ids option;
      [@ocaml.doc
        "The IDs of the elastic network interfaces from which a specific file system is \
         accessible. The elastic network interface is automatically created in the same virtual \
         private cloud (VPC) that the Amazon FSx file system was created in. For more information, \
         see {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html}Elastic Network \
         Interfaces} in the {i Amazon EC2 User Guide.} \n\n\
        \ For an Amazon FSx for Windows File Server file system, you can have one network \
         interface ID. For an Amazon FSx for Lustre file system, you can have more than one.\n\
        \ "]
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "Specifies the IDs of the subnets that the file system is accessible from. For the Amazon \
         FSx Windows and ONTAP [MULTI_AZ_1] file system deployment type, there are two subnet IDs, \
         one for the preferred file server and one for the standby file server. The preferred file \
         server subnet identified in the [PreferredSubnetID] property. All other file systems have \
         only one subnet ID.\n\n\
        \ For FSx for Lustre file systems, and Single-AZ Windows file systems, this is the ID of \
         the subnet that contains the file system's endpoint. For [MULTI_AZ_1] Windows and ONTAP \
         file systems, the file system endpoint is available in the [PreferredSubnetID].\n\
        \ "]
  vpc_id : vpc_id option;
      [@ocaml.doc "The ID of the primary virtual private cloud (VPC) for the file system.\n"]
  storage_type : storage_type option;
      [@ocaml.doc
        "The type of storage the file system is using.\n\n\
        \ {ul\n\
        \       {-  If set to [SSD], the file system uses solid state drive storage.\n\
        \           \n\
        \            }\n\
        \       {-  If set to [HDD], the file system uses hard disk drive storage.\n\
        \           \n\
        \            }\n\
        \       {-  If set to [INTELLIGENT_TIERING], the file system uses fully elastic, \
         intelligently-tiered storage.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  storage_capacity : storage_capacity option;
      [@ocaml.doc
        "The storage capacity of the file system in gibibytes (GiB).\n\n\
        \ Amazon FSx responds with an HTTP status code 400 (Bad Request) if the value of \
         [StorageCapacity] is outside of the minimum or maximum values.\n\
        \ "]
  failure_details : file_system_failure_details option; [@ocaml.doc ""]
  lifecycle : file_system_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the file system. The following are the possible values and what \
         they mean:\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The file system is in a healthy state, and is reachable and \
         available for use.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - Amazon FSx is creating the new file system.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - Amazon FSx is deleting an existing file system.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - An existing file system has experienced an unrecoverable failure. \
         When creating a new file system, Amazon FSx was unable to create the file system.\n\
        \           \n\
        \            }\n\
        \       {-   [MISCONFIGURED] - The file system is in a failed but recoverable state.\n\
        \           \n\
        \            }\n\
        \       {-   [MISCONFIGURED_UNAVAILABLE] - (Amazon FSx for Windows File Server only) The \
         file system is currently unavailable due to a change in your Active Directory \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] - The file system is undergoing a customer-initiated update.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_system_type : file_system_type option;
      [@ocaml.doc
        "The type of Amazon FSx file system, which can be [LUSTRE], [WINDOWS], [ONTAP], or \
         [OPENZFS].\n"]
  file_system_id : file_system_id option;
      [@ocaml.doc "The system-generated, unique 17-digit ID of the file system.\n"]
  creation_time : creation_time option;
      [@ocaml.doc
        "The time that the file system was created, in seconds (since 1970-01-01T00:00:00Z), also \
         known as Unix time.\n"]
  owner_id : aws_account_id option;
      [@ocaml.doc
        "The Amazon Web Services account that created the file system. If the file system was \
         created by a user in IAM Identity Center, the Amazon Web Services account to which the \
         IAM user belongs is the owner.\n"]
}
[@@ocaml.doc "A description of a specific Amazon FSx file system.\n"]

and snapshot = {
  administrative_actions : administrative_actions option;
      [@ocaml.doc
        "A list of administrative actions for the file system that are in process or waiting to be \
         processed. Administrative actions describe changes to the Amazon FSx system.\n"]
  tags : tags option; [@ocaml.doc ""]
  lifecycle_transition_reason : lifecycle_transition_reason option; [@ocaml.doc ""]
  lifecycle : snapshot_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the snapshot.\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon FSx hasn't started creating the snapshot.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - Amazon FSx is creating the snapshot.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - Amazon FSx is deleting the snapshot.\n\
        \           \n\
        \            }\n\
        \       {-   [AVAILABLE] - The snapshot is fully available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_time : creation_time option; [@ocaml.doc ""]
  volume_id : volume_id option; [@ocaml.doc "The ID of the volume that the snapshot is of.\n"]
  name : snapshot_name option; [@ocaml.doc "The name of the snapshot.\n"]
  snapshot_id : snapshot_id option; [@ocaml.doc "The ID of the snapshot.\n"]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc "A snapshot of an Amazon FSx for OpenZFS volume.\n"]

and volume = {
  open_zfs_configuration : open_zfs_volume_configuration option;
      [@ocaml.doc "The configuration of an Amazon FSx for OpenZFS volume.\n"]
  administrative_actions : administrative_actions option;
      [@ocaml.doc
        "A list of administrative actions for the volume that are in process or waiting to be \
         processed. Administrative actions describe changes to the volume that you have initiated \
         using the [UpdateVolume] action.\n"]
  lifecycle_transition_reason : lifecycle_transition_reason option;
      [@ocaml.doc "The reason why the volume lifecycle status changed.\n"]
  volume_type : volume_type option; [@ocaml.doc "The type of the volume.\n"]
  volume_id : volume_id option; [@ocaml.doc "The system-generated, unique ID of the volume.\n"]
  tags : tags option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  ontap_configuration : ontap_volume_configuration option; [@ocaml.doc ""]
  name : volume_name option; [@ocaml.doc "The name of the volume.\n"]
  lifecycle : volume_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the volume.\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The volume is fully available for use.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATED] - The volume has been created.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - Amazon FSx is creating the new volume.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - Amazon FSx is deleting an existing volume.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon FSx was unable to create the volume.\n\
        \           \n\
        \            }\n\
        \       {-   [MISCONFIGURED] - The volume is in a failed but recoverable state.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - Amazon FSx hasn't started creating the volume.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_system_id : file_system_id option; [@ocaml.doc ""]
  creation_time : creation_time option; [@ocaml.doc ""]
}
[@@ocaml.doc "Describes an Amazon FSx volume.\n"]

type nonrec volumes = volume list [@@ocaml.doc ""]

type nonrec volume_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No Amazon FSx volumes were found based upon the supplied parameters.\n"]

type nonrec volume_ids = volume_id list [@@ocaml.doc ""]

type nonrec volume_filter_name =
  | STORAGE_VIRTUAL_MACHINE_ID [@ocaml.doc ""]
  | FILE_SYSTEM_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec volume_filter_value = string [@@ocaml.doc ""]

type nonrec volume_filter_values = volume_filter_value list [@@ocaml.doc ""]

type nonrec volume_filter = {
  values : volume_filter_values option;
      [@ocaml.doc
        "The values of the filter. These are all the values for any of the applied filters.\n"]
  name : volume_filter_name option; [@ocaml.doc "The name for this filter.\n"]
}
[@@ocaml.doc
  "A filter used to restrict the results of describe calls for Amazon FSx for NetApp ONTAP or \
   Amazon FSx for OpenZFS volumes. You can use multiple filters to return results that meet all \
   applied filter requirements.\n"]

type nonrec volume_filters = volume_filter list [@@ocaml.doc ""]

type nonrec verbose_flag = string [@@ocaml.doc ""]

type nonrec value = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec update_volume_response = {
  volume : volume option;
      [@ocaml.doc
        "A description of the volume just updated. Returned after a successful [UpdateVolume] API \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec update_snaplock_configuration = {
  volume_append_mode_enabled : flag option;
      [@ocaml.doc
        "Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume. Volume-append \
         mode allows you to create WORM-appendable files and write data to them incrementally. The \
         default value is [false]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-append}Volume-append \
         mode}. \n\
        \ "]
  retention_period : snaplock_retention_period option;
      [@ocaml.doc "Specifies the retention period of an FSx for ONTAP SnapLock volume. \n"]
  privileged_delete : privileged_delete option;
      [@ocaml.doc
        "Enables, disables, or permanently disables privileged delete on an FSx for ONTAP SnapLock \
         Enterprise volume. Enabling privileged delete allows SnapLock administrators to delete \
         write once, read many (WORM) files even if they have active retention periods. \
         [PERMANENTLY_DISABLED] is a terminal state. If privileged delete is permanently disabled \
         on a SnapLock volume, you can't re-enable it. The default value is [DISABLED]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html#privileged-delete}Privileged \
         delete}. \n\
        \ "]
  autocommit_period : autocommit_period option;
      [@ocaml.doc
        "The configuration object for setting the autocommit period of files in an FSx for ONTAP \
         SnapLock volume. \n"]
  audit_log_volume : flag option;
      [@ocaml.doc
        "Enables or disables the audit log volume for an FSx for ONTAP SnapLock volume. The \
         default value is [false]. If you set [AuditLogVolume] to [true], the SnapLock volume is \
         created as an audit log volume. The minimum retention period for an audit log volume is \
         six months. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/how-snaplock-works.html#snaplock-audit-log-volume} \
         SnapLock audit log volumes}. \n\
        \ "]
}
[@@ocaml.doc "Updates the SnapLock configuration for an existing FSx for ONTAP volume. \n"]

type nonrec update_ontap_volume_configuration = {
  size_in_bytes : volume_capacity_bytes option;
      [@ocaml.doc "The configured size of the volume, in bytes.\n"]
  snaplock_configuration : update_snaplock_configuration option;
      [@ocaml.doc
        "The configuration object for updating the SnapLock configuration of an FSx for ONTAP \
         SnapLock volume. \n"]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A boolean flag indicating whether tags for the volume should be copied to backups. This \
         value defaults to false. If it's set to true, all tags for the volume are copied to all \
         automatic and user-initiated backups where the user doesn't specify tags. If this value \
         is true, and you specify one or more tags, only the specified tags are copied to backups. \
         If you specify one or more tags when creating a user-initiated backup, no tags are copied \
         from the volume, regardless of this value.\n"]
  snapshot_policy : snapshot_policy option;
      [@ocaml.doc
        "Specifies the snapshot policy for the volume. There are three built-in snapshot policies:\n\n\
        \ {ul\n\
        \       {-   [default]: This is the default policy. A maximum of six hourly snapshots \
         taken five minutes past the hour. A maximum of two daily snapshots taken Monday through \
         Saturday at 10 minutes after midnight. A maximum of two weekly snapshots taken every \
         Sunday at 15 minutes after midnight.\n\
        \           \n\
        \            }\n\
        \       {-   [default-1weekly]: This policy is the same as the [default] policy except \
         that it only retains one snapshot from the weekly schedule.\n\
        \           \n\
        \            }\n\
        \       {-   [none]: This policy does not take any snapshots. This policy can be assigned \
         to volumes to prevent automatic snapshots from being taken.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can also provide the name of a custom policy that you created with the ONTAP CLI \
         or REST API.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snapshots-ontap.html#snapshot-policies}Snapshot \
         policies} in the {i Amazon FSx for NetApp ONTAP User Guide}.\n\
        \    "]
  tiering_policy : tiering_policy option; [@ocaml.doc "Update the volume's data tiering policy.\n"]
  storage_efficiency_enabled : flag option;
      [@ocaml.doc
        "Default is [false]. Set to true to enable the deduplication, compression, and compaction \
         storage efficiency features on the volume.\n"]
  size_in_megabytes : volume_capacity option;
      [@ocaml.doc "Specifies the size of the volume in megabytes.\n"]
  security_style : security_style option;
      [@ocaml.doc "The security style for the volume, which can be [UNIX], [NTFS], or [MIXED].\n"]
  junction_path : junction_path option;
      [@ocaml.doc
        "Specifies the location in the SVM's namespace where the volume is mounted. The \
         [JunctionPath] must have a leading forward slash, such as [/vol3].\n"]
}
[@@ocaml.doc
  "Used to specify changes to the ONTAP configuration for the volume you are updating.\n"]

type nonrec integer_no_max_from_negative_one = int [@@ocaml.doc ""]

type nonrec update_open_zfs_volume_configuration = {
  read_only : read_only option;
      [@ocaml.doc "A Boolean value indicating whether the volume is read-only.\n"]
  user_and_group_quotas : open_zfs_user_and_group_quotas option;
      [@ocaml.doc "An object specifying how much storage users or groups can use on the volume.\n"]
  nfs_exports : open_zfs_nfs_exports option;
      [@ocaml.doc
        "The configuration object for mounting a Network File System (NFS) file system.\n"]
  data_compression_type : open_zfs_data_compression_type option;
      [@ocaml.doc
        "Specifies the method used to compress the data on the volume. The compression type is \
         [NONE] by default.\n\n\
        \ {ul\n\
        \       {-   [NONE] - Doesn't compress the data on the volume. [NONE] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [ZSTD] - Compresses the data in the volume using the Zstandard (ZSTD) \
         compression algorithm. Compared to LZ4, Z-Standard provides a better compression ratio to \
         minimize on-disk storage utilization.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Compresses the data in the volume using the LZ4 compression \
         algorithm. Compared to Z-Standard, LZ4 is less compute-intensive and delivers higher \
         write throughput speeds.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  record_size_ki_b : integer_record_size_ki_b option;
      [@ocaml.doc
        "Specifies the record size of an OpenZFS volume, in kibibytes (KiB). Valid values are 4, \
         8, 16, 32, 64, 128, 256, 512, or 1024 KiB. The default is 128 KiB. Most workloads should \
         use the default record size. Database workflows can benefit from a smaller record size, \
         while streaming workflows can benefit from a larger record size. For additional guidance \
         on when to set a custom record size, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#performance-tips-zfs} \
         Tips for maximizing performance} in the {i Amazon FSx for OpenZFS User Guide}.\n"]
  storage_capacity_quota_gi_b : integer_no_max_from_negative_one option;
      [@ocaml.doc
        "The maximum amount of storage in gibibytes (GiB) that the volume can use from its parent. \
         You can specify a quota larger than the storage on the parent volume. You can specify a \
         value of [-1] to unset a volume's storage capacity quota.\n"]
  storage_capacity_reservation_gi_b : integer_no_max_from_negative_one option;
      [@ocaml.doc
        "The amount of storage in gibibytes (GiB) to reserve from the parent volume. You can't \
         reserve more storage than the parent volume has reserved. You can specify a value of [-1] \
         to unset a volume's storage capacity reservation.\n"]
}
[@@ocaml.doc
  "Used to specify changes to the OpenZFS configuration for the volume that you are updating.\n"]

type nonrec update_volume_request = {
  open_zfs_configuration : update_open_zfs_volume_configuration option;
      [@ocaml.doc "The configuration of the OpenZFS volume that you are updating.\n"]
  name : volume_name option;
      [@ocaml.doc
        "The name of the OpenZFS volume. OpenZFS root volumes are automatically named [FSX]. Child \
         volume names must be unique among their parent volume's children. The name of the volume \
         is part of the mount string for the OpenZFS volume. \n"]
  ontap_configuration : update_ontap_volume_configuration option;
      [@ocaml.doc "The configuration of the ONTAP volume that you are updating.\n"]
  volume_id : volume_id;
      [@ocaml.doc
        "The ID of the volume that you want to update, in the format [fsvol-0123456789abcdef0].\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec missing_volume_configuration = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A volume configuration is required for this operation.\n"]

type nonrec internal_server_error = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A generic error indicating a server-side failure.\n"]

type nonrec parameter = string [@@ocaml.doc ""]

type nonrec incompatible_parameter_error = {
  message : error_message option; [@ocaml.doc ""]
  parameter : parameter; [@ocaml.doc "A parameter that is incompatible with the earlier request.\n"]
}
[@@ocaml.doc
  "The error returned when a second request is received with the same client request token but \
   different parameters settings. A client request token should always uniquely identify a single \
   request.\n"]

type nonrec bad_request = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A generic error indicating a failure with a client request.\n"]

type nonrec directory_password = string [@@ocaml.doc ""]

type nonrec self_managed_active_directory_configuration_updates = {
  domain_join_service_account_secret : customer_secrets_manager_ar_n option;
      [@ocaml.doc
        "Specifies the updated Amazon Resource Name (ARN) of the Amazon Web Services Secrets \
         Manager secret containing the self-managed Active Directory domain join service account \
         credentials. Amazon FSx uses this account to join to your self-managed Active Directory \
         domain.\n"]
  file_system_administrators_group : file_system_administrators_group_name option;
      [@ocaml.doc
        "For FSx for ONTAP file systems only - Specifies the updated name of the self-managed \
         Active Directory domain group whose members are granted administrative privileges for the \
         Amazon FSx resource.\n"]
  organizational_unit_distinguished_name : organizational_unit_distinguished_name option;
      [@ocaml.doc
        "Specifies an updated fully qualified distinguished name of the organization unit within \
         your self-managed Active Directory.\n"]
  domain_name : active_directory_fully_qualified_name option;
      [@ocaml.doc
        "Specifies an updated fully qualified domain name of your self-managed Active Directory \
         configuration.\n"]
  dns_ips : dns_ips option;
      [@ocaml.doc
        "A list of up to three DNS server or domain controller IP addresses in your self-managed \
         Active Directory domain.\n"]
  password : directory_password option;
      [@ocaml.doc
        "Specifies the updated password for the service account on your self-managed Active \
         Directory domain. Amazon FSx uses this account to join to your self-managed Active \
         Directory domain.\n"]
  user_name : directory_user_name option;
      [@ocaml.doc
        "Specifies the updated user name for the service account on your self-managed Active \
         Directory domain. Amazon FSx uses this account to join to your self-managed Active \
         Directory domain.\n\n\
        \ This account must have the permissions required to join computers to the domain in the \
         organizational unit provided in [OrganizationalUnitDistinguishedName].\n\
        \ "]
}
[@@ocaml.doc
  "Specifies changes you are making to the self-managed Microsoft Active Directory configuration \
   to which an FSx for Windows File Server file system or an FSx for ONTAP SVM is joined.\n"]

type nonrec net_bios_alias = string [@@ocaml.doc ""]

type nonrec update_svm_active_directory_configuration = {
  net_bios_name : net_bios_alias option;
      [@ocaml.doc
        "Specifies an updated NetBIOS name of the AD computer object [NetBiosName] to which an SVM \
         is joined.\n"]
  self_managed_active_directory_configuration :
    self_managed_active_directory_configuration_updates option;
      [@ocaml.doc ""]
}
[@@ocaml.doc
  "Specifies updates to an FSx for ONTAP storage virtual machine's (SVM) Microsoft Active \
   Directory (AD) configuration. Note that account credentials are not returned in the response \
   payload.\n"]

type nonrec svm_active_directory_configuration = {
  self_managed_active_directory_configuration : self_managed_active_directory_attributes option;
      [@ocaml.doc ""]
  net_bios_name : net_bios_alias option;
      [@ocaml.doc "The NetBIOS name of the AD computer object to which the SVM is joined.\n"]
}
[@@ocaml.doc
  "Describes the Microsoft Active Directory (AD) directory configuration to which the FSx for \
   ONTAP storage virtual machine (SVM) is joined. Note that account credentials are not returned \
   in the response payload.\n"]

type nonrec svm_endpoint = {
  ipv6_addresses : ontap_endpoint_ip_addresses option;
      [@ocaml.doc "The SVM endpoint's IPv6 addresses.\n"]
  ip_addresses : ontap_endpoint_ip_addresses option;
      [@ocaml.doc "The SVM endpoint's IPv4 addresses.\n"]
  dns_name : dns_name option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An Amazon FSx for NetApp ONTAP storage virtual machine (SVM) has four endpoints that are used \
   to access data or to manage the SVM using the NetApp ONTAP CLI, REST API, or NetApp \
   CloudManager. They are the [Iscsi], [Management], [Nfs], and [Smb] endpoints.\n"]

type nonrec svm_endpoints = {
  smb : svm_endpoint option;
      [@ocaml.doc "An endpoint for connecting using the Server Message Block (SMB) protocol.\n"]
  nfs : svm_endpoint option;
      [@ocaml.doc "An endpoint for connecting using the Network File System (NFS) protocol.\n"]
  management : svm_endpoint option;
      [@ocaml.doc
        "An endpoint for managing SVMs using the NetApp ONTAP CLI, NetApp ONTAP API, or NetApp \
         CloudManager.\n"]
  iscsi : svm_endpoint option;
      [@ocaml.doc
        "An endpoint for connecting using the Internet Small Computer Systems Interface (iSCSI) \
         protocol.\n"]
}
[@@ocaml.doc
  "An Amazon FSx for NetApp ONTAP storage virtual machine (SVM) has the following endpoints that \
   are used to access data or to manage the SVM using the NetApp ONTAP CLI, REST API, or NetApp \
   CloudManager.\n"]

type nonrec storage_virtual_machine_lifecycle =
  | PENDING [@ocaml.doc ""]
  | MISCONFIGURED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_virtual_machine_name = string [@@ocaml.doc ""]

type nonrec storage_virtual_machine_subtype =
  | SYNC_SOURCE [@ocaml.doc ""]
  | SYNC_DESTINATION [@ocaml.doc ""]
  | DP_DESTINATION [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_virtual_machine_root_volume_security_style =
  | MIXED [@ocaml.doc ""]
  | NTFS [@ocaml.doc ""]
  | UNIX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_virtual_machine = {
  root_volume_security_style : storage_virtual_machine_root_volume_security_style option;
      [@ocaml.doc "The security style of the root volume of the SVM.\n"]
  lifecycle_transition_reason : lifecycle_transition_reason option;
      [@ocaml.doc "Describes why the SVM lifecycle state changed.\n"]
  tags : tags option; [@ocaml.doc ""]
  uui_d : uui_d option; [@ocaml.doc "The SVM's UUID (universally unique identifier).\n"]
  subtype : storage_virtual_machine_subtype option; [@ocaml.doc "Describes the SVM's subtype.\n"]
  storage_virtual_machine_id : storage_virtual_machine_id option;
      [@ocaml.doc "The SVM's system generated unique ID.\n"]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  name : storage_virtual_machine_name option; [@ocaml.doc "The name of the SVM, if provisioned.\n"]
  lifecycle : storage_virtual_machine_lifecycle option;
      [@ocaml.doc
        "Describes the SVM's lifecycle status.\n\n\
        \ {ul\n\
        \       {-   [CREATED] - The SVM is fully available for use.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - Amazon FSx is creating the new SVM.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - Amazon FSx is deleting an existing SVM.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon FSx was unable to create the SVM.\n\
        \           \n\
        \            }\n\
        \       {-   [MISCONFIGURED] - The SVM is in a failed but recoverable state.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - Amazon FSx has not started creating the SVM.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_system_id : file_system_id option; [@ocaml.doc ""]
  endpoints : svm_endpoints option;
      [@ocaml.doc
        "The endpoints that are used to access data or to manage the SVM using the NetApp ONTAP \
         CLI, REST API, or NetApp CloudManager. They are the [Iscsi], [Management], [Nfs], and \
         [Smb] endpoints.\n"]
  creation_time : creation_time option; [@ocaml.doc ""]
  active_directory_configuration : svm_active_directory_configuration option;
      [@ocaml.doc
        "Describes the Microsoft Active Directory configuration to which the SVM is joined, if \
         applicable.\n"]
}
[@@ocaml.doc
  "Describes the Amazon FSx for NetApp ONTAP storage virtual machine (SVM) configuration.\n"]

type nonrec update_storage_virtual_machine_response = {
  storage_virtual_machine : storage_virtual_machine option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_storage_virtual_machine_request = {
  svm_admin_password : admin_password option; [@ocaml.doc "Specifies a new SvmAdminPassword.\n"]
  storage_virtual_machine_id : storage_virtual_machine_id;
      [@ocaml.doc
        "The ID of the SVM that you want to update, in the format [svm-0123456789abcdef0].\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  active_directory_configuration : update_svm_active_directory_configuration option;
      [@ocaml.doc "Specifies updates to an SVM's Microsoft Active Directory (AD) configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_operation = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested operation is not supported for this resource or API.\n"]

type nonrec storage_virtual_machine_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No FSx for ONTAP SVMs were found based upon the supplied parameters.\n"]

type nonrec update_snapshot_response = {
  snapshot : snapshot option;
      [@ocaml.doc
        "Returned after a successful [UpdateSnapshot] operation, describing the snapshot that you \
         updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_snapshot_request = {
  snapshot_id : snapshot_id;
      [@ocaml.doc
        "The ID of the snapshot that you want to update, in the format \
         [fsvolsnap-0123456789abcdef0].\n"]
  name : snapshot_name; [@ocaml.doc "The name of the snapshot to update.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec snapshot_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No Amazon FSx snapshots were found based on the supplied parameters.\n"]

type nonrec update_shared_vpc_configuration_response = {
  enable_fsx_route_table_updates_from_participant_accounts : verbose_flag option;
      [@ocaml.doc
        "Indicates whether participant accounts can create FSx for ONTAP Multi-AZ file systems in \
         shared subnets.\n"]
}
[@@ocaml.doc ""]

type nonrec update_shared_vpc_configuration_request = {
  client_request_token : client_request_token option; [@ocaml.doc ""]
  enable_fsx_route_table_updates_from_participant_accounts : verbose_flag option;
      [@ocaml.doc
        "Specifies whether participant accounts can create FSx for ONTAP Multi-AZ file systems in \
         shared subnets. Set to [true] to enable or [false] to disable.\n"]
}
[@@ocaml.doc ""]

type nonrec update_open_zfs_volume_option =
  | DELETE_INTERMEDIATE_DATA [@ocaml.doc ""]
  | DELETE_CLONED_VOLUMES [@ocaml.doc ""]
  | DELETE_INTERMEDIATE_SNAPSHOTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_open_zfs_volume_options = update_open_zfs_volume_option list [@@ocaml.doc ""]

type nonrec update_file_system_windows_configuration = {
  fsrm_configuration : windows_fsrm_configuration option;
      [@ocaml.doc
        "The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File \
         Server uses for the file system. FSRM is disabled by default.\n"]
  disk_iops_configuration : disk_iops_configuration option;
      [@ocaml.doc
        "The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for \
         Windows file system. By default, Amazon FSx automatically provisions 3 IOPS per GiB of \
         storage capacity. You can provision additional IOPS per GiB of storage, up to the maximum \
         limit associated with your chosen throughput capacity.\n"]
  audit_log_configuration : windows_audit_log_create_configuration option;
      [@ocaml.doc
        "The configuration that Amazon FSx for Windows File Server uses to audit and log user \
         accesses of files, folders, and file shares on the Amazon FSx for Windows File Server \
         file system..\n"]
  self_managed_active_directory_configuration :
    self_managed_active_directory_configuration_updates option;
      [@ocaml.doc
        "The configuration Amazon FSx uses to join the Windows File Server instance to the \
         self-managed Microsoft AD directory. You cannot make a self-managed Microsoft AD update \
         request if there is an existing self-managed Microsoft AD update request in progress.\n"]
  throughput_capacity : megabytes_per_second option;
      [@ocaml.doc
        "Sets the target value for a file system's throughput capacity, in MB/s, that you are \
         updating the file system to. Valid values are 8, 16, 32, 64, 128, 256, 512, 1024, 2048. \
         You cannot make a throughput capacity update request if there is an existing throughput \
         capacity update request in progress. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-throughput-capacity.html}Managing \
         Throughput Capacity}.\n"]
  automatic_backup_retention_days : automatic_backup_retention_days option;
      [@ocaml.doc
        "The number of days to retain automatic backups. Setting this property to [0] disables \
         automatic backups. You can retain automatic backups for a maximum of 90 days. The default \
         is [30]. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#automatic-backups}Working \
         with Automatic Daily Backups}.\n"]
  daily_automatic_backup_start_time : daily_time option;
      [@ocaml.doc
        "The preferred time to start the daily automatic backup, in the UTC time zone, for \
         example, [02:00] \n"]
  weekly_maintenance_start_time : weekly_time option;
      [@ocaml.doc
        "The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time \
         zone. Where d is the weekday number, from 1 through 7, with 1 = Monday and 7 = Sunday.\n"]
}
[@@ocaml.doc
  "Updates the configuration for an existing Amazon FSx for Windows File Server file system. \
   Amazon FSx only overwrites existing properties with non-null values provided in the request.\n"]

type nonrec update_file_system_response = {
  file_system : file_system option;
      [@ocaml.doc "A description of the file system that was updated.\n"]
}
[@@ocaml.doc "The response object for the [UpdateFileSystem] operation.\n"]

type nonrec lustre_log_create_configuration = {
  destination : general_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that specifies the destination of the logs.\n\n\
        \ The destination can be any Amazon CloudWatch Logs log group ARN, with the following \
         requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  The destination ARN that you provide must be in the same Amazon Web Services \
         partition, Amazon Web Services Region, and Amazon Web Services account as your Amazon FSx \
         file system.\n\
        \            \n\
        \             }\n\
        \        {-  The name of the Amazon CloudWatch Logs log group must begin with the \
         [/aws/fsx] prefix.\n\
        \            \n\
        \             }\n\
        \        {-  If you do not provide a destination, Amazon FSx will create and use a log \
         stream in the CloudWatch Logs [/aws/fsx/lustre] log group (for Amazon FSx for Lustre) or \
         [/aws/fsx/filecache] (for Amazon File Cache).\n\
        \            \n\
        \             }\n\
        \        {-  If [Destination] is provided and the resource does not exist, the request \
         will fail with a [BadRequest] error.\n\
        \            \n\
        \             }\n\
        \        {-  If [Level] is set to [DISABLED], you cannot specify a destination in \
         [Destination].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  level : lustre_access_audit_log_level;
      [@ocaml.doc
        "Sets which data repository events are logged by Amazon FSx.\n\n\
        \ {ul\n\
        \       {-   [WARN_ONLY] - only warning events are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR_ONLY] - only error events are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [WARN_ERROR] - both warning events and error events are logged.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - logging of data repository events is turned off.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The Lustre logging configuration used when creating or updating an Amazon FSx for Lustre file \
   system. An Amazon File Cache is created with Lustre logging enabled by default, with a setting \
   of [WARN_ERROR] for the logging events. which can't be changed.\n\n\
  \ Lustre logging writes the enabled logging events for your file system or cache to Amazon \
   CloudWatch Logs.\n\
  \ "]

type nonrec update_file_system_lustre_metadata_configuration = {
  mode : metadata_configuration_mode option;
      [@ocaml.doc
        "The metadata configuration mode for provisioning Metadata IOPS for an FSx for Lustre file \
         system using a [PERSISTENT_2] deployment type.\n\n\
        \ {ul\n\
        \       {-  To increase the Metadata IOPS or to switch an SSD file system from AUTOMATIC, \
         specify [USER_PROVISIONED] as the value for this parameter. Then use the Iops parameter \
         to provide a Metadata IOPS value that is greater than or equal to the current number of \
         Metadata IOPS provisioned for the file system.\n\
        \           \n\
        \            }\n\
        \       {-  To switch from USER_PROVISIONED mode on an SSD file system, specify \
         [AUTOMATIC] as the value for this parameter, but do not input a value for Iops.\n\
        \           \n\
        \             {ul\n\
        \                   {-  If you request to switch from USER_PROVISIONED to AUTOMATIC mode \
         and the current Metadata IOPS value is greater than the automated default, FSx for Lustre \
         rejects the request because downscaling Metadata IOPS is not supported.\n\
        \                       \n\
        \                        }\n\
        \                   {-  AUTOMATIC mode is not supported on Intelligent-Tiering file \
         systems. For Intelligent-Tiering file systems, use USER_PROVISIONED mode.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \          }\n\
        \       }\n\
        \  "]
  iops : metadata_iops option;
      [@ocaml.doc
        "(USER_PROVISIONED mode only) Specifies the number of Metadata IOPS to provision for your \
         file system.\n\n\
        \ {ul\n\
        \       {-  For SSD file systems, valid values are [1500], [3000], [6000], [12000], and \
         multiples of [12000] up to a maximum of [192000].\n\
        \           \n\
        \            }\n\
        \       {-  For Intelligent-Tiering file systems, valid values are [6000] and [12000].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The value you provide must be greater than or equal to the current number of Metadata \
         IOPS provisioned for the file system.\n\
        \   "]
}
[@@ocaml.doc
  "The Lustre metadata performance configuration update for an Amazon FSx for Lustre file system \
   using a [PERSISTENT_2] deployment type. You can request an increase in your file system's \
   Metadata IOPS and/or switch your file system's metadata configuration mode. For more \
   information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-metadata-performance.html}Managing \
   metadata performance} in the {i Amazon FSx for Lustre User Guide}.\n"]

type nonrec update_file_system_lustre_configuration = {
  data_read_cache_configuration : lustre_read_cache_configuration option;
      [@ocaml.doc
        "Specifies the optional provisioned SSD read cache on Amazon FSx for Lustre file systems \
         that use the Intelligent-Tiering storage class.\n"]
  throughput_capacity : throughput_capacity_mbps option;
      [@ocaml.doc
        "The throughput of an Amazon FSx for Lustre file system using an Intelligent-Tiering \
         storage class, measured in megabytes per second (MBps). You can only increase your file \
         system's throughput. Valid values are 4000 MBps or multiples of 4000 MBps.\n"]
  metadata_configuration : update_file_system_lustre_metadata_configuration option;
      [@ocaml.doc
        "The Lustre metadata performance configuration for an Amazon FSx for Lustre file system \
         using a [PERSISTENT_2] deployment type. When this configuration is enabled, the file \
         system supports increasing metadata performance.\n"]
  per_unit_storage_throughput : per_unit_storage_throughput option;
      [@ocaml.doc
        "The throughput of an Amazon FSx for Lustre Persistent SSD-based file system, measured in \
         megabytes per second per tebibyte (MB/s/TiB). You can increase or decrease your file \
         system's throughput. Valid values depend on the deployment type of the file system, as \
         follows:\n\n\
        \ {ul\n\
        \       {-  For [PERSISTENT_1] SSD-based deployment types, valid values are 50, 100, and \
         200 MB/s/TiB.\n\
        \           \n\
        \            }\n\
        \       {-  For [PERSISTENT_2] SSD-based deployment types, valid values are 125, 250, 500, \
         and 1000 MB/s/TiB.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-throughput-capacity.html} \
         Managing throughput capacity}.\n\
        \   "]
  root_squash_configuration : lustre_root_squash_configuration option;
      [@ocaml.doc
        "The Lustre root squash configuration used when updating an Amazon FSx for Lustre file \
         system. When enabled, root squash restricts root-level access from clients that try to \
         access your file system as a root user.\n"]
  log_configuration : lustre_log_create_configuration option;
      [@ocaml.doc
        "The Lustre logging configuration used when updating an Amazon FSx for Lustre file system. \
         When logging is enabled, Lustre logs error and warning events for data repositories \
         associated with your file system to Amazon CloudWatch Logs.\n"]
  data_compression_type : data_compression_type option;
      [@ocaml.doc
        "Sets the data compression configuration for the file system. [DataCompressionType] can \
         have the following values:\n\n\
        \ {ul\n\
        \       {-   [NONE] - Data compression is turned off for the file system.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Data compression is turned on with the LZ4 algorithm.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you don't use [DataCompressionType], the file system retains its current data \
         compression configuration.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-compression.html}Lustre data \
         compression}.\n\
        \    "]
  auto_import_policy : auto_import_policy_type option;
      [@ocaml.doc
        " (Optional) When you create your file system, your existing S3 objects appear as file and \
         directory listings. Use this property to choose how Amazon FSx keeps your file and \
         directory listing up to date as you add or modify objects in your linked S3 bucket. \
         [AutoImportPolicy] can have the following values:\n\n\
        \ {ul\n\
        \       {-   [NONE] - (Default) AutoImport is off. Amazon FSx only updates file and \
         directory listings from the linked S3 bucket when the file system is created. FSx does \
         not update the file and directory listing for any new or changed objects after choosing \
         this option.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW] - AutoImport is on. Amazon FSx automatically imports directory listings \
         of any new objects added to the linked S3 bucket that do not currently exist in the FSx \
         file system. \n\
        \           \n\
        \            }\n\
        \       {-   [NEW_CHANGED] - AutoImport is on. Amazon FSx automatically imports file and \
         directory listings of any new objects added to the S3 bucket and any existing objects \
         that are changed in the S3 bucket after you choose this option.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_CHANGED_DELETED] - AutoImport is on. Amazon FSx automatically imports \
         file and directory listings of any new objects added to the S3 bucket, any existing \
         objects that are changed in the S3 bucket, and any objects that were deleted in the S3 \
         bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This parameter is not supported for file systems with a data repository association.\n\
        \   "]
  automatic_backup_retention_days : automatic_backup_retention_days option;
      [@ocaml.doc
        "The number of days to retain automatic backups. Setting this property to [0] disables \
         automatic backups. You can retain automatic backups for a maximum of 90 days. The default \
         is [0].\n"]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  weekly_maintenance_start_time : weekly_time option;
      [@ocaml.doc
        "(Optional) The preferred start time to perform weekly maintenance, formatted d:HH:MM in \
         the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and \
         ending with Sunday.\n"]
}
[@@ocaml.doc
  "The configuration object for Amazon FSx for Lustre file systems used in the [UpdateFileSystem] \
   operation.\n"]

type nonrec update_file_system_ontap_configuration = {
  endpoint_ipv6_address_range : ipv6_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /118 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  ha_pairs : ha_pairs option;
      [@ocaml.doc
        "Use to update the number of high-availability (HA) pairs for a second-generation \
         single-AZ file system. If you increase the number of HA pairs for your file system, you \
         must specify proportional increases for [StorageCapacity], [Iops], and \
         [ThroughputCapacity]. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/administering-file-systems.html#HA-pairs}High-availability \
         (HA) pairs} in the FSx for ONTAP user guide. Block storage protocol support (iSCSI and \
         NVMe over TCP) is disabled on file systems with more than 6 HA pairs. For more \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/supported-fsx-clients.html#using-block-storage}Using \
         block storage protocols}.\n"]
  throughput_capacity_per_ha_pair : throughput_capacity_per_ha_pair option;
      [@ocaml.doc
        "Use to choose the throughput capacity per HA pair, rather than the total throughput for \
         the file system. \n\n\
        \ This field and [ThroughputCapacity] cannot be defined in the same API call, but one is \
         required.\n\
        \ \n\
        \  This field and [ThroughputCapacity] are the same for file systems with one HA pair.\n\
        \  \n\
        \   {ul\n\
        \         {-  For [SINGLE_AZ_1] and [MULTI_AZ_1] file systems, valid values are 128, 256, \
         512, 1024, 2048, or 4096 MBps.\n\
        \             \n\
        \              }\n\
        \         {-  For [SINGLE_AZ_2], valid values are 1536, 3072, or 6144 MBps.\n\
        \             \n\
        \              }\n\
        \         {-  For [MULTI_AZ_2], valid values are 384, 768, 1536, 3072, or 6144 MBps.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \   \n\
        \    {ul\n\
        \          {-  The value of [ThroughputCapacity] and [ThroughputCapacityPerHAPair] are not \
         the same value for file systems with one HA pair.\n\
        \              \n\
        \               }\n\
        \          {-  The value of deployment type is [SINGLE_AZ_2] and [ThroughputCapacity] / \
         [ThroughputCapacityPerHAPair] is not a valid HA pair (a value between 1 and 12).\n\
        \              \n\
        \               }\n\
        \          {-  The value of [ThroughputCapacityPerHAPair] is not a valid value.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  remove_route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) A list of IDs of existing virtual private cloud (VPC) route tables to \
         disassociate (remove) from your Amazon FSx for NetApp ONTAP file system. You can use the \
         API operation to retrieve the list of VPC route table IDs for a file system.\n"]
  add_route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) A list of IDs of new virtual private cloud (VPC) route tables to \
         associate (add) with your Amazon FSx for NetApp ONTAP file system.\n"]
  throughput_capacity : megabytes_per_second option;
      [@ocaml.doc
        "Enter a new value to change the amount of throughput capacity for the file system in \
         megabytes per second (MBps). For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-throughput-capacity.html}Managing \
         throughput capacity} in the FSx for ONTAP User Guide.\n\n\
        \ Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \ \n\
        \  {ul\n\
        \        {-  The value of [ThroughputCapacity] and [ThroughputCapacityPerHAPair] are not \
         the same value.\n\
        \            \n\
        \             }\n\
        \        {-  The value of [ThroughputCapacity] when divided by the value of [HAPairs] is \
         outside of the valid range for [ThroughputCapacity].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  disk_iops_configuration : disk_iops_configuration option;
      [@ocaml.doc
        "The SSD IOPS (input output operations per second) configuration for an Amazon FSx for \
         NetApp ONTAP file system. The default is 3 IOPS per GB of storage capacity, but you can \
         provision additional IOPS per GB of storage. The configuration consists of an IOPS mode \
         ([AUTOMATIC] or [USER_PROVISIONED]), and in the case of [USER_PROVISIONED] IOPS, the \
         total number of SSD IOPS provisioned. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/storage-capacity-and-IOPS.html}File \
         system storage capacity and IOPS}.\n"]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  fsx_admin_password : admin_password option;
      [@ocaml.doc
        "Update the password for the [fsxadmin] user by entering a new password. You use the \
         [fsxadmin] user to access the NetApp ONTAP CLI and REST API to manage your file system \
         resources. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-resources-ontap-apps.html}Managing \
         resources using NetApp Application}.\n"]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
}
[@@ocaml.doc "The configuration updates for an Amazon FSx for NetApp ONTAP file system.\n"]

type nonrec update_file_system_open_zfs_configuration = {
  endpoint_ipv6_address_range : ipv6_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /118 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  read_cache_configuration : open_zfs_read_cache_configuration option;
      [@ocaml.doc
        " The configuration for the optional provisioned SSD read cache on file systems that use \
         the Intelligent-Tiering storage class.\n"]
  remove_route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) A list of IDs of existing virtual private cloud (VPC) route tables to \
         disassociate (remove) from your Amazon FSx for OpenZFS file system. You can use the API \
         operation to retrieve the list of VPC route table IDs for a file system.\n"]
  add_route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) A list of IDs of new virtual private cloud (VPC) route tables to \
         associate (add) with your Amazon FSx for OpenZFS file system.\n"]
  disk_iops_configuration : disk_iops_configuration option; [@ocaml.doc ""]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  throughput_capacity : megabytes_per_second option;
      [@ocaml.doc
        "The throughput of an Amazon FSx for OpenZFS file system, measured in megabytes per \
         second\226\128\168 (MB/s). Valid values depend on the DeploymentType you choose, as \
         follows:\n\n\
        \ {ul\n\
        \       {-  For [MULTI_AZ_1] and [SINGLE_AZ_2], valid values are 160, 320, 640, 1280, \
         2560, 3840, 5120, 7680, or 10240 MB/s.\n\
        \           \n\
        \            }\n\
        \       {-  For [SINGLE_AZ_1], valid values are 64, 128, 256, 512, 1024, 2048, 3072, or \
         4096 MB/s.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  copy_tags_to_volumes : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the volume should be copied to snapshots. \
         This value defaults to [false]. If it's set to [true], all tags for the volume are copied \
         to snapshots where the user doesn't specify tags. If this value is [true] and you specify \
         one or more tags, only the specified tags are copied to snapshots. If you specify one or \
         more tags when creating the snapshot, no tags are copied from the volume, regardless of \
         this value.\n"]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the file system should be copied to backups. \
         This value defaults to [false]. If it's set to [true], all tags for the file system are \
         copied to all automatic and user-initiated backups where the user doesn't specify tags. \
         If this value is [true] and you specify one or more tags, only the specified tags are \
         copied to backups. If you specify one or more tags when creating a user-initiated backup, \
         no tags are copied from the file system, regardless of this value.\n"]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
}
[@@ocaml.doc "The configuration updates for an Amazon FSx for OpenZFS file system.\n"]

type nonrec update_file_system_request = {
  network_type : network_type option;
      [@ocaml.doc "Changes the network type of an FSx for OpenZFS file system.\n"]
  file_system_type_version : file_system_type_version option;
      [@ocaml.doc
        "The Lustre version you are updating an FSx for Lustre file system to. Valid values are \
         [2.12] and [2.15]. The value you choose must be newer than the file system's current \
         Lustre version.\n"]
  storage_type : storage_type option; [@ocaml.doc ""]
  open_zfs_configuration : update_file_system_open_zfs_configuration option;
      [@ocaml.doc "The configuration updates for an FSx for OpenZFS file system.\n"]
  ontap_configuration : update_file_system_ontap_configuration option; [@ocaml.doc ""]
  lustre_configuration : update_file_system_lustre_configuration option; [@ocaml.doc ""]
  windows_configuration : update_file_system_windows_configuration option;
      [@ocaml.doc
        "The configuration updates for an Amazon FSx for Windows File Server file system.\n"]
  storage_capacity : storage_capacity option;
      [@ocaml.doc
        "Use this parameter to increase the storage capacity of an FSx for Windows File Server, \
         FSx for Lustre, FSx for OpenZFS, or FSx for ONTAP file system. For second-generation FSx \
         for ONTAP file systems, you can also decrease the storage capacity. Specifies the storage \
         capacity target value, in GiB, for the file system that you're updating. \n\n\
        \  You can't make a storage capacity increase request if there is an existing storage \
         capacity increase request in progress.\n\
        \  \n\
        \    For Lustre file systems, the storage capacity target value can be the following:\n\
        \    \n\
        \     {ul\n\
        \           {-  For [SCRATCH_2], [PERSISTENT_1], and [PERSISTENT_2 SSD] deployment types, \
         valid values are in multiples of 2400 GiB. The value must be greater than the current \
         storage capacity.\n\
        \               \n\
        \                }\n\
        \           {-  For [PERSISTENT HDD] file systems, valid values are multiples of 6000 GiB \
         for 12-MBps throughput per TiB file systems and multiples of 1800 GiB for 40-MBps \
         throughput per TiB file systems. The values must be greater than the current storage \
         capacity.\n\
        \               \n\
        \                }\n\
        \           {-  For [SCRATCH_1] file systems, you can't increase the storage capacity.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-storage-capacity.html}Managing \
         storage and throughput capacity} in the {i FSx for Lustre User Guide}.\n\
        \   \n\
        \    For FSx for OpenZFS file systems, the storage capacity target value must be at least \
         10 percent greater than the current storage capacity value. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-storage-capacity.html}Managing \
         storage capacity} in the {i FSx for OpenZFS User Guide}.\n\
        \    \n\
        \     For Windows file systems, the storage capacity target value must be at least 10 \
         percent greater than the current storage capacity value. To increase storage capacity, \
         the file system must have at least 16 MBps of throughput capacity. For more information, \
         see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html}Managing \
         storage capacity} in the {i Amazon FSxfor Windows File Server User Guide}.\n\
        \     \n\
        \      For ONTAP file systems, when increasing storage capacity, the storage capacity \
         target value must be at least 10 percent greater than the current storage capacity value. \
         When decreasing storage capacity on second-generation file systems, the target value must \
         be at least 9 percent smaller than the current SSD storage capacity. For more \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/storage-capacity-and-IOPS.html}File \
         system storage capacity and IOPS} in the Amazon FSx for NetApp ONTAP User Guide.\n\
        \      "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent updates. \
         This string is automatically filled on your behalf when you use the Command Line \
         Interface (CLI) or an Amazon Web Services SDK.\n"]
  file_system_id : file_system_id; [@ocaml.doc "The ID of the file system that you are updating.\n"]
}
[@@ocaml.doc "The request object for the [UpdateFileSystem] operation.\n"]

type nonrec service_limit =
  | FILE_CACHE_COUNT [@ocaml.doc ""]
  | TOTAL_SSD_IOPS [@ocaml.doc ""]
  | VOLUMES_PER_FILE_SYSTEM [@ocaml.doc ""]
  | STORAGE_VIRTUAL_MACHINES_PER_FILE_SYSTEM [@ocaml.doc ""]
  | TOTAL_IN_PROGRESS_COPY_BACKUPS [@ocaml.doc ""]
  | TOTAL_USER_TAGS [@ocaml.doc ""]
  | TOTAL_USER_INITIATED_BACKUPS [@ocaml.doc ""]
  | TOTAL_STORAGE [@ocaml.doc ""]
  | TOTAL_THROUGHPUT_CAPACITY [@ocaml.doc ""]
  | FILE_SYSTEM_COUNT [@ocaml.doc ""]
[@@ocaml.doc
  "The types of limits on your service utilization. Limits include file system count, total \
   throughput capacity, total storage, and total user-initiated backups. These limits apply for a \
   specific account in a specific Amazon Web Services Region. You can increase some of them by \
   contacting Amazon Web Services Support.\n"]

type nonrec service_limit_exceeded = {
  message : error_message option; [@ocaml.doc ""]
  limit : service_limit; [@ocaml.doc "Enumeration of the service limit that was exceeded. \n"]
}
[@@ocaml.doc
  "An error indicating that a particular service limit was exceeded. You can increase some service \
   limits by contacting Amazon Web Services Support.\n"]

type nonrec missing_file_system_configuration = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A file system configuration is required for this operation.\n"]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec invalid_network_settings = {
  invalid_route_table_id : route_table_id option;
      [@ocaml.doc "The route table ID is either invalid or not part of the VPC specified.\n"]
  invalid_security_group_id : security_group_id option;
      [@ocaml.doc "The security group ID is either invalid or not part of the VPC specified.\n"]
  invalid_subnet_id : subnet_id option;
      [@ocaml.doc "The subnet ID that is either invalid or not part of the VPC specified.\n"]
  message : error_message option;
      [@ocaml.doc "Error message explaining what's wrong with network settings.\n"]
}
[@@ocaml.doc "One or more network settings specified in the request are invalid.\n"]

type nonrec file_system_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No Amazon FSx file systems were found based upon supplied parameters.\n"]

type nonrec file_cache_id = string [@@ocaml.doc ""]

type nonrec file_cache_type = LUSTRE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec file_cache_lifecycle =
  | FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec file_cache_failure_details = {
  message : error_message option; [@ocaml.doc "A message describing any failures that occurred.\n"]
}
[@@ocaml.doc "A structure providing details of any failures that occurred.\n"]

type nonrec file_cache_lustre_deployment_type = CACHE_1 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec metadata_storage_capacity = int [@@ocaml.doc ""]

type nonrec file_cache_lustre_metadata_configuration = {
  storage_capacity : metadata_storage_capacity;
      [@ocaml.doc
        "The storage capacity of the Lustre MDT (Metadata Target) storage volume in gibibytes \
         (GiB). The only supported value is [2400] GiB.\n"]
}
[@@ocaml.doc
  "The configuration for a Lustre MDT (Metadata Target) storage volume. The metadata on Amazon \
   File Cache is managed by a Lustre Metadata Server (MDS) while the actual metadata is persisted \
   on an MDT.\n"]

type nonrec file_cache_lustre_configuration = {
  log_configuration : lustre_log_configuration option;
      [@ocaml.doc
        "The configuration for Lustre logging used to write the enabled logging events for your \
         Amazon File Cache resource to Amazon CloudWatch Logs.\n"]
  metadata_configuration : file_cache_lustre_metadata_configuration option;
      [@ocaml.doc "The configuration for a Lustre MDT (Metadata Target) storage volume.\n"]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  mount_name : lustre_file_system_mount_name option;
      [@ocaml.doc
        "You use the [MountName] value when mounting the cache. If you pass a cache ID to the \
         [DescribeFileCaches] operation, it returns the the [MountName] value as part of the \
         cache's description.\n"]
  deployment_type : file_cache_lustre_deployment_type option;
      [@ocaml.doc
        "The deployment type of the Amazon File Cache resource, which must be [CACHE_1].\n"]
  per_unit_storage_throughput : per_unit_storage_throughput option;
      [@ocaml.doc
        "Per unit storage throughput represents the megabytes per second of read or write \
         throughput per 1 tebibyte of storage provisioned. Cache throughput capacity is equal to \
         Storage capacity (TiB) * PerUnitStorageThroughput (MB/s/TiB). The only supported value is \
         [1000].\n"]
}
[@@ocaml.doc "The configuration for the Amazon File Cache resource.\n"]

type nonrec data_repository_association_id = string [@@ocaml.doc ""]

type nonrec data_repository_association_ids = data_repository_association_id list [@@ocaml.doc ""]

type nonrec file_cache = {
  data_repository_association_ids : data_repository_association_ids option;
      [@ocaml.doc
        "A list of IDs of data repository associations that are associated with this cache.\n"]
  lustre_configuration : file_cache_lustre_configuration option;
      [@ocaml.doc "The configuration for the Amazon File Cache resource.\n"]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "Specifies the ID of the Key Management Service (KMS) key to use for encrypting data on an \
         Amazon File Cache. If a [KmsKeyId] isn't specified, the Amazon FSx-managed KMS key for \
         your account is used. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html}Encrypt} in the \
         {i Key Management Service API Reference}.\n"]
  dns_name : dns_name option; [@ocaml.doc "The Domain Name System (DNS) name for the cache.\n"]
  network_interface_ids : network_interface_ids option; [@ocaml.doc ""]
  subnet_ids : subnet_ids option; [@ocaml.doc ""]
  vpc_id : vpc_id option; [@ocaml.doc ""]
  storage_capacity : storage_capacity option;
      [@ocaml.doc "The storage capacity of the cache in gibibytes (GiB).\n"]
  failure_details : file_cache_failure_details option;
      [@ocaml.doc "A structure providing details of any failures that occurred.\n"]
  lifecycle : file_cache_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the cache. The following are the possible values and what they \
         mean:\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The cache is in a healthy state, and is reachable and available \
         for use.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - The new cache is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - An existing cache is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] - The cache is undergoing a customer-initiated update.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - An existing cache has experienced an unrecoverable failure. When \
         creating a new cache, the cache was unable to be created.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_cache_type_version : file_system_type_version option;
      [@ocaml.doc "The Lustre version of the cache, which must be [2.12].\n"]
  file_cache_type : file_cache_type option;
      [@ocaml.doc "The type of cache, which must be [LUSTRE].\n"]
  file_cache_id : file_cache_id option;
      [@ocaml.doc "The system-generated, unique ID of the cache.\n"]
  creation_time : creation_time option; [@ocaml.doc ""]
  owner_id : aws_account_id option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A description of a specific Amazon File Cache resource, which is a response object from the \
   [DescribeFileCaches] operation.\n"]

type nonrec update_file_cache_response = {
  file_cache : file_cache option; [@ocaml.doc "A description of the cache that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_file_cache_lustre_configuration = {
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
}
[@@ocaml.doc "The configuration update for an Amazon File Cache resource.\n"]

type nonrec update_file_cache_request = {
  lustre_configuration : update_file_cache_lustre_configuration option;
      [@ocaml.doc "The configuration updates for an Amazon File Cache resource.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  file_cache_id : file_cache_id; [@ocaml.doc "The ID of the cache that you are updating.\n"]
}
[@@ocaml.doc ""]

type nonrec missing_file_cache_configuration = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A cache configuration is required for this operation.\n"]

type nonrec file_cache_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No caches were found based upon supplied parameters.\n"]

type nonrec namespace = string [@@ocaml.doc ""]

type nonrec batch_import_meta_data_on_create = bool [@@ocaml.doc ""]

type nonrec event_type = DELETED [@ocaml.doc ""] | CHANGED [@ocaml.doc ""] | NEW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_types = event_type list [@@ocaml.doc ""]

type nonrec auto_import_policy = {
  events : event_types option;
      [@ocaml.doc
        "The [AutoImportPolicy] can have the following event values:\n\n\
        \ {ul\n\
        \       {-   [NEW] - Amazon FSx automatically imports metadata of files added to the \
         linked S3 bucket that do not currently exist in the FSx file system.\n\
        \           \n\
        \            }\n\
        \       {-   [CHANGED] - Amazon FSx automatically updates file metadata and invalidates \
         existing file content on the file system as files change in the data repository.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - Amazon FSx automatically deletes files on the file system as \
         corresponding files are deleted in the data repository.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can define any combination of event types for your [AutoImportPolicy].\n\
        \   "]
}
[@@ocaml.doc
  "Describes the data repository association's automatic import policy. The AutoImportPolicy \
   defines how Amazon FSx keeps your file metadata and directory listings up to date by importing \
   changes to your Amazon FSx for Lustre file system as you modify objects in a linked S3 bucket.\n\n\
  \ The [AutoImportPolicy] is only supported on Amazon FSx for Lustre file systems with a data \
   repository association.\n\
  \ "]

type nonrec auto_export_policy = {
  events : event_types option;
      [@ocaml.doc
        "The [AutoExportPolicy] can have the following event values:\n\n\
        \ {ul\n\
        \       {-   [NEW] - New files and directories are automatically exported to the data \
         repository as they are added to the file system.\n\
        \           \n\
        \            }\n\
        \       {-   [CHANGED] - Changes to files and directories on the file system are \
         automatically exported to the data repository.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - Files and directories are automatically deleted on the data \
         repository when they are deleted on the file system.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can define any combination of event types for your [AutoExportPolicy].\n\
        \   "]
}
[@@ocaml.doc
  "Describes a data repository association's automatic export policy. The [AutoExportPolicy] \
   defines the types of updated objects on the file system that will be automatically exported to \
   the data repository. As you create, modify, or delete files, Amazon FSx for Lustre \
   automatically exports the defined changes asynchronously once your application finishes \
   modifying the file.\n\n\
  \ The [AutoExportPolicy] is only supported on Amazon FSx for Lustre file systems with a data \
   repository association.\n\
  \ "]

type nonrec s3_data_repository_configuration = {
  auto_export_policy : auto_export_policy option;
      [@ocaml.doc
        "Specifies the type of updated objects (new, changed, deleted) that will be automatically \
         exported from your file system to the linked S3 bucket.\n"]
  auto_import_policy : auto_import_policy option;
      [@ocaml.doc
        "Specifies the type of updated objects (new, changed, deleted) that will be automatically \
         imported from the linked S3 bucket to your file system.\n"]
}
[@@ocaml.doc
  "The configuration for an Amazon S3 data repository linked to an Amazon FSx for Lustre file \
   system with a data repository association. The configuration consists of an [AutoImportPolicy] \
   that defines which file events on the data repository are automatically imported to the file \
   system and an [AutoExportPolicy] that defines which file events on the file system are \
   automatically exported to the data repository. File events are when files or directories are \
   added, changed, or deleted on the file system or the data repository.\n\n\
  \  Data repository associations on Amazon File Cache don't use [S3DataRepositoryConfiguration] \
   because they don't support automatic import or automatic export.\n\
  \  \n\
  \   "]

type nonrec sub_directories_paths = namespace list [@@ocaml.doc ""]

type nonrec nfs_version = NFS3 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec repository_dns_ips = ip_address list [@@ocaml.doc ""]

type nonrec nfs_data_repository_configuration = {
  auto_export_policy : auto_export_policy option;
      [@ocaml.doc "This parameter is not supported for Amazon File Cache.\n"]
  dns_ips : repository_dns_ips option;
      [@ocaml.doc
        "A list of up to 2 IP addresses of DNS servers used to resolve the NFS file system domain \
         name. The provided IP addresses can either be the IP addresses of a DNS forwarder or \
         resolver that the customer manages and runs inside the customer VPC, or the IP addresses \
         of the on-premises DNS servers.\n"]
  version : nfs_version;
      [@ocaml.doc
        "The version of the NFS (Network File System) protocol of the NFS data repository. \
         Currently, the only supported value is [NFS3], which indicates that the data repository \
         must support the NFSv3 protocol.\n"]
}
[@@ocaml.doc
  "The configuration for a data repository association that links an Amazon File Cache resource to \
   an NFS data repository.\n"]

type nonrec data_repository_association = {
  nf_s : nfs_data_repository_configuration option;
      [@ocaml.doc
        "The configuration for an NFS data repository linked to an Amazon File Cache resource with \
         a data repository association.\n"]
  data_repository_subdirectories : sub_directories_paths option;
      [@ocaml.doc
        "For Amazon File Cache, a list of NFS Exports that will be linked with an NFS data \
         repository association. All the subdirectories must be on a single NFS file system. The \
         Export paths are in the format [/exportpath1]. To use this parameter, you must configure \
         [DataRepositoryPath] as the domain name of the NFS file system. The NFS file system \
         domain name in effect is the root of the subdirectories. Note that \
         [DataRepositorySubdirectories] is not supported for S3 data repositories.\n"]
  file_cache_path : namespace option;
      [@ocaml.doc
        "A path on the Amazon File Cache that points to a high-level directory (such as [/ns1/]) \
         or subdirectory (such as [/ns1/subdir/]) that will be mapped 1-1 with \
         [DataRepositoryPath]. The leading forward slash in the path is required. Two data \
         repository associations cannot have overlapping cache paths. For example, if a data \
         repository is associated with cache path [/ns1/], then you cannot link another data \
         repository with cache path [/ns1/ns2].\n\n\
        \ This path specifies the directory in your cache where files will be exported from. This \
         cache directory can be linked to only one data repository (S3 or NFS) and no other data \
         repository can be linked to the directory.\n\
        \ \n\
        \   The cache path can only be set to root (/) on an NFS DRA when \
         [DataRepositorySubdirectories] is specified. If you specify root (/) as the cache path, \
         you can create only one DRA on the cache.\n\
        \   \n\
        \    The cache path cannot be set to root (/) for an S3 DRA.\n\
        \    \n\
        \     "]
  file_cache_id : file_cache_id option;
      [@ocaml.doc "The globally unique ID of the Amazon File Cache resource.\n"]
  creation_time : creation_time option; [@ocaml.doc ""]
  tags : tags option; [@ocaml.doc ""]
  s3 : s3_data_repository_configuration option;
      [@ocaml.doc
        "The configuration for an Amazon S3 data repository linked to an Amazon FSx for Lustre \
         file system with a data repository association.\n"]
  imported_file_chunk_size : megabytes option;
      [@ocaml.doc
        "For files imported from a data repository, this value determines the stripe count and \
         maximum amount of data per file (in MiB) stored on a single physical disk. The maximum \
         number of disks that a single file can be striped across is limited by the total number \
         of disks that make up the file system or cache.\n\n\
        \ The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). \
         Amazon S3 objects have a maximum size of 5 TB.\n\
        \ "]
  batch_import_meta_data_on_create : batch_import_meta_data_on_create option;
      [@ocaml.doc
        "A boolean flag indicating whether an import data repository task to import metadata \
         should run after the data repository association is created. The task runs if this flag \
         is set to [true].\n\n\
        \   [BatchImportMetaDataOnCreate] is not supported for data repositories linked to an \
         Amazon File Cache resource.\n\
        \  \n\
        \   "]
  data_repository_path : archive_path option;
      [@ocaml.doc
        "The path to the data repository that will be linked to the cache or file system.\n\n\
        \ {ul\n\
        \       {-  For Amazon File Cache, the path can be an NFS data repository that will be \
         linked to the cache. The path can be in one of two formats:\n\
        \           \n\
        \            {ul\n\
        \                  {-  If you are not using the [DataRepositorySubdirectories] parameter, \
         the path is to an NFS Export directory (or one of its subdirectories) in the format \
         [nsf://nfs-domain-name/exportpath]. You can therefore link a single NFS Export to a \
         single data repository association.\n\
        \                      \n\
        \                       }\n\
        \                  {-  If you are using the [DataRepositorySubdirectories] parameter, the \
         path is the domain name of the NFS file system in the format [nfs://filer-domain-name], \
         which indicates the root of the subdirectories specified with the \
         [DataRepositorySubdirectories] parameter.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  For Amazon File Cache, the path can be an S3 bucket or prefix in the format \
         [s3://bucket-name/prefix/] (where [prefix] is optional).\n\
        \           \n\
        \            }\n\
        \       {-  For Amazon FSx for Lustre, the path can be an S3 bucket or prefix in the \
         format [s3://bucket-name/prefix/] (where [prefix] is optional).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_system_path : namespace option;
      [@ocaml.doc
        "A path on the Amazon FSx for Lustre file system that points to a high-level directory \
         (such as [/ns1/]) or subdirectory (such as [/ns1/subdir/]) that will be mapped 1-1 with \
         [DataRepositoryPath]. The leading forward slash in the name is required. Two data \
         repository associations cannot have overlapping file system paths. For example, if a data \
         repository is associated with file system path [/ns1/], then you cannot link another data \
         repository with file system path [/ns1/ns2].\n\n\
        \ This path specifies where in your file system files will be exported from or imported \
         to. This file system directory can be linked to only one Amazon S3 bucket, and no other \
         S3 bucket can be linked to the directory.\n\
        \ \n\
        \   If you specify only a forward slash ([/]) as the file system path, you can link only \
         one data repository to the file system. You can only specify \"/\" as the file system \
         path for the first data repository associated with a file system.\n\
        \   \n\
        \    "]
  failure_details : data_repository_failure_details option; [@ocaml.doc ""]
  lifecycle : data_repository_lifecycle option;
      [@ocaml.doc
        "Describes the state of a data repository association. The lifecycle can have the \
         following values:\n\n\
        \ {ul\n\
        \       {-   [CREATING] - The data repository association between the file system or cache \
         and the data repository is being created. The data repository is unavailable.\n\
        \           \n\
        \            }\n\
        \       {-   [AVAILABLE] - The data repository association is available for use.\n\
        \           \n\
        \            }\n\
        \       {-   [MISCONFIGURED] - The data repository association is misconfigured. Until the \
         configuration is corrected, automatic import and automatic export will not work (only for \
         Amazon FSx for Lustre).\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] - The data repository association is undergoing a customer \
         initiated update that might affect its availability.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - The data repository association is undergoing a customer \
         initiated deletion.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The data repository association is in a terminal state that cannot \
         be recovered.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_system_id : file_system_id option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  association_id : data_repository_association_id option;
      [@ocaml.doc "The system-generated, unique ID of the data repository association.\n"]
}
[@@ocaml.doc
  "The configuration of a data repository association that links an Amazon FSx for Lustre file \
   system to an Amazon S3 bucket or an Amazon File Cache resource to an Amazon S3 bucket or an NFS \
   file system. The data repository association configuration object is returned in the response \
   of the following operations:\n\n\
  \ {ul\n\
  \       {-   [CreateDataRepositoryAssociation] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateDataRepositoryAssociation] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeDataRepositoryAssociations] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Data repository associations are supported on Amazon File Cache resources and all FSx for \
   Lustre 2.12 and 2.15 file systems, excluding Intelligent-Tiering and [scratch_1] file systems.\n\
  \   "]

type nonrec update_data_repository_association_response = {
  association : data_repository_association option;
      [@ocaml.doc
        "The response object returned after the data repository association is updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_data_repository_association_request = {
  s3 : s3_data_repository_configuration option;
      [@ocaml.doc
        "The configuration for an Amazon S3 data repository linked to an Amazon FSx Lustre file \
         system with a data repository association. The configuration defines which file events \
         (new, changed, or deleted files or directories) are automatically imported from the \
         linked data repository to the file system or automatically exported from the file system \
         to the data repository.\n"]
  imported_file_chunk_size : megabytes option;
      [@ocaml.doc
        "For files imported from a data repository, this value determines the stripe count and \
         maximum amount of data per file (in MiB) stored on a single physical disk. The maximum \
         number of disks that a single file can be striped across is limited by the total number \
         of disks that make up the file system.\n\n\
        \ The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). \
         Amazon S3 objects have a maximum size of 5 TB.\n\
        \ "]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  association_id : data_repository_association_id;
      [@ocaml.doc "The ID of the data repository association that you are updating.\n"]
}
[@@ocaml.doc ""]

type nonrec data_repository_association_not_found = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "No data repository associations were found based upon the supplied parameters.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys;
      [@ocaml.doc
        "A list of keys of tags on the resource to untag. In case the tag key doesn't exist, the \
         call will still succeed to be idempotent.\n"]
  resource_ar_n : resource_ar_n; [@ocaml.doc "The ARN of the Amazon FSx resource to untag.\n"]
}
[@@ocaml.doc "The request object for [UntagResource] action.\n"]

type nonrec resource_not_found = {
  message : error_message option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n;
      [@ocaml.doc "The resource ARN of the resource that can't be found.\n"]
}
[@@ocaml.doc "The resource specified by the Amazon Resource Name (ARN) can't be found.\n"]

type nonrec resource_does_not_support_tagging = {
  message : error_message option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource that doesn't support tagging.\n"]
}
[@@ocaml.doc "The resource specified does not support tagging. \n"]

type nonrec not_service_resource_error = {
  message : error_message option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the non-Amazon FSx resource.\n"]
}
[@@ocaml.doc
  "The resource specified for the tagging operation is not a resource type owned by Amazon FSx. \
   Use the API of the relevant service to perform the operation. \n"]

type nonrec unit_ = DAYS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec total_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec too_many_access_points = {
  message : error_message option; [@ocaml.doc ""]
  error_code : error_code option;
      [@ocaml.doc
        "An error code indicating that you have reached the maximum number of S3 access points \
         attachments allowed for your account in this Amazon Web Services Region, or for the file \
         system.\n"]
}
[@@ocaml.doc
  "You have reached the maximum number of S3 access points attachments allowed for your account in \
   this Amazon Web Services Region, or for the file system. For more information, or to request an \
   increase, see {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/limits.html}Service quotas \
   on FSx resources} in the FSx for OpenZFS User Guide.\n"]

type nonrec task_id = string [@@ocaml.doc ""]

type nonrec task_ids = task_id list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags;
      [@ocaml.doc
        "A list of tags for the resource. If a tag with a given key already exists, the value is \
         replaced by the one specified in this parameter.\n"]
  resource_ar_n : resource_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon FSx resource that you want to tag.\n"]
}
[@@ocaml.doc "The request object for the [TagResource] operation.\n"]

type nonrec succeeded_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec storage_virtual_machines = storage_virtual_machine list [@@ocaml.doc ""]

type nonrec storage_virtual_machine_ids = storage_virtual_machine_id list [@@ocaml.doc ""]

type nonrec storage_virtual_machine_filter_name = FILE_SYSTEM_ID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec storage_virtual_machine_filter_value = string [@@ocaml.doc ""]

type nonrec storage_virtual_machine_filter_values = storage_virtual_machine_filter_value list
[@@ocaml.doc ""]

type nonrec storage_virtual_machine_filter = {
  values : storage_virtual_machine_filter_values option;
      [@ocaml.doc
        "The values of the filter. These are all the values for any of the applied filters.\n"]
  name : storage_virtual_machine_filter_name option; [@ocaml.doc "The name for this filter.\n"]
}
[@@ocaml.doc
  "A filter used to restrict the results of describe calls for Amazon FSx for NetApp ONTAP storage \
   virtual machines (SVMs). You can use multiple filters to return results that meet all applied \
   filter requirements.\n"]

type nonrec storage_virtual_machine_filters = storage_virtual_machine_filter list [@@ocaml.doc ""]

type nonrec start_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec start_misconfigured_state_recovery_response = {
  file_system : file_system option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_misconfigured_state_recovery_request = {
  file_system_id : file_system_id; [@ocaml.doc ""]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec backup_id = string [@@ocaml.doc ""]

type nonrec source_backup_unavailable = {
  backup_id : backup_id option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the lifecycle status of the source backup isn't [AVAILABLE].\n"]

type nonrec source_backup_id = string [@@ocaml.doc ""]

type nonrec snapshots = snapshot list [@@ocaml.doc ""]

type nonrec snapshot_ids = snapshot_id list [@@ocaml.doc ""]

type nonrec snapshot_filter_name = VOLUME_ID [@ocaml.doc ""] | FILE_SYSTEM_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot_filter_value = string [@@ocaml.doc ""]

type nonrec snapshot_filter_values = snapshot_filter_value list [@@ocaml.doc ""]

type nonrec snapshot_filter = {
  values : snapshot_filter_values option;
      [@ocaml.doc "The [file-system-id] or [volume-id] that you are filtering for.\n"]
  name : snapshot_filter_name option;
      [@ocaml.doc
        "The name of the filter to use. You can filter by the [file-system-id] or by [volume-id].\n"]
}
[@@ocaml.doc
  "A filter used to restrict the results of [DescribeSnapshots] calls. You can use multiple \
   filters to return results that meet all applied filter requirements.\n"]

type nonrec snapshot_filters = snapshot_filter list [@@ocaml.doc ""]

type nonrec size_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec self_managed_active_directory_configuration = {
  domain_join_service_account_secret : customer_secrets_manager_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         containing the self-managed Active Directory domain join service account credentials. \
         When provided, Amazon FSx uses the credentials stored in this secret to join the file \
         system to your self-managed Active Directory domain.\n\n\
        \ The secret must contain two key-value pairs:\n\
        \ \n\
        \  {ul\n\
        \        {-   [CUSTOMER_MANAGED_ACTIVE_DIRECTORY_USERNAME] - The username for the service \
         account\n\
        \            \n\
        \             }\n\
        \        {-   [CUSTOMER_MANAGED_ACTIVE_DIRECTORY_PASSWORD] - The password for the service \
         account\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/self-manage-prereqs.html} Using \
         Amazon FSx for Windows with your self-managed Microsoft Active Directory} or \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/self-manage-prereqs.html} Using \
         Amazon FSx for ONTAP with your self-managed Microsoft Active Directory}.\n\
        \   "]
  dns_ips : dns_ips;
      [@ocaml.doc
        "A list of up to three IP addresses of DNS servers or domain controllers in the \
         self-managed AD directory. \n"]
  password : directory_password option;
      [@ocaml.doc
        "The password for the service account on your self-managed AD domain that Amazon FSx will \
         use to join to your AD domain.\n"]
  user_name : directory_user_name option;
      [@ocaml.doc
        "The user name for the service account on your self-managed AD domain that Amazon FSx will \
         use to join to your AD domain. This account must have the permission to join computers to \
         the domain in the organizational unit provided in [OrganizationalUnitDistinguishedName], \
         or in the default location of your AD domain.\n"]
  file_system_administrators_group : file_system_administrators_group_name option;
      [@ocaml.doc
        "(Optional) The name of the domain group whose members are granted administrative \
         privileges for the file system. Administrative privileges include taking ownership of \
         files and folders, setting audit controls (audit ACLs) on files and folders, and \
         administering the file system remotely by using the FSx Remote PowerShell. The group that \
         you specify must already exist in your domain. If you don't provide one, your AD domain's \
         Domain Admins group is used.\n"]
  organizational_unit_distinguished_name : organizational_unit_distinguished_name option;
      [@ocaml.doc
        "(Optional) The fully qualified distinguished name of the organizational unit within your \
         self-managed AD directory. Amazon FSx only accepts OU as the direct parent of the file \
         system. An example is [OU=FSx,DC=yourdomain,DC=corp,DC=com]. To learn more, see \
         {{:https://tools.ietf.org/html/rfc2253}RFC 2253}. If none is provided, the FSx file \
         system is created in the default location of your self-managed AD directory. \n\n\
        \  Only Organizational Unit (OU) objects can be the direct parent of the file system that \
         you're creating.\n\
        \  \n\
        \   "]
  domain_name : active_directory_fully_qualified_name;
      [@ocaml.doc
        "The fully qualified domain name of the self-managed AD directory, such as \
         [corp.example.com].\n"]
}
[@@ocaml.doc
  "The configuration that Amazon FSx uses to join a FSx for Windows File Server file system or an \
   FSx for ONTAP storage virtual machine (SVM) to a self-managed (including on-premises) Microsoft \
   Active Directory (AD) directory. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/self-managed-AD.html} Using Amazon FSx \
   for Windows with your self-managed Microsoft Active Directory} or \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-svms.html}Managing FSx for ONTAP \
   SVMs}.\n"]

type nonrec security_group_ids = security_group_id list [@@ocaml.doc ""]

type nonrec s3_access_point_vpc_configuration = {
  vpc_id : vpc_id option;
      [@ocaml.doc
        "Specifies the virtual private cloud (VPC) for the S3 access point VPC configuration, if \
         one exists.\n"]
}
[@@ocaml.doc
  "If included, Amazon S3 restricts access to this access point to requests from the specified \
   virtual private cloud (VPC).\n"]

type nonrec open_zfs_file_system_user_type = POSIX [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec file_system_ui_d = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec file_system_gi_d = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec file_system_secondary_gi_ds = file_system_gi_d list [@@ocaml.doc ""]

type nonrec open_zfs_posix_file_system_user = {
  secondary_gids : file_system_secondary_gi_ds option;
      [@ocaml.doc "The list of secondary GIDs for the file system user. \n"]
  gid : file_system_gi_d; [@ocaml.doc "The GID of the file system user.\n"]
  uid : file_system_ui_d; [@ocaml.doc "The UID of the file system user.\n"]
}
[@@ocaml.doc
  "The FSx for OpenZFS file system user that is used for authorizing all file access requests that \
   are made using the S3 access point.\n"]

type nonrec open_zfs_file_system_identity = {
  posix_user : open_zfs_posix_file_system_user option;
      [@ocaml.doc "Specifies the UID and GIDs of the file system POSIX user.\n"]
  type_ : open_zfs_file_system_user_type;
      [@ocaml.doc "Specifies the FSx for OpenZFS user identity type, accepts only [POSIX].\n"]
}
[@@ocaml.doc
  "Specifies the file system user identity that will be used for authorizing all file access \
   requests that are made using the S3 access point.\n"]

type nonrec s3_access_point_open_zfs_configuration = {
  file_system_identity : open_zfs_file_system_identity option;
      [@ocaml.doc
        "The file system identity used to authorize file access requests made using the S3 access \
         point.\n"]
  volume_id : volume_id option;
      [@ocaml.doc "The ID of the FSx for OpenZFS volume that the S3 access point is attached to.\n"]
}
[@@ocaml.doc
  "Describes the FSx for OpenZFS attachment configuration of an S3 access point attachment.\n"]

type nonrec ontap_file_system_user_type = WINDOWS [@ocaml.doc ""] | UNIX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ontap_file_system_user_name = string [@@ocaml.doc ""]

type nonrec ontap_unix_file_system_user = {
  name : ontap_file_system_user_name;
      [@ocaml.doc "The name of the UNIX user. The name can be up to 256 characters long.\n"]
}
[@@ocaml.doc
  "The FSx for ONTAP UNIX file system user that is used for authorizing all file access requests \
   that are made using the S3 access point.\n"]

type nonrec ontap_windows_file_system_user = {
  name : ontap_file_system_user_name;
      [@ocaml.doc
        "The name of the Windows user. The name can be up to 256 characters long and supports \
         Active Directory users.\n"]
}
[@@ocaml.doc
  "The FSx for ONTAP Windows file system user that is used for authorizing all file access \
   requests that are made using the S3 access point.\n"]

type nonrec ontap_file_system_identity = {
  windows_user : ontap_windows_file_system_user option;
      [@ocaml.doc "Specifies the Windows user identity for file system operations.\n"]
  unix_user : ontap_unix_file_system_user option;
      [@ocaml.doc "Specifies the UNIX user identity for file system operations.\n"]
  type_ : ontap_file_system_user_type;
      [@ocaml.doc
        "Specifies the FSx for ONTAP user identity type. Valid values are [UNIX] and [WINDOWS].\n"]
}
[@@ocaml.doc
  "Specifies the file system user identity that will be used for authorizing all file access \
   requests that are made using the S3 access point. The identity can be either a UNIX user or a \
   Windows user.\n"]

type nonrec s3_access_point_ontap_configuration = {
  file_system_identity : ontap_file_system_identity option;
      [@ocaml.doc
        "The file system identity used to authorize file access requests made using the S3 access \
         point.\n"]
  volume_id : volume_id option;
      [@ocaml.doc "The ID of the FSx for ONTAP volume that the S3 access point is attached to.\n"]
}
[@@ocaml.doc
  "Describes the FSx for ONTAP attachment configuration of an S3 access point attachment.\n"]

type nonrec s3_access_point_attachments_filter_name =
  | TYPE [@ocaml.doc ""]
  | VOLUME_ID [@ocaml.doc ""]
  | FILE_SYSTEM_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_access_point_attachments_filter_value = string [@@ocaml.doc ""]

type nonrec s3_access_point_attachments_filter_values =
  s3_access_point_attachments_filter_value list
[@@ocaml.doc ""]

type nonrec s3_access_point_attachments_filter = {
  values : s3_access_point_attachments_filter_values option;
      [@ocaml.doc "The values of the filter.\n"]
  name : s3_access_point_attachments_filter_name option; [@ocaml.doc "The name of the filter.\n"]
}
[@@ocaml.doc
  "A set of Name and Values pairs used to view a select set of S3 access point attachments.\n"]

type nonrec s3_access_point_attachments_filters = s3_access_point_attachments_filter list
[@@ocaml.doc ""]

type nonrec s3_access_point_attachment_lifecycle =
  | MISCONFIGURED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_access_point_attachment_name = string [@@ocaml.doc ""]

type nonrec s3_access_point_attachment_type = ONTAP [@ocaml.doc ""] | OPENZFS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_access_point_alias = string [@@ocaml.doc ""]

type nonrec s3_access_point = {
  vpc_configuration : s3_access_point_vpc_configuration option;
      [@ocaml.doc "The S3 access point's virtual private cloud (VPC) configuration.\n"]
  alias : s3_access_point_alias option; [@ocaml.doc "The S3 access point's alias.\n"]
  resource_ar_n : general_ar_n option; [@ocaml.doc "he S3 access point's ARN.\n"]
}
[@@ocaml.doc "Describes the S3 access point configuration of the S3 access point attachment.\n"]

type nonrec s3_access_point_attachment = {
  s3_access_point : s3_access_point option;
      [@ocaml.doc "The S3 access point configuration of the S3 access point attachment.\n"]
  ontap_configuration : s3_access_point_ontap_configuration option;
      [@ocaml.doc "The ONTAP configuration of the S3 access point attachment.\n"]
  open_zfs_configuration : s3_access_point_open_zfs_configuration option;
      [@ocaml.doc "The OpenZFSConfiguration of the S3 access point attachment.\n"]
  type_ : s3_access_point_attachment_type option;
      [@ocaml.doc "The type of Amazon FSx volume that the S3 access point is attached to. \n"]
  name : s3_access_point_attachment_name option;
      [@ocaml.doc
        "The name of the S3 access point attachment; also used for the name of the S3 access point.\n"]
  creation_time : creation_time option; [@ocaml.doc ""]
  lifecycle_transition_reason : lifecycle_transition_reason option; [@ocaml.doc ""]
  lifecycle : s3_access_point_attachment_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the S3 access point attachment. The lifecycle can have the \
         following values:\n\n\
        \ {ul\n\
        \       {-  AVAILABLE - the S3 access point attachment is available for use\n\
        \           \n\
        \            }\n\
        \       {-  CREATING - Amazon FSx is creating the S3 access point and attachment\n\
        \           \n\
        \            }\n\
        \       {-  DELETING - Amazon FSx is deleting the S3 access point and attachment\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The S3 access point attachment is in a failed state. Delete and \
         detach the S3 access point attachment, and create a new one.\n\
        \           \n\
        \            }\n\
        \       {-  UPDATING - Amazon FSx is updating the S3 access point attachment\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "An S3 access point attached to an Amazon FSx volume.\n"]

type nonrec s3_access_point_attachments = s3_access_point_attachment list [@@ocaml.doc ""]

type nonrec s3_access_point_attachment_not_found = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The access point specified was not found.\n"]

type nonrec s3_access_point_attachment_names = s3_access_point_attachment_name list [@@ocaml.doc ""]

type nonrec restore_volume_from_snapshot_response = {
  administrative_actions : administrative_actions option;
      [@ocaml.doc
        "A list of administrative actions for the file system that are in process or waiting to be \
         processed. Administrative actions describe changes to the Amazon FSx system.\n"]
  lifecycle : volume_lifecycle option;
      [@ocaml.doc "The lifecycle state of the volume being restored.\n"]
  volume_id : volume_id option; [@ocaml.doc "The ID of the volume that you restored.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_open_zfs_volume_option =
  | DELETE_CLONED_VOLUMES [@ocaml.doc ""]
  | DELETE_INTERMEDIATE_SNAPSHOTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec restore_open_zfs_volume_options = restore_open_zfs_volume_option list [@@ocaml.doc ""]

type nonrec restore_volume_from_snapshot_request = {
  options : restore_open_zfs_volume_options option;
      [@ocaml.doc
        "The settings used when restoring the specified volume from snapshot.\n\n\
        \ {ul\n\
        \       {-   [DELETE_INTERMEDIATE_SNAPSHOTS] - Deletes snapshots between the current state \
         and the specified snapshot. If there are intermediate snapshots and this option isn't \
         used, [RestoreVolumeFromSnapshot] fails.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_CLONED_VOLUMES] - Deletes any dependent clone volumes created from \
         intermediate snapshots. If there are any dependent clone volumes and this option isn't \
         used, [RestoreVolumeFromSnapshot] fails.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  snapshot_id : snapshot_id;
      [@ocaml.doc
        "The ID of the source snapshot. Specifies the snapshot that you are restoring from.\n"]
  volume_id : volume_id; [@ocaml.doc "The ID of the volume that you are restoring.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec resource_type = VOLUME [@ocaml.doc ""] | FILE_SYSTEM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec report_scope = FAILED_FILES_ONLY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec report_format = REPORT_CSV_20191124 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec released_capacity = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec release_file_system_nfs_v3_locks_response = {
  file_system : file_system option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec release_file_system_nfs_v3_locks_request = {
  client_request_token : client_request_token option; [@ocaml.doc ""]
  file_system_id : file_system_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec duration_since_last_access = {
  value : value option;
      [@ocaml.doc
        "An integer that represents the minimum amount of time (in days) since a file was last \
         accessed in the file system. Only exported files with a [MAX(atime, ctime, mtime)] \
         timestamp that is more than this amount of time in the past (relative to the task create \
         time) will be released. The default of [Value] is [0]. This is a required parameter.\n\n\
        \  If an exported file meets the last accessed time criteria, its file or directory path \
         must also be specified in the [Paths] parameter of the operation in order for the file to \
         be released.\n\
        \  \n\
        \   "]
  unit_ : unit_ option;
      [@ocaml.doc
        "The unit of time used by the [Value] parameter to determine if a file can be released, \
         based on when it was last accessed. [DAYS] is the only supported value. This is a \
         required parameter.\n"]
}
[@@ocaml.doc
  "Defines the minimum amount of time since last access for a file to be eligible for release. \
   Only files that have been exported to S3 and that were last accessed or modified before this \
   point-in-time are eligible to be released from the Amazon FSx for Lustre file system.\n"]

type nonrec release_configuration = {
  duration_since_last_access : duration_since_last_access option;
      [@ocaml.doc
        "Defines the point-in-time since an exported file was last accessed, in order for that \
         file to be eligible for release. Only files that were last accessed before this \
         point-in-time are eligible to be released from the file system.\n"]
}
[@@ocaml.doc
  "The configuration that specifies a minimum amount of time since last access for an exported \
   file to be eligible for release from an Amazon FSx for Lustre file system. Only files that were \
   last accessed before this point-in-time can be released. For example, if you specify a last \
   accessed time criteria of 9 days, only files that were last accessed 9.00001 or more days ago \
   can be released.\n\n\
  \ Only file data that has been exported to S3 can be released. Files that have not yet been \
   exported to S3, such as new or changed files that have not been exported, are not eligible for \
   release. When files are released, their metadata stays on the file system, so they can still be \
   accessed later. Users and applications can access a released file by reading the file again, \
   which restores data from Amazon S3 to the FSx for Lustre file system.\n\
  \ \n\
  \   If a file meets the last accessed time criteria, its file or directory path must also be \
   specified with the [Paths] parameter of the operation in order for the file to be released.\n\
  \   \n\
  \    "]

type nonrec region = string [@@ocaml.doc ""]

type nonrec open_zfs_create_root_volume_configuration = {
  read_only : read_only option;
      [@ocaml.doc
        "A Boolean value indicating whether the volume is read-only. Setting this value to [true] \
         can be useful after you have completed changes to a volume and no longer want changes to \
         occur. \n"]
  copy_tags_to_snapshots : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the volume should be copied to snapshots of \
         the volume. This value defaults to [false]. If it's set to [true], all tags for the \
         volume are copied to snapshots where the user doesn't specify tags. If this value is \
         [true] and you specify one or more tags, only the specified tags are copied to snapshots. \
         If you specify one or more tags when creating the snapshot, no tags are copied from the \
         volume, regardless of this value. \n"]
  user_and_group_quotas : open_zfs_user_and_group_quotas option;
      [@ocaml.doc "An object specifying how much storage users or groups can use on the volume.\n"]
  nfs_exports : open_zfs_nfs_exports option;
      [@ocaml.doc "The configuration object for mounting a file system.\n"]
  data_compression_type : open_zfs_data_compression_type option;
      [@ocaml.doc
        "Specifies the method used to compress the data on the volume. The compression type is \
         [NONE] by default.\n\n\
        \ {ul\n\
        \       {-   [NONE] - Doesn't compress the data on the volume. [NONE] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [ZSTD] - Compresses the data in the volume using the Zstandard (ZSTD) \
         compression algorithm. Compared to LZ4, Z-Standard provides a better compression ratio to \
         minimize on-disk storage utilization.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Compresses the data in the volume using the LZ4 compression \
         algorithm. Compared to Z-Standard, LZ4 is less compute-intensive and delivers higher \
         write throughput speeds.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  record_size_ki_b : integer_record_size_ki_b option;
      [@ocaml.doc
        "Specifies the record size of an OpenZFS root volume, in kibibytes (KiB). Valid values are \
         4, 8, 16, 32, 64, 128, 256, 512, or 1024 KiB. The default is 128 KiB. Most workloads \
         should use the default record size. Database workflows can benefit from a smaller record \
         size, while streaming workflows can benefit from a larger record size. For additional \
         guidance on setting a custom record size, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#performance-tips-zfs} \
         Tips for maximizing performance} in the {i Amazon FSx for OpenZFS User Guide}.\n"]
}
[@@ocaml.doc "The configuration of an Amazon FSx for OpenZFS root volume.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  next_token : next_token option;
      [@ocaml.doc
        "This is present if there are more tags than returned in the response (String). You can \
         use the [NextToken] value in the later request to fetch the tags. \n"]
  tags : tags option; [@ocaml.doc "A list of tags on the resource.\n"]
}
[@@ocaml.doc "The response object for [ListTagsForResource] operation.\n"]

type nonrec list_tags_for_resource_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Opaque pagination token returned from a previous [ListTagsForResource] operation \
         (String). If a token present, the action continues the list from where the returning call \
         left off.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of tags to return in the response (integer). This parameter value must be \
         greater than 0. The number of items that Amazon FSx returns is the minimum of the \
         [MaxResults] parameter specified in the request and the service's internal maximum number \
         of items per page.\n"]
  resource_ar_n : resource_ar_n;
      [@ocaml.doc "The ARN of the Amazon FSx resource that will have its tags listed.\n"]
}
[@@ocaml.doc "The request object for [ListTagsForResource] operation.\n"]

type nonrec limited_max_results = int [@@ocaml.doc ""]

type nonrec last_updated_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec invalid_source_kms_key = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The Key Management Service (KMS) key of the source backup is not valid.\n"]

type nonrec invalid_request = {
  message : error_message option; [@ocaml.doc ""]
  error_code : error_code option;
      [@ocaml.doc "An error code indicating that the action or operation requested is invalid.\n"]
}
[@@ocaml.doc
  "The action or operation requested is invalid. Verify that the action is typed correctly.\n"]

type nonrec invalid_region = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The Region provided for [SourceRegion] is not valid or is in a different Amazon Web Services \
   partition.\n"]

type nonrec invalid_per_unit_storage_throughput = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An invalid value for [PerUnitStorageThroughput] was provided. Please create your file system \
   again, using a valid value.\n"]

type nonrec invalid_import_path = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The path provided for data repository import isn't valid.\n"]

type nonrec invalid_export_path = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The path provided for data repository export isn't valid.\n"]

type nonrec invalid_destination_kms_key = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The Key Management Service (KMS) key of the destination backup is not valid.\n"]

type nonrec invalid_data_repository_type = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You have filtered the response to a data repository type that is not supported.\n"]

type nonrec invalid_access_point = {
  message : error_message option; [@ocaml.doc ""]
  error_code : error_code option;
      [@ocaml.doc "An error code indicating that the access point specified doesn't exist.\n"]
}
[@@ocaml.doc "The access point specified doesn't exist.\n"]

type nonrec input_ontap_volume_type = DP [@ocaml.doc ""] | RW [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec incompatible_region_for_multi_a_z = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Amazon FSx doesn't support Multi-AZ Windows File Server copy backup in the destination Region, \
   so the copied backup can't be restored.\n"]

type nonrec include_shared = bool [@@ocaml.doc ""]

type nonrec filter_name =
  | FILE_CACHE_TYPE [@ocaml.doc ""]
  | FILE_CACHE_ID [@ocaml.doc ""]
  | DATA_REPOSITORY_TYPE [@ocaml.doc ""]
  | VOLUME_ID [@ocaml.doc ""]
  | FILE_SYSTEM_TYPE [@ocaml.doc ""]
  | BACKUP_TYPE [@ocaml.doc ""]
  | FILE_SYSTEM_ID [@ocaml.doc ""]
[@@ocaml.doc "The name for a filter.\n"]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter = {
  values : filter_values option;
      [@ocaml.doc
        "The values of the filter. These are all the values for any of the applied filters.\n"]
  name : filter_name option; [@ocaml.doc "The name for this filter.\n"]
}
[@@ocaml.doc
  "A filter used to restrict the results of describe calls. You can use multiple filters to return \
   results that meet all applied filter requirements.\n"]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec file_systems = file_system list [@@ocaml.doc ""]

type nonrec file_system_ids = file_system_id list [@@ocaml.doc ""]

type nonrec file_caches = file_cache list [@@ocaml.doc ""]

type nonrec file_cache_nfs_configuration = {
  dns_ips : repository_dns_ips option;
      [@ocaml.doc
        "A list of up to 2 IP addresses of DNS servers used to resolve the NFS file system domain \
         name. The provided IP addresses can either be the IP addresses of a DNS forwarder or \
         resolver that the customer manages and runs inside the customer VPC, or the IP addresses \
         of the on-premises DNS servers.\n"]
  version : nfs_version;
      [@ocaml.doc
        "The version of the NFS (Network File System) protocol of the NFS data repository. The \
         only supported value is [NFS3], which indicates that the data repository must support the \
         NFSv3 protocol.\n"]
}
[@@ocaml.doc
  "The configuration for an NFS data repository association (DRA) created during the creation of \
   the Amazon File Cache resource.\n"]

type nonrec file_cache_ids = file_cache_id list [@@ocaml.doc ""]

type nonrec file_cache_data_repository_association = {
  nf_s : file_cache_nfs_configuration option;
      [@ocaml.doc
        "The configuration for a data repository association that links an Amazon File Cache \
         resource to an NFS data repository.\n"]
  data_repository_subdirectories : sub_directories_paths option;
      [@ocaml.doc
        "A list of NFS Exports that will be linked with this data repository association. The \
         Export paths are in the format [/exportpath1]. To use this parameter, you must configure \
         [DataRepositoryPath] as the domain name of the NFS file system. The NFS file system \
         domain name in effect is the root of the subdirectories. Note that \
         [DataRepositorySubdirectories] is not supported for S3 data repositories.\n"]
  data_repository_path : archive_path;
      [@ocaml.doc
        "The path to the S3 or NFS data repository that links to the cache. You must provide one \
         of the following paths:\n\n\
        \ {ul\n\
        \       {-  The path can be an NFS data repository that links to the cache. The path can \
         be in one of two formats:\n\
        \           \n\
        \            {ul\n\
        \                  {-  If you are not using the [DataRepositorySubdirectories] parameter, \
         the path is to an NFS Export directory (or one of its subdirectories) in the format \
         [nfs://nfs-domain-name/exportpath]. You can therefore link a single NFS Export to a \
         single data repository association.\n\
        \                      \n\
        \                       }\n\
        \                  {-  If you are using the [DataRepositorySubdirectories] parameter, the \
         path is the domain name of the NFS file system in the format [nfs://filer-domain-name], \
         which indicates the root of the subdirectories specified with the \
         [DataRepositorySubdirectories] parameter.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  The path can be an S3 bucket or prefix in the format \
         [s3://bucket-name/prefix/] (where [prefix] is optional).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_cache_path : namespace;
      [@ocaml.doc
        "A path on the cache that points to a high-level directory (such as [/ns1/]) or \
         subdirectory (such as [/ns1/subdir/]) that will be mapped 1-1 with [DataRepositoryPath]. \
         The leading forward slash in the name is required. Two data repository associations \
         cannot have overlapping cache paths. For example, if a data repository is associated with \
         cache path [/ns1/], then you cannot link another data repository with cache path \
         [/ns1/ns2].\n\n\
        \ This path specifies where in your cache files will be exported from. This cache \
         directory can be linked to only one data repository, and no data repository other can be \
         linked to the directory.\n\
        \ \n\
        \   The cache path can only be set to root (/) on an NFS DRA when \
         [DataRepositorySubdirectories] is specified. If you specify root (/) as the cache path, \
         you can create only one DRA on the cache.\n\
        \   \n\
        \    The cache path cannot be set to root (/) for an S3 DRA.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The configuration for a data repository association (DRA) to be created during the Amazon File \
   Cache resource creation. The DRA links the cache to either an Amazon S3 bucket or prefix, or a \
   Network File System (NFS) data repository that supports the NFSv3 protocol.\n\n\
  \ The DRA does not support automatic import or automatic export.\n\
  \ "]

type nonrec copy_tags_to_data_repository_associations = bool [@@ocaml.doc ""]

type nonrec file_cache_creating = {
  data_repository_association_ids : data_repository_association_ids option;
      [@ocaml.doc
        "A list of IDs of data repository associations that are associated with this cache.\n"]
  lustre_configuration : file_cache_lustre_configuration option;
      [@ocaml.doc "The configuration for the Amazon File Cache resource.\n"]
  copy_tags_to_data_repository_associations : copy_tags_to_data_repository_associations option;
      [@ocaml.doc
        "A boolean flag indicating whether tags for the cache should be copied to data repository \
         associations.\n"]
  tags : tags option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "Specifies the ID of the Key Management Service (KMS) key to use for encrypting data on an \
         Amazon File Cache. If a [KmsKeyId] isn't specified, the Amazon FSx-managed KMS key for \
         your account is used. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html}Encrypt} in the \
         {i Key Management Service API Reference}.\n"]
  dns_name : dns_name option; [@ocaml.doc "The Domain Name System (DNS) name for the cache.\n"]
  network_interface_ids : network_interface_ids option; [@ocaml.doc ""]
  subnet_ids : subnet_ids option; [@ocaml.doc ""]
  vpc_id : vpc_id option; [@ocaml.doc ""]
  storage_capacity : storage_capacity option;
      [@ocaml.doc "The storage capacity of the cache in gibibytes (GiB).\n"]
  failure_details : file_cache_failure_details option;
      [@ocaml.doc
        "A structure providing details of any failures that occurred in creating a cache.\n"]
  lifecycle : file_cache_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the cache. The following are the possible values and what they \
         mean:\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The cache is in a healthy state, and is reachable and available \
         for use.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - The new cache is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - An existing cache is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] - The cache is undergoing a customer-initiated update.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - An existing cache has experienced an unrecoverable failure. When \
         creating a new cache, the cache was unable to be created.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_cache_type_version : file_system_type_version option;
      [@ocaml.doc "The Lustre version of the cache, which must be [2.12].\n"]
  file_cache_type : file_cache_type option;
      [@ocaml.doc "The type of cache, which must be [LUSTRE].\n"]
  file_cache_id : file_cache_id option;
      [@ocaml.doc "The system-generated, unique ID of the cache.\n"]
  creation_time : creation_time option; [@ocaml.doc ""]
  owner_id : aws_account_id option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The response object for the Amazon File Cache resource being created in the [CreateFileCache] \
   operation.\n"]

type nonrec failed_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec end_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec disassociate_file_system_aliases_response = {
  aliases : aliases option;
      [@ocaml.doc
        "An array of one or more DNS aliases that Amazon FSx is attempting to disassociate from \
         the file system.\n"]
}
[@@ocaml.doc
  "The system generated response showing the DNS aliases that Amazon FSx is attempting to \
   disassociate from the file system. Use the API operation to monitor the status of the aliases \
   Amazon FSx is removing from the file system.\n"]

type nonrec alternate_dns_names = alternate_dns_name list [@@ocaml.doc ""]

type nonrec disassociate_file_system_aliases_request = {
  aliases : alternate_dns_names;
      [@ocaml.doc
        "An array of one or more DNS alias names to disassociate, or remove, from the file system.\n"]
  file_system_id : file_system_id;
      [@ocaml.doc "Specifies the file system from which to disassociate the DNS aliases.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request object of DNS aliases to disassociate from an Amazon FSx for Windows File Server \
   file system.\n"]

type nonrec detach_and_delete_s3_access_point_response = {
  name : s3_access_point_attachment_name option;
      [@ocaml.doc "The name of the S3 access point attachment being deleted.\n"]
  lifecycle : s3_access_point_attachment_lifecycle option;
      [@ocaml.doc "The lifecycle status of the S3 access point attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_and_delete_s3_access_point_request = {
  name : s3_access_point_attachment_name;
      [@ocaml.doc "The name of the S3 access point attachment that you want to delete.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_volumes_response = {
  next_token : next_token option; [@ocaml.doc ""]
  volumes : volumes option;
      [@ocaml.doc
        "Returned after a successful [DescribeVolumes] operation, describing each volume.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_volumes_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  filters : volume_filters option;
      [@ocaml.doc "Enter a filter [Name] and [Values] pair to view a select set of volumes.\n"]
  volume_ids : volume_ids option;
      [@ocaml.doc "The IDs of the volumes whose descriptions you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_storage_virtual_machines_response = {
  next_token : next_token option; [@ocaml.doc ""]
  storage_virtual_machines : storage_virtual_machines option;
      [@ocaml.doc
        "Returned after a successful [DescribeStorageVirtualMachines] operation, describing each \
         SVM.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_storage_virtual_machines_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  filters : storage_virtual_machine_filters option;
      [@ocaml.doc "Enter a filter name:value pair to view a select set of SVMs.\n"]
  storage_virtual_machine_ids : storage_virtual_machine_ids option;
      [@ocaml.doc "Enter the ID of one or more SVMs that you want to view.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_snapshots_response = {
  next_token : next_token option; [@ocaml.doc ""]
  snapshots : snapshots option; [@ocaml.doc "An array of snapshots.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_snapshots_request = {
  include_shared : include_shared option;
      [@ocaml.doc
        "Set to [false] (default) if you want to only see the snapshots owned by your Amazon Web \
         Services account. Set to [true] if you want to see the snapshots in your account and the \
         ones shared with you from another account.\n"]
  next_token : next_token option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  filters : snapshot_filters option;
      [@ocaml.doc
        "The filters structure. The supported names are [file-system-id] or [volume-id].\n"]
  snapshot_ids : snapshot_ids option;
      [@ocaml.doc
        "The IDs of the snapshots that you want to retrieve. This parameter value overrides any \
         filters. If any IDs aren't found, a [SnapshotNotFound] error occurs.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_shared_vpc_configuration_response = {
  enable_fsx_route_table_updates_from_participant_accounts : verbose_flag option;
      [@ocaml.doc
        "Indicates whether participant accounts can create FSx for ONTAP Multi-AZ file systems in \
         shared subnets.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_shared_vpc_configuration_request = unit [@@ocaml.doc ""]

type nonrec describe_s3_access_point_attachments_response = {
  next_token : next_token option; [@ocaml.doc ""]
  s3_access_point_attachments : s3_access_point_attachments option;
      [@ocaml.doc
        "Array of S3 access point attachments returned after a successful \
         [DescribeS3AccessPointAttachments] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_s3_access_point_attachments_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  filters : s3_access_point_attachments_filters option;
      [@ocaml.doc
        "Enter a filter Name and Values pair to view a select set of S3 access point attachments.\n"]
  names : s3_access_point_attachment_names option;
      [@ocaml.doc
        "The names of the S3 access point attachments whose descriptions you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_file_systems_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Present if there are more file systems than returned in the response (String). You can \
         use the [NextToken] value in the later request to fetch the descriptions. \n"]
  file_systems : file_systems option; [@ocaml.doc "An array of file system descriptions.\n"]
}
[@@ocaml.doc "The response object for [DescribeFileSystems] operation.\n"]

type nonrec describe_file_systems_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Opaque pagination token returned from a previous [DescribeFileSystems] operation \
         (String). If a token present, the operation continues the list from where the returning \
         call left off.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of file systems to return in the response (integer). This parameter value \
         must be greater than 0. The number of items that Amazon FSx returns is the minimum of the \
         [MaxResults] parameter specified in the request and the service's internal maximum number \
         of items per page.\n"]
  file_system_ids : file_system_ids option;
      [@ocaml.doc "IDs of the file systems whose descriptions you want to retrieve (String).\n"]
}
[@@ocaml.doc "The request object for [DescribeFileSystems] operation.\n"]

type nonrec describe_file_system_aliases_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Present if there are more DNS aliases than returned in the response (String). You can use \
         the [NextToken] value in a later request to fetch additional descriptions. \n"]
  aliases : aliases option;
      [@ocaml.doc
        "An array of one or more DNS aliases currently associated with the specified file system.\n"]
}
[@@ocaml.doc "The response object for [DescribeFileSystemAliases] operation.\n"]

type nonrec describe_file_system_aliases_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Opaque pagination token returned from a previous [DescribeFileSystemAliases] operation \
         (String). If a token is included in the request, the action continues the list from where \
         the previous returning call left off.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of DNS aliases to return in the response (integer). This parameter value \
         must be greater than 0. The number of items that Amazon FSx returns is the minimum of the \
         [MaxResults] parameter specified in the request and the service's internal maximum number \
         of items per page.\n"]
  file_system_id : file_system_id;
      [@ocaml.doc "The ID of the file system to return the associated DNS aliases for (String).\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request object for [DescribeFileSystemAliases] operation.\n"]

type nonrec describe_file_caches_response = {
  next_token : next_token option; [@ocaml.doc ""]
  file_caches : file_caches option;
      [@ocaml.doc "The response object for the [DescribeFileCaches] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_file_caches_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  file_cache_ids : file_cache_ids option;
      [@ocaml.doc "IDs of the caches whose descriptions you want to retrieve (String).\n"]
}
[@@ocaml.doc ""]

type nonrec data_repository_task_lifecycle =
  | CANCELING [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | EXECUTING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_repository_task_type =
  | AUTO_TRIGGERED_EVICTION [@ocaml.doc ""]
  | EVICTION [@ocaml.doc ""]
  | IMPORT [@ocaml.doc ""]
  | EXPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_repository_task_path = string [@@ocaml.doc ""]

type nonrec data_repository_task_paths = data_repository_task_path list [@@ocaml.doc ""]

type nonrec data_repository_task_failure_details = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Provides information about why a data repository task failed. Only populated when the task \
   [Lifecycle] is set to [FAILED].\n"]

type nonrec data_repository_task_status = {
  released_capacity : released_capacity option;
      [@ocaml.doc
        "The total amount of data, in GiB, released by an Amazon File Cache AUTO_RELEASE_DATA task \
         that automatically releases files from the cache.\n"]
  last_updated_time : last_updated_time option;
      [@ocaml.doc "The time at which the task status was last updated.\n"]
  failed_count : failed_count option;
      [@ocaml.doc "A running total of the number of files that the task failed to process.\n"]
  succeeded_count : succeeded_count option;
      [@ocaml.doc
        "A running total of the number of files that the task has successfully processed.\n"]
  total_count : total_count option;
      [@ocaml.doc
        "The total number of files that the task will process. While a task is executing, the sum \
         of [SucceededCount] plus [FailedCount] may not equal [TotalCount]. When the task is \
         complete, [TotalCount] equals the sum of [SucceededCount] plus [FailedCount].\n"]
}
[@@ocaml.doc
  "Provides the task status showing a running total of the total number of files to be processed, \
   the number successfully processed, and the number of files the task failed to process.\n"]

type nonrec completion_report = {
  scope : report_scope option;
      [@ocaml.doc
        "Required if [Enabled] is set to [true]. Specifies the scope of the [CompletionReport]; \
         [FAILED_FILES_ONLY] is the only scope currently supported. When [Scope] is set to \
         [FAILED_FILES_ONLY], the [CompletionReport] only contains information about files that \
         the data repository task failed to process.\n"]
  format : report_format option;
      [@ocaml.doc
        "Required if [Enabled] is set to [true]. Specifies the format of the [CompletionReport]. \
         [REPORT_CSV_20191124] is the only format currently supported. When [Format] is set to \
         [REPORT_CSV_20191124], the [CompletionReport] is provided in CSV format, and is delivered \
         to [{path}/task-{id}/failures.csv]. \n"]
  path : archive_path option;
      [@ocaml.doc
        "Required if [Enabled] is set to [true]. Specifies the location of the report on the file \
         system's linked S3 data repository. An absolute path that defines where the completion \
         report will be stored in the destination location. The [Path] you provide must be located \
         within the file system\226\128\153s ExportPath. An example [Path] value is \
         \"s3://amzn-s3-demo-bucket/myExportPath/optionalPrefix\". The report provides the \
         following information for each file in the report: FilePath, FileStatus, and ErrorCode.\n"]
  enabled : flag;
      [@ocaml.doc
        "Set [Enabled] to [True] to generate a [CompletionReport] when the task completes. If set \
         to [true], then you need to provide a report [Scope], [Path], and [Format]. Set [Enabled] \
         to [False] if you do not want a [CompletionReport] generated when the task completes.\n"]
}
[@@ocaml.doc
  "Provides a report detailing the data repository task results of the files processed that match \
   the criteria specified in the report [Scope] parameter. FSx delivers the report to the file \
   system's linked data repository in Amazon S3, using the path specified in the report [Path] \
   parameter. You can specify whether or not a report gets generated for a task using the \
   [Enabled] parameter.\n"]

type nonrec capacity_to_release = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec data_repository_task = {
  release_configuration : release_configuration option;
      [@ocaml.doc
        "The configuration that specifies the last accessed time criteria for files that will be \
         released from an Amazon FSx for Lustre file system.\n"]
  file_cache_id : file_cache_id option;
      [@ocaml.doc "The system-generated, unique ID of the cache.\n"]
  capacity_to_release : capacity_to_release option;
      [@ocaml.doc
        "Specifies the amount of data to release, in GiB, by an Amazon File Cache \
         AUTO_RELEASE_DATA task that automatically releases files from the cache.\n"]
  report : completion_report option; [@ocaml.doc ""]
  status : data_repository_task_status option;
      [@ocaml.doc
        "Provides the status of the number of files that the task has processed successfully and \
         failed to process.\n"]
  failure_details : data_repository_task_failure_details option;
      [@ocaml.doc
        "Failure message describing why the task failed, it is populated only when [Lifecycle] is \
         set to [FAILED].\n"]
  paths : data_repository_task_paths option;
      [@ocaml.doc
        "An array of paths that specify the data for the data repository task to process. For \
         example, in an EXPORT_TO_REPOSITORY task, the paths specify which data to export to the \
         linked data repository.\n\n\
        \ (Default) If [Paths] is not specified, Amazon FSx uses the file system root directory.\n\
        \ "]
  file_system_id : file_system_id option;
      [@ocaml.doc "The globally unique ID of the file system.\n"]
  tags : tags option; [@ocaml.doc ""]
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  end_time : end_time option;
      [@ocaml.doc
        "The time the system completed processing the task, populated after the task is complete.\n"]
  start_time : start_time option; [@ocaml.doc "The time the system began processing the task.\n"]
  creation_time : creation_time; [@ocaml.doc ""]
  type_ : data_repository_task_type;
      [@ocaml.doc
        "The type of data repository task.\n\n\
        \ {ul\n\
        \       {-   [EXPORT_TO_REPOSITORY] tasks export from your Amazon FSx for Lustre file \
         system to a linked data repository.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPORT_METADATA_FROM_REPOSITORY] tasks import metadata changes from a linked \
         S3 bucket to your Amazon FSx for Lustre file system.\n\
        \           \n\
        \            }\n\
        \       {-   [RELEASE_DATA_FROM_FILESYSTEM] tasks release files in your Amazon FSx for \
         Lustre file system that have been exported to a linked S3 bucket and that meet your \
         specified release criteria.\n\
        \           \n\
        \            }\n\
        \       {-   [AUTO_RELEASE_DATA] tasks automatically release files from an Amazon File \
         Cache resource.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  lifecycle : data_repository_task_lifecycle;
      [@ocaml.doc
        "The lifecycle status of the data repository task, as follows:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - The task has not started.\n\
        \           \n\
        \            }\n\
        \       {-   [EXECUTING] - The task is in process.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The task was not able to be completed. For example, there may be \
         files the task failed to process. The [DataRepositoryTaskFailureDetails] property \
         provides more information about task failures.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED] - The task has completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELED] - The task was canceled and it did not complete.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELING] - The task is in process of being canceled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    You cannot delete an FSx for Lustre file system if there are data repository tasks \
         for the file system in the [PENDING] or [EXECUTING] states. Please retry when the data \
         repository task is finished (with a status of [CANCELED], [SUCCEEDED], or [FAILED]). You \
         can use the DescribeDataRepositoryTask action to monitor the task status. Contact the FSx \
         team if you need to delete your file system immediately.\n\
        \    \n\
        \     "]
  task_id : task_id;
      [@ocaml.doc "The system-generated, unique 17-digit ID of the data repository task.\n"]
}
[@@ocaml.doc
  "A description of the data repository task.\n\n\
  \ {ul\n\
  \       {-  You use import and export data repository tasks to perform bulk transfer operations \
   between an Amazon FSx for Lustre file system and a linked data repository.\n\
  \           \n\
  \            }\n\
  \       {-  You use release data repository tasks to release files that have been exported to a \
   linked S3 bucket from your Amazon FSx for Lustre file system.\n\
  \           \n\
  \            }\n\
  \       {-  An Amazon File Cache resource uses a task to automatically release files from the \
   cache.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To learn more about data repository tasks, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html}Data \
   Repository Tasks}. \n\
  \   "]

type nonrec data_repository_tasks = data_repository_task list [@@ocaml.doc ""]

type nonrec describe_data_repository_tasks_response = {
  next_token : next_token option; [@ocaml.doc ""]
  data_repository_tasks : data_repository_tasks option;
      [@ocaml.doc "The collection of data repository task descriptions returned.\n"]
}
[@@ocaml.doc ""]

type nonrec data_repository_task_filter_name =
  | FILE_CACHE_ID [@ocaml.doc ""]
  | DATA_REPO_ASSOCIATION_ID [@ocaml.doc ""]
  | TASK_LIFECYCLE [@ocaml.doc ""]
  | FILE_SYSTEM_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_repository_task_filter_value = string [@@ocaml.doc ""]

type nonrec data_repository_task_filter_values = data_repository_task_filter_value list
[@@ocaml.doc ""]

type nonrec data_repository_task_filter = {
  values : data_repository_task_filter_values option;
      [@ocaml.doc
        "Use Values to include the specific file system IDs and task lifecycle states for the \
         filters you are using.\n"]
  name : data_repository_task_filter_name option;
      [@ocaml.doc
        "Name of the task property to use in filtering the tasks returned in the response.\n\n\
        \ {ul\n\
        \       {-  Use [file-system-id] to retrieve data repository tasks for specific file \
         systems.\n\
        \           \n\
        \            }\n\
        \       {-  Use [task-lifecycle] to retrieve data repository tasks with one or more \
         specific lifecycle states, as follows: CANCELED, EXECUTING, FAILED, PENDING, and \
         SUCCEEDED.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "(Optional) An array of filter objects you can use to filter the response of data repository \
   tasks you will see in the response. You can filter the tasks returned in the response by one or \
   more file system IDs, task lifecycles, and by task type. A filter object consists of a filter \
   [Name], and one or more [Values] for the filter.\n"]

type nonrec data_repository_task_filters = data_repository_task_filter list [@@ocaml.doc ""]

type nonrec describe_data_repository_tasks_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  filters : data_repository_task_filters option;
      [@ocaml.doc
        "(Optional) You can use filters to narrow the [DescribeDataRepositoryTasks] response to \
         include just tasks for specific file systems, or tasks in a specific lifecycle state.\n"]
  task_ids : task_ids option;
      [@ocaml.doc "(Optional) IDs of the tasks whose descriptions you want to retrieve (String).\n"]
}
[@@ocaml.doc ""]

type nonrec data_repository_task_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The data repository task or tasks you specified could not be found.\n"]

type nonrec data_repository_associations = data_repository_association list [@@ocaml.doc ""]

type nonrec describe_data_repository_associations_response = {
  next_token : next_token option; [@ocaml.doc ""]
  associations : data_repository_associations option;
      [@ocaml.doc "An array of one or more data repository association descriptions.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_repository_associations_request = {
  next_token : next_token option; [@ocaml.doc ""]
  max_results : limited_max_results option;
      [@ocaml.doc
        "The maximum number of resources to return in the response. This value must be an integer \
         greater than zero.\n"]
  filters : filters option; [@ocaml.doc ""]
  association_ids : data_repository_association_ids option;
      [@ocaml.doc
        "IDs of the data repository associations whose descriptions you want to retrieve (String).\n"]
}
[@@ocaml.doc ""]

type nonrec backup_lifecycle =
  | COPYING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | TRANSFERRING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc
  "The lifecycle status of the backup.\n\n\
  \ {ul\n\
  \       {-   [AVAILABLE] - The backup is fully available.\n\
  \           \n\
  \            }\n\
  \       {-   [PENDING] - For user-initiated backups on Lustre file systems only; Amazon FSx \
   hasn't started creating the backup.\n\
  \           \n\
  \            }\n\
  \       {-   [CREATING] - Amazon FSx is creating the new user-initiated backup.\n\
  \           \n\
  \            }\n\
  \       {-   [TRANSFERRING] - For user-initiated backups on Lustre file systems only; Amazon FSx \
   is backing up the file system.\n\
  \           \n\
  \            }\n\
  \       {-   [COPYING] - Amazon FSx is copying the backup.\n\
  \           \n\
  \            }\n\
  \       {-   [DELETED] - Amazon FSx deleted the backup and it's no longer available.\n\
  \           \n\
  \            }\n\
  \       {-   [FAILED] - Amazon FSx couldn't finish the backup.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec backup_failure_details = {
  message : error_message option; [@ocaml.doc "A message describing the backup-creation failure.\n"]
}
[@@ocaml.doc "If backup creation fails, this structure contains the details of that failure.\n"]

type nonrec backup_type =
  | AWS_BACKUP [@ocaml.doc ""]
  | USER_INITIATED [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""]
[@@ocaml.doc "The type of the backup.\n"]

type nonrec active_directory_backup_attributes = {
  resource_ar_n : resource_ar_n option; [@ocaml.doc ""]
  active_directory_id : directory_id option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Managed Microsoft Active Directory instance to which \
         the file system is joined.\n"]
  domain_name : active_directory_fully_qualified_name option;
      [@ocaml.doc
        "The fully qualified domain name of the self-managed Active Directory directory.\n"]
}
[@@ocaml.doc
  "The Microsoft Active Directory attributes of the Amazon FSx for Windows File Server file system.\n"]

type nonrec backup = {
  size_in_bytes : size_in_bytes option;
      [@ocaml.doc
        " The size of the backup in bytes. This represents the amount of data that the file system \
         would contain if you restore this backup. \n"]
  volume : volume option; [@ocaml.doc ""]
  resource_type : resource_type option;
      [@ocaml.doc "Specifies the resource type that's backed up.\n"]
  source_backup_region : region option;
      [@ocaml.doc
        "The source Region of the backup. Specifies the Region from where this backup is copied.\n"]
  source_backup_id : backup_id option; [@ocaml.doc ""]
  owner_id : aws_account_id option; [@ocaml.doc ""]
  directory_information : active_directory_backup_attributes option;
      [@ocaml.doc
        "The configuration of the self-managed Microsoft Active Directory directory to which the \
         Windows File Server instance is joined.\n"]
  file_system : file_system;
      [@ocaml.doc
        "The metadata of the file system associated with the backup. This metadata is persisted \
         even if the file system is deleted.\n"]
  tags : tags option; [@ocaml.doc "The tags associated with a particular file system.\n"]
  resource_ar_n : resource_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the backup resource.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt the backup of the Amazon \
         FSx file system's data at rest. \n"]
  creation_time : creation_time; [@ocaml.doc "The time when a particular backup was created.\n"]
  progress_percent : progress_percent option; [@ocaml.doc ""]
  type_ : backup_type; [@ocaml.doc "The type of the file-system backup.\n"]
  failure_details : backup_failure_details option;
      [@ocaml.doc "Details explaining any failures that occurred when creating a backup.\n"]
  lifecycle : backup_lifecycle;
      [@ocaml.doc
        "The lifecycle status of the backup.\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The backup is fully available.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - For user-initiated backups on Lustre file systems only; Amazon \
         FSx hasn't started creating the backup.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - Amazon FSx is creating the backup.\n\
        \           \n\
        \            }\n\
        \       {-   [TRANSFERRING] - For user-initiated backups on Lustre file systems only; \
         Amazon FSx is transferring the backup to Amazon S3.\n\
        \           \n\
        \            }\n\
        \       {-   [COPYING] - Amazon FSx is copying the backup.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - Amazon FSx deleted the backup and it's no longer available.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon FSx couldn't finish the backup.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  backup_id : backup_id; [@ocaml.doc "The ID of the backup.\n"]
}
[@@ocaml.doc
  "A backup of an Amazon FSx for Windows File Server, Amazon FSx for Lustre file system, Amazon \
   FSx for NetApp ONTAP volume, or Amazon FSx for OpenZFS file system.\n"]

type nonrec backups = backup list [@@ocaml.doc ""]

type nonrec describe_backups_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A [NextToken] value is present if there are more backups than returned in the response. \
         You can use the [NextToken] value in the subsequent request to fetch the backups. \n"]
  backups : backups option; [@ocaml.doc "An array of backups.\n"]
}
[@@ocaml.doc "Response object for the [DescribeBackups] operation.\n"]

type nonrec backup_ids = backup_id list [@@ocaml.doc ""]

type nonrec describe_backups_request = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token returned from a previous [DescribeBackups] operation. If a \
         token is present, the operation continues the list from where the returning call left off.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of backups to return in the response. This parameter value must be greater \
         than 0. The number of items that Amazon FSx returns is the minimum of the [MaxResults] \
         parameter specified in the request and the service's internal maximum number of items per \
         page.\n"]
  filters : filters option;
      [@ocaml.doc
        "The filters structure. The supported names are [file-system-id], [backup-type], \
         [file-system-type], and [volume-id].\n"]
  backup_ids : backup_ids option;
      [@ocaml.doc
        "The IDs of the backups that you want to retrieve. This parameter value overrides any \
         filters. If any IDs aren't found, a [BackupNotFound] error occurs.\n"]
}
[@@ocaml.doc "The request object for the [DescribeBackups] operation.\n"]

type nonrec backup_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No Amazon FSx backups were found based upon the supplied parameters.\n"]

type nonrec delete_volume_ontap_response = {
  final_backup_tags : tags option; [@ocaml.doc ""]
  final_backup_id : backup_id option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The response object for the Amazon FSx for NetApp ONTAP volume being deleted in the \
   [DeleteVolume] operation.\n"]

type nonrec delete_volume_response = {
  ontap_response : delete_volume_ontap_response option;
      [@ocaml.doc
        "Returned after a [DeleteVolume] request, showing the status of the delete request.\n"]
  lifecycle : volume_lifecycle option;
      [@ocaml.doc
        "The lifecycle state of the volume being deleted. If the [DeleteVolume] operation is \
         successful, this value is [DELETING].\n"]
  volume_id : volume_id option; [@ocaml.doc "The ID of the volume that's being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_volume_ontap_configuration = {
  bypass_snaplock_enterprise_retention : flag option;
      [@ocaml.doc
        "Setting this to [true] allows a SnapLock administrator to delete an FSx for ONTAP \
         SnapLock Enterprise volume with unexpired write once, read many (WORM) files. The IAM \
         permission [fsx:BypassSnaplockEnterpriseRetention] is also required to delete SnapLock \
         Enterprise volumes with unexpired WORM files. The default value is [false]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-delete-volume.html} \
         Deleting a SnapLock volume}. \n\
        \ "]
  final_backup_tags : tags option; [@ocaml.doc ""]
  skip_final_backup : flag option;
      [@ocaml.doc
        "Set to true if you want to skip taking a final backup of the volume you are deleting.\n"]
}
[@@ocaml.doc
  "Use to specify skipping a final backup, adding tags to a final backup, or bypassing the \
   retention period of an FSx for ONTAP SnapLock Enterprise volume when deleting an FSx for ONTAP \
   volume. \n"]

type nonrec delete_open_zfs_volume_option = DELETE_CHILD_VOLUMES_AND_SNAPSHOTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_open_zfs_volume_options = delete_open_zfs_volume_option list [@@ocaml.doc ""]

type nonrec delete_volume_open_zfs_configuration = {
  options : delete_open_zfs_volume_options option;
      [@ocaml.doc
        "To delete the volume's child volumes, snapshots, and clones, use the string \
         [DELETE_CHILD_VOLUMES_AND_SNAPSHOTS].\n"]
}
[@@ocaml.doc "A value that specifies whether to delete all child volumes and snapshots. \n"]

type nonrec delete_volume_request = {
  open_zfs_configuration : delete_volume_open_zfs_configuration option;
      [@ocaml.doc
        "For Amazon FSx for OpenZFS volumes, specify whether to delete all child volumes and \
         snapshots.\n"]
  ontap_configuration : delete_volume_ontap_configuration option;
      [@ocaml.doc
        "For Amazon FSx for ONTAP volumes, specify whether to take a final backup of the volume \
         and apply tags to the backup. To apply tags to the backup, you must have the \
         [fsx:TagResource] permission.\n"]
  volume_id : volume_id; [@ocaml.doc "The ID of the volume that you are deleting.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_storage_virtual_machine_response = {
  lifecycle : storage_virtual_machine_lifecycle option;
      [@ocaml.doc "Describes the lifecycle state of the SVM being deleted.\n"]
  storage_virtual_machine_id : storage_virtual_machine_id option;
      [@ocaml.doc "The ID of the SVM Amazon FSx is deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_storage_virtual_machine_request = {
  storage_virtual_machine_id : storage_virtual_machine_id;
      [@ocaml.doc "The ID of the SVM that you want to delete.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_response = {
  lifecycle : snapshot_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the snapshot. If the [DeleteSnapshot] operation is successful, \
         this status is [DELETING].\n"]
  snapshot_id : snapshot_id option; [@ocaml.doc "The ID of the deleted snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_request = {
  snapshot_id : snapshot_id; [@ocaml.doc "The ID of the snapshot that you want to delete.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_file_system_windows_response = {
  final_backup_tags : tags option; [@ocaml.doc "The set of tags applied to the final backup.\n"]
  final_backup_id : backup_id option;
      [@ocaml.doc "The ID of the final backup for this file system.\n"]
}
[@@ocaml.doc
  "The response object for the Microsoft Windows file system used in the [DeleteFileSystem] \
   operation.\n"]

type nonrec delete_file_system_windows_configuration = {
  final_backup_tags : tags option; [@ocaml.doc "A set of tags for your final backup.\n"]
  skip_final_backup : flag option;
      [@ocaml.doc
        "By default, Amazon FSx for Windows takes a final backup on your behalf when the \
         [DeleteFileSystem] operation is invoked. Doing this helps protect you from data loss, and \
         we highly recommend taking the final backup. If you want to skip this backup, use this \
         flag to do so.\n"]
}
[@@ocaml.doc
  "The configuration object for the Microsoft Windows file system used in the [DeleteFileSystem] \
   operation.\n"]

type nonrec delete_file_system_lustre_response = {
  final_backup_tags : tags option; [@ocaml.doc "The set of tags applied to the final backup.\n"]
  final_backup_id : backup_id option;
      [@ocaml.doc "The ID of the final backup for this file system.\n"]
}
[@@ocaml.doc
  "The response object for the Amazon FSx for Lustre file system being deleted in the \
   [DeleteFileSystem] operation.\n"]

type nonrec delete_file_system_open_zfs_response = {
  final_backup_tags : tags option; [@ocaml.doc ""]
  final_backup_id : backup_id option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The response object for the Amazon FSx for OpenZFS file system that's being deleted in the \
   [DeleteFileSystem] operation.\n"]

type nonrec delete_file_system_response = {
  open_zfs_response : delete_file_system_open_zfs_response option;
      [@ocaml.doc
        "The response object for the OpenZFS file system that's being deleted in the \
         [DeleteFileSystem] operation.\n"]
  lustre_response : delete_file_system_lustre_response option; [@ocaml.doc ""]
  windows_response : delete_file_system_windows_response option; [@ocaml.doc ""]
  lifecycle : file_system_lifecycle option;
      [@ocaml.doc
        "The file system lifecycle for the deletion request. If the [DeleteFileSystem] operation \
         is successful, this status is [DELETING].\n"]
  file_system_id : file_system_id option;
      [@ocaml.doc "The ID of the file system that's being deleted.\n"]
}
[@@ocaml.doc "The response object for the [DeleteFileSystem] operation.\n"]

type nonrec delete_file_system_lustre_configuration = {
  final_backup_tags : tags option;
      [@ocaml.doc
        "Use if [SkipFinalBackup] is set to [false], and you want to apply an array of tags to the \
         final backup. If you have set the file system property [CopyTagsToBackups] to true, and \
         you specify one or more [FinalBackupTags] when deleting a file system, Amazon FSx will \
         not copy any existing file system tags to the backup.\n"]
  skip_final_backup : flag option;
      [@ocaml.doc
        "Set [SkipFinalBackup] to false if you want to take a final backup of the file system you \
         are deleting. By default, Amazon FSx will not take a final backup on your behalf when the \
         [DeleteFileSystem] operation is invoked. (Default = true)\n\n\
        \  The [fsx:CreateBackup] permission is required if you set [SkipFinalBackup] to [false] \
         in order to delete the file system and take a final backup.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The configuration object for the Amazon FSx for Lustre file system being deleted in the \
   [DeleteFileSystem] operation.\n"]

type nonrec delete_file_system_open_zfs_option =
  | DELETE_CHILD_VOLUMES_AND_SNAPSHOTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_file_system_open_zfs_options = delete_file_system_open_zfs_option list
[@@ocaml.doc ""]

type nonrec delete_file_system_open_zfs_configuration = {
  options : delete_file_system_open_zfs_options option;
      [@ocaml.doc
        "To delete a file system if there are child volumes present below the root volume, use the \
         string [DELETE_CHILD_VOLUMES_AND_SNAPSHOTS]. If your file system has child volumes and \
         you don't use this option, the delete request will fail.\n"]
  final_backup_tags : tags option;
      [@ocaml.doc "A list of tags to apply to the file system's final backup.\n"]
  skip_final_backup : flag option;
      [@ocaml.doc
        "By default, Amazon FSx for OpenZFS takes a final backup on your behalf when the \
         [DeleteFileSystem] operation is invoked. Doing this helps protect you from data loss, and \
         we highly recommend taking the final backup. If you want to skip taking a final backup, \
         set this value to [true].\n"]
}
[@@ocaml.doc
  "The configuration object for the Amazon FSx for OpenZFS file system used in the \
   [DeleteFileSystem] operation.\n"]

type nonrec delete_file_system_request = {
  open_zfs_configuration : delete_file_system_open_zfs_configuration option;
      [@ocaml.doc
        "The configuration object for the OpenZFS file system used in the [DeleteFileSystem] \
         operation.\n"]
  lustre_configuration : delete_file_system_lustre_configuration option; [@ocaml.doc ""]
  windows_configuration : delete_file_system_windows_configuration option; [@ocaml.doc ""]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent deletion. \
         This token is automatically filled on your behalf when using the Command Line Interface \
         (CLI) or an Amazon Web Services SDK.\n"]
  file_system_id : file_system_id;
      [@ocaml.doc "The ID of the file system that you want to delete.\n"]
}
[@@ocaml.doc "The request object for [DeleteFileSystem] operation.\n"]

type nonrec delete_file_cache_response = {
  lifecycle : file_cache_lifecycle option;
      [@ocaml.doc
        "The cache lifecycle for the deletion request. If the [DeleteFileCache] operation is \
         successful, this status is [DELETING].\n"]
  file_cache_id : file_cache_id option; [@ocaml.doc "The ID of the cache that's being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_file_cache_request = {
  client_request_token : client_request_token option; [@ocaml.doc ""]
  file_cache_id : file_cache_id; [@ocaml.doc "The ID of the cache that's being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_in_file_system = bool [@@ocaml.doc ""]

type nonrec delete_data_repository_association_response = {
  delete_data_in_file_system : delete_data_in_file_system option;
      [@ocaml.doc
        "Indicates whether data in the file system that corresponds to the data repository \
         association is being deleted. Default is [false].\n"]
  lifecycle : data_repository_lifecycle option;
      [@ocaml.doc
        "Describes the lifecycle state of the data repository association being deleted.\n"]
  association_id : data_repository_association_id option;
      [@ocaml.doc "The ID of the data repository association being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_repository_association_request = {
  delete_data_in_file_system : delete_data_in_file_system option;
      [@ocaml.doc
        "Set to [true] to delete the data in the file system that corresponds to the data \
         repository association.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  association_id : data_repository_association_id;
      [@ocaml.doc "The ID of the data repository association that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_backup_response = {
  lifecycle : backup_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the backup. If the [DeleteBackup] operation is successful, the \
         status is [DELETED].\n"]
  backup_id : backup_id option; [@ocaml.doc "The ID of the backup that was deleted.\n"]
}
[@@ocaml.doc "The response object for the [DeleteBackup] operation.\n"]

type nonrec delete_backup_request = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent deletion. \
         This parameter is automatically filled on your behalf when using the CLI or SDK.\n"]
  backup_id : backup_id; [@ocaml.doc "The ID of the backup that you want to delete.\n"]
}
[@@ocaml.doc "The request object for the [DeleteBackup] operation.\n"]

type nonrec backup_restoring = {
  file_system_id : file_system_id option;
      [@ocaml.doc "The ID of a file system being restored from the backup.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You can't delete a backup while it's being used to restore a file system.\n"]

type nonrec backup_in_progress = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Another backup is already under way. Wait for completion before initiating additional backups \
   of this file system.\n"]

type nonrec backup_being_copied = {
  backup_id : backup_id option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You can't delete a backup while it's being copied.\n"]

type nonrec data_repository_task_executing = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An existing data repository task is currently executing on the file system. Wait until the \
   existing task has completed, then create the new task.\n"]

type nonrec data_repository_task_ended = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The data repository task could not be canceled because the task has already ended.\n"]

type nonrec create_volume_response = {
  volume : volume option;
      [@ocaml.doc
        "Returned after a successful [CreateVolume] API operation, describing the volume just \
         created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snaplock_configuration = {
  volume_append_mode_enabled : flag option;
      [@ocaml.doc
        "Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume. Volume-append \
         mode allows you to create WORM-appendable files and write data to them incrementally. The \
         default value is [false]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-append}Volume-append \
         mode}. \n\
        \ "]
  snaplock_type : snaplock_type;
      [@ocaml.doc
        "Specifies the retention mode of an FSx for ONTAP SnapLock volume. After it is set, it \
         can't be changed. You can choose one of the following retention modes: \n\n\
        \ {ul\n\
        \       {-   [COMPLIANCE]: Files transitioned to write once, read many (WORM) on a \
         Compliance volume can't be deleted until their retention periods expire. This retention \
         mode is used to address government or industry-specific mandates or to protect against \
         ransomware attacks. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-compliance.html}SnapLock \
         Compliance}. \n\
        \           \n\
        \            }\n\
        \       {-   [ENTERPRISE]: Files transitioned to WORM on an Enterprise volume can be \
         deleted by authorized users before their retention periods expire using privileged \
         delete. This retention mode is used to advance an organization's data integrity and \
         internal compliance or to test retention settings before using SnapLock Compliance. For \
         more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html}SnapLock \
         Enterprise}. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retention_period : snaplock_retention_period option;
      [@ocaml.doc "Specifies the retention period of an FSx for ONTAP SnapLock volume. \n"]
  privileged_delete : privileged_delete option;
      [@ocaml.doc
        "Enables, disables, or permanently disables privileged delete on an FSx for ONTAP SnapLock \
         Enterprise volume. Enabling privileged delete allows SnapLock administrators to delete \
         WORM files even if they have active retention periods. [PERMANENTLY_DISABLED] is a \
         terminal state. If privileged delete is permanently disabled on a SnapLock volume, you \
         can't re-enable it. The default value is [DISABLED]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html#privileged-delete}Privileged \
         delete}. \n\
        \ "]
  autocommit_period : autocommit_period option;
      [@ocaml.doc
        "The configuration object for setting the autocommit period of files in an FSx for ONTAP \
         SnapLock volume. \n"]
  audit_log_volume : flag option;
      [@ocaml.doc
        "Enables or disables the audit log volume for an FSx for ONTAP SnapLock volume. The \
         default value is [false]. If you set [AuditLogVolume] to [true], the SnapLock volume is \
         created as an audit log volume. The minimum retention period for an audit log volume is \
         six months. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/how-snaplock-works.html#snaplock-audit-log-volume} \
         SnapLock audit log volumes}. \n\
        \ "]
}
[@@ocaml.doc
  "Defines the SnapLock configuration when creating an FSx for ONTAP SnapLock volume. \n"]

type nonrec aggregate_list_multiplier = int [@@ocaml.doc ""]

type nonrec create_aggregate_configuration = {
  constituents_per_aggregate : aggregate_list_multiplier option;
      [@ocaml.doc
        "Used to explicitly set the number of constituents within the FlexGroup per storage \
         aggregate. This field is optional when creating a FlexGroup volume. If unspecified, the \
         default value will be 8. This field cannot be provided when creating a FlexVol volume.\n"]
  aggregates : aggregates option;
      [@ocaml.doc "Used to specify the names of aggregates on which the volume will be created.\n"]
}
[@@ocaml.doc
  "Used to specify the configuration options for an FSx for ONTAP volume's storage aggregate or \
   aggregates.\n"]

type nonrec create_ontap_volume_configuration = {
  size_in_bytes : volume_capacity_bytes option;
      [@ocaml.doc "Specifies the configured size of the volume, in bytes.\n"]
  aggregate_configuration : create_aggregate_configuration option;
      [@ocaml.doc
        "Use to specify configuration options for a volume\226\128\153s storage aggregate or \
         aggregates.\n"]
  volume_style : volume_style option;
      [@ocaml.doc
        "Use to specify the style of an ONTAP volume. FSx for ONTAP offers two styles of volumes \
         that you can use for different purposes, FlexVol and FlexGroup volumes. For more \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-volumes.html#volume-styles}Volume \
         styles} in the Amazon FSx for NetApp ONTAP User Guide.\n"]
  snaplock_configuration : create_snaplock_configuration option;
      [@ocaml.doc "Specifies the SnapLock configuration for an FSx for ONTAP volume. \n"]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A boolean flag indicating whether tags for the volume should be copied to backups. This \
         value defaults to false. If it's set to true, all tags for the volume are copied to all \
         automatic and user-initiated backups where the user doesn't specify tags. If this value \
         is true, and you specify one or more tags, only the specified tags are copied to backups. \
         If you specify one or more tags when creating a user-initiated backup, no tags are copied \
         from the volume, regardless of this value.\n"]
  snapshot_policy : snapshot_policy option;
      [@ocaml.doc
        "Specifies the snapshot policy for the volume. There are three built-in snapshot policies:\n\n\
        \ {ul\n\
        \       {-   [default]: This is the default policy. A maximum of six hourly snapshots \
         taken five minutes past the hour. A maximum of two daily snapshots taken Monday through \
         Saturday at 10 minutes after midnight. A maximum of two weekly snapshots taken every \
         Sunday at 15 minutes after midnight.\n\
        \           \n\
        \            }\n\
        \       {-   [default-1weekly]: This policy is the same as the [default] policy except \
         that it only retains one snapshot from the weekly schedule.\n\
        \           \n\
        \            }\n\
        \       {-   [none]: This policy does not take any snapshots. This policy can be assigned \
         to volumes to prevent automatic snapshots from being taken.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can also provide the name of a custom policy that you created with the ONTAP CLI \
         or REST API.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snapshots-ontap.html#snapshot-policies}Snapshot \
         policies} in the Amazon FSx for NetApp ONTAP User Guide.\n\
        \    "]
  ontap_volume_type : input_ontap_volume_type option;
      [@ocaml.doc
        "Specifies the type of volume you are creating. Valid values are the following:\n\n\
        \ {ul\n\
        \       {-   [RW] specifies a read/write volume. [RW] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [DP] specifies a data-protection volume. A [DP] volume is read-only and can \
         be used as the destination of a NetApp SnapMirror relationship.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-volumes.html#volume-types}Volume \
         types} in the Amazon FSx for NetApp ONTAP User Guide.\n\
        \   "]
  tiering_policy : tiering_policy option; [@ocaml.doc ""]
  storage_virtual_machine_id : storage_virtual_machine_id;
      [@ocaml.doc "Specifies the ONTAP SVM in which to create the volume.\n"]
  storage_efficiency_enabled : flag option;
      [@ocaml.doc
        "Set to true to enable deduplication, compression, and compaction storage efficiency \
         features on the volume, or set to false to disable them.\n\n\
        \  [StorageEfficiencyEnabled] is required when creating a [RW] volume ([OntapVolumeType] \
         set to [RW]).\n\
        \ "]
  size_in_megabytes : volume_capacity option;
      [@ocaml.doc
        "Use [SizeInBytes] instead. Specifies the size of the volume, in megabytes (MB), that you \
         are creating.\n"]
  security_style : security_style option;
      [@ocaml.doc
        "Specifies the security style for the volume. If a volume's security style is not \
         specified, it is automatically set to the root volume's security style. The security \
         style determines the type of permissions that FSx for ONTAP uses to control data access. \
         Specify one of the following values:\n\n\
        \ {ul\n\
        \       {-   [UNIX] if the file system is managed by a UNIX administrator, the majority of \
         users are NFS clients, and an application accessing the data uses a UNIX user as the \
         service account. \n\
        \           \n\
        \            }\n\
        \       {-   [NTFS] if the file system is managed by a Windows administrator, the majority \
         of users are SMB clients, and an application accessing the data uses a Windows user as \
         the service account.\n\
        \           \n\
        \            }\n\
        \       {-   [MIXED] This is an advanced setting. For more information, see the topic \
         {{:https://docs.netapp.com/us-en/ontap/nfs-admin/security-styles-their-effects-concept.html}What \
         the security styles and their effects are} in the NetApp Documentation Center.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-volumes.html#volume-security-style}Volume \
         security style} in the FSx for ONTAP User Guide.\n\
        \   "]
  junction_path : junction_path option;
      [@ocaml.doc
        "Specifies the location in the SVM's namespace where the volume is mounted. This parameter \
         is required. The [JunctionPath] must have a leading forward slash, such as [/vol3].\n"]
}
[@@ocaml.doc "Specifies the configuration of the ONTAP volume that you are creating.\n"]

type nonrec create_open_zfs_origin_snapshot_configuration = {
  copy_strategy : open_zfs_copy_strategy;
      [@ocaml.doc
        "Specifies the strategy used when copying data from the snapshot to the new volume. \n\n\
        \ {ul\n\
        \       {-   [CLONE] - The new volume references the data in the origin snapshot. Cloning \
         a snapshot is faster than copying data from the snapshot to a new volume and doesn't \
         consume disk throughput. However, the origin snapshot can't be deleted if there is a \
         volume using its copied data.\n\
        \           \n\
        \            }\n\
        \       {-   [FULL_COPY] - Copies all data from the snapshot to the new volume.\n\
        \           \n\
        \            Specify this option to create the volume from a snapshot on another FSx for \
         OpenZFS file system.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \    The [INCREMENTAL_COPY] option is only for updating an existing volume by using a \
         snapshot from another FSx for OpenZFS file system. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_CopySnapshotAndUpdateVolume.html}CopySnapshotAndUpdateVolume}.\n\
        \    \n\
        \     "]
  snapshot_ar_n : resource_ar_n; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The snapshot configuration to use when creating an Amazon FSx for OpenZFS volume from a \
   snapshot. \n"]

type nonrec create_open_zfs_volume_configuration = {
  user_and_group_quotas : open_zfs_user_and_group_quotas option;
      [@ocaml.doc "Configures how much storage users and groups can use on the volume.\n"]
  nfs_exports : open_zfs_nfs_exports option;
      [@ocaml.doc
        "The configuration object for mounting a Network File System (NFS) file system.\n"]
  read_only : read_only option;
      [@ocaml.doc "A Boolean value indicating whether the volume is read-only.\n"]
  origin_snapshot : create_open_zfs_origin_snapshot_configuration option;
      [@ocaml.doc
        "The configuration object that specifies the snapshot to use as the origin of the data for \
         the volume.\n"]
  copy_tags_to_snapshots : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the volume should be copied to snapshots. \
         This value defaults to [false]. If this value is set to\194\160[true], and you do not \
         specify any tags, all tags for the original volume are copied over to snapshots. If this \
         value is\194\160set to [true], and you do specify one or more tags, only the specified \
         tags for the original volume are copied over to snapshots. If you specify one or more \
         tags when creating a new snapshot, no tags are copied over from the original volume, \
         regardless of this value. \n"]
  data_compression_type : open_zfs_data_compression_type option;
      [@ocaml.doc
        "Specifies the method used to compress the data on the volume. The compression type is \
         [NONE] by default.\n\n\
        \ {ul\n\
        \       {-   [NONE] - Doesn't compress the data on the volume. [NONE] is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [ZSTD] - Compresses the data in the volume using the Zstandard (ZSTD) \
         compression algorithm. ZSTD compression provides a higher level of data compression and \
         higher read throughput performance than LZ4 compression.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Compresses the data in the volume using the LZ4 compression \
         algorithm. LZ4 compression provides a lower level of compression and higher write \
         throughput performance than ZSTD compression.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information about volume compression types and the performance of your Amazon \
         FSx for OpenZFS file system, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#performance-tips-zfs} \
         Tips for maximizing performance} File system and volume settings in the {i Amazon FSx for \
         OpenZFS User Guide}.\n\
        \   "]
  record_size_ki_b : integer_record_size_ki_b option;
      [@ocaml.doc
        "Specifies the suggested block size for a volume in a ZFS dataset, in kibibytes (KiB). For \
         file systems using the Intelligent-Tiering storage class, valid values are 128, 256, 512, \
         1024, 2048, or 4096 KiB, with a default of 1024 KiB. For all other file systems, valid \
         values are 4, 8, 16, 32, 64, 128, 256, 512, or 1024 KiB, with a default of 128 KiB. We \
         recommend using the default setting for the majority of use cases. Generally, workloads \
         that write in fixed small or large record sizes may benefit from setting a custom record \
         size, like database workloads (small record size) or media streaming workloads (large \
         record size). For additional guidance on when to set a custom record size, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#record-size-performance} \
         ZFS Record size} in the {i Amazon FSx for OpenZFS User Guide}.\n"]
  storage_capacity_quota_gi_b : integer_no_max_from_negative_one option;
      [@ocaml.doc
        "Sets the maximum storage size in gibibytes (GiB) for the volume. You can specify a quota \
         that is larger than the storage on the parent volume. A volume quota limits the amount of \
         storage that the volume can consume to the configured amount, but does not guarantee the \
         space will be available on the parent volume. To guarantee quota space, you must also set \
         [StorageCapacityReservationGiB]. To {i not} specify a storage capacity quota, set this to \
         [-1]. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-volumes.html#volume-properties}Volume \
         properties} in the {i Amazon FSx for OpenZFS User Guide}.\n\
        \ "]
  storage_capacity_reservation_gi_b : integer_no_max_from_negative_one option;
      [@ocaml.doc
        "Specifies the amount of storage in gibibytes (GiB) to reserve from the parent volume. \
         Setting [StorageCapacityReservationGiB] guarantees that the specified amount of storage \
         space on the parent volume will always be available for the volume. You can't reserve \
         more storage than the parent volume has. To {i not} specify a storage capacity \
         reservation, set this to [0] or [-1]. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-volumes.html#volume-properties}Volume \
         properties} in the {i Amazon FSx for OpenZFS User Guide}.\n"]
  parent_volume_id : volume_id;
      [@ocaml.doc
        "The ID of the volume to use as the parent volume of the volume that you are creating.\n"]
}
[@@ocaml.doc
  "Specifies the configuration of the Amazon FSx for OpenZFS volume that you are creating.\n"]

type nonrec create_volume_request = {
  open_zfs_configuration : create_open_zfs_volume_configuration option;
      [@ocaml.doc "Specifies the configuration to use when creating the OpenZFS volume.\n"]
  tags : tags option; [@ocaml.doc ""]
  ontap_configuration : create_ontap_volume_configuration option;
      [@ocaml.doc "Specifies the configuration to use when creating the ONTAP volume.\n"]
  name : volume_name; [@ocaml.doc "Specifies the name of the volume that you're creating.\n"]
  volume_type : volume_type;
      [@ocaml.doc
        "Specifies the type of volume to create; [ONTAP] and [OPENZFS] are the only valid volume \
         types.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_volume_from_backup_response = {
  volume : volume option;
      [@ocaml.doc
        "Returned after a successful [CreateVolumeFromBackup] API operation, describing the volume \
         just created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_volume_from_backup_request = {
  tags : tags option; [@ocaml.doc ""]
  ontap_configuration : create_ontap_volume_configuration option;
      [@ocaml.doc "Specifies the configuration of the ONTAP volume that you are creating.\n"]
  name : volume_name; [@ocaml.doc "The name of the new volume you're creating.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  backup_id : backup_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_svm_active_directory_configuration = {
  self_managed_active_directory_configuration : self_managed_active_directory_configuration option;
      [@ocaml.doc ""]
  net_bios_name : net_bios_alias;
      [@ocaml.doc
        "The NetBIOS name of the Active Directory computer object that will be created for your SVM.\n"]
}
[@@ocaml.doc
  "The configuration that Amazon FSx uses to join the ONTAP storage virtual machine (SVM) to your \
   self-managed (including on-premises) Microsoft Active Directory directory.\n"]

type nonrec create_storage_virtual_machine_response = {
  storage_virtual_machine : storage_virtual_machine option;
      [@ocaml.doc
        "Returned after a successful [CreateStorageVirtualMachine] operation; describes the SVM \
         just created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_storage_virtual_machine_request = {
  root_volume_security_style : storage_virtual_machine_root_volume_security_style option;
      [@ocaml.doc
        "The security style of the root volume of the SVM. Specify one of the following values:\n\n\
        \ {ul\n\
        \       {-   [UNIX] if the file system is managed by a UNIX administrator, the majority of \
         users are NFS clients, and an application accessing the data uses a UNIX user as the \
         service account.\n\
        \           \n\
        \            }\n\
        \       {-   [NTFS] if the file system is managed by a Microsoft Windows administrator, \
         the majority of users are SMB clients, and an application accessing the data uses a \
         Microsoft Windows user as the service account.\n\
        \           \n\
        \            }\n\
        \       {-   [MIXED] This is an advanced setting. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-security-style.html}Volume \
         security style} in the Amazon FSx for NetApp ONTAP User Guide.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   \n\
        \   "]
  tags : tags option; [@ocaml.doc ""]
  svm_admin_password : admin_password option;
      [@ocaml.doc
        "The password to use when managing the SVM using the NetApp ONTAP CLI or REST API. If you \
         do not specify a password, you can still use the file system's [fsxadmin] user to manage \
         the SVM.\n"]
  name : storage_virtual_machine_name; [@ocaml.doc "The name of the SVM.\n"]
  file_system_id : file_system_id; [@ocaml.doc ""]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  active_directory_configuration : create_svm_active_directory_configuration option;
      [@ocaml.doc
        "Describes the self-managed Microsoft Active Directory to which you want to join the SVM. \
         Joining an Active Directory provides user authentication and access control for SMB \
         clients, including Microsoft Windows and macOS clients accessing the file system.\n"]
}
[@@ocaml.doc ""]

type nonrec active_directory_error_type =
  | INVALID_DOMAIN_STAGE [@ocaml.doc ""]
  | INVALID_NETWORK_TYPE [@ocaml.doc ""]
  | WRONG_VPC [@ocaml.doc ""]
  | INCOMPATIBLE_DOMAIN_MODE [@ocaml.doc ""]
  | DOMAIN_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc
  "The type of error relating to Microsoft Active Directory. NOT_FOUND means that no directory was \
   found by specifying the given directory. INCOMPATIBLE_MODE means that the directory specified \
   is not a Microsoft AD directory. WRONG_VPC means that the specified directory isn't accessible \
   from the specified VPC. WRONG_STAGE means that the specified directory isn't currently in the \
   ACTIVE state.\n"]

type nonrec active_directory_error = {
  message : error_message option; [@ocaml.doc ""]
  type_ : active_directory_error_type option; [@ocaml.doc "The type of Active Directory error.\n"]
  active_directory_id : directory_id;
      [@ocaml.doc "The directory ID of the directory that an error pertains to.\n"]
}
[@@ocaml.doc "An Active Directory error.\n"]

type nonrec create_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "A description of the snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_request = {
  tags : tags option; [@ocaml.doc ""]
  volume_id : volume_id; [@ocaml.doc "The ID of the volume that you are taking a snapshot of.\n"]
  name : snapshot_name; [@ocaml.doc "The name of the snapshot. \n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_file_system_windows_configuration = {
  fsrm_configuration : windows_fsrm_configuration option;
      [@ocaml.doc
        "The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File \
         Server uses for the file system. FSRM is disabled by default.\n"]
  disk_iops_configuration : disk_iops_configuration option;
      [@ocaml.doc
        "The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for \
         Windows file system. By default, Amazon FSx automatically provisions 3 IOPS per GiB of \
         storage capacity. You can provision additional IOPS per GiB of storage, up to the maximum \
         limit associated with your chosen throughput capacity.\n"]
  audit_log_configuration : windows_audit_log_create_configuration option;
      [@ocaml.doc
        "The configuration that Amazon FSx for Windows File Server uses to audit and log user \
         accesses of files, folders, and file shares on the Amazon FSx for Windows File Server \
         file system.\n"]
  aliases : alternate_dns_names option;
      [@ocaml.doc
        "An array of one or more DNS alias names that you want to associate with the Amazon FSx \
         file system. Aliases allow you to use existing DNS names to access the data in your \
         Amazon FSx file system. You can associate up to 50 aliases with a file system at any \
         time. You can associate additional DNS aliases after you create the file system using the \
         AssociateFileSystemAliases operation. You can remove DNS aliases from the file system \
         after it is created using the DisassociateFileSystemAliases operation. You only need to \
         specify the alias name in the request payload. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html}Managing \
         DNS aliases} and \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/dns-aliases.html}Accessing data \
         using DNS aliases}.\n\n\
        \ An alias name has to meet the following requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  Formatted as a fully-qualified domain name (FQDN), [hostname.domain], for \
         example, [accounting.example.com].\n\
        \            \n\
        \             }\n\
        \        {-  Can contain alphanumeric characters, the underscore (_), and the hyphen (-).\n\
        \            \n\
        \             }\n\
        \        {-  Cannot start or end with a hyphen.\n\
        \            \n\
        \             }\n\
        \        {-  Can start with a numeric.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For DNS alias names, Amazon FSx stores alphabetic characters as lowercase letters \
         (a-z), regardless of how you specify them: as uppercase letters, lowercase letters, or \
         the corresponding letters in escape codes.\n\
        \   "]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A boolean flag indicating whether tags for the file system should be copied to backups. \
         This value defaults to false. If it's set to true, all tags for the file system are \
         copied to all automatic and user-initiated backups where the user doesn't specify tags. \
         If this value is true, and you specify one or more tags, only the specified tags are \
         copied to backups. If you specify one or more tags when creating a user-initiated backup, \
         no tags are copied from the file system, regardless of this value.\n"]
  automatic_backup_retention_days : automatic_backup_retention_days option;
      [@ocaml.doc
        "The number of days to retain automatic backups. Setting this property to [0] disables \
         automatic backups. You can retain automatic backups for a maximum of 90 days. The default \
         is [30].\n"]
  daily_automatic_backup_start_time : daily_time option;
      [@ocaml.doc
        "The preferred time to take daily automatic backups, formatted HH:MM in the UTC time zone.\n"]
  weekly_maintenance_start_time : weekly_time option;
      [@ocaml.doc
        "The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time \
         zone, where d is the weekday number, from 1 through 7, beginning with Monday and ending \
         with Sunday.\n"]
  throughput_capacity : megabytes_per_second;
      [@ocaml.doc
        "Sets the throughput capacity of an Amazon FSx file system, measured in megabytes per \
         second (MB/s), in 2 to the {i n}th increments, between 2^3 (8) and 2^11 (2048).\n"]
  preferred_subnet_id : subnet_id option;
      [@ocaml.doc
        "Required when [DeploymentType] is set to [MULTI_AZ_1]. This specifies the subnet in which \
         you want the preferred file server to be located. For in-Amazon Web Services \
         applications, we recommend that you launch your clients in the same Availability Zone \
         (AZ) as your preferred file server to reduce cross-AZ data transfer costs and minimize \
         latency. \n"]
  deployment_type : windows_deployment_type option;
      [@ocaml.doc
        "Specifies the file system deployment type, valid values are the following:\n\n\
        \ {ul\n\
        \       {-   [MULTI_AZ_1] - Deploys a high availability file system that is configured for \
         Multi-AZ redundancy to tolerate temporary Availability Zone (AZ) unavailability. You can \
         only deploy a Multi-AZ file system in Amazon Web Services Regions that have a minimum of \
         three Availability Zones. Also supports HDD storage type\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_1] - (Default) Choose to deploy a file system that is configured \
         for single AZ redundancy.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_2] - The latest generation Single AZ file system. Specifies a file \
         system that is configured for single AZ redundancy and supports HDD storage type.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html} \
         Availability and Durability: Single-AZ and Multi-AZ File Systems}.\n\
        \   "]
  self_managed_active_directory_configuration : self_managed_active_directory_configuration option;
      [@ocaml.doc ""]
  active_directory_id : directory_id option;
      [@ocaml.doc
        "The ID for an existing Amazon Web Services Managed Microsoft Active Directory (AD) \
         instance that the file system should join when it's created.\n"]
}
[@@ocaml.doc
  "The configuration object for the Microsoft Windows file system used in [CreateFileSystem] and \
   [CreateFileSystemFromBackup] operations.\n"]

type nonrec create_file_system_response = {
  file_system : file_system option;
      [@ocaml.doc "The configuration of the file system that was created.\n"]
}
[@@ocaml.doc "The response object returned after the file system is created.\n"]

type nonrec create_file_system_lustre_metadata_configuration = {
  mode : metadata_configuration_mode;
      [@ocaml.doc
        "The metadata configuration mode for provisioning Metadata IOPS for an FSx for Lustre file \
         system using a [PERSISTENT_2] deployment type.\n\n\
        \ {ul\n\
        \       {-  In AUTOMATIC mode (supported only on SSD file systems), FSx for Lustre \
         automatically provisions and scales the number of Metadata IOPS for your file system \
         based on your file system storage capacity.\n\
        \           \n\
        \            }\n\
        \       {-  In USER_PROVISIONED mode, you specify the number of Metadata IOPS to provision \
         for your file system.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  iops : metadata_iops option;
      [@ocaml.doc
        "(USER_PROVISIONED mode only) Specifies the number of Metadata IOPS to provision for the \
         file system. This parameter sets the maximum rate of metadata disk IOPS supported by the \
         file system.\n\n\
        \ {ul\n\
        \       {-  For SSD file systems, valid values are [1500], [3000], [6000], [12000], and \
         multiples of [12000] up to a maximum of [192000].\n\
        \           \n\
        \            }\n\
        \       {-  For Intelligent-Tiering file systems, valid values are [6000] and [12000].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \     [Iops] doesn\226\128\153t have a default value. If you're using USER_PROVISIONED \
         mode, you can choose to specify a valid value. If you're using AUTOMATIC mode, you cannot \
         specify a value because FSx for Lustre automatically sets the value based on your file \
         system storage capacity. \n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The Lustre metadata performance configuration for the creation of an Amazon FSx for Lustre file \
   system using a [PERSISTENT_2] deployment type. The configuration uses a Metadata IOPS value to \
   set the maximum rate of metadata disk IOPS supported by the file system.\n\n\
  \ After creation, the file system supports increasing metadata performance. For more information \
   on Metadata IOPS, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-metadata-performance.html#metadata-configuration}Lustre \
   metadata performance configuration} in the {i Amazon FSx for Lustre User Guide}.\n\
  \ "]

type nonrec create_file_system_lustre_configuration = {
  data_read_cache_configuration : lustre_read_cache_configuration option;
      [@ocaml.doc
        "Specifies the optional provisioned SSD read cache on FSx for Lustre file systems that use \
         the Intelligent-Tiering storage class. Required when [StorageType] is set to \
         [INTELLIGENT_TIERING].\n"]
  throughput_capacity : throughput_capacity_mbps option;
      [@ocaml.doc
        "Specifies the throughput of an FSx for Lustre file system using the Intelligent-Tiering \
         storage class, measured in megabytes per second (MBps). Valid values are 4000 MBps or \
         multiples of 4000 MBps. You pay for the amount of throughput that you provision.\n"]
  metadata_configuration : create_file_system_lustre_metadata_configuration option;
      [@ocaml.doc
        "The Lustre metadata performance configuration for the creation of an FSx for Lustre file \
         system using a [PERSISTENT_2] deployment type.\n"]
  root_squash_configuration : lustre_root_squash_configuration option;
      [@ocaml.doc
        "The Lustre root squash configuration used when creating an Amazon FSx for Lustre file \
         system. When enabled, root squash restricts root-level access from clients that try to \
         access your file system as a root user.\n"]
  log_configuration : lustre_log_create_configuration option;
      [@ocaml.doc
        "The Lustre logging configuration used when creating an Amazon FSx for Lustre file system. \
         When logging is enabled, Lustre logs error and warning events for data repositories \
         associated with your file system to Amazon CloudWatch Logs.\n"]
  efa_enabled : flag option;
      [@ocaml.doc
        "(Optional) Specifies whether Elastic Fabric Adapter (EFA) and GPUDirect Storage (GDS) \
         support is enabled for the Amazon FSx for Lustre file system.\n\n\
        \ (Default = [false])\n\
        \ "]
  data_compression_type : data_compression_type option;
      [@ocaml.doc
        "Sets the data compression configuration for the file system. [DataCompressionType] can \
         have the following values:\n\n\
        \ {ul\n\
        \       {-   [NONE] - (Default) Data compression is turned off when the file system is \
         created.\n\
        \           \n\
        \            }\n\
        \       {-   [LZ4] - Data compression is turned on with the LZ4 algorithm.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-compression.html}Lustre data \
         compression} in the {i Amazon FSx for Lustre User Guide}.\n\
        \   "]
  drive_cache_type : drive_cache_type option;
      [@ocaml.doc
        "The type of drive cache used by [PERSISTENT_1] file systems that are provisioned with HDD \
         storage devices. This parameter is required when storage type is HDD. Set this property \
         to [READ] to improve the performance for frequently accessed files by caching up to 20% \
         of the total storage capacity of the file system.\n\n\
        \ This parameter is required when [StorageType] is set to [HDD].\n\
        \ "]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "(Optional) Not available for use with file systems that are linked to a data repository. \
         A boolean flag indicating whether tags for the file system should be copied to backups. \
         The default value is false. If [CopyTagsToBackups] is set to true, all file system tags \
         are copied to all automatic and user-initiated backups when the user doesn't specify any \
         backup-specific tags. If [CopyTagsToBackups] is set to true and you specify one or more \
         backup tags, only the specified tags are copied to backups. If you specify one or more \
         tags when creating a user-initiated backup, no tags are copied from the file system, \
         regardless of this value.\n\n\
        \ (Default = [false])\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html} Working \
         with backups} in the {i Amazon FSx for Lustre User Guide}.\n\
        \  "]
  automatic_backup_retention_days : automatic_backup_retention_days option;
      [@ocaml.doc
        "The number of days to retain automatic backups. Setting this property to [0] disables \
         automatic backups. You can retain automatic backups for a maximum of 90 days. The default \
         is [0].\n"]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  per_unit_storage_throughput : per_unit_storage_throughput option;
      [@ocaml.doc
        "Required with [PERSISTENT_1] and [PERSISTENT_2] deployment types using an SSD or HDD \
         storage class, provisions the amount of read and write throughput for each 1 tebibyte \
         (TiB) of file system storage capacity, in MB/s/TiB. File system throughput capacity is \
         calculated by multiplying \239\172\129le system storage capacity (TiB) by the \
         [PerUnitStorageThroughput] (MB/s/TiB). For a 2.4-TiB \239\172\129le system, provisioning \
         50 MB/s/TiB of [PerUnitStorageThroughput] yields 120 MB/s of \239\172\129le system \
         throughput. You pay for the amount of throughput that you provision. \n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  For [PERSISTENT_1] SSD storage: 50, 100, 200 MB/s/TiB.\n\
        \            \n\
        \             }\n\
        \        {-  For [PERSISTENT_1] HDD storage: 12, 40 MB/s/TiB.\n\
        \            \n\
        \             }\n\
        \        {-  For [PERSISTENT_2] SSD storage: 125, 250, 500, 1000 MB/s/TiB.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  auto_import_policy : auto_import_policy_type option;
      [@ocaml.doc
        " (Optional) When you create your file system, your existing S3 objects appear as file and \
         directory listings. Use this parameter to choose how Amazon FSx keeps your file and \
         directory listings up to date as you add or modify objects in your linked S3 bucket. \
         [AutoImportPolicy] can have the following values:\n\n\
        \ {ul\n\
        \       {-   [NONE] - (Default) AutoImport is off. Amazon FSx only updates file and \
         directory listings from the linked S3 bucket when the file system is created. FSx does \
         not update file and directory listings for any new or changed objects after choosing this \
         option.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW] - AutoImport is on. Amazon FSx automatically imports directory listings \
         of any new objects added to the linked S3 bucket that do not currently exist in the FSx \
         file system. \n\
        \           \n\
        \            }\n\
        \       {-   [NEW_CHANGED] - AutoImport is on. Amazon FSx automatically imports file and \
         directory listings of any new objects added to the S3 bucket and any existing objects \
         that are changed in the S3 bucket after you choose this option.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_CHANGED_DELETED] - AutoImport is on. Amazon FSx automatically imports \
         file and directory listings of any new objects added to the S3 bucket, any existing \
         objects that are changed in the S3 bucket, and any objects that were deleted in the S3 \
         bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/older-deployment-types.html#legacy-auto-import-from-s3} \
         Automatically import updates from your S3 bucket}.\n\
        \   \n\
        \     This parameter is not supported for file systems with a data repository association.\n\
        \     \n\
        \      "]
  deployment_type : lustre_deployment_type option;
      [@ocaml.doc
        "(Optional) Choose [SCRATCH_1] and [SCRATCH_2] deployment types when you need temporary \
         storage and shorter-term processing of data. The [SCRATCH_2] deployment type provides \
         in-transit encryption of data and higher burst throughput capacity than [SCRATCH_1].\n\n\
        \ Choose [PERSISTENT_1] for longer-term storage and for throughput-focused workloads that \
         aren\226\128\153t latency-sensitive. [PERSISTENT_1] supports encryption of data in \
         transit, and is available in all Amazon Web Services Regions in which FSx for Lustre is \
         available.\n\
        \ \n\
        \  Choose [PERSISTENT_2] for longer-term storage and for latency-sensitive workloads that \
         require the highest levels of IOPS/throughput. [PERSISTENT_2] supports the SSD and \
         Intelligent-Tiering storage classes. You can optionally specify a metadata configuration \
         mode for [PERSISTENT_2] which supports increasing metadata performance. [PERSISTENT_2] is \
         available in a limited number of Amazon Web Services Regions. For more information, and \
         an up-to-date list of Amazon Web Services Regions in which [PERSISTENT_2] is available, \
         see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-fsx-lustre.html}Deployment \
         and storage class options for FSx for Lustre file systems} in the {i Amazon FSx for \
         Lustre User Guide}.\n\
        \  \n\
        \    If you choose [PERSISTENT_2], and you set [FileSystemTypeVersion] to [2.10], the \
         [CreateFileSystem] operation fails.\n\
        \    \n\
        \      Encryption of data in transit is automatically turned on when you access \
         [SCRATCH_2], [PERSISTENT_1], and [PERSISTENT_2] file systems from Amazon EC2 instances \
         that support automatic encryption in the Amazon Web Services Regions where they are \
         available. For more information about encryption in transit for FSx for Lustre file \
         systems, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/encryption-in-transit-fsxl.html}Encrypting \
         data in transit} in the {i Amazon FSx for Lustre User Guide}.\n\
        \      \n\
        \       (Default = [SCRATCH_1])\n\
        \       "]
  imported_file_chunk_size : megabytes option;
      [@ocaml.doc
        "(Optional) For files imported from a data repository, this value determines the stripe \
         count and maximum amount of data per file (in MiB) stored on a single physical disk. The \
         maximum number of disks that a single file can be striped across is limited by the total \
         number of disks that make up the file system.\n\n\
        \ The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). \
         Amazon S3 objects have a maximum size of 5 TB.\n\
        \ \n\
        \   This parameter is not supported for file systems with a data repository association.\n\
        \   \n\
        \    "]
  export_path : archive_path option;
      [@ocaml.doc
        "(Optional) Specifies the path in the Amazon S3 bucket where the root of your Amazon FSx \
         file system is exported. The path must use the same Amazon S3 bucket as specified in \
         ImportPath. You can provide an optional prefix to which new and changed data is to be \
         exported from your Amazon FSx for Lustre file system. If an [ExportPath] value is not \
         provided, Amazon FSx sets a default export path, \
         [s3://import-bucket/FSxLustre\\[creation-timestamp\\]]. The timestamp is in UTC format, \
         for example [s3://import-bucket/FSxLustre20181105T222312Z].\n\n\
        \ The Amazon S3 export bucket must be the same as the import bucket specified by \
         [ImportPath]. If you specify only a bucket name, such as [s3://import-bucket], you get a \
         1:1 mapping of file system objects to S3 bucket objects. This mapping means that the \
         input data in S3 is overwritten on export. If you provide a custom prefix in the export \
         path, such as [s3://import-bucket/\\[custom-optional-prefix\\]], Amazon FSx exports the \
         contents of your file system to that export prefix in the Amazon S3 bucket.\n\
        \ \n\
        \   This parameter is not supported for file systems with a data repository association.\n\
        \   \n\
        \    "]
  import_path : archive_path option;
      [@ocaml.doc
        "(Optional) The path to the Amazon S3 bucket (including the optional prefix) that you're \
         using as the data repository for your Amazon FSx for Lustre file system. The root of your \
         FSx for Lustre file system will be mapped to the root of the Amazon S3 bucket you select. \
         An example is [s3://import-bucket/optional-prefix]. If you specify a prefix after the \
         Amazon S3 bucket name, only object keys with that prefix are loaded into the file \
         system.\n\n\
        \  This parameter is not supported for file systems with a data repository association.\n\
        \  \n\
        \   "]
  weekly_maintenance_start_time : weekly_time option;
      [@ocaml.doc
        "(Optional) The preferred start time to perform weekly maintenance, formatted d:HH:MM in \
         the UTC time zone, where d is the weekday number, from 1 through 7, beginning with Monday \
         and ending with Sunday.\n"]
}
[@@ocaml.doc
  "The Lustre configuration for the file system being created.\n\n\
  \  The following parameters are not supported for file systems with a data repository \
   association created with .\n\
  \  \n\
  \   {ul\n\
  \         {-   [AutoImportPolicy] \n\
  \             \n\
  \              }\n\
  \         {-   [ExportPath] \n\
  \             \n\
  \              }\n\
  \         {-   [ImportedFileChunkSize] \n\
  \             \n\
  \              }\n\
  \         {-   [ImportPath] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

type nonrec create_file_system_ontap_configuration = {
  endpoint_ipv6_address_range : ipv6_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /118 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  throughput_capacity_per_ha_pair : throughput_capacity_per_ha_pair option;
      [@ocaml.doc
        "Use to choose the throughput capacity per HA pair, rather than the total throughput for \
         the file system. \n\n\
        \ You can define either the [ThroughputCapacityPerHAPair] or the [ThroughputCapacity] when \
         creating a file system, but not both.\n\
        \ \n\
        \  This field and [ThroughputCapacity] are the same for file systems powered by one HA pair.\n\
        \  \n\
        \   {ul\n\
        \         {-  For [SINGLE_AZ_1] and [MULTI_AZ_1] file systems, valid values are 128, 256, \
         512, 1024, 2048, or 4096 MBps.\n\
        \             \n\
        \              }\n\
        \         {-  For [SINGLE_AZ_2], valid values are 1536, 3072, or 6144 MBps.\n\
        \             \n\
        \              }\n\
        \         {-  For [MULTI_AZ_2], valid values are 384, 768, 1536, 3072, or 6144 MBps.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \   \n\
        \    {ul\n\
        \          {-  The value of [ThroughputCapacity] and [ThroughputCapacityPerHAPair] are not \
         the same value for file systems with one HA pair.\n\
        \              \n\
        \               }\n\
        \          {-  The value of deployment type is [SINGLE_AZ_2] and [ThroughputCapacity] / \
         [ThroughputCapacityPerHAPair] is not a valid HA pair (a value between 1 and 12).\n\
        \              \n\
        \               }\n\
        \          {-  The value of [ThroughputCapacityPerHAPair] is not a valid value.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  ha_pairs : ha_pairs option;
      [@ocaml.doc
        "Specifies how many high-availability (HA) pairs of file servers will power your file \
         system. First-generation file systems are powered by 1 HA pair. Second-generation \
         multi-AZ file systems are powered by 1 HA pair. Second generation single-AZ file systems \
         are powered by up to 12 HA pairs. The default value is 1. The value of this property \
         affects the values of [StorageCapacity], [Iops], and [ThroughputCapacity]. For more \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/administering-file-systems.html#HA-pairs}High-availability \
         (HA) pairs} in the FSx for ONTAP user guide. Block storage protocol support (iSCSI and \
         NVMe over TCP) is disabled on file systems with more than 6 HA pairs. For more \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/supported-fsx-clients.html#using-block-storage}Using \
         block storage protocols}. \n\n\
        \ Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \ \n\
        \  {ul\n\
        \        {-  The value of [HAPairs] is less than 1 or greater than 12.\n\
        \            \n\
        \             }\n\
        \        {-  The value of [HAPairs] is greater than 1 and the value of [DeploymentType] is \
         [SINGLE_AZ_1], [MULTI_AZ_1], or [MULTI_AZ_2].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  throughput_capacity : megabytes_per_second option;
      [@ocaml.doc
        "Sets the throughput capacity for the file system that you're creating in megabytes per \
         second (MBps). For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-throughput-capacity.html}Managing \
         throughput capacity} in the FSx for ONTAP User Guide.\n\n\
        \ Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following \
         conditions:\n\
        \ \n\
        \  {ul\n\
        \        {-  The value of [ThroughputCapacity] and [ThroughputCapacityPerHAPair] are not \
         the same value.\n\
        \            \n\
        \             }\n\
        \        {-  The value of [ThroughputCapacity] when divided by the value of [HAPairs] is \
         outside of the valid range for [ThroughputCapacity].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the route tables in which Amazon FSx creates the rules for \
         routing traffic to the correct file server. You should specify all virtual private cloud \
         (VPC) route tables associated with the subnets in which your clients are located. By \
         default, Amazon FSx selects your VPC's default route table.\n\n\
        \  Amazon FSx manages these route tables for Multi-AZ file systems using tag-based \
         authentication. These route tables are tagged with [Key: AmazonFSx; Value: \
         ManagedByAmazonFSx]. When creating FSx for ONTAP Multi-AZ file systems using \
         CloudFormation we recommend that you add the [Key: AmazonFSx; Value: ManagedByAmazonFSx] \
         tag manually.\n\
        \  \n\
        \   "]
  preferred_subnet_id : subnet_id option;
      [@ocaml.doc
        "Required when [DeploymentType] is set to [MULTI_AZ_1] or [MULTI_AZ_2]. This specifies the \
         subnet in which you want the preferred file server to be located.\n"]
  disk_iops_configuration : disk_iops_configuration option;
      [@ocaml.doc "The SSD IOPS configuration for the FSx for ONTAP file system.\n"]
  fsx_admin_password : admin_password option;
      [@ocaml.doc
        "The ONTAP administrative password for the [fsxadmin] user with which you administer your \
         file system using the NetApp ONTAP CLI and REST API.\n"]
  endpoint_ip_address_range : ip_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API, Amazon FSx selects an \
         unused IP address range for you from the 198.19.* range. By default in the Amazon FSx \
         console, Amazon FSx chooses the last 64 IP addresses from the VPC\226\128\153s primary \
         CIDR range to use as the endpoint IP address range for the file system. You can have \
         overlapping endpoint IP addresses for file systems deployed in the same VPC/route tables, \
         as long as they don't overlap with any subnet.\n"]
  deployment_type : ontap_deployment_type;
      [@ocaml.doc
        "Specifies the FSx for ONTAP file system deployment type to use in creating the file \
         system. \n\n\
        \ {ul\n\
        \       {-   [MULTI_AZ_1] - A high availability file system configured for Multi-AZ \
         redundancy to tolerate temporary Availability Zone (AZ) unavailability. This is a \
         first-generation FSx for ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       {-   [MULTI_AZ_2] - A high availability file system configured for Multi-AZ \
         redundancy to tolerate temporary AZ unavailability. This is a second-generation FSx for \
         ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_1] - A file system configured for Single-AZ redundancy. This is a \
         first-generation FSx for ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_2] - A file system configured with multiple high-availability (HA) \
         pairs for Single-AZ redundancy. This is a second-generation FSx for ONTAP file system.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For information about the use cases for Multi-AZ and Single-AZ deployments, refer to \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-AZ.html}Choosing a \
         file system deployment type}. \n\
        \   "]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The ONTAP configuration properties of the FSx for ONTAP file system that you are creating.\n"]

type nonrec create_file_system_open_zfs_configuration = {
  read_cache_configuration : open_zfs_read_cache_configuration option;
      [@ocaml.doc
        " Specifies the optional provisioned SSD read cache on file systems that use the \
         Intelligent-Tiering storage class. \n"]
  route_table_ids : route_table_ids option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the route tables in which Amazon FSx creates the rules for \
         routing traffic to the correct file server. You should specify all virtual private cloud \
         (VPC) route tables associated with the subnets in which your clients are located. By \
         default, Amazon FSx selects your VPC's default route table.\n"]
  endpoint_ipv6_address_range : ipv6_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /118 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  endpoint_ip_address_range : ip_address_range option;
      [@ocaml.doc
        "(Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your \
         file system will be created. By default in the Amazon FSx API and Amazon FSx console, \
         Amazon FSx selects an available /28 IP address range for you from one of the VPC's CIDR \
         ranges. You can have overlapping endpoint IP addresses for file systems deployed in the \
         same VPC/route tables, as long as they don't overlap with any subnet.\n"]
  preferred_subnet_id : subnet_id option;
      [@ocaml.doc
        "Required when [DeploymentType] is set to [MULTI_AZ_1]. This specifies the subnet in which \
         you want the preferred file server to be located.\n"]
  root_volume_configuration : open_zfs_create_root_volume_configuration option;
      [@ocaml.doc
        "The configuration Amazon FSx uses when creating the root value of the Amazon FSx for \
         OpenZFS file system. All volumes are children of the root volume. \n"]
  disk_iops_configuration : disk_iops_configuration option; [@ocaml.doc ""]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  throughput_capacity : megabytes_per_second;
      [@ocaml.doc
        "Specifies the throughput of an Amazon FSx for OpenZFS file system, measured in megabytes \
         per second (MBps). Valid values depend on the [DeploymentType] that you choose, as \
         follows:\n\n\
        \ {ul\n\
        \       {-  For [MULTI_AZ_1] and [SINGLE_AZ_2], valid values are 160, 320, 640, 1280, \
         2560, 3840, 5120, 7680, or 10240 MBps.\n\
        \           \n\
        \            }\n\
        \       {-  For [SINGLE_AZ_1], valid values are 64, 128, 256, 512, 1024, 2048, 3072, or \
         4096 MBps.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You pay for additional throughput capacity that you provision.\n\
        \   "]
  deployment_type : open_zfs_deployment_type;
      [@ocaml.doc
        "Specifies the file system deployment type. Valid values are the following:\n\n\
        \ {ul\n\
        \       {-   [MULTI_AZ_1]- Creates file systems with high availability and durability by \
         replicating your data and supporting failover across multiple Availability Zones in the \
         same Amazon Web Services Region.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_HA_2]- Creates file systems with high availability and throughput \
         capacities of 160 - 10,240 MB/s using an NVMe L2ARC cache by deploying a primary and \
         standby file system within the same Availability Zone.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_HA_1]- Creates file systems with high availability and throughput \
         capacities of 64 - 4,096 MB/s by deploying a primary and standby file system within the \
         same Availability Zone.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_2]- Creates file systems with throughput capacities of 160 - \
         10,240 MB/s using an NVMe L2ARC cache that automatically recover within a single \
         Availability Zone.\n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_AZ_1]- Creates file systems with throughput capacities of 64 - 4,096 \
         MBs that automatically recover within a single Availability Zone.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For a list of which Amazon Web Services Regions each deployment type is available in, \
         see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/availability-durability.html#available-aws-regions}Deployment \
         type availability}. For more information on the differences in performance between \
         deployment types, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#zfs-fs-performance}File \
         system performance} in the {i Amazon FSx for OpenZFS User Guide}.\n\
        \   "]
  daily_automatic_backup_start_time : daily_time option; [@ocaml.doc ""]
  copy_tags_to_volumes : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the file system should be copied to volumes. \
         This value defaults to [false]. If it's set to [true], all tags for the file system are \
         copied to volumes where the user doesn't specify tags. If this value is [true], and you \
         specify one or more tags, only the specified tags are copied to volumes. If you specify \
         one or more tags when creating the volume, no tags are copied from the file system, \
         regardless of this value.\n"]
  copy_tags_to_backups : flag option;
      [@ocaml.doc
        "A Boolean value indicating whether tags for the file system should be copied to backups. \
         This value defaults to [false]. If it's set to [true], all tags for the file system are \
         copied to all automatic and user-initiated backups where the user doesn't specify tags. \
         If this value is [true], and you specify one or more tags, only the specified tags are \
         copied to backups. If you specify one or more tags when creating a user-initiated backup, \
         no tags are copied from the file system, regardless of this value.\n"]
  automatic_backup_retention_days : automatic_backup_retention_days option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The Amazon FSx for OpenZFS configuration properties for the file system that you are creating.\n"]

type nonrec create_file_system_request = {
  network_type : network_type option;
      [@ocaml.doc
        "The network type of the Amazon FSx file system that you are creating. Valid values are \
         [IPV4] (which supports IPv4 only) and [DUAL] (for dual-stack mode, which supports both \
         IPv4 and IPv6). The default is [IPV4]. Supported for FSx for OpenZFS, FSx for ONTAP, and \
         FSx for Windows File Server file systems.\n"]
  open_zfs_configuration : create_file_system_open_zfs_configuration option;
      [@ocaml.doc "The OpenZFS configuration for the file system that's being created.\n"]
  file_system_type_version : file_system_type_version option;
      [@ocaml.doc
        "For FSx for Lustre file systems, sets the Lustre version for the file system that you're \
         creating. Valid values are [2.10], [2.12], and [2.15]:\n\n\
        \ {ul\n\
        \       {-   [2.10] is supported by the Scratch and Persistent_1 Lustre deployment types.\n\
        \           \n\
        \            }\n\
        \       {-   [2.12] is supported by all Lustre deployment types, except for [PERSISTENT_2] \
         with a metadata configuration mode.\n\
        \           \n\
        \            }\n\
        \       {-   [2.15] is supported by all Lustre deployment types and is recommended for all \
         new file systems.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default value is [2.10], except for the following deployments:\n\
        \   \n\
        \    {ul\n\
        \          {-  Default value is [2.12] when [DeploymentType] is set to [PERSISTENT_2] \
         without a metadata configuration mode.\n\
        \              \n\
        \               }\n\
        \          {-  Default value is [2.15] when [DeploymentType] is set to [PERSISTENT_2] with \
         a metadata configuration mode.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  ontap_configuration : create_file_system_ontap_configuration option; [@ocaml.doc ""]
  lustre_configuration : create_file_system_lustre_configuration option; [@ocaml.doc ""]
  windows_configuration : create_file_system_windows_configuration option;
      [@ocaml.doc "The Microsoft Windows configuration for the file system that's being created.\n"]
  kms_key_id : kms_key_id option; [@ocaml.doc ""]
  tags : tags option;
      [@ocaml.doc
        "The tags to apply to the file system that's being created. The key value of the [Name] \
         tag appears in the console as the file system name.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "A list of IDs specifying the security groups to apply to all network interfaces created \
         for file system access. This list isn't returned in later requests to describe the file \
         system.\n\n\
        \  You must specify a security group if you are creating a Multi-AZ FSx for ONTAP file \
         system in a VPC subnet that has been shared with you.\n\
        \  \n\
        \   "]
  subnet_ids : subnet_ids;
      [@ocaml.doc
        "Specifies the IDs of the subnets that the file system will be accessible from. For \
         Windows and ONTAP [MULTI_AZ_1] deployment types,provide exactly two subnet IDs, one for \
         the preferred file server and one for the standby file server. You specify one of these \
         subnets as the preferred subnet using the [WindowsConfiguration >\n\
        \                PreferredSubnetID] or [OntapConfiguration > PreferredSubnetID] \
         properties. For more information about Multi-AZ file system configuration, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html} \
         Availability and durability: Single-AZ and Multi-AZ file systems} in the {i Amazon FSx \
         for Windows User Guide} and \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-multiAZ.html} \
         Availability and durability} in the {i Amazon FSx for ONTAP User Guide}.\n\n\
        \ For Windows [SINGLE_AZ_1] and [SINGLE_AZ_2] and all Lustre deployment types, provide \
         exactly one subnet ID. The file server is launched in that subnet's Availability Zone.\n\
        \ "]
  storage_type : storage_type option;
      [@ocaml.doc
        "Sets the storage class for the file system that you're creating. Valid values are [SSD], \
         [HDD], and [INTELLIGENT_TIERING].\n\n\
        \ {ul\n\
        \       {-  Set to [SSD] to use solid state drive storage. SSD is supported on all \
         Windows, Lustre, ONTAP, and OpenZFS deployment types.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [HDD] to use hard disk drive storage, which is supported on \
         [SINGLE_AZ_2] and [MULTI_AZ_1] Windows file system deployment types, and on \
         [PERSISTENT_1] Lustre file system deployment types.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [INTELLIGENT_TIERING] to use fully elastic, intelligently-tiered \
         storage. Intelligent-Tiering is only available for OpenZFS file systems with the Multi-AZ \
         deployment type and for Lustre file systems with the Persistent_2 deployment type.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default value is [SSD]. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/optimize-fsx-costs.html#storage-type-options} \
         Storage type options} in the {i FSx for Windows File Server User Guide}, \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-fsx-lustre.html#lustre-storage-classes}FSx \
         for Lustre storage classes} in the {i FSx for Lustre User Guide}, and \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance-intelligent-tiering}Working \
         with Intelligent-Tiering} in the {i Amazon FSx for OpenZFS User Guide}.\n\
        \   "]
  storage_capacity : storage_capacity option;
      [@ocaml.doc
        "Sets the storage capacity of the file system that you're creating, in gibibytes (GiB).\n\n\
        \  {b FSx for Lustre file systems} - The amount of storage capacity that you can configure \
         depends on the value that you set for [StorageType] and the Lustre [DeploymentType], as \
         follows:\n\
        \ \n\
        \  {ul\n\
        \        {-  For [SCRATCH_2], [PERSISTENT_2], and [PERSISTENT_1] deployment types using \
         SSD storage type, the valid values are 1200 GiB, 2400 GiB, and increments of 2400 GiB.\n\
        \            \n\
        \             }\n\
        \        {-  For [PERSISTENT_1] HDD file systems, valid values are increments of 6000 GiB \
         for 12 MB/s/TiB file systems and increments of 1800 GiB for 40 MB/s/TiB file systems.\n\
        \            \n\
        \             }\n\
        \        {-  For [SCRATCH_1] deployment type, valid values are 1200 GiB, 2400 GiB, and \
         increments of 3600 GiB.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    {b FSx for ONTAP file systems} - The amount of storage capacity that you can \
         configure depends on the value of the [HAPairs] property. The minimum value is calculated \
         as 1,024 * [HAPairs] and the maximum is calculated as 524,288 * [HAPairs]. \n\
        \   \n\
        \     {b FSx for OpenZFS file systems} - The amount of storage capacity that you can \
         configure is from 64 GiB up to 524,288 GiB (512 TiB).\n\
        \    \n\
        \      {b FSx for Windows File Server file systems} - The amount of storage capacity that \
         you can configure depends on the value that you set for [StorageType] as follows:\n\
        \     \n\
        \      {ul\n\
        \            {-  For SSD storage, valid values are 32 GiB-65,536 GiB (64 TiB).\n\
        \                \n\
        \                 }\n\
        \            {-  For HDD storage, valid values are 2000 GiB-65,536 GiB (64 TiB).\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \  "]
  file_system_type : file_system_type;
      [@ocaml.doc
        "The type of Amazon FSx file system to create. Valid values are [WINDOWS], [LUSTRE], \
         [ONTAP], and [OPENZFS].\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent creation. \
         This string is automatically filled on your behalf when you use the Command Line \
         Interface (CLI) or an Amazon Web Services SDK.\n"]
}
[@@ocaml.doc "The request object used to create a new Amazon FSx file system.\n"]

type nonrec create_file_system_from_backup_response = {
  file_system : file_system option; [@ocaml.doc "A description of the file system.\n"]
}
[@@ocaml.doc "The response object for the [CreateFileSystemFromBackup] operation.\n"]

type nonrec create_file_system_from_backup_request = {
  network_type : network_type option;
      [@ocaml.doc
        "Sets the network type for the Amazon FSx for OpenZFS file system that you're creating \
         from a backup.\n"]
  storage_capacity : storage_capacity option;
      [@ocaml.doc
        "Sets the storage capacity of the OpenZFS file system that you're creating from a backup, \
         in gibibytes (GiB). Valid values are from 64 GiB up to 524,288 GiB (512 TiB). However, \
         the value that you specify must be equal to or greater than the backup's storage capacity \
         value. If you don't use the [StorageCapacity] parameter, the default is the backup's \
         [StorageCapacity] value.\n\n\
        \ If used to create a file system other than OpenZFS, you must provide a value that \
         matches the backup's [StorageCapacity] value. If you provide any other value, Amazon FSx \
         responds with an HTTP status code 400 Bad Request. \n\
        \ "]
  open_zfs_configuration : create_file_system_open_zfs_configuration option;
      [@ocaml.doc "The OpenZFS configuration for the file system that's being created. \n"]
  file_system_type_version : file_system_type_version option;
      [@ocaml.doc
        "Sets the version for the Amazon FSx for Lustre file system that you're creating from a \
         backup. Valid values are [2.10], [2.12], and [2.15].\n\n\
        \ You can enter a Lustre version that is newer than the backup's [FileSystemTypeVersion] \
         setting. If you don't enter a newer Lustre version, it defaults to the backup's setting.\n\
        \ "]
  kms_key_id : kms_key_id option; [@ocaml.doc ""]
  storage_type : storage_type option;
      [@ocaml.doc
        "Sets the storage type for the Windows, OpenZFS, or Lustre file system that you're \
         creating from a backup. Valid values are [SSD], [HDD], and [INTELLIGENT_TIERING].\n\n\
        \ {ul\n\
        \       {-  Set to [SSD] to use solid state drive storage. SSD is supported on all Windows \
         and OpenZFS deployment types.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [HDD] to use hard disk drive storage. HDD is supported on [SINGLE_AZ_2] \
         and [MULTI_AZ_1] FSx for Windows File Server file system deployment types.\n\
        \           \n\
        \            }\n\
        \       {-  Set to [INTELLIGENT_TIERING] to use fully elastic, intelligently-tiered \
         storage. Intelligent-Tiering is only available for OpenZFS file systems with the Multi-AZ \
         deployment type and for Lustre file systems with the Persistent_2 deployment type.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The default value is [SSD]. \n\
        \   \n\
        \     HDD and SSD storage types have different minimum storage capacity requirements. A \
         restored file system's storage capacity is tied to the file system that was backed up. \
         You can create a file system that uses HDD storage from a backup of a file system that \
         used SSD storage if the original SSD file system had a storage capacity of at least 2000 \
         GiB.\n\
        \     \n\
        \      "]
  lustre_configuration : create_file_system_lustre_configuration option; [@ocaml.doc ""]
  windows_configuration : create_file_system_windows_configuration option;
      [@ocaml.doc "The configuration for this Microsoft Windows file system.\n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to be applied to the file system at file system creation. The key value of the \
         [Name] tag appears in the console as the file system name.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "A list of IDs for the security groups that apply to the specified network interfaces \
         created for file system access. These security groups apply to all network interfaces. \
         This value isn't returned in later [DescribeFileSystem] requests.\n"]
  subnet_ids : subnet_ids;
      [@ocaml.doc
        "Specifies the IDs of the subnets that the file system will be accessible from. For \
         Windows [MULTI_AZ_1] file system deployment types, provide exactly two subnet IDs, one \
         for the preferred file server and one for the standby file server. You specify one of \
         these subnets as the preferred subnet using the [WindowsConfiguration > \
         PreferredSubnetID] property.\n\n\
        \ Windows [SINGLE_AZ_1] and [SINGLE_AZ_2] file system deployment types, Lustre file \
         systems, and OpenZFS file systems provide exactly one subnet ID. The file server is \
         launched in that subnet's Availability Zone.\n\
        \ "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent creation. \
         This string is automatically filled on your behalf when you use the Command Line \
         Interface (CLI) or an Amazon Web Services SDK.\n"]
  backup_id : backup_id; [@ocaml.doc ""]
}
[@@ocaml.doc "The request object for the [CreateFileSystemFromBackup] operation.\n"]

type nonrec create_file_cache_response = {
  file_cache : file_cache_creating option;
      [@ocaml.doc "A description of the cache that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_file_cache_lustre_configuration = {
  metadata_configuration : file_cache_lustre_metadata_configuration;
      [@ocaml.doc "The configuration for a Lustre MDT (Metadata Target) storage volume.\n"]
  weekly_maintenance_start_time : weekly_time option; [@ocaml.doc ""]
  deployment_type : file_cache_lustre_deployment_type;
      [@ocaml.doc "Specifies the cache deployment type, which must be [CACHE_1].\n"]
  per_unit_storage_throughput : per_unit_storage_throughput;
      [@ocaml.doc
        "Provisions the amount of read and write throughput for each 1 tebibyte (TiB) of cache \
         storage capacity, in MB/s/TiB. The only supported value is [1000].\n"]
}
[@@ocaml.doc "The Amazon File Cache configuration for the cache that you are creating.\n"]

type nonrec create_file_cache_data_repository_associations =
  file_cache_data_repository_association list
[@@ocaml.doc ""]

type nonrec create_file_cache_request = {
  data_repository_associations : create_file_cache_data_repository_associations option;
      [@ocaml.doc
        "A list of up to 8 configurations for data repository associations (DRAs) to be created \
         during the cache creation. The DRAs link the cache to either an Amazon S3 data repository \
         or a Network File System (NFS) data repository that supports the NFSv3 protocol.\n\n\
        \ The DRA configurations must meet the following requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  All configurations on the list must be of the same data repository type, \
         either all S3 or all NFS. A cache can't link to different data repository types at the \
         same time.\n\
        \            \n\
        \             }\n\
        \        {-  An NFS DRA must link to an NFS file system that supports the NFSv3 protocol.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   DRA automatic import and automatic export is not supported.\n\
        \   "]
  lustre_configuration : create_file_cache_lustre_configuration option;
      [@ocaml.doc "The configuration for the Amazon File Cache resource being created.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "Specifies the ID of the Key Management Service (KMS) key to use for encrypting data on an \
         Amazon File Cache. If a [KmsKeyId] isn't specified, the Amazon FSx-managed KMS key for \
         your account is used. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html}Encrypt} in the \
         {i Key Management Service API Reference}.\n"]
  copy_tags_to_data_repository_associations : copy_tags_to_data_repository_associations option;
      [@ocaml.doc
        "A boolean flag indicating whether tags for the cache should be copied to data repository \
         associations. This value defaults to false.\n"]
  tags : tags option; [@ocaml.doc ""]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "A list of IDs specifying the security groups to apply to all network interfaces created \
         for Amazon File Cache access. This list isn't returned in later requests to describe the \
         cache.\n"]
  subnet_ids : subnet_ids; [@ocaml.doc ""]
  storage_capacity : storage_capacity;
      [@ocaml.doc
        "The storage capacity of the cache in gibibytes (GiB). Valid values are 1200 GiB, 2400 \
         GiB, and increments of 2400 GiB.\n"]
  file_cache_type_version : file_system_type_version;
      [@ocaml.doc
        "Sets the Lustre version for the cache that you're creating, which must be [2.12].\n"]
  file_cache_type : file_cache_type;
      [@ocaml.doc "The type of cache that you're creating, which must be [LUSTRE].\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "An idempotency token for resource creation, in a string of up to 63 ASCII characters. \
         This token is automatically filled on your behalf when you use the Command Line Interface \
         (CLI) or an Amazon Web Services SDK.\n\n\
        \ By using the idempotent operation, you can retry a [CreateFileCache] operation without \
         the risk of creating an extra cache. This approach can be useful when an initial call \
         fails in a way that makes it unclear whether a cache was created. Examples are if a \
         transport level timeout occurred, or your connection was reset. If you use the same \
         client request token and the initial call created a cache, the client receives success as \
         long as the parameters are the same.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_data_repository_task_response = {
  data_repository_task : data_repository_task option;
      [@ocaml.doc "The description of the data repository task that you just created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_repository_task_request = {
  release_configuration : release_configuration option;
      [@ocaml.doc
        "The configuration that specifies the last accessed time criteria for files that will be \
         released from an Amazon FSx for Lustre file system.\n"]
  capacity_to_release : capacity_to_release option;
      [@ocaml.doc
        "Specifies the amount of data to release, in GiB, by an Amazon File Cache \
         [AUTO_RELEASE_DATA] task that automatically releases files from the cache.\n"]
  tags : tags option; [@ocaml.doc ""]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  report : completion_report;
      [@ocaml.doc
        "Defines whether or not Amazon FSx provides a CompletionReport once the task has \
         completed. A CompletionReport provides a detailed report on the files that Amazon FSx \
         processed that meet the criteria specified by the [Scope] parameter. For more \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/task-completion-report.html}Working \
         with Task Completion Reports}.\n"]
  file_system_id : file_system_id; [@ocaml.doc ""]
  paths : data_repository_task_paths option;
      [@ocaml.doc
        "A list of paths for the data repository task to use when the task is processed. If a path \
         that you provide isn't valid, the task fails. If you don't provide paths, the default \
         behavior is to export all files to S3 (for export tasks), import all files from S3 (for \
         import tasks), or release all exported files that meet the last accessed time criteria \
         (for release tasks).\n\n\
        \ {ul\n\
        \       {-  For export tasks, the list contains paths on the FSx for Lustre file system \
         from which the files are exported to the Amazon S3 bucket. The default path is the file \
         system root directory. The paths you provide need to be relative to the mount point of \
         the file system. If the mount point is [/mnt/fsx] and [/mnt/fsx/path1] is a directory or \
         file on the file system you want to export, then the path to provide is [path1].\n\
        \           \n\
        \            }\n\
        \       {-  For import tasks, the list contains paths in the Amazon S3 bucket from which \
         POSIX metadata changes are imported to the FSx for Lustre file system. The path can be an \
         S3 bucket or prefix in the format [s3://bucket-name/prefix] (where [prefix] is optional).\n\
        \           \n\
        \            }\n\
        \       {-  For release tasks, the list contains directory or file paths on the FSx for \
         Lustre file system from which to release exported files. If a directory is specified, \
         files within the directory are released. If a file path is specified, only that file is \
         released. To release all exported files in the file system, specify a forward slash (/) \
         as the path.\n\
        \           \n\
        \             A file must also meet the last accessed time criteria specified in for the \
         file to be released.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  type_ : data_repository_task_type;
      [@ocaml.doc
        "Specifies the type of data repository task to create.\n\n\
        \ {ul\n\
        \       {-   [EXPORT_TO_REPOSITORY] tasks export from your Amazon FSx for Lustre file \
         system to a linked data repository.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPORT_METADATA_FROM_REPOSITORY] tasks import metadata changes from a linked \
         S3 bucket to your Amazon FSx for Lustre file system.\n\
        \           \n\
        \            }\n\
        \       {-   [RELEASE_DATA_FROM_FILESYSTEM] tasks release files in your Amazon FSx for \
         Lustre file system that have been exported to a linked S3 bucket and that meet your \
         specified release criteria.\n\
        \           \n\
        \            }\n\
        \       {-   [AUTO_RELEASE_DATA] tasks automatically release files from an Amazon File \
         Cache resource.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_data_repository_association_response = {
  association : data_repository_association option;
      [@ocaml.doc
        "The response object returned after the data repository association is created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_repository_association_request = {
  tags : tags option; [@ocaml.doc ""]
  client_request_token : client_request_token option; [@ocaml.doc ""]
  s3 : s3_data_repository_configuration option;
      [@ocaml.doc
        "The configuration for an Amazon S3 data repository linked to an Amazon FSx Lustre file \
         system with a data repository association. The configuration defines which file events \
         (new, changed, or deleted files or directories) are automatically imported from the \
         linked data repository to the file system or automatically exported from the file system \
         to the data repository.\n"]
  imported_file_chunk_size : megabytes option;
      [@ocaml.doc
        "For files imported from a data repository, this value determines the stripe count and \
         maximum amount of data per file (in MiB) stored on a single physical disk. The maximum \
         number of disks that a single file can be striped across is limited by the total number \
         of disks that make up the file system.\n\n\
        \ The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). \
         Amazon S3 objects have a maximum size of 5 TB.\n\
        \ "]
  batch_import_meta_data_on_create : batch_import_meta_data_on_create option;
      [@ocaml.doc
        "Set to [true] to run an import data repository task to import metadata from the data \
         repository to the file system after the data repository association is created. Default \
         is [false].\n"]
  data_repository_path : archive_path;
      [@ocaml.doc
        "The path to the Amazon S3 data repository that will be linked to the file system. The \
         path can be an S3 bucket or prefix in the format [s3://bucket-name/prefix/] (where \
         [prefix] is optional). This path specifies where in the S3 data repository files will be \
         imported from or exported to.\n"]
  file_system_path : namespace option;
      [@ocaml.doc
        "A path on the file system that points to a high-level directory (such as [/ns1/]) or \
         subdirectory (such as [/ns1/subdir/]) that will be mapped 1-1 with [DataRepositoryPath]. \
         The leading forward slash in the name is required. Two data repository associations \
         cannot have overlapping file system paths. For example, if a data repository is \
         associated with file system path [/ns1/], then you cannot link another data repository \
         with file system path [/ns1/ns2].\n\n\
        \ This path specifies where in your file system files will be exported from or imported \
         to. This file system directory can be linked to only one Amazon S3 bucket, and no other \
         S3 bucket can be linked to the directory.\n\
        \ \n\
        \   If you specify only a forward slash ([/]) as the file system path, you can link only \
         one data repository to the file system. You can only specify \"/\" as the file system \
         path for the first data repository associated with a file system.\n\
        \   \n\
        \    "]
  file_system_id : file_system_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_backup_response = {
  backup : backup option; [@ocaml.doc "A description of the backup.\n"]
}
[@@ocaml.doc "The response object for the [CreateBackup] operation.\n"]

type nonrec create_backup_request = {
  volume_id : volume_id option;
      [@ocaml.doc "(Optional) The ID of the FSx for ONTAP volume to back up.\n"]
  tags : tags option;
      [@ocaml.doc
        "(Optional) The tags to apply to the backup at backup creation. The key value of the \
         [Name] tag appears in the console as the backup name. If you have set [CopyTagsToBackups] \
         to [true], and you specify one or more tags using the [CreateBackup] operation, no \
         existing file system tags are copied from the file system to the backup.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "(Optional) A string of up to 63 ASCII characters that Amazon FSx uses to ensure \
         idempotent creation. This string is automatically filled on your behalf when you use the \
         Command Line Interface (CLI) or an Amazon Web Services SDK.\n"]
  file_system_id : file_system_id option; [@ocaml.doc "The ID of the file system to back up.\n"]
}
[@@ocaml.doc "The request object for the [CreateBackup] operation.\n"]

type nonrec access_point_policy = string [@@ocaml.doc ""]

type nonrec create_and_attach_s3_access_point_s3_configuration = {
  policy : access_point_policy option;
      [@ocaml.doc
        "Specifies an access policy to associate with the S3 access point configuration. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-policies.html}Configuring \
         IAM policies for using access points} in the Amazon Simple Storage Service User Guide.\n"]
  vpc_configuration : s3_access_point_vpc_configuration option;
      [@ocaml.doc
        "If included, Amazon S3 restricts access to this S3 access point to requests made from the \
         specified virtual private cloud (VPC).\n"]
}
[@@ocaml.doc
  "Used to create an S3 access point that accepts requests only from a virtual private cloud (VPC) \
   to restrict data access to a private network.\n"]

type nonrec create_and_attach_s3_access_point_response = {
  s3_access_point_attachment : s3_access_point_attachment option;
      [@ocaml.doc "Describes the configuration of the S3 access point created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_and_attach_s3_access_point_open_zfs_configuration = {
  file_system_identity : open_zfs_file_system_identity;
      [@ocaml.doc
        "Specifies the file system user identity to use for authorizing file read and write \
         requests that are made using this S3 access point.\n"]
  volume_id : volume_id;
      [@ocaml.doc
        "The ID of the FSx for OpenZFS volume to which you want the S3 access point attached.\n"]
}
[@@ocaml.doc
  "Specifies the FSx for OpenZFS volume that the S3 access point will be attached to, and the file \
   system user identity.\n"]

type nonrec create_and_attach_s3_access_point_ontap_configuration = {
  file_system_identity : ontap_file_system_identity;
      [@ocaml.doc
        "Specifies the file system user identity to use for authorizing file read and write \
         requests that are made using this S3 access point.\n"]
  volume_id : volume_id;
      [@ocaml.doc
        "The ID of the FSx for ONTAP volume to which you want the S3 access point attached.\n"]
}
[@@ocaml.doc
  "Specifies the FSx for ONTAP volume that the S3 access point will be attached to, and the file \
   system user identity.\n"]

type nonrec create_and_attach_s3_access_point_request = {
  s3_access_point : create_and_attach_s3_access_point_s3_configuration option;
      [@ocaml.doc
        "Specifies the virtual private cloud (VPC) configuration if you're creating an access \
         point that is restricted to a VPC. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/access-points-vpc.html}Creating \
         access points restricted to a virtual private cloud}.\n"]
  ontap_configuration : create_and_attach_s3_access_point_ontap_configuration option;
      [@ocaml.doc ""]
  open_zfs_configuration : create_and_attach_s3_access_point_open_zfs_configuration option;
      [@ocaml.doc
        "Specifies the configuration to use when creating and attaching an S3 access point to an \
         FSx for OpenZFS volume.\n"]
  type_ : s3_access_point_attachment_type;
      [@ocaml.doc "The type of S3 access point you want to create. Only [OpenZFS] is supported.\n"]
  name : s3_access_point_attachment_name;
      [@ocaml.doc "The name you want to assign to this S3 access point.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec access_point_already_owned_by_you = {
  message : error_message option; [@ocaml.doc ""]
  error_code : error_code option;
      [@ocaml.doc
        "An error code indicating that an access point with that name already exists in the Amazon \
         Web Services Region in your Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "An access point with that name already exists in the Amazon Web Services Region in your Amazon \
   Web Services account.\n"]

type nonrec copy_snapshot_and_update_volume_response = {
  administrative_actions : administrative_actions option;
      [@ocaml.doc
        "A list of administrative actions for the file system that are in process or waiting to be \
         processed. Administrative actions describe changes to the Amazon FSx system.\n"]
  lifecycle : volume_lifecycle option;
      [@ocaml.doc "The lifecycle state of the destination volume. \n"]
  volume_id : volume_id option;
      [@ocaml.doc "The ID of the volume that you copied the snapshot to.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_snapshot_and_update_volume_request = {
  options : update_open_zfs_volume_options option;
      [@ocaml.doc
        "Confirms that you want to delete data on the destination volume that wasn\226\128\153t \
         there during the previous snapshot replication.\n\n\
        \ Your replication will fail if you don\226\128\153t include an option for a specific type \
         of data and that data is on your destination. For example, if you don\226\128\153t \
         include [DELETE_INTERMEDIATE_SNAPSHOTS] and there are intermediate snapshots on the \
         destination, you can\226\128\153t copy the snapshot.\n\
        \ \n\
        \  {ul\n\
        \        {-   [DELETE_INTERMEDIATE_SNAPSHOTS] - Deletes snapshots on the destination \
         volume that aren\226\128\153t on the source volume.\n\
        \            \n\
        \             }\n\
        \        {-   [DELETE_CLONED_VOLUMES] - Deletes snapshot clones on the destination volume \
         that aren't on the source volume.\n\
        \            \n\
        \             }\n\
        \        {-   [DELETE_INTERMEDIATE_DATA] - Overwrites snapshots on the destination volume \
         that don\226\128\153t match the source snapshot that you\226\128\153re copying.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  copy_strategy : open_zfs_copy_strategy option;
      [@ocaml.doc
        "Specifies the strategy to use when copying data from a snapshot to the volume. \n\n\
        \ {ul\n\
        \       {-   [FULL_COPY] - Copies all data from the snapshot to the volume. \n\
        \           \n\
        \            }\n\
        \       {-   [INCREMENTAL_COPY] - Copies only the snapshot data that's changed since the \
         previous replication.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \     [CLONE] isn't a valid copy strategy option for the [CopySnapshotAndUpdateVolume] \
         operation.\n\
        \    \n\
        \     "]
  source_snapshot_ar_n : resource_ar_n; [@ocaml.doc ""]
  volume_id : volume_id;
      [@ocaml.doc "Specifies the ID of the volume that you are copying the snapshot to.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_backup_response = { backup : backup option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec copy_backup_request = {
  tags : tags option; [@ocaml.doc ""]
  copy_tags : flag option;
      [@ocaml.doc
        "A Boolean flag indicating whether tags from the source backup should be copied to the \
         backup copy. This value defaults to [false].\n\n\
        \ If you set [CopyTags] to [true] and the source backup has existing tags, you can use the \
         [Tags] parameter to create new tags, provided that the sum of the source backup tags and \
         the new tags doesn't exceed 50. Both sets of tags are merged. If there are tag conflicts \
         (for example, two tags with the same key but different values), the tags created with the \
         [Tags] parameter take precedence.\n\
        \ "]
  kms_key_id : kms_key_id option; [@ocaml.doc ""]
  source_region : region option;
      [@ocaml.doc
        "The source Amazon Web Services Region of the backup. Specifies the Amazon Web Services \
         Region from which the backup is being copied. The source and destination Regions must be \
         in the same Amazon Web Services partition. If you don't specify a Region, [SourceRegion] \
         defaults to the Region where the request is sent from (in-Region copy).\n"]
  source_backup_id : source_backup_id;
      [@ocaml.doc
        "The ID of the source backup. Specifies the ID of the backup that's being copied.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec cancel_data_repository_task_response = {
  task_id : task_id option; [@ocaml.doc "The ID of the task being canceled.\n"]
  lifecycle : data_repository_task_lifecycle option;
      [@ocaml.doc
        "The lifecycle status of the data repository task, as follows:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon FSx has not started the task.\n\
        \           \n\
        \            }\n\
        \       {-   [EXECUTING] - Amazon FSx is processing the task.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon FSx was not able to complete the task. For example, there \
         may be files the task failed to process. The [DataRepositoryTaskFailureDetails] property \
         provides more information about task failures.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED] - FSx completed the task successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELED] - Amazon FSx canceled the task and it did not complete.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELING] - FSx is in process of canceling the task.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec cancel_data_repository_task_request = {
  task_id : task_id; [@ocaml.doc "Specifies the data repository task to cancel.\n"]
}
[@@ocaml.doc "Cancels a data repository task.\n"]

type nonrec associate_file_system_aliases_response = {
  aliases : aliases option;
      [@ocaml.doc
        "An array of the DNS aliases that Amazon FSx is associating with the file system.\n"]
}
[@@ocaml.doc
  "The system generated response showing the DNS aliases that Amazon FSx is attempting to \
   associate with the file system. Use the API operation to monitor the status of the aliases \
   Amazon FSx is associating with the file system. It can take up to 2.5 minutes for the alias \
   status to change from [CREATING] to [AVAILABLE]. \n"]

type nonrec associate_file_system_aliases_request = {
  aliases : alternate_dns_names;
      [@ocaml.doc
        "An array of one or more DNS alias names to associate with the file system. The alias name \
         has to comply with the following formatting requirements:\n\n\
        \ {ul\n\
        \       {-  Formatted as a fully-qualified domain name (FQDN), {i  [hostname.domain] }, \
         for example, [accounting.corp.example.com].\n\
        \           \n\
        \            }\n\
        \       {-  Can contain alphanumeric characters and the hyphen (-).\n\
        \           \n\
        \            }\n\
        \       {-  Cannot start or end with a hyphen.\n\
        \           \n\
        \            }\n\
        \       {-  Can start with a numeric.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For DNS alias names, Amazon FSx stores alphabetic characters as lowercase letters \
         (a-z), regardless of how you specify them: as uppercase letters, lowercase letters, or \
         the corresponding letters in escape codes.\n\
        \   "]
  file_system_id : file_system_id;
      [@ocaml.doc
        "Specifies the file system with which you want to associate one or more DNS aliases.\n"]
  client_request_token : client_request_token option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request object specifying one or more DNS alias names to associate with an Amazon FSx for \
   Windows File Server file system.\n"]
