open Types

module AssociateFileSystemAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_file_system_aliases_request ->
    ( associate_file_system_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_file_system_aliases_request ->
    ( associate_file_system_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this action to associate one or more Domain Name Server (DNS) aliases with an existing \
   Amazon FSx for Windows File Server file system. A file system can have a maximum of 50 DNS \
   aliases associated with it at any one time. If you try to associate a DNS alias that is already \
   associated with the file system, FSx takes no action on that alias in the request. For more \
   information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html}Working with \
   DNS Aliases} and \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/walkthrough05-file-system-custom-CNAME.html}Walkthrough \
   5: Using DNS aliases to access your file system}, including additional steps you must take to \
   be able to access your file system using a DNS alias.\n\n\
  \ The system response shows the DNS aliases that Amazon FSx is attempting to associate with the \
   file system. Use the API operation to monitor the status of the aliases Amazon FSx is \
   associating with the file system.\n\
  \ "]

module CancelDataRepositoryTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryTaskEnded of data_repository_task_ended
    | `DataRepositoryTaskNotFound of data_repository_task_not_found
    | `InternalServerError of internal_server_error
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_repository_task_request ->
    ( cancel_data_repository_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskEnded of data_repository_task_ended
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `InternalServerError of internal_server_error
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_repository_task_request ->
    ( cancel_data_repository_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskEnded of data_repository_task_ended
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `InternalServerError of internal_server_error
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an existing Amazon FSx for Lustre data repository task if that task is in either the \
   [PENDING] or [EXECUTING] state. When you cancel an export task, Amazon FSx does the following.\n\n\
  \ {ul\n\
  \       {-  Any files that FSx has already exported are not reverted.\n\
  \           \n\
  \            }\n\
  \       {-  FSx continues to export any files that are in-flight when the cancel operation is \
   received.\n\
  \           \n\
  \            }\n\
  \       {-  FSx does not export any files that have not yet been exported.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For a release task, Amazon FSx will stop releasing files upon cancellation. Any files that \
   have already been released will remain in the released state.\n\
  \   "]

module CopyBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `IncompatibleRegionForMultiAZ of incompatible_region_for_multi_a_z
    | `InternalServerError of internal_server_error
    | `InvalidDestinationKmsKey of invalid_destination_kms_key
    | `InvalidRegion of invalid_region
    | `InvalidSourceKmsKey of invalid_source_kms_key
    | `ServiceLimitExceeded of service_limit_exceeded
    | `SourceBackupUnavailable of source_backup_unavailable
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_backup_request ->
    ( copy_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `IncompatibleRegionForMultiAZ of incompatible_region_for_multi_a_z
      | `InternalServerError of internal_server_error
      | `InvalidDestinationKmsKey of invalid_destination_kms_key
      | `InvalidRegion of invalid_region
      | `InvalidSourceKmsKey of invalid_source_kms_key
      | `ServiceLimitExceeded of service_limit_exceeded
      | `SourceBackupUnavailable of source_backup_unavailable
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_backup_request ->
    ( copy_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `IncompatibleRegionForMultiAZ of incompatible_region_for_multi_a_z
      | `InternalServerError of internal_server_error
      | `InvalidDestinationKmsKey of invalid_destination_kms_key
      | `InvalidRegion of invalid_region
      | `InvalidSourceKmsKey of invalid_source_kms_key
      | `ServiceLimitExceeded of service_limit_exceeded
      | `SourceBackupUnavailable of source_backup_unavailable
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies an existing backup within the same Amazon Web Services account to another Amazon Web \
   Services Region (cross-Region copy) or within the same Amazon Web Services Region (in-Region \
   copy). You can have up to five backup copy requests in progress to a single destination Region \
   per account.\n\n\
  \ You can use cross-Region backup copies for cross-Region disaster recovery. You can \
   periodically take backups and copy them to another Region so that in the event of a disaster in \
   the primary Region, you can restore from backup and recover availability quickly in the other \
   Region. You can make cross-Region copies only within your Amazon Web Services partition. A \
   partition is a grouping of Regions. Amazon Web Services currently has three partitions: [aws] \
   (Standard Regions), [aws-cn] (China Regions), and [aws-us-gov] (Amazon Web Services GovCloud \
   \\[US\\] Regions).\n\
  \ \n\
  \  You can also use backup copies to clone your file dataset to another Region or within the \
   same Region.\n\
  \  \n\
  \   You can use the [SourceRegion] parameter to specify the Amazon Web Services Region from \
   which the backup will be copied. For example, if you make the call from the [us-west-1] Region \
   and want to copy a backup from the [us-east-2] Region, you specify [us-east-2] in the \
   [SourceRegion] parameter to make a cross-Region copy. If you don't specify a Region, the backup \
   copy is created in the same Region where the request is sent from (in-Region copy).\n\
  \   \n\
  \    For more information about creating backup copies, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#copy-backups} Copying \
   backups} in the {i Amazon FSx for Windows User Guide}, \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html#copy-backups}Copying \
   backups} in the {i Amazon FSx for Lustre User Guide}, and \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/using-backups.html#copy-backups}Copying \
   backups} in the {i Amazon FSx for OpenZFS User Guide}.\n\
  \    "]

module CopySnapshotAndUpdateVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_and_update_volume_request ->
    ( copy_snapshot_and_update_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_and_update_volume_request ->
    ( copy_snapshot_and_update_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing volume by using a snapshot from another Amazon FSx for OpenZFS file system. \
   For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/on-demand-replication.html}on-demand \
   data replication} in the Amazon FSx for OpenZFS User Guide.\n"]

module CreateAndAttachS3AccessPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessPointAlreadyOwnedByYou of access_point_already_owned_by_you
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidAccessPoint of invalid_access_point
    | `InvalidRequest of invalid_request
    | `TooManyAccessPoints of too_many_access_points
    | `UnsupportedOperation of unsupported_operation
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_and_attach_s3_access_point_request ->
    ( create_and_attach_s3_access_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessPointAlreadyOwnedByYou of access_point_already_owned_by_you
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidAccessPoint of invalid_access_point
      | `InvalidRequest of invalid_request
      | `TooManyAccessPoints of too_many_access_points
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_and_attach_s3_access_point_request ->
    ( create_and_attach_s3_access_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessPointAlreadyOwnedByYou of access_point_already_owned_by_you
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidAccessPoint of invalid_access_point
      | `InvalidRequest of invalid_request
      | `TooManyAccessPoints of too_many_access_points
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an S3 access point and attaches it to an Amazon FSx volume. For FSx for OpenZFS file \
   systems, the volume must be hosted on a high-availability file system, either Single-AZ or \
   Multi-AZ. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/s3accesspoints-for-FSx.html}Accessing \
   your data using Amazon S3 access points}. in the Amazon FSx for OpenZFS User Guide. \n\n\
  \ The requester requires the following permissions to perform these actions:\n\
  \ \n\
  \  {ul\n\
  \        {-   [fsx:CreateAndAttachS3AccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:CreateAccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:GetAccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:PutAccessPointPolicy] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:DeleteAccessPoint] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   The following actions are related to [CreateAndAttachS3AccessPoint]:\n\
  \   \n\
  \    {ul\n\
  \          {-   [DescribeS3AccessPointAttachments] \n\
  \              \n\
  \               }\n\
  \          {-   [DetachAndDeleteS3AccessPoint] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupInProgress of backup_in_progress
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_backup_request ->
    ( create_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupInProgress of backup_in_progress
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_backup_request ->
    ( create_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupInProgress of backup_in_progress
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a backup of an existing Amazon FSx for Windows File Server file system, Amazon FSx for \
   Lustre file system, Amazon FSx for NetApp ONTAP volume, or Amazon FSx for OpenZFS file system. \
   We recommend creating regular backups so that you can restore a file system or volume from a \
   backup if an issue arises with the original file system or volume.\n\n\
  \ For Amazon FSx for Lustre file systems, you can create a backup only for file systems that \
   have the following configuration:\n\
  \ \n\
  \  {ul\n\
  \        {-  A Persistent deployment type\n\
  \            \n\
  \             }\n\
  \        {-  Are {i not} linked to a data repository\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about backups, see the following:\n\
  \   \n\
  \    {ul\n\
  \          {-  For Amazon FSx for Lustre, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html}Working with FSx \
   for Lustre backups}.\n\
  \              \n\
  \               }\n\
  \          {-  For Amazon FSx for Windows, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html}Working with FSx for \
   Windows backups}.\n\
  \              \n\
  \               }\n\
  \          {-  For Amazon FSx for NetApp ONTAP, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/using-backups.html}Working with FSx for \
   NetApp ONTAP backups}.\n\
  \              \n\
  \               }\n\
  \          {-  For Amazon FSx for OpenZFS, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/using-backups.html}Working with FSx for \
   OpenZFS backups}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If a backup with the specified client request token exists and the parameters match, this \
   operation returns the description of the existing backup. If a backup with the specified client \
   request token exists and the parameters don't match, this operation returns \
   [IncompatibleParameterError]. If a backup with the specified client request token doesn't \
   exist, [CreateBackup] does the following: \n\
  \   \n\
  \    {ul\n\
  \          {-  Creates a new Amazon FSx backup with an assigned ID, and an initial lifecycle \
   state of [CREATING].\n\
  \              \n\
  \               }\n\
  \          {-  Returns the description of the backup.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   By using the idempotent operation, you can retry a [CreateBackup] operation without the risk \
   of creating an extra backup. This approach can be useful when an initial call fails in a way \
   that makes it unclear whether a backup was created. If you use the same client request token \
   and the initial call created a backup, the operation returns a successful result because all \
   the parameters are the same.\n\
  \   \n\
  \    The [CreateBackup] operation returns while the backup's lifecycle state is still \
   [CREATING]. You can check the backup creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeBackups.html}DescribeBackups} \
   operation, which returns the backup state along with other information.\n\
  \    "]

module CreateDataRepositoryAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_association_request ->
    ( create_data_repository_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_association_request ->
    ( create_data_repository_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon FSx for Lustre data repository association (DRA). A data repository \
   association is a link between a directory on the file system and an Amazon S3 bucket or prefix. \
   You can have a maximum of 8 data repository associations on a file system. Data repository \
   associations are supported on all FSx for Lustre 2.12 and 2.15 file systems, excluding \
   [scratch_1] deployment type.\n\n\
  \ Each data repository association must have a unique Amazon FSx file system directory and a \
   unique S3 bucket or prefix associated with it. You can configure a data repository association \
   for automatic import only, for automatic export only, or for both. To learn more about linking \
   a data repository to your file system, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html}Linking \
   your file system to an S3 bucket}.\n\
  \ \n\
  \    [CreateDataRepositoryAssociation] isn't supported on Amazon File Cache resources. To create \
   a DRA on Amazon File Cache, use the [CreateFileCache] operation.\n\
  \   \n\
  \    "]

module CreateDataRepositoryTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryTaskExecuting of data_repository_task_executing
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_task_request ->
    ( create_data_repository_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskExecuting of data_repository_task_executing
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_task_request ->
    ( create_data_repository_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskExecuting of data_repository_task_executing
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon FSx for Lustre data repository task. A [CreateDataRepositoryTask] operation \
   will fail if a data repository is not linked to the FSx file system.\n\n\
  \ You use import and export data repository tasks to perform bulk operations between your FSx \
   for Lustre file system and its linked data repositories. An example of a data repository task \
   is exporting any data and metadata changes, including POSIX metadata, to files, directories, \
   and symbolic links (symlinks) from your FSx file system to a linked data repository.\n\
  \ \n\
  \  You use release data repository tasks to release data from your file system for files that \
   are exported to S3. The metadata of released files remains on the file system so users or \
   applications can still access released files by reading the files again, which will restore \
   data from Amazon S3 to the FSx for Lustre file system.\n\
  \  \n\
  \   To learn more about data repository tasks, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html}Data \
   Repository Tasks}. To learn more about linking a data repository to your file system, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html}Linking \
   your file system to an S3 bucket}.\n\
  \   "]

module CreateFileCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidNetworkSettings of invalid_network_settings
    | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
    | `MissingFileCacheConfiguration of missing_file_cache_configuration
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_file_cache_request ->
    ( create_file_cache_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_file_cache_request ->
    ( create_file_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon File Cache resource.\n\n\
  \ You can use this operation with a client request token in the request that Amazon File Cache \
   uses to ensure idempotent creation. If a cache with the specified client request token exists \
   and the parameters match, [CreateFileCache] returns the description of the existing cache. If a \
   cache with the specified client request token exists and the parameters don't match, this call \
   returns [IncompatibleParameterError]. If a file cache with the specified client request token \
   doesn't exist, [CreateFileCache] does the following: \n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a new, empty Amazon File Cache resource with an assigned ID, and an initial \
   lifecycle state of [CREATING].\n\
  \            \n\
  \             }\n\
  \        {-  Returns the description of the cache in JSON format.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    The [CreateFileCache] call returns while the cache's lifecycle state is still [CREATING]. \
   You can check the cache creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileCaches.html}DescribeFileCaches} \
   operation, which returns the cache state along with other information.\n\
  \    \n\
  \     "]

module CreateFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveDirectoryError of active_directory_error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidExportPath of invalid_export_path
    | `InvalidImportPath of invalid_import_path
    | `InvalidNetworkSettings of invalid_network_settings
    | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
    | `MissingFileSystemConfiguration of missing_file_system_configuration
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_request ->
    ( create_file_system_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidExportPath of invalid_export_path
      | `InvalidImportPath of invalid_import_path
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_request ->
    ( create_file_system_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidExportPath of invalid_export_path
      | `InvalidImportPath of invalid_import_path
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new, empty Amazon FSx file system. You can create the following supported Amazon FSx \
   file systems using the [CreateFileSystem] API operation:\n\n\
  \ {ul\n\
  \       {-  Amazon FSx for Lustre\n\
  \           \n\
  \            }\n\
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
  \   This operation requires a client request token in the request that Amazon FSx uses to ensure \
   idempotent creation. This means that calling the operation multiple times with the same client \
   request token has no effect. By using the idempotent operation, you can retry a \
   [CreateFileSystem] operation without the risk of creating an extra file system. This approach \
   can be useful when an initial call fails in a way that makes it unclear whether a file system \
   was created. Examples are if a transport level timeout occurred, or your connection was reset. \
   If you use the same client request token and the initial call created a file system, the client \
   receives success as long as the parameters are the same.\n\
  \   \n\
  \    If a file system with the specified client request token exists and the parameters match, \
   [CreateFileSystem] returns the description of the existing file system. If a file system with \
   the specified client request token exists and the parameters don't match, this call returns \
   [IncompatibleParameterError]. If a file system with the specified client request token doesn't \
   exist, [CreateFileSystem] does the following:\n\
  \    \n\
  \     {ul\n\
  \           {-  Creates a new, empty Amazon FSx file system with an assigned ID, and an initial \
   lifecycle state of [CREATING].\n\
  \               \n\
  \                }\n\
  \           {-  Returns the description of the file system in JSON format.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    The [CreateFileSystem] call returns while the file system's lifecycle state is still \
   [CREATING]. You can check the file-system creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html}DescribeFileSystems} \
   operation, which returns the file system state along with other information.\n\
  \    \n\
  \     "]

module CreateFileSystemFromBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveDirectoryError of active_directory_error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidNetworkSettings of invalid_network_settings
    | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
    | `MissingFileSystemConfiguration of missing_file_system_configuration
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_from_backup_request ->
    ( create_file_system_from_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_from_backup_request ->
    ( create_file_system_from_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon FSx for Lustre, Amazon FSx for Windows File Server, or Amazon FSx for \
   OpenZFS file system from an existing Amazon FSx backup.\n\n\
  \ If a file system with the specified client request token exists and the parameters match, this \
   operation returns the description of the file system. If a file system with the specified \
   client request token exists but the parameters don't match, this call returns \
   [IncompatibleParameterError]. If a file system with the specified client request token doesn't \
   exist, this operation does the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a new Amazon FSx file system from backup with an assigned ID, and an \
   initial lifecycle state of [CREATING].\n\
  \            \n\
  \             }\n\
  \        {-  Returns the description of the file system.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Parameters like the Active Directory, default share name, automatic backup, and backup \
   settings default to the parameters of the file system that was backed up, unless overridden. \
   You can explicitly supply other settings.\n\
  \   \n\
  \    By using the idempotent operation, you can retry a [CreateFileSystemFromBackup] call \
   without the risk of creating an extra file system. This approach can be useful when an initial \
   call fails in a way that makes it unclear whether a file system was created. Examples are if a \
   transport level timeout occurred, or your connection was reset. If you use the same client \
   request token and the initial call created a file system, the client receives a success message \
   as long as the parameters are the same.\n\
  \    \n\
  \      The [CreateFileSystemFromBackup] call returns while the file system's lifecycle state is \
   still [CREATING]. You can check the file-system creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html} \
   DescribeFileSystems} operation, which returns the file system state along with other \
   information.\n\
  \      \n\
  \       "]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of an existing Amazon FSx for OpenZFS volume. With snapshots, you can easily \
   undo file changes and compare file versions by restoring the volume to a previous version.\n\n\
  \ If a snapshot with the specified client request token exists, and the parameters match, this \
   operation returns the description of the existing snapshot. If a snapshot with the specified \
   client request token exists, and the parameters don't match, this operation returns \
   [IncompatibleParameterError]. If a snapshot with the specified client request token doesn't \
   exist, [CreateSnapshot] does the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a new OpenZFS snapshot with an assigned ID, and an initial lifecycle state \
   of [CREATING].\n\
  \            \n\
  \             }\n\
  \        {-  Returns the description of the snapshot.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   By using the idempotent operation, you can retry a [CreateSnapshot] operation without the \
   risk of creating an extra snapshot. This approach can be useful when an initial call fails in a \
   way that makes it unclear whether a snapshot was created. If you use the same client request \
   token and the initial call created a snapshot, the operation returns a successful result \
   because all the parameters are the same.\n\
  \   \n\
  \    The [CreateSnapshot] operation returns while the snapshot's lifecycle state is still \
   [CREATING]. You can check the snapshot creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeSnapshots.html}DescribeSnapshots} \
   operation, which returns the snapshot state along with other information.\n\
  \    "]

module CreateStorageVirtualMachine : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveDirectoryError of active_directory_error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_storage_virtual_machine_request ->
    ( create_storage_virtual_machine_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_storage_virtual_machine_request ->
    ( create_storage_virtual_machine_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a storage virtual machine (SVM) for an Amazon FSx for ONTAP file system.\n"]

module CreateVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingVolumeConfiguration of missing_volume_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_volume_request ->
    ( create_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_volume_request ->
    ( create_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an FSx for ONTAP or Amazon FSx for OpenZFS storage volume.\n"]

module CreateVolumeFromBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingVolumeConfiguration of missing_volume_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_volume_from_backup_request ->
    ( create_volume_from_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_volume_from_backup_request ->
    ( create_volume_from_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon FSx for NetApp ONTAP volume from an existing Amazon FSx volume backup.\n"]

module DeleteBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupBeingCopied of backup_being_copied
    | `BackupInProgress of backup_in_progress
    | `BackupNotFound of backup_not_found
    | `BackupRestoring of backup_restoring
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_backup_request ->
    ( delete_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupBeingCopied of backup_being_copied
      | `BackupInProgress of backup_in_progress
      | `BackupNotFound of backup_not_found
      | `BackupRestoring of backup_restoring
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_backup_request ->
    ( delete_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupBeingCopied of backup_being_copied
      | `BackupInProgress of backup_in_progress
      | `BackupNotFound of backup_not_found
      | `BackupRestoring of backup_restoring
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon FSx backup. After deletion, the backup no longer exists, and its data is \
   gone.\n\n\
  \ The [DeleteBackup] call returns instantly. The backup won't show up in later [DescribeBackups] \
   calls.\n\
  \ \n\
  \   The data in a deleted backup is also deleted and can't be recovered by any means.\n\
  \   \n\
  \    "]

module DeleteDataRepositoryAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryAssociationNotFound of data_repository_association_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_repository_association_request ->
    ( delete_data_repository_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_repository_association_request ->
    ( delete_data_repository_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a data repository association on an Amazon FSx for Lustre file system. Deleting the \
   data repository association unlinks the file system from the Amazon S3 bucket. When deleting a \
   data repository association, you have the option of deleting the data in the file system that \
   corresponds to the data repository association. Data repository associations are supported on \
   all FSx for Lustre 2.12 and 2.15 file systems, excluding [scratch_1] deployment type.\n"]

module DeleteFileCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileCacheNotFound of file_cache_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_file_cache_request ->
    ( delete_file_cache_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_file_cache_request ->
    ( delete_file_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon File Cache resource. After deletion, the cache no longer exists, and its data \
   is gone.\n\n\
  \ The [DeleteFileCache] operation returns while the cache has the [DELETING] status. You can \
   check the cache deletion status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileCaches.html}DescribeFileCaches} \
   operation, which returns a list of caches in your account. If you pass the cache ID for a \
   deleted cache, the [DescribeFileCaches] operation returns a [FileCacheNotFound] error.\n\
  \ \n\
  \   The data in a deleted cache is also deleted and can't be recovered by any means.\n\
  \   \n\
  \    "]

module DeleteFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_file_system_request ->
    ( delete_file_system_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_file_system_request ->
    ( delete_file_system_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a file system. After deletion, the file system no longer exists, and its data is gone. \
   Any existing automatic backups and snapshots are also deleted.\n\n\
  \ To delete an Amazon FSx for NetApp ONTAP file system, first delete all the volumes and storage \
   virtual machines (SVMs) on the file system. Then provide a [FileSystemId] value to the \
   [DeleteFileSystem] operation.\n\
  \ \n\
  \  Before deleting an Amazon FSx for OpenZFS file system, make sure that there aren't any Amazon \
   S3 access points attached to any volume. For more information on how to list S3 access points \
   that are attached to volumes, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/access-points-list.html}Listing S3 \
   access point attachments}. For more information on how to delete S3 access points, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/delete-access-point.html}Deleting an S3 \
   access point attachment}.\n\
  \  \n\
  \   By default, when you delete an Amazon FSx for Windows File Server file system, a final \
   backup is created upon deletion. This final backup isn't subject to the file system's retention \
   policy, and must be manually deleted.\n\
  \   \n\
  \    To delete an Amazon FSx for Lustre file system, first \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/unmounting-fs.html}unmount} it from every \
   connected Amazon EC2 instance, then provide a [FileSystemId] value to the [DeleteFileSystem] \
   operation. By default, Amazon FSx will not take a final backup when the [DeleteFileSystem] \
   operation is invoked. On file systems not linked to an Amazon S3 bucket, set [SkipFinalBackup] \
   to [false] to take a final backup of the file system you are deleting. Backups cannot be \
   enabled on S3-linked file systems. To ensure all of your data is written back to S3 before \
   deleting your file system, you can either monitor for the \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/monitoring-cloudwatch.html#auto-import-export-metrics}AgeOfOldestQueuedMessage} \
   metric to be zero (if using automatic export) or you can run an \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repo-task-dra.html}export \
   data repository task}. If you have automatic export enabled and want to use an export data \
   repository task, you have to disable automatic export before executing the export data \
   repository task.\n\
  \    \n\
  \     The [DeleteFileSystem] operation returns while the file system has the [DELETING] status. \
   You can check the file system deletion status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html}DescribeFileSystems} \
   operation, which returns a list of file systems in your account. If you pass the file system ID \
   for a deleted file system, the [DescribeFileSystems] operation returns a [FileSystemNotFound] \
   error.\n\
  \     \n\
  \       If a data repository task is in a [PENDING] or [EXECUTING] state, deleting an Amazon FSx \
   for Lustre file system will fail with an HTTP status code 400 (Bad Request).\n\
  \       \n\
  \          The data in a deleted file system is also deleted and can't be recovered by any means.\n\
  \          \n\
  \           "]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `SnapshotNotFound of snapshot_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon FSx for OpenZFS snapshot. After deletion, the snapshot no longer exists, and \
   its data is gone. Deleting a snapshot doesn't affect snapshots stored in a file system backup. \
   \n\n\
  \ The [DeleteSnapshot] operation returns instantly. The snapshot appears with the lifecycle \
   status of [DELETING] until the deletion is complete.\n\
  \ "]

module DeleteStorageVirtualMachine : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_storage_virtual_machine_request ->
    ( delete_storage_virtual_machine_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_storage_virtual_machine_request ->
    ( delete_storage_virtual_machine_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing Amazon FSx for ONTAP storage virtual machine (SVM). Prior to deleting an \
   SVM, you must delete all non-root volumes in the SVM, otherwise the operation will fail.\n"]

module DeleteVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_volume_request ->
    ( delete_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_volume_request ->
    ( delete_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.\n"]

module DescribeBackups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_backups_request ->
    ( describe_backups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_backups_request ->
    ( describe_backups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of a specific Amazon FSx backup, if a [BackupIds] value is provided for \
   that backup. Otherwise, it returns all backups owned by your Amazon Web Services account in the \
   Amazon Web Services Region of the endpoint that you're calling.\n\n\
  \ When retrieving all backups, you can optionally specify the [MaxResults] parameter to limit \
   the number of backups in a response. If more backups remain, Amazon FSx returns a [NextToken] \
   value in the response. In this case, send a later request with the [NextToken] request \
   parameter set to the value of the [NextToken] value from the last response.\n\
  \ \n\
  \  This operation is used in an iterative process to retrieve a list of your backups. \
   [DescribeBackups] is called first without a [NextToken] value. Then the operation continues to \
   be called with the [NextToken] parameter set to the value of the last [NextToken] value until a \
   response has no [NextToken] value.\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The operation might return fewer than the [MaxResults] value of backup \
   descriptions while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of the backups returned in the response of one [DescribeBackups] call \
   and the order of the backups returned across the responses of a multi-call iteration is \
   unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeDataRepositoryAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryAssociationNotFound of data_repository_association_not_found
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error
    | `InvalidDataRepositoryType of invalid_data_repository_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_associations_request ->
    ( describe_data_repository_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `InvalidDataRepositoryType of invalid_data_repository_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_associations_request ->
    ( describe_data_repository_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `InvalidDataRepositoryType of invalid_data_repository_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx for Lustre or Amazon File Cache data repository \
   associations, if one or more [AssociationIds] values are provided in the request, or if filters \
   are used in the request. Data repository associations are supported on Amazon File Cache \
   resources and all FSx for Lustre 2.12 and 2,15 file systems, excluding [scratch_1] deployment \
   type.\n\n\
  \ You can use filters to narrow the response to include just data repository associations for \
   specific file systems (use the [file-system-id] filter with the ID of the file system) or \
   caches (use the [file-cache-id] filter with the ID of the cache), or data repository \
   associations for a specific repository type (use the [data-repository-type] filter with a value \
   of [S3] or [NFS]). If you don't use filters, the response returns all data repository \
   associations owned by your Amazon Web Services account in the Amazon Web Services Region of the \
   endpoint that you're calling.\n\
  \ \n\
  \  When retrieving all data repository associations, you can paginate the response by using the \
   optional [MaxResults] parameter to limit the number of data repository associations returned in \
   a response. If more data repository associations remain, a [NextToken] value is returned in the \
   response. In this case, send a later request with the [NextToken] request parameter set to the \
   value of [NextToken] from the last response.\n\
  \  "]

module DescribeDataRepositoryTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryTaskNotFound of data_repository_task_not_found
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_tasks_request ->
    ( describe_data_repository_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_tasks_request ->
    ( describe_data_repository_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx for Lustre or Amazon File Cache data repository \
   tasks, if one or more [TaskIds] values are provided in the request, or if filters are used in \
   the request. You can use filters to narrow the response to include just tasks for specific file \
   systems or caches, or tasks in a specific lifecycle state. Otherwise, it returns all data \
   repository tasks owned by your Amazon Web Services account in the Amazon Web Services Region of \
   the endpoint that you're calling.\n\n\
  \ When retrieving all tasks, you can paginate the response by using the optional [MaxResults] \
   parameter to limit the number of tasks returned in a response. If more tasks remain, a \
   [NextToken] value is returned in the response. In this case, send a later request with the \
   [NextToken] request parameter set to the value of [NextToken] from the last response.\n\
  \ "]

module DescribeFileCaches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileCacheNotFound of file_cache_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_caches_request ->
    ( describe_file_caches_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_caches_request ->
    ( describe_file_caches_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of a specific Amazon File Cache resource, if a [FileCacheIds] value is \
   provided for that cache. Otherwise, it returns descriptions of all caches owned by your Amazon \
   Web Services account in the Amazon Web Services Region of the endpoint that you're calling.\n\n\
  \ When retrieving all cache descriptions, you can optionally specify the [MaxResults] parameter \
   to limit the number of descriptions in a response. If more cache descriptions remain, the \
   operation returns a [NextToken] value in the response. In this case, send a later request with \
   the [NextToken] request parameter set to the value of [NextToken] from the last response.\n\
  \ \n\
  \  This operation is used in an iterative process to retrieve a list of your cache descriptions. \
   [DescribeFileCaches] is called first without a [NextToken]value. Then the operation continues \
   to be called with the [NextToken] parameter set to the value of the last [NextToken] value \
   until a response has no [NextToken].\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The implementation might return fewer than [MaxResults] cache descriptions while \
   still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of caches returned in the response of one [DescribeFileCaches] call and \
   the order of caches returned across the responses of a multicall iteration is unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeFileSystemAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_system_aliases_request ->
    ( describe_file_system_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_system_aliases_request ->
    ( describe_file_system_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the DNS aliases that are associated with the specified Amazon FSx for Windows File \
   Server file system. A history of all DNS aliases that have been associated with and \
   disassociated from the file system is available in the list of [AdministrativeAction] provided \
   in the [DescribeFileSystems] operation response.\n"]

module DescribeFileSystems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_systems_request ->
    ( describe_file_systems_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_systems_request ->
    ( describe_file_systems_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx file systems, if a [FileSystemIds] value is \
   provided for that file system. Otherwise, it returns descriptions of all file systems owned by \
   your Amazon Web Services account in the Amazon Web Services Region of the endpoint that you're \
   calling.\n\n\
  \ When retrieving all file system descriptions, you can optionally specify the [MaxResults] \
   parameter to limit the number of descriptions in a response. If more file system descriptions \
   remain, Amazon FSx returns a [NextToken] value in the response. In this case, send a later \
   request with the [NextToken] request parameter set to the value of [NextToken] from the last \
   response.\n\
  \ \n\
  \  This operation is used in an iterative process to retrieve a list of your file system \
   descriptions. [DescribeFileSystems] is called first without a [NextToken]value. Then the \
   operation continues to be called with the [NextToken] parameter set to the value of the last \
   [NextToken] value until a response has no [NextToken].\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The implementation might return fewer than [MaxResults] file system descriptions \
   while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of file systems returned in the response of one [DescribeFileSystems] \
   call and the order of file systems returned across the responses of a multicall iteration is \
   unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeS3AccessPointAttachments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_s3_access_point_attachments_request ->
    ( describe_s3_access_point_attachments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_s3_access_point_attachments_request ->
    ( describe_s3_access_point_attachments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more S3 access points attached to Amazon FSx volumes.\n\n\
  \ The requester requires the following permission to perform this action:\n\
  \ \n\
  \  {ul\n\
  \        {-   [fsx:DescribeS3AccessPointAttachments] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeSharedVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_vpc_configuration_request ->
    ( describe_shared_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_vpc_configuration_request ->
    ( describe_shared_vpc_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Indicates whether participant accounts in your organization can create Amazon FSx for NetApp \
   ONTAP Multi-AZ file systems in subnets that are shared by a virtual private cloud (VPC) owner. \
   For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/creating-file-systems.html#fsxn-vpc-shared-subnets}Creating \
   FSx for ONTAP file systems in shared subnets}. \n"]

module DescribeSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `SnapshotNotFound of snapshot_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx for OpenZFS snapshots, if a [SnapshotIds] value \
   is provided. Otherwise, this operation returns all snapshots owned by your Amazon Web Services \
   account in the Amazon Web Services Region of the endpoint that you're calling.\n\n\
  \ When retrieving all snapshots, you can optionally specify the [MaxResults] parameter to limit \
   the number of snapshots in a response. If more backups remain, Amazon FSx returns a [NextToken] \
   value in the response. In this case, send a later request with the [NextToken] request \
   parameter set to the value of [NextToken] from the last response. \n\
  \ \n\
  \  Use this operation in an iterative process to retrieve a list of your snapshots. \
   [DescribeSnapshots] is called first without a [NextToken] value. Then the operation continues \
   to be called with the [NextToken] parameter set to the value of the last [NextToken] value \
   until a response has no [NextToken] value.\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The operation might return fewer than the [MaxResults] value of snapshot \
   descriptions while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of snapshots returned in the response of one [DescribeSnapshots] call \
   and the order of backups returned across the responses of a multi-call iteration is \
   unspecified. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeStorageVirtualMachines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_storage_virtual_machines_request ->
    ( describe_storage_virtual_machines_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_storage_virtual_machines_request ->
    ( describe_storage_virtual_machines_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more Amazon FSx for NetApp ONTAP storage virtual machines (SVMs).\n"]

module DescribeVolumes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_volumes_request ->
    ( describe_volumes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_volumes_request ->
    ( describe_volumes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volumes.\n"]

module DetachAndDeleteS3AccessPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_and_delete_s3_access_point_request ->
    ( detach_and_delete_s3_access_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_and_delete_s3_access_point_request ->
    ( detach_and_delete_s3_access_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches an S3 access point from an Amazon FSx volume and deletes the S3 access point.\n\n\
  \ The requester requires the following permission to perform this action:\n\
  \ \n\
  \  {ul\n\
  \        {-   [fsx:DetachAndDeleteS3AccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:DeleteAccessPoint] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DisassociateFileSystemAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_file_system_aliases_request ->
    ( disassociate_file_system_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_file_system_aliases_request ->
    ( disassociate_file_system_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this action to disassociate, or remove, one or more Domain Name Service (DNS) aliases from \
   an Amazon FSx for Windows File Server file system. If you attempt to disassociate a DNS alias \
   that is not associated with the file system, Amazon FSx responds with an HTTP status code 400 \
   (Bad Request). For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html}Working with \
   DNS Aliases}.\n\n\
  \ The system generated response showing the DNS aliases that Amazon FSx is attempting to \
   disassociate from the file system. Use the API operation to monitor the status of the aliases \
   Amazon FSx is disassociating with the file system.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `NotServiceResourceError of not_service_resource_error
    | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists tags for Amazon FSx resources.\n\n\
  \ When retrieving all tags, you can optionally specify the [MaxResults] parameter to limit the \
   number of tags in a response. If more tags remain, Amazon FSx returns a [NextToken] value in \
   the response. In this case, send a later request with the [NextToken] request parameter set to \
   the value of [NextToken] from the last response.\n\
  \ \n\
  \  This action is used in an iterative process to retrieve a list of your tags. \
   [ListTagsForResource] is called first without a [NextToken]value. Then the action continues to \
   be called with the [NextToken] parameter set to the value of the last [NextToken] value until a \
   response has no [NextToken].\n\
  \  \n\
  \   When using this action, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The implementation might return fewer than [MaxResults] file system descriptions \
   while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of tags returned in the response of one [ListTagsForResource] call and \
   the order of tags returned across the responses of a multi-call iteration is unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ReleaseFileSystemNfsV3Locks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    release_file_system_nfs_v3_locks_request ->
    ( release_file_system_nfs_v3_locks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    release_file_system_nfs_v3_locks_request ->
    ( release_file_system_nfs_v3_locks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Releases the file system lock from an Amazon FSx for OpenZFS file system.\n"]

module RestoreVolumeFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_volume_from_snapshot_request ->
    ( restore_volume_from_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_volume_from_snapshot_request ->
    ( restore_volume_from_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an Amazon FSx for OpenZFS volume to the state saved by the specified snapshot.\n"]

module StartMisconfiguredStateRecovery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_misconfigured_state_recovery_request ->
    ( start_misconfigured_state_recovery_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_misconfigured_state_recovery_request ->
    ( start_misconfigured_state_recovery_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "After performing steps to repair the Active Directory configuration of an FSx for Windows File \
   Server file system, use this action to initiate the process of Amazon FSx attempting to \
   reconnect to the file system.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `NotServiceResourceError of not_service_resource_error
    | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Tags an Amazon FSx resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `NotServiceResourceError of not_service_resource_error
    | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This action removes a tag from an Amazon FSx resource.\n"]

module UpdateDataRepositoryAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryAssociationNotFound of data_repository_association_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_repository_association_request ->
    ( update_data_repository_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_repository_association_request ->
    ( update_data_repository_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing data repository association on an Amazon FSx for \
   Lustre file system. Data repository associations are supported on all FSx for Lustre 2.12 and \
   2.15 file systems, excluding [scratch_1] deployment type.\n"]

module UpdateFileCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileCacheNotFound of file_cache_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingFileCacheConfiguration of missing_file_cache_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_file_cache_request ->
    ( update_file_cache_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_file_cache_request ->
    ( update_file_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing Amazon File Cache resource. You can update multiple \
   properties in a single request.\n"]

module UpdateFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidNetworkSettings of invalid_network_settings
    | `MissingFileSystemConfiguration of missing_file_system_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_file_system_request ->
    ( update_file_system_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_file_system_request ->
    ( update_file_system_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to update the configuration of an existing Amazon FSx file system. You can \
   update multiple properties in a single request.\n\n\
  \ For FSx for Windows File Server file systems, you can update the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [AuditLogConfiguration] \n\
  \            \n\
  \             }\n\
  \        {-   [AutomaticBackupRetentionDays] \n\
  \            \n\
  \             }\n\
  \        {-   [DailyAutomaticBackupStartTime] \n\
  \            \n\
  \             }\n\
  \        {-   [DiskIopsConfiguration] \n\
  \            \n\
  \             }\n\
  \        {-   [SelfManagedActiveDirectoryConfiguration] \n\
  \            \n\
  \             }\n\
  \        {-   [StorageCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [StorageType] \n\
  \            \n\
  \             }\n\
  \        {-   [ThroughputCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [WeeklyMaintenanceStartTime] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For FSx for Lustre file systems, you can update the following properties:\n\
  \   \n\
  \    {ul\n\
  \          {-   [AutoImportPolicy] \n\
  \              \n\
  \               }\n\
  \          {-   [AutomaticBackupRetentionDays] \n\
  \              \n\
  \               }\n\
  \          {-   [DailyAutomaticBackupStartTime] \n\
  \              \n\
  \               }\n\
  \          {-   [DataCompressionType] \n\
  \              \n\
  \               }\n\
  \          {-   [FileSystemTypeVersion] \n\
  \              \n\
  \               }\n\
  \          {-   [LogConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [LustreReadCacheConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [LustreRootSquashConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [MetadataConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [PerUnitStorageThroughput] \n\
  \              \n\
  \               }\n\
  \          {-   [StorageCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [WeeklyMaintenanceStartTime] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For FSx for ONTAP file systems, you can update the following properties:\n\
  \   \n\
  \    {ul\n\
  \          {-   [AddRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [AutomaticBackupRetentionDays] \n\
  \              \n\
  \               }\n\
  \          {-   [DailyAutomaticBackupStartTime] \n\
  \              \n\
  \               }\n\
  \          {-   [DiskIopsConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [EndpointIpv6AddressRange] \n\
  \              \n\
  \               }\n\
  \          {-   [FsxAdminPassword] \n\
  \              \n\
  \               }\n\
  \          {-   [HAPairs] \n\
  \              \n\
  \               }\n\
  \          {-   [RemoveRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [StorageCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacityPerHAPair] \n\
  \              \n\
  \               }\n\
  \          {-   [WeeklyMaintenanceStartTime] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For FSx for OpenZFS file systems, you can update the following properties:\n\
  \   \n\
  \    {ul\n\
  \          {-   [AddRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [AutomaticBackupRetentionDays] \n\
  \              \n\
  \               }\n\
  \          {-   [CopyTagsToBackups] \n\
  \              \n\
  \               }\n\
  \          {-   [CopyTagsToVolumes] \n\
  \              \n\
  \               }\n\
  \          {-   [DailyAutomaticBackupStartTime] \n\
  \              \n\
  \               }\n\
  \          {-   [DiskIopsConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [EndpointIpv6AddressRange] \n\
  \              \n\
  \               }\n\
  \          {-   [ReadCacheConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [RemoveRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [StorageCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [WeeklyMaintenanceStartTime] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module UpdateSharedVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_shared_vpc_configuration_request ->
    ( update_shared_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_shared_vpc_configuration_request ->
    ( update_shared_vpc_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures whether participant accounts in your organization can create Amazon FSx for NetApp \
   ONTAP Multi-AZ file systems in subnets that are shared by a virtual private cloud (VPC) owner. \
   For more information, see the \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/maz-shared-vpc.html}Amazon FSx for NetApp \
   ONTAP User Guide}.\n\n\
  \  We strongly recommend that participant-created Multi-AZ file systems in the shared VPC are \
   deleted before you disable this feature. Once the feature is disabled, these file systems will \
   enter a [MISCONFIGURED] state and behave like Single-AZ file systems. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/maz-shared-vpc.html#disabling-maz-vpc-sharing}Important \
   considerations before disabling shared VPC support for Multi-AZ file systems}.\n\
  \  \n\
  \   "]

module UpdateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `SnapshotNotFound of snapshot_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of an Amazon FSx for OpenZFS snapshot.\n"]

module UpdateStorageVirtualMachine : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_storage_virtual_machine_request ->
    ( update_storage_virtual_machine_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_storage_virtual_machine_request ->
    ( update_storage_virtual_machine_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an FSx for ONTAP storage virtual machine (SVM).\n"]

module UpdateVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingVolumeConfiguration of missing_volume_configuration
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_volume_request ->
    ( update_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_volume_request ->
    ( update_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.\n"]
