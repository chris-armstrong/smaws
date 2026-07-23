open Types

module UpdateAutomaticTapeCreationPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_automatic_tape_creation_policy_input ->
    ( update_automatic_tape_creation_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_automatic_tape_creation_policy_input ->
    ( update_automatic_tape_creation_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the automatic tape creation policy of a gateway. Use this to update the policy with a \
   new set of automatic tape creation rules. This is only supported for tape gateways.\n\n\
  \ By default, there is no automatic tape creation policy.\n\
  \ \n\
  \   A gateway can have only one automatic tape creation policy.\n\
  \   \n\
  \    "]

module UpdateBandwidthRateLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_bandwidth_rate_limit_input ->
    ( update_bandwidth_rate_limit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_bandwidth_rate_limit_input ->
    ( update_bandwidth_rate_limit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the bandwidth rate limits of a gateway. You can update both the upload and download \
   bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, \
   the existing rate limit remains. This operation is supported only for the stored volume, cached \
   volume, and tape gateway types. To update bandwidth rate limits for S3 file gateways, use \
   [UpdateBandwidthRateLimitSchedule].\n\n\
  \ By default, a gateway's bandwidth rate limits are not set. If you don't set any limit, the \
   gateway does not have any limitations on its bandwidth usage and could potentially use the \
   maximum available bandwidth.\n\
  \ \n\
  \  To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your \
   request.\n\
  \  "]

module UpdateBandwidthRateLimitSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_bandwidth_rate_limit_schedule_input ->
    ( update_bandwidth_rate_limit_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_bandwidth_rate_limit_schedule_input ->
    ( update_bandwidth_rate_limit_schedule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Updates the bandwidth rate limit schedule for a specified gateway. By default, gateways do not \
   have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. Use \
   this to initiate or update a gateway's bandwidth rate limit schedule. This operation is \
   supported for volume, tape, and S3 file gateways. S3 file gateways support bandwidth rate \
   limits for upload only. FSx file gateways do not support bandwidth rate limits.\n"]

module UpdateChapCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_chap_credentials_input ->
    ( update_chap_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_chap_credentials_input ->
    ( update_chap_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified \
   iSCSI target. By default, a gateway does not have CHAP enabled; however, for added security, \
   you might use it. This operation is supported in the volume and tape gateway types.\n\n\
  \  When you update CHAP credentials, all existing connections on the target are closed and \
   initiators must reconnect with the new credentials.\n\
  \  \n\
  \   "]

module UpdateFileSystemAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_file_system_association_input ->
    ( update_file_system_association_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_file_system_association_input ->
    ( update_file_system_association_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a file system association. This operation is only supported in the FSx File Gateways.\n"]

module UpdateGatewayInformation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_gateway_information_input ->
    ( update_gateway_information_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_gateway_information_input ->
    ( update_gateway_information_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a gateway's metadata, which includes the gateway's name, time zone, and metadata cache \
   size. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in \
   your request.\n\n\
  \  For gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID \
   rather than the gateway name. However, changing the name of the gateway has no effect on the \
   gateway's ARN.\n\
  \  \n\
  \   "]

module UpdateGatewaySoftwareNow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_gateway_software_now_input ->
    ( update_gateway_software_now_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_gateway_software_now_input ->
    ( update_gateway_software_now_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the gateway virtual machine (VM) software. The request immediately triggers the \
   software update.\n\n\
  \  When you make this request, you get a [200 OK] success response immediately. However, it \
   might take some time for the update to complete. You can call [DescribeGatewayInformation] to \
   verify the gateway is in the [STATE_RUNNING] state.\n\
  \  \n\
  \     A software update forces a system restart of your gateway. You can minimize the chance of \
   any disruption to your applications by increasing your iSCSI Initiators' timeouts. For more \
   information about increasing iSCSI Initiator timeouts for Windows and Linux, see \
   {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings}Customizing \
   your Windows iSCSI settings} and \
   {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings}Customizing \
   your Linux iSCSI settings}, respectively.\n\
  \     \n\
  \      "]

module UpdateMaintenanceStartTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_start_time_input ->
    ( update_maintenance_start_time_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_start_time_input ->
    ( update_maintenance_start_time_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a gateway's maintenance window schedule, with settings for monthly or weekly cadence, \
   specific day and time to begin maintenance, and which types of updates to apply. Time \
   configuration uses the gateway's time zone. You can pass values for a complete maintenance \
   schedule, or update policy, or both. Previous values will persist for whichever setting you \
   choose not to modify. If an incomplete or invalid maintenance schedule is passed, the entire \
   request will be rejected with an error and no changes will occur.\n\n\
  \ A complete maintenance schedule must include values for {i both} [MinuteOfHour] and \
   [HourOfDay], and {i either} [DayOfMonth] {i or} [DayOfWeek].\n\
  \ \n\
  \   We recommend keeping maintenance updates turned on, except in specific use cases where the \
   brief disruptions caused by updating the gateway could critically impact your deployment.\n\
  \   \n\
  \    "]

module UpdateNFSFileShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_nfs_file_share_input ->
    ( update_nfs_file_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_nfs_file_share_input ->
    ( update_nfs_file_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a Network File System (NFS) file share. This operation is only supported in S3 File \
   Gateways.\n\n\
  \  To leave a file share field unchanged, set the corresponding input field to null.\n\
  \  \n\
  \    Updates the following file share settings:\n\
  \    \n\
  \     {ul\n\
  \           {-  Default storage class for your S3 bucket\n\
  \               \n\
  \                }\n\
  \           {-  Metadata defaults for your S3 bucket\n\
  \               \n\
  \                }\n\
  \           {-  Allowed NFS clients for your file share\n\
  \               \n\
  \                }\n\
  \           {-  Squash settings\n\
  \               \n\
  \                }\n\
  \           {-  Write status of your file share\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module UpdateSMBFileShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_smb_file_share_input ->
    ( update_smb_file_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_smb_file_share_input ->
    ( update_smb_file_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a Server Message Block (SMB) file share. This operation is only supported for S3 File \
   Gateways.\n\n\
  \  To leave a file share field unchanged, set the corresponding input field to null.\n\
  \  \n\
  \     File gateways require Security Token Service (Amazon Web Services STS) to be activated to \
   enable you to create a file share. Make sure that Amazon Web Services STS is activated in the \
   Amazon Web Services Region you are creating your file gateway in. If Amazon Web Services STS is \
   not activated in this Amazon Web Services Region, activate it. For information about how to \
   activate Amazon Web Services STS, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html}Activating \
   and deactivating Amazon Web Services STS in an Amazon Web Services Region} in the {i Identity \
   and Access Management User Guide}.\n\
  \     \n\
  \      File gateways don't support creating hard or symbolic links on a file share.\n\
  \      \n\
  \       "]

module UpdateSMBFileShareVisibility : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_smb_file_share_visibility_input ->
    ( update_smb_file_share_visibility_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_smb_file_share_visibility_input ->
    ( update_smb_file_share_visibility_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Controls whether the shares on an S3 File Gateway are visible in a net view or browse list. The \
   operation is only supported for S3 File Gateways.\n"]

module UpdateSMBLocalGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_smb_local_groups_input ->
    ( update_smb_local_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_smb_local_groups_input ->
    ( update_smb_local_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the list of Active Directory users and groups that have special permissions for SMB \
   file shares on the gateway.\n"]

module UpdateSMBSecurityStrategy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_smb_security_strategy_input ->
    ( update_smb_security_strategy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_smb_security_strategy_input ->
    ( update_smb_security_strategy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the SMB security strategy level for an Amazon S3 file gateway. This action is only \
   supported for Amazon S3 file gateways.\n\n\
  \  For information about configuring this setting using the Amazon Web Services console, see \
   {{:https://docs.aws.amazon.com/filegateway/latest/files3/security-strategy.html}Setting a \
   security level for your gateway} in the {i Amazon S3 File Gateway User Guide}.\n\
  \  \n\
  \   A higher security strategy level can affect performance of the gateway.\n\
  \   \n\
  \    "]

module UpdateSnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_schedule_input ->
    ( update_snapshot_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_schedule_input ->
    ( update_snapshot_schedule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a snapshot schedule configured for a gateway volume. This operation is only supported \
   in the cached volume and stored volume gateway types.\n\n\
  \ The default snapshot schedule for volume is once every 24 hours, starting at the creation time \
   of the volume. You can use this API to change the snapshot schedule configured for the volume.\n\
  \ \n\
  \  In the request you must identify the gateway volume whose snapshot schedule you want to \
   update, and the schedule information, including when you want the snapshot to begin on a day \
   and the frequency (in hours) of snapshots.\n\
  \  "]

module UpdateVTLDeviceType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_vtl_device_type_input ->
    ( update_vtl_device_type_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_vtl_device_type_input ->
    ( update_vtl_device_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you \
   select a medium changer type for the tape gateway. This operation enables you to select a \
   different type of medium changer after a tape gateway is activated. This operation is only \
   supported in the tape gateway type.\n"]

module StartGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_gateway_input ->
    ( start_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_gateway_input ->
    ( start_gateway_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a gateway that you previously shut down (see [ShutdownGateway]). After the gateway \
   starts, you can then make other API calls, your applications can read from or write to the \
   gateway's storage volumes and you will be able to take snapshot backups.\n\n\
  \  When you make a request, you will get a 200 OK success response immediately. However, it \
   might take some time for the gateway to be ready. You should call [DescribeGatewayInformation] \
   and check the status before making any additional API calls. For more information, see \
   [ActivateGateway].\n\
  \  \n\
  \    To specify which gateway to start, use the Amazon Resource Name (ARN) of the gateway in \
   your request.\n\
  \    "]

module StartCacheReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_cache_report_input ->
    ( start_cache_report_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_cache_report_input ->
    ( start_cache_report_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts generating a report of the file metadata currently cached by an S3 File Gateway for a \
   specific file share. You can use this report to identify and resolve issues if you have files \
   failing upload from your gateway to Amazon S3. The report is a CSV file containing a list of \
   files which match the set of filter parameters you specify in the request.\n\n\
  \  The {b Files Failing Upload} flag is reset every 24 hours and during gateway reboot. If this \
   report captures the files after the reset, but before they become flagged again, they will not \
   be reported as {b Files Failing Upload}.\n\
  \  \n\
  \    The following requirements must be met to successfully generate a cache report:\n\
  \    \n\
  \     {ul\n\
  \           {-  You must have [s3:PutObject] and [s3:AbortMultipartUpload] permissions for the \
   Amazon S3 bucket where you want to store the cache report.\n\
  \               \n\
  \                }\n\
  \           {-  No other cache reports can currently be in-progress for the specified file share.\n\
  \               \n\
  \                }\n\
  \           {-  There must be fewer than 10 existing cache reports for the specified file share.\n\
  \               \n\
  \                }\n\
  \           {-  The gateway must be online and connected to Amazon Web Services.\n\
  \               \n\
  \                }\n\
  \           {-  The root disk must have at least 20GB of free space when report generation starts.\n\
  \               \n\
  \                }\n\
  \           {-  You must specify at least one value for [InclusionFilters] or [ExclusionFilters] \
   in the request.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module StartAvailabilityMonitorTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_availability_monitor_test_input ->
    ( start_availability_monitor_test_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_availability_monitor_test_input ->
    ( start_availability_monitor_test_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Start a test that verifies that the specified gateway is configured for High Availability \
   monitoring in your host environment. This request only initiates the test and that a successful \
   response only indicates that the test was started. It doesn't indicate that the test passed. \
   For the status of the test, invoke the [DescribeAvailabilityMonitorTest] API.\n\n\
  \  Starting this test will cause your gateway to go offline for a brief period.\n\
  \  \n\
  \   "]

module ShutdownGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    shutdown_gateway_input ->
    ( shutdown_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    shutdown_gateway_input ->
    ( shutdown_gateway_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shuts down a Tape Gateway or Volume Gateway. To specify which gateway to shut down, use the \
   Amazon Resource Name (ARN) of the gateway in the body of your request.\n\n\
  \  This API action cannot be used to shut down S3 File Gateway or FSx File Gateway.\n\
  \  \n\
  \    The operation shuts down the gateway service component running in the gateway's virtual \
   machine (VM) and not the host VM.\n\
  \    \n\
  \      If you want to shut down the VM, it is recommended that you first shut down the gateway \
   component in the VM to avoid unpredictable conditions.\n\
  \      \n\
  \        After the gateway is shutdown, you cannot call any other API except [StartGateway], \
   [DescribeGatewayInformation], and [ListGateways]. For more information, see [ActivateGateway]. \
   Your applications cannot read from or write to the gateway's storage volumes, and there are no \
   snapshots taken.\n\
  \        \n\
  \          When you make a shutdown request, you will get a [200 OK] success response \
   immediately. However, it might take some time for the gateway to shut down. You can call the \
   [DescribeGatewayInformation] API to check the status. For more information, see \
   [ActivateGateway].\n\
  \          \n\
  \            If do not intend to use the gateway again, you must delete the gateway (using \
   [DeleteGateway]) to no longer pay software charges associated with the gateway.\n\
  \            "]

module SetSMBGuestPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_smb_guest_password_input ->
    ( set_smb_guest_password_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_smb_guest_password_input ->
    ( set_smb_guest_password_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the password for the guest user [smbguest]. The [smbguest] user is the user when the \
   authentication method for the file share is set to [GuestAccess]. This operation only supported \
   for S3 File Gateways\n"]

module SetLocalConsolePassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_local_console_password_input ->
    ( set_local_console_password_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_local_console_password_input ->
    ( set_local_console_password_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the password for your VM local console. When you log in to the local console for the first \
   time, you log in to the VM with the default credentials. We recommend that you set a new \
   password. You don't need to know the default password to set a new password.\n"]

module RetrieveTapeRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retrieve_tape_recovery_point_input ->
    ( retrieve_tape_recovery_point_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retrieve_tape_recovery_point_input ->
    ( retrieve_tape_recovery_point_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the recovery point for the specified virtual tape. This operation is only supported \
   in the tape gateway type.\n\n\
  \ A recovery point is a point in time view of a virtual tape at which all the data on the tape \
   is consistent. If your gateway crashes, virtual tapes that have recovery points can be \
   recovered to a new gateway.\n\
  \ \n\
  \   The virtual tape can be retrieved to only one gateway. The retrieved tape is read-only. The \
   virtual tape can be retrieved to only a tape gateway. There is no charge for retrieving \
   recovery points.\n\
  \   \n\
  \    "]

module RetrieveTapeArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retrieve_tape_archive_input ->
    ( retrieve_tape_archive_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retrieve_tape_archive_input ->
    ( retrieve_tape_archive_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual \
   tapes archived in the VTS are not associated with any gateway. However after a tape is \
   retrieved, it is associated with a gateway, even though it is also listed in the VTS, that is, \
   archive. This operation is only supported in the tape gateway type.\n\n\
  \ Once a tape is successfully retrieved to a gateway, it cannot be retrieved again to another \
   gateway. You must archive the tape again before you can retrieve it to another gateway. This \
   operation is only supported in the tape gateway type.\n\
  \ "]

module ResetCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_cache_input ->
    ( reset_cache_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_cache_input ->
    ( reset_cache_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resets all cache disks that have encountered an error and makes the disks available for \
   reconfiguration as cache storage. If your cache disk encounters an error, the gateway prevents \
   read and write operations on virtual tapes in the gateway. For example, an error can occur when \
   a disk is corrupted or removed from the gateway. When a cache is reset, the gateway loses its \
   cache storage. At this point, you can reconfigure the disks as cache disks. This operation is \
   only supported in the cached volume and tape types.\n\n\
  \  If the cache disk you are resetting contains data that has not been uploaded to Amazon S3 \
   yet, that data can be lost. After you reset cache disks, there will be no configured cache \
   disks left in the gateway, so you must configure at least one new cache disk for your gateway \
   to function properly.\n\
  \  \n\
  \   "]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_input ->
    ( remove_tags_from_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_input ->
    ( remove_tags_from_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from the specified resource. This operation is supported in storage \
   gateways of all types.\n"]

module RefreshCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    refresh_cache_input ->
    ( refresh_cache_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    refresh_cache_input ->
    ( refresh_cache_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Refreshes the cached inventory of objects for the specified file share. This operation finds \
   objects in the Amazon S3 bucket that were added, removed, or replaced since the gateway last \
   listed the bucket's contents and cached the results. This operation does not import files into \
   the S3 File Gateway cache storage. It only updates the cached inventory to reflect changes in \
   the inventory of the objects in the S3 bucket. This operation is only supported in the S3 File \
   Gateway types.\n\n\
  \ You can subscribe to be notified through an Amazon CloudWatch event when your [RefreshCache] \
   operation completes. For more information, see \
   {{:https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification}Getting \
   notified about file operations} in the {i Amazon S3 File Gateway User Guide}. This operation is \
   Only supported for S3 File Gateways.\n\
  \ \n\
  \  When this API is called, it only initiates the refresh operation. When the API call completes \
   and returns a success code, it doesn't necessarily mean that the file refresh has completed. \
   You should use the refresh-complete notification to determine that the operation has completed \
   before you check for new files on the gateway file share. You can subscribe to be notified \
   through a CloudWatch event when your [RefreshCache] operation completes.\n\
  \  \n\
  \   Throttle limit: This API is asynchronous, so the gateway will accept no more than two \
   refreshes at any time. We recommend using the refresh-complete CloudWatch event notification \
   before issuing additional requests. For more information, see \
   {{:https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification}Getting \
   notified about file operations} in the {i Amazon S3 File Gateway User Guide}.\n\
  \   \n\
  \     {ul\n\
  \           {-  Wait at least 60 seconds between consecutive RefreshCache API requests.\n\
  \               \n\
  \                }\n\
  \           {-  If you invoke the RefreshCache API when two requests are already being \
   processed, any new request will cause an [InvalidGatewayRequestException] error because too \
   many requests were sent to the server.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \     The S3 bucket name does not need to be included when entering the list of folders in the \
   FolderList parameter.\n\
  \     \n\
  \       For more information, see \
   {{:https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification}Getting \
   notified about file operations} in the {i Amazon S3 File Gateway User Guide}.\n\
  \       "]

module NotifyWhenUploaded : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_when_uploaded_input ->
    ( notify_when_uploaded_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_when_uploaded_input ->
    ( notify_when_uploaded_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends you notification through Amazon EventBridge when all files written to your file share \
   have been uploaded to Amazon S3.\n\n\
  \ Storage Gateway can send a notification through Amazon EventBridge when all files written to \
   your file share up to that point in time have been uploaded to Amazon S3. These files include \
   files written to the file share up to the time that you make a request for notification. When \
   the upload is done, Storage Gateway sends you notification through EventBridge. You can \
   configure EventBridge to send the notification through event targets such as Amazon SNS or \
   Lambda function. This operation is only supported for S3 File Gateways.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification}Getting \
   file upload notification} in the {i Amazon S3 File Gateway User Guide}.\n\
  \  "]

module ListVolumes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_volumes_input ->
    ( list_volumes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_volumes_input ->
    ( list_volumes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response \
   includes only the volume ARNs. If you want additional volume information, use the \
   [DescribeStorediSCSIVolumes] or the [DescribeCachediSCSIVolumes] API.\n\n\
  \ The operation supports pagination. By default, the operation returns a maximum of up to 100 \
   volumes. You can optionally specify the [Limit] field in the body to limit the number of \
   volumes in the response. If the number of volumes returned in the response is truncated, the \
   response includes a Marker field. You can use this Marker value in your subsequent request to \
   retrieve the next set of volumes. This operation is only supported in the cached volume and \
   stored volume gateway types.\n\
  \ "]

module ListVolumeRecoveryPoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_volume_recovery_points_input ->
    ( list_volume_recovery_points_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_volume_recovery_points_input ->
    ( list_volume_recovery_points_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the recovery points for a specified gateway. This operation is only supported in the \
   cached volume gateway type.\n\n\
  \ Each cache volume has one recovery point. A volume recovery point is a point in time at which \
   all data of the volume is consistent and from which you can create a snapshot or clone a new \
   cached volume from a source volume. To create a snapshot from a volume recovery point use the \
   [CreateSnapshotFromVolumeRecoveryPoint] operation.\n\
  \ "]

module ListVolumeInitiators : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_volume_initiators_input ->
    ( list_volume_initiators_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_volume_initiators_input ->
    ( list_volume_initiators_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists iSCSI initiators that are connected to a volume. You can use this operation to determine \
   whether a volume is being used or not. This operation is only supported in the cached volume \
   and stored volume gateway types.\n"]

module ListTapes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tapes_input ->
    ( list_tapes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tapes_input ->
    ( list_tapes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You \
   specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you \
   don't specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS.\n\n\
  \ This operation supports pagination. By default, the operation returns a maximum of up to 100 \
   tapes. You can optionally specify the [Limit] parameter in the body to limit the number of \
   tapes in the response. If the number of tapes returned in the response is truncated, the \
   response includes a [Marker] element that you can use in your subsequent request to retrieve \
   the next set of tapes. This operation is only supported in the tape gateway type.\n\
  \ "]

module ListTapePools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tape_pools_input ->
    ( list_tape_pools_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tape_pools_input ->
    ( list_tape_pools_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists custom tape pools. You specify custom tape pools to list by specifying one or more custom \
   tape pool Amazon Resource Names (ARNs). If you don't specify a custom tape pool ARN, the \
   operation lists all custom tape pools.\n\n\
  \ This operation supports pagination. You can optionally specify the [Limit] parameter in the \
   body to limit the number of tape pools in the response. If the number of tape pools returned in \
   the response is truncated, the response includes a [Marker] element that you can use in your \
   subsequent request to retrieve the next set of tape pools.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that have been added to the specified resource. This operation is supported in \
   storage gateways of all types.\n"]

module ListLocalDisks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_local_disks_input ->
    ( list_local_disks_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_local_disks_input ->
    ( list_local_disks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the gateway's local disks. To specify which gateway to describe, you use the \
   Amazon Resource Name (ARN) of the gateway in the body of the request.\n\n\
  \ The request returns a list of all disks, specifying which are configured as working storage, \
   cache storage, or stored volume or not configured at all. The response includes a [DiskStatus] \
   field. This field can have a value of present (the disk is available to use), missing (the disk \
   is no longer connected to the gateway), or mismatch (the disk node is occupied by a disk that \
   has incorrect metadata or the disk content is corrupted).\n\
  \ "]

module ListGateways : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_gateways_input ->
    ( list_gateways_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_gateways_input ->
    ( list_gateways_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists gateways owned by an Amazon Web Services account in an Amazon Web Services Region \
   specified in the request. The returned list is ordered by gateway Amazon Resource Name (ARN).\n\n\
  \ By default, the operation returns a maximum of 100 gateways. This operation supports \
   pagination that allows you to optionally reduce the number of gateways returned in a response.\n\
  \ \n\
  \  If you have more gateways than are returned in a response (that is, the response returns only \
   a truncated list of your gateways), the response contains a marker that you can specify in your \
   next request to fetch the next page of gateways.\n\
  \  "]

module ListFileSystemAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_file_system_associations_input ->
    ( list_file_system_associations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_file_system_associations_input ->
    ( list_file_system_associations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of [FileSystemAssociationSummary] objects. Each object contains a summary of a file \
   system association. This operation is only supported for FSx File Gateways.\n"]

module ListFileShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_file_shares_input ->
    ( list_file_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_file_shares_input ->
    ( list_file_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the file shares for a specific S3 File Gateway, or the list of file shares that \
   belong to the calling Amazon Web Services account. This operation is only supported for S3 File \
   Gateways.\n"]

module ListCacheReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cache_reports_input ->
    ( list_cache_reports_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cache_reports_input ->
    ( list_cache_reports_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of existing cache reports for all file shares associated with your Amazon Web \
   Services account. This list includes all information provided by the [DescribeCacheReport] \
   action, such as report name, status, completion progress, start time, end time, filters, and \
   tags.\n"]

module ListAutomaticTapeCreationPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automatic_tape_creation_policies_input ->
    ( list_automatic_tape_creation_policies_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automatic_tape_creation_policies_input ->
    ( list_automatic_tape_creation_policies_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the automatic tape creation policies for a gateway. If there are no automatic tape \
   creation policies for the gateway, it returns an empty list.\n\n\
  \ This operation is only supported for tape gateways.\n\
  \ "]

module JoinDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    join_domain_input ->
    ( join_domain_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    join_domain_input ->
    ( join_domain_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a file gateway to an Active Directory domain. This operation is only supported for file \
   gateways that support the SMB file protocol.\n\n\
  \  Joining a domain creates an Active Directory computer account in the default organizational \
   unit, using the gateway's {b Gateway ID} as the account name (for example, SGW-1234ADE). If \
   your Active Directory environment requires that you pre-stage accounts to facilitate the join \
   domain process, you will need to create this account ahead of time.\n\
  \  \n\
  \   To create the gateway's computer account in an organizational unit other than the default, \
   you must specify the organizational unit when joining the domain.\n\
  \   \n\
  \    "]

module EvictFilesFailingUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    evict_files_failing_upload_input ->
    ( evict_files_failing_upload_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    evict_files_failing_upload_input ->
    ( evict_files_failing_upload_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a process that cleans the specified file share's cache of file entries that are failing \
   upload to Amazon S3. This API operation reports success if the request is received with valid \
   arguments, and there are no other cache clean operations currently in-progress for the \
   specified file share. After a successful request, the cache clean operation occurs \
   asynchronously and reports progress using CloudWatch logs and notifications.\n\n\
  \  If [ForceRemove] is set to [True], the cache clean operation will delete file data from the \
   gateway which might otherwise be recoverable. We recommend using this operation only after all \
   other methods to clear files failing upload have been exhausted, and if your business need \
   outweighs the potential data loss.\n\
  \  \n\
  \   "]

module DisassociateFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_file_system_input ->
    ( disassociate_file_system_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_file_system_input ->
    ( disassociate_file_system_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates an Amazon FSx file system from the specified gateway. After the disassociation \
   process finishes, the gateway can no longer access the Amazon FSx file system. This operation \
   is only supported in the FSx File Gateway type.\n"]

module DisableGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_gateway_input ->
    ( disable_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_gateway_input ->
    ( disable_gateway_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway \
   VM is damaged, you can disable the gateway so you can recover virtual tapes.\n\n\
  \ Use this operation for a tape gateway that is not reachable or not functioning. This operation \
   is only supported in the tape gateway type.\n\
  \ \n\
  \   After a gateway is disabled, it cannot be enabled.\n\
  \   \n\
  \    "]

module DetachVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_volume_input ->
    ( detach_volume_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_volume_input ->
    ( detach_volume_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disconnects a volume from an iSCSI connection and then detaches the volume from the specified \
   gateway. Detaching and attaching a volume enables you to recover your data from one gateway to \
   a different gateway without creating a snapshot. It also makes it easier to move your volumes \
   from an on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is \
   only supported in the volume gateway type.\n"]

module DescribeWorkingStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_working_storage_input ->
    ( describe_working_storage_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_working_storage_input ->
    ( describe_working_storage_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the working storage of a gateway. This operation is only supported in \
   the stored volumes gateway type. This operation is deprecated in cached volumes API version \
   (20120630). Use DescribeUploadBuffer instead.\n\n\
  \  Working storage is also referred to as upload buffer. You can also use the \
   DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.\n\
  \  \n\
  \    The response includes disk IDs that are configured as working storage, and it includes the \
   amount of working storage allocated and used.\n\
  \    "]

module DescribeVTLDevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vtl_devices_input ->
    ( describe_vtl_devices_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_vtl_devices_input ->
    ( describe_vtl_devices_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In \
   the response, Storage Gateway returns VTL device information.\n\n\
  \ This operation is only supported in the tape gateway type.\n\
  \ "]

module DescribeUploadBuffer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_upload_buffer_input ->
    ( describe_upload_buffer_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_upload_buffer_input ->
    ( describe_upload_buffer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the upload buffer of a gateway. This operation is supported for the \
   stored volume, cached volume, and tape gateway types.\n\n\
  \ The response includes disk IDs that are configured as upload buffer space, and it includes the \
   amount of upload buffer space allocated and used.\n\
  \ "]

module DescribeTapes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tapes_input ->
    ( describe_tapes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tapes_input ->
    ( describe_tapes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of virtual tapes that correspond to the specified Amazon Resource Names \
   (ARNs). If [TapeARN] is not specified, returns a description of the virtual tapes associated \
   with the specified gateway. This operation is only supported for the tape gateway type.\n\n\
  \ The operation supports pagination. By default, the operation returns a maximum of up to 100 \
   tapes. You can optionally specify the [Limit] field in the body to limit the number of tapes in \
   the response. If the number of tapes returned in the response is truncated, the response \
   includes a [Marker] field. You can use this [Marker] value in your subsequent request to \
   retrieve the next set of tapes.\n\
  \ "]

module DescribeTapeRecoveryPoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tape_recovery_points_input ->
    ( describe_tape_recovery_points_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tape_recovery_points_input ->
    ( describe_tape_recovery_points_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of virtual tape recovery points that are available for the specified tape \
   gateway.\n\n\
  \ A recovery point is a point-in-time view of a virtual tape at which all the data on the \
   virtual tape is consistent. If your gateway crashes, virtual tapes that have recovery points \
   can be recovered to a new gateway. This operation is only supported in the tape gateway type.\n\
  \ "]

module DescribeTapeArchives : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tape_archives_input ->
    ( describe_tape_archives_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tape_archives_input ->
    ( describe_tape_archives_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This \
   operation is only supported in the tape gateway type.\n\n\
  \ If a specific [TapeARN] is not specified, Storage Gateway returns a description of all virtual \
   tapes found in the VTS associated with your account.\n\
  \ "]

module DescribeStorediSCSIVolumes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_storedi_scsi_volumes_input ->
    ( describe_storedi_scsi_volumes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_storedi_scsi_volumes_input ->
    ( describe_storedi_scsi_volumes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of the gateway volumes specified in the request. The list of gateway \
   volumes in the request must be from one gateway. In the response, Storage Gateway returns \
   volume information sorted by volume ARNs. This operation is only supported in stored volume \
   gateway type.\n"]

module DescribeSnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshot_schedule_input ->
    ( describe_snapshot_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshot_schedule_input ->
    ( describe_snapshot_schedule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the snapshot schedule for the specified gateway volume. The snapshot schedule \
   information includes intervals at which snapshots are automatically initiated on the volume. \
   This operation is only supported in the cached volume and stored volume types.\n"]

module DescribeSMBSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_smb_settings_input ->
    ( describe_smb_settings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_smb_settings_input ->
    ( describe_smb_settings_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a description of a Server Message Block (SMB) file share settings from a file gateway. \
   This operation is only supported for file gateways.\n"]

module DescribeSMBFileShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_smb_file_shares_input ->
    ( describe_smb_file_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_smb_file_shares_input ->
    ( describe_smb_file_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a description for one or more Server Message Block (SMB) file shares from a S3 File \
   Gateway. This operation is only supported for S3 File Gateways.\n"]

module DescribeNFSFileShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_nfs_file_shares_input ->
    ( describe_nfs_file_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_nfs_file_shares_input ->
    ( describe_nfs_file_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a description for one or more Network File System (NFS) file shares from an S3 File \
   Gateway. This operation is only supported for S3 File Gateways.\n"]

module DescribeMaintenanceStartTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_start_time_input ->
    ( describe_maintenance_start_time_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_start_time_input ->
    ( describe_maintenance_start_time_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns your gateway's maintenance window schedule information, with values for monthly or \
   weekly cadence, specific day and time to begin maintenance, and which types of updates to \
   apply. Time values returned are for the gateway's time zone.\n"]

module DescribeGatewayInformation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_gateway_information_input ->
    ( describe_gateway_information_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_gateway_information_input ->
    ( describe_gateway_information_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns metadata about a gateway such as its name, network interfaces, time zone, status, and \
   software version. To specify which gateway to describe, use the Amazon Resource Name (ARN) of \
   the gateway in your request.\n"]

module DescribeFileSystemAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_system_associations_input ->
    ( describe_file_system_associations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_system_associations_input ->
    ( describe_file_system_associations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the file system association information. This operation is only supported for FSx File \
   Gateways.\n"]

module DescribeChapCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_chap_credentials_input ->
    ( describe_chap_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_chap_credentials_input ->
    ( describe_chap_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information \
   for a specified iSCSI target, one for each target-initiator pair. This operation is supported \
   in the volume and tape gateway types.\n"]

module DescribeCachediSCSIVolumes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cachedi_scsi_volumes_input ->
    ( describe_cachedi_scsi_volumes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cachedi_scsi_volumes_input ->
    ( describe_cachedi_scsi_volumes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of the gateway volumes specified in the request. This operation is only \
   supported in the cached volume gateway types.\n\n\
  \ The list of gateway volumes in the request must be from one gateway. In the response, Storage \
   Gateway returns volume information sorted by volume Amazon Resource Name (ARN).\n\
  \ "]

module DescribeCacheReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_report_input ->
    ( describe_cache_report_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_report_input ->
    ( describe_cache_report_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the specified cache report, including completion status and \
   generation progress.\n"]

module DescribeCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_input ->
    ( describe_cache_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_input ->
    ( describe_cache_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the cache of a gateway. This operation is only supported in the \
   cached volume, tape, and file gateway types.\n\n\
  \ The response includes disk IDs that are configured as cache, and it includes the amount of \
   cache allocated and used.\n\
  \ "]

module DescribeBandwidthRateLimitSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_bandwidth_rate_limit_schedule_input ->
    ( describe_bandwidth_rate_limit_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_bandwidth_rate_limit_schedule_input ->
    ( describe_bandwidth_rate_limit_schedule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns information about the bandwidth rate limit schedule of a gateway. By default, gateways \
   do not have bandwidth rate limit schedules, which means no bandwidth rate limiting is in \
   effect. This operation is supported only for volume, tape and S3 file gateways. FSx file \
   gateways do not support bandwidth rate limits.\n\n\
  \ This operation returns information about a gateway's bandwidth rate limit schedule. A \
   bandwidth rate limit schedule consists of one or more bandwidth rate limit intervals. A \
   bandwidth rate limit interval defines a period of time on one or more days of the week, during \
   which bandwidth rate limits are specified for uploading, downloading, or both. \n\
  \ \n\
  \   A bandwidth rate limit interval consists of one or more days of the week, a start hour and \
   minute, an ending hour and minute, and bandwidth rate limits for uploading and downloading \n\
  \  \n\
  \    If no bandwidth rate limit schedule intervals are set for the gateway, this operation \
   returns an empty response. To specify which gateway to describe, use the Amazon Resource Name \
   (ARN) of the gateway in your request.\n\
  \   "]

module DescribeBandwidthRateLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_bandwidth_rate_limit_input ->
    ( describe_bandwidth_rate_limit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_bandwidth_rate_limit_input ->
    ( describe_bandwidth_rate_limit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which \
   means no bandwidth rate limiting is in effect. This operation is supported only for the stored \
   volume, cached volume, and tape gateway types. To describe bandwidth rate limits for S3 file \
   gateways, use [DescribeBandwidthRateLimitSchedule].\n\n\
  \ This operation returns a value for a bandwidth rate limit only if the limit is set. If no \
   limits are set for the gateway, then this operation returns only the gateway ARN in the \
   response body. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the \
   gateway in your request.\n\
  \ "]

module DescribeAvailabilityMonitorTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_availability_monitor_test_input ->
    ( describe_availability_monitor_test_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_availability_monitor_test_input ->
    ( describe_availability_monitor_test_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the most recent high availability monitoring test that was performed \
   on the host in a cluster. If a test isn't performed, the status and start time in the response \
   would be null.\n"]

module DeleteVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_volume_input ->
    ( delete_volume_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_volume_input ->
    ( delete_volume_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified storage volume that you previously created using the \
   [CreateCachediSCSIVolume] or [CreateStorediSCSIVolume] API. This operation is only supported in \
   the cached volume and stored volume types. For stored volume gateways, the local disk that was \
   configured as the storage volume is not deleted. You can reuse the local disk to create another \
   storage volume.\n\n\
  \ Before you delete a volume, make sure there are no iSCSI connections to the volume you are \
   deleting. You should also make sure there is no snapshot in progress. You can use the Amazon \
   Elastic Compute Cloud (Amazon EC2) API to query snapshots on the volume you are deleting and \
   check the snapshot status. For more information, go to \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html}DescribeSnapshots} \
   in the {i Amazon Elastic Compute Cloud API Reference}.\n\
  \ \n\
  \  In the request, you must provide the Amazon Resource Name (ARN) of the storage volume you \
   want to delete.\n\
  \  "]

module DeleteTapePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tape_pool_input ->
    ( delete_tape_pool_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tape_pool_input ->
    ( delete_tape_pool_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete a custom tape pool. A custom tape pool can only be deleted if there are no tapes in the \
   pool and if there are no automatic tape creation policies that reference the custom tape pool.\n"]

module DeleteTapeArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tape_archive_input ->
    ( delete_tape_archive_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tape_archive_input ->
    ( delete_tape_archive_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only \
   supported in the tape gateway type.\n"]

module DeleteTape : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tape_input ->
    ( delete_tape_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tape_input ->
    ( delete_tape_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified virtual tape. This operation is only supported in the tape gateway type.\n"]

module DeleteSnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_schedule_input ->
    ( delete_snapshot_schedule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_schedule_input ->
    ( delete_snapshot_schedule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a snapshot of a volume.\n\n\
  \ You can take snapshots of your gateway volumes on a scheduled or ad hoc basis. This API action \
   enables you to delete a snapshot schedule for a volume. For more information, see \
   {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/backing-up-volumes.html}Backing \
   up your volumes}. In the [DeleteSnapshotSchedule] request, you identify the volume by providing \
   its Amazon Resource Name (ARN). This operation is only supported for cached volume gateway \
   types.\n\
  \ \n\
  \   To list or delete a snapshot, you must use the Amazon EC2 API. For more information, go to \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html}DescribeSnapshots} \
   in the {i Amazon Elastic Compute Cloud API Reference}.\n\
  \   \n\
  \    "]

module DeleteGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_gateway_input ->
    ( delete_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_gateway_input ->
    ( delete_gateway_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of \
   the gateway in your request. The operation deletes the gateway; however, it does not delete the \
   gateway virtual machine (VM) from your host computer.\n\n\
  \ After you delete a gateway, you cannot reactivate it. Completed snapshots of the gateway \
   volumes are not deleted upon deleting the gateway, however, pending snapshots will not \
   complete. After you delete a gateway, your next step is to remove it from your environment.\n\
  \ \n\
  \   You no longer pay software charges after the gateway is deleted; however, your existing \
   Amazon EBS snapshots persist and you will continue to be billed for these snapshots.\194\160You \
   can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 \
   subscription.\194\160 If you prefer not to cancel your Amazon EC2 subscription, you can delete \
   your snapshots using the Amazon EC2 console. For more information, see the \
   {{:http://aws.amazon.com/storagegateway}Storage Gateway detail page}.\n\
  \   \n\
  \    "]

module DeleteFileShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_file_share_input ->
    ( delete_file_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_file_share_input ->
    ( delete_file_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a file share from an S3 File Gateway. This operation is only supported for S3 File \
   Gateways.\n"]

module DeleteChapCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_chap_credentials_input ->
    ( delete_chap_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_chap_credentials_input ->
    ( delete_chap_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI \
   target and initiator pair. This operation is supported in volume and tape gateway types.\n"]

module DeleteCacheReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_report_input ->
    ( delete_cache_report_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_report_input ->
    ( delete_cache_report_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified cache report and any associated tags from the Storage Gateway database. \
   You can only delete completed reports. If the status of the report you attempt to delete still \
   IN-PROGRESS, the delete operation returns an error. You can use [CancelCacheReport] to cancel \
   an IN-PROGRESS report.\n\n\
  \   [DeleteCacheReport] does not delete the report object from your Amazon S3 bucket.\n\
  \  \n\
  \   "]

module DeleteBandwidthRateLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_bandwidth_rate_limit_input ->
    ( delete_bandwidth_rate_limit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_bandwidth_rate_limit_input ->
    ( delete_bandwidth_rate_limit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download \
   bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other \
   limit remains unchanged. To specify which gateway to work with, use the Amazon Resource Name \
   (ARN) of the gateway in your request. This operation is supported only for the stored volume, \
   cached volume, and tape gateway types.\n"]

module DeleteAutomaticTapeCreationPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_automatic_tape_creation_policy_input ->
    ( delete_automatic_tape_creation_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_automatic_tape_creation_policy_input ->
    ( delete_automatic_tape_creation_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the automatic tape creation policy of a gateway. If you delete this policy, new virtual \
   tapes must be created manually. Use the Amazon Resource Name (ARN) of the gateway in your \
   request to remove the policy.\n"]

module CreateTapes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tapes_input ->
    ( create_tapes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tapes_input ->
    ( create_tapes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates one or more virtual tapes. You write data to the virtual tapes and then archive the \
   tapes. This operation is only supported in the tape gateway type.\n\n\
  \  Cache storage must be allocated to the gateway before you can create virtual tapes. Use the \
   [AddCache] operation to add cache storage to a gateway.\n\
  \  \n\
  \   "]

module CreateTapeWithBarcode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tape_with_barcode_input ->
    ( create_tape_with_barcode_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tape_with_barcode_input ->
    ( create_tape_with_barcode_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a virtual tape by using your own barcode. You write data to the virtual tape and then \
   archive the tape. A barcode is unique and cannot be reused if it has already been used on a \
   tape. This applies to barcodes used on deleted tapes. This operation is only supported in the \
   tape gateway type.\n\n\
  \  Cache storage must be allocated to the gateway before you can create a virtual tape. Use the \
   [AddCache] operation to add cache storage to a gateway.\n\
  \  \n\
  \   "]

module CreateTapePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tape_pool_input ->
    ( create_tape_pool_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tape_pool_input ->
    ( create_tape_pool_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new custom tape pool. You can use custom tape pool to enable tape retention lock on \
   tapes that are archived in the custom pool.\n"]

module CreateStorediSCSIVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_storedi_scsi_volume_input ->
    ( create_storedi_scsi_volume_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_storedi_scsi_volume_input ->
    ( create_storedi_scsi_volume_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a volume on a specified gateway. This operation is only supported in the stored volume \
   gateway type.\n\n\
  \ The size of the volume to create is inferred from the disk size. You can choose to preserve \
   existing data on the disk, create volume from an existing snapshot, or create an empty volume. \
   If you choose to create an empty gateway volume, then any existing data on the disk is erased.\n\
  \ \n\
  \  In the request, you must specify the gateway and the disk information on which you are \
   creating the volume. In response, the gateway creates the volume and returns volume information \
   such as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that \
   initiators can use to connect to the volume target.\n\
  \  "]

module CreateSnapshotFromVolumeRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception
    | `ServiceUnavailableError of service_unavailable_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_from_volume_recovery_point_input ->
    ( create_snapshot_from_volume_recovery_point_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception
      | `ServiceUnavailableError of service_unavailable_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_from_volume_recovery_point_input ->
    ( create_snapshot_from_volume_recovery_point_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception
      | `ServiceUnavailableError of service_unavailable_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a snapshot of a gateway from a volume recovery point. This operation is only \
   supported in the cached volume gateway type.\n\n\
  \ A volume recovery point is a point in time at which all data of the volume is consistent and \
   from which you can create a snapshot. To get a list of volume recovery point for cached volume \
   gateway, use [ListVolumeRecoveryPoints].\n\
  \ \n\
  \  In the [CreateSnapshotFromVolumeRecoveryPoint] request, you identify the volume by providing \
   its Amazon Resource Name (ARN). You must also provide a description for the snapshot. When the \
   gateway takes a snapshot of the specified volume, the snapshot and its description appear in \
   the Storage Gateway console. In response, the gateway returns you a snapshot ID. You can use \
   this snapshot ID to check the snapshot progress or later use it when you want to create a \
   volume from a snapshot.\n\
  \  \n\
  \    To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html}DescribeSnapshots} \
   or \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html}DeleteSnapshot} \
   in the {i Amazon Elastic Compute Cloud API Reference}.\n\
  \    \n\
  \     "]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception
    | `ServiceUnavailableError of service_unavailable_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_input ->
    ( create_snapshot_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception
      | `ServiceUnavailableError of service_unavailable_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_input ->
    ( create_snapshot_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception
      | `ServiceUnavailableError of service_unavailable_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a snapshot of a volume.\n\n\
  \ Storage Gateway provides the ability to back up point-in-time snapshots of your data to Amazon \
   Simple Storage (Amazon S3) for durable off-site recovery, and also import the data to an Amazon \
   Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots \
   of your gateway volume on a scheduled or ad hoc basis. This API enables you to take an ad hoc \
   snapshot. For more information, see \
   {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot}Editing \
   a snapshot schedule}.\n\
  \ \n\
  \  In the [CreateSnapshot] request, you identify the volume by providing its Amazon Resource \
   Name (ARN). You must also provide description for the snapshot. When Storage Gateway takes the \
   snapshot of specified volume, the snapshot and description appears in the Storage Gateway \
   console. In response, Storage Gateway returns you a snapshot ID. You can use this snapshot ID \
   to check the snapshot progress or later use it when you want to create a volume from a \
   snapshot. This operation is only supported in stored and cached volume gateway type.\n\
  \  \n\
  \    To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html}DescribeSnapshots} \
   or \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html}DeleteSnapshot} \
   in the {i Amazon Elastic Compute Cloud API Reference}.\n\
  \    \n\
  \       Volume and snapshot IDs are changing to a longer length ID format. For more information, \
   see the important note on the \
   {{:https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html}Welcome} page.\n\
  \       \n\
  \        "]

module CreateSMBFileShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_smb_file_share_input ->
    ( create_smb_file_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_smb_file_share_input ->
    ( create_smb_file_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Server Message Block (SMB) file share on an existing S3 File Gateway. In Storage \
   Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage \
   Gateway exposes file shares using an SMB interface. This operation is only supported for S3 \
   File Gateways.\n\n\
  \  S3 File Gateways require Security Token Service (Amazon Web Services STS) to be activated to \
   enable you to create a file share. Make sure that Amazon Web Services STS is activated in the \
   Amazon Web Services Region you are creating your S3 File Gateway in. If Amazon Web Services STS \
   is not activated in this Amazon Web Services Region, activate it. For information about how to \
   activate Amazon Web Services STS, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html}Activating \
   and deactivating Amazon Web Services STS in an Amazon Web Services Region} in the {i Identity \
   and Access Management User Guide}.\n\
  \  \n\
  \   File gateways don't support creating hard or symbolic links on a file share.\n\
  \   \n\
  \    "]

module CreateNFSFileShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_nfs_file_share_input ->
    ( create_nfs_file_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_nfs_file_share_input ->
    ( create_nfs_file_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Network File System (NFS) file share on an existing S3 File Gateway. In Storage \
   Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage \
   Gateway exposes file shares using an NFS interface. This operation is only supported for S3 \
   File Gateways.\n\n\
  \  S3 File gateway requires Security Token Service (Amazon Web Services STS) to be activated to \
   enable you to create a file share. Make sure Amazon Web Services STS is activated in the Amazon \
   Web Services Region you are creating your S3 File Gateway in. If Amazon Web Services STS is not \
   activated in the Amazon Web Services Region, activate it. For information about how to activate \
   Amazon Web Services STS, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html}Activating \
   and deactivating Amazon Web Services STS in an Amazon Web Services Region} in the {i Identity \
   and Access Management User Guide}.\n\
  \  \n\
  \   S3 File Gateways do not support creating hard or symbolic links on a file share.\n\
  \   \n\
  \    "]

module CreateCachediSCSIVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cachedi_scsi_volume_input ->
    ( create_cachedi_scsi_volume_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cachedi_scsi_volume_input ->
    ( create_cachedi_scsi_volume_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a cached volume on a specified cached volume gateway. This operation is only supported \
   in the cached volume gateway type.\n\n\
  \  Cache storage must be allocated to the gateway before you can create a cached volume. Use the \
   [AddCache] operation to add cache storage to a gateway.\n\
  \  \n\
  \    In the request, you must specify the gateway, size of the volume in bytes, the iSCSI target \
   name, an IP address on which to expose the target, and a unique client token. In response, the \
   gateway creates the volume and returns information about it. This information includes the \
   volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use \
   to connect to the volume target.\n\
  \    \n\
  \     Optionally, you can provide the ARN for an existing volume as the [SourceVolumeARN] for \
   this cached volume, which creates an exact copy of the existing volume\226\128\153s latest \
   recovery point. The [VolumeSizeInBytes] value must be equal to or larger than the size of the \
   copied volume, in bytes.\n\
  \     "]

module CancelRetrieval : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_retrieval_input ->
    ( cancel_retrieval_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_retrieval_input ->
    ( cancel_retrieval_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the \
   retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only \
   supported in the tape gateway type.\n"]

module CancelCacheReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_cache_report_input ->
    ( cancel_cache_report_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_cache_report_input ->
    ( cancel_cache_report_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels generation of a specified cache report. You can use this operation to manually cancel \
   an IN-PROGRESS report for any reason. This action changes the report status from IN-PROGRESS to \
   CANCELLED. You can only cancel in-progress reports. If the the report you attempt to cancel is \
   in FAILED, ERROR, or COMPLETED state, the cancel operation returns an error.\n"]

module CancelArchival : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_archival_input ->
    ( cancel_archival_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_archival_input ->
    ( cancel_archival_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process \
   is initiated. This operation is only supported in the tape gateway type.\n"]

module AttachVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_volume_input ->
    ( attach_volume_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_volume_input ->
    ( attach_volume_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway. \
   Detaching and attaching a volume enables you to recover your data from one gateway to a \
   different gateway without creating a snapshot. It also makes it easier to move your volumes \
   from an on-premises gateway to a gateway hosted on an Amazon EC2 instance.\n"]

module AssociateFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_file_system_input ->
    ( associate_file_system_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_file_system_input ->
    ( associate_file_system_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associate an Amazon FSx file system with the FSx File Gateway. After the association process is \
   complete, the file shares on the Amazon FSx file system are available for access through the \
   gateway. This operation only supports the FSx File Gateway type.\n"]

module AssignTapePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    assign_tape_pool_input ->
    ( assign_tape_pool_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    assign_tape_pool_input ->
    ( assign_tape_pool_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3 \
   storage class that is associated with the pool. When you use your backup application to eject \
   the tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3 Glacier \
   Deep Archive) that corresponds to the pool.\n"]

module AddWorkingStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_working_storage_input ->
    ( add_working_storage_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_working_storage_input ->
    ( add_working_storage_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures one or more gateway local disks as working storage for a gateway. This operation is \
   only supported in the stored volume gateway type. This operation is deprecated in cached volume \
   API version 20120630. Use [AddUploadBuffer] instead.\n\n\
  \  Working storage is also referred to as upload buffer. You can also use the [AddUploadBuffer] \
   operation to add upload buffer to a stored volume gateway.\n\
  \  \n\
  \    In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add \
   working storage, and one or more disk IDs that you want to configure as working storage.\n\
  \    "]

module AddUploadBuffer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_upload_buffer_input ->
    ( add_upload_buffer_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_upload_buffer_input ->
    ( add_upload_buffer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures one or more gateway local disks as upload buffer for a specified gateway. This \
   operation is supported for the stored volume, cached volume, and tape gateway types.\n\n\
  \ In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add \
   upload buffer, and one or more disk IDs that you want to configure as upload buffer.\n\
  \ "]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_input ->
    ( add_tags_to_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_input ->
    ( add_tags_to_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to the specified resource. You use tags to add metadata to resources, \
   which you can use to categorize these resources. For example, you can categorize resources by \
   purpose, owner, environment, or team. Each tag consists of a key and a value, which you define. \
   You can add tags to the following Storage Gateway resources:\n\n\
  \ {ul\n\
  \       {-  Storage gateways of all types\n\
  \           \n\
  \            }\n\
  \       {-  Storage volumes\n\
  \           \n\
  \            }\n\
  \       {-  Virtual tapes\n\
  \           \n\
  \            }\n\
  \       {-  NFS and SMB file shares\n\
  \           \n\
  \            }\n\
  \       {-  File System associations\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   You can create a maximum of 50 tags for each resource. Virtual tapes and storage volumes \
   that are recovered to a new gateway maintain their tags.\n\
  \   "]

module AddCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_cache_input ->
    ( add_cache_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_cache_input ->
    ( add_cache_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures one or more gateway local disks as cache for a gateway. This operation is only \
   supported in the cached volume, tape, and file gateway type (see \
   {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html}How \
   Storage Gateway works (architecture)}.\n\n\
  \ In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add \
   cache, and one or more disk IDs that you want to configure as cache.\n\
  \ "]

module ActivateGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidGatewayRequestException of invalid_gateway_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    activate_gateway_input ->
    ( activate_gateway_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    activate_gateway_input ->
    ( activate_gateway_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidGatewayRequestException of invalid_gateway_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activates the gateway you previously deployed on your host. In the activation process, you \
   specify information such as the Amazon Web Services Region that you want to use for storing \
   snapshots or tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, \
   an activation key, and a name for your gateway. The activation process also associates your \
   gateway with your account. For more information, see [UpdateGatewayInformation].\n\n\
  \  You must turn on the gateway VM before you can activate your gateway.\n\
  \  \n\
  \   "]
