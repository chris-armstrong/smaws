type nonrec error_message = string [@@ocaml.doc ""]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_key_list : tag_key_list;
      [@ocaml.doc
        "A list of one or more tag keys for the tags that you are removing. Specify only the tag \
         keys, not the tag values.\n"]
  resource_id : resource_id;
      [@ocaml.doc
        "The cluster identifier (ID) for the cluster whose tags you are removing. To find the \
         cluster ID, use [DescribeClusters].\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_hsm_tag_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because of a tagging failure. Verify the tag conditions in all \
   applicable policies, and then retry the request.\n"]

type nonrec cloud_hsm_service_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request was rejected because an error occurred.\n"]

type nonrec cloud_hsm_resource_not_found_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because it refers to a resource that cannot be found.\n"]

type nonrec cloud_hsm_invalid_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request was rejected because it is not a valid request.\n"]

type nonrec cloud_hsm_internal_failure_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because of an CloudHSM internal failure. The request can be retried.\n"]

type nonrec cloud_hsm_access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because the requester does not have permission to perform the \
   requested operation.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
}
[@@ocaml.doc "Contains a tag. A tag is a key-value pair.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tag_list : tag_list; [@ocaml.doc "A list of one or more tags.\n"]
  resource_id : resource_id;
      [@ocaml.doc
        "The cluster identifier (ID) for the cluster that you are tagging. To find the cluster ID, \
         use [DescribeClusters].\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_hsm_resource_limit_exceeded_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because it exceeds an CloudHSM limit.\n"]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnet_ids = subnet_id list [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec strings = string_ list [@@ocaml.doc ""]

type nonrec state_message = string [@@ocaml.doc ""]

type nonrec security_group = string [@@ocaml.doc ""]

type nonrec backup_id = string [@@ocaml.doc ""]

type nonrec backup_arn = string [@@ocaml.doc ""]

type nonrec backup_state =
  | PENDING_DELETION [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_id = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec hsm_type = string [@@ocaml.doc ""]

type nonrec cluster_mode = NON_FIPS [@ocaml.doc ""] | FIPS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec backup = {
  mode : cluster_mode option; [@ocaml.doc "The mode of the cluster that was backed up.\n"]
  hsm_type : hsm_type option; [@ocaml.doc "The HSM type used to create the backup.\n"]
  tag_list : tag_list option; [@ocaml.doc "The list of tags for the backup.\n"]
  delete_timestamp : timestamp option;
      [@ocaml.doc "The date and time when the backup will be permanently deleted.\n"]
  source_cluster : cluster_id option;
      [@ocaml.doc
        "The identifier (ID) of the cluster containing the source backup from which the new backup \
         was copied.\n"]
  source_backup : backup_id option;
      [@ocaml.doc
        "The identifier (ID) of the source backup from which the new backup was copied.\n"]
  source_region : region option;
      [@ocaml.doc
        "The AWS Region that contains the source backup from which the new backup was copied.\n"]
  never_expires : boolean_ option;
      [@ocaml.doc
        "Specifies whether the service should exempt a backup from the retention policy for the \
         cluster. [True] exempts a backup from the retention policy. [False] means the service \
         applies the backup retention policy defined at the cluster.\n"]
  copy_timestamp : timestamp option;
      [@ocaml.doc "The date and time when the backup was copied from a source backup.\n"]
  create_timestamp : timestamp option;
      [@ocaml.doc "The date and time when the backup was created.\n"]
  cluster_id : cluster_id option;
      [@ocaml.doc "The identifier (ID) of the cluster that was backed up.\n"]
  backup_state : backup_state option; [@ocaml.doc "The state of the backup.\n"]
  backup_arn : backup_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the backup.\n"]
  backup_id : backup_id; [@ocaml.doc "The identifier (ID) of the backup.\n"]
}
[@@ocaml.doc
  "Contains information about a backup of an CloudHSM cluster. All backup objects contain the \
   [BackupId], [BackupState], [ClusterId], and [CreateTimestamp] parameters. Backups that were \
   copied into a destination region additionally contain the [CopyTimestamp], [SourceBackup], \
   [SourceCluster], and [SourceRegion] parameters. A backup that is pending deletion will include \
   the [DeleteTimestamp] parameter.\n"]

type nonrec restore_backup_response = {
  backup : backup option; [@ocaml.doc "Information on the [Backup] object created.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_backup_request = {
  backup_id : backup_id;
      [@ocaml.doc
        "The ID of the backup to be restored. To find the ID of a backup, use the \
         [DescribeBackups] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_policy = string [@@ocaml.doc ""]

type nonrec cloud_hsm_arn = string [@@ocaml.doc ""]

type nonrec put_resource_policy_response = {
  policy : resource_policy option; [@ocaml.doc "The policy attached to a resource.\n"]
  resource_arn : cloud_hsm_arn option;
      [@ocaml.doc "Amazon Resource Name (ARN) of the resource to which a policy is attached.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  policy : resource_policy option;
      [@ocaml.doc
        "The policy you want to associate with a resource. \n\n\
        \ For an example policy, see \
         {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/sharing.html} Working with \
         shared backups} in the CloudHSM User Guide\n\
        \ "]
  resource_arn : cloud_hsm_arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the resource to which you want to attach a policy. \n"]
}
[@@ocaml.doc ""]

type nonrec pre_co_password = string [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec network_type = DUALSTACK [@ocaml.doc ""] | IPV4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec backup_policy = DEFAULT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec backup_retention_type = DAYS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec backup_retention_value = string [@@ocaml.doc ""]

type nonrec backup_retention_policy = {
  value : backup_retention_value option; [@ocaml.doc "Use a value between 7 - 379.\n"]
  type_ : backup_retention_type option;
      [@ocaml.doc
        "The type of backup retention policy. For the [DAYS] type, the value is the number of days \
         to retain backups.\n"]
}
[@@ocaml.doc "A policy that defines the number of days to retain backups.\n"]

type nonrec external_az = string [@@ocaml.doc ""]

type nonrec eni_id = string [@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec ip_v6_address = string [@@ocaml.doc ""]

type nonrec hsm_id = string [@@ocaml.doc ""]

type nonrec hsm_state =
  | DELETED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DEGRADED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hsm = {
  state_message : string_ option; [@ocaml.doc "A description of the HSM's state.\n"]
  state : hsm_state option; [@ocaml.doc "The HSM's state.\n"]
  hsm_type : hsm_type option; [@ocaml.doc "The type of HSM.\n"]
  hsm_id : hsm_id; [@ocaml.doc "The HSM's identifier (ID).\n"]
  eni_ip_v6 : ip_v6_address option;
      [@ocaml.doc "The IPv6 address (if any) of the HSM's elastic network interface (ENI).\n"]
  eni_ip : ip_address option;
      [@ocaml.doc "The IP address of the HSM's elastic network interface (ENI).\n"]
  eni_id : eni_id option;
      [@ocaml.doc "The identifier (ID) of the HSM's elastic network interface (ENI).\n"]
  subnet_id : subnet_id option;
      [@ocaml.doc "The subnet that contains the HSM's elastic network interface (ENI).\n"]
  cluster_id : cluster_id option;
      [@ocaml.doc "The identifier (ID) of the cluster that contains the HSM.\n"]
  availability_zone : external_az option;
      [@ocaml.doc "The Availability Zone that contains the HSM.\n"]
}
[@@ocaml.doc
  "Contains information about a hardware security module (HSM) in an CloudHSM cluster.\n"]

type nonrec hsms = hsm list [@@ocaml.doc ""]

type nonrec cluster_state =
  | DEGRADED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | MODIFY_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | INITIALIZED [@ocaml.doc ""]
  | INITIALIZE_IN_PROGRESS [@ocaml.doc ""]
  | UNINITIALIZED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec external_subnet_mapping = (external_az * subnet_id) list [@@ocaml.doc ""]

type nonrec cert = string [@@ocaml.doc ""]

type nonrec certificates = {
  cluster_certificate : cert option;
      [@ocaml.doc
        "The cluster certificate issued (signed) by the issuing certificate authority (CA) of the \
         cluster's owner.\n"]
  manufacturer_hardware_certificate : cert option;
      [@ocaml.doc "The HSM hardware certificate issued (signed) by the hardware manufacturer.\n"]
  aws_hardware_certificate : cert option;
      [@ocaml.doc "The HSM hardware certificate issued (signed) by CloudHSM.\n"]
  hsm_certificate : cert option;
      [@ocaml.doc "The HSM certificate issued (signed) by the HSM hardware.\n"]
  cluster_csr : cert option;
      [@ocaml.doc
        "The cluster's certificate signing request (CSR). The CSR exists only when the cluster's \
         state is [UNINITIALIZED].\n"]
}
[@@ocaml.doc "Contains one or more certificates or a certificate signing request (CSR).\n"]

type nonrec cluster = {
  mode : cluster_mode option; [@ocaml.doc "The mode of the cluster.\n"]
  tag_list : tag_list option; [@ocaml.doc "The list of tags for the cluster.\n"]
  certificates : certificates option;
      [@ocaml.doc "Contains one or more certificates or a certificate signing request (CSR).\n"]
  network_type : network_type option;
      [@ocaml.doc
        "The cluster's NetworkType can be IPv4 (the default) or DUALSTACK. The IPv4 NetworkType \
         restricts communication between your application and the hardware security modules (HSMs) \
         to the IPv4 protocol only. The DUALSTACK NetworkType enables communication over both IPv4 \
         and IPv6 protocols. To use DUALSTACK, configure your virtual private cloud (VPC) and \
         subnets to support both IPv4 and IPv6. This configuration involves adding IPv6 Classless \
         Inter-Domain Routing (CIDR) blocks to the existing IPv4 CIDR blocks in your subnets. The \
         NetworkType you choose affects the network addressing options for your cluster. DUALSTACK \
         provides more flexibility by supporting both IPv4 and IPv6 communication.\n"]
  vpc_id : vpc_id option;
      [@ocaml.doc
        "The identifier (ID) of the virtual private cloud (VPC) that contains the cluster.\n"]
  subnet_mapping : external_subnet_mapping option;
      [@ocaml.doc
        "A map from availability zone to the cluster\226\128\153s subnet in that availability zone.\n"]
  state_message : state_message option; [@ocaml.doc "A description of the cluster's state.\n"]
  state : cluster_state option; [@ocaml.doc "The cluster's state.\n"]
  source_backup_id : backup_id option;
      [@ocaml.doc
        "The identifier (ID) of the backup used to create the cluster. This value exists only when \
         the cluster was created from a backup.\n"]
  security_group : security_group option;
      [@ocaml.doc "The identifier (ID) of the cluster's security group.\n"]
  pre_co_password : pre_co_password option;
      [@ocaml.doc "The default password for the cluster's Pre-Crypto Officer (PRECO) user.\n"]
  hsm_type_rollback_expiration : timestamp option;
      [@ocaml.doc
        "The timestamp until when the cluster can be rolled back to its original HSM type.\n"]
  hsm_type : hsm_type option; [@ocaml.doc "The type of HSM that the cluster contains.\n"]
  hsms : hsms option; [@ocaml.doc "Contains information about the HSMs in the cluster.\n"]
  create_timestamp : timestamp option;
      [@ocaml.doc "The date and time when the cluster was created.\n"]
  cluster_id : cluster_id option; [@ocaml.doc "The cluster's identifier (ID).\n"]
  backup_retention_policy : backup_retention_policy option;
      [@ocaml.doc "A policy that defines how the service retains backups.\n"]
  backup_policy : backup_policy option; [@ocaml.doc "The cluster's backup policy.\n"]
}
[@@ocaml.doc "Contains information about an CloudHSM cluster.\n"]

type nonrec modify_cluster_response = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec modify_cluster_request = {
  cluster_id : cluster_id;
      [@ocaml.doc
        "The identifier (ID) of the cluster that you want to modify. To find the cluster ID, use \
         [DescribeClusters].\n"]
  backup_retention_policy : backup_retention_policy option;
      [@ocaml.doc "A policy that defines how the service retains backups.\n"]
  hsm_type : hsm_type option; [@ocaml.doc "The desired HSM type of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_backup_attributes_response = { backup : backup option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_backup_attributes_request = {
  never_expires : boolean_;
      [@ocaml.doc
        "Specifies whether the service should exempt a backup from the retention policy for the \
         cluster. [True] exempts a backup from the retention policy. [False] means the service \
         applies the backup retention policy defined at the cluster.\n"]
  backup_id : backup_id;
      [@ocaml.doc
        "The identifier (ID) of the backup to modify. To find the ID of a backup, use the \
         [DescribeBackups] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec max_size = int [@@ocaml.doc ""]

type nonrec list_tags_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates that the response contains only a subset of tags. Use \
         this value in a subsequent [ListTags] request to get more tags.\n"]
  tag_list : tag_list; [@ocaml.doc "A list of tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_request = {
  max_results : max_size option;
      [@ocaml.doc
        "The maximum number of tags to return in the response. When there are more tags than the \
         number you specify, the response contains a [NextToken] value.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [NextToken] value that you received in the previous response. Use this value to get \
         more tags.\n"]
  resource_id : resource_id;
      [@ocaml.doc
        "The cluster identifier (ID) for the cluster whose tags you are getting. To find the \
         cluster ID, use [DescribeClusters].\n"]
}
[@@ocaml.doc ""]

type nonrec initialize_cluster_response = {
  state_message : state_message option; [@ocaml.doc "A description of the cluster's state.\n"]
  state : cluster_state option; [@ocaml.doc "The cluster's state.\n"]
}
[@@ocaml.doc ""]

type nonrec initialize_cluster_request = {
  trust_anchor : cert;
      [@ocaml.doc
        "The issuing certificate of the issuing certificate authority (CA) that issued (signed) \
         the cluster certificate. You must use a self-signed certificate. The certificate used to \
         sign the HSM CSR must be directly available, and thus must be the root certificate. The \
         certificate must be in PEM format and can contain a maximum of 5000 characters.\n"]
  signed_cert : cert;
      [@ocaml.doc
        "The cluster certificate issued (signed) by your issuing certificate authority (CA). The \
         certificate must be in PEM format and can contain a maximum of 5000 characters.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "The identifier (ID) of the cluster that you are claiming. To find the cluster ID, use \
         [DescribeClusters].\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_response = {
  policy : resource_policy option; [@ocaml.doc "The policy attached to a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  resource_arn : cloud_hsm_arn option;
      [@ocaml.doc "Amazon Resource Name (ARN) of the resource to which a policy is attached.\n"]
}
[@@ocaml.doc ""]

type nonrec field = string [@@ocaml.doc ""]

type nonrec filters = (field * strings) list [@@ocaml.doc ""]

type nonrec destination_backup = {
  source_cluster : cluster_id option;
      [@ocaml.doc
        "The identifier (ID) of the cluster containing the source backup from which the new backup \
         was copied.\n"]
  source_backup : backup_id option;
      [@ocaml.doc
        "The identifier (ID) of the source backup from which the new backup was copied.\n"]
  source_region : region option;
      [@ocaml.doc
        "The AWS region that contains the source backup from which the new backup was copied.\n"]
  create_timestamp : timestamp option;
      [@ocaml.doc "The date and time when both the source backup was created.\n"]
}
[@@ocaml.doc
  "Contains information about the backup that will be copied and created by the \
   [CopyBackupToRegion] operation.\n"]

type nonrec clusters = cluster list [@@ocaml.doc ""]

type nonrec describe_clusters_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates that the response contains only a subset of clusters. Use \
         this value in a subsequent [DescribeClusters] request to get more clusters.\n"]
  clusters : clusters option; [@ocaml.doc "A list of clusters.\n"]
}
[@@ocaml.doc ""]

type nonrec clusters_max_size = int [@@ocaml.doc ""]

type nonrec describe_clusters_request = {
  max_results : clusters_max_size option;
      [@ocaml.doc
        "The maximum number of clusters to return in the response. When there are more clusters \
         than the number you specify, the response contains a [NextToken] value.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [NextToken] value that you received in the previous response. Use this value to get \
         more clusters.\n"]
  filters : filters option;
      [@ocaml.doc
        "One or more filters to limit the items returned in the response.\n\n\
        \ Use the [clusterIds] filter to return only the specified clusters. Specify clusters by \
         their cluster identifier (ID).\n\
        \ \n\
        \  Use the [vpcIds] filter to return only the clusters in the specified virtual private \
         clouds (VPCs). Specify VPCs by their VPC identifier (ID).\n\
        \  \n\
        \   Use the [states] filter to return only clusters that match the specified state.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec backups = backup list [@@ocaml.doc ""]

type nonrec describe_backups_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates that the response contains only a subset of backups. Use \
         this value in a subsequent [DescribeBackups] request to get more backups.\n"]
  backups : backups option; [@ocaml.doc "A list of backups.\n"]
}
[@@ocaml.doc ""]

type nonrec backups_max_size = int [@@ocaml.doc ""]

type nonrec describe_backups_request = {
  sort_ascending : boolean_ option;
      [@ocaml.doc
        "Designates whether or not to sort the return backups by ascending chronological order of \
         generation.\n"]
  shared : boolean_ option;
      [@ocaml.doc
        "Describe backups that are shared with you.\n\n\
        \  By default when using this option, the command returns backups that have been shared \
         using a standard Resource Access Manager resource share. In order for a backup that was \
         shared using the PutResourcePolicy command to be returned, the share must be promoted to \
         a standard resource share using the RAM \
         {{:https://docs.aws.amazon.com/cli/latest/reference/ram/promote-resource-share-created-from-policy.html}PromoteResourceShareCreatedFromPolicy} \
         API operation. For more information about sharing backups, see \
         {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/sharing.html} Working with \
         shared backups} in the CloudHSM User Guide.\n\
        \  \n\
        \   "]
  filters : filters option;
      [@ocaml.doc
        "One or more filters to limit the items returned in the response.\n\n\
        \ Use the [backupIds] filter to return only the specified backups. Specify backups by \
         their backup identifier (ID).\n\
        \ \n\
        \  Use the [sourceBackupIds] filter to return only the backups created from a source \
         backup. The [sourceBackupID] of a source backup is returned by the [CopyBackupToRegion] \
         operation.\n\
        \  \n\
        \   Use the [clusterIds] filter to return only the backups for the specified clusters. \
         Specify clusters by their cluster identifier (ID).\n\
        \   \n\
        \    Use the [states] filter to return only backups that match the specified state.\n\
        \    \n\
        \     Use the [neverExpires] filter to return backups filtered by the value in the \
         [neverExpires] parameter. [True] returns all backups exempt from the backup retention \
         policy. [False] returns all backups with a backup retention policy defined at the cluster.\n\
        \     "]
  max_results : backups_max_size option;
      [@ocaml.doc
        "The maximum number of backups to return in the response. When there are more backups than \
         the number you specify, the response contains a [NextToken] value.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [NextToken] value that you received in the previous response. Use this value to get \
         more backups.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_response = {
  policy : resource_policy option; [@ocaml.doc "The policy previously attached to the resource.\n"]
  resource_arn : cloud_hsm_arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the resource from which the policy was deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  resource_arn : cloud_hsm_arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the resource from which the policy will be removed. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_hsm_response = {
  hsm_id : hsm_id option; [@ocaml.doc "The identifier (ID) of the HSM that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_hsm_request = {
  eni_ip : ip_address option;
      [@ocaml.doc
        "The IP address of the elastic network interface (ENI) of the HSM that you are deleting.\n"]
  eni_id : eni_id option;
      [@ocaml.doc
        "The identifier (ID) of the elastic network interface (ENI) of the HSM that you are \
         deleting.\n"]
  hsm_id : hsm_id option; [@ocaml.doc "The identifier (ID) of the HSM that you are deleting.\n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "The identifier (ID) of the cluster that contains the HSM that you are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_response = {
  cluster : cluster option; [@ocaml.doc "Information about the cluster that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_request = {
  cluster_id : cluster_id;
      [@ocaml.doc
        "The identifier (ID) of the cluster that you are deleting. To find the cluster ID, use \
         [DescribeClusters].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_backup_response = {
  backup : backup option; [@ocaml.doc "Information on the [Backup] object deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_backup_request = {
  backup_id : backup_id;
      [@ocaml.doc
        "The ID of the backup to be deleted. To find the ID of a backup, use the [DescribeBackups] \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_hsm_response = {
  hsm : hsm option; [@ocaml.doc "Information about the HSM that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_hsm_request = {
  ip_address : ip_address option;
      [@ocaml.doc
        "The HSM's IP address. If you specify an IP address, use an available address from the \
         subnet that maps to the Availability Zone where you are creating the HSM. If you don't \
         specify an IP address, one is chosen for you from that subnet.\n"]
  availability_zone : external_az;
      [@ocaml.doc
        "The Availability Zone where you are creating the HSM. To find the cluster's Availability \
         Zones, use [DescribeClusters].\n"]
  cluster_id : cluster_id;
      [@ocaml.doc
        "The identifier (ID) of the HSM's cluster. To find the cluster ID, use [DescribeClusters].\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_response = {
  cluster : cluster option; [@ocaml.doc "Information about the cluster that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_request = {
  mode : cluster_mode option;
      [@ocaml.doc "The mode to use in the cluster. The allowed values are [FIPS] and [NON_FIPS].\n"]
  tag_list : tag_list option;
      [@ocaml.doc "Tags to apply to the CloudHSM cluster during creation.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "The NetworkType to create a cluster with. The allowed values are [IPV4] and [DUALSTACK]. \n"]
  subnet_ids : subnet_ids;
      [@ocaml.doc
        "The identifiers (IDs) of the subnets where you are creating the cluster. You must specify \
         at least one subnet. If you specify multiple subnets, they must meet the following \
         criteria:\n\n\
        \ {ul\n\
        \       {-  All subnets must be in the same virtual private cloud (VPC).\n\
        \           \n\
        \            }\n\
        \       {-  You can specify only one subnet per Availability Zone.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  source_backup_id : backup_arn option;
      [@ocaml.doc
        "The identifier (ID) or the Amazon Resource Name (ARN) of the cluster backup to restore. \
         Use this value to restore the cluster from a backup instead of creating a new cluster. To \
         find the backup ID or ARN, use [DescribeBackups]. {i If using a backup in another \
         account, the full ARN must be supplied.} \n"]
  hsm_type : hsm_type;
      [@ocaml.doc
        "The type of HSM to use in the cluster. The allowed values are [hsm1.medium] and \
         [hsm2m.medium].\n"]
  backup_retention_policy : backup_retention_policy option;
      [@ocaml.doc "A policy that defines how the service retains backups.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_backup_to_region_response = {
  destination_backup : destination_backup option;
      [@ocaml.doc
        "Information on the backup that will be copied to the destination region, including \
         CreateTimestamp, SourceBackup, SourceCluster, and Source Region. CreateTimestamp of the \
         destination backup will be the same as that of the source backup.\n\n\
        \ You will need to use the [sourceBackupID] returned in this operation to use the \
         [DescribeBackups] operation on the backup that will be copied to the destination region.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec copy_backup_to_region_request = {
  tag_list : tag_list option;
      [@ocaml.doc
        "Tags to apply to the destination backup during creation. If you specify tags, only these \
         tags will be applied to the destination backup. If you do not specify tags, the service \
         copies tags from the source backup to the destination backup.\n"]
  backup_id : backup_id;
      [@ocaml.doc "The ID of the backup that will be copied to the destination region. \n"]
  destination_region : region;
      [@ocaml.doc "The AWS region that will contain your copied CloudHSM cluster backup.\n"]
}
[@@ocaml.doc ""]
